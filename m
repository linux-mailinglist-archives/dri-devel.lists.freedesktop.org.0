Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06EFE57BBA8
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 18:44:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9632290E9D;
	Wed, 20 Jul 2022 16:44:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDB9190E79;
 Wed, 20 Jul 2022 16:44:54 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id va17so34160707ejb.0;
 Wed, 20 Jul 2022 09:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=F9ujADQ+6uUfQiUV6k7zVP85W+q012PovkMlFhLl5HM=;
 b=d2EXNwdPsm25Qgdijm5q1GXRv8EiDfoGUINDo0Flpw2N7x5JtmHtOe0WaEdCm98EAe
 t3hkPqmQrOjbBvB7Z5mbwNmBthJWYoIjACjajMToaVw7rOjoD+iQGvvAn3+P4k5W1SrT
 9UgQHOMfD4yzE7KaC1G1UgNKlTFuTAv16Fw50Qhc3XcMuDJWPKbHWYo7wHfzQs6YhOZJ
 8BKDG2XwGvwyy3g2lHnvQYnUsRywZOvu2nOUysOYJ/+/3T/SKO9nn4oH1zeXZ3Y+Gwqm
 KHngpg4Y9vEIz5TlYDh/I9uVpbSqxngH/ECwiKjpoPBJ2WHCpttiajyOgA7YKgKJ/SMA
 2fcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F9ujADQ+6uUfQiUV6k7zVP85W+q012PovkMlFhLl5HM=;
 b=d8KyaMmQhwcMEAvNQsJTc3ZDKsDuG1Zf9jJOKfwUdumniUJ5dcBlN4qRbGx306V6e+
 pZTgAZAt2C1VopnEjYQzS0UvGYJBpLGf3zsTZtv3ic24DD1WBsJuEiq33IZI1NbQQ5R9
 jWUDmQshVT5s965HOfs7XAN3io1QfFUOUhKZPY5nFhUDnryDt1jylQOCpTA92Z0oc0WQ
 QbZTWBxYD73HCOjL+J2dEDaLgZLBAdv8cOMZJig5xe39bwD9tOhErHcoFogrFLPA/+dV
 kyc6pR1+NWYKxyCK7MEuOkHSwwaYRNXq2BQEk7KP+FYs1yycJsmOlocpsUq2RB9i5k4J
 2upw==
X-Gm-Message-State: AJIora8bSeh3QDql9TUz9EjFzpZ1Cyf2VEnhxxDkO2MNyS/6pdB4wL1q
 EBAuR9TcXIG5MOfycAr8vbhYnSKLZesx7lzB7Xs=
X-Google-Smtp-Source: AGRyM1sMxt5iIjJZaHAcJFwgzttrLeRyTn4gfiagli7Ckr/UFny44wo4mpiuF1Hvpy0Bw61iBdTMjqkWK1dZtDrLtxI=
X-Received: by 2002:a17:907:2722:b0:72b:6a93:bf9a with SMTP id
 d2-20020a170907272200b0072b6a93bf9amr34535266ejl.424.1658335493336; Wed, 20
 Jul 2022 09:44:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220712193910.439171-1-hdegoede@redhat.com>
 <20220712193910.439171-4-hdegoede@redhat.com>
In-Reply-To: <20220712193910.439171-4-hdegoede@redhat.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 20 Jul 2022 12:44:41 -0400
Message-ID: <CADnq5_PcpwtgdBrn7_1B4Fq5CNGbkSO94c5Qzf8NfbnpwBqHAw@mail.gmail.com>
Subject: Re: [PATCH v2 03/29] drm/amdgpu: Don't register backlight when
 another backlight should be used
To: Hans de Goede <hdegoede@redhat.com>
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
Cc: Pan@freedesktop.org, Karol Herbst <kherbst@redhat.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-acpi@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>,
 Len Brown <lenb@kernel.org>, Daniel Dadap <ddadap@nvidia.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, Mark Gross <markgross@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Xinhui <Xinhui.Pan@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 12, 2022 at 3:39 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Before this commit when we want userspace to use the acpi_video backlight
> device we register both the GPU's native backlight device and acpi_video's
> firmware acpi_video# backlight device. This relies on userspace preferring
> firmware type backlight devices over native ones.
>
> Registering 2 backlight devices for a single display really is
> undesirable, don't register the GPU's native backlight device when
> another backlight device should be used.
>
> Changes in v2:
> - To avoid linker errors when amdgpu is builtin and video_detect.c is in
>   a module, select ACPI_VIDEO and its deps if ACPI && X86 are enabled.
>   When these are not set, ACPI_VIDEO is disabled, ensuring the stubs
>   from acpi/video.h will be used.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Acked-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/Kconfig                           | 6 ++++++
>  drivers/gpu/drm/amd/amdgpu/atombios_encoders.c    | 7 +++++++
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 7 +++++++
>  3 files changed, 20 insertions(+)
>
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index aaa7ad1f0614..d65119860760 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -258,6 +258,12 @@ config DRM_AMDGPU
>         select HWMON
>         select BACKLIGHT_CLASS_DEVICE
>         select INTERVAL_TREE
> +       # amdgpu depends on ACPI_VIDEO when X86 and ACPI are both enabled
> +       # for select to work, ACPI_VIDEO's dependencies must also be selected
> +       select INPUT if ACPI && X86
> +       select X86_PLATFORM_DEVICES if ACPI && X86
> +       select ACPI_WMI if ACPI && X86
> +       select ACPI_VIDEO if ACPI && X86
>         help
>           Choose this option if you have a recent AMD Radeon graphics card.
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c b/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
> index fa7421afb9a6..abf209e36fca 100644
> --- a/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
> +++ b/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
> @@ -26,6 +26,8 @@
>
>  #include <linux/pci.h>
>
> +#include <acpi/video.h>
> +
>  #include <drm/drm_crtc_helper.h>
>  #include <drm/amdgpu_drm.h>
>  #include "amdgpu.h"
> @@ -184,6 +186,11 @@ void amdgpu_atombios_encoder_init_backlight(struct amdgpu_encoder *amdgpu_encode
>         if (!(adev->mode_info.firmware_flags & ATOM_BIOS_INFO_BL_CONTROLLED_BY_GPU))
>                 return;
>
> +       if (!acpi_video_backlight_use_native()) {
> +               DRM_INFO("Skipping amdgpu atom DIG backlight registration\n");
> +               return;
> +       }
> +
>         pdata = kmalloc(sizeof(struct amdgpu_backlight_privdata), GFP_KERNEL);
>         if (!pdata) {
>                 DRM_ERROR("Memory allocation failed\n");
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 5eb111d35793..3b03a95e59a8 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -86,6 +86,8 @@
>  #include <drm/drm_audio_component.h>
>  #include <drm/drm_gem_atomic_helper.h>
>
> +#include <acpi/video.h>
> +
>  #include "ivsrcid/dcn/irqsrcs_dcn_1_0.h"
>
>  #include "dcn/dcn_1_0_offset.h"
> @@ -4050,6 +4052,11 @@ amdgpu_dm_register_backlight_device(struct amdgpu_display_manager *dm)
>         amdgpu_dm_update_backlight_caps(dm, dm->num_of_edps);
>         dm->brightness[dm->num_of_edps] = AMDGPU_MAX_BL_LEVEL;
>
> +       if (!acpi_video_backlight_use_native()) {
> +               DRM_INFO("Skipping amdgpu DM backlight registration\n");
> +               return;
> +       }
> +
>         props.max_brightness = AMDGPU_MAX_BL_LEVEL;
>         props.brightness = AMDGPU_MAX_BL_LEVEL;
>         props.type = BACKLIGHT_RAW;
> --
> 2.36.0
>
