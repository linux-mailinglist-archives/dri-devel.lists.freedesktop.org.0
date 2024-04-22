Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0978ACE28
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 15:28:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0B69112AC9;
	Mon, 22 Apr 2024 13:28:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="b+2JGUpF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB9D6112AC9
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 13:28:09 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-51967f75729so5027328e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 06:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713792487; x=1714397287; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=XX6Rj3ViyKFJRZt9TUxrdPILzpKRJIFwxHEizIAbiXA=;
 b=b+2JGUpFt4d3khN0bL4mLbRNfUD8rBzya7I+hxNfSNxkvMcxRb/2y0RRi5ctvQ3iqU
 m4+bF7dDVGjYCEI9h211rouC4PZ2NMcQtFsXIWtC+BEKOPlg882GqThmPSfIePzZ+6TP
 M6JgfpT2gZpgubu7c+0JWx/WjUUZTZS5E8lDteSuBYp9EXQcRoGSmJ+oJoRHl1VX9/2o
 iux7HTNytGJnMCvN5st5bapJxRQrATt2+2CjiZQhrfcHs/LkkE+BqRtWAkU2a22J2GTY
 2sg9WL9UAXJ6A5Cy8gwhyi3wr0+AHKGxQKCwNMvvo+/Ght4Pw4T0YERJBiVYl97Z0ccX
 rCTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713792487; x=1714397287;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XX6Rj3ViyKFJRZt9TUxrdPILzpKRJIFwxHEizIAbiXA=;
 b=OZ6wSeIcpf3t4mY2vVrPdJakQdt8o57VkITn1xaX+dxSREywyANUsOZRfwJM9rwFjy
 hfA33jjUakyJmmrn+2nMrho/IJ43RkFmc1BCdDV2kA+c9+dxhFbL7vLf1D/PTqpIriDp
 HQGKzED5Absgolq4kxftJ5ZIt6WDI58sd5uDQNLAQi/Pk+lCrWaD5kdK18yizb4KCfuX
 YAzys7pAE+h0jN6v7u672Bf9pHT2kxKxi+wM87jcFSwJQrGuhbgaiJPE+/POXeznyasx
 AQ/MKXHC6jdvdCWekrwBuv06bnZ5Sg7H6wY4hJARm17eSV/dWJwgkpekajelFOYIizdh
 R4jg==
X-Gm-Message-State: AOJu0Yy7ztcC0QMfBwcEzkmz0Jbk0tCcB4gJ8FAGxXl3fCF2ek+K0h1h
 kJPbjak89zw2ukV63r+xsIGiSiawyN48lVz4e+XOjwel6VWDIHx3ib6owi64/y4=
X-Google-Smtp-Source: AGHT+IGDPvlMItNcQnL6SP1fEpUFzqwGmerZ0Fb6TEO3t0LlL1yYrvPrZIwoPE4t255l4aDeVBBZUQ==
X-Received: by 2002:ac2:4182:0:b0:519:5acc:b114 with SMTP id
 z2-20020ac24182000000b005195accb114mr5630645lfh.45.1713792487411; 
 Mon, 22 Apr 2024 06:28:07 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::8a5])
 by smtp.gmail.com with ESMTPSA id
 y22-20020a0565123f1600b0051b64136e0esm136932lfa.52.2024.04.22.06.28.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 06:28:07 -0700 (PDT)
Date: Mon, 22 Apr 2024 16:28:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>, 
 Oded Gabbay <ogabbay@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Frank Binns <frank.binns@imgtec.com>, 
 Matt Coster <matt.coster@imgtec.com>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@redhat.com>, Alex Deucher <alexander.deucher@amd.com>, 
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, Huang Rui <ray.huang@amd.com>, 
 Zack Rusin <zack.rusin@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH 1/2] drm/print: drop include debugfs.h and include where
 needed
Message-ID: <dgx4grz65pbvne6nt7o5fvklbs6igup7xj4g7ksd6wrsy6hdhn@bunxrngdaq6j>
References: <20240422121011.4133236-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240422121011.4133236-1-jani.nikula@intel.com>
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

On Mon, Apr 22, 2024 at 03:10:10PM +0300, Jani Nikula wrote:
> Surprisingly many places depend on debugfs.h to be included via
> drm_print.h. Fix them.
> 
> v3: Also fix armada, ite-it6505, imagination, msm, sti, vc4, and xe
> 
> v2: Also fix ivpu and vmwgfx
> 
> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
> Acked-by: Maxime Ripard <mripard@kernel.org>
> Link: https://patchwork.freedesktop.org/patch/msgid/20240410141434.157908-1-jani.nikula@intel.com
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> 
> ---
> 
> Cc: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> Cc: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> Cc: Oded Gabbay <ogabbay@kernel.org>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Tvrtko Ursulin <tursulin@ursulin.net>
> Cc: Frank Binns <frank.binns@imgtec.com>
> Cc: Matt Coster <matt.coster@imgtec.com>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> Cc: Karol Herbst <kherbst@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Danilo Krummrich <dakr@redhat.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> Cc: Alain Volmat <alain.volmat@foss.st.com>
> Cc: Huang Rui <ray.huang@amd.com>
> Cc: Zack Rusin <zack.rusin@broadcom.com>
> Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: intel-gfx@lists.freedesktop.org
> Cc: intel-xe@lists.freedesktop.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Cc: amd-gfx@lists.freedesktop.org
> ---
>  drivers/accel/ivpu/ivpu_debugfs.c           | 2 ++
>  drivers/gpu/drm/armada/armada_debugfs.c     | 1 +
>  drivers/gpu/drm/bridge/ite-it6505.c         | 1 +
>  drivers/gpu/drm/bridge/panel.c              | 2 ++
>  drivers/gpu/drm/drm_print.c                 | 6 +++---
>  drivers/gpu/drm/i915/display/intel_dmc.c    | 1 +
>  drivers/gpu/drm/imagination/pvr_fw_trace.c  | 1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 2 ++

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # drm/msm

>  drivers/gpu/drm/nouveau/dispnv50/crc.c      | 2 ++
>  drivers/gpu/drm/radeon/r100.c               | 1 +
>  drivers/gpu/drm/radeon/r300.c               | 1 +
>  drivers/gpu/drm/radeon/r420.c               | 1 +
>  drivers/gpu/drm/radeon/r600.c               | 3 ++-
>  drivers/gpu/drm/radeon/radeon_fence.c       | 1 +
>  drivers/gpu/drm/radeon/radeon_gem.c         | 1 +
>  drivers/gpu/drm/radeon/radeon_ib.c          | 2 ++
>  drivers/gpu/drm/radeon/radeon_pm.c          | 1 +
>  drivers/gpu/drm/radeon/radeon_ring.c        | 2 ++
>  drivers/gpu/drm/radeon/radeon_ttm.c         | 1 +
>  drivers/gpu/drm/radeon/rs400.c              | 1 +
>  drivers/gpu/drm/radeon/rv515.c              | 1 +
>  drivers/gpu/drm/sti/sti_drv.c               | 1 +
>  drivers/gpu/drm/ttm/ttm_device.c            | 1 +
>  drivers/gpu/drm/ttm/ttm_resource.c          | 3 ++-
>  drivers/gpu/drm/ttm/ttm_tt.c                | 5 +++--
>  drivers/gpu/drm/vc4/vc4_drv.h               | 1 +
>  drivers/gpu/drm/vmwgfx/vmwgfx_gem.c         | 2 ++
>  drivers/gpu/drm/xe/xe_debugfs.c             | 1 +
>  drivers/gpu/drm/xe/xe_gt_debugfs.c          | 2 ++
>  drivers/gpu/drm/xe/xe_uc_debugfs.c          | 2 ++
>  include/drm/drm_print.h                     | 2 +-
>  31 files changed, 46 insertions(+), 8 deletions(-)

-- 
With best wishes
Dmitry
