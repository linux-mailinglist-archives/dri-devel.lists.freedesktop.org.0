Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3413D3749
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 11:02:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF2B56ED17;
	Fri, 23 Jul 2021 09:02:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16E626EAC6
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 09:02:04 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id n2so823861eda.10
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 02:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=H20rashoP0PI/4mcAWWqkgsc6ouNdbHg+NJZNqP1JDM=;
 b=lVm33/5j21ACNJPF/VGWVWV868PDs09n4VxTQvOBtV2a914nW69TcdhZ5QAkSUAYpU
 bgqR6uSdVVWgsSW/mR+NM835LaGlbzXkhz6KuLuevVTdwKB1Zy7LJlCfaNIrjIhywHZF
 IGZ2DRjnhEcZKePaCZRBaDMn2c0KwZuSEDY98=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=H20rashoP0PI/4mcAWWqkgsc6ouNdbHg+NJZNqP1JDM=;
 b=pI/ZSfK3scXKeGfjjO10P+NiKkpOo9FSQT09oDtpNLWS29sgNk6/oGc5iBdFVQUcff
 34Vr3IUnTd67744XpHrke2lZA5vBn9IcXyn4gT0hobVpu9yTEOL5ue8OThEtH5A/l/x3
 fLAciPLfWM6UEhiPnrLZAAFcMWcU3IuM39QREf9D3tK6hm3VlNw+P3l2tr10SehORTFL
 8coC6vn2T6YoEc45Rzfqny99JeOCMr3sDxFmhFwpQXdGnhIUELuiBhb4gHqecYcFRS3/
 0T5kdRzSQ4Dbfi4IbmpFSGwd89GgFvmtH4Xl8+YHOS7ejZcqsNxgpQ6YsMOZ1nDemkil
 5BJg==
X-Gm-Message-State: AOAM530rW9Q8bMHeJ4CUw1zzm5EqWaklhMC9nmH8YFCRLcIRslNIoHnk
 w8Zf75GBR3qK9xz5I+IG9sWKWw==
X-Google-Smtp-Source: ABdhPJyyEFO9yMTykjx6W9MKiufO2hGuxigcLPb1ZDBRgh4QiUsdniUA57nRfgeuJaGqgIAPLTP0Bg==
X-Received: by 2002:aa7:c907:: with SMTP id b7mr4334018edt.148.1627030922700; 
 Fri, 23 Jul 2021 02:02:02 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b25sm13846456edv.9.2021.07.23.02.02.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 02:02:02 -0700 (PDT)
Date: Fri, 23 Jul 2021 11:02:00 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>
Subject: Re: [PATCH] dma-buf/poll: Get a file reference for outstanding fence
 callbacks
Message-ID: <YPqFiPftjTUV4361@phenom.ffwll.local>
Mail-Followup-To: Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
References: <20210723075857.4065-1-michel@daenzer.net>
 <f5f37693-bfe2-e52f-172b-00f4aa94dbd9@amd.com>
 <4cf94f59-f953-f5d7-9901-cfe5fd63bfbc@daenzer.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4cf94f59-f953-f5d7-9901-cfe5fd63bfbc@daenzer.net>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Cc: linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 23, 2021 at 10:19:49AM +0200, Michel Dänzer wrote:
> On 2021-07-23 10:04 a.m., Christian König wrote:
> > Am 23.07.21 um 09:58 schrieb Michel Dänzer:
> >> From: Michel Dänzer <mdaenzer@redhat.com>
> >>
> >> This makes sure we don't hit the
> >>
> >>     BUG_ON(dmabuf->cb_in.active || dmabuf->cb_out.active);
> >>
> >> in dma_buf_release, which could be triggered by user space closing the
> >> dma-buf file description while there are outstanding fence callbacks
> >> from dma_buf_poll.
> > 
> > I was also wondering the same thing while working on this, but then thought that the poll interface would take care of this.
> 
> I was able to hit the BUG_ON with https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/1880 .

igt test would be really lovely. Maybe base something off the
import/export igts from Jason?
-Daniel

> 
> 
> >> Cc: stable@vger.kernel.org
> >> Signed-off-by: Michel Dänzer <mdaenzer@redhat.com>
> >> ---
> >>   drivers/dma-buf/dma-buf.c | 18 ++++++++++++------
> >>   1 file changed, 12 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> >> index 6c520c9bd93c..ec25498a971f 100644
> >> --- a/drivers/dma-buf/dma-buf.c
> >> +++ b/drivers/dma-buf/dma-buf.c
> >> @@ -65,12 +65,9 @@ static void dma_buf_release(struct dentry *dentry)
> >>       BUG_ON(dmabuf->vmapping_counter);
> >>         /*
> >> -     * Any fences that a dma-buf poll can wait on should be signaled
> >> -     * before releasing dma-buf. This is the responsibility of each
> >> -     * driver that uses the reservation objects.
> >> -     *
> >> -     * If you hit this BUG() it means someone dropped their ref to the
> >> -     * dma-buf while still having pending operation to the buffer.
> >> +     * If you hit this BUG() it could mean:
> >> +     * * There's a file reference imbalance in dma_buf_poll / dma_buf_poll_cb or somewhere else
> >> +     * * dmabuf->cb_in/out.active are non-0 despite no pending fence callback
> >>        */
> >>       BUG_ON(dmabuf->cb_in.active || dmabuf->cb_out.active);
> >>   @@ -196,6 +193,7 @@ static loff_t dma_buf_llseek(struct file *file, loff_t offset, int whence)
> >>   static void dma_buf_poll_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
> >>   {
> >>       struct dma_buf_poll_cb_t *dcb = (struct dma_buf_poll_cb_t *)cb;
> >> +    struct dma_buf *dmabuf = container_of(dcb->poll, struct dma_buf, poll);
> >>       unsigned long flags;
> >>         spin_lock_irqsave(&dcb->poll->lock, flags);
> >> @@ -203,6 +201,8 @@ static void dma_buf_poll_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
> >>       dcb->active = 0;
> >>       spin_unlock_irqrestore(&dcb->poll->lock, flags);
> >>       dma_fence_put(fence);
> >> +    /* Paired with get_file in dma_buf_poll */
> >> +    fput(dmabuf->file);
> > 
> > Is calling fput() in interrupt context ok? IIRC that could potentially sleep.
> 
> Looks fine AFAICT: It has
> 
> 		if (likely(!in_interrupt() && !(task->flags & PF_KTHREAD))) {
> 
> and as a fallback for that, it adds the file to a lock-less delayed_fput_list which is processed by a workqueue.
> 
> 
> -- 
> Earthling Michel Dänzer               |               https://redhat.com
> Libre software enthusiast             |             Mesa and X developer

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
