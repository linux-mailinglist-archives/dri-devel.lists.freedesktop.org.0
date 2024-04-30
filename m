Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 937BE8B6F33
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2024 12:10:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B724A10F6E8;
	Tue, 30 Apr 2024 10:09:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="IQBvDz0N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D15410F599
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2024 10:09:56 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-51dc5c0ffdbso2270606e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2024 03:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714471794; x=1715076594; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=5mbwpFJFih7RIT1NY26n8+loi/ZJwnp9wrw9uANwmIA=;
 b=IQBvDz0NgHqMyQEkcG7SLLoPpGFFtVkUvzHVeCLBsHER41bBCBP6jddvraEM5kY/fP
 KzLBAcqwv1C3LAzMjtR/MLsFgAVG6AuVaSOFCjICYWLfFDRnzT8ELJLnC8y5uhpc/4L1
 specSCUBcFPZ8Z4+e12oJD0uTeGySrkzZdfpbKZyCkPQGNyXC+96IT2qzPAJchoabi7b
 71ISZ0HCLj5wykp0pmLmi651oSigMcS9k55qpjqvYn4zo/ZVq3mICYuXt7hlFSsPOksh
 oNJmJCP9SiLG8kGn2N6ES35Y1Lidd5g1UX5mgF5urLOR/ZjlnNslMCDb6bzEkLw0G2Pp
 subw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714471794; x=1715076594;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5mbwpFJFih7RIT1NY26n8+loi/ZJwnp9wrw9uANwmIA=;
 b=OEPI8lvUbv6NCx1ie21W8CMSwPzQTVPMoH8tYCqmHolJXCIci4h5s88fQs/ABH7Y7n
 aPTWsPLAjvPaczGjXPhxoYoFayn8C0Sm6BqIAzab9tOEnhu30YIH/C3bGJhtlqxvDxuC
 GqiFpyy1YSxrMkMVELk7gB0vCXP1jk+Jg9KTyv0NwhMZTAQTNxaMjhmv3dGR9LtRPIni
 Wl0zlT82sAS5/hbTV0I4jhXQAvraJvIRznSObqnuWkiHVC95n6v1vLzgqkda1Nny+fIY
 8eztqhpXLtzpg7J3QNVXA1tw3k8jZkOh7eKZq9kZezGkxFycObop5Uaqo+YXwMtKMq0u
 2HjA==
X-Gm-Message-State: AOJu0YwnBhSCkETe41Jd2Cv1u9MBOCWVrXOoYlAF1euqmrSC3kaC6cPb
 9CcJrtauFcauxTy7mOUOfMnvoYoprxVcXop4csetRNRESz4XDnvv8ndAOcMg2XE=
X-Google-Smtp-Source: AGHT+IHLFfBk+3bT5MCPiG0Sy+oXtj7PLWqAxH1nSKl7+nAmTFj46bAxdYE1eFckW76M0RQSsj0nqA==
X-Received: by 2002:ac2:5607:0:b0:51a:f596:9d53 with SMTP id
 v7-20020ac25607000000b0051af5969d53mr1449277lfd.42.1714471794305; 
 Tue, 30 Apr 2024 03:09:54 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 b30-20020a056512025e00b0051bc39ef08esm2453377lfo.10.2024.04.30.03.09.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Apr 2024 03:09:53 -0700 (PDT)
Date: Tue, 30 Apr 2024 13:09:52 +0300
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
Subject: Re: [PATCH v1 4/5] drm/ci: skip driver specific tests
Message-ID: <esplx2t6yfrarxflxo5kq2lstx7uiy2atzcxtwf7kugsctnkat@ameojtgtpopj>
References: <20240430091121.508099-1-vignesh.raman@collabora.com>
 <20240430091121.508099-5-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240430091121.508099-5-vignesh.raman@collabora.com>
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

On Tue, Apr 30, 2024 at 02:41:20PM +0530, Vignesh Raman wrote:
> Skip driver specific tests and skip kms tests for
> panfrost driver since it is not a kms driver.
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
>  .../gpu/drm/ci/xfails/amdgpu-stoney-skips.txt   | 14 +++++++++++++-
>  drivers/gpu/drm/ci/xfails/i915-amly-skips.txt   | 14 +++++++++++++-
>  drivers/gpu/drm/ci/xfails/i915-apl-skips.txt    | 14 +++++++++++++-
>  drivers/gpu/drm/ci/xfails/i915-cml-skips.txt    | 12 ++++++++++++
>  drivers/gpu/drm/ci/xfails/i915-glk-skips.txt    | 14 +++++++++++++-
>  drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt    | 14 +++++++++++++-
>  drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt    | 14 +++++++++++++-
>  drivers/gpu/drm/ci/xfails/i915-whl-skips.txt    | 14 +++++++++++++-
>  .../gpu/drm/ci/xfails/mediatek-mt8173-skips.txt | 12 ++++++++++++
>  .../gpu/drm/ci/xfails/mediatek-mt8183-skips.txt | 14 ++++++++++++++
>  drivers/gpu/drm/ci/xfails/meson-g12b-skips.txt  | 14 ++++++++++++++
>  drivers/gpu/drm/ci/xfails/msm-apq8016-skips.txt | 14 ++++++++++++++
>  drivers/gpu/drm/ci/xfails/msm-apq8096-skips.txt | 14 +++++++++++++-


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # msm skips


>  .../msm-sc7180-trogdor-kingoftown-skips.txt     | 15 +++++++++++++++
>  .../msm-sc7180-trogdor-lazor-limozeen-skips.txt | 15 +++++++++++++++
>  drivers/gpu/drm/ci/xfails/msm-sdm845-skips.txt  | 15 +++++++++++++++
>  .../gpu/drm/ci/xfails/rockchip-rk3288-skips.txt | 17 ++++++++++++++++-
>  .../gpu/drm/ci/xfails/rockchip-rk3399-skips.txt | 15 +++++++++++++++
>  .../gpu/drm/ci/xfails/virtio_gpu-none-skips.txt | 15 ++++++++++++++-
>  19 files changed, 260 insertions(+), 10 deletions(-)
>  create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8173-skips.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8183-skips.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/meson-g12b-skips.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/msm-apq8016-skips.txt
> 
-- 
With best wishes
Dmitry
