Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E814E4172
	for <lists+dri-devel@lfdr.de>; Tue, 22 Mar 2022 15:35:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFD9B10E33F;
	Tue, 22 Mar 2022 14:35:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F063710E563
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Mar 2022 14:35:51 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id
 r190-20020a1c2bc7000000b0038a1013241dso1980878wmr.1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Mar 2022 07:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=k85kloHbcIggRxVhXQ1Ho3hwIvYMNzOOfOLgKduAAmU=;
 b=jy3DItEV5xnVFmXtuvyyw9++wb6oYKqcJ0eg3Uk2ef6JRAoX3y1C4ICOVMcxZJivy/
 pC+huRt4/AC2WepZ17kkKEj7SRS2glFy5LsGzIoOuO9P/7W0WP63vqJOOpx0rJSW4iQC
 wGrgVoCeNsVSJqwz2IneMgUHrXilobuv8uwrw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=k85kloHbcIggRxVhXQ1Ho3hwIvYMNzOOfOLgKduAAmU=;
 b=CVfMVZmEd1IJP9aSbRLerT2WfWkR/QAYNLdYgo4W3hnih2rOdTb3iR/hmcAYlU8140
 6rdQsnswwLUHycBDRuCMtp3eIIVGLXXUCg7xVQgbi2Dg3CBYSZp3LgTTcNeOyIlEtEwk
 wfOCeNBTTGXFPDtSRAsASNAgcgX57sNnZUkf10412zpuiUUZBd2ReOoTQVYkKnpgS+5p
 O/zOFr61w54RR6+cmevAdVCktI7WjYDaiHWKDsuPQ0/OYPEe0B/ZflcloFFtkfwP6Szz
 nxubqOVnND+asqk9E9KtOJ97VIL5hIRo0zzdimUmUO/4GkcpvTP3MMcZoN6nhfalTFl9
 A9aA==
X-Gm-Message-State: AOAM532XJC6XQPB4UuV0jpOHPwAYWpeIFpCk6w9SXw8GSGwO291gZUoB
 6G+TG/8PPtnzlq0UmSITxl14Mw==
X-Google-Smtp-Source: ABdhPJwbu7ZrEmFHOQ54iFHvoiY0pRr6Om2/RqA63ZZTYwG47G1K/vbAe9ikAXBpv6lfz4pWbuUUOw==
X-Received: by 2002:a5d:588a:0:b0:204:1f72:2d90 with SMTP id
 n10-20020a5d588a000000b002041f722d90mr4586615wrf.651.1647959750401; 
 Tue, 22 Mar 2022 07:35:50 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 n124-20020a1ca482000000b0038c9cf6e296sm2882755wme.14.2022.03.22.07.35.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 07:35:49 -0700 (PDT)
Date: Tue, 22 Mar 2022 15:35:48 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Michael Cheng <michael.cheng@intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/4] i915/gem: drop wbinvd_on_all_cpus usage
Message-ID: <YjnexPTKUajqPye0@phenom.ffwll.local>
References: <20220319194227.297639-1-michael.cheng@intel.com>
 <20220319194227.297639-2-michael.cheng@intel.com>
 <fc7c729b-5c87-f046-04dd-7ca8296487dd@linux.intel.com>
 <05e56e59-81ed-0b99-6c3d-7f9f413ecd4a@intel.com>
 <9ee954d2-4a5e-ff11-0061-b518e00e952a@linux.intel.com>
 <6748e0f6-c628-d5cc-41f1-3dbfe5916660@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6748e0f6-c628-d5cc-41f1-3dbfe5916660@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 thomas.hellstrom@linux.intel.com, daniel.vetter@ffwll.ch,
 intel-gfx@lists.freedesktop.org, lucas.demarchi@intel.com,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 21, 2022 at 10:42:03AM -0700, Michael Cheng wrote:
> 
> On 2022-03-21 10:28 a.m., Tvrtko Ursulin wrote:
> > 
> > On 21/03/2022 16:31, Michael Cheng wrote:
> > > On 2022-03-21 3:30 a.m., Tvrtko Ursulin wrote:
> > > 
> > > > 
> > > > On 19/03/2022 19:42, Michael Cheng wrote:
> > > > > Previous concern with using drm_clflush_sg was that we don't
> > > > > know what the
> > > > > sg_table is pointing to, thus the usage of wbinvd_on_all_cpus to flush
> > > > > everything at once to avoid paranoia.
> > > > 
> > > > And now we know, or we know it is not a concern?
> > > > 
> > > > > To make i915 more architecture-neutral and be less paranoid,
> > > > > lets attempt to
> > > > 
> > > > "Lets attempt" as we don't know if this will work and/or what
> > > > can/will break?
> > > 
> > > Yes, but it seems like there's no regression with IGT .
> > > 
> > > If there's a big hit in performance, or if this solution gets
> > > accepted and the bug reports come flying in, we can explore other
> > > solutions. But speaking to Dan Vetter, ideal solution would be to
> > > avoid any calls directly to wbinvd, and use drm helpers in place.
> > > 
> > > +Daniel for any extra input.
> > > 
> > > > > use drm_clflush_sg to flush the pages for when the GPU wants to read
> > > > > from main memory.
> > > > > 
> > > > > Signed-off-by: Michael Cheng <michael.cheng@intel.com>
> > > > > ---
> > > > >   drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c | 9 ++-------
> > > > >   1 file changed, 2 insertions(+), 7 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> > > > > b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> > > > > index f5062d0c6333..b0a5baaebc43 100644
> > > > > --- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> > > > > +++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> > > > > @@ -8,6 +8,7 @@
> > > > >   #include <linux/highmem.h>
> > > > >   #include <linux/dma-resv.h>
> > > > >   #include <linux/module.h>
> > > > > +#include <drm/drm_cache.h>
> > > > >     #include <asm/smp.h>
> > > > >   @@ -250,16 +251,10 @@ static int
> > > > > i915_gem_object_get_pages_dmabuf(struct drm_i915_gem_object
> > > > > *obj)
> > > > >        * DG1 is special here since it still snoops
> > > > > transactions even with
> > > > >        * CACHE_NONE. This is not the case with other
> > > > > HAS_SNOOP platforms. We
> > > > >        * might need to revisit this as we add new discrete platforms.
> > > > > -     *
> > > > > -     * XXX: Consider doing a vmap flush or something, where possible.
> > > > > -     * Currently we just do a heavy handed
> > > > > wbinvd_on_all_cpus() here since
> > > > > -     * the underlying sg_table might not even point to
> > > > > struct pages, so we
> > > > > -     * can't just call drm_clflush_sg or similar, like we
> > > > > do elsewhere in
> > > > > -     * the driver.
> > > > >        */
> > > > >       if (i915_gem_object_can_bypass_llc(obj) ||
> > > > >           (!HAS_LLC(i915) && !IS_DG1(i915)))
> > > > > -        wbinvd_on_all_cpus();
> > > > > +        drm_clflush_sg(pages);
> > > > 
> > > > And as noticed before, drm_clfush_sg still can call
> > > > wbinvd_on_all_cpus so are you just punting the issue somewhere
> > > > else? How will it be solved there?
> > > > 
> > > Instead of calling an x86 asm directly, we are using what's
> > > available to use to make the driver more architecture neutral.
> > > Agreeing with Thomas, this solution falls within the "prefer
> > > range-aware clflush apis", and since some other generation platform
> > > doesn't support clflushopt, it will fall back to using wbinvd.
> > 
> > Right, I was trying to get the information on what will drm_clflush_sg
> > do on Arm. Is it range based or global there, or if the latter exists.
> > 
> I am not too sure about the ARM side. We are currently working that out with
> the ARM folks in a different thread.

It won't do anything useful on arm. The _only_ way to get special memory
on arm is by specifying what you want at allocation time. Anything else is
busted, more or less. Which is why none of these code paths should run on
anything else than x86.

And even on x86 they're at best questionable, but some of these are
mistakes encoded into uapi and we're stuck.

We should still try to use drm_clflush_sg() imo to make the entire ordeal
less horrible, and if that turns out to be problematic, we need to bite
the bullet and fix the uapi architecture instead of trying to
retroshoehorn performance fixes into uapi that just can't do it properly.

In this case here this would mean fixing allocation flags with
GEM_CREATE_EXT and fixing userspace to use that when needed (it should
know already since pretty much all drivers have this issue in some form or
another).

Cheers, Daniel


> > Regards,
> > 
> > Tvrtko

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
