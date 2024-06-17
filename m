Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 926FC90BF8A
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 01:10:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E08DC10E51C;
	Mon, 17 Jun 2024 23:10:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gMvsksWm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0B9E10E523
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 23:10:08 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-52c819f6146so6526416e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 16:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718665807; x=1719270607; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=4wXBmWTJss/RzmPYrqxUbUPy1ew8NM+9YCA3AzpnMEg=;
 b=gMvsksWm7quWUf5i+P7x7lsVUkAoephIrf6jgLSFQg3Q+gN6RyUdKdLLVwwgwnHSLS
 H0U+z6SbGZVhtFHdFowcEcdBjTj1dz5ZreGQ/ZY2wkMHbxoun7uxVNnJ9gWSzFqaF4r1
 ebXr078FJeMqCmqBRKMQHPnUcPVRzFIhOQ1xwmTd+5M4n4qgJ2PnR+sJQQ1GR1ETaMwA
 qRWJC9RUf6IN+fGCRqWJRRTZ6/LUyNhMRSBE1nLZA2vZdZa+x2gvTI0FW/O5jI+5WzVS
 I5Ysgi2NLaYWPnyNRMKuBe/jgo5AruW8fotG74NHG0x1NannKW4JOV+I2WS/YOcBbGle
 iy3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718665807; x=1719270607;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4wXBmWTJss/RzmPYrqxUbUPy1ew8NM+9YCA3AzpnMEg=;
 b=vJ6aJtuXJ6TPMDQ7Sbs27S+6GPjxLh216oEO8NutWoUBnnWvmioLLRqoCVgZXScmCW
 jxeja31yJBwaFTzZbtKOp2iwiiSMYD/GdLzNt+vNfLA7wCdFP6ZZhWuU8X5zx5EMyYAf
 4Ta2vXSBROCeg27L+32mHTwnEuBYZ1MiS+w/sWY25KzYhWnlsz+IeDGVlUhHE0mvX/4n
 wOsW1T59bOteG8j2ndBbCGZsJu3lI1MgifEt+bWgXejW44QFkp20NjozF+zOgh1dQ8qn
 HvdjDRCzyEbSMSFoQXIw3iKCGh+Ae4Oa7rJSBSBNYLQ67PAHfwJcPW/idVnFusjjkXFC
 S3aQ==
X-Gm-Message-State: AOJu0Yy+91ZNpzhrNszVbu0zqym1HwZg+7thcFbeeB2xzAzOZ9uxvEDv
 5zNPn0sQ24jQelDioqRQDQuPQkQrlCaex5yPx7moRoxEajDx5o3AElPI+zXClm8=
X-Google-Smtp-Source: AGHT+IHUJRlG8SD2S6dAElgdpD/vdPMBsgptCF4B7ZC/wxomG8NUkgDzrQQzTs6Mt9ZY35JeVrbnIA==
X-Received: by 2002:a19:e051:0:b0:52c:896f:930d with SMTP id
 2adb3069b0e04-52ca6e9f182mr6936181e87.57.1718665806612; 
 Mon, 17 Jun 2024 16:10:06 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52cba650945sm568522e87.225.2024.06.17.16.10.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 16:10:06 -0700 (PDT)
Date: Tue, 18 Jun 2024 02:10:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/5] drm/msm/adreno: Split catalog into separate files
Message-ID: <vpks6rzfkhzq3dgfee4l7ht2w6vdnlidppw3y34gxv64g3x66z@z5ojt6po77ir>
References: <20240617225127.23476-1-robdclark@gmail.com>
 <20240617225127.23476-3-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240617225127.23476-3-robdclark@gmail.com>
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

On Mon, Jun 17, 2024 at 03:51:12PM GMT, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Split each gen's gpu table into it's own file.  Only code-motion, no
> functional change.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/Makefile               |   5 +
>  drivers/gpu/drm/msm/adreno/a2xx_catalog.c  |  52 ++
>  drivers/gpu/drm/msm/adreno/a3xx_catalog.c  |  81 +++
>  drivers/gpu/drm/msm/adreno/a4xx_catalog.c  |  50 ++
>  drivers/gpu/drm/msm/adreno/a5xx_catalog.c  | 148 +++++
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c  | 338 +++++++++++
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 625 +--------------------
>  7 files changed, 680 insertions(+), 619 deletions(-)
>  create mode 100644 drivers/gpu/drm/msm/adreno/a2xx_catalog.c
>  create mode 100644 drivers/gpu/drm/msm/adreno/a3xx_catalog.c
>  create mode 100644 drivers/gpu/drm/msm/adreno/a4xx_catalog.c
>  create mode 100644 drivers/gpu/drm/msm/adreno/a5xx_catalog.c
>  create mode 100644 drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
