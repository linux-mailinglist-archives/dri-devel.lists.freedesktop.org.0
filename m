Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB0E90EA2C
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 13:57:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FDC910EC5F;
	Wed, 19 Jun 2024 11:57:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="klr34nXX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4552D10EC5B;
 Wed, 19 Jun 2024 11:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718798233; x=1750334233;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=98v0QsjuhOFlSgXs59YI6oLQih9ErGbd498Z59dGdvY=;
 b=klr34nXXkQKUgGbNSCnWKPAZ/xGX+R9020XladBomZQvQT09tep1424P
 BOkJtm5mKHMNgml6onqlKTOhMUjGuk6f6k4Jj9jBna4nRBQ5v49RbPP8d
 K/z9IjqADkH2iPrS3HkVGMDOVcfwJWgtF40BB037TtfQ/IQcxvogHuAq2
 u4ScHc0c/FJ7eW5FZsqezyqx4zUBNkqRgBEomlu1KDLMee+8oxsrg/ZXR
 e+yI64KHwYZz4QVDfMzEL786Q6EGnigiqLXta+bU8LUZu6QTfaPN7M4aw
 761vo6M2QXOffmcrw2xlQIAmeIGACHHT3PkxKSLUC2/8aCsuDAbyfwsfZ w==;
X-CSE-ConnectionGUID: DCOqKo/5QO6j7NAvScnScw==
X-CSE-MsgGUID: ftk1PxLJQEGoA33EeHtWUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="33278888"
X-IronPort-AV: E=Sophos;i="6.08,250,1712646000"; d="scan'208";a="33278888"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 04:57:12 -0700
X-CSE-ConnectionGUID: tac/HbubTq2gjwPROTUcRQ==
X-CSE-MsgGUID: ZLRsZ1yhTtWEXmZuK6lYZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,250,1712646000"; d="scan'208";a="41851288"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 19 Jun 2024 04:57:04 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 19 Jun 2024 14:57:03 +0300
Date: Wed, 19 Jun 2024 14:57:03 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 kernel-dev@igalia.com, Melissa Wen <mwen@igalia.com>,
 alexander.deucher@amd.com, christian.koenig@amd.com,
 Simon Ser <contact@emersion.fr>,
 Pekka Paalanen <ppaalanen@gmail.com>, daniel@ffwll.ch,
 Daniel Stone <daniel@fooishbar.org>,
 'Marek =?utf-8?B?T2zFocOhayc=?= <maraeo@gmail.com>,
 Dave Airlie <airlied@gmail.com>, Xaver Hugl <xaver.hugl@gmail.com>,
 Joshua Ashton <joshua@froggi.es>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel.daenzer@mailbox.org>,
 Sam Ravnborg <sam@ravnborg.org>, Boris Brezillon <bbrezillon@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH v6 0/8] drm: Support per-plane async flip configuration
Message-ID: <ZnLHj6riPiqVNc2T@intel.com>
References: <20240614153535.351689-1-andrealmeid@igalia.com>
 <lxfxqbax6azdpeamwm2qqv2tulgxrb7y3qzb4ir4myt6x5sqez@imd3yd5mbk7u>
 <ea501920-7319-46f4-98ca-cea412abf8a9@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ea501920-7319-46f4-98ca-cea412abf8a9@igalia.com>
X-Patchwork-Hint: comment
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

On Fri, Jun 14, 2024 at 04:37:41PM -0300, André Almeida wrote:
> Hi Dmitry,
> 
> Em 14/06/2024 14:32, Dmitry Baryshkov escreveu:
> > On Fri, Jun 14, 2024 at 12:35:27PM GMT, André Almeida wrote:
> >> AMD hardware can do async flips with overlay planes, but currently there's no
> >> easy way to enable that in DRM. To solve that, this patchset creates a new
> >> drm_plane field, bool async_flip, that allows drivers to choose which plane can
> >> or cannot do async flips. This is latter used on drm_atomic_set_property when
> >> users want to do async flips.
> >>
> >> Patch 1 allows async commits with IN_FENCE_ID in any driver.
> >>
> >> Patches 2 to 7 have no function change. As per current code, every driver that
> >> allows async page flips using the atomic API, allows doing it only in the
> >> primary plane. Those patches then enable it for every driver.
> >>
> >> Patch 8 finally enables async flip on overlay planes for amdgpu.
> >>
> >> Changes from v5:
> >> - Instead of enabling plane->async_flip in the common code, move it to driver
> >> code.
> >> - Enable primary plane async flip on every driver
> >> https://lore.kernel.org/dri-devel/20240612193713.167448-1-andrealmeid@igalia.com/
> >>
> >> André Almeida (8):
> >>    drm/atomic: Allow userspace to use explicit sync with atomic async
> >>      flips
> >>    drm: Support per-plane async flip configuration
> >>    drm/amdgpu: Enable async flips on the primary plane
> >>    drm: atmel-hlcdc: Enable async flips on the primary plane
> >>    drm/i915: Enable async flips on the primary plane
> >>    drm/nouveau: Enable async flips on the primary plane
> >>    drm/vc4: Enable async flips on the primary plane
> >>    drm/amdgpu: Make it possible to async flip overlay planes
> >>
> >>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c | 2 ++
> >>   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c         | 3 +++
> >>   drivers/gpu/drm/drm_atomic_uapi.c                       | 8 +++++---
> >>   drivers/gpu/drm/i915/display/i9xx_plane.c               | 3 +++
> >>   drivers/gpu/drm/nouveau/dispnv04/crtc.c                 | 4 ++++
> >>   drivers/gpu/drm/nouveau/dispnv50/wndw.c                 | 4 ++++
> >>   drivers/gpu/drm/vc4/vc4_plane.c                         | 4 +++-
> > 
> > The main question is why only these drivers were updated.
> > 
> 
> According to `git grep async_page_flip`, only those drivers supports 
> async page flip. The only corner case is radeon, that does supports 
> async but doesn't support planes.

The primary plane will alwyas exist (drm_crtc_init() will create
one for the old drivers that don't do it explicitly). So you
should be able to convert radeon as well. And looks like some
pre-dc amdgpu stuff is in a similar situation.

That should presumably allow the old flag to be removed entirely?
Hmm, I suppose drm_getcap() would need a bit of work to eg. go
through all the planes to see if any of them support async flips.

> 
> Do you know any other driver that should be updated to?
> 
> >>   include/drm/drm_plane.h                                 | 5 +++++
> >>   8 files changed, 29 insertions(+), 4 deletions(-)
> >>
> >> -- 
> >> 2.45.2
> >>
> > 

-- 
Ville Syrjälä
Intel
