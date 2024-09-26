Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB845987935
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 20:41:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C47610EBCC;
	Thu, 26 Sep 2024 18:39:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=w_armin@gmx.de header.b="Dlq3SG4L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F29E910EBCC
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 18:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1727375959; x=1727980759; i=w_armin@gmx.de;
 bh=FLCAJsbpNVzyInY1084MAdvbN8aesUUfGXXlczzgzUI=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=Dlq3SG4LDB+pXKf90v+nULyNgI3nAYfHcXQr1HARBvM8GBLB/MFCLWPfMtZwM9m3
 Z7k/ANX7rzL/8B7bjOMmbPA9eMz6QLqPa1dtw9M9dWHFek0Oaux/YDxVyuZz8D7MT
 00Xgh+211EPBIighPdmKpxmRn/avEjvp5CIF9akb4Igd2IF8Xqq/EOT67S6V+cesn
 0vK7qkSk8SY0LcVzMM6S3YaJPIoceM2Jouc3JMvg6qocItYMvoSLdWO0rCdqvBPux
 kGj3juqzF28Ujvu40yk2GVRkiwEhRb6av2w/pd3IIJVRxTGJZLuOZEMg2+sjALM5O
 eYmAVGSNauanyqporg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1McpJq-1sL6bk2zZa-00dvFb; Thu, 26
 Sep 2024 20:39:18 +0200
Message-ID: <ad01bc38-3834-44c9-a5e3-540a09a20643@gmx.de>
Date: Thu, 26 Sep 2024 20:39:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] platform/x86/tuxedo: Add virtual LampArray for TUXEDO
 NB04 devices
To: Werner Sembach <wse@tuxedocomputers.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: bentiss@kernel.org, dri-devel@lists.freedesktop.org, jelle@vdwaa.nl,
 jikos@kernel.org, lee@kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
 miguel.ojeda.sandonis@gmail.com, ojeda@kernel.org, onitake@gmail.com,
 pavel@ucw.cz, platform-driver-x86@vger.kernel.org
References: <20240926174405.110748-1-wse@tuxedocomputers.com>
 <20240926174405.110748-2-wse@tuxedocomputers.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20240926174405.110748-2-wse@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:AOvLjo3C9TgEov8tYMso8xb28mPoR8hItcqB3VEcgoCKMAbwOky
 XGaig2KvqfofpSUI80/R8jV4zZBnq26kgYKJkn6HsXPUYme7KorODPexLKjUUGe6LgIh0zA
 8I7T1ROxw5ylBISqwyeOU+lpDH+DhgeajWUWC6olhym/IvI3suAii0BxwYqvRKSNBYm/T2J
 wWSsGph6AkcoZ5L96NWiQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:RR2xooeDzPc=;saP+Oc6ijIhBhhWAaZ5uVfRsxRC
 SqqVnw38eDj6waIJe9+16tZ0QVglqXJrfQWzez4cSAI8frd/bfY4v3of0ZXUFrCLzoQwHH5mY
 IF20uMRBoI6TsiGrY82VIZjEK8V9hkknjk11NeGqYNoSBJ5s8Z32wFbGOMixMGDALGi5tSOhq
 mMKiiyasfM/9nv/xCXoCrlYUY/F6XB2a7R5YUERvRX9pwgiMTmpL6Hbb5SDMIHUE0L/mMrcoU
 l42xJtzSCB8fBkY9fj4AJmHtm9/4GCl9rqkjBzvu1BcoZy5c6gtclQpkK4MazVXz0Jj9YhGX7
 J71DqsC2pkbpNjdItfzOjVQG+15G8dDZeROUPecksXDL/whczbHEZ9sLTFaqL29Av4JFDQQ14
 XM8rYkA7FmN1qfFK8ZIcHr3yewVbWWlU2YsIIvUkiRYFY5R5020p54Gk7AO2a+IKyWBdDK6eJ
 +HgpUwsgQAC2SDzxTT/QTv1kjsLGkgc/cqj3wCnzITXA9Bvf0EEn7mPKh+i4tpDciX61U2qt+
 YL7T/TDGtQJV5p+ocutuUw5p2rH+tJ5Fl+3v5LmxlElyUXzLx4nJANP65P86rHBCZHcRhGe2+
 3pS5Z54pL3a9qjsOteQ0geE6I1+f/rCEVTcyiMHzPbRY2QoQlpfPAj/82wjqAUXhp/fft/s1M
 ehJouxd9gndqOmeN3J1qwyuoKU4950zYKVBunVo3XzXmqfhg2OebK00aQ4oKoXo8BbS4rctHU
 0cCgS3UjajurX7fMZ0Gvwm6xI42w87kDkF+xJ3MpKbpyLAODfzQBX38NVfJtzVI7tmP6+QsFz
 AggLf2b3q37A2mgFRfsIksFy6VH0gbY3kLxpBwNTHL7C0=
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

Am 26.09.24 um 19:44 schrieb Werner Sembach:

> The TUXEDO Sirius 16 Gen1 and TUXEDO Sirius 16 Gen2 devices have a per-k=
ey
> controllable RGB keyboard backlight. The firmware API for it is implemen=
ted
> via WMI.
>
> To make the backlight userspace configurable this driver emulates a
> LampArray HID device and translates the input from hidraw to the
> corresponding WMI calls. This is a new approach as the leds subsystem la=
cks
> a suitable UAPI for per-key keyboard backlights, and like this no new UA=
PI
> needs to be established.
>
> Co-developed-by: Christoffer Sandberg <cs@tuxedo.de>
> Signed-off-by: Christoffer Sandberg <cs@tuxedo.de>
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> Link: https://lore.kernel.org/all/1fb08a74-62c7-4d0c-ba5d-648e23082dcb@t=
uxedocomputers.com/
> ---
>   MAINTAINERS                                   |   6 +
>   drivers/platform/x86/Kconfig                  |   2 +
>   drivers/platform/x86/Makefile                 |   3 +
>   drivers/platform/x86/tuxedo/Kbuild            |   9 +
>   drivers/platform/x86/tuxedo/Kconfig           |  14 +
>   .../x86/tuxedo/tuxedo_nb04_wmi_ab_init.c      |  86 ++
>   .../x86/tuxedo/tuxedo_nb04_wmi_ab_init.h      |  20 +
>   .../tuxedo_nb04_wmi_ab_virtual_lamp_array.c   | 741 ++++++++++++++++++
>   .../tuxedo_nb04_wmi_ab_virtual_lamp_array.h   |  18 +
>   .../x86/tuxedo/tuxedo_nb04_wmi_util.c         |  85 ++
>   .../x86/tuxedo/tuxedo_nb04_wmi_util.h         | 112 +++
>   11 files changed, 1096 insertions(+)
>   create mode 100644 drivers/platform/x86/tuxedo/Kbuild
>   create mode 100644 drivers/platform/x86/tuxedo/Kconfig
>   create mode 100644 drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_ab_init=
.c
>   create mode 100644 drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_ab_init=
.h
>   create mode 100644 drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_ab_virt=
ual_lamp_array.c
>   create mode 100644 drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_ab_virt=
ual_lamp_array.h
>   create mode 100644 drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_util.c
>   create mode 100644 drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_util.h
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index cc40a9d9b8cd1..3385ad51af194 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -23358,6 +23358,12 @@ T:	git git://git.kernel.org/pub/scm/linux/kerne=
l/git/lenb/linux.git turbostat
>   F:	tools/power/x86/turbostat/
>   F:	tools/testing/selftests/turbostat/
>
> +TUXEDO DRIVERS
> +M:	Werner Sembach <wse@tuxedocomputers.com>
> +L:	platform-driver-x86@vger.kernel.org
> +S:	Supported
> +F:	drivers/platform/x86/tuxedo/
> +
>   TW5864 VIDEO4LINUX DRIVER
>   M:	Bluecherry Maintainers <maintainers@bluecherrydvr.com>
>   M:	Andrey Utkin <andrey.utkin@corp.bluecherry.net>
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index ddfccc226751f..c7cffb222adac 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -1196,3 +1196,5 @@ config P2SB
>   	  The main purpose of this library is to unhide P2SB device in case
>   	  firmware kept it hidden on some platforms in order to access device=
s
>   	  behind it.
> +
> +source "drivers/platform/x86/tuxedo/Kconfig"
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefi=
le
> index e1b1429470674..1562dcd7ad9a5 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -153,3 +153,6 @@ obj-$(CONFIG_WINMATE_FM07_KEYS)		+=3D winmate-fm07-k=
eys.o
>
>   # SEL
>   obj-$(CONFIG_SEL3350_PLATFORM)		+=3D sel3350-platform.o
> +
> +# TUXEDO
> +obj-y					+=3D tuxedo/
> diff --git a/drivers/platform/x86/tuxedo/Kbuild b/drivers/platform/x86/t=
uxedo/Kbuild
> new file mode 100644
> index 0000000000000..5a3506ab98131
> --- /dev/null
> +++ b/drivers/platform/x86/tuxedo/Kbuild
> @@ -0,0 +1,9 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# TUXEDO X86 Platform Specific Drivers
> +#
> +
> +tuxedo_nb04_wmi_ab-y			:=3D tuxedo_nb04_wmi_ab_init.o
> +tuxedo_nb04_wmi_ab-y			+=3D tuxedo_nb04_wmi_util.o
> +tuxedo_nb04_wmi_ab-y			+=3D tuxedo_nb04_wmi_ab_virtual_lamp_array.o
> +obj-$(CONFIG_TUXEDO_NB04_WMI_AB)	+=3D tuxedo_nb04_wmi_ab.o
> diff --git a/drivers/platform/x86/tuxedo/Kconfig b/drivers/platform/x86/=
tuxedo/Kconfig
> new file mode 100644
> index 0000000000000..b1f7c6ceeaae4
> --- /dev/null
> +++ b/drivers/platform/x86/tuxedo/Kconfig
> @@ -0,0 +1,14 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# TUXEDO X86 Platform Specific Drivers
> +#
> +
> +menuconfig TUXEDO_NB04_WMI_AB
> +	tristate "TUXEDO NB04 WMI AB Platform Driver"
> +	default m
> +	help
> +	  This driver implements the WMI AB device found on TUXEDO Notebooks
> +	  with board vendor NB04. For the time being only the keyboard backlig=
ht
> +	  control is implemented.
> +
> +	  When compiled as a module it will be called tuxedo_nb04_wmi_ab.
> diff --git a/drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_ab_init.c b/dri=
vers/platform/x86/tuxedo/tuxedo_nb04_wmi_ab_init.c
> new file mode 100644
> index 0000000000000..6e4446b0e3dd8
> --- /dev/null
> +++ b/drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_ab_init.c
> @@ -0,0 +1,86 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * This driver implements the WMI AB device found on TUXEDO Notebooks w=
ith board
> + * vendor NB04.
> + *
> + * Copyright (C) 2024 Werner Sembach wse@tuxedocomputers.com
> + */
> +
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include <linux/module.h>
> +#include <linux/wmi.h>
> +#include <linux/dmi.h>
> +
> +#include "tuxedo_nb04_wmi_ab_virtual_lamp_array.h"
> +
> +#include "tuxedo_nb04_wmi_ab_init.h"
> +
> +// We don't know if the WMI API is stable and how unique the GUID is fo=
r this ODM. To be on the safe
> +// side we therefore only run this driver on tested devices defined by =
this list.
> +static const struct dmi_system_id tested_devices_dmi_table[] =3D {
> +	{
> +		// TUXEDO Sirius 16 Gen1
> +		.matches =3D {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "APX958"),
> +		},
> +	},
> +	{
> +		// TUXEDO Sirius 16 Gen2
> +		.matches =3D {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "AHP958"),
> +		},
> +	},
> +	{ }
> +};
> +
> +static int probe(struct wmi_device *wdev, const void __always_unused *c=
ontext)
> +{
> +	struct tuxedo_nb04_wmi_driver_data_t *driver_data;
> +
> +	if (dmi_check_system(tested_devices_dmi_table))
> +		return -ENODEV;

Hi,

please do this DMI check during module initialization. This avoids having =
an useless WMI driver
on unsupported machines and allows for marking tested_devices_dmi_table as=
 __initconst.

Besides that, maybe a "force" module parameter for overriding the DMI chec=
king could be
useful?

> +
> +	driver_data =3D devm_kzalloc(&wdev->dev, sizeof(struct tuxedo_nb04_wmi=
_driver_data_t),
> +				   GFP_KERNEL);

Please use sizeof(*driver_data).

> +	if (!driver_data)
> +		return -ENOMEM;
> +
> +	mutex_init(&driver_data->wmi_access_mutex);

Please use devm_mutex_init(), so the mutex is properly destroyed when unbi=
nding.

> +
> +	dev_set_drvdata(&wdev->dev, driver_data);
> +
> +	tuxedo_nb04_virtual_lamp_array_add_device(wdev, &driver_data->virtual_=
lamp_array_hdev);

Error handling missing.

> +
> +	return 0;
> +}
> +
> +static void remove(struct wmi_device *wdev)
> +{
> +	struct tuxedo_nb04_wmi_driver_data_t *driver_data =3D wdev->dev.driver=
_data;
> +
> +	hid_destroy_device(driver_data->virtual_lamp_array_hdev);
> +}
> +
> +static const struct wmi_device_id tuxedo_nb04_wmi_ab_device_ids[] =3D {
> +	{ .guid_string =3D "80C9BAA6-AC48-4538-9234-9F81A55E7C85" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(wmi, tuxedo_nb04_wmi_ab_device_ids);
> +
> +static struct wmi_driver tuxedo_nb04_wmi_ab_driver =3D {
> +	.driver =3D {
> +		.name =3D "tuxedo_nb04_wmi_ab",
> +		.owner =3D THIS_MODULE
> +	},
> +	.id_table =3D tuxedo_nb04_wmi_ab_device_ids,
> +	.probe =3D probe,
> +	.remove =3D remove

I recommend setting probe_type =3D PROBE_PREFER_ASYNCHRONOUS, see Document=
ation/wmi/driver-development-guide.rst.
Also please set no_singleton =3D true.

> +};
> +module_wmi_driver(tuxedo_nb04_wmi_ab_driver);
> +
> +MODULE_DESCRIPTION("Virtual HID LampArray interface for TUXEDO NB04 dev=
ices");
> +MODULE_AUTHOR("Werner Sembach <wse@tuxedocomputers.com>");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_ab_init.h b/dri=
vers/platform/x86/tuxedo/tuxedo_nb04_wmi_ab_init.h
> new file mode 100644
> index 0000000000000..aebfd465c9b61
> --- /dev/null
> +++ b/drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_ab_init.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * This driver implements the WMI AB device found on TUXEDO Notebooks w=
ith board
> + * vendor NB04.
> + *
> + * Copyright (C) 2024 Werner Sembach wse@tuxedocomputers.com
> + */
> +
> +#ifndef TUXEDO_NB04_WMI_AB_INIT_H
> +#define TUXEDO_NB04_WMI_AB_INIT_H
> +
> +#include <linux/mutex.h>
> +#include <linux/hid.h>
> +
> +struct tuxedo_nb04_wmi_driver_data_t {
> +	struct mutex wmi_access_mutex;
> +	struct hid_device *virtual_lamp_array_hdev;
> +};
> +
> +#endif
> diff --git a/drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_ab_virtual_lamp=
_array.c b/drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_ab_virtual_lamp_arr=
ay.c
> new file mode 100644
> index 0000000000000..04af19aa6ad5f
> --- /dev/null
> +++ b/drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_ab_virtual_lamp_array.=
c
> @@ -0,0 +1,741 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * This code gives the built in RGB lighting of the TUXEDO NB04 devices=
 a
> + * standardised interface, namely HID LampArray.
> + *
> + * Copyright (C) 2024 Werner Sembach wse@tuxedocomputers.com
> + */
> +
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include "tuxedo_nb04_wmi_util.h"
> +
> +#include "tuxedo_nb04_wmi_ab_virtual_lamp_array.h"
> +
> +#define dev_to_wdev(__dev)	container_of(__dev, struct wmi_device, dev)

Please use to_wmi_device() instead.

> +
> +enum report_ids {
> +	LAMP_ARRAY_ATTRIBUTES_REPORT_ID		=3D 0x01,
> +	LAMP_ATTRIBUTES_REQUEST_REPORT_ID	=3D 0x02,
> +	LAMP_ATTRIBUTES_RESPONSE_REPORT_ID	=3D 0x03,
> +	LAMP_MULTI_UPDATE_REPORT_ID		=3D 0x04,
> +	LAMP_RANGE_UPDATE_REPORT_ID		=3D 0x05,
> +	LAMP_ARRAY_CONTROL_REPORT_ID		=3D 0x06,
> +};
> +
> +static const uint8_t sirius_16_ansii_kbl_mapping[] =3D {
> +	0x29, 0x3a, 0x3b, 0x3c, 0x3d, 0x3e, 0x3f, 0x40, 0x41, 0x42,
> +	0x43, 0x44, 0x45, 0xf1, 0x46, 0x4c,   0x4a, 0x4d, 0x4b, 0x4e,
> +	0x35, 0x1e, 0x1f, 0x20, 0x21, 0x22, 0x23, 0x24, 0x25, 0x26,
> +	0x27, 0x2d, 0x2e, 0x2a,               0x53, 0x55, 0x54, 0x56,
> +	0x2b, 0x14, 0x1a, 0x08, 0x15, 0x17, 0x1c, 0x18, 0x0c, 0x12,
> +	0x13, 0x2f, 0x30, 0x31,               0x5f, 0x60, 0x61,
> +	0x39, 0x04, 0x16, 0x07, 0x09, 0x0a, 0x0b, 0x0d, 0x0e, 0x0f,
> +	0x33, 0x34, 0x28,                     0x5c, 0x5d, 0x5e, 0x57,
> +	0xe1, 0x1d, 0x1b, 0x06, 0x19, 0x05, 0x11, 0x10, 0x36, 0x37,
> +	0x38, 0xe5, 0x52,                     0x59, 0x5a, 0x5b,
> +	0xe0, 0xfe, 0xe3, 0xe2, 0x2c, 0xe6, 0x65, 0xe4, 0x50, 0x51,
> +	0x4f,                                 0x62, 0x63, 0x58
> +};
> +
> +static const uint32_t sirius_16_ansii_kbl_mapping_pos_x[] =3D {
> +	 25000,  41700,  58400,  75100,  91800, 108500, 125200, 141900, 158600=
, 175300,
> +	192000, 208700, 225400, 242100, 258800, 275500,   294500, 311200, 3279=
00, 344600,
> +	 24500,  42500,  61000,  79500,  98000, 116500, 135000, 153500, 172000=
, 190500,
> +	209000, 227500, 246000, 269500,                   294500, 311200, 3279=
00, 344600,
> +	 31000,  51500,  70000,  88500, 107000, 125500, 144000, 162500, 181000=
, 199500,
> +	218000, 236500, 255000, 273500,                   294500, 311200, 3279=
00,
> +	 33000,  57000,  75500,  94000, 112500, 131000, 149500, 168000, 186500=
, 205000,
> +	223500, 242000, 267500,                           294500, 311200, 3279=
00, 344600,
> +	 37000,  66000,  84500, 103000, 121500, 140000, 158500, 177000, 195500=
, 214000,
> +	232500, 251500, 273500,                           294500, 311200, 3279=
00,
> +	 28000,  47500,  66000,  84500, 140000, 195500, 214000, 234000, 255000=
, 273500,
> +	292000,                                           311200, 327900, 3446=
00
> +};
> +
> +static const uint32_t sirius_16_ansii_kbl_mapping_pos_y[] =3D {
> +	 53000,  53000,  53000,  53000,  53000,  53000,  53000,  53000,  53000=
,  53000,
> +	 53000,  53000,  53000,  53000,  53000,  53000,    53000,  53000,  530=
00,  53000,
> +	 67500,  67500,  67500,  67500,  67500,  67500,  67500,  67500,  67500=
,  67500,
> +	 67500,  67500,  67500,  67500,                    67500,  67500,  675=
00,  67500,
> +	 85500,  85500,  85500,  85500,  85500,  85500,  85500,  85500,  85500=
,  85500,
> +	 85500,  85500,  85500,  85500,                    85500,  85500,  855=
00,
> +	103500, 103500, 103500, 103500, 103500, 103500, 103500, 103500, 103500=
, 103500,
> +	103500, 103500, 103500,                           103500, 103500, 1035=
00,  94500,
> +	121500, 121500, 121500, 121500, 121500, 121500, 121500, 121500, 121500=
, 121500,
> +	121500, 121500, 129000,                           121500, 121500, 1215=
00,
> +	139500, 139500, 139500, 139500, 139500, 139500, 139500, 139500, 147000=
, 147000,
> +	147000,                                           139500, 139500, 1305=
00
> +};
> +
> +static const uint32_t sirius_16_ansii_kbl_mapping_pos_z[] =3D {
> +	  5000,   5000,   5000,   5000,   5000,   5000,   5000,   5000,   5000=
,   5000,
> +	  5000,   5000,   5000,   5000,   5000,   5000,     5000,   5000,   50=
00,   5000,
> +	  5250,   5250,   5250,   5250,   5250,   5250,   5250,   5250,   5250=
,   5250,
> +	  5250,   5250,   5250,   5250,                     5250,   5250,   52=
50,   5250,
> +	  5500,   5500,   5500,   5500,   5500,   5500,   5500,   5500,   5500=
,   5500,
> +	  5500,   5500,   5500,   5500,                     5500,   5500,   55=
00,
> +	  5750,   5750,   5750,   5750,   5750,   5750,   5750,   5750,   5750=
,   5750,
> +	  5750,   5750,   5750,                             5750,   5750,   57=
50,   5625,
> +	  6000,   6000,   6000,   6000,   6000,   6000,   6000,   6000,   6000=
,   6000,
> +	  6000,   6000,   6125,                             6000,   6000,   60=
00,
> +	  6250,   6250,   6250,   6250,   6250,   6250,   6250,   6250,   6375=
,   6375,
> +	  6375,                                             6250,   6250,   61=
25
> +};
> +
> +static const uint8_t sirius_16_iso_kbl_mapping[] =3D {
> +	0x29, 0x3a, 0x3b, 0x3c, 0x3d, 0x3e, 0x3f, 0x40, 0x41, 0x42,
> +	0x43, 0x44, 0x45, 0xf1, 0x46, 0x4c,   0x4a, 0x4d, 0x4b, 0x4e,
> +	0x35, 0x1e, 0x1f, 0x20, 0x21, 0x22, 0x23, 0x24, 0x25, 0x26,
> +	0x27, 0x2d, 0x2e, 0x2a,               0x53, 0x55, 0x54, 0x56,
> +	0x2b, 0x14, 0x1a, 0x08, 0x15, 0x17, 0x1c, 0x18, 0x0c, 0x12,
> +	0x13, 0x2f, 0x30,                     0x5f, 0x60, 0x61,
> +	0x39, 0x04, 0x16, 0x07, 0x09, 0x0a, 0x0b, 0x0d, 0x0e, 0x0f,
> +	0x33, 0x34, 0x32, 0x28,               0x5c, 0x5d, 0x5e, 0x57,
> +	0xe1, 0x64, 0x1d, 0x1b, 0x06, 0x19, 0x05, 0x11, 0x10, 0x36,
> +	0x37, 0x38, 0xe5, 0x52,               0x59, 0x5a, 0x5b,
> +	0xe0, 0xfe, 0xe3, 0xe2, 0x2c, 0xe6, 0x65, 0xe4, 0x50, 0x51,
> +	0x4f,                                 0x62, 0x63, 0x58
> +};
> +
> +static const uint32_t sirius_16_iso_kbl_mapping_pos_x[] =3D {
> +	 25000,  41700,  58400,  75100,  91800, 108500, 125200, 141900, 158600=
, 175300,
> +	192000, 208700, 225400, 242100, 258800, 275500,   294500, 311200, 3279=
00, 344600,
> +	 24500,  42500,  61000,  79500,  98000, 116500, 135000, 153500, 172000=
, 190500,
> +	209000, 227500, 246000, 269500,                   294500, 311200, 3279=
00, 344600,
> +	 31000,  51500,  70000,  88500, 107000, 125500, 144000, 162500, 181000=
, 199500,
> +	218000, 234500, 251000,                           294500, 311200, 3279=
00,
> +	 33000,  57000,  75500,  94000, 112500, 131000, 149500, 168000, 186500=
, 205000,
> +	223500, 240000, 256500, 271500,                   294500, 311200, 3279=
00, 344600,
> +	 28000,  47500,  66000,  84500, 103000, 121500, 140000, 158500, 177000=
, 195500,
> +	214000, 232500, 251500, 273500,                   294500, 311200, 3279=
00,
> +	 28000,  47500,  66000,  84500, 140000, 195500, 214000, 234000, 255000=
, 273500,
> +	292000,                                           311200, 327900, 3446=
00
> +};
> +
> +static const uint32_t sirius_16_iso_kbl_mapping_pos_y[] =3D {
> +	 53000,  53000,  53000,  53000,  53000,  53000,  53000,  53000,  53000=
,  53000,
> +	 53000,  53000,  53000,  53000,  53000,  53000,    53000,  53000,  530=
00,  53000,
> +	 67500,  67500,  67500,  67500,  67500,  67500,  67500,  67500,  67500=
,  67500,
> +	 67500,  67500,  67500,  67500,                    67500,  67500,  675=
00,  67500,
> +	 85500,  85500,  85500,  85500,  85500,  85500,  85500,  85500,  85500=
,  85500,
> +	 85500,  85500,  85500,                            85500,  85500,  855=
00,
> +	103500, 103500, 103500, 103500, 103500, 103500, 103500, 103500, 103500=
, 103500,
> +	103500, 103500, 103500,  94500,                   103500, 103500, 1035=
00,  94500,
> +	121500, 121500, 121500, 121500, 121500, 121500, 121500, 121500, 121500=
, 121500,
> +	121500, 121500, 121500, 129000,                   121500, 121500, 1215=
00,
> +	139500, 139500, 139500, 139500, 139500, 139500, 139500, 139500, 147000=
, 147000,
> +	147000,                                           139500, 139500, 1305=
00
> +};
> +
> +static const uint32_t sirius_16_iso_kbl_mapping_pos_z[] =3D {
> +	  5000,   5000,   5000,   5000,   5000,   5000,   5000,   5000,   5000=
,   5000,
> +	  5000,   5000,   5000,   5000, 5000, 5000,         5000,   5000,   50=
00,   5000,
> +	  5250,   5250,   5250,   5250,   5250,   5250,   5250,   5250,   5250=
,   5250,
> +	  5250,   5250,   5250,   5250,                     5250,   5250,   52=
50,   5250,
> +	  5500,   5500,   5500,   5500,   5500,   5500,   5500,   5500,   5500=
,   5500,
> +	  5500,   5500,   5500,                             5500,   5500,   55=
00,
> +	  5750,   5750,   5750,   5750,   5750,   5750,   5750,   5750,   5750=
,   5750,
> +	  5750,   5750,   5750,   5750,                     5750,   5750,   57=
50,   5625,
> +	  6000,   6000,   6000,   6000,   6000,   6000,   6000,   6000,   6000=
,   6000,
> +	  6000,   6000,   6000,   6125,                     6000,   6000,   60=
00,
> +	  6250,   6250,   6250,   6250,   6250,   6250,   6250,   6250,   6375=
,   6375,
> +	  6375,                                             6250,   6250,   61=
25
> +};
> +
> +struct driver_data_t {
> +	uint8_t keyboard_type;
> +	uint8_t lamp_count;
> +	uint8_t next_lamp_id;
> +	union tuxedo_nb04_wmi_496_b_in_80_b_out_input next_kbl_set_multiple_ke=
ys_input;
> +};
> +
> +
> +static int ll_start(struct hid_device *hdev)
> +{
> +	int ret;
> +	struct driver_data_t *driver_data;
> +	struct wmi_device *wdev =3D dev_to_wdev(hdev->dev.parent);
> +	union tuxedo_nb04_wmi_8_b_in_80_b_out_input input;
> +	union tuxedo_nb04_wmi_8_b_in_80_b_out_output output;
> +
> +	driver_data =3D devm_kzalloc(&hdev->dev, sizeof(struct driver_data_t),=
 GFP_KERNEL);
> +	if (!driver_data)
> +		return -ENOMEM;

Please use sizeof(*driver_data).

> +
> +	input.get_device_status_input.device_type =3D WMI_AB_GET_DEVICE_STATUS=
_DEVICE_ID_KEYBOARD;
> +	ret =3D tuxedo_nb04_wmi_8_b_in_80_b_out(wdev, WMI_AB_GET_DEVICE_STATUS=
, &input, &output);
> +	if (ret)
> +		return ret;
> +
> +	driver_data->keyboard_type =3D output.get_device_status_output.keyboar=
d_physical_layout;
> +	driver_data->lamp_count =3D sizeof(sirius_16_ansii_kbl_mapping);
> +	driver_data->next_lamp_id =3D 0;
> +
> +	hdev->driver_data =3D driver_data;
> +
> +	return ret;
> +}
> +
> +
> +static void ll_stop(struct hid_device __always_unused *hdev)
> +{
> +}
> +
> +
> +static int ll_open(struct hid_device __always_unused *hdev)
> +{
> +	return 0;
> +}
> +
> +
> +static void ll_close(struct hid_device __always_unused *hdev)
> +{
> +}

I have no experience with the HID subsystem, but this looks suspicious.

> +
> +
> +static uint8_t report_descriptor[327] =3D {
> +	0x05, 0x59,			// Usage Page (Lighting and Illumination)
> +	0x09, 0x01,			// Usage (Lamp Array)
> +	0xa1, 0x01,			// Collection (Application)
> +	0x85, LAMP_ARRAY_ATTRIBUTES_REPORT_ID, //  Report ID (1)
> +	0x09, 0x02,			//  Usage (Lamp Array Attributes Report)
> +	0xa1, 0x02,			//  Collection (Logical)
> +	0x09, 0x03,			//   Usage (Lamp Count)
> +	0x15, 0x00,			//   Logical Minimum (0)
> +	0x27, 0xff, 0xff, 0x00, 0x00,	//   Logical Maximum (65535)
> +	0x75, 0x10,			//   Report Size (16)
> +	0x95, 0x01,			//   Report Count (1)
> +	0xb1, 0x03,			//   Feature (Cnst,Var,Abs)
> +	0x09, 0x04,			//   Usage (Bounding Box Width In Micrometers)
> +	0x09, 0x05,			//   Usage (Bounding Box Height In Micrometers)
> +	0x09, 0x06,			//   Usage (Bounding Box Depth In Micrometers)
> +	0x09, 0x07,			//   Usage (Lamp Array Kind)
> +	0x09, 0x08,			//   Usage (Min Update Interval In Microseconds)
> +	0x15, 0x00,			//   Logical Minimum (0)
> +	0x27, 0xff, 0xff, 0xff, 0x7f,	//   Logical Maximum (2147483647)
> +	0x75, 0x20,			//   Report Size (32)
> +	0x95, 0x05,			//   Report Count (5)
> +	0xb1, 0x03,			//   Feature (Cnst,Var,Abs)
> +	0xc0,				//  End Collection
> +	0x85, LAMP_ATTRIBUTES_REQUEST_REPORT_ID, //  Report ID (2)
> +	0x09, 0x20,			//  Usage (Lamp Attributes Request Report)
> +	0xa1, 0x02,			//  Collection (Logical)
> +	0x09, 0x21,			//   Usage (Lamp Id)
> +	0x15, 0x00,			//   Logical Minimum (0)
> +	0x27, 0xff, 0xff, 0x00, 0x00,	//   Logical Maximum (65535)
> +	0x75, 0x10,			//   Report Size (16)
> +	0x95, 0x01,			//   Report Count (1)
> +	0xb1, 0x02,			//   Feature (Data,Var,Abs)
> +	0xc0,				//  End Collection
> +	0x85, LAMP_ATTRIBUTES_RESPONSE_REPORT_ID, //  Report ID (3)
> +	0x09, 0x22,			//  Usage (Lamp Attributes Response Report)
> +	0xa1, 0x02,			//  Collection (Logical)
> +	0x09, 0x21,			//   Usage (Lamp Id)
> +	0x15, 0x00,			//   Logical Minimum (0)
> +	0x27, 0xff, 0xff, 0x00, 0x00,	//   Logical Maximum (65535)
> +	0x75, 0x10,			//   Report Size (16)
> +	0x95, 0x01,			//   Report Count (1)
> +	0xb1, 0x02,			//   Feature (Data,Var,Abs)
> +	0x09, 0x23,			//   Usage (Position X In Micrometers)
> +	0x09, 0x24,			//   Usage (Position Y In Micrometers)
> +	0x09, 0x25,			//   Usage (Position Z In Micrometers)
> +	0x09, 0x27,			//   Usage (Update Latency In Microseconds)
> +	0x09, 0x26,			//   Usage (Lamp Purposes)
> +	0x15, 0x00,			//   Logical Minimum (0)
> +	0x27, 0xff, 0xff, 0xff, 0x7f,	//   Logical Maximum (2147483647)
> +	0x75, 0x20,			//   Report Size (32)
> +	0x95, 0x05,			//   Report Count (5)
> +	0xb1, 0x02,			//   Feature (Data,Var,Abs)
> +	0x09, 0x28,			//   Usage (Red Level Count)
> +	0x09, 0x29,			//   Usage (Green Level Count)
> +	0x09, 0x2a,			//   Usage (Blue Level Count)
> +	0x09, 0x2b,			//   Usage (Intensity Level Count)
> +	0x09, 0x2c,			//   Usage (Is Programmable)
> +	0x09, 0x2d,			//   Usage (Input Binding)
> +	0x15, 0x00,			//   Logical Minimum (0)
> +	0x26, 0xff, 0x00,		//   Logical Maximum (255)
> +	0x75, 0x08,			//   Report Size (8)
> +	0x95, 0x06,			//   Report Count (6)
> +	0xb1, 0x02,			//   Feature (Data,Var,Abs)
> +	0xc0,				//  End Collection
> +	0x85, LAMP_MULTI_UPDATE_REPORT_ID, //  Report ID (4)
> +	0x09, 0x50,			//  Usage (Lamp Multi Update Report)
> +	0xa1, 0x02,			//  Collection (Logical)
> +	0x09, 0x03,			//   Usage (Lamp Count)
> +	0x09, 0x55,			//   Usage (Lamp Update Flags)
> +	0x15, 0x00,			//   Logical Minimum (0)
> +	0x25, 0x08,			//   Logical Maximum (8)
> +	0x75, 0x08,			//   Report Size (8)
> +	0x95, 0x02,			//   Report Count (2)
> +	0xb1, 0x02,			//   Feature (Data,Var,Abs)
> +	0x09, 0x21,			//   Usage (Lamp Id)
> +	0x15, 0x00,			//   Logical Minimum (0)
> +	0x27, 0xff, 0xff, 0x00, 0x00,	//   Logical Maximum (65535)
> +	0x75, 0x10,			//   Report Size (16)
> +	0x95, 0x08,			//   Report Count (8)
> +	0xb1, 0x02,			//   Feature (Data,Var,Abs)
> +	0x09, 0x51,			//   Usage (Red Update Channel)
> +	0x09, 0x52,			//   Usage (Green Update Channel)
> +	0x09, 0x53,			//   Usage (Blue Update Channel)
> +	0x09, 0x54,			//   Usage (Intensity Update Channel)
> +	0x09, 0x51,			//   Usage (Red Update Channel)
> +	0x09, 0x52,			//   Usage (Green Update Channel)
> +	0x09, 0x53,			//   Usage (Blue Update Channel)
> +	0x09, 0x54,			//   Usage (Intensity Update Channel)
> +	0x09, 0x51,			//   Usage (Red Update Channel)
> +	0x09, 0x52,			//   Usage (Green Update Channel)
> +	0x09, 0x53,			//   Usage (Blue Update Channel)
> +	0x09, 0x54,			//   Usage (Intensity Update Channel)
> +	0x09, 0x51,			//   Usage (Red Update Channel)
> +	0x09, 0x52,			//   Usage (Green Update Channel)
> +	0x09, 0x53,			//   Usage (Blue Update Channel)
> +	0x09, 0x54,			//   Usage (Intensity Update Channel)
> +	0x09, 0x51,			//   Usage (Red Update Channel)
> +	0x09, 0x52,			//   Usage (Green Update Channel)
> +	0x09, 0x53,			//   Usage (Blue Update Channel)
> +	0x09, 0x54,			//   Usage (Intensity Update Channel)
> +	0x09, 0x51,			//   Usage (Red Update Channel)
> +	0x09, 0x52,			//   Usage (Green Update Channel)
> +	0x09, 0x53,			//   Usage (Blue Update Channel)
> +	0x09, 0x54,			//   Usage (Intensity Update Channel)
> +	0x09, 0x51,			//   Usage (Red Update Channel)
> +	0x09, 0x52,			//   Usage (Green Update Channel)
> +	0x09, 0x53,			//   Usage (Blue Update Channel)
> +	0x09, 0x54,			//   Usage (Intensity Update Channel)
> +	0x09, 0x51,			//   Usage (Red Update Channel)
> +	0x09, 0x52,			//   Usage (Green Update Channel)
> +	0x09, 0x53,			//   Usage (Blue Update Channel)
> +	0x09, 0x54,			//   Usage (Intensity Update Channel)
> +	0x15, 0x00,			//   Logical Minimum (0)
> +	0x26, 0xff, 0x00,		//   Logical Maximum (255)
> +	0x75, 0x08,			//   Report Size (8)
> +	0x95, 0x20,			//   Report Count (32)
> +	0xb1, 0x02,			//   Feature (Data,Var,Abs)
> +	0xc0,				//  End Collection
> +	0x85, LAMP_RANGE_UPDATE_REPORT_ID, //  Report ID (5)
> +	0x09, 0x60,			//  Usage (Lamp Range Update Report)
> +	0xa1, 0x02,			//  Collection (Logical)
> +	0x09, 0x55,			//   Usage (Lamp Update Flags)
> +	0x15, 0x00,			//   Logical Minimum (0)
> +	0x25, 0x08,			//   Logical Maximum (8)
> +	0x75, 0x08,			//   Report Size (8)
> +	0x95, 0x01,			//   Report Count (1)
> +	0xb1, 0x02,			//   Feature (Data,Var,Abs)
> +	0x09, 0x61,			//   Usage (Lamp Id Start)
> +	0x09, 0x62,			//   Usage (Lamp Id End)
> +	0x15, 0x00,			//   Logical Minimum (0)
> +	0x27, 0xff, 0xff, 0x00, 0x00,	//   Logical Maximum (65535)
> +	0x75, 0x10,			//   Report Size (16)
> +	0x95, 0x02,			//   Report Count (2)
> +	0xb1, 0x02,			//   Feature (Data,Var,Abs)
> +	0x09, 0x51,			//   Usage (Red Update Channel)
> +	0x09, 0x52,			//   Usage (Green Update Channel)
> +	0x09, 0x53,			//   Usage (Blue Update Channel)
> +	0x09, 0x54,			//   Usage (Intensity Update Channel)
> +	0x15, 0x00,			//   Logical Minimum (0)
> +	0x26, 0xff, 0x00,		//   Logical Maximum (255)
> +	0x75, 0x08,			//   Report Size (8)
> +	0x95, 0x04,			//   Report Count (4)
> +	0xb1, 0x02,			//   Feature (Data,Var,Abs)
> +	0xc0,				//  End Collection
> +	0x85, LAMP_ARRAY_CONTROL_REPORT_ID, //  Report ID (6)
> +	0x09, 0x70,			//  Usage (Lamp Array Control Report)
> +	0xa1, 0x02,			//  Collection (Logical)
> +	0x09, 0x71,			//   Usage (Autonomous Mode)
> +	0x15, 0x00,			//   Logical Minimum (0)
> +	0x25, 0x01,			//   Logical Maximum (1)
> +	0x75, 0x08,			//   Report Size (8)
> +	0x95, 0x01,			//   Report Count (1)
> +	0xb1, 0x02,			//   Feature (Data,Var,Abs)
> +	0xc0,				//  End Collection
> +	0xc0				// End Collection
> +};
> +
> +static int ll_parse(struct hid_device *hdev)
> +{
> +	return hid_parse_report(hdev, report_descriptor, sizeof(report_descrip=
tor));
> +}
> +
> +
> +struct __packed lamp_array_attributes_report_t {
> +	const uint8_t report_id;
> +	uint16_t lamp_count;
> +	uint32_t bounding_box_width_in_micrometers;
> +	uint32_t bounding_box_height_in_micrometers;
> +	uint32_t bounding_box_depth_in_micrometers;
> +	uint32_t lamp_array_kind;
> +	uint32_t min_update_interval_in_microseconds;
> +};
> +
> +static int handle_lamp_array_attributes_report(struct hid_device *hdev,
> +					       struct lamp_array_attributes_report_t *rep)
> +{
> +	struct driver_data_t *driver_data =3D hdev->driver_data;
> +
> +	rep->lamp_count =3D driver_data->lamp_count;
> +	rep->bounding_box_width_in_micrometers =3D 368000;
> +	rep->bounding_box_height_in_micrometers =3D 266000;
> +	rep->bounding_box_depth_in_micrometers =3D 30000;
> +	// LampArrayKindKeyboard, see "26.2.1 LampArrayKind Values" of "HID Us=
age Tables v1.5"
> +	rep->lamp_array_kind =3D 1;
> +	// Some guessed value for interval microseconds
> +	rep->min_update_interval_in_microseconds =3D 500;
> +
> +	return sizeof(struct lamp_array_attributes_report_t);
> +}
> +
> +
> +struct __packed lamp_attributes_request_report_t {
> +	const uint8_t report_id;
> +	uint16_t lamp_id;
> +};
> +
> +static int handle_lamp_attributes_request_report(struct hid_device *hde=
v,
> +						 struct lamp_attributes_request_report_t *rep)
> +{
> +	struct driver_data_t *driver_data =3D hdev->driver_data;
> +
> +	if (rep->lamp_id < driver_data->lamp_count)
> +		driver_data->next_lamp_id =3D rep->lamp_id;
> +	else
> +		driver_data->next_lamp_id =3D 0;
> +
> +	return sizeof(struct lamp_attributes_request_report_t);
> +}
> +
> +
> +struct __packed lamp_attributes_response_report_t {
> +	const uint8_t report_id;
> +	uint16_t lamp_id;
> +	uint32_t position_x_in_micrometers;
> +	uint32_t position_y_in_micrometers;
> +	uint32_t position_z_in_micrometers;
> +	uint32_t update_latency_in_microseconds;
> +	uint32_t lamp_purpose;
> +	uint8_t red_level_count;
> +	uint8_t green_level_count;
> +	uint8_t blue_level_count;
> +	uint8_t intensity_level_count;
> +	uint8_t is_programmable;
> +	uint8_t input_binding;
> +};
> +
> +static int handle_lamp_attributes_response_report(struct hid_device *hd=
ev,
> +						  struct lamp_attributes_response_report_t *rep)
> +{
> +	struct driver_data_t *driver_data =3D hdev->driver_data;
> +	uint16_t lamp_id =3D driver_data->next_lamp_id;
> +	const uint8_t *kbl_mapping;
> +	const uint32_t *kbl_mapping_pos_x, *kbl_mapping_pos_y, *kbl_mapping_po=
s_z;
> +
> +	rep->lamp_id =3D lamp_id;
> +	// Some guessed value for latency microseconds
> +	rep->update_latency_in_microseconds =3D 100;
> +	 // LampPurposeControl, see "26.3.1 LampPurposes Flags" of "HID Usage =
Tables v1.5"
> +	rep->lamp_purpose =3D 1;
> +	rep->red_level_count =3D 0xff;
> +	rep->green_level_count =3D 0xff;
> +	rep->blue_level_count =3D 0xff;
> +	rep->intensity_level_count =3D 0xff;
> +	rep->is_programmable =3D 1;
> +
> +	if (driver_data->keyboard_type =3D=3D WMI_AB_GET_DEVICE_STATUS_KEYBOAR=
D_LAYOUT_ANSII) {
> +		kbl_mapping =3D &sirius_16_ansii_kbl_mapping[0];
> +		kbl_mapping_pos_x =3D &sirius_16_ansii_kbl_mapping_pos_x[0];
> +		kbl_mapping_pos_y =3D &sirius_16_ansii_kbl_mapping_pos_y[0];
> +		kbl_mapping_pos_z =3D &sirius_16_ansii_kbl_mapping_pos_z[0];
> +	} else if (driver_data->keyboard_type =3D=3D WMI_AB_GET_DEVICE_STATUS_=
KEYBOARD_LAYOUT_ISO) {
> +		kbl_mapping =3D &sirius_16_iso_kbl_mapping[0];
> +		kbl_mapping_pos_x =3D &sirius_16_iso_kbl_mapping_pos_x[0];
> +		kbl_mapping_pos_y =3D &sirius_16_iso_kbl_mapping_pos_y[0];
> +		kbl_mapping_pos_z =3D &sirius_16_iso_kbl_mapping_pos_z[0];
> +	} else
> +		return -EINVAL;
> +
> +	if (kbl_mapping[lamp_id] <=3D 0xe8)
> +		rep->input_binding =3D kbl_mapping[lamp_id];
> +	else
> +		// Everything bigger is reserved/undefined, see "10 Keyboard/Keypad P=
age (0x07)" of
> +		// "HID Usage Tables v1.5" and should return 0, see "26.8.3 Lamp Attr=
ibutes" of the
> +		// same document.
> +		rep->input_binding =3D 0;
> +	rep->position_x_in_micrometers =3D kbl_mapping_pos_x[lamp_id];
> +	rep->position_y_in_micrometers =3D kbl_mapping_pos_y[lamp_id];
> +	rep->position_z_in_micrometers =3D kbl_mapping_pos_z[lamp_id];
> +
> +	driver_data->next_lamp_id =3D (driver_data->next_lamp_id + 1) % driver=
_data->lamp_count;
> +
> +	return sizeof(struct lamp_attributes_response_report_t);
> +}
> +
> +
> +#define LAMP_UPDATE_FLAGS_LAMP_UPDATE_COMPLETE	BIT(0)
> +
> +struct __packed lamp_multi_update_report_t {
> +	const uint8_t report_id;
> +	uint8_t lamp_count;
> +	uint8_t lamp_update_flags;
> +	uint16_t lamp_id[8];
> +	struct {
> +		uint8_t red;
> +		uint8_t green;
> +		uint8_t blue;
> +		uint8_t intensity;
> +	} update_channels[8];
> +};
> +
> +static int handle_lamp_multi_update_report(struct hid_device *hdev,
> +					   struct lamp_multi_update_report_t *rep)
> +{
> +	int ret;
> +	struct driver_data_t *driver_data =3D hdev->driver_data;
> +	struct wmi_device *wdev =3D dev_to_wdev(hdev->dev.parent);
> +	uint8_t lamp_count, key_id, key_id_j;
> +	union tuxedo_nb04_wmi_496_b_in_80_b_out_input *next =3D
> +		&driver_data->next_kbl_set_multiple_keys_input;
> +	union tuxedo_nb04_wmi_496_b_in_80_b_out_output output;
> +
> +	// Catching missformated lamp_multi_update_report and fail silently ac=
cording to
> +	// "HID Usage Tables v1.5"
> +	for (int i =3D 0; i < rep->lamp_count; ++i) {
> +		if (driver_data->keyboard_type =3D=3D WMI_AB_GET_DEVICE_STATUS_KEYBOA=
RD_LAYOUT_ANSII)
> +			lamp_count =3D sizeof(sirius_16_ansii_kbl_mapping);
> +		else if (driver_data->keyboard_type =3D=3D WMI_AB_GET_DEVICE_STATUS_K=
EYBOARD_LAYOUT_ISO)
> +			lamp_count =3D sizeof(sirius_16_ansii_kbl_mapping);
> +
> +		if (rep->lamp_id[i] > lamp_count) {
> +			pr_debug("Out of bounds lamp_id in lamp_multi_update_report. Skippng=
 whole report!\n");
> +			return sizeof(struct lamp_multi_update_report_t);
> +		}
> +
> +		for (int j =3D i + 1; j < rep->lamp_count; ++j) {
> +			if (rep->lamp_id[i] =3D=3D rep->lamp_id[j]) {
> +				pr_debug("Duplicate lamp_id in lamp_multi_update_report. Skippng wh=
ole report!\n");
> +				return sizeof(struct lamp_multi_update_report_t);
> +			}
> +		}
> +	}
> +
> +	for (int i =3D 0; i < rep->lamp_count; ++i) {
> +		if (driver_data->keyboard_type =3D=3D WMI_AB_GET_DEVICE_STATUS_KEYBOA=
RD_LAYOUT_ANSII)
> +			key_id =3D sirius_16_ansii_kbl_mapping[rep->lamp_id[i]];
> +		else if (driver_data->keyboard_type =3D=3D WMI_AB_GET_DEVICE_STATUS_K=
EYBOARD_LAYOUT_ISO)
> +			key_id =3D sirius_16_iso_kbl_mapping[rep->lamp_id[i]];
> +
> +		for (int j =3D 0; j < WMI_AB_KBL_SET_MULTIPLE_KEYS_LIGHTING_SETTINGS_=
COUNT_MAX; ++j) {
> +			key_id_j =3D next->kbl_set_multiple_keys_input.lighting_settings[j].=
key_id;
> +			if (key_id_j =3D=3D 0x00 || key_id_j =3D=3D key_id) {
> +				if (key_id_j =3D=3D 0x00)
> +					next->kbl_set_multiple_keys_input.lighting_setting_count =3D
> +						j + 1;
> +				next->kbl_set_multiple_keys_input.lighting_settings[j].key_id =3D
> +					key_id;
> +				// While this driver respects
> +				// intensity_update_channel according to "HID
> +				// Usage Tables v1.5" also on RGB leds, the
> +				// Microsoft MacroPad reference implementation
> +				// (https://github.com/microsoft/RP2040MacropadHidSample
> +				// 1d6c3ad) does not and ignores it. If it turns
> +				// out that Windows writes intensity =3D 0 for RGB
> +				// leds instead of intensity =3D 255, this driver
> +				// should also irgnore the
> +				// intensity_update_channel.
> +				next->kbl_set_multiple_keys_input.lighting_settings[j].red =3D
> +					rep->update_channels[i].red
> +						* rep->update_channels[i].intensity / 0xff;
> +				next->kbl_set_multiple_keys_input.lighting_settings[j].green =3D
> +					rep->update_channels[i].green
> +						* rep->update_channels[i].intensity / 0xff;
> +				next->kbl_set_multiple_keys_input.lighting_settings[j].blue =3D
> +					rep->update_channels[i].blue
> +						* rep->update_channels[i].intensity / 0xff;
> +
> +				break;
> +			}
> +		}
> +	}
> +
> +	if (rep->lamp_update_flags & LAMP_UPDATE_FLAGS_LAMP_UPDATE_COMPLETE) {
> +		ret =3D tuxedo_nb04_wmi_496_b_in_80_b_out(wdev, WMI_AB_KBL_SET_MULTIP=
LE_KEYS, next,
> +							&output);
> +		memset(next, 0, sizeof(union tuxedo_nb04_wmi_496_b_in_80_b_out_input)=
);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return sizeof(struct lamp_multi_update_report_t);
> +}
> +
> +
> +struct __packed lamp_range_update_report_t {
> +	const uint8_t report_id;
> +	uint8_t lamp_update_flags;
> +	uint16_t lamp_id_start;
> +	uint16_t lamp_id_end;
> +	uint8_t red_update_channel;
> +	uint8_t green_update_channel;
> +	uint8_t blue_update_channel;
> +	uint8_t intensity_update_channel;
> +};
> +
> +static int handle_lamp_range_update_report(struct hid_device *hdev,
> +					   struct lamp_range_update_report_t *report)
> +{
> +	int ret;
> +	struct driver_data_t *driver_data =3D hdev->driver_data;
> +	uint8_t lamp_count;
> +	struct lamp_multi_update_report_t lamp_multi_update_report =3D {
> +		.report_id =3D LAMP_MULTI_UPDATE_REPORT_ID
> +	};
> +
> +	// Catching missformated lamp_range_update_report and fail silently ac=
cording to
> +	// "HID Usage Tables v1.5"
> +	if (report->lamp_id_start > report->lamp_id_end) {
> +		pr_debug("lamp_id_start > lamp_id_end in lamp_range_update_report. Sk=
ippng whole report!\n");
> +		return sizeof(struct lamp_range_update_report_t);
> +	}
> +
> +	if (driver_data->keyboard_type =3D=3D WMI_AB_GET_DEVICE_STATUS_KEYBOAR=
D_LAYOUT_ANSII)
> +		lamp_count =3D sizeof(sirius_16_ansii_kbl_mapping);
> +	else if (driver_data->keyboard_type =3D=3D WMI_AB_GET_DEVICE_STATUS_KE=
YBOARD_LAYOUT_ISO)
> +		lamp_count =3D sizeof(sirius_16_ansii_kbl_mapping);
> +
> +	if (report->lamp_id_end > lamp_count - 1) {
> +		pr_debug("Out of bounds lamp_id_* in lamp_range_update_report. Skippn=
g whole report!\n");
> +		return sizeof(struct lamp_range_update_report_t);
> +	}
> +
> +	// Break handle_lamp_range_update_report call down to multiple
> +	// handle_lamp_multi_update_report calls to easily ensure that mixing
> +	// handle_lamp_range_update_report and handle_lamp_multi_update_report
> +	// does not break things.
> +	for (int i =3D report->lamp_id_start; i < report->lamp_id_end + 1; i =
=3D i + 8) {
> +		lamp_multi_update_report.lamp_count =3D MIN(report->lamp_id_end + 1 -=
 i, 8);
> +		if (i + lamp_multi_update_report.lamp_count =3D=3D report->lamp_id_en=
d + 1)
> +			lamp_multi_update_report.lamp_update_flags |=3D
> +				LAMP_UPDATE_FLAGS_LAMP_UPDATE_COMPLETE;
> +
> +		for (int j =3D 0; j < lamp_multi_update_report.lamp_count; ++j) {
> +			lamp_multi_update_report.lamp_id[j] =3D i + j;
> +			lamp_multi_update_report.update_channels[j].red =3D
> +				report->red_update_channel;
> +			lamp_multi_update_report.update_channels[j].green =3D
> +				report->green_update_channel;
> +			lamp_multi_update_report.update_channels[j].blue =3D
> +				report->blue_update_channel;
> +			lamp_multi_update_report.update_channels[j].intensity =3D
> +				report->intensity_update_channel;
> +		}
> +
> +		ret =3D handle_lamp_multi_update_report(hdev, &lamp_multi_update_repo=
rt);
> +		if (ret < 0)
> +			return ret;
> +		else if (ret !=3D sizeof(struct lamp_multi_update_report_t))
> +			return -EIO;
> +	}
> +
> +	return sizeof(struct lamp_range_update_report_t);
> +}
> +
> +
> +struct __packed lamp_array_control_report_t {
> +	const uint8_t report_id;
> +	uint8_t autonomous_mode;
> +};
> +
> +static int handle_lamp_array_control_report(struct hid_device __always_=
unused *hdev,
> +					    struct lamp_array_control_report_t __always_unused *rep)
> +{
> +	// The keyboard firmware doesn't have any built in effects or controls
> +	// so this is a NOOP.
> +	// According to the HID Documentation (HID Usage Tables v1.5) this
> +	// function is optional and can be removed from the HID Report
> +	// Descriptor, but it should first be confirmed that userspace respect=
s
> +	// this possibility too. The Microsoft MacroPad reference implementati=
on
> +	// (https://github.com/microsoft/RP2040MacropadHidSample 1d6c3ad)
> +	// already deviates from the spec at another point, see
> +	// handle_lamp_*_update_report.
> +
> +	return sizeof(struct lamp_array_control_report_t);
> +}
> +
> +
> +static int ll_raw_request(struct hid_device *hdev, unsigned char report=
num, __u8 *buf, size_t len,
> +			   unsigned char rtype, int reqtype)
> +{
> +	int ret;
> +
> +	pr_debug("Recived report: rtype: %u, reqtype: %u, reportnum: %u, len: =
%lu buf:\n", rtype,
> +		 reqtype, reportnum, len);
> +	print_hex_dump_bytes("", DUMP_PREFIX_OFFSET, buf, len);
> +
> +	ret =3D -EINVAL;
> +	if (rtype =3D=3D HID_FEATURE_REPORT) {
> +		if (reqtype =3D=3D HID_REQ_GET_REPORT) {
> +			if (reportnum =3D=3D LAMP_ARRAY_ATTRIBUTES_REPORT_ID
> +			    && len =3D=3D sizeof(struct lamp_array_attributes_report_t))
> +				ret =3D handle_lamp_array_attributes_report(
> +					hdev, (struct lamp_array_attributes_report_t *)buf);
> +			else if (reportnum =3D=3D LAMP_ATTRIBUTES_RESPONSE_REPORT_ID
> +			    && len =3D=3D sizeof(struct lamp_attributes_response_report_t))
> +				ret =3D handle_lamp_attributes_response_report(
> +					hdev, (struct lamp_attributes_response_report_t *)buf);
> +		} else if (reqtype =3D=3D HID_REQ_SET_REPORT) {
> +			if (reportnum =3D=3D LAMP_ATTRIBUTES_REQUEST_REPORT_ID
> +			    && len =3D=3D sizeof(struct lamp_attributes_request_report_t))
> +				ret =3D handle_lamp_attributes_request_report(
> +					hdev, (struct lamp_attributes_request_report_t *)buf);
> +			else if (reportnum =3D=3D LAMP_MULTI_UPDATE_REPORT_ID
> +			    && len =3D=3D sizeof(struct lamp_multi_update_report_t))
> +				ret =3D handle_lamp_multi_update_report(
> +					hdev, (struct lamp_multi_update_report_t *)buf);
> +			else if (reportnum =3D=3D LAMP_RANGE_UPDATE_REPORT_ID
> +			    && len =3D=3D sizeof(struct lamp_range_update_report_t))
> +				ret =3D handle_lamp_range_update_report(
> +					hdev, (struct lamp_range_update_report_t *)buf);
> +			else if (reportnum =3D=3D LAMP_ARRAY_CONTROL_REPORT_ID
> +			    && len =3D=3D sizeof(struct lamp_array_control_report_t))
> +				ret =3D handle_lamp_array_control_report(
> +					hdev, (struct lamp_array_control_report_t *)buf);
> +		}
> +	}
> +
> +	return ret;
> +}
> +
> +static const struct hid_ll_driver ll_driver =3D {
> +	.start =3D &ll_start,
> +	.stop =3D &ll_stop,
> +	.open =3D &ll_open,
> +	.close =3D &ll_close,
> +	.parse =3D &ll_parse,
> +	.raw_request =3D &ll_raw_request,
> +};
> +
> +int tuxedo_nb04_virtual_lamp_array_add_device(struct wmi_device *wdev, =
struct hid_device **hdev_out)
> +{
> +	int ret;
> +	struct hid_device *hdev;
> +
> +	pr_debug("Adding TUXEDO NB04 Virtual LampArray device.\n");
> +
> +	hdev =3D hid_allocate_device();
> +	if (IS_ERR(hdev))
> +		return PTR_ERR(hdev);
> +	*hdev_out =3D hdev;
> +
> +	strscpy(hdev->name, "TUXEDO NB04 RGB Lighting", sizeof(hdev->name));
> +
> +	hdev->ll_driver =3D &ll_driver;
> +	hdev->bus =3D BUS_VIRTUAL;
> +	hdev->vendor =3D 0x21ba;
> +	hdev->product =3D 0x0400;
> +	hdev->dev.parent =3D &wdev->dev;
> +
> +	ret =3D hid_add_device(hdev);
> +	if (ret)
> +		hid_destroy_device(hdev);
> +	return ret;
> +}
> +EXPORT_SYMBOL(tuxedo_nb04_virtual_lamp_array_add_device);
> diff --git a/drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_ab_virtual_lamp=
_array.h b/drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_ab_virtual_lamp_arr=
ay.h
> new file mode 100644
> index 0000000000000..fdc2a01d95c24
> --- /dev/null
> +++ b/drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_ab_virtual_lamp_array.=
h
> @@ -0,0 +1,18 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * This code gives the built in RGB lighting of the TUXEDO NB04 devices=
 a
> + * standardised interface, namely HID LampArray.
> + *
> + * Copyright (C) 2024 Werner Sembach wse@tuxedocomputers.com
> + */
> +
> +#ifndef TUXEDO_NB04_WMI_AB_VIRTUAL_LAMP_ARRAY_H
> +#define TUXEDO_NB04_WMI_AB_VIRTUAL_LAMP_ARRAY_H
> +
> +#include <linux/wmi.h>
> +#include <linux/hid.h>
> +
> +int tuxedo_nb04_virtual_lamp_array_add_device(struct wmi_device *wdev,
> +					      struct hid_device **hdev_out);
> +
> +#endif
> diff --git a/drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_util.c b/driver=
s/platform/x86/tuxedo/tuxedo_nb04_wmi_util.c
> new file mode 100644
> index 0000000000000..dbabdb9dd60c7
> --- /dev/null
> +++ b/drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_util.c
> @@ -0,0 +1,85 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * This code gives functions to avoid code duplication while interactin=
g with
> + * the TUXEDO NB04 wmi interfaces.
> + *
> + * Copyright (C) 2024 Werner Sembach wse@tuxedocomputers.com
> + */
> +
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include "tuxedo_nb04_wmi_ab_init.h"
> +
> +#include "tuxedo_nb04_wmi_util.h"
> +
> +static int __wmi_method_acpi_object_out(struct wmi_device *wdev, uint32=
_t wmi_method_id,
> +					uint8_t *in, acpi_size in_len, union acpi_object **out)

Please use size_t instead of acpi_size.

> +{
> +	struct tuxedo_nb04_wmi_driver_data_t *driver_data =3D wdev->dev.driver=
_data;

Please use dev_get_drvdata().

> +	struct acpi_buffer acpi_buffer_in =3D { in_len, in };
> +	struct acpi_buffer acpi_buffer_out =3D { ACPI_ALLOCATE_BUFFER, NULL };
> +
> +	pr_debug("Evaluate WMI method: %u in:\n", wmi_method_id);
> +	print_hex_dump_bytes("", DUMP_PREFIX_OFFSET, in, in_len);

I do not think this is useful, please remove.

> +
> +	mutex_lock(&driver_data->wmi_access_mutex);

Does the underlying ACPI method really require external locking? If not, t=
hen please remove this mutex.

> +	acpi_status status =3D wmidev_evaluate_method(wdev, 0, wmi_method_id, =
&acpi_buffer_in,
> +						    &acpi_buffer_out);
> +	mutex_unlock(&driver_data->wmi_access_mutex);
> +	if (ACPI_FAILURE(status)) {
> +		pr_err("Failed to evaluate WMI method.\n");
> +		return -EIO;
> +	}
> +	if (!acpi_buffer_out.pointer) {
> +		pr_err("Unexpected empty out buffer.\n");
> +		return -ENODATA;
> +	}

I believe that printing error messages should be done by the callers of th=
is method.

> +
> +	*out =3D acpi_buffer_out.pointer;
> +
> +	return 0;
> +}
> +
> +static int __wmi_method_buffer_out(struct wmi_device *wdev, uint32_t wm=
i_method_id, uint8_t *in,
> +				   acpi_size in_len, uint8_t *out, acpi_size out_len)

Please use size_t instead of acpi_size.

> +{
> +	int ret;
> +	union acpi_object *acpi_object_out =3D NULL;

union acpi_object *obj;
int ret;

> +
> +	ret =3D __wmi_method_acpi_object_out(wdev, wmi_method_id, in, in_len, =
&acpi_object_out);
> +	if (ret)
> +		return ret;
> +
> +	if (acpi_object_out->type !=3D ACPI_TYPE_BUFFER) {
> +		pr_err("Unexpected out buffer type. Expected: %u Got: %u\n", ACPI_TYP=
E_BUFFER,
> +		       acpi_object_out->type);
> +		kfree(acpi_object_out);
> +		return -EIO;
> +	}
> +	if (acpi_object_out->buffer.length !=3D out_len) {

The Windows ACPI-WMI mappers accepts oversized buffers and ignores any add=
itional data,
so please change this code to also accept oversized buffers.

> +		pr_err("Unexpected out buffer length.\n");
> +		kfree(acpi_object_out);
> +		return -EIO;
> +	}
> +
> +	memcpy(out, acpi_object_out->buffer.pointer, out_len);
> +	kfree(acpi_object_out);
> +
> +	return ret;
> +}
> +
> +int tuxedo_nb04_wmi_8_b_in_80_b_out(struct wmi_device *wdev,
> +				    enum tuxedo_nb04_wmi_8_b_in_80_b_out_methods method,
> +				    union tuxedo_nb04_wmi_8_b_in_80_b_out_input *input,
> +				    union tuxedo_nb04_wmi_8_b_in_80_b_out_output *output)
> +{
> +	return __wmi_method_buffer_out(wdev, method, input->raw, 8, output->ra=
w, 80);
> +}
> +
> +int tuxedo_nb04_wmi_496_b_in_80_b_out(struct wmi_device *wdev,
> +				      enum tuxedo_nb04_wmi_496_b_in_80_b_out_methods method,
> +				      union tuxedo_nb04_wmi_496_b_in_80_b_out_input *input,
> +				      union tuxedo_nb04_wmi_496_b_in_80_b_out_output *output)
> +{
> +	return __wmi_method_buffer_out(wdev, method, input->raw, 496, output->=
raw, 80);
> +}

Those two functions seem useless to me, please use wmi_method_buffer_out()=
 directly by passing
a pointer to the underlying struct as data and the output of sizeof() as l=
ength.

> diff --git a/drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_util.h b/driver=
s/platform/x86/tuxedo/tuxedo_nb04_wmi_util.h
> new file mode 100644
> index 0000000000000..2765cbe9fcfef
> --- /dev/null
> +++ b/drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_util.h
> @@ -0,0 +1,112 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * This code gives functions to avoid code duplication while interactin=
g with
> + * the TUXEDO NB04 wmi interfaces.
> + *
> + * Copyright (C) 2024 Werner Sembach wse@tuxedocomputers.com
> + */
> +
> +#ifndef TUXEDO_NB04_WMI_UTIL_H
> +#define TUXEDO_NB04_WMI_UTIL_H
> +
> +#include <linux/wmi.h>
> +
> +#define WMI_AB_GET_DEVICE_STATUS_DEVICE_ID_TOUCHPAD	1
> +#define WMI_AB_GET_DEVICE_STATUS_DEVICE_ID_KEYBOARD	2
> +#define WMI_AB_GET_DEVICE_STATUS_DEVICE_ID_APP_PAGES	3
> +
> +#define WMI_AB_GET_DEVICE_STATUS_KBL_TYPE_NONE		0
> +#define WMI_AB_GET_DEVICE_STATUS_KBL_TYPE_PER_KEY	1
> +#define WMI_AB_GET_DEVICE_STATUS_KBL_TYPE_FOUR_ZONE	2
> +#define WMI_AB_GET_DEVICE_STATUS_KBL_TYPE_WHITE_ONLY	3
> +
> +#define WMI_AB_GET_DEVICE_STATUS_KEYBOARD_LAYOUT_ANSII	0
> +#define WMI_AB_GET_DEVICE_STATUS_KEYBOARD_LAYOUT_ISO	1
> +
> +#define WMI_AB_GET_DEVICE_STATUS_COLOR_ID_RED		1
> +#define WMI_AB_GET_DEVICE_STATUS_COLOR_ID_GREEN		2
> +#define WMI_AB_GET_DEVICE_STATUS_COLOR_ID_YELLOW	3
> +#define WMI_AB_GET_DEVICE_STATUS_COLOR_ID_BLUE		4
> +#define WMI_AB_GET_DEVICE_STATUS_COLOR_ID_PURPLE	5
> +#define WMI_AB_GET_DEVICE_STATUS_COLOR_ID_INDIGO	6
> +#define WMI_AB_GET_DEVICE_STATUS_COLOR_ID_WHITE		7
> +
> +#define WMI_AB_GET_DEVICE_STATUS_APP_PAGES_DASHBOARD	BIT(0)
> +#define WMI_AB_GET_DEVICE_STATUS_APP_PAGES_SYSTEMINFOS	BIT(1)
> +#define WMI_AB_GET_DEVICE_STATUS_APP_PAGES_KBL		BIT(2)
> +#define WMI_AB_GET_DEVICE_STATUS_APP_PAGES_HOTKEYS	BIT(3)
> +
> +
> +union tuxedo_nb04_wmi_8_b_in_80_b_out_input {
> +	uint8_t raw[8];
> +	struct __packed {
> +		uint8_t device_type;
> +		uint8_t reserved_0[7];
> +	} get_device_status_input;
> +};
> +
> +union tuxedo_nb04_wmi_8_b_in_80_b_out_output {
> +	uint8_t raw[80];
> +	struct __packed {
> +		uint16_t return_status;
> +		uint8_t device_enabled;
> +		uint8_t kbl_type;
> +		uint8_t kbl_side_bar_supported;
> +		uint8_t keyboard_physical_layout;
> +		uint8_t app_pages;
> +		uint8_t per_key_kbl_default_color;
> +		uint8_t four_zone_kbl_default_color_1;
> +		uint8_t four_zone_kbl_default_color_2;
> +		uint8_t four_zone_kbl_default_color_3;
> +		uint8_t four_zone_kbl_default_color_4;
> +		uint8_t light_bar_kbl_default_color;
> +		uint8_t reserved_0[1];
> +		uint16_t dedicated_gpu_id;
> +		uint8_t reserved_1[64];
> +	} get_device_status_output;
> +};
> +
> +enum tuxedo_nb04_wmi_8_b_in_80_b_out_methods {
> +	WMI_AB_GET_DEVICE_STATUS	=3D 2,
> +};
> +
> +
> +#define WMI_AB_KBL_SET_MULTIPLE_KEYS_LIGHTING_SETTINGS_COUNT_MAX	120
> +
> +union tuxedo_nb04_wmi_496_b_in_80_b_out_input {
> +	uint8_t raw[496];
> +	struct __packed {
> +		uint8_t reserved_0[15];
> +		uint8_t lighting_setting_count;
> +		struct {
> +			uint8_t key_id;
> +			uint8_t red;
> +			uint8_t green;
> +			uint8_t blue;
> +		} lighting_settings[WMI_AB_KBL_SET_MULTIPLE_KEYS_LIGHTING_SETTINGS_CO=
UNT_MAX];
> +	}  kbl_set_multiple_keys_input;
> +};
> +
> +union tuxedo_nb04_wmi_496_b_in_80_b_out_output {
> +	uint8_t raw[80];
> +	struct __packed {
> +		uint8_t return_value;
> +		uint8_t reserved_0[79];
> +	} kbl_set_multiple_keys_output;
> +};
> +
> +enum tuxedo_nb04_wmi_496_b_in_80_b_out_methods {
> +	WMI_AB_KBL_SET_MULTIPLE_KEYS	=3D 6,
> +};
> +
> +
> +int tuxedo_nb04_wmi_8_b_in_80_b_out(struct wmi_device *wdev,
> +				    enum tuxedo_nb04_wmi_8_b_in_80_b_out_methods method,
> +				    union tuxedo_nb04_wmi_8_b_in_80_b_out_input *input,
> +				    union tuxedo_nb04_wmi_8_b_in_80_b_out_output *output);
> +int tuxedo_nb04_wmi_496_b_in_80_b_out(struct wmi_device *wdev,
> +				      enum tuxedo_nb04_wmi_496_b_in_80_b_out_methods method,
> +				      union tuxedo_nb04_wmi_496_b_in_80_b_out_input *input,
> +				      union tuxedo_nb04_wmi_496_b_in_80_b_out_output *output);
> +
> +#endif
