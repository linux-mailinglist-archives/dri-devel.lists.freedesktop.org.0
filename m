Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A71FA9A4A11
	for <lists+dri-devel@lfdr.de>; Sat, 19 Oct 2024 01:24:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1020A10E18B;
	Fri, 18 Oct 2024 23:24:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="czN82VKh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C6F710E18B
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 23:24:47 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-5366fd6fdf1so4260801e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 16:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729293886; x=1729898686; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/XL7RU0wcJwiLmyi3rltL96OHQM/RvogtscZRbUMIBE=;
 b=czN82VKhl5XtIQ5FtLG491Fltj4zcLy4PzsotW74iGMBg7a3WADgJep7KqoWSZwAEm
 nQDXMi7yLSxOqSkzFaihI7aRSBUKHrgJ45Ocan0t9kSGaFTX2ZBPBBAPoY0fuIymltV2
 c9m/qbCa9seIcKxhoHbStyctiAjVQ+nLwWIRfjIguZMk2w6JgNVuPj9tRltM+WZkMNVX
 L0ZiOLyieuz4HU3+OtAymO61W+XCYq97jWVj3QEQgpVIoQZcGRu/UkrHOtJQQipyuy+o
 1qP1fjU6z2PFBMPGLr7AmU4on0E3r2X/ONhnTX70zQLnWGE6gwqaTOCLRoJa79MXwKlu
 74Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729293886; x=1729898686;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/XL7RU0wcJwiLmyi3rltL96OHQM/RvogtscZRbUMIBE=;
 b=ku710kMwq0oByOsZjsRv5sq0l2r7AdktXR6Cb0V2HGnsmrY4wecVHzK2BNangcNy66
 ebNkbMlQggnfzjc+FxX7S867EUlXB91BE1PwniMsl2wpxUIOZR6p2jpcW0H+3J1s6GQ6
 BjyAvaKhzGfL/9LstsIgh5nDb/6bpnYyiuWdxGEiHMRrkwhDOvZM6f5KG30qvmOa+T/b
 OJl4e/nGAg57Nosen8RwjU0RQkcfctQXc7Io2wD2SPJGZBAcyhjv1L00DU7CFiDRcVJD
 3j2vhgXfrZZtG1/hYH2jpxMZ/CEPdfBhnaPQ8wD6w+mNZLaZzfj+wc7+eMA2xn2h2HpQ
 LMcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXd6ynVT0XYmYUFHwViFXEfNYIj8fJ3bUVEuQUUjidXa84HYmBxu7os8jAEGrweWgE8tNN/+eRFZow=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzGE7PZTCbn9SdBSQxL1LixG+A/qkZYs19i/kX8oxIh91T8/6LN
 E5GomQniltJCWroME99OYlfDBZMKiBGb5qw/zsOAB9+QTdCFPeii0WPlITP56RM=
X-Google-Smtp-Source: AGHT+IGxQH8jPhf8nHBxYihXlnaykZShcOq9fR2nMiH4MBnj0+03pyQXpR9uKc/6SVuSIxYNBKMpGQ==
X-Received: by 2002:a05:6512:10c6:b0:539:9746:2d77 with SMTP id
 2adb3069b0e04-53a154e049bmr2567706e87.61.1729293885758; 
 Fri, 18 Oct 2024 16:24:45 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a151b90b5sm356121e87.88.2024.10.18.16.24.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2024 16:24:45 -0700 (PDT)
Date: Sat, 19 Oct 2024 02:24:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Manikandan Muralidharan <manikandan.m@microchip.com>
Cc: sam@ravnborg.org, bbrezillon@kernel.org, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 simona@ffwll.ch, nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
 claudiu.beznea@tuxon.dev, Hari.PrasathGE@microchip.com,
 durai.manickamkr@microchip.com, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Cyrille Pitchen <cyrille.pitchen@microchip.com>
Subject: Re: [PATCH] drm: atmel-hlcdc: fix atmel_xlcdc_plane_setup_scaler()
Message-ID: <qsfos3biidabnzdji5hkgmup3nmkeve43hwgqsaaod5npssjgt@277cxzczsv33>
References: <20241014094942.325211-1-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241014094942.325211-1-manikandan.m@microchip.com>
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

On Mon, Oct 14, 2024 at 03:19:42PM +0530, Manikandan Muralidharan wrote:
> From: Cyrille Pitchen <cyrille.pitchen@microchip.com>
> 
> On SoCs, like the SAM9X75, which embed the XLCDC ip, the registers that
> configure the unified scaling engine were not filled with proper values.
> 
> Indeed, for YCbCr formats, the VXSCFACT bitfield of the HEOCFG25
> register and the HXSCFACT bitfield of the HEOCFG27 register were
> incorrect.
> 
> For 4:2:0 formats, both vertical and horizontal factors for
> chroma chanels should be divided by 2 from the factors for the luma
> channel. Hence:
> 
> HEOCFG24.VXSYFACT = VFACTOR
> HEOCFG25.VSXCFACT = VFACTOR / 2
> HEOCFG26.HXSYFACT = HFACTOR
> HEOCFG27.HXSCFACT = HFACTOR / 2
> 
> However, for 4:2:2 formats, only the horizontal factor for chroma
> chanels should be divided by 2 from the factor for the luma channel;
> the vertical factor is the same for all the luma and chroma channels.
> Hence:
> 
> HEOCFG24.VXSYFACT = VFACTOR
> HEOCFG25.VXSCFACT = VFACTOR
> HEOCFG26.HXSYFACT = HFACTOR
> HEOCFG27.HXSCFACT = HFACTOR / 2
> 
> Fixes: d498771b0b83 ("drm: atmel_hlcdc: Add support for XLCDC using IP specific driver ops")
> Signed-off-by: Cyrille Pitchen <cyrille.pitchen@microchip.com>
> ---
>  .../gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c   | 27 ++++++++++++++++---
>  1 file changed, 24 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
