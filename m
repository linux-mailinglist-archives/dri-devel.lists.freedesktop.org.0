Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A74C6B0EC4
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 17:29:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B660D10E67E;
	Wed,  8 Mar 2023 16:29:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58C6510E679;
 Wed,  8 Mar 2023 16:29:02 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 g73-20020a9d12cf000000b006943a7df072so9268507otg.11; 
 Wed, 08 Mar 2023 08:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678292941;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=S6AnMy8/WsZPRanoTvDwCsZbcfakzo0yUesMsjF9mhM=;
 b=GR94Z98kQIf9rBxegy4IjZdO5vmq9gPkMeXCxvTiVjOfLT7VYLhWAKTlhoJKPWolUb
 YquhN9nLguYz0qnvVrF9eqeqpkvHRlBSTOdI1Ht8jxIzLuQrI2bxVQ/0NITrbqT4vZk7
 XAg8377mevDO914peQH56M3dOB1rzcCEVb8tee/J6iIjDfdxhh2St35c9wCGFqi/TQK5
 5JNvRKCDiXGowcCEjGRWO2vVMShpKD1owxHVfR1kMyfWz4g+blW6ui2mat7ezXq8StRV
 /kxhgANHwqYrLyUo4cpRpT8MpC4ENXHN4efqFYBP4U0RbxTqX/4avshSS9dL3ek+VJDg
 tXAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678292941;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=S6AnMy8/WsZPRanoTvDwCsZbcfakzo0yUesMsjF9mhM=;
 b=EI8IYCZSsgbNmSpdSG5x5R25Or1GfA/7xtqMxgEVzDUJfeaaWsG56WgapAOIiBqu9W
 r1X71kNH4K5HZsj4pF5fmLi8Tf4xF2+flMTQ98/M7eDPN2jeG8HzIgI1afXcArBwLsqF
 PjOwluH6XBo+SYQQ3xpV5g2/fLTNteBj0u7Un83jy084+TOjdEWMHniwOGqVyEoQLXNh
 uNwTJzwOCX8RecDvpkXgnFFxg4oxSRjZ16ei5XPlQ+cLKmqxnTzhA7ekFQhELjS3yc6O
 ea4hMpD/yH6OSxUkADXbh2seH+J/Z2FTvTLUqcjBSqpOvVOh0+o+0P1fZ8SCIRuRZovm
 vAVA==
X-Gm-Message-State: AO0yUKX4+jaDzsR+1dm5e8/E6YmAzJ8VWWKArq7zV5QsV0gg9lQ7XRxx
 yhlWIH2OxwjiJx3oEUckGUbcxtCc9jqibeon5ks=
X-Google-Smtp-Source: AK7set9eQW9jsnvKHALDAAlvJplabCL7Ak5WnHcw4Lgm9F7t/nimX72ClggBH6zabqcutTbIK+yU2QoFW3yfToCdlbU=
X-Received: by 2002:a9d:6112:0:b0:68d:4b7f:e993 with SMTP id
 i18-20020a9d6112000000b0068d4b7fe993mr6539633otj.3.1678292941433; Wed, 08 Mar
 2023 08:29:01 -0800 (PST)
MIME-Version: 1.0
References: <20230308121649.2586705-1-guchun.chen@amd.com>
In-Reply-To: <20230308121649.2586705-1-guchun.chen@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 8 Mar 2023 11:28:49 -0500
Message-ID: <CADnq5_OweRBzWpAOgr5HR8U=BhA2=_k9RaNCtQsV9kQD3sXU8w@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/amdgpu: add flag to enable/disable poll in
 suspend/resume path
To: Guchun Chen <guchun.chen@amd.com>
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 dmitry.baryshkov@linaro.org, spasswolf@web.de, alexander.deucher@amd.com,
 hawking.zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 8, 2023 at 7:17 AM Guchun Chen <guchun.chen@amd.com> wrote:
>
> Some amd asics having reliable hotplug support don't call
> drm_kms_helper_poll_init in driver init sequence. However,
> due to the unified suspend/resume path for all asics, because
> the output_poll_work->func is not set for these asics, a warning
> arrives when suspending.
>
> [   90.656049]  <TASK>
> [   90.656050]  ? console_unlock+0x4d/0x100
> [   90.656053]  ? __irq_work_queue_local+0x27/0x60
> [   90.656056]  ? irq_work_queue+0x2b/0x50
> [   90.656057]  ? __wake_up_klogd+0x40/0x60
> [   90.656059]  __cancel_work_timer+0xed/0x180
> [   90.656061]  drm_kms_helper_poll_disable.cold+0x1f/0x2c [drm_kms_helper]
> [   90.656072]  amdgpu_device_suspend+0x81/0x170 [amdgpu]
> [   90.656180]  amdgpu_pmops_runtime_suspend+0xb5/0x1b0 [amdgpu]
> [   90.656269]  pci_pm_runtime_suspend+0x61/0x1b0
>
> So add use_kms_poll flag as the initialization check in amdgpu code before
> calling drm_kms_helper_poll_disable/drm_kms_helper_poll_enable in suspend/resume
> path.
>
> Bug: https://gitlab.freedesktop.org/drm/amd/-/issues/2411
> Fixes: a4e771729a51("drm/probe_helper: sort out poll_running vs poll_enabled")
> Reported-by: Bert Karwatzki <spasswolf@web.de>
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Guchun Chen <guchun.chen@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 6 ++++--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h   | 1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c   | 1 +
>  drivers/gpu/drm/amd/amdgpu/dce_v10_0.c     | 1 +
>  drivers/gpu/drm/amd/amdgpu/dce_v11_0.c     | 1 +
>  drivers/gpu/drm/amd/amdgpu/dce_v6_0.c      | 1 +
>  drivers/gpu/drm/amd/amdgpu/dce_v8_0.c      | 1 +
>  7 files changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index c4a4e2fe6681..74af0b8c0d08 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -4145,7 +4145,8 @@ int amdgpu_device_suspend(struct drm_device *dev, bool fbcon)
>         if (amdgpu_acpi_smart_shift_update(dev, AMDGPU_SS_DEV_D3))
>                 DRM_WARN("smart shift update failed\n");
>
> -       drm_kms_helper_poll_disable(dev);
> +       if (adev->mode_info.use_kms_poll)
> +               drm_kms_helper_poll_disable(dev);
>
>         if (fbcon)
>                 drm_fb_helper_set_suspend_unlocked(adev_to_drm(adev)->fb_helper, true);
> @@ -4243,7 +4244,8 @@ int amdgpu_device_resume(struct drm_device *dev, bool fbcon)
>         if (fbcon)
>                 drm_fb_helper_set_suspend_unlocked(adev_to_drm(adev)->fb_helper, false);
>
> -       drm_kms_helper_poll_enable(dev);
> +       if (adev->mode_info.use_kms_poll)
> +               drm_kms_helper_poll_enable(dev);
>

Since polling is only enabled for analog outputs and DC doesn't
support any analog outputs, I think we can simplify this to

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index c4a4e2fe6681..74af0b8c0d08 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -4145,7 +4145,8 @@ int amdgpu_device_suspend(struct drm_device
*dev, bool fbcon)
  if (amdgpu_acpi_smart_shift_update(dev, AMDGPU_SS_DEV_D3))
  DRM_WARN("smart shift update failed\n");

- drm_kms_helper_poll_disable(dev);
+ if (!adev->dc_enabled)
+ drm_kms_helper_poll_disable(dev);

  if (fbcon)
  drm_fb_helper_set_suspend_unlocked(adev_to_drm(adev)->fb_helper, true);
@@ -4243,7 +4244,8 @@ int amdgpu_device_resume(struct drm_device *dev,
bool fbcon)
  if (fbcon)
  drm_fb_helper_set_suspend_unlocked(adev_to_drm(adev)->fb_helper, false);

- drm_kms_helper_poll_enable(dev);
+ if (!adev->dc_enabled)
+ drm_kms_helper_poll_enable(dev);

  amdgpu_ras_resume(adev);

Alternatively, we could also just move drm_kms_helper_poll_disable()
into amdgpu_display_suspend_helper() and drm_kms_helper_poll_enable()
into amdgpu_display_resume_helper(), but I'm not sure if the ordering
here is important or not off hand.

Alex



>         amdgpu_ras_resume(adev);
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> index 32fe05c810c6..d383ea3e8e94 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> @@ -343,6 +343,7 @@ struct amdgpu_mode_info {
>         int                     disp_priority;
>         const struct amdgpu_display_funcs *funcs;
>         const enum drm_plane_type *plane_type;
> +       bool use_kms_poll;
>  };
>
>  #define AMDGPU_MAX_BL_LEVEL 0xFF
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
> index 53ff91fc6cf6..3277799a80bb 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
> @@ -518,6 +518,7 @@ static int amdgpu_vkms_sw_init(void *handle)
>                 return r;
>
>         drm_kms_helper_poll_init(adev_to_drm(adev));
> +       adev->mode_info.use_kms_poll = true;
>
>         adev->mode_info.mode_config_initialized = true;
>         return 0;
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
> index 9a24ed463abd..f4d0a7cf588b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
> @@ -2842,6 +2842,7 @@ static int dce_v10_0_sw_init(void *handle)
>                   amdgpu_display_hotplug_work_func);
>
>         drm_kms_helper_poll_init(adev_to_drm(adev));
> +       adev->mode_info.use_kms_poll = true;
>
>         adev->mode_info.mode_config_initialized = true;
>         return 0;
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
> index c14b70350a51..25d0a866ca28 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
> @@ -2961,6 +2961,7 @@ static int dce_v11_0_sw_init(void *handle)
>                   amdgpu_display_hotplug_work_func);
>
>         drm_kms_helper_poll_init(adev_to_drm(adev));
> +       adev->mode_info.use_kms_poll = true;
>
>         adev->mode_info.mode_config_initialized = true;
>         return 0;
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> index 7f85ba5b726f..3936c6bfe2e3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> @@ -2720,6 +2720,7 @@ static int dce_v6_0_sw_init(void *handle)
>                   amdgpu_display_hotplug_work_func);
>
>         drm_kms_helper_poll_init(adev_to_drm(adev));
> +       adev->mode_info.use_kms_poll = true;
>
>         return r;
>  }
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
> index d421a268c9ff..29fb837f5ebf 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
> @@ -2744,6 +2744,7 @@ static int dce_v8_0_sw_init(void *handle)
>                   amdgpu_display_hotplug_work_func);
>
>         drm_kms_helper_poll_init(adev_to_drm(adev));
> +       adev->mode_info.use_kms_poll = true;
>
>         adev->mode_info.mode_config_initialized = true;
>         return 0;
> --
> 2.25.1
>
