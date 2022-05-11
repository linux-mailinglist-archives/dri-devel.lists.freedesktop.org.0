Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D22BC5233B6
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 15:09:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBF5510FADD;
	Wed, 11 May 2022 13:09:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8581E10FAF4
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 13:09:44 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id z2so3974736ejj.3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 06:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=JAobyhQX8H28MWg1GXlj8hoyzU7OkAnh8WBV4s4iSFA=;
 b=O0tqaeHW1b34CdyLh6rhmuS8HHLjDsWSGIXiwQNqVGt1ohbeSFo6zK0TNyMZaGEpF8
 /1h5/CYnXf+rbXS8dfpx3ZBhlABsIek+tgMaijJ7ylZwJOeumQPS5k0hAvwJjQG9JEAT
 1cmWL9qgE/5A1kVb4rrQV/mYuqEG8xxD088nU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=JAobyhQX8H28MWg1GXlj8hoyzU7OkAnh8WBV4s4iSFA=;
 b=dTcc+wIG3AXIQQmDxSfemSjZ2b9+4xC5NVEbV8JrehoRlEoji2YnVaNnnFUaw73qve
 QuqAB5llsg54vr+Hh8GvB2c8UvKhLkHMLwKXefkWYlMCC5K9KF22j9+tiJxQSOvPcwPo
 EebaAzUxCNXCdWnVVOLWsZqIoO/E9HBnWfU993wcnhvL3FrnSenDyfXgCtnbGtYGz3ka
 FEYOwOJgYEjL5/AjEGuJBNltbRSNAplCPIWZPwTvi52iiDLigHKzB6XBZTB3SpsNSNrj
 49RXrHzaDKpy7v9oIMILz2P+jyF4LHk60+7TMoum8+GI2KR9ZLzZUBpqG/0apRtExaDU
 3GnA==
X-Gm-Message-State: AOAM533bWOKa8n+qOmf5G6NijDvOwF1p5KuMgLTI8rZo3skBMS58XpPC
 /UG5mA2FdUL1Q3NtxlZZNntQ/A==
X-Google-Smtp-Source: ABdhPJxQyu3mGcdaLrUBTixmsVRWayFME/f8TFtVOcPnDDroBUBuDYz0i+eVHsIFOn98nhRIyA8C7w==
X-Received: by 2002:a17:906:3104:b0:6ce:6b85:ecc9 with SMTP id
 4-20020a170906310400b006ce6b85ecc9mr23720564ejx.339.1652274582909; 
 Wed, 11 May 2022 06:09:42 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 hh3-20020a170906a94300b006f3ef214e32sm958477ejb.152.2022.05.11.06.09.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 06:09:41 -0700 (PDT)
Date: Wed, 11 May 2022 15:09:39 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v4 11/15] drm/shmem-helper: Add generic memory shrinker
Message-ID: <Ynu1k5lH+xvqtObG@phenom.ffwll.local>
Mail-Followup-To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Rob Clark <robdclark@gmail.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Dmitry Osipenko <digetx@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
References: <20220417223707.157113-1-dmitry.osipenko@collabora.com>
 <20220417223707.157113-12-dmitry.osipenko@collabora.com>
 <e6108e9c-6e67-2d71-0665-654e11d9c3a5@suse.de>
 <ff97790a-fb64-1e15-74b4-59c807bce0b9@collabora.com>
 <Ynkb1U2nNWYPML88@phenom.ffwll.local>
 <5fdf5232-e2b2-b444-5a41-f1db7e6a04da@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5fdf5232-e2b2-b444-5a41-f1db7e6a04da@collabora.com>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Dmitry Osipenko <digetx@gmail.com>,
 Steven Price <steven.price@arm.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 virtualization@lists.linux-foundation.org,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Emil Velikov <emil.l.velikov@gmail.com>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 10, 2022 at 04:47:52PM +0300, Dmitry Osipenko wrote:
> On 5/9/22 16:49, Daniel Vetter wrote:
> > On Fri, May 06, 2022 at 03:10:43AM +0300, Dmitry Osipenko wrote:
> >> On 5/5/22 11:34, Thomas Zimmermann wrote:
> >>> Hi
> >>>
> >>> Am 18.04.22 um 00:37 schrieb Dmitry Osipenko:
> >>>> Introduce a common DRM SHMEM shrinker. It allows to reduce code
> >>>> duplication among DRM drivers that implement theirs own shrinkers.
> >>>> This is initial version of the shrinker that covers basic needs of
> >>>> GPU drivers, both purging and eviction of shmem objects are supported.
> >>>>
> >>>> This patch is based on a couple ideas borrowed from Rob's Clark MSM
> >>>> shrinker and Thomas' Zimmermann variant of SHMEM shrinker.
> >>>>
> >>>> In order to start using DRM SHMEM shrinker drivers should:
> >>>>
> >>>> 1. Implement new purge(), evict() + swap_in() GEM callbacks.
> >>>> 2. Register shrinker using drm_gem_shmem_shrinker_register(drm_device).
> >>>> 3. Use drm_gem_shmem_set_purgeable_and_evictable(shmem) and alike API
> >>>>     functions to activate shrinking of GEMs.
> >>>
> >>> Honestly speaking, after reading the patch and the discussion here I
> >>> really don't like where all tis is going. The interfaces and
> >>> implementation are overengineered.  Descisions about evicting and
> >>> purging should be done by the memory manager. For the most part, it's
> >>> none of the driver's business.
> >>
> >> Daniel mostly suggesting to make interface more flexible for future
> >> drivers, so we won't need to re-do it later on. My version of the
> >> interface is based on what drivers need today.
> >>
> >> Why do you think it's a problem to turn shmem helper into the simple
> >> generic memory manager? I don't see how it's better to have drivers
> >> duplicating the exactly same efforts and making different mistakes.
> >>
> >> The shmem shrinker implementation is mostly based on the freedreno's
> >> shrinker and it's very easy to enable generic shrinker for VirtIO and
> >> Panfrost drivers. I think in the future freedreno and other drivers
> >> could switch to use drm shmem instead of open coding the memory management.
> > 
> > Yeah I think we have enough shrinkers all over drm to actually design
> > something solid here.
> > 
> > There's also the i915 shrinker and some kinda shrinker in ttm too. So we
> > are definitely past the "have 3 examples to make sure you design something
> > solid" rule of thumb.
> > 
> > I also have a bit an idea that we could try to glue the shmem shrinker
> > into ttm, at least at a very high level that's something that would make
> > some sense.
> 
> Before gluing the shmem shrinker into ttm, the drivers should be
> switched to ttm? Or do you mean something else by the gluing?

No, drivers which don't need ttm shouldn't be forced to use it.

> Perhaps it should be possible to have a common drm-shrinker helper that
> will do the basic-common things like tracking the eviction size and
> check whether BO is exported or locked, but we shouldn't consider doing
> this for now. For the starter more reasonable should be to create a
> common shrinker base for drivers that use drm-shmem, IMO.

Yeah that might be the more practical approach. But really this was just
an aside, absolutely no need to worry about this for now. I just wanted to
point out that there really is a lot of use for this.

> >>> I'd like to ask you to reduce the scope of the patchset and build the
> >>> shrinker only for virtio-gpu. I know that I first suggested to build
> >>> upon shmem helpers, but it seems that it's easier to do that in a later
> >>> patchset.
> >>
> >> The first version of the VirtIO shrinker didn't support memory eviction.
> >> Memory eviction support requires page fault handler to be aware of the
> >> evicted pages, what should we do about it? The page fault handling is a
> >> part of memory management, hence to me drm-shmem is already kinda a MM.
> > 
> > Hm I still don't get that part, why does that also not go through the
> > shmem helpers?
> 
> The drm_gem_shmem_vm_ops includes the page faults handling, it's a
> helper by itself that is used by DRM drivers.
> 
> I could try to move all the shrinker logic to the VirtIO and re-invent
> virtio_gem_shmem_vm_ops, but what is the point of doing this for each
> driver if we could have it once and for all in the common drm-shmem code?
> 
> Maybe I should try to factor out all the shrinker logic from drm-shmem
> into a new drm-shmem-shrinker that could be shared by drivers? Will you
> be okay with this option?

I think we're talking past each another a bit. I'm only bringing up the
purge vs eviction topic we discussed in the other subthread again.

> > I'm still confused why drivers need to know the difference
> > between evition and purging. Or maybe I'm confused again.
> 
> Example:
> 
> If userspace uses IOV addresses, then these addresses must be kept
> reserved while buffer is evicted.
> 
> If BO is purged, then we don't need to retain the IOV space allocated
> for the purged BO.

Yeah but is that actually needed by anyone? If userspace fails to allocate
another bo because of lack of gpu address space then it's very easy to
handle that:

1. Make a rule that "out of gpu address space" gives you a special errno
code like ENOSPC

2. If userspace gets that it walks the list of all buffers it marked as
purgeable and nukes them (whether they have been evicted or not). Then it
retries the bo allocation.

Alternatively you can do step 2 also directly from the bo alloc ioctl in
step 1. Either way you clean up va space, and actually a lot more (you
potentially nuke all buffers marked as purgeable, not just the ones that
have been purged already) and only when va cleanup is actually needed

Trying to solve this problem at eviction time otoh means:
- we have this difference between eviction and purging
- it's still not complete, you still need to glue step 2 above into your
  driver somehow, and once step 2 above is glued in doing additional
  cleanup in the purge function is just duplicated logic

So at least in my opinion this isn't the justification we need. And we
should definitely not just add that complication "in case, for the
future", if we don't have a real need right now. Adding it later on is
easy, removing it later on because it just gets in the way and confuses is
much harder.

> The drm-shmem only handles shmem pages, not the mappings of these pages.

Yeah that's why you need an evict callback into the driver. That part is
clear.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
