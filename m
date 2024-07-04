Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9112927940
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2024 16:49:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE43E10EAF3;
	Thu,  4 Jul 2024 14:49:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="RhKlzZGg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06EDA10EB2D
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2024 14:49:32 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-42111cf2706so872425e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jul 2024 07:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1720104570; x=1720709370; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=qHLHjgaSiLGDRYFOFGrFs3M++jTz8zi1A40skIzHANk=;
 b=RhKlzZGg+eaKClXs+RKc6DlqFDe4HVPiDj0aPxrMS/2c5CAxLeukgyBve0xzNmFDG8
 1nKKoQ0FjfXZg//r+7BDCgGJAjrC38ncS07rEB1p8miPKax6CVEAlxnlk7Y5F6U8bahO
 0OPy+whVjnPZNZ92m6mgRNxerViCyhw/tz15U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720104570; x=1720709370;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qHLHjgaSiLGDRYFOFGrFs3M++jTz8zi1A40skIzHANk=;
 b=YHOEVprwGNN4haO8vE9p0tpfrjWlfypaAQopOaUqjMVBsEJLhU4pTvUtgzpMlS3rPx
 3pSdtNf1kSFbMWuYPPH+yJEjPGwGM2EZHiQ+JPpcJpnlG2SXfELjpYJYcS/07ohUwEd3
 UXz2h+q6hqFQpwOKdS8VJOu0cEHiEVfVhkugYuJ63XO9adqWFGM2JAVNRuPy7DlQWsoP
 frdDiHyDGOkLRwuDMdvjdhvL4f3ASuTaRWnXlklB2G181gCWqqZzfGQr0xz/kxqHGnaI
 JNSuropxikRvo8rFLqVeR3vRmcna3AefiFy4oYxWJGoM11r7f6Z9BzOVY781l/5KPzsJ
 mnbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRq5E0U/piteq53rnyooYpd04XfYphUaf5jG3HM/PxrlsMaZN6ET6hD6SzU6rG4kNgrri9jABQnPS+adRPByCjydHF4mtAQ005DhPmi1Me
X-Gm-Message-State: AOJu0YxyNT+1kGROXkfzXIeSjSPOFrTYiHI3bsy1mYc7I1K9Tywf0Cu/
 Gam5gD8suV/uyRw0df2Q9PUz6DotihsZ0r9VJRAYQkqVThzQiGw7L7U//Np2AQs=
X-Google-Smtp-Source: AGHT+IGw7PjV6PPlXJeqFqUqJH3xf2XS9KiwaMpjlZbjFidEaTrKHxiQw+YsqtpXH6No7B+sgcMjgA==
X-Received: by 2002:a05:600c:310b:b0:425:65b1:abb4 with SMTP id
 5b1f17b1804b1-4264a36e596mr14286505e9.0.1720104570203; 
 Thu, 04 Jul 2024 07:49:30 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4264a1f18c7sm26939495e9.23.2024.07.04.07.49.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jul 2024 07:49:29 -0700 (PDT)
Date: Thu, 4 Jul 2024 16:49:27 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>,
 dim-tools@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PULL] drm-misc-fixes
Message-ID: <Zoa2dyfM33W9T8kf@phenom.ffwll.local>
References: <ffba0c63-2798-40b6-948d-361cd3b14e9f@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ffba0c63-2798-40b6-948d-361cd3b14e9f@linux.intel.com>
X-Operating-System: Linux phenom 6.8.9-amd64 
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

On Thu, Jul 04, 2024 at 02:27:58PM +0200, Maarten Lankhorst wrote:
> Hi Dave, Sima,
> 
> A nicely filled fixes tree just for you! And the rest of the world!
> 
> Cheers,
> ~Maarten
> 
> drm-misc-fixes-2024-07-04:
> drm-misc-fixes for v6.10-rc7:
> - Add panel quirks.
> - Firmware sysfb refcount fix.
> - Another null pointer mode deref fix for nouveau.
> - Panthor sync and uobj fixes.
> - Fix fbdev regression since v6.7.
> - Delay free imported bo in ttm to fix lockdep splat.
> The following changes since commit 66edf3fb331b6c55439b10f9862987b0916b3726:
> 
>   drm/nouveau/dispnv04: fix null pointer dereference in nv17_tv_get_ld_modes (2024-06-25 15:30:50 -0400)
> 
> are available in the Git repository at:
> 
>   https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-2024-07-04
> 
> for you to fetch changes up to d99fbd9aab624fc030934e21655389ab1765dc94:
> 
>   drm/ttm: Always take the bo delayed cleanup path for imported bos (2024-07-04 09:22:04 +0200)

Pulled, thanks.
-Sima

> 
> ----------------------------------------------------------------
> drm-misc-fixes for v6.10-rc7:
> - Add panel quirks.
> - Firmware sysfb refcount fix.
> - Another null pointer mode deref fix for nouveau.
> - Panthor sync and uobj fixes.
> - Fix fbdev regression since v6.7.
> - Delay free imported bo in ttm to fix lockdep splat.
> 
> ----------------------------------------------------------------
> Boris Brezillon (2):
>       drm/panthor: Don't check the array stride on empty uobj arrays
>       drm/panthor: Fix sync-only jobs
> 
> John Schoenick (1):
>       drm: panel-orientation-quirks: Add quirk for Valve Galileo
> 
> Ma Ke (1):
>       drm/nouveau: fix null pointer dereference in nouveau_connector_get_modes
> 
> Matthew Schwartz (1):
>       drm: panel-orientation-quirks: Add labels for both Valve Steam Deck revisions
> 
> Thomas Hellström (1):
>       drm/ttm: Always take the bo delayed cleanup path for imported bos
> 
> Thomas Huth (1):
>       drm/fbdev-generic: Fix framebuffer on big endian devices
> 
> Thomas Zimmermann (1):
>       firmware: sysfb: Fix reference count of sysfb parent device
> 
>  drivers/firmware/sysfb.c                       | 12 ++++---
>  drivers/gpu/drm/drm_fbdev_generic.c            |  3 +-
>  drivers/gpu/drm/drm_panel_orientation_quirks.c |  9 +++++-
>  drivers/gpu/drm/nouveau/nouveau_connector.c    |  3 ++
>  drivers/gpu/drm/panthor/panthor_drv.c          |  6 ++--
>  drivers/gpu/drm/panthor/panthor_sched.c        | 44 +++++++++++++++++++-------
>  drivers/gpu/drm/ttm/ttm_bo.c                   |  1 +
>  include/uapi/drm/panthor_drm.h                 |  5 +++
>  8 files changed, 63 insertions(+), 20 deletions(-)

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
