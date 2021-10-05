Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A40E421F99
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 09:44:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D33E6EB39;
	Tue,  5 Oct 2021 07:44:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0E3C6EB16;
 Tue,  5 Oct 2021 07:44:35 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10127"; a="223093687"
X-IronPort-AV: E=Sophos;i="5.85,348,1624345200"; d="scan'208";a="223093687"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2021 00:44:35 -0700
X-IronPort-AV: E=Sophos;i="5.85,348,1624345200"; d="scan'208";a="487920385"
Received: from tbarret1-mobl.ger.corp.intel.com (HELO [10.213.238.194])
 ([10.213.238.194])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2021 00:44:32 -0700
Subject: Re: [PATCH 09/28] dma-buf: use the new iterator in dma_resv_poll
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch
References: <20211001100610.2899-1-christian.koenig@amd.com>
 <20211001100610.2899-10-christian.koenig@amd.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <ef650439-a418-979b-56fb-4cf10f91747e@linux.intel.com>
Date: Tue, 5 Oct 2021 08:44:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211001100610.2899-10-christian.koenig@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 01/10/2021 11:05, Christian König wrote:
> Simplify the code a bit.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/dma-buf/dma-buf.c | 36 ++++++------------------------------
>   1 file changed, 6 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 8242b5d9baeb..beb504a92d60 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -209,19 +209,14 @@ static void dma_buf_poll_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
>   	dma_fence_put(fence);
>   }
>   
> -static bool dma_buf_poll_shared(struct dma_resv *resv,
> +static bool dma_buf_poll_add_cb(struct dma_resv *resv, bool write,
>   				struct dma_buf_poll_cb_t *dcb)
>   {
> -	struct dma_resv_list *fobj = dma_resv_shared_list(resv);
> +	struct dma_resv_iter cursor;
>   	struct dma_fence *fence;
> -	int i, r;
> -
> -	if (!fobj)
> -		return false;
> +	int r;
>   
> -	for (i = 0; i < fobj->shared_count; ++i) {
> -		fence = rcu_dereference_protected(fobj->shared[i],
> -						  dma_resv_held(resv));
> +	dma_resv_for_each_fence(&cursor, resv, write, fence) {
>   		dma_fence_get(fence);
>   		r = dma_fence_add_callback(fence, &dcb->cb, dma_buf_poll_cb);
>   		if (!r)

It is unchanged with this patch, but are the semantics supposed to be 
like this? Signal poll event if _any_ of the shared fences has been 
signaled?

Regards,

Tvrtko

> @@ -232,24 +227,6 @@ static bool dma_buf_poll_shared(struct dma_resv *resv,
>   	return false;
>   }
>   
> -static bool dma_buf_poll_excl(struct dma_resv *resv,
> -			      struct dma_buf_poll_cb_t *dcb)
> -{
> -	struct dma_fence *fence = dma_resv_excl_fence(resv);
> -	int r;
> -
> -	if (!fence)
> -		return false;
> -
> -	dma_fence_get(fence);
> -	r = dma_fence_add_callback(fence, &dcb->cb, dma_buf_poll_cb);
> -	if (!r)
> -		return true;
> -	dma_fence_put(fence);
> -
> -	return false;
> -}
> -
>   static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
>   {
>   	struct dma_buf *dmabuf;
> @@ -282,8 +259,7 @@ static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
>   		spin_unlock_irq(&dmabuf->poll.lock);
>   
>   		if (events & EPOLLOUT) {
> -			if (!dma_buf_poll_shared(resv, dcb) &&
> -			    !dma_buf_poll_excl(resv, dcb))
> +			if (!dma_buf_poll_add_cb(resv, true, dcb))
>   				/* No callback queued, wake up any other waiters */
>   				dma_buf_poll_cb(NULL, &dcb->cb);
>   			else
> @@ -303,7 +279,7 @@ static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
>   		spin_unlock_irq(&dmabuf->poll.lock);
>   
>   		if (events & EPOLLIN) {
> -			if (!dma_buf_poll_excl(resv, dcb))
> +			if (!dma_buf_poll_add_cb(resv, false, dcb))
>   				/* No callback queued, wake up any other waiters */
>   				dma_buf_poll_cb(NULL, &dcb->cb);
>   			else
> 
