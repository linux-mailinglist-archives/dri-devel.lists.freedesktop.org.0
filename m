Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 565AAA2DAA5
	for <lists+dri-devel@lfdr.de>; Sun,  9 Feb 2025 04:38:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2DE110E428;
	Sun,  9 Feb 2025 03:38:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ZUBMuD0r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65B6110E1ED
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Feb 2025 03:38:22 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-543d8badc30so3752630e87.0
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Feb 2025 19:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739072301; x=1739677101; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Z/6yPVhvzSQt8FpEj+34A3KYWg9MIBUILVNRXOHt7zM=;
 b=ZUBMuD0rUASNWyXuCMJGv0og58FF8FVCzXzYaxBhbPk0u8o3EDgY1v/eWHBvw5GoAy
 X+t6VPNQ+rayX+ChI5eFc/TlfQCh7LtDafVVguTtq2pfvp/0Fs0Rln7rtB4s2XIISBFE
 8KRraI9VLLtyhAyKWsF3VToyebMCiAd+jfT4l0eGWWJ/Nyi4I6kcGh/DBTcF4eQ+28jm
 j1DEfhVwlAkQEOrg4xAnCKQAi1McHWdWWZiRO6OeqtGI9Ajb1cmyzo0CF8vaAA7RS+UC
 g6WIyrEdjYHRZqylSUPJOY4SpqPZuC+2L7sA3mGBVZRRGupnH5y4wLVFCUueT3ryvt2N
 CFqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739072301; x=1739677101;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z/6yPVhvzSQt8FpEj+34A3KYWg9MIBUILVNRXOHt7zM=;
 b=PikmztNbrFlrj3qU7MAlnJ7D/3Zhabflw0BFRT4Ym7gahtXsFFsICuLX7MQ5gAKgP5
 GIlcRKNu2XmrRD5+on231iXSdma/eAFCUn+teyfZN7kMVH5E2GdWjy9itDTAgfhIm4c7
 z2rnOHh9l2vSAK1mKVIaOWxt4/UxTDSJNunt0bgKe2WPzjPVFLfFp8w6ugOnV97AfhqF
 FtyUUDPhCFAjZWmJXS4yU8FhPYmEz4zRo4iRWMwAiL3VnS4uMAC5PVhD4bvkVT9JyrtT
 YSWTHinq0yGlE8IN/MxBVYaUSSVLIBsy4/Lcex3aIWffYwC/LoOCwSQVVItfSLyCIJRy
 N1ow==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMjJz0r8zmv/N8tvrzR9u1qmwakVXDMKOdrxiyG/Za8cBDUZf1hHDoHGyYf4upXj/4nksLeoNwJbI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyL7I9aeFbVHVWAkk1Mhn8lMbn0B/Rjd8x8CQqm/Y7AiC81RkZ9
 wsugMWdyk2kL/2ffhePUZBlT6RMEhqqJz6xTeEZIppQR6zF+RieS285Niuh30hw=
X-Gm-Gg: ASbGncsSFDUm0xbEQwQeHyLOPNdurCDnjXuM14E2WAArwM7Q+nj6NhNOzDsTFI79P/M
 pHNuL0a5VXnIXnKHZ0GWH37ggrqVeh036m8e+zESok07+/t4XPav41zzRnO8kSwRqbVKYB77Upn
 wFtK67ATkLiUJPqCsDIQsYl3612eB9rFAwF6K+nO7GAjisP38ajtdCaB7RuglGPf4HZxxmZdvLp
 MLdPTTpPMhwXnVfyeFZD/mErOS7lYv0G3SY9FO295uqKwVZnBI9wM7a5LXQkS1McqMTG1mmYsUK
 WyI0SU3dpZBZjmxpqUkT17WUEqHP47ptRVbnbXAY6+pI6a50sELZo+77fDgVIHgakagWjrM=
X-Google-Smtp-Source: AGHT+IES07fxPyHCztfsqpUU3ib0W9GV8knyWCON3WWXjJGQPwrMdTFe5n+ZQFCrewVIai6KclkWWw==
X-Received: by 2002:a05:6512:108d:b0:540:2a92:7da9 with SMTP id
 2adb3069b0e04-54414ab5605mr2768060e87.21.1739072300614; 
 Sat, 08 Feb 2025 19:38:20 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5450a64ea2dsm39590e87.14.2025.02.08.19.38.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2025 19:38:20 -0800 (PST)
Date: Sun, 9 Feb 2025 05:38:17 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH RFC 0/7] drm/display: dp: add new DPCD access functions
Message-ID: <pxcgcutzjjge6ruw5hobg6jkfqozhtlvbhdlmyazesbi4aipj2@enepqlcvjruw>
References: <20250117-drm-rework-dpcd-access-v1-0-7fc020e04dbc@linaro.org>
 <ctla3nt6o3osdxek63zyidyuofzgq3mgshh2azong3ntcqevhi@3rrzr3hrzbor>
 <87r04tn8is.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87r04tn8is.fsf@intel.com>
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

On Thu, Jan 23, 2025 at 12:12:43PM +0200, Jani Nikula wrote:
> On Thu, 23 Jan 2025, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> > On Fri, Jan 17, 2025 at 10:56:35AM +0200, Dmitry Baryshkov wrote:
> >> Existing DPCD access functions return an error code or the number of
> >> bytes being read / write in case of partial access. However a lot of
> >> drivers either (incorrectly) ignore partial access or mishandle error
> >> codes. In other cases this results in a boilerplate code which compares
> >> returned value with the size.
> >> 
> >> As suggested by Jani implement new set of DPCD access helpers, which
> >> ignore partial access, always return 0 or an error code. Reimplement
> >> existing helpers using the new functions to ensure backwards
> >> compatibility.
> >> 
> >> This series targets only the DRM helpers code. If the approach is found
> >> to be acceptable, each of the drivers should be converted on its own.
> >
> > Gracious ping for the series, it's been posted a week ago.
> 
> It's a bit of a bummer the names become longer. I don't have a better
> suggestion, though.
> 
> I do like it that the error handling becomes easier and more uniform
> overall, and this actually fixes many places that only checked for < 0
> with the old functions.
> 
> I glanced through the series, I didn't spot anything obviously wrong,
> but didn't do a thorough review either. I can do once we have wider
> buy-in for the idea in general, so the effort won't be wasted.
> 
> For now,
> 
> Acked-by: Jani Nikula <jani.nikula@intel.com>

Is it okay to merge this? I'd prefer to have comments from other
developers / maintainers, so that it doesn't become a controversial
change.

> >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >> ---
> >> Dmitry Baryshkov (7):
> >>       drm/display: dp: change drm_dp_dpcd_read_link_status() return
> >>       drm/display: dp: implement new access helpers
> >>       drm/display: dp: use new DCPD access helpers
> >>       drm/display: dp-aux-dev: use new DCPD access helpers
> >>       drm/display: dp-cec: use new DCPD access helpers
> >>       drm/display: dp-mst-topology: use new DCPD access helpers
> >>       drm/display: dp-tunnel: use new DCPD access helpers
> >> 
> >>  drivers/gpu/drm/display/drm_dp_aux_dev.c      |  12 +-
> >>  drivers/gpu/drm/display/drm_dp_cec.c          |  37 ++-
> >>  drivers/gpu/drm/display/drm_dp_helper.c       | 345 +++++++++++---------------
> >>  drivers/gpu/drm/display/drm_dp_mst_topology.c | 132 +++++-----
> >>  drivers/gpu/drm/display/drm_dp_tunnel.c       |  20 +-
> >>  drivers/gpu/drm/msm/dp/dp_ctrl.c              |  45 ++--
> >>  drivers/gpu/drm/msm/dp/dp_link.c              |  17 +-
> >>  include/drm/display/drm_dp_helper.h           |  81 +++++-
> >>  include/drm/display/drm_dp_mst_helper.h       |  10 +-
> >>  9 files changed, 354 insertions(+), 345 deletions(-)
> >> ---
> >> base-commit: 440aaf479c9aaf5ecea9a463eb826ec243d5f1cf
> >> change-id: 20241231-drm-rework-dpcd-access-b0fc2e47d613
> >> 
> >> Best regards,
> >> -- 
> >> Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >> 
> 
> -- 
> Jani Nikula, Intel

-- 
With best wishes
Dmitry
