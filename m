Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D46F18D2DAC
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 08:56:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B9E7113320;
	Wed, 29 May 2024 06:56:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QS6sbDxv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CA1F11331D
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 06:56:09 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-2e6f2534e41so17035071fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 23:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716965767; x=1717570567; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=l8XM/FgEx6d8NuTgtXrGUs5+LoMJwxG6LNXhNDqRvo0=;
 b=QS6sbDxvy32R86xcQ82yc+FUzzVvIII/qRF5taLYe8SIRc/TIqJh0RrsHbPgPyIwm5
 2D02X+EQ/TBb1cuTiw5L1iQcDaGB7UqZSH0zaytmqGhwE9cDCnBLCJeK6NDWTfHfhb0t
 bbpopzJdFHFGsoSsxDMfRfHqmJYHSzwDmVo7zbfpRgctPe65fqVL9I3IiYcr48uDxuuC
 Kt4J2cUdBLxvzVSkLtr5t+iVI4stnc7dIKQ3E8z39clV+TnDAZjK9tBtTo+lFri1GnM8
 WfF5M4lMWUM78TSUfq26tqTqMmq7pIeYrgVIQY3E5UAfdJItKLsy2T0KHu6csQ64udcp
 gMvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716965767; x=1717570567;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l8XM/FgEx6d8NuTgtXrGUs5+LoMJwxG6LNXhNDqRvo0=;
 b=MLTvkQ766LBN2kB42llMNoSjnFeLHU8pTwVGRIXICmHV0BwtN2EPKqzA6LRdZ4D/zz
 HqUuq95P2gUYGCJyabCiy1V2Q0f1nlWPm+BJmnPDfVft+T3AYHNEtByuweZX7PnXm0ZG
 IOip8IeE6KJSOJxwXBeQohVPfIwUiYvCymk1XeXH+c9HuJq+5j+U88YTLUYv0rzSrJdr
 mKsUi0+2U+QHlgAtxkc0jb7AGz2Gn+PT2mJzPOlkJE6X7GpdSp6A6VzAEjnHMNrCZUkH
 baLZj+fi7+Ai59xF8VHBurjMXCuzMnIOnXoYbEKvwNxQT4N09SfsIAvFZKwjaregEXFH
 NVZA==
X-Gm-Message-State: AOJu0YyP+nynqfAv61rTbJtJqypOoWEGoWRWefqm7wpPKho39Wq+GFOE
 Y4ni1+LWRUO0rzALUWazXm6GBLhiX6upfSYEIF/spKdfV6XpjPHaTNaYQ6e3p/g=
X-Google-Smtp-Source: AGHT+IE8Vr6rfevCpWjYYJnFoMwyjAbgft8519qmMf8AdXmrOTwD8aPPvmWsyWzNiVDX4RqJ44Re8w==
X-Received: by 2002:a05:6512:902:b0:51d:4af6:bb86 with SMTP id
 2adb3069b0e04-529612c529amr9109860e87.0.1716965767480; 
 Tue, 28 May 2024 23:56:07 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52aff3f65d8sm88039e87.181.2024.05.28.23.56.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 May 2024 23:56:07 -0700 (PDT)
Date: Wed, 29 May 2024 09:56:05 +0300
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
Subject: Re: [PATCH v3 1/6] drm/ci: uprev mesa version
Message-ID: <jzb7oa2qtbavelujxwzk5vmcchazvva4aynxo2ceoigthgth2f@j3kjkj6okmwz>
References: <20240529024049.356327-1-vignesh.raman@collabora.com>
 <20240529024049.356327-2-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240529024049.356327-2-vignesh.raman@collabora.com>
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

On Wed, May 29, 2024 at 08:10:44AM +0530, Vignesh Raman wrote:
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
> v3:
>   - Move adding farm variable and updating device type variable to seperate commit
> 
> ---
>  drivers/gpu/drm/ci/build-igt.sh   |  2 +-
>  drivers/gpu/drm/ci/build.sh       |  6 +++--
>  drivers/gpu/drm/ci/container.yml  | 12 +++------
>  drivers/gpu/drm/ci/gitlab-ci.yml  | 44 +++++++++++++++++++++----------
>  drivers/gpu/drm/ci/image-tags.yml |  2 +-
>  drivers/gpu/drm/ci/lava-submit.sh |  4 +--
>  6 files changed, 42 insertions(+), 28 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
