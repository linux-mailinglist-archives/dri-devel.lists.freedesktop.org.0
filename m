Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57AFA99F249
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2024 18:06:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9D1010E5B1;
	Tue, 15 Oct 2024 16:06:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="NxfASmyG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60CEC10E5B1
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 16:06:25 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-539e8586b53so2528579e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 09:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1729008380; x=1729613180;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pXMfoHtJcAiX4YFy/v4VHJn4H6jq9Bc4cWujSEwbcdk=;
 b=NxfASmyG6UQwoU4tVmZeraje0sDjn5XZEs53CYsruKjVna5BmIhP5r2KUewcABEVfH
 YVQUyZYC0sev11EaLu5F1Vlkz5Qdor0ON+smB6v3yGj5Ue2I8sC7eRpJDEFyrGcFNU91
 P4/LR5pjcXm75QnkAXL4VpagOFi+nqqDs/kOU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729008380; x=1729613180;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pXMfoHtJcAiX4YFy/v4VHJn4H6jq9Bc4cWujSEwbcdk=;
 b=p3vI5bvfbsZcHwu08rcRrFcwhgtXRfvHEDLbUFF8GMdsFaRVPgO6uMasqNjdEDc4zF
 jNjycfUENbkPmX7sAwBUZYY2jSK9uICWthfaBfsxCcd9W9WTwmF42Byq3CYxAAlVEZ1Z
 xBlZzcP46hDOIkvyrjSDfzBhQe6bI4ZtCzdowXUxnVOVMyceR1e7GDQox/a31Fna1i9a
 CMy6EeaRht+XRvJTzyxlHtBSsXO9KykJcuDa/COvvDHRcSqEEfB4DN/3FgYbANzejR7O
 54LdI5C0wylXvAkSrnsZiPeZZ5mEilVax1/fX1Nsb81Srm2iRkp/rHigWpHCyOZgkq3x
 VHZg==
X-Gm-Message-State: AOJu0YyuogMwao+14D7cbdYTx3Nzk4bHMcLOVmcC3oSCW2R2CzmsX37F
 j3AYpr5WlRiSoZqc/ANGeAf1PnTKTKiCdlOmgZK1icKNc4PgLP3Dh+FcMvfuKBBloxjryOuefRO
 DFg==
X-Google-Smtp-Source: AGHT+IHgws1op9PtmO693QaUbaDMaQv44rgYFnOxfxNHVDhJjELtKHYfpdbbS0pzliLLChe9cywFnw==
X-Received: by 2002:a05:6512:318a:b0:539:8ee8:749e with SMTP id
 2adb3069b0e04-53a03c8fcefmr298801e87.3.1729008380302; 
 Tue, 15 Oct 2024 09:06:20 -0700 (PDT)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com.
 [209.85.167.49]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a00013aa1sm202539e87.265.2024.10.15.09.06.18
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Oct 2024 09:06:19 -0700 (PDT)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-539e8586b53so2528523e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 09:06:18 -0700 (PDT)
X-Received: by 2002:a05:6512:a95:b0:539:edc9:7400 with SMTP id
 2adb3069b0e04-53a03cc8dedmr370366e87.20.1729008378263; Tue, 15 Oct 2024
 09:06:18 -0700 (PDT)
MIME-Version: 1.0
References: <20241015134606.5b87093e@endymion.delvare>
In-Reply-To: <20241015134606.5b87093e@endymion.delvare>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 15 Oct 2024 09:06:04 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WhVWswn28hbxNDLDhMeiZOpsWzsx8OkORniOxWVx_4Gg@mail.gmail.com>
Message-ID: <CAD=FV=WhVWswn28hbxNDLDhMeiZOpsWzsx8OkORniOxWVx_4Gg@mail.gmail.com>
Subject: Re: [PATCH v3] drm/display: Drop obsolete dependency on COMPILE_TEST
To: Jean Delvare <jdelvare@suse.de>
Cc: dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 YueHaibing <yuehaibing@huawei.com>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi,

On Tue, Oct 15, 2024 at 4:46=E2=80=AFAM Jean Delvare <jdelvare@suse.de> wro=
te:
>
> Since commit 0166dc11be91 ("of: make CONFIG_OF user selectable"), it
> is possible to test-build any driver which depends on OF on any
> architecture by explicitly selecting OF. Therefore depending on
> COMPILE_TEST as an alternative is no longer needed.
>
> To avoid reintroducing the randconfig bug originally fixed by commit
> 876271118aa4 ("drm/display: Fix build error without CONFIG_OF"),
> DRM_MSM which selects DRM_DISPLAY_DP_HELPER must explicitly depend
> on OF. This is consistent with what all other DRM drivers are doing.
>
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
> For regular builds, this is a no-op, as OF is always enabled on
> ARCH_QCOM and SOC_IMX5. So this change only affects test builds. As
> explained before, allowing test builds only when OF is enabled
> improves the quality of these test builds, as the result is then
> closer to how the code is built on its intended targets.
>
> Changes in v3:
> * Rebase on top of kernel v6.11.
> Changes in v2:
> * Let DRM_MSM depend on OF so that random test builds won't break.
>
>  drivers/gpu/drm/display/Kconfig |    2 +-
>  drivers/gpu/drm/msm/Kconfig     |    1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> --- linux-6.11.orig/drivers/gpu/drm/display/Kconfig
> +++ linux-6.11/drivers/gpu/drm/display/Kconfig
> @@ -3,7 +3,7 @@
>  config DRM_DISPLAY_DP_AUX_BUS
>         tristate
>         depends on DRM
> -       depends on OF || COMPILE_TEST
> +       depends on OF
>
>  config DRM_DISPLAY_HELPER
>         tristate
> --- linux-6.11.orig/drivers/gpu/drm/msm/Kconfig
> +++ linux-6.11/drivers/gpu/drm/msm/Kconfig
> @@ -6,6 +6,7 @@ config DRM_MSM
>         depends on ARCH_QCOM || SOC_IMX5 || COMPILE_TEST
>         depends on COMMON_CLK
>         depends on IOMMU_SUPPORT
> +       depends on OF

Perhaps nobody landed this because you're missing the msm maintainers
as specified by `./scripts/get_maintainer.pl -f
drivers/gpu/drm/msm/Kconfig` ? I've added them here. It seems like
we'd at least need an Ack by those guys since this modified the
msm/Kconfig...

FWIW I haven't spent massive time studying this, but what you have
here looks reasonable. I'm happy at least with this from a DP AUX bus
perspective:

Acked-by: Douglas Anderson <dianders@chromium.org>

Presumably landing this via drm-misc makes the most sense after MSM
guys give it an Ack.


-Doug
