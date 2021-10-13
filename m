Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2501342BF84
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 14:06:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 027816EA3A;
	Wed, 13 Oct 2021 12:06:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66B766EA3A
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 12:06:43 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id v17so7518165wrv.9
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 05:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=8XJTZuu/jXne9p86DSFieGiZxBS0gOLK7dAm+S4G6+o=;
 b=QLe8+3g18BAb/AhKMuXjgtJ6+Nm7krg+7EGBBii3/TIuReOBmKUv2LP8QfMTXg8J10
 crcfKhd/36o0t3eqqs7JqXSfDJ2jqG1qde1tyIWOuBEUIWVjNC23tOuCNrgt5f9cb+KJ
 IFPt6wvn+TZqBmqNDY3JXb8IIid2DS2XcNjjE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=8XJTZuu/jXne9p86DSFieGiZxBS0gOLK7dAm+S4G6+o=;
 b=IooU40FbLqk3Gt/p6Dk6BcLvvvnjTFJJxMcGuie3DAWsj/tei0n505sKcRdbTwXhW9
 H9NOmmFZNWp7siERqfA/QpZn8lzu4FElW61sZ/YdzXNVWWkKcSPTLk2WsobjHF4/15ei
 bbQEjoNSm3Dg19my5+uOpOFKKioB4e5AT+4vnim2bROKO3hNvHV7eYFtfT6LNRqvckDc
 opjMrPa12D+hE1Vu1as7sh4EWnmZHNI1PKt/rpUEpt2+J0E3nKbn2eknFC1RFpJGBhBc
 B/kcC2C4PKzTDMXbJA9qDAAZvJm8vFMXCh7I3p1vkGNiWDBHPATC090NRkENw7nFEsrY
 Pd+w==
X-Gm-Message-State: AOAM531RwKaQOLd+f3INJzI8sMd11/2srpvdnDEoG+6+S1ux/OnW/vrq
 7/yECP0nve3N9pFunZlQyLu9ig==
X-Google-Smtp-Source: ABdhPJzKqx5goqP3brbEuD8a1FINfN86M7xGQbS8A9T56TtbStIE8kHLrcjjOKf3+zmnxfHIndoVPg==
X-Received: by 2002:a7b:c350:: with SMTP id l16mr12112517wmj.151.1634126801887; 
 Wed, 13 Oct 2021 05:06:41 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f18sm13493444wrg.3.2021.10.13.05.06.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 05:06:41 -0700 (PDT)
Date: Wed, 13 Oct 2021 14:06:39 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH] drm/i915: Handle Intel igfx + Intel dgfx hybrid graphics
 setup
Message-ID: <YWbLz35BuRZlSDFg@phenom.ffwll.local>
References: <20211005113135.768295-1-tvrtko.ursulin@linux.intel.com>
 <3aa70cb9-c28b-b85d-eac0-b3f5cca5bf73@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3aa70cb9-c28b-b85d-eac0-b3f5cca5bf73@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 05, 2021 at 03:05:25PM +0200, Thomas Hellström wrote:
> Hi, Tvrtko,
> 
> On 10/5/21 13:31, Tvrtko Ursulin wrote:
> > From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > 
> > In short this makes i915 work for hybrid setups (DRI_PRIME=1 with Mesa)
> > when rendering is done on Intel dgfx and scanout/composition on Intel
> > igfx.
> > 
> > Before this patch the driver was not quite ready for that setup, mainly
> > because it was able to emit a semaphore wait between the two GPUs, which
> > results in deadlocks because semaphore target location in HWSP is neither
> > shared between the two, nor mapped in both GGTT spaces.
> > 
> > To fix it the patch adds an additional check to a couple of relevant code
> > paths in order to prevent using semaphores for inter-engine
> > synchronisation when relevant objects are not in the same GGTT space.
> > 
> > v2:
> >   * Avoid adding rq->i915. (Chris)
> > 
> > v3:
> >   * Use GGTT which describes the limit more precisely.
> > 
> > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> 
> An IMO pretty important bugfix. I read up a bit on the previous discussion
> on this, and from what I understand the other two options were
> 
> 1) Ripping out the semaphore code,
> 2) Consider dma-fences from other instances of the same driver as foreign.
> 
> For imported dma-bufs we do 2), but particularly with lmem and p2p that's a
> more straightforward decision.
> 
> I don't think 1) is a reasonable approach to fix this bug, (but perhaps as a
> general cleanup?), and for 2) yes I guess we might end up doing that, unless
> we find some real benefits in treating same-driver-separate-device
> dma-fences as local, but for this particular bug, IMO this is a reasonable
> fix.

The foreign dma-fences have uapi impact, which Tvrtko shrugged off as
"it's a good idea", and not it's really just not. So we still need to that
this properly.

> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

But I'm also ok with just merging this as-is so the situation doesn't
become too entertaining.
-Daniel

> 
> 
> 
> 
> 
> > ---
> >   drivers/gpu/drm/i915/i915_request.c | 12 +++++++++++-
> >   1 file changed, 11 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
> > index 79da5eca60af..4f189982f67e 100644
> > --- a/drivers/gpu/drm/i915/i915_request.c
> > +++ b/drivers/gpu/drm/i915/i915_request.c
> > @@ -1145,6 +1145,12 @@ __emit_semaphore_wait(struct i915_request *to,
> >   	return 0;
> >   }
> > +static bool
> > +can_use_semaphore_wait(struct i915_request *to, struct i915_request *from)
> > +{
> > +	return to->engine->gt->ggtt == from->engine->gt->ggtt;
> > +}
> > +
> >   static int
> >   emit_semaphore_wait(struct i915_request *to,
> >   		    struct i915_request *from,
> > @@ -1153,6 +1159,9 @@ emit_semaphore_wait(struct i915_request *to,
> >   	const intel_engine_mask_t mask = READ_ONCE(from->engine)->mask;
> >   	struct i915_sw_fence *wait = &to->submit;
> > +	if (!can_use_semaphore_wait(to, from))
> > +		goto await_fence;
> > +
> >   	if (!intel_context_use_semaphores(to->context))
> >   		goto await_fence;
> > @@ -1256,7 +1265,8 @@ __i915_request_await_execution(struct i915_request *to,
> >   	 * immediate execution, and so we must wait until it reaches the
> >   	 * active slot.
> >   	 */
> > -	if (intel_engine_has_semaphores(to->engine) &&
> > +	if (can_use_semaphore_wait(to, from) &&
> > +	    intel_engine_has_semaphores(to->engine) &&
> >   	    !i915_request_has_initial_breadcrumb(to)) {
> >   		err = __emit_semaphore_wait(to, from, from->fence.seqno - 1);
> >   		if (err < 0)

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
