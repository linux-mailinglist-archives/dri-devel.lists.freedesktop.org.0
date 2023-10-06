Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A2D7BBE1A
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 19:56:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03EA910E553;
	Fri,  6 Oct 2023 17:56:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com
 [IPv6:2607:f8b0:4864:20::1132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B70B110E553
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Oct 2023 17:56:43 +0000 (UTC)
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-5a24b03e22eso29429707b3.0
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Oct 2023 10:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696615003; x=1697219803; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KSCSizx6FgkyRIW0X32uY+4ZXkb204qdp7z+rYedcrk=;
 b=ASOiN3S4WauqGQOetH7YzVSpZ4YD74piJ5aNfS0JTYXYpBjpxKMawrmn/C1V1mjVeG
 ecQUn6VjvdoUjqIiPIDNE1saSRF54QoPm5zBEjQ4RlX2IFII4BZqez7fQyw08qGvzbBo
 dIOMug1o8BsCogT5GvQjiLeZ6Pjo8wiuRZL6qzfk3LZ0DEuwuoDs2A6ukAjLhct7FaJO
 0/w8VWR76XuHW31/sHS4+dolHOgsvI3F86ts1KHtcRmxy/TAvjvfT9h4Y/ZTAueW3OWW
 AvGI3U9NC6/N4tPitm/X7eMXNohCdrUks88791C0WQ3bItoaRT8AJIfn37NP43DvzLqK
 SpaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696615003; x=1697219803;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KSCSizx6FgkyRIW0X32uY+4ZXkb204qdp7z+rYedcrk=;
 b=NiXJ3dW7lwBXat+vp3pDWxnookeRN9p+pdRvP1C/B8a8oW7RbLnSOzDfoMAX7YwZkR
 Q8QRb+XCN9GUzejtBmV+eZaT9VAhSQiLQwDGqZcnQOwF74L/De5I/MF+pasORKRa8IwW
 fZLGoGpafiu9NHiLetOzPCZiBeDtUX/usf36BcD9xHBjyPOj+eWhjd1+Jj3C0R9/NL5a
 7Dui33sSqajK4i9iPjpUeFMTaroFUTLineqehTq2R5OUh1/JSlgzL24lSOSLJvHJt2tO
 nCmOOHn2kWl2diOnDL/Xg1WwUO5egFMJTdZFfPn49h3Dg61c3MDF3BmhJ2/wKxSDQg9q
 25bg==
X-Gm-Message-State: AOJu0Yy100dpT9oGEE0r3B4bxrBkUUKVgFiUIOEm85h7Oq4C9OnWL2h0
 yWaTFA3lWRdn8LmRyBV1Ed8D5T2+5c26L+9zP5xT8g==
X-Google-Smtp-Source: AGHT+IFginRxo8IyMdo5XT8uPhfon+vST76i33p+mAlSB+loxSygqvparl4usE/bieB3hvzQ+T43mG/e0PrIrtMO1wU=
X-Received: by 2002:a0d:d611:0:b0:577:1560:9e17 with SMTP id
 y17-20020a0dd611000000b0057715609e17mr9380421ywd.35.1696615002833; Fri, 06
 Oct 2023 10:56:42 -0700 (PDT)
MIME-Version: 1.0
References: <1696436821-14261-1-git-send-email-quic_khsieh@quicinc.com>
 <1696436821-14261-6-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1696436821-14261-6-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 6 Oct 2023 20:56:31 +0300
Message-ID: <CAA8EJprAQqNUvY8CMkKbUNEWo1vO1ZkgZzk4zhvAsuLc46KeXg@mail.gmail.com>
Subject: Re: [PATCH v5 5/7] drm/msm/dp: incorporate pm_runtime framework into
 DP driver
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 linux-kernel@vger.kernel.org, quic_abhinavk@quicinc.com, andersson@kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, vkoul@kernel.org,
 agross@kernel.org, marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 swboyd@chromium.org, sean@poorly.run, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 4 Oct 2023 at 19:27, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> Currently DP driver is executed independent of PM runtime framework.
> This leads msm eDP panel can not being detected by edp_panel driver during
> generic_edp_panel_probe() due to AUX DPCD read failed at edp panel driver.
> Incorporate PM runtime framework into DP driver so that host controller's
> power and clocks are enable/disable through PM runtime mechanism.
> Once PM runtime framework is incorporated into DP driver, waking up device
> from power up path is not necessary. Hence remove it.
>
> After incorporating pm_runtime framework into eDP/DP driver, dp_pm_suspend()
> to handle power off both DP phy and controller during suspend and
> dp_pm_resume() to handle power on both DP phy and controller during resume
> are not necessary. Therefore both dp_pm_suspend() and dp_pm_resume() are
> dropped and replace with dp_pm_runtime_suspend() and dp_pm_runtime_resume()
> respectively.
>
> Changes in v5:
> -- remove pm_runtime_put_autosuspend feature, use pm_runtime_put_sync() directly
> -- squash add pm_runtime_force_suspend()/resume() patch into this patch
>
> Changes in v4:
> -- reworded commit text to explain why pm_framework is required for edp panel
> -- reworded commit text to explain autosuspend is choiced
> -- delete EV_POWER_PM_GET and PM_EV_POWER_PUT from changes #3
> -- delete dp_display_pm_get() and dp_display_pm_Put() from changes #3
> -- return value from pm_runtime_resume_and_get() directly
> -- check return value of devm_pm_runtime_enable()
> -- delete pm_runtime_xxx from dp_display_remove()
> -- drop dp_display_host_init() from EV_HPD_INIT_SETUP
> -- drop both dp_pm_prepare() and dp_pm_compete() from this change
> -- delete ST_SUSPENDED state
> -- rewording commit text to add more details regrading the purpose
>    of this change
>
> Changes in v3:
> -- incorporate removing pm_runtime_xx() from dp_pwer.c to this patch
> -- use pm_runtime_resume_and_get() instead of pm_runtime_get()
> -- error checking pm_runtime_resume_and_get() return value
> -- add EV_POWER_PM_GET and PM_EV_POWER_PUT to handle HPD_GPIO case
> -- replace dp_pm_suspend() with pm_runtime_force_suspend()
> -- replace dp_pm_resume() with pm_runtime_force_resume()
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Reported-by: kernel test robot <lkp@intel.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_aux.c     |   5 ++
>  drivers/gpu/drm/msm/dp/dp_display.c | 166 ++++++++++++------------------------
>  drivers/gpu/drm/msm/dp/dp_power.c   |  16 ----
>  drivers/gpu/drm/msm/dp/dp_power.h   |  11 ---
>  4 files changed, 59 insertions(+), 139 deletions(-)

[skipped]

> @@ -1702,6 +1638,12 @@ void dp_bridge_hpd_enable(struct drm_bridge *bridge)
>         struct dp_display_private *dp = container_of(dp_display, struct dp_display_private, dp_display);
>
>         mutex_lock(&dp->event_mutex);
> +       if (pm_runtime_resume_and_get(&dp->pdev->dev)) {
> +               DRM_ERROR("failed to start power\n");

It was in the previous review comment:

"failed to resume".

> +               mutex_unlock(&dp->event_mutex);
> +               return;
> +       }
> +

-- 
With best wishes
Dmitry
