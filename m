Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 056B748EE28
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 17:33:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C053010EF41;
	Fri, 14 Jan 2022 16:33:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AA2310EF41
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 16:33:12 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 n19-20020a7bc5d3000000b003466ef16375so8425312wmk.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 08:33:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=ZIIyOq9/oXrPizWbUUaL9+KeQVMy19MSltRLOnZI+Sg=;
 b=Y+ju2lmpK9osLNH5uCV0xivjNzwGMiB+7AlMRCoDQ3Dvs6EDm5isq+QMWIIVYsIXzn
 KsFSlhPnT6BCF1HkV9Xw+LHXf653f92IGvULe1IpjzXvsSg81x1BXSI++CLXNA3zQBc2
 M6X113Wd5RFcBicbvpsSoT6juxGcqqbklg39A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ZIIyOq9/oXrPizWbUUaL9+KeQVMy19MSltRLOnZI+Sg=;
 b=t2yrYZoOqUvOUvLIol+Fr/fqHIDM1XV5UTHBEEpOc+faXgaEw1ybO6uah/Fpl/L/9M
 cspF5qFTvfv9f7gLwKCdLHxC0COg3PP6iVRFCtYxXcSM+WTBTVkmkc3E7IwsPp9reNMC
 C3sgjReptxHiLkxV+aaPrLpXroF9GgLu9Fssj1dtheAFFkVYthrN8qfOUeBr69NFNNj3
 N+3vMg7X7cwBZBS3MqKKI1ygp9Nm80kOo+XOdmWilH72+fSYOAVbk4IHpnHcXVh4HJlf
 fZwePPzOmaT8S3zFmLHOnztzkTjyck8xQovAKnHs/hNRfRyYo36gp2EiDyi34czUz8MN
 cT4A==
X-Gm-Message-State: AOAM531mXISmnshMhtdbRMDPfmQNaAhqbupEQMsB8Qzsbo7b+MiAF4Oq
 9tf5E9vXljkq1xFNhoU6W45Jwg==
X-Google-Smtp-Source: ABdhPJwfLCmpFijMbefgJqdiTPuqTbnvWB+jsxq4rh8TkULuZ1WAFfi4tHbaUEtg8G6KpOERmI3blA==
X-Received: by 2002:a1c:4e1a:: with SMTP id g26mr8716623wmh.146.1642177990732; 
 Fri, 14 Jan 2022 08:33:10 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l25sm5426250wmh.18.2022.01.14.08.33.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jan 2022 08:33:10 -0800 (PST)
Date: Fri, 14 Jan 2022 17:33:08 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 13/24] dma-buf: drop the DAG approach for the dma_resv
 object
Message-ID: <YeGlxJWNfFKIoT1W@phenom.ffwll.local>
References: <20211207123411.167006-1-christian.koenig@amd.com>
 <20211207123411.167006-14-christian.koenig@amd.com>
 <YcOcASxfAApIpbrf@phenom.ffwll.local>
 <d1fe9e3b-3d58-2aa8-36ae-9052192a2f0d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d1fe9e3b-3d58-2aa8-36ae-9052192a2f0d@gmail.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 04, 2022 at 04:08:20PM +0100, Christian König wrote:
> Am 22.12.21 um 22:43 schrieb Daniel Vetter:
> > On Tue, Dec 07, 2021 at 01:34:00PM +0100, Christian König wrote:
> > > So far we had the approach of using a directed acyclic
> > > graph with the dma_resv obj.
> > > 
> > > This turned out to have many downsides, especially it means
> > > that every single driver and user of this interface needs
> > > to be aware of this restriction when adding fences. If the
> > > rules for the DAG are not followed then we end up with
> > > potential hard to debug memory corruption, information
> > > leaks or even elephant big security holes because we allow
> > > userspace to access freed up memory.
> > > 
> > > Since we already took a step back from that by always
> > > looking at all fences we now go a step further and stop
> > > dropping the shared fences when a new exclusive one is
> > > added.
> > > 
> > > Signed-off-by: Christian König <christian.koenig@amd.com>
> > > ---
> > >   drivers/dma-buf/dma-resv.c | 13 -------------
> > >   1 file changed, 13 deletions(-)
> > > 
> > > diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> > > index 9acceabc9399..ecb2ff606bac 100644
> > > --- a/drivers/dma-buf/dma-resv.c
> > > +++ b/drivers/dma-buf/dma-resv.c
> > No doc update at all!
> 
> Scratching my head I'm pretty sure I've updated at least the kerneldoc for
> dma_resv_add_excl_fence(). Must have gone lost in some rebase.
> 
> > 
> > I checked, we're not that shitty with docs,
> 
> Well I wouldn't say shitty, but they are not perfect either.

This was sarcasm, I meant to say that despite the struggles the docs
in-tree are pretty good nowadays. Email just sucks sometimes for
communication.

> >   Minimally the DOC: section
> > header and also the struct dma_resv kerneldoc. Also there's maybe more
> > references and stuff I've missed on a quick look, please check for them
> > (e.g. dma_buf.resv kerneldoc is rather important to keep correct too).
> > 
> > Code itself does what it says in the commit message, but we really need
> > the most accurate docs we can get for this stuff, or the confusion will
> > persist :-/
> 
> Yeah completely agree, going to fix that.

Awesome!

Cheers, Daniel

> 
> Thanks,
> Christian.
> 
> > 
> > Cheers, Daniel
> > 
> > > @@ -383,29 +383,16 @@ EXPORT_SYMBOL(dma_resv_replace_fences);
> > >   void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence)
> > >   {
> > >   	struct dma_fence *old_fence = dma_resv_excl_fence(obj);
> > > -	struct dma_resv_list *old;
> > > -	u32 i = 0;
> > >   	dma_resv_assert_held(obj);
> > > -	old = dma_resv_shared_list(obj);
> > > -	if (old)
> > > -		i = old->shared_count;
> > > -
> > >   	dma_fence_get(fence);
> > >   	write_seqcount_begin(&obj->seq);
> > >   	/* write_seqcount_begin provides the necessary memory barrier */
> > >   	RCU_INIT_POINTER(obj->fence_excl, fence);
> > > -	if (old)
> > > -		old->shared_count = 0;
> > >   	write_seqcount_end(&obj->seq);
> > > -	/* inplace update, no shared fences */
> > > -	while (i--)
> > > -		dma_fence_put(rcu_dereference_protected(old->shared[i],
> > > -						dma_resv_held(obj)));
> > > -
> > >   	dma_fence_put(old_fence);
> > >   }
> > >   EXPORT_SYMBOL(dma_resv_add_excl_fence);
> > > -- 
> > > 2.25.1
> > > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
