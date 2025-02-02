Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A30F5A24F88
	for <lists+dri-devel@lfdr.de>; Sun,  2 Feb 2025 19:53:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC99910E28A;
	Sun,  2 Feb 2025 18:53:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TsgzfNA8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E89B810E28A;
 Sun,  2 Feb 2025 18:53:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 35693A403C6;
 Sun,  2 Feb 2025 18:52:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05599C4CED1;
 Sun,  2 Feb 2025 18:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738522434;
 bh=xi3bO7S2ctfq9CEqzObd0qQ5CN0JdI6OGFQ7/NUZ6oI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TsgzfNA8ya7QtUsehA3eVGLqliTdcdpqsi4vkL+w8DTAdc+bXUSnTt6WmjOPI33wS
 CQ/E24ywE4WROIzdN6iXBe/XDLYA4MF9TdgWXBw7x5EuLKyFbEKrAmECF4DC9Ksbvu
 xwuBhhH1dZNy9pfm3Q9Q75+Piz2XovVofQ4j+CZ7rZwCzqVSGih1Ld43g2Kkb66Kl7
 fl/R3ohwjrWeSdP6gzzT1Lho6rSISTlEn0vrv25RZ1iGfAVZbBbhsmFibx5vmglCWX
 94oisaMm+MKCTDnrNnksaREROgXxhjDf+YhDd6yBhgk7UjLcGgRoezBg2VYrMVbbBS
 /ZkCdT5OHR+zQ==
Date: Sun, 2 Feb 2025 19:53:47 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Asahi Lina <lina@asahilina.net>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 asahi@lists.linux.dev
Subject: Re: [PATCH 0/4] drm/gpuvm: Add support for single-page-filled mappings
Message-ID: <Z5-_O8vkCO0LXcl7@pollux.localdomain>
References: <20250202-gpuvm-single-page-v1-0-8cbd44fdcbd4@asahilina.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250202-gpuvm-single-page-v1-0-8cbd44fdcbd4@asahilina.net>
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

Hi Lina,

On Sun, Feb 02, 2025 at 10:34:49PM +0900, Asahi Lina wrote:
> Some hardware requires dummy page mappings to efficiently implement
> Vulkan sparse features. These mappings consist of the same physical
> memory page, repeated for a large range of address space (e.g. 16GiB).
> 
> Add support for this to drm_gpuvm. Currently, drm_gpuvm expects BO
> ranges to correspond 1:1 to virtual memory ranges that are mapped, and
> does math on the BO offset accordingly. To make single page mappings
> work, we need a way to turn off that math, keeping the BO offset always
> constant and pointing to the same page (typically BO offset 0).
> 
> To make this work, we need to handle all the corner cases when these
> mappings intersect with regular mappings. The rules are simply to never
> mix or merge a "regular" mapping with a single page mapping.
> 
> drm_gpuvm has support for a flags field in drm_gpuva objects. This is
> normally managed by drivers directly. We can introduce a
> DRM_GPUVA_SINGLE_PAGE flag to handle this. However, to make it work,
> sm_map and friends need to know ahead of time whether the new mapping is
> a single page mapping or not. Therefore, we need to add an argument to
> these functions so drivers can provide the flags to be filled into
> drm_gpuva.flags.
> 
> These changes should not affect any existing drivers that use drm_gpuvm
> other than the API change:
> 
> - imagination: Does not use flags at all
> - nouveau: Only uses drm_gpuva_invalidate(), which is only called on
>   existing drm_gpuva objects (after the map steps)
> - panthor: Does not use flags at all
> - xe: Does not use drm_gpuva_init_from_op() or
>   drm_gpuva_remap()/drm_gpuva_map() (which call it). This means that the
> flags field of the gpuva object is managed by the driver only, so these
> changes cannot clobber it.
> 
> Note that the way this is implemented, drm_gpuvm does not need to know
> the GPU page size. It only has to never do math on the BO offset to meet
> the requirements.
> 
> I suspect that after this change there could be some cleanup possible in
> the xe driver (which right now passes flags around in various
> driver-specific ways from the map step through to drm_gpuva objects),
> but I'll leave that to the Xe folks.
> 
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> ---
> Asahi Lina (4):
>       drm/gpuvm: Add a flags argument to drm_gpuvm_sm_map[_*]
>       drm/gpuvm: Plumb through flags into drm_gpuva_op_map
>       drm/gpuvm: Add DRM_GPUVA_SINGLE_PAGE flag and logic
>       drm/gpuvm: Plumb through flags into drm_gpuva_init

Without looking into any details yet:

This is a bit of tricky one, since we're not even close to having a user for
this new feature upstream yet, are we?

I wonder if we could do an exception by adding some KUnit tests (which
admittedly I never got to) validating things with and without this new feature.

Speaking of tests, how did you validate this change to validate the behavior
without DRM_GPUVA_SINGLE_PAGE?

- Danilo
