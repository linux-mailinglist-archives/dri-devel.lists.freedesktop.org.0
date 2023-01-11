Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8C86664AA
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 21:16:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AB5110E804;
	Wed, 11 Jan 2023 20:16:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6E5E10E807;
 Wed, 11 Jan 2023 20:16:50 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id jo4so39727011ejb.7;
 Wed, 11 Jan 2023 12:16:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8hHwguYohsEiS1t4qSo8+p3FJVx+07mu3qEnPAwfLDw=;
 b=2mwXuZyF590M/7MrV8f7F4+WBdKWm9oCY7X4eSvR+/banq8Trndb2Sq05tBKQ9GK0r
 xViA2aTm6vAgmsCOeo603y2XyG0vopxoLxAQeJKqwDiUFbUxejGuoan331JH4rZ6xNlA
 ACRpW5PZfOFat+4JIObw5SzfwZt8rGNTBCaldAiiHyUCo+hSbNvlrvxEfVFEdGHMPQ+K
 VcYPwmSF2YiIK1r7qTu1R6xz6Ple9e8Luv7GSVxbQQrQ2pFYtiA/ClEPlnm1PHJ/oN2K
 lw2nuKR+kQNmCkIlngyZSmuvgi747awcz4berRj1x17SQ5UbAgO4MC3OevXfc0wkTuEQ
 kOIQ==
X-Gm-Message-State: AFqh2kqGE2ptYv1ps1ADIBfeIeAgxILoCffAFZ9mwOq2E4kX+PvHs7Lp
 9LZINLyw/I4DsAErGK/T3+iR4I7RL8iqwVYxBq4=
X-Google-Smtp-Source: AMrXdXtcZIIsDAyW7Km4WzS7Dkyix+v9ulTA+AWuB8/qIqUTu4SdurIEkVA3w63uFhaKj2aVp1rL4lDeFdLbi+cnsHA=
X-Received: by 2002:a17:907:75ea:b0:7c0:f118:7e4e with SMTP id
 jz10-20020a17090775ea00b007c0f1187e4emr4235344ejc.478.1673468209329; Wed, 11
 Jan 2023 12:16:49 -0800 (PST)
MIME-Version: 1.0
References: <20230110153028.183294-1-hdegoede@redhat.com>
In-Reply-To: <20230110153028.183294-1-hdegoede@redhat.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 11 Jan 2023 21:16:38 +0100
Message-ID: <CAJZ5v0gVJtvuO-G1DiO3WffWTMJMjt-N_W4XKNgTTw0R5F1iOQ@mail.gmail.com>
Subject: Re: [PATCH v2] ACPI: Fix selecting the wrong ACPI fwnode for the iGPU
 on some Dell laptops
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
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 dri-devel@lists.freedesktop.org, linux-acpi@vger.kernel.org,
 Mika Westerberg <mika.westerberg@linux.intel.com>, Len Brown <lenb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 10, 2023 at 4:30 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> The Dell Latitude E6430 both with and without the optional NVidia dGPU
> has a bug in its ACPI tables which is causing Linux to assign the wrong
> ACPI fwnode / companion to the pci_device for the i915 iGPU.
>
> Specifically under the PCI root bridge there are these 2 ACPI Device()s :
>
>  Scope (_SB.PCI0)
>  {
>      Device (GFX0)
>      {
>          Name (_ADR, 0x00020000)  // _ADR: Address
>      }
>
>      ...
>
>      Device (VID)
>      {
>          Name (_ADR, 0x00020000)  // _ADR: Address
>          ...
>
>          Method (_DOS, 1, NotSerialized)  // _DOS: Disable Output Switching
>          {
>              VDP8 = Arg0
>              VDP1 (One, VDP8)
>          }
>
>          Method (_DOD, 0, NotSerialized)  // _DOD: Display Output Devices
>          {
>              ...
>          }
>          ...
>      }
>  }
>
> The non-functional GFX0 ACPI device is a problem, because this gets
> returned as ACPI companion-device by acpi_find_child_device() for the iGPU.
>
> This is a long standing problem and the i915 driver does use the ACPI
> companion for some things, but works fine without it.
>
> However since commit 63f534b8bad9 ("ACPI: PCI: Rework acpi_get_pci_dev()")
> acpi_get_pci_dev() relies on the physical-node pointer in the acpi_device
> and that is set on the wrong acpi_device because of the wrong
> acpi_find_child_device() return. This breaks the ACPI video code,
> leading to non working backlight control in some cases.
>
> Add a type.backlight flag, mark ACPI video bus devices with this and make
> find_child_checks() return a higher score for children with this flag set,
> so that it picks the right companion-device.
>
> Co-developed-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v2:
> - Switch to Rafael's suggested implementation using a type.backlight flag
>   and only make find_child_checks() return a higher score when this is set
> ---
>  drivers/acpi/glue.c     | 14 ++++++++++++--
>  drivers/acpi/scan.c     |  7 +++++--
>  include/acpi/acpi_bus.h |  3 ++-
>  3 files changed, 19 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/acpi/glue.c b/drivers/acpi/glue.c
> index 204fe94c7e45..a194f30876c5 100644
> --- a/drivers/acpi/glue.c
> +++ b/drivers/acpi/glue.c
> @@ -75,7 +75,8 @@ static struct acpi_bus_type *acpi_get_bus_type(struct device *dev)
>  }
>
>  #define FIND_CHILD_MIN_SCORE   1
> -#define FIND_CHILD_MAX_SCORE   2
> +#define FIND_CHILD_MID_SCORE   2
> +#define FIND_CHILD_MAX_SCORE   3
>
>  static int match_any(struct acpi_device *adev, void *not_used)
>  {
> @@ -96,8 +97,17 @@ static int find_child_checks(struct acpi_device *adev, bool check_children)
>                 return -ENODEV;
>
>         status = acpi_evaluate_integer(adev->handle, "_STA", NULL, &sta);
> -       if (status == AE_NOT_FOUND)
> +       if (status == AE_NOT_FOUND) {
> +               /*
> +                * Special case: backlight device objects without _STA are
> +                * preferred to other objects with the same _ADR value, because
> +                * it is more likely that they are actually useful.
> +                */
> +               if (adev->pnp.type.backlight)
> +                       return FIND_CHILD_MID_SCORE;
> +
>                 return FIND_CHILD_MIN_SCORE;
> +       }
>
>         if (ACPI_FAILURE(status) || !(sta & ACPI_STA_DEVICE_ENABLED))
>                 return -ENODEV;
> diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
> index 274344434282..0c6f06abe3f4 100644
> --- a/drivers/acpi/scan.c
> +++ b/drivers/acpi/scan.c
> @@ -1370,9 +1370,12 @@ static void acpi_set_pnp_ids(acpi_handle handle, struct acpi_device_pnp *pnp,
>                  * Some devices don't reliably have _HIDs & _CIDs, so add
>                  * synthetic HIDs to make sure drivers can find them.
>                  */
> -               if (acpi_is_video_device(handle))
> +               if (acpi_is_video_device(handle)) {
>                         acpi_add_id(pnp, ACPI_VIDEO_HID);
> -               else if (acpi_bay_match(handle))
> +                       pnp->type.backlight = 1;
> +                       break;
> +               }
> +               if (acpi_bay_match(handle))
>                         acpi_add_id(pnp, ACPI_BAY_HID);
>                 else if (acpi_dock_match(handle))
>                         acpi_add_id(pnp, ACPI_DOCK_HID);
> diff --git a/include/acpi/acpi_bus.h b/include/acpi/acpi_bus.h
> index cd3b75e08ec3..e44be31115a6 100644
> --- a/include/acpi/acpi_bus.h
> +++ b/include/acpi/acpi_bus.h
> @@ -230,7 +230,8 @@ struct acpi_pnp_type {
>         u32 hardware_id:1;
>         u32 bus_address:1;
>         u32 platform_id:1;
> -       u32 reserved:29;
> +       u32 backlight:1;
> +       u32 reserved:28;
>  };
>
>  struct acpi_device_pnp {
> --

Applied as 6.2-rc material, thanks!
