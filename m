Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F4090C4F3
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 10:31:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20F8810E5DD;
	Tue, 18 Jun 2024 08:30:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="MjhFV6m5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B55DA10E5DE
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 08:30:55 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-2ebe6495aedso48732661fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 01:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718699454; x=1719304254; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ZN9k85Mrk3anlVUN1YElezSrnWglII9Sg2PXq/CTuRk=;
 b=MjhFV6m5nXERT43Du2d6P2KCYsbMoIVuTL5ZNDvCduLcLCmg+hd8glWKYqsxh3Z2si
 YUR7d9q15qpl56X+kogYR3czxAHVQhbt97Lt7Qp9huRfP60jMJFVnpfx7vtbH+SBhtR6
 7R+U9JLguz0vETOn4+yqFvSueT22kr1OZpsyeymj08nud1Vcl8cUZCxgIsE9UA29Domd
 We1e0Bn2qChJdx469e9hKGaY6OKSLQNVWHEw7Y2sQY5F4skUXCZPI8PJrX9AyInnS7bC
 wi3To2kgeqxFoqIlWvqo4C6wGQUUeBPbilmH+eK7j01TD5hPivO3ELhd45TE3C1oVVtd
 Ayfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718699454; x=1719304254;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZN9k85Mrk3anlVUN1YElezSrnWglII9Sg2PXq/CTuRk=;
 b=fV2cVdw3zcVS9wd7RdY8SkPzFdrjvmRyFm+FkL7nQx9AyXhAd09p6ZGVcjiO9Q1KmO
 GIz4oPWmXcaH/wX+a9r0vPbouJSqgP7VfgMWBq3BIotkUVof+W/utC2YoeN4U7odWy4r
 GKASdKY9nWBbwQtEOn1MNoroDcRfV+xKa7CZ1Xh9LdS1kI4TB/DcMnCdIcFriwE6Mxto
 sZAJkMuRH4VjOYhDycV8psXROU6lif4sww/fok6tWjQO/9tDYQpIrQI6V0S7JtiAwEJb
 OzGZhQUZ68D2Z8LzbO5fNtMB+1UwEW1opQw5SQmrwsF/WZqOTboUdNnz29nekMgg38qm
 482Q==
X-Gm-Message-State: AOJu0YynGhndjSPqE+joBcs6RhC8ChWGs+1p4S8bdHMsxGTWwcNI3R1x
 uDX0V6U+Fx2BMrEeuAJxFlMk4VCal6n35xj1lR7LoFoyo5eShKfn0YzF/8nmbik=
X-Google-Smtp-Source: AGHT+IH9eAQFAL6zDipOK/sDJ/uS/aCTBJG7zVkZruzaxOD1yJH8wQC7geS+TrEfqa1CGkcOieAZdQ==
X-Received: by 2002:a05:651c:2117:b0:2ec:f8a:6f14 with SMTP id
 38308e7fff4ca-2ec0f8a7023mr83274231fa.38.1718699453663; 
 Tue, 18 Jun 2024 01:30:53 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec05c8a2a1sm16266141fa.114.2024.06.18.01.30.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 01:30:53 -0700 (PDT)
Date: Tue, 18 Jun 2024 11:30:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 4/5] drm/msm/adreno: Move hwcg table into a6xx
 specific info
Message-ID: <wnnjjljjyl5s3fkwiapux3f76243ngp2ppk2cm7kkhdp5dc4sz@v4wypnga3izv>
References: <20240617225127.23476-1-robdclark@gmail.com>
 <20240617225127.23476-5-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240617225127.23476-5-robdclark@gmail.com>
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

On Mon, Jun 17, 2024 at 03:51:14PM GMT, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Introduce a6xx_info where we can stash gen specific stuff without
> polluting the toplevel adreno_info struct.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 65 +++++++++++++++++------
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     |  6 +--
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  9 ++++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h   |  6 ++-
>  4 files changed, 67 insertions(+), 19 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> @@ -98,7 +100,9 @@ struct adreno_info {
>  	struct msm_gpu *(*init)(struct drm_device *dev);
>  	const char *zapfw;
>  	u32 inactive_period;
> -	const struct adreno_reglist *hwcg;
> +	union {
> +		const struct a6xx_info *a6xx;
> +	};
>  	u64 address_space_size;
>  	/**
>  	 * @speedbins: Optional table of fuse to speedbin mappings

My preference would be towards wrapping the adreno_gpu, but that would
require more significant rework of the driver. Let's see if we can get
to that later.

-- 
With best wishes
Dmitry
