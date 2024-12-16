Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 560CA9F2C2F
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 09:47:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39D4A10E10D;
	Mon, 16 Dec 2024 08:47:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="e3iN2EA2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90FE810E53E
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 08:47:31 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-53e399e3310so4627425e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 00:47:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734338850; x=1734943650; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=zzeD8yx+TMqcm5gDE+gRIinKwvYdm3w/pVg+Fc5PpMU=;
 b=e3iN2EA2z8FPEZRcsHtTIymJ1TXdnWcAfekENNew59Pxegrn/IHIrzV72wZoUCUBFy
 DZMZ0Wd5oD0bRukysP+SgRiRoTjjoNdD4TBb+Q6OjbMVd0PrwXcfHLcBeumFDxP639o0
 xsUaq0FfyGnWUOhxqK88mwXuJbXjkGK0csf281beUTjBWzmaPbEfMB4jArCEgR3mgPww
 wcV0A7nyUAi6AcLJ6xyQLYfzYcRbycXhi7bTwh9NhxXjdGse8yVehEXB37CSk8HckRbH
 R1ddMj/jevEgdopg9fXdR8/0IbI47lRPGYFjVwD5l8iORfIAju93QfpU5KvdtV/SsKAF
 S6xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734338850; x=1734943650;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zzeD8yx+TMqcm5gDE+gRIinKwvYdm3w/pVg+Fc5PpMU=;
 b=aUWSeTSgPzLD3nNiEMgeKTXCQfZaufZidaC8naPPNwXNqPQfYRODpq1pGkOEi2vfyw
 VQZCp6pIHiQfKyCMBwWYVeJ5N/UY+4V1w/ywq7EB4TR3miEO819j1n+251gEnvN7FU8v
 acrtwelXw1jHAztKGW21LWeR5roZbEZYVFNk2FS/Q1i3T2Gn/YURfprYKVzgjLHRUi+d
 BrVXl1WeetTCRV6F3ssewU4n5BWmQ84avb4TidQKqWKepmjaldwI3nn9J2yH3IQaoQ0Z
 vQMumjqqeCuUEwUEw9oX85nhUSCwtL+Dh9XAW2isEtRaXaliZkzs2luzn5EJ47ehN2IY
 eYaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUiicOhCHGfQ9dMEXLJo3bE1vps/seKBem2e7/ufLaNf8AiVX3N8mIoZlRS/Zr7U1pMhZVfGJlfhQM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwPGVPwwX2wn/dUL5NQVCp5hKRJphfzCM3WT4u4WCvIm4KVVzM3
 +7/XTgDJPCbbqbQ3lHz32fiXkjhw1JV7ROgNaJGBpXLePt4PRN/RYHNuRPm6fds=
X-Gm-Gg: ASbGnctdr9pSFNE5y9VsaHmbhxIcoFiMYAwB7ejIqOFgnsOTzTj0uEcVd9oN2lwgRdN
 1wYXsgtksSVbzhWN8UtaPaC3c8m0PZnneV1URfGuxOdCBoTAm0ES7i+jP75n7vSzxesNS9Qgauu
 uJg2L/qM1dFubUaIPRV3svRx0f4MJOc7T1iUVDEw2lGky7fatFUsbsX6QZAh5o5lEyxwu0xN5Sw
 gZUbOrwPNdaG0TOhC3saLZqLtn0mlYZbQTvULZJ7npJepH2lQyD6fszhSk9jAAtLTfiZ6bNBZYa
 xE6H+YjOTryNIf63I0htD4DtoGrE4ACS1Dp0
X-Google-Smtp-Source: AGHT+IEJ5sTe3G9+gTy1m1ue9pwhxg6TL/Rf2dQWkQ9/Vzvc3a6UV9wPa7hVqJ6GvzWOli/HF0b54w==
X-Received: by 2002:a05:6512:3088:b0:540:2111:db71 with SMTP id
 2adb3069b0e04-540905a6fd4mr3379358e87.42.1734338849696; 
 Mon, 16 Dec 2024 00:47:29 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54120b9f4cesm751665e87.14.2024.12.16.00.47.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2024 00:47:29 -0800 (PST)
Date: Mon, 16 Dec 2024 10:47:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Arnd Bergmann <arnd@arndb.de>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jinjie Ruan <ruanjinjie@huawei.com>, 
 =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: fix -Wformat-security warnings
Message-ID: <4lyhh4ayevevk5nkyjo7kbn3r5vk66f4j34dgncycwprxs5dsa@pnkjgxstlfng>
References: <20241216083319.1838449-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216083319.1838449-1-arnd@kernel.org>
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

On Mon, Dec 16, 2024 at 09:33:13AM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Passing a variable string as a printf style format is potentially
> dangerous that -Wformat-security can warn about if enabled. A new
> instance just got added:
> 
> drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c: In function 'dpu_kms_mdp_snapshot':
> drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c:1046:49: error: format not a string literal and no format arguments [-Werror=format-security]
>  1046 |                                             vbif->name);
>       |                                             ~~~~^~~~~~
> 
> Fix this one and the preexisting -Wformat-security warnings the in the
> DRM code for snapdragon.
> 
> Fixes: 1a40bb31fcf1 ("drm/msm/dpu: Add VBIF to DPU snapshot") # and others
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> I have a larger series that I still plan to send eventually, sending this
> one now as I just saw another one get added. The warning is enabled by
> default because there are still over 100 other files with the same problem.
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c   |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 28 ++++++++++++++++---------
>  2 files changed, 19 insertions(+), 11 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
