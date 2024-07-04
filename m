Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8799273CA
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2024 12:16:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DEC210E9EC;
	Thu,  4 Jul 2024 10:15:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="M7YxZmAM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CCB510EA7A
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2024 10:15:56 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2ebe6495aedso4397161fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jul 2024 03:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720088154; x=1720692954; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=1nvqcTE+d+I6/PYlZYlUrN3ZSE7/0dbyWuREcOgf8aA=;
 b=M7YxZmAM3xI4Hx4cCi9v4DQF44Z5xUniV7zJCyC76LcXmFpa0NpnrTVLZi3qMWGW2+
 m53+SIR5d0pUvaP49fSYGJ58x2Y/07rnJZgyT7LUfeJZq5f8MFrs680Yash8D1mbB4lh
 b9zC53ESlRXVF6/wu6p4L62PLSX5k23Cz4WZvDzJHruFb42PV+NWXyh0AbbYrX0H2Us8
 8KprM3q59Cqmo8yyIZzMwzaGlF9jcQFAX9nAEavbRTlvXidYhnpbCE+9snsbVJjCoCsf
 hPgZ8pvLYwZF1zYwsvnMZQgPcmbB6o8WSSrHpEjugkKc8RSIsbzZaW3lt+PmSYvGM5Yn
 yU6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720088154; x=1720692954;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1nvqcTE+d+I6/PYlZYlUrN3ZSE7/0dbyWuREcOgf8aA=;
 b=ofJVG7tq7bYRpQvlJBcjz1e+ibs0+MT8fK7cyoGlcU1zHfCc7CienRZcwQQ4jFnDMJ
 kWEm7qjMC+22VtYfSBs/QyWWCUdcwp9oLpJkWxZCPPMzyGkU41Ya6TzQ6eGfVmNlqaa6
 PPWjrs2WyO2ONHKth2h4GAYhgZwqS0JYxcyOE3kde1PJlY6rAkpBSVSeoukj7PAIGS99
 Uf8LZC3aVO366cyJwTj5XxqXVl9+Z9lhTi0AFJWqgkWJVhuDPsul64uZ6mfySZ3V6AZ8
 qEEho2FnLUc0N/MOohjxC3nrhwKsOW1oDQZQjEU7VbupEXgkqkYFj/nUuQYdVSsXOB23
 PU+Q==
X-Gm-Message-State: AOJu0YxYktN0PttZ9GT/Nj+19XyUuBYcGyvxr5V2EPE39/18PkfpVT4Z
 mYjkrhUswC++o1rznjFYS8ysAKuK/fa854fTZk26jYF6Hsk4qxX0ozBJkmhWgAI=
X-Google-Smtp-Source: AGHT+IFjFbE6dWkiueh16FP2N9UOEw13MN12/uduae8Rfkcs3JR/7QPB7Yfqddj+KjB9xdjW8KZcuw==
X-Received: by 2002:a2e:98c3:0:b0:2ec:5200:a935 with SMTP id
 38308e7fff4ca-2ee8edc2d45mr8049801fa.40.1720088154177; 
 Thu, 04 Jul 2024 03:15:54 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ee5168cf1fsm22523201fa.116.2024.07.04.03.15.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jul 2024 03:15:53 -0700 (PDT)
Date: Thu, 4 Jul 2024 13:15:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
 helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch,
 robdclark@gmail.com, 
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 mcanal@igalia.com, 
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, 
 intel-gfx@lists.freedesktop.org, virtualization@lists.linux-foundation.org, 
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] drm/ci: uprev IGT
Message-ID: <ojnz5hjfht6gwouphvmvizb2udlz2wvwnsj4vgosp3chrhsmcv@c7cxscdyxtsn>
References: <20240704092202.75551-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240704092202.75551-1-vignesh.raman@collabora.com>
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

On Thu, Jul 04, 2024 at 02:52:02PM GMT, Vignesh Raman wrote:
> Uprev IGT to the latest version, which includes a fix for the
> writeback tests issue on MSM devices. Enable debugging for
> igt-runner to log output such as 'Begin test' and 'End test'.
> This will help identify which test causes system freeze or hangs.
> Update xfails and add metadata header for each flake test.
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
> 
> v1:
>   - https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1216850
> 
> ---
>  drivers/gpu/drm/ci/gitlab-ci.yml              |   2 +-
>  drivers/gpu/drm/ci/igt_runner.sh              |   1 +
>  .../gpu/drm/ci/xfails/amdgpu-stoney-fails.txt |   1 +
>  .../drm/ci/xfails/amdgpu-stoney-flakes.txt    |  14 +-
>  .../gpu/drm/ci/xfails/amdgpu-stoney-skips.txt |   4 +-
>  drivers/gpu/drm/ci/xfails/i915-amly-fails.txt |  12 +-
>  .../gpu/drm/ci/xfails/i915-amly-flakes.txt    |  41 ++++-
>  drivers/gpu/drm/ci/xfails/i915-amly-skips.txt |   5 +-
>  drivers/gpu/drm/ci/xfails/i915-apl-flakes.txt |   2 +-
>  drivers/gpu/drm/ci/xfails/i915-apl-skips.txt  |   4 +-
>  drivers/gpu/drm/ci/xfails/i915-cml-fails.txt  |  14 +-
>  drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt |   9 +-
>  drivers/gpu/drm/ci/xfails/i915-cml-skips.txt  |   5 +-
>  drivers/gpu/drm/ci/xfails/i915-glk-fails.txt  |  24 +--
>  drivers/gpu/drm/ci/xfails/i915-glk-flakes.txt |   8 +-
>  drivers/gpu/drm/ci/xfails/i915-glk-skips.txt  |   4 +-
>  drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt  |   2 +
>  drivers/gpu/drm/ci/xfails/i915-kbl-flakes.txt |   2 +-
>  drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt  |   4 +-
>  drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt  |  25 +--
>  drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt  |   4 +-
>  drivers/gpu/drm/ci/xfails/i915-whl-fails.txt  |  17 +-
>  drivers/gpu/drm/ci/xfails/i915-whl-flakes.txt |   2 +-
>  drivers/gpu/drm/ci/xfails/i915-whl-skips.txt  |   5 +-
>  .../drm/ci/xfails/mediatek-mt8173-fails.txt   |   9 +-
>  .../drm/ci/xfails/mediatek-mt8173-flakes.txt  |  32 +++-
>  .../drm/ci/xfails/mediatek-mt8173-skips.txt   |   4 +-
>  .../drm/ci/xfails/mediatek-mt8183-fails.txt   |   2 +-
>  .../drm/ci/xfails/mediatek-mt8183-skips.txt   |   2 +-
>  .../gpu/drm/ci/xfails/meson-g12b-fails.txt    |   2 +-
>  .../gpu/drm/ci/xfails/meson-g12b-skips.txt    |   2 +-
>  .../gpu/drm/ci/xfails/msm-apq8016-fails.txt   |   5 +-
>  .../gpu/drm/ci/xfails/msm-apq8016-skips.txt   |   2 +-
>  .../gpu/drm/ci/xfails/msm-apq8096-flakes.txt  |   2 +-
>  .../gpu/drm/ci/xfails/msm-apq8096-skips.txt   |   4 +-

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # msm tests


>  .../msm-sc7180-trogdor-kingoftown-fails.txt   | 145 ------------------
>  .../msm-sc7180-trogdor-kingoftown-flakes.txt  |  18 ++-
>  .../msm-sc7180-trogdor-kingoftown-skips.txt   |   5 +-
>  ...sm-sc7180-trogdor-lazor-limozeen-fails.txt | 145 ------------------
>  ...m-sc7180-trogdor-lazor-limozeen-flakes.txt |  11 +-
>  ...sm-sc7180-trogdor-lazor-limozeen-skips.txt |   2 +-
>  .../gpu/drm/ci/xfails/msm-sdm845-flakes.txt   | 105 ++++++++++++-
>  .../gpu/drm/ci/xfails/msm-sdm845-skips.txt    |   4 +-
>  .../drm/ci/xfails/rockchip-rk3288-fails.txt   |   2 +-
>  .../drm/ci/xfails/rockchip-rk3288-skips.txt   |   2 +-
>  .../drm/ci/xfails/rockchip-rk3399-fails.txt   |   2 +-
>  .../drm/ci/xfails/rockchip-rk3399-flakes.txt  |   4 +-
>  .../drm/ci/xfails/rockchip-rk3399-skips.txt   |   2 +-
>  .../drm/ci/xfails/virtio_gpu-none-fails.txt   |  64 ++++++++
>  .../drm/ci/xfails/virtio_gpu-none-skips.txt   |   4 +-
>  drivers/gpu/drm/ci/xfails/vkms-none-fails.txt |   4 -
>  .../gpu/drm/ci/xfails/vkms-none-flakes.txt    |  21 +++
>  drivers/gpu/drm/ci/xfails/vkms-none-skips.txt | 105 ++++++++++++-
>  53 files changed, 527 insertions(+), 395 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
> index 80fb0f57ae46..b09976c3d2c2 100644
> --- a/drivers/gpu/drm/ci/gitlab-ci.yml
> +++ b/drivers/gpu/drm/ci/gitlab-ci.yml
> @@ -5,7 +5,7 @@ variables:
>    UPSTREAM_REPO: git://anongit.freedesktop.org/drm/drm
>    TARGET_BRANCH: drm-next
>  
> -  IGT_VERSION: 0df7b9b97f9da0e364f5ee30fe331004b8c86b56
> +  IGT_VERSION: f13702b8e4e847c56da3ef6f0969065d686049c5
>  
>    DEQP_RUNNER_GIT_URL: https://gitlab.freedesktop.org/anholt/deqp-runner.git
>    DEQP_RUNNER_GIT_TAG: v0.15.0


-- 
With best wishes
Dmitry
