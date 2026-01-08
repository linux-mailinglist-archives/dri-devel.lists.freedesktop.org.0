Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C09BD04945
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 17:56:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AD4510E79D;
	Thu,  8 Jan 2026 16:56:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="ANG8b9PZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40BCD10E79D
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 16:56:01 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id
 d75a77b69052e-4edb8d6e98aso1263941cf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jan 2026 08:56:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767891360; cv=none;
 d=google.com; s=arc-20240605;
 b=GWOItd9ikLCyXKL/b5gyjy2PhaVA0auCDT12uDpL+B8LDPeegcS2ypy+ctFGl7xAe5
 Np9R1bhxfNFM+lrf/gyd/5/AlmA2JqXF+f/ODpI/rv1MSrPzNqtUw/8NEzKZHg4ksOLs
 zC0b8AtZJGfkSTKKxhK1kfu5MGLyGW339vVMQG9GMCHXpzII5HMmaWuINg7H1EOjQ+2i
 Y9bKtL09ERjb0Kd6Lmsweo9xC1E6IRvAPZane55ZlOwqY2eDnHh1XQj4uvm9BVLqYD2J
 jYyt4RurSroetWQirAxhY6a0vaXC0xrPfofMDjt6u/W5L0v+PuYYUJ8AUuDF76lcn/b2
 0bZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=vIdw/bZz4S68grqXEhuikL6auL03By/bmt4IlBeykRk=;
 fh=3yCfmruzjYD/L47m12ILr7K07NB9QuoLi2/2+TaTaSU=;
 b=dQhHsAt6pW28ga0gyn1N9Q6hOg/4CF4Nb+Z0y9Bdc1E5gJHvOXdFAWBE7q/fHeGGC0
 f0MSCmqmhgxjdFiCvzXSsr9zX+kH72eGD5oPZN6C4s1GEtqlLMq0UKcEJJJHtn7n9eJ0
 wz4spyEQlnYCV+WBEujBRyY15rjtvLYB2OksVhppaV7Dt1zOrD1/Ll0mFBYW4TsiX13Q
 6Wtd+9dW1dvtpZRe5Ddw3zQwwkUirFvk9ADmETqt3YtpGmJ2/uCHLy/P8y6DsqsVXcYf
 /e43ImV6wFQ6vkA4GvSkzR+mWjXVD2yazjpU0QY31zgLzCRz4s0v/Iu4DUciGSCZF7xD
 PvBg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1767891360; x=1768496160;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vIdw/bZz4S68grqXEhuikL6auL03By/bmt4IlBeykRk=;
 b=ANG8b9PZZdlc2ZKKdecfGtyLAh7O691CCyGLQTn08kzYnGx6frrq7Rgr5XLWbLPFMh
 2WLe1kjMov+lydcfSWF641w9PCBUp3EZwZ7GzlWApgBGMwwA9FKMyvD/GXYTF04OXmIE
 RqyxhDXPcHoSQMQ426UyG3XEdlUIeqMucYUZg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767891360; x=1768496160;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=vIdw/bZz4S68grqXEhuikL6auL03By/bmt4IlBeykRk=;
 b=wPKQhk3HdpbDlBpfdecP739hzMca1mRFBQCjinZ6rTlsf98ZedX52sWir9WvtZYWaV
 JAeGE+J6+5uZOhFBM2iCIihZdaOGoT67d0lf81U/i35yBQFwHNjMf6z3ci7YHLYGNFRU
 QjgCMRa0MsMCKx4yKas4vKueUBOfRJlh7Ozp3/6K/8PY3WO3iiwqWggZwPi8rdHEXwgh
 PE1RsNf3avzIV1ho6SWt7M1dz7PhxhbNmyfFHhUS2uuJ2cm1axVzAyURvTvClrUzbRyG
 LK706MSu/KaV5s0ephggY8hQT6VqduAFxsQz5nRYa90+Nf7PyhGEFR+xX6OEHASzTuQb
 W9Ug==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtlqx5zVIWzRN8OSuD0LKbI72SWMDoq0Tf5PdZMM4OS3wCKj1gDtJBmPJNqz5W20JkrDLyON9TDEQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx+xNnYIM5cHvXls7TY3+YgQ28qppAggP1jSGmFX6iqqyi6exVh
 TbxXU+M4OzDBjzc9q1YJDlHp1v6AGR2IXGvhoIudvaW0BHsE85794QK7cXagmzv8TRUMOFQSzLl
 H46aiRxoTgUwqPiNePuoMOiJmmT2CBqT769V2Hj1k
X-Gm-Gg: AY/fxX4J3jcmg8mdGlbNhHSwFiOD7wi3dvPnO4UiD62mAG0WasWYCr2xuBbJakvZZp+
 U4q0PUgcbegjSFR1IxbnskSc6pCkylIaoNR7/Rs2XXSMf7b+xq2+IM7tYQb1EifUv20kjhNBA4U
 7/w0s8D8KehIvA5LbB5Ra4oE1N+9Lt7li/n2PR0zlwkNgaQdpoKOcBBSUWFw/Yqd33I3Sbmnx3D
 7K/B0nZfQv2cmWde3wloNy2IuQZgvaa6MrqmDccUpDjTUl2yGvHU4GFEm8zi+n9aAu1EfLVrITO
 6xImpekSfluxITE8CTZRk+JaPDU=
X-Received: by 2002:a05:622a:58d:b0:4f1:83e4:73be with SMTP id
 d75a77b69052e-4ffc0a316e7mr11372301cf.15.1767891359532; Thu, 08 Jan 2026
 08:55:59 -0800 (PST)
MIME-Version: 1.0
References: <20260108145058.56943-1-tzimmermann@suse.de>
 <20260108145058.56943-2-tzimmermann@suse.de>
In-Reply-To: <20260108145058.56943-2-tzimmermann@suse.de>
From: Julius Werner <jwerner@chromium.org>
Date: Thu, 8 Jan 2026 17:55:47 +0100
X-Gm-Features: AQt7F2qJIiDpBT_vI3dPo1eTLtai_cdssRpmiMmmVYS9yYB6c7XHe8vJWwfRxd4
Message-ID: <CAODwPW9_ym3E4za3yoUAs0+1sQfaKTDOau4Oh9Zm8+2uvYVgFQ@mail.gmail.com>
Subject: Re: [PATCH 1/8] firmware: google: Do sysfb test before creating
 coreboot framebuffer
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: tzungbi@kernel.org, briannorris@chromium.org, jwerner@chromium.org, 
 javierm@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 airlied@gmail.com, simona@ffwll.ch, chrome-platform@lists.linux.dev, 
 dri-devel@lists.freedesktop.org
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

This seems less consistent to me, although tbh I don't understand the
Linux device and driver framework that well. I think the original idea
here was that the coreboot bus represents the coreboot table, and each
entry is represented as one device (regardless of whether any driver
actually wants to do anything with that entry). That's why we're
creating a device for all the tags even though most of them aren't
really interesting for kernel drivers. This also helps with inspecting
things in sysfs.

So the device with TAG_FRAMEBUFFER doesn't mean that we have a
framebuffer, it just means that we have an entry in the table
describing a framebuffer. Whether it should actually be used to set up
a framebuffer should be up to the binding driver. That's why I think
keeping this decision in the driver probe makes more sense, and
excluding it from the devices on the bus is weird (because you're just
randomly excluding one of the entries in the table from being
represented like the others, just because of details about how its
drivers would want to use it).

If you want these devices to be bound by drivers outside this
directory, then I think either that other driver needs to have the
logic to decide when a coreboot framebuffer should actually be used,
or maybe you should have a small stub driver in this directory that
binds to the list entry device, makes the decision whether to actually
use it, and if so creates a sub-device or something (if that's
possible?) which the actual outside driver can find and bind to.

On Thu, Jan 8, 2026 at 3:51=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:
>
> Test sysfb before creating the coreboot framebuffer device. Skip
> device creation if the test fails, as this framebuffer does not exist.
>
> Depending on the system setup, the initial framebuffer can be provided
> by the boot loader via screen_info boot parameters and handled by the
> kernel's sysfb code in drivers/firmware/sysfb.c. With the sysfb test in
> the coreboot-framebuffer probing, the coreboot device is present without
> the framebuffer. Even after the sysfb device has been replaced with a
> native PCI device, the coreboot device persists.
>
> Skipping device creation early avoids all these inconsistencies. It
> further prepares coreboot to support graphics drivers besides the one
> in framebuffer-coreboot.c.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/firmware/google/coreboot_table.c       | 17 +++++++++++++++++
>  drivers/firmware/google/coreboot_table.h       |  1 +
>  drivers/firmware/google/framebuffer-coreboot.c | 16 ----------------
>  3 files changed, 18 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/firmware/google/coreboot_table.c b/drivers/firmware/=
google/coreboot_table.c
> index 882db32e51be..c34426e5002d 100644
> --- a/drivers/firmware/google/coreboot_table.c
> +++ b/drivers/firmware/google/coreboot_table.c
> @@ -18,6 +18,7 @@
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
> +#include <linux/sysfb.h>
>
>  #include "coreboot_table.h"
>
> @@ -118,6 +119,22 @@ static int coreboot_table_populate(struct device *de=
v, void *ptr)
>                         return -EINVAL;
>                 }
>
> +               switch (entry->tag) {
> +               case CB_TAG_FRAMEBUFFER:
> +                       /*
> +                        * On coreboot systems, the advertised CB_TAG_FRA=
MEBUFFER entry
> +                        * in the coreboot table should only be used if t=
he payload did
> +                        * not pass a framebuffer information to the Linu=
x kernel.
> +                        *
> +                        * If the global screen_info data has been filled=
, the generic
> +                        * system framebuffers (sysfb) will already regis=
ter a platform
> +                        * device and pass that screen_info as platform_d=
ata to a driver
> +                        * that can scan-out using the system-provided fr=
amebuffer.
> +                        */
> +                       if (sysfb_handles_screen_info())
> +                               continue;
> +               }
> +
>                 device =3D kzalloc(sizeof(device->dev) + entry->size, GFP=
_KERNEL);
>                 if (!device)
>                         return -ENOMEM;
> diff --git a/drivers/firmware/google/coreboot_table.h b/drivers/firmware/=
google/coreboot_table.h
> index bb6f0f7299b4..e3c353676940 100644
> --- a/drivers/firmware/google/coreboot_table.h
> +++ b/drivers/firmware/google/coreboot_table.h
> @@ -40,6 +40,7 @@ struct lb_cbmem_ref {
>         u64 cbmem_addr;
>  };
>
> +#define CB_TAG_FRAMEBUFFER 0x12
>  #define LB_TAG_CBMEM_ENTRY 0x31
>
>  /* Corresponds to LB_TAG_CBMEM_ENTRY */
> diff --git a/drivers/firmware/google/framebuffer-coreboot.c b/drivers/fir=
mware/google/framebuffer-coreboot.c
> index c68c9f56370f..bb53d1a47409 100644
> --- a/drivers/firmware/google/framebuffer-coreboot.c
> +++ b/drivers/firmware/google/framebuffer-coreboot.c
> @@ -15,12 +15,9 @@
>  #include <linux/module.h>
>  #include <linux/platform_data/simplefb.h>
>  #include <linux/platform_device.h>
> -#include <linux/sysfb.h>
>
>  #include "coreboot_table.h"
>
> -#define CB_TAG_FRAMEBUFFER 0x12
> -
>  static const struct simplefb_format formats[] =3D SIMPLEFB_FORMATS;
>
>  static int framebuffer_probe(struct coreboot_device *dev)
> @@ -37,19 +34,6 @@ static int framebuffer_probe(struct coreboot_device *d=
ev)
>                 .format =3D NULL,
>         };
>
> -       /*
> -        * On coreboot systems, the advertised LB_TAG_FRAMEBUFFER entry
> -        * in the coreboot table should only be used if the payload did
> -        * not pass a framebuffer information to the Linux kernel.
> -        *
> -        * If the global screen_info data has been filled, the Generic
> -        * System Framebuffers (sysfb) will already register a platform
> -        * device and pass that screen_info as platform_data to a driver
> -        * that can scan-out using the system provided framebuffer.
> -        */
> -       if (sysfb_handles_screen_info())
> -               return -ENODEV;
> -
>         if (!fb->physical_address)
>                 return -ENODEV;
>
> --
> 2.52.0
>
