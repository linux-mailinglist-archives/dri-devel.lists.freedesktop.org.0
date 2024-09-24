Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5D1984EE9
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 01:22:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 307C410E90E;
	Tue, 24 Sep 2024 23:22:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="iWlkfeM6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C396510E90E
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 23:22:40 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2f75c6ed428so61912281fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 16:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727220159; x=1727824959; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=itd5cTQ33/nX4ykMA3iVji0DuuZO3+1I1si5nysaoYc=;
 b=iWlkfeM61W1o/3/liaSL9cCKobdq2bQG45nnpKicOhpoTlC/wyzpxLQCeYPsbDXLja
 ugsZmUJSNsWm34yBuFiwMCgqK5SbGBsetJE75cTqy54yaufJ7XpJkKuq5DFKLNpGO58s
 efdHaP2rorVvxk6QOz1wm/qwU/H0ttyjdxs/fCHA5EuvfqJjqEtnQeufIzMHTbLgCEJO
 CtSdYwtJaPA4a+YGCMf9SUQRqKl/7AsIADhyE3kSWNVW4avnc5qbzbampZu3s7OEPvji
 AZ8r2Ic7r5qW5ATJHG2IkkisCV1RxP6ivX3NTfXNy0HAhWQAqeJq2a/x/uaZoTrKaAUG
 zcvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727220159; x=1727824959;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=itd5cTQ33/nX4ykMA3iVji0DuuZO3+1I1si5nysaoYc=;
 b=PRwqNDOWWLsrC3Y1EOLy1WH/iLZAV5/3gERDqufe4URx28gUWJNIGUjBkD0nBN7YGQ
 RuflXtRXMwie5rKA6l4ms6Vrxdevn2HBjxvKPyws3XK01OproJyezdVLLUF17KVsOsdh
 FvEQZ+c4VQrnMSRMpB3Th5jbDfMesyyhn88jBQmFDiDVG7M23bLGCTne2Jeyr2MFqsSV
 TVYMqsvRn/aiUOJEdIrYgbFlNiN5gBdqgX6MO0tTIiyH1wxa50lAYh0vC0XSlACOQ54a
 FCUuHnU8A/MJrl+4Wyv8sL6KG13J9HhtKKG+Qb8cOg0JVxIGhstVRP4wLR/ilLUyNSOM
 9NQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyVZO4ZJDHgTc58I0CIflciETVpHsp+D3quo9KfNKYfEDE0p4SldsQCbc5BP8wlNPXWsXPTCNHbS8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzbgV9yBm4ADVqX/QVKhP+sjX3FrPYcptDynNhDSF7pDJxdLqxR
 1q9xzXLBIbtuNGjp21x8nciAhD+IyXeGR071fTjwO7v7A4ZP+tjcHhp/vIJV98M=
X-Google-Smtp-Source: AGHT+IGUwS1Z4OlJF26Y8ssPu+10vhyix5D5Y/mur0w28/I8yb/6S03A55wEXxdMPWIJIIunNvdh4g==
X-Received: by 2002:a2e:1311:0:b0:2ee:847f:9e9b with SMTP id
 38308e7fff4ca-2f91ca4676amr3879631fa.28.1727220158811; 
 Tue, 24 Sep 2024 16:22:38 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f8d28b4cc1sm3441271fa.129.2024.09.24.16.22.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 16:22:37 -0700 (PDT)
Date: Wed, 25 Sep 2024 02:22:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, quic_ebharadw@quicinc.com,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2 13/22] drm/msm/dpu: Add CWB to msm_display_topology
Message-ID: <so3sfdgwfc5zwm56w7b2zhru4nmkmwvppxtvbri5a44d2cg3fb@xdcfai3sbwwt>
References: <20240924-concurrent-wb-v2-0-7849f900e863@quicinc.com>
 <20240924-concurrent-wb-v2-13-7849f900e863@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240924-concurrent-wb-v2-13-7849f900e863@quicinc.com>
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

On Tue, Sep 24, 2024 at 03:59:29PM GMT, Jessica Zhang wrote:
> Add the cwb_enabled flag to msm_display topology and adjust the toplogy
> to account for concurrent writeback
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c |  6 ++++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c   | 10 ++++++++--
>  drivers/gpu/drm/msm/msm_drv.h            |  2 ++
>  3 files changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index d53e986eee54..a7850bf844db 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1176,6 +1176,8 @@ static struct msm_display_topology dpu_crtc_get_topology(
>  		dpu_encoder_update_topology(drm_enc, &topology, crtc_state->state,
>  					    &crtc_state->adjusted_mode);
>  
> +	topology.cwb_enabled = drm_crtc_in_clone_mode(crtc_state);
> +
>  	/*
>  	 * Datapath topology selection
>  	 *
> @@ -1189,9 +1191,9 @@ static struct msm_display_topology dpu_crtc_get_topology(
>  	 * Add dspps to the reservation requirements if ctm is requested
>  	 */
>  
> -	if (topology.num_intf == 2)
> +	if (topology.num_intf == 2 && !topology.cwb_enabled)
>  		topology.num_lm = 2;
> -	else if (topology.num_dsc == 2)
> +	else if (topology.num_dsc == 2 && !topology.cwb_enabled)

Is it a temporal restriction or is it a hardware limitation? Can we use
two LMs with a single WB?

>  		topology.num_lm = 2;
>  	else if (dpu_kms->catalog->caps->has_3d_merge)
>  		topology.num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 : 1;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index 96c80cf9f6ad..04df3056d75a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -371,8 +371,14 @@ static int _dpu_rm_reserve_ctls(
>  	int i = 0, j, num_ctls;
>  	bool needs_split_display;
>  
> -	/* each hw_intf needs its own hw_ctrl to program its control path */
> -	num_ctls = top->num_intf;
> +	/*
> +	 * For non-CWB mode, each hw_intf needs its own hw_ctl to program its
> +	 * control path. Hardcode num_ctls to 1 if CWB is enabled
> +	 */
> +	if (top->cwb_enabled)
> +		num_ctls = 1;
> +	else
> +		num_ctls = top->num_intf;
>  
>  	needs_split_display = _dpu_rm_needs_split_display(top);
>  
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index 0d3adf398bc1..8a2a3705f117 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -1,5 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
>  /*
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>   * Copyright (c) 2016-2018, The Linux Foundation. All rights reserved.
>   * Copyright (C) 2013 Red Hat
>   * Author: Rob Clark <robdclark@gmail.com>
> @@ -88,6 +89,7 @@ struct msm_display_topology {
>  	u32 num_dspp;
>  	u32 num_dsc;
>  	bool needs_cdm;
> +	bool cwb_enabled;
>  };
>  
>  /* Commit/Event thread specific structure */
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
