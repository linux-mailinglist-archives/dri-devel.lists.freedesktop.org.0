Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9523F8A96
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 16:59:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFC896E878;
	Thu, 26 Aug 2021 14:59:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32D416E86E
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 14:59:30 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id bt14so6966088ejb.3
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 07:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=xFXMIzAtDgmXOcLiJVW1C7jqjagasDTptmsNictXpmg=;
 b=faQbgtefcIGp683Q7k/Q3YOYBbWlgIf02jwMdLFBUsRKAeT/SWfg7kqOOCAaVVr5dV
 ldfW1ZliDZ7qIhHQBkLQHX1m+djghPbA1uTihNu0ZNEiYPOmjNn3pXGsOcLKF6lIqlAy
 fB7tUsGK2BCNZVvqCwArCjiudBkUp5r84E6dg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=xFXMIzAtDgmXOcLiJVW1C7jqjagasDTptmsNictXpmg=;
 b=kltvimnmwlKvd/FrYfPdglRLFAtVGigigj6Rvz4gai3KZY9GLfhtk13uMezkK5mol/
 GwTaT6j9SdUBnGd5QwGqMXC9USBb58EYqRjJI8KjKc4bgsAyQ4qAz9gambkcHrmaMPn2
 XtjlMOTmUFp+KpuZGuxWlY+dpT6T1LANCONraazC5CLJW6sy4lIrXS45Su+lnMCwYxi2
 jaz57A4O+4WbVAv4WvYROTEEeL19+blMqlnO67DSFNGhlcurE+lpXd19c54+XqeNkA4M
 iAlbgOVGerE9Q60Xdw5HyiqviCBEslCMIqBanstm7aJTG8yyfwtYegbMPv42SIiTtpUi
 Vxfw==
X-Gm-Message-State: AOAM531kddiEMHWv7V+Q30er2SkzQQhWg7nN0taKlOs+Qst4ec868ZQY
 qdFz8mRD8IHFqog6nwwcbL/ROg==
X-Google-Smtp-Source: ABdhPJwZStqZyAARpHQ/9elYfwpIdYFg0K8KQUAeYbBCwiKVH0Lg4urghSCsyjn6tkgXW4TcryL7Rg==
X-Received: by 2002:a17:906:248e:: with SMTP id
 e14mr4750776ejb.343.1629989968293; 
 Thu, 26 Aug 2021 07:59:28 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u16sm1563517ejy.14.2021.08.26.07.59.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 07:59:27 -0700 (PDT)
Date: Thu, 26 Aug 2021 16:59:25 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Brost Matthew <matthew.brost@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915/gt: Register the migrate
 contexts with their engines
Message-ID: <YSesTaQD6E1Knt80@phenom.ffwll.local>
References: <20210826104514.400352-1-thomas.hellstrom@linux.intel.com>
 <YSeMr9cBPLOMXhyL@phenom.ffwll.local>
 <69c91b3b524163d1683486d8ab0f9fe8f6893192.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <69c91b3b524163d1683486d8ab0f9fe8f6893192.camel@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 26, 2021 at 03:59:30PM +0200, Thomas Hellström wrote:
> On Thu, 2021-08-26 at 14:44 +0200, Daniel Vetter wrote:
> > On Thu, Aug 26, 2021 at 12:45:14PM +0200, Thomas Hellström wrote:
> > > Pinned contexts, like the migrate contexts need reset after resume
> > > since their context image may have been lost. Also the GuC needs to
> > > register pinned contexts.
> > > 
> > > Add a list to struct intel_engine_cs where we add all pinned
> > > contexts on
> > > creation, and traverse that list at resume time to reset the pinned
> > > contexts.
> > > 
> > > This fixes the kms_pipe_crc_basic@suspend-read-crc-pipe-a selftest
> > > for now,
> > > but proper LMEM backup / restore is needed for full suspend
> > > functionality.
> > > However, note that even with full LMEM backup / restore it may be
> > > desirable to keep the reset since backing up the migrate context
> > > images
> > > must happen using memcpy() after the migrate context has become
> > > inactive,
> > > and for performance- and other reasons we want to avoid memcpy()
> > > from
> > > LMEM.
> > > 
> > > Also traverse the list at guc_init_lrc_mapping() calling
> > > guc_kernel_context_pin() for the pinned contexts, like is already
> > > done
> > > for the kernel context.
> > > 
> > > v2:
> > > - Don't reset the contexts on each __engine_unpark() but rather at
> > >   resume time (Chris Wilson).
> > > 
> > > Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> > > Cc: Matthew Auld <matthew.auld@intel.com>
> > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > Cc: Brost Matthew <matthew.brost@intel.com>
> > > Cc: Chris Wilson <chris@chris-wilson.co.uk>
> > > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > 
> > I guess it got lost, but I few weeks ago I stumbled over this and
> > wondered
> > why we're even setting up a separate context or at least why a
> > separate vm
> > compared to the gt->vm we have already?
> > 
> > Even on chips with bazillions of copy engines the plan is that we
> > only
> > reserve a single one for kernel migrations, so there's not really a
> > need
> > for quite this much generality I think. Maybe check with Jon
> > Bloomfield on
> > this.
> 
> Are you referring to the generality of the migration code itself or to
> the generality of using a list in this patch to register multiple
> pinned contexts to an engine? 
> 
> For the migration code itself, I figured reserving one copy engine for
> migration was strictly needed for recoverable page-faults? In the
> current version we're not doing that, but just tying a pinned migration
> context to the first available copy engine on the gt, to be used when
> we don't have a ww context available to pin a separate context using a
> random copy engine. Note also the ring size of the migration contexts;
> since we're populating the page-tables for each blit, it's not hard to
> fill the ring and in the end multiple contexts I guess boils down to
> avoiding priority inversion on migration, including blocking high
> priority kernel context tasks.
> 
> As for not using the gt->vm, I'm not completely sure if we can do our
> special page-table setup on that, Got to defer that question to Chris,
> but once Ram's work of supporting 64K LMEM PTEs on that has landed I
> guess we could easily reuse the gt->vm if possible and suitable.

Just on why we have gt->vm and then also the migration vm. The old mail I
typed up on this:

https://lore.kernel.org/dri-devel/CAKMK7uG6g+DQQEcjqeA6=Z2ENHogaMuvKERDgKm5jKq3u+a1jQ@mail.gmail.com/

-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
