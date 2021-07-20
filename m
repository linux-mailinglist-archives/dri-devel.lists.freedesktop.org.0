Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDF33CF7AF
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 12:20:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02B1189FDD;
	Tue, 20 Jul 2021 10:20:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.180])
 by gabe.freedesktop.org (Postfix) with ESMTP id 29E7089FC9
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 10:20:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id D1A4620201E;
 Tue, 20 Jul 2021 12:20:44 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id OCS8MDNA7x9a; Tue, 20 Jul 2021 12:20:44 +0200 (CEST)
Received: from thor (24.99.2.85.dynamic.wline.res.cust.swisscom.ch
 [85.2.99.24])
 by netline-mail3.netline.ch (Postfix) with ESMTPA id 50A4820201D;
 Tue, 20 Jul 2021 12:20:44 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.94.2)
 (envelope-from <michel@daenzer.net>)
 id 1m5mrj-000d4g-57; Tue, 20 Jul 2021 12:20:43 +0200
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <20210709120756.205856-1-christian.koenig@amd.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Subject: Re: [PATCH] dma-buf: fix and rework dma_buf_poll v6
Message-ID: <d2e9c946-f7ff-33ab-a30e-fd8b89ed74aa@daenzer.net>
Date: Tue, 20 Jul 2021 12:20:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210709120756.205856-1-christian.koenig@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-CA
Content-Transfer-Encoding: 8bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-07-09 2:07 p.m., Christian König wrote:
> Daniel pointed me towards this function and there are multiple obvious problems
> in the implementation.
> 
> First of all the retry loop is not working as intended. In general the retry
> makes only sense if you grab the reference first and then check the sequence
> values.
> 
> Then we should always also wait for the exclusive fence.
> 
> It's also good practice to keep the reference around when installing callbacks
> to fences you don't own.
> 
> And last the whole implementation was unnecessary complex and rather hard to
> understand which could lead to probably unexpected behavior of the IOCTL.
> 
> Fix all this by reworking the implementation from scratch. Dropping the
> whole RCU approach and taking the lock instead.
> 
> Only mildly tested and needs a thoughtful review of the code.
> 
> v2: fix the reference counting as well
> v3: keep the excl fence handling as is for stable
> v4: back to testing all fences, drop RCU
> v5: handle in and out separately
> v6: add missing clear of events
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> CC: stable@vger.kernel.org
> ---
>  drivers/dma-buf/dma-buf.c | 156 +++++++++++++++++---------------------
>  include/linux/dma-buf.h   |   2 +-
>  2 files changed, 72 insertions(+), 86 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index eadd1eaa2fb5..39e1ef872829 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
[...]
>  
>  static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
>  {
>  	struct dma_buf *dmabuf;
>  	struct dma_resv *resv;
> -	struct dma_resv_list *fobj;
> -	struct dma_fence *fence_excl;
> +	unsigned shared_count;
>  	__poll_t events;
> -	unsigned shared_count, seq;
> +	int r, i;

shared_count, r & i are unused with this patch.



> +		if (events & EPOLLOUT && !dma_buf_poll_shared(resv, dcb) &&
> +		    !dma_buf_poll_excl(resv, dcb))
> +			/* No callback queued, wake up any other waiters */
> +			dma_buf_poll_cb(NULL, &dcb->cb);
> +		else
> +			events &= ~EPOLLOUT;

Something like this might be clearer:

		if (events & EPOLLOUT) {
			if (!dma_buf_poll_shared(resv, dcb) &&
			    !dma_buf_poll_excl(resv, dcb))
				/* No callback queued, wake up any other waiters */
				dma_buf_poll_cb(NULL, &dcb->cb);
			else
				events &= ~EPOLLOUT;
		}


> +		if (events & EPOLLIN && !dma_buf_poll_excl(resv, dcb))
> +			/* No callback queued, wake up any other waiters */
>  			dma_buf_poll_cb(NULL, &dcb->cb);
> +		else
> +			events &= ~EPOLLIN;

Similarly:

		if (events & EPOLLIN) {
			if (!dma_buf_poll_excl(resv, dcb))
				/* No callback queued, wake up any other waiters */
				dma_buf_poll_cb(NULL, &dcb->cb);
			else
				events &= ~EPOLLIN;
		}


Other than that, looks good to me, can't say anything about the locking though.


Haven't been able to test this yet, hopefully later this week.


-- 
Earthling Michel Dänzer               |               https://redhat.com
Libre software enthusiast             |             Mesa and X developer
