Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A9A9D5D00
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 11:10:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 078E010EB3D;
	Fri, 22 Nov 2024 10:10:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="SM+0gPnH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81F1210EB3D
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 10:10:23 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-53dd0cb9ce3so1362678e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 02:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732270222; x=1732875022; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=XshnFRtBSr7UhB3YJV64KxbBeRECk31YK3bPI5LBXvg=;
 b=SM+0gPnHz+FkqfnSQT3xOmUQc7F3Q+wsyQ1J8goBSlLxP4D8FwQGMK3HMSpy6m/gaq
 Iq311qeBr46ui8IOsZvT0gEl6a/eYFEJHl76OAbzw923V6D+yuf/w8XIJpvRNRCnEnUR
 LiEhVkXzTdLl4KGYGs06MoSzs0tVFP+u3bfQhWLA2DIlnrRKvFtre3AgwJqKbLaSGPff
 V4Wwg1W4+o4v8jbqE5jvOiOjDxRkhSmgTI75BPPy9ovau5HoVAhxVxPVbPR2DSFyenBc
 Lyj/lruBbFp7aVhPrzlW9h8AQj2ML/MVCd3BtMax80NiYWRAheVcO6NpmFpY/lNWyHrC
 jhbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732270222; x=1732875022;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XshnFRtBSr7UhB3YJV64KxbBeRECk31YK3bPI5LBXvg=;
 b=cwiNOAd0O8fypx7aVX0XkZEmh9cdLBze6H84zD6QScjasFW0WqRf3nnuiUDsUZZzin
 NhTgWyfkMV/aC1pWHo3bsnP7TLns3hOg5dfAXvdPEYMpJ0v9GdgEgVMkWqnDw25rW4W9
 EdwSvLLugBZJ6/ul4z6YWeu7Oxbki6yCvpRw5y5O4iC3xM8pGUMCxNA1eNIOwSwI+dEY
 YvsTUknmQHIFlzWpgQlpo4LQeJGxqg0woGxZJ9864Iswpt9F1z1LFM1HXMtV+/kwCwLM
 HWUZMkTjY8npE5mjLEIZnD58JdFtBkPNls2KN1VbigeFBO/nLSCkipdCed+9PxlXyCLe
 r0BQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDi+t6E2Cc/3L69jCxCbI3i81uKIWKwOyF4UQTl5wC7FRo+rNom4lwb9JglO3TA5qvrB33Mgd+3oo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwvOZXNF6lFvqnuEycN95rsQgqgKOlre0YDURbdcwTYCW3E1GOL
 5BEBliMC6z6eLXmzGypmvP9GBtMxS6/RnS6gS3K/JYX1uTslxvktwWBQ44yGWAE=
X-Gm-Gg: ASbGnctPoQO4vg2bSL/jyW9K0UZUFV0LxquTWOlGWU4/+Oim4orRFq5pJeaJyFc597l
 nirbguA+hlSk3E/1qM3DNKV39uO1/x1xqlRdPGKVtUHYCKnYfpwGE8eoMEWwbzD88aajcxn00zO
 3hr0jaa6KZuyaL2OqxzW1CEhoPMcGKMw9D8lp0QiEj3WVwXx8JsdW9gPxQ5keXzjtlHcaAd23U2
 PgdCkXhT85Z+jPm47p7Kx6xgRvFhMGOQOx7XIeq2P+vVw1nsCJYANEuZZoTsw0X/2ashj5Vq7vb
 l3EARKIbKzYndO53wygP4HNi1hFA0Q==
X-Google-Smtp-Source: AGHT+IFPiycj5qeplibnOojl42rf2zmubg4BvxwbPRG3LEmjxqFIgmgvbEd9YnOjveQDfC+hRoc1Ig==
X-Received: by 2002:a05:6512:2395:b0:53d:d5fb:5111 with SMTP id
 2adb3069b0e04-53dd5fb51a5mr687991e87.18.1732270221653; 
 Fri, 22 Nov 2024 02:10:21 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53dd249c927sm311682e87.279.2024.11.22.02.10.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Nov 2024 02:10:20 -0800 (PST)
Date: Fri, 22 Nov 2024 12:10:17 +0200
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
 Konrad Dybcio <konradybcio@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Li Liu <quic_lliu6@quicinc.com>, 
 Xiangxu Yin <quic_xiangxuy@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 7/9] drm/msm/dsi: Add support for SM6150
Message-ID: <mcvhfkh3ycrx2ganumsxlc7lx53ed55yk4syh5qev3jqqgkeqj@h5vnfpgjwtj5>
References: <20241122-add-display-support-for-qcs615-platform-v3-0-35252e3a51fe@quicinc.com>
 <20241122-add-display-support-for-qcs615-platform-v3-7-35252e3a51fe@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241122-add-display-support-for-qcs615-platform-v3-7-35252e3a51fe@quicinc.com>
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

On Fri, Nov 22, 2024 at 05:56:50PM +0800, Fange Zhang wrote:
> From: Li Liu <quic_lliu6@quicinc.com>
> 
> Add support for DSI 2.3.1 (block used on SM6150).
> 
> Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
> Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_cfg.c | 4 +++-
>  drivers/gpu/drm/msm/dsi/dsi_cfg.h | 1 +
>  2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> index 10ba7d153d1cfc9015f527c911c4658558f6e29e..fe02724bddf69c2e8d6816589f4ea410fa666e5b 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> @@ -171,7 +171,7 @@ static const struct msm_dsi_config sdm845_dsi_cfg = {
>  	.num_bus_clks = ARRAY_SIZE(dsi_v2_4_clk_names),
>  	.io_start = {
>  		{ 0xae94000, 0xae96000 }, /* SDM845 / SDM670 */
> -		{ 0x5e94000 }, /* QCM2290 / SM6115 / SM6125 / SM6375 */
> +		{ 0x5e94000 }, /* QCM2290 / SM6115 / SM6125 / SM6150 / SM6375 */

Not true

>  	},
>  };
>  
> @@ -286,6 +286,8 @@ static const struct msm_dsi_cfg_handler dsi_cfg_handlers[] = {
>  		&sdm845_dsi_cfg, &msm_dsi_6g_v2_host_ops},
>  	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_3_0,
>  		&sdm845_dsi_cfg, &msm_dsi_6g_v2_host_ops},
> +	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_3_1,
> +		&sdm845_dsi_cfg, &msm_dsi_6g_v2_host_ops},
>  	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_4_0,
>  		&sdm845_dsi_cfg, &msm_dsi_6g_v2_host_ops},
>  	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_4_1,
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> index 4c9b4b37681b066dbbc34876c38d99deee24fc82..120cb65164c1ba1deb9acb513e5f073bd560c496 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> @@ -23,6 +23,7 @@
>  #define MSM_DSI_6G_VER_MINOR_V2_2_0	0x20000000
>  #define MSM_DSI_6G_VER_MINOR_V2_2_1	0x20020001
>  #define MSM_DSI_6G_VER_MINOR_V2_3_0	0x20030000
> +#define MSM_DSI_6G_VER_MINOR_V2_3_1	0x20030001
>  #define MSM_DSI_6G_VER_MINOR_V2_4_0	0x20040000
>  #define MSM_DSI_6G_VER_MINOR_V2_4_1	0x20040001
>  #define MSM_DSI_6G_VER_MINOR_V2_5_0	0x20050000
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
