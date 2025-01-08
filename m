Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 591BBA05C6C
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 14:14:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B63FF10EBB4;
	Wed,  8 Jan 2025 13:14:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mKALEBTR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2228710E8A1
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 13:14:54 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-53ffaaeeb76so17704007e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jan 2025 05:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736342032; x=1736946832; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=YqZewggKXh0wm9IbjtQFexabLRuUSMGH6a4/lzMIbGw=;
 b=mKALEBTRGOhque+feaLFpyht6b7x3sOA+i3j3CFFshPASNEYDoiF8/8pc/jqwUnU7Z
 fted5gdqEwDth5f5uPaqr+OZS4SyIdPkIHYX/FIdN9kHBplUARsRDpyAp9/L/0BbgVAh
 K50VkS8htRVh2iSg6B8DATtuHtB9reMYO9BAJQnO5IrMAz3+UNX8fvsTMqRH+YRl1rJp
 TxguX7B7yD5goWzz0cGM3XVKR4SR7AL7hsqDnGo7w7XSFWK1eQzZrV6LUmBR81K++Ulp
 4801C3PPAZ/YacIPzBLWVZ0qszeQ0ZJLEEAVJGzcPUBvGEXm9VaJ86vs4QhX/4g2k75V
 P6Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736342032; x=1736946832;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YqZewggKXh0wm9IbjtQFexabLRuUSMGH6a4/lzMIbGw=;
 b=NX+r8ooxto0wpEKLpHS42SfwTOXnZMW2/JuygcssSprlbMbLFh7iLEQIXqpCi7c1+b
 gZlnBYOtPUwbF/N6A2GsndCW0YOUj4vIGZ9OxoWVLUKYS+asCT2piNqZuoaibMTo0sZU
 x4EEJHQMqkkQIdKS3vbDnGLJcoQ8dDHj2lFahYL/8gCVI/8s3Jbc5PXRQoHhbkm6T5ze
 OWvjK0bIgzuRB2fjM9cjwVRRG9KyImGLT5wgDFuWxjyZufiXuaMhoNIq52z8Wb/UFXel
 V16GOS+atSir+is+1FIUKhOmcjIjNyUsCl4qZC1TXhXoKV5HtuSaJU1CbuBHGok2xglC
 m2zQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWR2mR4nEOMiHPo2mKvTflxlELGbYmkzkf85Nv/Mxutj/xYeR5s1tN0vnQJlBWkm4SrJAwzUl34MO0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyzAKmEbOXwOwOIYGZshyGjfRvrJv2eWynsS5OtZKIj1FmDbpTH
 5gaWFo9vjTek59tF4eE8v9tGkd4N9PV1gTHEpbKDhyOjRNh46Gmf6zQQSLLOECk=
X-Gm-Gg: ASbGnctbXYP1seQwkK6/EJ/beo4r+Khxkdp3j4nl6TJ+s3dWrmk/rP2xLdDhHNGGTOJ
 e0tuV+/mtc5FgxITB9pdiOUrrvJAzpBim2mGwrEJ9qZ2xq51E1zfM3AgijIYkAgv4JQXbnEduXY
 3wJfPEmfn3CvFO73y8oRhOpmsLZvV9M3sXzhBFrOEpu+5dcgl01t21o8XJx7w2odh5WiUqSDUrm
 JLk3hynOLkRGJPu90KIsEdTaGFOaxqcBUnUdr4gxsyTAOzyu8eTpP/mRGzMWM/yW57uzlPTbFeC
 5XYu9DpQdVhQUfBBb+OGB2lLpJlWNn+uAIw0
X-Google-Smtp-Source: AGHT+IEkuQPiOLgGXs8zWdEMj0wAqNSMaSTV6vSQ/tkCnop+NG9gWvZpeLRpiajpdeM8K2LlU6tzqA==
X-Received: by 2002:a05:6512:3c8a:b0:542:28dc:b692 with SMTP id
 2adb3069b0e04-542845b9480mr694480e87.14.1736342032480; 
 Wed, 08 Jan 2025 05:13:52 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54269fd89e8sm1549488e87.91.2025.01.08.05.13.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 05:13:52 -0800 (PST)
Date: Wed, 8 Jan 2025 15:13:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 matthias.bgg@gmail.com, ck.hu@mediatek.com, jitao.shi@mediatek.com,
 jie.qiu@mediatek.com, 
 junzhi.zhao@mediatek.com, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
 lewis.liao@mediatek.com, 
 ives.chenjh@mediatek.com, tommyyl.chen@mediatek.com, jason-jh.lin@mediatek.com
Subject: Re: [PATCH v4 33/34] drm/mediatek: mtk_hdmi_common: Add var to
 enable interlaced modes
Message-ID: <bovw662duw6ufmjleicb4kuhyn3an6emo53mgg3477dfuarapq@zcmekc7zzeub>
References: <20250108112744.64686-1-angelogioacchino.delregno@collabora.com>
 <20250108112744.64686-34-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108112744.64686-34-angelogioacchino.delregno@collabora.com>
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

On Wed, Jan 08, 2025 at 12:27:43PM +0100, AngeloGioacchino Del Regno wrote:
> Add an interlace_allowed bool member to struct mtk_hdmi_ver_conf
> which will be used to signal whether interlaced modes are supported
> by the bridge (in our case, the HDMI IP), and enable it for HDMIv2.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_hdmi_common.c | 1 +
>  drivers/gpu/drm/mediatek/mtk_hdmi_common.h | 1 +
>  drivers/gpu/drm/mediatek/mtk_hdmi_v2.c     | 3 ++-
>  3 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c b/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
> index 4cecfef1466b..8841fa4e476a 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
> @@ -1301,7 +1301,8 @@ static const struct mtk_hdmi_ver_conf mtk_hdmi_conf_v2 = {
>  	.bridge_funcs = &mtk_v2_hdmi_bridge_funcs,
>  	.codec_ops = &mtk_hdmi_v2_audio_codec_ops,
>  	.mtk_hdmi_clock_names = mtk_hdmi_v2_clk_names,
> -	.num_clocks = MTK_HDMI_V2_CLK_COUNT
> +	.num_clocks = MTK_HDMI_V2_CLK_COUNT,
> +	.interlace_allowed = true

Nit: if you have a trailing comma, you don't have to change the last
line when adding a new one.

>  };
>  
>  static const struct mtk_hdmi_conf mtk_hdmi_conf_mt8188 = {
> -- 
> 2.47.0
> 

-- 
With best wishes
Dmitry
