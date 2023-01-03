Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D62BB65C822
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jan 2023 21:36:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D738810E213;
	Tue,  3 Jan 2023 20:36:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [IPv6:2001:4860:4864:20::2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B18210E213;
 Tue,  3 Jan 2023 20:36:39 +0000 (UTC)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-15027746720so23074177fac.13; 
 Tue, 03 Jan 2023 12:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DARbbfB1cfRcx5Xv304q3gLYQigPtkLndWCjgoqKBlg=;
 b=MUULpzXODVj3KSyV6X/V9xXUjl2K1nJvW09EiPp6TSKi5ViAQFht20z9FgxFwvuQ49
 tiBFeW9/ElPsVGytdRsLGglK1TXEADxOs+pzuLW/dC5Mn4kc6QEqPS1FNAMjP72N+mb7
 zYDAtsXokUKChBjlD7Nt0TxtxlxgqBwtUhWycx5gS0fzU7nmlYCkeGzEyEivjwOwbW09
 ySI9Ued1GZrgsV+08ofxWwZuMEOlXppxUZYq887F3p+linfLDP2keAyiV+dHZfvheuxl
 zLJZR4yNLBdN9DR0FqIOCNEeL+m6MddwMQY5pTu+HD1+btdhSZxLFqpb+KoBy4L1IXic
 hR1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DARbbfB1cfRcx5Xv304q3gLYQigPtkLndWCjgoqKBlg=;
 b=G49uueWPnjHfowC/BtgWziduRlKMOpcYEPhIyU4RmWIneo1vA8VEUWxq5mwwGbdWko
 MFuzvh1giBHugrnfWyKsQ4pgzqc9CYwXcSLRVq1WrYt9qyC5h3g+2Y0YN1yFl/2c+G2y
 Xni4CaK8a5snu1yWB2gOyJJIYSrVnqZ0PbHb4MQ2H4UYLoxUGhxCsXSe6CobAgiSt8JQ
 VO111cEU+RHDMtHntT8MFA9zHCQvCnzVP6BEbmi9kmJ/yDWVPnrnTYmvlyrgbUeScl+k
 tkDnFsX+NAC8tSbLfnq+31N8rh8Ak5ZpT/U0CLWCRUBxwJMINTSkmPSf1r4zPy50c3y4
 Q+vQ==
X-Gm-Message-State: AFqh2krZ32r6j9KVLg7QnBK+dpbRrbfW8TFP/t/cZ0rb7fCwAUIr6HTz
 lBAxGtoIdrdhWxg+o/uMlvfE/FckGuTtbo9MOmQ=
X-Google-Smtp-Source: AMrXdXuI5mtIULbEh6oZUp3W7INMKGCNm6pDPu92qrpaEtFTnRCtG2DBLRzmvSH/FSHCfZi6Uzq7LDG4/a5reDzoFPc=
X-Received: by 2002:a05:6870:970e:b0:148:3c8f:15ab with SMTP id
 n14-20020a056870970e00b001483c8f15abmr3723607oaq.46.1672778198192; Tue, 03
 Jan 2023 12:36:38 -0800 (PST)
MIME-Version: 1.0
References: <20221223092858.1830944-1-xurui@kylinos.cn>
In-Reply-To: <20221223092858.1830944-1-xurui@kylinos.cn>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 3 Jan 2023 15:36:26 -0500
Message-ID: <CADnq5_PBr4u+7AE8aW6+0n0sru80ktfoGTCSzqgpDr4RD=QM2Q@mail.gmail.com>
Subject: Re: [PATCH v2] drm/amdgpu: Retry DDC probing on DVI on failure if we
 got an HPD interrupt
To: xurui <xurui@kylinos.cn>
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
Cc: kernel test robot <lkp@intel.com>, Xinhui.Pan@amd.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 23, 2022 at 9:23 AM xurui <xurui@kylinos.cn> wrote:
>
> HPD signals on DVI ports can be fired off before the pins required for
> DDC probing actually make contact, due to the pins for HPD making
> contact first. This results in a HPD signal being asserted but DDC
> probing failing, resulting in hotplugging occasionally failing.
>
> Rescheduling the hotplug work for a second when we run into an HPD
> signal with a failing DDC probe usually gives enough time for the rest
> of the connector's pins to make contact, and fixes this issue.
>
> Signed-off-by: xurui <xurui@kylinos.cn>
> Reported-by: kernel test robot<lkp@intel.com>

Applied.  Thanks!

Alex


> ---
> V1 -> V2: Fixed a compilation error
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h           |  2 +-
>  .../gpu/drm/amd/amdgpu/amdgpu_connectors.c    | 22 ++++++++++++++++++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      |  1 +
>  drivers/gpu/drm/amd/amdgpu/dce_v10_0.c        |  6 ++---
>  drivers/gpu/drm/amd/amdgpu/dce_v11_0.c        |  6 ++---
>  drivers/gpu/drm/amd/amdgpu/dce_v6_0.c         |  6 ++---
>  drivers/gpu/drm/amd/amdgpu/dce_v8_0.c         |  6 ++---
>  8 files changed, 36 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index 6b74df446694..b1d901fe578e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -870,7 +870,7 @@ struct amdgpu_device {
>         struct amdgpu_vkms_output       *amdgpu_vkms_output;
>         struct amdgpu_mode_info         mode_info;
>         /* For pre-DCE11. DCE11 and later are in "struct amdgpu_device->dm" */
> -       struct work_struct              hotplug_work;
> +       struct delayed_work         hotplug_work;
>         struct amdgpu_irq_src           crtc_irq;
>         struct amdgpu_irq_src           vline0_irq;
>         struct amdgpu_irq_src           vupdate_irq;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> index 2ebbc6382a06..d2abd334b1b5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> @@ -996,13 +996,33 @@ amdgpu_connector_dvi_detect(struct drm_connector *connector, bool force)
>                 }
>         }
>
> +       if (amdgpu_connector->detected_hpd_without_ddc) {
> +               force = true;
> +               amdgpu_connector->detected_hpd_without_ddc = false;
> +       }
> +
>         if (!force && amdgpu_connector_check_hpd_status_unchanged(connector)) {
>                 ret = connector->status;
>                 goto exit;
>         }
>
> -       if (amdgpu_connector->ddc_bus)
> +       if (amdgpu_connector->ddc_bus) {
>                 dret = amdgpu_display_ddc_probe(amdgpu_connector, false);
> +
> +               /* Sometimes the pins required for the DDC probe on DVI
> +                * connectors don't make contact at the same time that the ones
> +                * for HPD do. If the DDC probe fails even though we had an HPD
> +                * signal, try again later
> +                */
> +               if (!dret && !force &&
> +                   amdgpu_display_hpd_sense(adev, amdgpu_connector->hpd.hpd)) {
> +                       DRM_DEBUG_KMS("hpd detected without ddc, retrying in 1 second\n");
> +                       amdgpu_connector->detected_hpd_without_ddc = true;
> +                       schedule_delayed_work(&adev->hotplug_work,
> +                                             msecs_to_jiffies(1000));
> +                       goto exit;
> +               }
> +       }
>         if (dret) {
>                 amdgpu_connector->detected_by_load = false;
>                 amdgpu_connector_free_edid(connector);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> index b22471b3bd63..a876648e3d7a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> @@ -63,7 +63,7 @@
>  void amdgpu_display_hotplug_work_func(struct work_struct *work)
>  {
>         struct amdgpu_device *adev = container_of(work, struct amdgpu_device,
> -                                                 hotplug_work);
> +                                                 hotplug_work.work);
>         struct drm_device *dev = adev_to_drm(adev);
>         struct drm_mode_config *mode_config = &dev->mode_config;
>         struct drm_connector *connector;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> index 8a39300b1a84..93c73faa5714 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> @@ -534,6 +534,7 @@ struct amdgpu_connector {
>         void *con_priv;
>         bool dac_load_detect;
>         bool detected_by_load; /* if the connection status was determined by load */
> +       bool detected_hpd_without_ddc; /* if an HPD signal was detected on DVI, but ddc probing failed */
>         uint16_t connector_object_id;
>         struct amdgpu_hpd hpd;
>         struct amdgpu_router router;
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
> index 248f1a4e915f..e85e57933cc4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
> @@ -2837,7 +2837,7 @@ static int dce_v10_0_sw_init(void *handle)
>         if (r)
>                 return r;
>
> -       INIT_WORK(&adev->hotplug_work,
> +       INIT_DELAYED_WORK(&adev->hotplug_work,
>                   amdgpu_display_hotplug_work_func);
>
>         drm_kms_helper_poll_init(adev_to_drm(adev));
> @@ -2902,7 +2902,7 @@ static int dce_v10_0_hw_fini(void *handle)
>
>         dce_v10_0_pageflip_interrupt_fini(adev);
>
> -       flush_work(&adev->hotplug_work);
> +       flush_delayed_work(&adev->hotplug_work);
>
>         return 0;
>  }
> @@ -3302,7 +3302,7 @@ static int dce_v10_0_hpd_irq(struct amdgpu_device *adev,
>
>         if (disp_int & mask) {
>                 dce_v10_0_hpd_int_ack(adev, hpd);
> -               schedule_work(&adev->hotplug_work);
> +               schedule_delayed_work(&adev->hotplug_work, 0);
>                 DRM_DEBUG("IH: HPD%d\n", hpd + 1);
>         }
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
> index cd9c19060d89..6b406bb7f3f3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
> @@ -2956,7 +2956,7 @@ static int dce_v11_0_sw_init(void *handle)
>         if (r)
>                 return r;
>
> -       INIT_WORK(&adev->hotplug_work,
> +       INIT_DELAYED_WORK(&adev->hotplug_work,
>                   amdgpu_display_hotplug_work_func);
>
>         drm_kms_helper_poll_init(adev_to_drm(adev));
> @@ -3032,7 +3032,7 @@ static int dce_v11_0_hw_fini(void *handle)
>
>         dce_v11_0_pageflip_interrupt_fini(adev);
>
> -       flush_work(&adev->hotplug_work);
> +       flush_delayed_work(&adev->hotplug_work);
>
>         return 0;
>  }
> @@ -3426,7 +3426,7 @@ static int dce_v11_0_hpd_irq(struct amdgpu_device *adev,
>
>         if (disp_int & mask) {
>                 dce_v11_0_hpd_int_ack(adev, hpd);
> -               schedule_work(&adev->hotplug_work);
> +               schedule_delayed_work(&adev->hotplug_work, 0);
>                 DRM_DEBUG("IH: HPD%d\n", hpd + 1);
>         }
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> index 76323deecc58..2aa21eec0e06 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> @@ -2715,7 +2715,7 @@ static int dce_v6_0_sw_init(void *handle)
>                 return r;
>
>         /* Pre-DCE11 */
> -       INIT_WORK(&adev->hotplug_work,
> +       INIT_DELAYED_WORK(&adev->hotplug_work,
>                   amdgpu_display_hotplug_work_func);
>
>         drm_kms_helper_poll_init(adev_to_drm(adev));
> @@ -2776,7 +2776,7 @@ static int dce_v6_0_hw_fini(void *handle)
>
>         dce_v6_0_pageflip_interrupt_fini(adev);
>
> -       flush_work(&adev->hotplug_work);
> +       flush_delayed_work(&adev->hotplug_work);
>
>         return 0;
>  }
> @@ -3103,7 +3103,7 @@ static int dce_v6_0_hpd_irq(struct amdgpu_device *adev,
>                 tmp = RREG32(mmDC_HPD1_INT_CONTROL + hpd_offsets[hpd]);
>                 tmp |= DC_HPD1_INT_CONTROL__DC_HPD1_INT_ACK_MASK;
>                 WREG32(mmDC_HPD1_INT_CONTROL + hpd_offsets[hpd], tmp);
> -               schedule_work(&adev->hotplug_work);
> +               schedule_delayed_work(&adev->hotplug_work, 0);
>                 DRM_DEBUG("IH: HPD%d\n", hpd + 1);
>         }
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
> index 01cf3ab111cb..9da338889d36 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
> @@ -2739,7 +2739,7 @@ static int dce_v8_0_sw_init(void *handle)
>                 return r;
>
>         /* Pre-DCE11 */
> -       INIT_WORK(&adev->hotplug_work,
> +       INIT_DELAYED_WORK(&adev->hotplug_work,
>                   amdgpu_display_hotplug_work_func);
>
>         drm_kms_helper_poll_init(adev_to_drm(adev));
> @@ -2802,7 +2802,7 @@ static int dce_v8_0_hw_fini(void *handle)
>
>         dce_v8_0_pageflip_interrupt_fini(adev);
>
> -       flush_work(&adev->hotplug_work);
> +       flush_delayed_work(&adev->hotplug_work);
>
>         return 0;
>  }
> @@ -3195,7 +3195,7 @@ static int dce_v8_0_hpd_irq(struct amdgpu_device *adev,
>                 tmp = RREG32(mmDC_HPD1_INT_CONTROL + hpd_offsets[hpd]);
>                 tmp |= DC_HPD1_INT_CONTROL__DC_HPD1_INT_ACK_MASK;
>                 WREG32(mmDC_HPD1_INT_CONTROL + hpd_offsets[hpd], tmp);
> -               schedule_work(&adev->hotplug_work);
> +               schedule_delayed_work(&adev->hotplug_work, 0);
>                 DRM_DEBUG("IH: HPD%d\n", hpd + 1);
>         }
>
> --
> 2.25.1
>
