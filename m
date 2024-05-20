Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D98D48C9B8B
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 12:43:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DFF110E2B5;
	Mon, 20 May 2024 10:43:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QzH0sxnV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0098C10E177
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 10:43:28 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-51fcb7dc722so3667198e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 03:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716201807; x=1716806607; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=icwVF42TmZ2hZjEXcduZvhpSy5tVelIfuJSjSBSENHo=;
 b=QzH0sxnVvfMQQ90abtI6zeEZsW5XbNqdOOSrdO+1DHrkzus3C/ETLdazpTJr95j0qK
 ckdWwOxAxI2h6JrcsUWMikBRg4zZxPwBRPLdVkXBpKp8GKy1Tb3ckxA+QxwCtmGji+Qn
 FahnlEVifmp/yh+6gu54iFL9ZA1L8v1VLZYNwJOVugsYmKuKoxbo0HIw1IS7gAuz0ZrR
 CmBOo4LQYVoo2b25AVLbbbhniqxg3OucCKg5/mmK0X9SsKwOj5lDrar6zzhCIZJ8/PAQ
 grMHBQ0fh1ARi9gtwBPk9PlCdq2Y4XJfg/+RQsocsADuPxOnonHpDYIL/ymLcr/5CBJq
 cG1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716201807; x=1716806607;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=icwVF42TmZ2hZjEXcduZvhpSy5tVelIfuJSjSBSENHo=;
 b=lZfoG43pI4iNoRkNigg6nJqEjKx3h/SDIJMwwbcjb4bPbXRclMPfhKf5cLwzQZM3dg
 GAn3XkLeOLdz3LYX8tta+vL2oeW8flHC2d/0J4/NhDimFtJmZruzjRPN8AYrUgOtofFQ
 tiubHEP0ZU7rBoeWuoIAw0+LDuY7E9iMnxbePFUt6vDmlGKbQBH2+XaeTRCtb+ekR5Vx
 cX20pElvAs5XT4tBg1x4H+ZZR4YnroiAAdV7+bhX98n3043NBl51sH1GWQpsvEbzIJBY
 Ki0R5ulzMObA74oQXY2ts3/1rj5qXlCAqq1DBvkZWP7dkpzzX+ntGBEd8uIkWgQFr97W
 VLFQ==
X-Gm-Message-State: AOJu0YwQf11Sei8T1PpKruI34CVsUNAsDcxe4WrWAFuMM4U6A4Ol29hI
 zjBmtQsRk8pTr8fBcoZeMm1uF+cXprsAc9cQIyw0WDFiVpXj5mPoqhTscNp1nYk=
X-Google-Smtp-Source: AGHT+IFzot8n6xHV0OHm6wH4k0sEr+LYxBLD0eD+umJwBs/mAovf2bSRWjBos0WaEoAs2a0risJ1Ww==
X-Received: by 2002:a05:6512:4801:b0:51d:8ff3:f835 with SMTP id
 2adb3069b0e04-52407cddc3fmr1595444e87.26.1716201806986; 
 Mon, 20 May 2024 03:43:26 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5238bee41afsm2044239e87.294.2024.05.20.03.43.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 May 2024 03:43:26 -0700 (PDT)
Date: Mon, 20 May 2024 13:43:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
 helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch,
 robdclark@gmail.com, 
 david.heidelberg@collabora.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, 
 mcanal@igalia.com, linux-mediatek@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, 
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/6] drm/ci: uprev mesa version
Message-ID: <2qzmfv3oc6feihwxu3tl37rg6w3qsj2vddu5olvqk6vhqr26cc@bxu5y6ijvtfa>
References: <20240517092502.647420-1-vignesh.raman@collabora.com>
 <20240517092502.647420-2-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240517092502.647420-2-vignesh.raman@collabora.com>
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

On Fri, May 17, 2024 at 02:54:57PM +0530, Vignesh Raman wrote:
> zlib.net is not allowing tarball download anymore and results
> in below error in kernel+rootfs_arm32 container build,
> urllib.error.HTTPError: HTTP Error 403: Forbidden
> urllib.error.HTTPError: HTTP Error 415: Unsupported Media Type
> 
> Uprev mesa to latest version which includes a fix for this issue.
> https://gitlab.freedesktop.org/mesa/mesa/-/commit/908f444e
> 
> Use id_tokens for JWT authentication. Since s3 bucket is migrated to
> mesa-rootfs, update the variables accordingly. Also copy helper scripts
> to install, so that the ci jobs can use these scripts for logging.
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
> 
> v2:
>   - Uprev to recent version and use id_tokens for JWT authentication
> 
> ---
>  drivers/gpu/drm/ci/build-igt.sh   |  2 +-
>  drivers/gpu/drm/ci/build.sh       |  6 +++--
>  drivers/gpu/drm/ci/container.yml  | 12 +++------
>  drivers/gpu/drm/ci/gitlab-ci.yml  | 44 +++++++++++++++++++++----------
>  drivers/gpu/drm/ci/image-tags.yml |  2 +-
>  drivers/gpu/drm/ci/lava-submit.sh |  4 +--
>  drivers/gpu/drm/ci/test.yml       |  2 ++
>  7 files changed, 44 insertions(+), 28 deletions(-)
> 

[skipped]

> diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
> index 8bc63912fddb..612c9ede3507 100644
> --- a/drivers/gpu/drm/ci/test.yml
> +++ b/drivers/gpu/drm/ci/test.yml
> @@ -150,6 +150,8 @@ msm:sdm845:
>      BM_KERNEL: https://${PIPELINE_ARTIFACTS_BASE}/arm64/cheza-kernel
>      GPU_VERSION: sdm845
>      RUNNER_TAG: google-freedreno-cheza
> +    DEVICE_TYPE: sdm845-cheza-r3
> +    FARM: google

I see that this is the only user of the FARM: tag. Is it correct?
Also we miss DEVICE_TYPE for several other boards. Should we be adding
them?

>    script:
>      - ./install/bare-metal/cros-servo.sh
>  
> -- 
> 2.40.1
> 

-- 
With best wishes
Dmitry
