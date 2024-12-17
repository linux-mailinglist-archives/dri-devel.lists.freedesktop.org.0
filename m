Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CB29F4948
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 11:55:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A769C10E202;
	Tue, 17 Dec 2024 10:55:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Rw1GuGDq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1914710E202
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 10:55:01 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2ffd6b7d77aso62526051fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 02:55:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734432899; x=1735037699; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=tHWIkqKFIPrZfDR6fwGCJpX7T0cdK1Nh9XGTjtxdWTw=;
 b=Rw1GuGDqQGv0lOFFH+AWlA+ImBkamv7+1SozeeArAEnuv9C9Dr3Q+u5hHxL9HSoDZI
 TzV1Bk3BZNaxTVUEqQJYEcV9+9vPpR6jNDGVsezlpndzpAmUeMHO4N1HXUiVMQKEPbPJ
 OhnZEsLx04Ujz9SRTv/DTBvdY0naUio6X+lBDsvhEu10++f6J9qO4QgasdejM2yTuUD3
 JmrynPG6PvsSaUd6LHyLk52mGpSexQOyMVeW7fBS4v7xD1MFkXHbeTIuVB5nM64MK5c9
 NgQP/QPzaYVwzFO+qMJhyRVLk7AbBcOfEJUpYnlZRFOHNLtCzr0pNUOdxb70zZ88Nna2
 upRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734432899; x=1735037699;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tHWIkqKFIPrZfDR6fwGCJpX7T0cdK1Nh9XGTjtxdWTw=;
 b=Os4+f4a2+6pOqI/wc8A3bLEpObaV1Xu09T5bi11Y7twO7G1fOBQ9hRFCkbjCgnlJvf
 o5U7c57OT5CpPRAElBCdwFb+fdKZuCNR7gu23ToTiTVZSrF25+gWvkYsst+CEcYOwjeE
 ENGWqCbrhACBtMbRcOkSkzVejYPRgAQGpfxI0P+uadger+asOz5gm1ZG1n+Uawx7wwb2
 qK8zxyzh55sU9EIyoCBs8zQJ7ZOlobNUNBFJESjw4PvGTDZ8+vJ/FNzuMOGWTbqKThaP
 pXDgPy6x39pzHIrPTCxGssfoHRC5wEdPmxsKTYQ4r05Q4pxrL/g60cX/Ryofbz4JFc9Y
 e+GQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVi4V4W9+UNW8CFCBoqWv0uXHEZajmvj+AX+J6hOC71b/tY+BIWbMsMMYThwxM2Fu0RJESuGHKUos=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxoj3LiLmLTl9TsyujJWZ7AfMIBlO0HJNn7XrilwHcytFE8BL3N
 J84tvl/5bhrOBD9ffUjqI2A4Y4YrB3oh3zD6jjtaGsOdFW5kc8ezj/Na+JE5tjg=
X-Gm-Gg: ASbGncvrOqnrnmSDhXONu7JGK4bLD8iAWqZWtdETCaesbFo7llRkC80gw1oTU3/ZdtO
 1hOae9sGB5y8uaSdegyTQN3KpmdrDAXejsJGVpy+FW3QWH7VJk7ImDoQGl4VrjLabqr8oQ9JJDN
 DLjLxNUBsOSxnVX6zBZ2Dm5JAAlnk2iYpD4oJ+usW/zcp4AaxL8CO1NTzmu9oMOb5NQRyxCVo8j
 TYQNxnuZUAioKpJfvsWkz4NI5lAoNSDOXyKKX+V296Vm+4kCMVfpa6QChXLh1wXcyMoH2w5b4lv
 5p1Jwtkg+Z75ypVlxg04urBfdF5jrq8ewCY1
X-Google-Smtp-Source: AGHT+IHIIXGB/X+gwvncRHBdy9tDryU1EfA09rbZDao5aKxh/K7dmzH4R4ChpaOmldxWkT0LNMbwvw==
X-Received: by 2002:a05:6512:2809:b0:53e:362e:ed0 with SMTP id
 2adb3069b0e04-540916d7331mr4458490e87.44.1734432899164; 
 Tue, 17 Dec 2024 02:54:59 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54120c1fb46sm1125836e87.235.2024.12.17.02.54.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2024 02:54:57 -0800 (PST)
Date: Tue, 17 Dec 2024 12:54:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Fange Zhang <quic_fangez@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Liu Li <quic_lliu6@quicinc.com>, 
 Xiangxu Yin <quic_xiangxuy@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 5/9] drm/msm/dpu: Add SM6150 support
Message-ID: <ntffm2jwr44m77z2bvuifv3itkpywco3cemgzkizzdp7e2ekdv@htfktmyyoe3k>
References: <20241210-add-display-support-for-qcs615-platform-v4-0-2d875a67602d@quicinc.com>
 <20241210-add-display-support-for-qcs615-platform-v4-5-2d875a67602d@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241210-add-display-support-for-qcs615-platform-v4-5-2d875a67602d@quicinc.com>
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

On Tue, Dec 10, 2024 at 02:53:56PM +0800, Fange Zhang wrote:
> From: Li Liu <quic_lliu6@quicinc.com>
> 
> Add definitions for the display hardware used on the Qualcomm SM6150
> platform.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
> Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
> ---
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h | 254 +++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
>  4 files changed, 257 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..621a2140f675fa28b3a7fcd8573e59b306cd6832
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h

[...]

> +
> +const struct dpu_mdss_cfg dpu_sm6150_cfg = {
> +	.mdss_ver = &sm6150_mdss_ver,
> +	.caps = &sm6150_dpu_caps,
> +	.mdp = &sm6150_mdp,
> +	.ctl_count = ARRAY_SIZE(sm6150_ctl),
> +	.ctl = sm6150_ctl,
> +	.sspp_count = ARRAY_SIZE(sm6150_sspp),
> +	.sspp = sm6150_sspp,
> +	.mixer_count = ARRAY_SIZE(sm6150_lm),
> +	.mixer = sm6150_lm,
> +	.dspp_count = ARRAY_SIZE(sm6150_dspp),
> +	.dspp = sm6150_dspp,
> +	.pingpong_count = ARRAY_SIZE(sm6150_pp),
> +	.pingpong = sm6150_pp,
> +	.intf_count = ARRAY_SIZE(sm6150_intf),
> +	.intf = sm6150_intf,
> +	.vbif_count = ARRAY_SIZE(sdm845_vbif),
> +	.vbif = sdm845_vbif,
> +	.perf = &sm6150_perf_data,

I noticed that the catalog entry doesn't provide writeback configuration
although the vendor DTSi specified that there is WB_2 on this platform.
Please send a followup patch enabling writeback on this platform.

> +};
> +
> +#endif

-- 
With best wishes
Dmitry
