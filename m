Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F9DCB066C
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 16:30:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FB3C10E1F9;
	Tue,  9 Dec 2025 15:30:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="UDKFsCQM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19E2410E1F1;
 Tue,  9 Dec 2025 15:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1765294218;
 bh=n/AdBi9KtuU5iHeHvrn0lmofFQSHMzMoucKGcO8QV/U=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=UDKFsCQMsPx82V2aH3nVGLqxErguySCC3vhN5wUFYpVEGIuv2uwtN+T1iRvnvKLqU
 T4owPvCF3Qo4GDn7NPMwAAGiT9rRDATfRivFh82ccbvHBHtijmoKEG1dz2OlBiQ/df
 Y1QtTqUSSMhaXaz/IwP3YY0Ljiu7Nm/ERrksxxY5Vlqk8sMiV2CbX/L+X2r2/xCE6x
 XDf8wc9sdYqOTy6b6fUzT/+rFBcnPB97Shuh5xgTmVU8xvJIbQUs2BMoJDFCfyd67O
 j/o91WZNooTZ9jpYdn9kN2rio/yKYMYLBaQ9GrJ46xM6/36OG9EaG9DejqjrEIZKun
 yMl2tdcnGWOxg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 9DE5A17E1135;
 Tue,  9 Dec 2025 16:30:17 +0100 (CET)
Date: Tue, 9 Dec 2025 16:30:11 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: simona@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, ogabbay@kernel.org, mamin506@gmail.com,
 lizhi.hou@amd.com, maciej.falkowski@linux.intel.com,
 karol.wachowski@linux.intel.com, tomeu@tomeuvizoso.net,
 frank.binns@imgtec.com, matt.coster@imgtec.com, yuq825@gmail.com,
 robh@kernel.org, steven.price@arm.com, adrian.larumbe@collabora.com,
 liviu.dudau@arm.com, mwen@igalia.com, kraxel@redhat.com,
 dmitry.osipenko@collabora.com, gurchetansingh@chromium.org,
 olvaffe@gmail.com, corbet@lwn.net, dri-devel@lists.freedesktop.org,
 lima@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-doc@vger.kernel.org
Subject: Re: [RFC][PATCH 00/13] drm: Introduce GEM-UMA memory management
Message-ID: <20251209163011.436e613b@fedora>
In-Reply-To: <2b95d76e-2672-4cae-a545-73c407f2b20c@suse.de>
References: <20251209140141.94407-1-tzimmermann@suse.de>
 <20251209152734.6851f3ac@fedora>
 <2b95d76e-2672-4cae-a545-73c407f2b20c@suse.de>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Tue, 9 Dec 2025 15:51:21 +0100
Thomas Zimmermann <tzimmermann@suse.de> wrote:

> Hi
> 
> Am 09.12.25 um 15:27 schrieb Boris Brezillon:
> > On Tue,  9 Dec 2025 14:41:57 +0100
> > Thomas Zimmermann <tzimmermann@suse.de> wrote:
> >  
> >> Duplicate GEM-SHMEM to GEM-UMA. Convert all DRM drivers for UMA
> >> systems if they currently use GEM-SHMEM.
> >>
> >> Many DRM drivers for hardware with Unified Memory Architecture (UMA)
> >> currently builds upon GEM-SHMEM and extends the helpers with features
> >> for managing the GPU MMU. This allows the GPU to access the GEM buffer
> >> content for its operation.
> >>
> >> There is another, larger, set of DRM drivers that use GEM-SHMEM merely
> >> as buffer management with no hardware support. These drivers copy the
> >> buffer content to the GPU on each page flip. The GPU itself has no direct
> >> access. Hardware of this type is usually in servers, behind slow busses
> >> (SPI, USB), or provided by firmware (drivers in sysfb/).
> >>
> >> After some discussion with Boris on the future of GEM-SHMEM, it seems
> >> to me that both use cases more and more diverge from each other. The
> >> most prominent example is the implementation of gem_prime_import,
> >> where both use cases use distinct approaches.
> >>
> >> So we discussed the introduction of a GEM-UMA helper library for
> >> UMA-based hardware. GEM-UMA will remain flexible enough for drivers
> >> to extend it for their use case. GEM-SHMEM will become focused on the
> >> simple-hardware use case. The benefit for both libraries is that they
> >> will be easier to understand and maintain. GEM-SHMEM can be simplified
> >> signiifcantly, I think.
> >>
> >> This RFC series introduces GEM-UMA and converts the UMA-related drivers.
> >>
> >> Patches 1 and 2 fix issues in GEM-SHMEM, so that we don't duplicate
> >> errornous code.
> >>
> >> Patch 3 copies GEM-SHMEM to GEM-UMA. Patch 4 then does soem obvious
> >> cleanups of unnecessary code.  
> > Instead of copying the code as-is, I'd rather take a step back and think
> > about what we need and how we want to handle more complex stuff, like
> > reclaim. I've started working on a shrinker for panthor [1], and as part
> > of this series, I've added a commit implementing just enough to replace
> > what gem-shmem currently provides. Feels like the new GEM-UMA thing
> > could be designed on a composition rather than inheritance model,
> > where we have sub-components (backing, cpu_map, gpu_map) that can be
> > pulled in and re-used by the driver implementation. The common helpers
> > would take those sub-components instead of a plain GEM object. That
> > would leave the drivers free of how their internal gem_object fields are
> > laid out and wouldn't require overloading the ->gem_create_object()
> > function. It seems to be that it would better match the model you were
> > describing the other day.  
> 
> Yeah, I've seen your update to that series. Making individual parts of 
> the memory manager freely composable with each other is a fine idea.
> 
> But the flipside is that I also want the simple drivers to move away 
> from the flexible approach that GEM-SHMEM currently takes. There are 
> many drivers that do not need or want that. These drivers benefit from 
> something that is self contained. Many of the drivers are also hardly 
> maintained, so simplifying things will also be helpful.
> 
> I could have added a new GEM implementation for these drivers, but there 
> are less UMA drivers to convert and the GEM-UMA naming generally fits 
> better than GEM-SHMEM.
> 
> I'd rather have GEM-UMA and evolve it from where it stands now; and also 
> evolve GEM-SHMEM in a different direction. There's a difference in 
> concepts here.

Problem is, we'll be stuck trying to evolve gem-uma to something
cleaner because of the existing abuse of gem-shmem that you're moving
to gem-uma, so I'm not sure I like the idea to be honest. I'm all for
this gem-uma thing, but I'm not convinced rushing it in is the right
solution.
