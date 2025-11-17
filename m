Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A379C66052
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 20:49:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9543A10E1C8;
	Mon, 17 Nov 2025 19:49:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fVLLfVwj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 492FC10E1C8
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 19:49:05 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-7baa5787440so124729b3a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 11:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763408945; x=1764013745; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uwN9xd/+ICCzUFjJbywSX4hJRNbIwbnqiOuOojfw4bA=;
 b=fVLLfVwjFMl516VbEQBcrftJljChIwAl6bPweiKM0n+uh8DvCODISzvtkGBpoLj4Yk
 1P7NoRl35c0nMwXA1YyDlhk8tkUGUTQ6rQCozW0BYmrx0FHdqiIl+nnEG+vw1GdVOu4D
 jclskGvMvv0HwCCMUXKkBdiB3j2UYGqqJ1Vz6UfxWu4PWbNzzaVfHqV/VqvHyeeKXn75
 LGAZWjKwrX8R8ZTOY1lT4mUrONVMULkVSVxJUZW6Z80pkumq25M7dQEnoUZ2fzexL1E2
 CDftCvYtipD2WNyyiSedyCyvNjx9I+5L+GUUtxnHKgCC8dxE0i+GRo5fDd8cJHczqQxY
 a7SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763408945; x=1764013745;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=uwN9xd/+ICCzUFjJbywSX4hJRNbIwbnqiOuOojfw4bA=;
 b=kosE6nQrASwg4PH0R3vUuOdjslDYtSQBjpcUPBdSL7czeZ6dFQmKvYa4m7Mgsi/EC7
 XlAMppDugxMkSARW9BvcAYKsTVxHtboNYaON1jheWVzlONoPP3AlGtH/EkyhR8s1pwww
 6qQHQ6t1hDZS/Z4OI/hBofpocHf1EepwvOSfd4a/7D2RDZiH+6UI7Z1uPalNRqGNzzZ4
 eBTreiSQCealijc35k6S2+AhFUkUXm98ChbYHLnoKb2I87xb46l+pyQXoIBs54vpNSQP
 L9VwJUQHdkmPpt2V+v6KYN4x5iFg0ELfhrJVbAtsgerFF1PD5IBWStqFJNkO+ibVkQBV
 NLsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0c901R/GYRM2rQ/tFeQhYiZwAQ4oonqz2XIih160zXRYB2k8tmJ7TTHDcFr/L4pNnCl+8klJFo1I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/Wf/iJAaK98aJ/IrsW4dYn7A6VdRLbqt60TXi5S9zwkxFsqUF
 LMlALnm2Iv3MCKk73n9WF3ns97VNdUr/dq5fFac5HZo/wjS49LHNJIDMhIIbgZVAtdxka733XiF
 3dj4dbmM3ZRu8bwYjvfi/pw+LV7ct4VA=
X-Gm-Gg: ASbGncu8DevnHNcA0OdiN7c7Q5bW+xVLLqlGlFAja3xDh/+zFLONRBH8NXAnXdCpb7T
 pGH7dFDfs0eKPoTwFfdJtcnbHEHv6JIHEUSupuWDckVGsTwJtfgeiMb9Wtwz+24wVhrP1uNw6wG
 VP5u+ilfz+akoaTVsKvW1VUmHdVu1O6UkL9UpAyEuycltKHjWXj2jtEWrv9lNJUYBITYscG2d1g
 WqVf+NyNDLAGYqN1YaUTPwrkcUX0RIcuSUsfCbtPxTkHX+2Aquz/OHUhvPItgbKsKbxw71XoKNw
 OjKOXQ==
X-Google-Smtp-Source: AGHT+IE/8ggS6LUeyVsp5eEk+e9DOPtpK5cG7eKvt4t1ew0SgFR+tKonGHD5OH0s8yx7jrceY7HF7o2yVSkpv+xcRzs=
X-Received: by 2002:a05:7022:6297:b0:11a:c044:ec44 with SMTP id
 a92af1059eb24-11c78562aa4mr21812c88.0.1763408944651; Mon, 17 Nov 2025
 11:49:04 -0800 (PST)
MIME-Version: 1.0
References: <20251114-vram-carveout-tuning-for-upstream-v2-0-4f6bdd48030d@amd.com>
 <20251114-vram-carveout-tuning-for-upstream-v2-4-4f6bdd48030d@amd.com>
In-Reply-To: <20251114-vram-carveout-tuning-for-upstream-v2-4-4f6bdd48030d@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 17 Nov 2025 14:48:52 -0500
X-Gm-Features: AWmQ_blyq-3bafSyeznjWZ3ESVeo9aWvK16_VaoKKclzjAv-7Z2Oe4CELV6neqw
Message-ID: <CADnq5_Mjo7M-ndi0mOUZzrvCnz2gUY0wm0a7uGtdLp=_kWLW0Q@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] drm/amdgpu: add UMA allocation interfaces to sysfs
To: "Yo-Jung Leo Lin (AMD)" <Leo.Lin@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, "Tsao, Anson" <anson.tsao@amd.com>, 
 "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>
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

On Fri, Nov 14, 2025 at 3:52=E2=80=AFAM Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.=
com> wrote:
>
> Add two sysfs files as interfaces to inspect or change UMA carveout
> size. These files are:
>
> - uma_carveout_options: a read-only file listing all the available
>   UMA allocation options and their index.
>
> - uma_carveout: a file that is both readable and writable. On read,
>   it shows the index of the current setting. Writing a valid index
>   into this file allows users to change the UMA carveout size to that
>   option on the next boot.

Would it be cleaner to combine these?  Reading the file would show the
indexed list of options with a * next to the currently selected one
and then writing the index to the file would cause the change to take
effect on the next reboot.

Alex

>
> Co-developed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
> Signed-off-by: Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c | 127 +++++++++++++++++++++++++=
++++++
>  1 file changed, 127 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_acpi.c
> index 444ab4102168..b9378f34eb79 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> @@ -30,6 +30,7 @@
>  #include <linux/power_supply.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/suspend.h>
> +#include <linux/device.h>
>  #include <acpi/video.h>
>  #include <acpi/actbl.h>
>
> @@ -1247,6 +1248,125 @@ int amdgpu_acpi_get_mem_info(struct amdgpu_device=
 *adev, int xcc_id,
>         return -ENOENT;
>  }
>
> +static ssize_t uma_carveout_options_show(struct device *dev,
> +                                        struct device_attribute *attr,
> +                                        char *buf)
> +{
> +       struct amdgpu_uma_carveout_info *uma_info =3D &amdgpu_acpi_priv.a=
tcs.uma_info;
> +       ssize_t size =3D 0;
> +
> +       if (!uma_info || !uma_info->num_entries)
> +               return -ENODEV;
> +
> +       for (int i =3D 0; i < uma_info->num_entries; i++) {
> +               size +=3D sysfs_emit_at(buf, size, "%d: %s (%u GB)\n",
> +                                     i,
> +                                     uma_info->entries[i].name,
> +                                     uma_info->entries[i].memory_carved)=
;
> +       }
> +
> +       return size;
> +}
> +static DEVICE_ATTR_RO(uma_carveout_options);
> +
> +static ssize_t uma_carveout_show(struct device *dev,
> +                                struct device_attribute *attr,
> +                                char *buf)
> +{
> +       return sysfs_emit(buf, "%u\n", amdgpu_acpi_priv.atcs.uma_info.uma=
_option_index);
> +}
> +
> +static ssize_t uma_carveout_store(struct device *dev,
> +                                 struct device_attribute *attr,
> +                                 const char *buf, size_t count)
> +{
> +       struct amdgpu_uma_carveout_info *uma_info =3D &amdgpu_acpi_priv.a=
tcs.uma_info;
> +       struct drm_device *ddev =3D dev_get_drvdata(dev);
> +       struct amdgpu_device *adev =3D drm_to_adev(ddev);
> +       struct amdgpu_uma_carveout_option *opt;
> +       unsigned long val;
> +       uint8_t flags;
> +       int r;
> +
> +       r =3D kstrtoul(buf, 10, &val);
> +       if (r)
> +               return r;
> +
> +       if (val >=3D uma_info->num_entries)
> +               return -EINVAL;
> +
> +       opt =3D &uma_info->entries[val];
> +
> +       if (!(opt->flags & AMDGPU_UMA_FLAG_AUTO) &&
> +           !(opt->flags & AMDGPU_UMA_FLAG_CUSTOM)) {
> +               drm_err_once(ddev, "Option %ul not supported due to lack =
of Custom/Auto flag", r);
> +               return -EINVAL;
> +       }
> +
> +       flags =3D opt->flags;
> +       flags &=3D ~((flags & AMDGPU_UMA_FLAG_AUTO) >> 1);
> +
> +       guard(mutex)(&uma_info->update_lock);
> +
> +       r =3D amdgpu_acpi_set_uma_allocation_size(adev, val, flags);
> +       if (r)
> +               return r;
> +
> +       uma_info->uma_option_index =3D val;
> +
> +       return count;
> +}
> +static DEVICE_ATTR_RW(uma_carveout);
> +
> +static struct attribute *amdgpu_uma_attrs[] =3D {
> +       &dev_attr_uma_carveout.attr,
> +       &dev_attr_uma_carveout_options.attr,
> +       NULL
> +};
> +
> +const struct attribute_group amdgpu_uma_attr_group =3D {
> +       .attrs =3D amdgpu_uma_attrs
> +};
> +
> +static int amdgpu_acpi_uma_option_init(struct amdgpu_device *adev)
> +{
> +       struct amdgpu_atcs *atcs =3D &amdgpu_acpi_priv.atcs;
> +       int rc;
> +
> +       if (!atcs->functions.set_uma_allocation_size)
> +               return -ENODEV;
> +
> +       rc =3D amdgpu_atomfirmware_get_uma_carveout_info(adev, &atcs->uma=
_info);
> +       if (rc) {
> +               drm_dbg(adev_to_drm(adev),
> +                       "Failed to parse UMA carveout info from VBIOS: %d=
\n", rc);
> +               goto out_info;
> +       }
> +
> +       mutex_init(&atcs->uma_info.update_lock);
> +
> +       rc =3D devm_device_add_group(adev->dev, &amdgpu_uma_attr_group);
> +       if (rc) {
> +               drm_dbg(adev_to_drm(adev), "Failed to add UMA carveout sy=
sfs interfaces %d\n", rc);
> +               goto out_attr;
> +       }
> +
> +       return 0;
> +
> +out_attr:
> +       mutex_destroy(&atcs->uma_info.update_lock);
> +out_info:
> +       return rc;
> +}
> +
> +static void amdgpu_acpi_uma_option_fini(void)
> +{
> +       struct amdgpu_uma_carveout_info *uma_info =3D &amdgpu_acpi_priv.a=
tcs.uma_info;
> +
> +       mutex_destroy(&uma_info->update_lock);
> +       uma_info->num_entries =3D 0;
> +}
> +
>  /**
>   * amdgpu_acpi_event - handle notify events
>   *
> @@ -1291,6 +1411,12 @@ static int amdgpu_acpi_event(struct notifier_block=
 *nb,
>  int amdgpu_acpi_init(struct amdgpu_device *adev)
>  {
>         struct amdgpu_atif *atif =3D &amdgpu_acpi_priv.atif;
> +       int rc;
> +
> +       rc =3D amdgpu_acpi_uma_option_init(adev);
> +
> +       if (rc)
> +               drm_dbg(adev_to_drm(adev), "Not creating uma carveout int=
erfaces: %d", rc);
>
>         if (atif->notifications.brightness_change) {
>                 if (adev->dc_enabled) {
> @@ -1343,6 +1469,7 @@ void amdgpu_acpi_get_backlight_caps(struct amdgpu_d=
m_backlight_caps *caps)
>  void amdgpu_acpi_fini(struct amdgpu_device *adev)
>  {
>         unregister_acpi_notifier(&adev->acpi_nb);
> +       amdgpu_acpi_uma_option_fini();
>  }
>
>  /**
>
> --
> 2.43.0
>
