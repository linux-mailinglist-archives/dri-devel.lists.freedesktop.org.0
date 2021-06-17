Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 310C33ABA18
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 18:58:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D9E96E942;
	Thu, 17 Jun 2021 16:58:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81FD76E942
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 16:58:39 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id i94so7562439wri.4
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 09:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=m0NN26eErCRg0kmRwH9+v0k4xd87uCWvx8nQO4DniHo=;
 b=ZYv8yPfG6qw2zUs/XTTYQhQeSzFNtGco8MYF7pOYpNBPz1TKHOKAma5qqd/PTpH+6c
 pmj0gh6j5ApgICukaD758fqIZseLHDXm/2JodKZ3zvMeAMdlaHCeZQjZHSgVctkjjscY
 KfNZvEgifMOJrNLlkEMdRHL8U4G5jhceOlr0M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=m0NN26eErCRg0kmRwH9+v0k4xd87uCWvx8nQO4DniHo=;
 b=HZ5wRAdGNGEO2h+r9StNhaPrP6KkTlqqPgsCgZ/AZAFl5gVlZVgyLQsH3DV0fqKzPN
 3b7v8VpyZyAL8fRyCMyV4TyK2hxAfeS1RfUCNVP+FtRnowXVEKoV36zMLN6v1GNCtdV7
 q0dbzH6vjVB4YDj5OOZXN3VOl4BG8az7OJ745+klCpqNIL/tes3IRJfB57yRRDe+eCMP
 XFQ2l6YEPt9RH3cZLmVF3uXbchaZuzfMva8J6bNs52W49XJfnYmtNVEyL6QD72vYRIa9
 BSEJqEiEn258ObYaoJmDR7s5wqzjIqj7E1d2COgaKhg1X8CTkJ9u7BiwIikNffPnPBAV
 uLOg==
X-Gm-Message-State: AOAM532gIQfsom1jE4gyPmGq+h9K4bu0PEHFiDnN1OcODWGwvnoO7YZa
 Ohn31CGvlG4zWtsXTLmjI9WoBs6wbpLLgg==
X-Google-Smtp-Source: ABdhPJzND9ghlEQoOtP44Nnyb0E/yzTEeRlM/h9bCP50Wcq98cnP9naHBDMXVQDtDRw/VOOJv1D6SA==
X-Received: by 2002:adf:fb92:: with SMTP id a18mr7012708wrr.182.1623949118175; 
 Thu, 17 Jun 2021 09:58:38 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s7sm5879914wru.67.2021.06.17.09.58.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 09:58:37 -0700 (PDT)
Date: Thu, 17 Jun 2021 18:58:35 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 1/5] dma-buf: fix dma_resv_test_signaled test_all handling
Message-ID: <YMt/O2LqRpixWIPa@phenom.ffwll.local>
References: <20210611120301.10595-1-christian.koenig@amd.com>
 <YMN3nr1mTj09p8lT@phenom.ffwll.local>
 <2c91e4b4-e8c8-a9f5-420f-9cf0c1f9a67d@gmail.com>
 <YMN5do2/KUt85h5W@phenom.ffwll.local>
 <a88eacc0-c572-b296-e30b-ec606d716f8f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a88eacc0-c572-b296-e30b-ec606d716f8f@gmail.com>
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 14, 2021 at 07:15:44PM +0200, Christian König wrote:
> Am 11.06.21 um 16:55 schrieb Daniel Vetter:
> > On Fri, Jun 11, 2021 at 04:53:11PM +0200, Christian König wrote:
> > > 
> > > Am 11.06.21 um 16:47 schrieb Daniel Vetter:
> > > > On Fri, Jun 11, 2021 at 02:02:57PM +0200, Christian König wrote:
> > > > > As the name implies if testing all fences is requested we
> > > > > should indeed test all fences and not skip the exclusive
> > > > > one because we see shared ones.
> > > > > 
> > > > > Signed-off-by: Christian König <christian.koenig@amd.com>
> > > > Hm I thought we've had the rule that when both fences exist, then
> > > > collectively the shared ones must signale no earlier than the exclusive
> > > > one.
> > > > 
> > > > That's at least the contract we've implemented in dma_resv.h. But I've
> > > > also found a bunch of drivers who are a lot more yolo on this.
> > > > 
> > > > I think there's a solid case here to just always take all the fences if we
> > > > ask for all the shared ones, but if we go that way then I'd say
> > > > - clear kerneldoc patch to really hammer this in (currently we're not good
> > > >     at all in this regard)
> > > > - going through drivers a bit to check for this (I have some of that done
> > > >     already in my earlier series, need to respin it and send it out)
> > > > 
> > > > But I'm kinda not seeing why this needs to be in this patch series here.
> > > You mentioned that this is a problem in the last patch and if you ask me
> > > that's just a bug or at least very inconsistent.
> > > 
> > > See dma_resv_wait_timeout() always waits for all fences, including the
> > > exclusive one even if shared ones are present. But dma_resv_test_signaled()
> > > ignores the exclusive one if shared ones are present.
> > Hm the only one I thought I've mentioned is that dma_buf_poll doesn't use
> > dma_fence_get_rcu_safe where I think it should. Different problem. I think
> > this is one you spotted.
> > 
> > > The only other driver I could find trying to make use of this is nouveau and
> > > I already provided a fix for this as well.
> > i915 also does this, and I think I've found a few more.
> > 
> > > I just think that this is the more defensive approach to fix this and have
> > > at least the core functions consistent on the handling.
> > Oh fully agree, it's just current dma_resv docs aren't the greatest, and
> > hacking on semantics without updating the docs isn't great. Especially
> > when it's ad-hoc.
> 
> Well when the requirement that shared fences should always signal after the
> exclusive fence is not documented anywhere then I would say that it is
> naturally allowed to just add any fence to the list of shared fence and any
> code assuming something else is just broken and need fixing.

That's not what I meant. I thought the rule is that the shared fences
_together_ need to signal after the exclusive ones. Not each individual
one.

This means that if you have both exclusive  fences and shared fences, and
you want to wait for just the shared fences, then you can ignore the
exclusive ones.

You have a patch series floating around which "fixes" this, but I think
it's imcomplete. And I'm pretty sure it's a change of defacto rules, since
not obeying this breaks a bunch of existing code (as you've noticed).
-Daniel

> 
> Christian.
> 
> > -Daniel
> > 
> > > Christian.
> > > 
> > > > -Daniel
> > > > 
> > > > > ---
> > > > >    drivers/dma-buf/dma-resv.c | 33 ++++++++++++---------------------
> > > > >    1 file changed, 12 insertions(+), 21 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> > > > > index f26c71747d43..c66bfdde9454 100644
> > > > > --- a/drivers/dma-buf/dma-resv.c
> > > > > +++ b/drivers/dma-buf/dma-resv.c
> > > > > @@ -615,25 +615,21 @@ static inline int dma_resv_test_signaled_single(struct dma_fence *passed_fence)
> > > > >     */
> > > > >    bool dma_resv_test_signaled(struct dma_resv *obj, bool test_all)
> > > > >    {
> > > > > -	unsigned int seq, shared_count;
> > > > > +	struct dma_fence *fence;
> > > > > +	unsigned int seq;
> > > > >    	int ret;
> > > > >    	rcu_read_lock();
> > > > >    retry:
> > > > >    	ret = true;
> > > > > -	shared_count = 0;
> > > > >    	seq = read_seqcount_begin(&obj->seq);
> > > > >    	if (test_all) {
> > > > >    		struct dma_resv_list *fobj = dma_resv_shared_list(obj);
> > > > > -		unsigned int i;
> > > > > -
> > > > > -		if (fobj)
> > > > > -			shared_count = fobj->shared_count;
> > > > > +		unsigned int i, shared_count;
> > > > > +		shared_count = fobj ? fobj->shared_count : 0;
> > > > >    		for (i = 0; i < shared_count; ++i) {
> > > > > -			struct dma_fence *fence;
> > > > > -
> > > > >    			fence = rcu_dereference(fobj->shared[i]);
> > > > >    			ret = dma_resv_test_signaled_single(fence);
> > > > >    			if (ret < 0)
> > > > > @@ -641,24 +637,19 @@ bool dma_resv_test_signaled(struct dma_resv *obj, bool test_all)
> > > > >    			else if (!ret)
> > > > >    				break;
> > > > >    		}
> > > > > -
> > > > > -		if (read_seqcount_retry(&obj->seq, seq))
> > > > > -			goto retry;
> > > > >    	}
> > > > > -	if (!shared_count) {
> > > > > -		struct dma_fence *fence_excl = dma_resv_excl_fence(obj);
> > > > > -
> > > > > -		if (fence_excl) {
> > > > > -			ret = dma_resv_test_signaled_single(fence_excl);
> > > > > -			if (ret < 0)
> > > > > -				goto retry;
> > > > > +	fence = dma_resv_excl_fence(obj);
> > > > > +	if (fence) {
> > > > > +		ret = dma_resv_test_signaled_single(fence);
> > > > > +		if (ret < 0)
> > > > > +			goto retry;
> > > > > -			if (read_seqcount_retry(&obj->seq, seq))
> > > > > -				goto retry;
> > > > > -		}
> > > > >    	}
> > > > > +	if (read_seqcount_retry(&obj->seq, seq))
> > > > > +		goto retry;
> > > > > +
> > > > >    	rcu_read_unlock();
> > > > >    	return ret;
> > > > >    }
> > > > > -- 
> > > > > 2.25.1
> > > > > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
