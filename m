Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0736B26AF
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 15:22:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96F3D10E008;
	Thu,  9 Mar 2023 14:22:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A9EF10E008;
 Thu,  9 Mar 2023 14:22:31 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id bp19so1752584oib.4;
 Thu, 09 Mar 2023 06:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678371750;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8Vvu22B2KkI3OTryM6eqbW56O78+r4Q6OMfuLzoaZcM=;
 b=FrAx76yPOfZskjI0zdqnCU35c1Px9zJPMOSZ4t0h+HeF3jUaNbut4vF+8o+0wtdIsg
 ECIfERm7gXdQgkEJ6S4kas3CoiEgkIDlOXW8CrPHIQTID0XFQsjSkFsaZKlGljn8V6vF
 9thLPedOvPMLUlqGrAArGKuHU+zeI27pKuNQe0W2yyg6bQPyUHScht7Cp39ZUyFs84DW
 YyviZlCO/gz6qUFiJmHyHxLRrjUJNYOepMPaLmb8iSroaMk2UbBigc0aQZIEp5jpJhQ1
 LX6aEmJUZ8VGXwVF3OONqjOmsyhaxsIyRPk/oU6vavd1uFA3qrxtbyhn46nn7g72V5j9
 E1aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678371750;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8Vvu22B2KkI3OTryM6eqbW56O78+r4Q6OMfuLzoaZcM=;
 b=vzD8pjvLYR8xvYqbRVIZk+2vO8Ap+MvP9ZOLHsEZxkyfuaGOAe/59XntZNfcDZJimA
 dLPDnw8R39jY5t7y6pdRLl4voC8N+x3+goGpkjXmM5PVusCv4xx0puVMR3eRxpGSSL6k
 n+nk3gBB1xLPiukOxWJNlTAP7k2MEcZAbN+KFdZ+6+38AcmgSJ8AVsQSmURACugFmFjb
 MFYEGMnHSq6NHNj524EPuTKC+MSJ73l4H0oa1L15mfQCLN8peByFOgiLUFKs1POfBgqS
 X9Hidcu4NPOeVBdB8CrnNzBIyyFWnbm8CUOy4IJUB4X9q8CYlYLxFq8v7njCEpEjLN+e
 SAVw==
X-Gm-Message-State: AO0yUKV0JFWrVqJA4tLbWaEkrtn6/9RCJOVO+CmP2Hu1/HlQ0DKKALmt
 pHKbSghJjr2PzY32cNE40G+JiXQ7vl3MDu3F/SBFJIl+
X-Google-Smtp-Source: AK7set+9kKbLVg1plUi97Km9XrRa1F18hZdO2BbDiwrjbRVHRfogCWaiuQXyXHdgj3z0vTfzF0B8KgsyjJR6of+MPMA=
X-Received: by 2002:a05:6808:3c1:b0:384:2b09:45f7 with SMTP id
 o1-20020a05680803c100b003842b0945f7mr7444738oie.4.1678371750680; Thu, 09 Mar
 2023 06:22:30 -0800 (PST)
MIME-Version: 1.0
References: <20230309054801.2709152-1-guchun.chen@amd.com>
In-Reply-To: <20230309054801.2709152-1-guchun.chen@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 9 Mar 2023 09:22:19 -0500
Message-ID: <CADnq5_Npv=Gni7+Nc_OSnDz=MB2FawevDaJmHKw_ZzpV0eMfcQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/amdgpu: move poll enabled/disable into non DC path
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

On Thu, Mar 9, 2023 at 12:48 AM Guchun Chen <guchun.chen@amd.com> wrote:
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
> drm_kms_helper_poll_enable/disable is valid when poll_init is called in
> amdgpu code, which is only used in non DC path. So move such codes into
> non-DC path code to get rid of such warnings.
>
> Bug: https://gitlab.freedesktop.org/drm/amd/-/issues/2411
> Fixes: a4e771729a51("drm/probe_helper: sort out poll_running vs poll_enabled")
> Reported-by: Bert Karwatzki <spasswolf@web.de>
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Suggested-by: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Guchun Chen <guchun.chen@amd.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c  | 4 ----
>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c | 4 ++++
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index c4a4e2fe6681..da5b0258a237 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -4145,8 +4145,6 @@ int amdgpu_device_suspend(struct drm_device *dev, bool fbcon)
>         if (amdgpu_acpi_smart_shift_update(dev, AMDGPU_SS_DEV_D3))
>                 DRM_WARN("smart shift update failed\n");
>
> -       drm_kms_helper_poll_disable(dev);
> -
>         if (fbcon)
>                 drm_fb_helper_set_suspend_unlocked(adev_to_drm(adev)->fb_helper, true);
>
> @@ -4243,8 +4241,6 @@ int amdgpu_device_resume(struct drm_device *dev, bool fbcon)
>         if (fbcon)
>                 drm_fb_helper_set_suspend_unlocked(adev_to_drm(adev)->fb_helper, false);
>
> -       drm_kms_helper_poll_enable(dev);
> -
>         amdgpu_ras_resume(adev);
>
>         if (adev->mode_info.num_crtc) {
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> index 503f89a766c3..d60fe7eb5579 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> @@ -1618,6 +1618,8 @@ int amdgpu_display_suspend_helper(struct amdgpu_device *adev)
>         struct drm_connector_list_iter iter;
>         int r;
>
> +       drm_kms_helper_poll_disable(dev);
> +
>         /* turn off display hw */
>         drm_modeset_lock_all(dev);
>         drm_connector_list_iter_begin(dev, &iter);
> @@ -1694,6 +1696,8 @@ int amdgpu_display_resume_helper(struct amdgpu_device *adev)
>
>         drm_modeset_unlock_all(dev);
>
> +       drm_kms_helper_poll_enable(dev);
> +
>         return 0;
>  }
>
> --
> 2.25.1
>
