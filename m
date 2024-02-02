Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D053B847422
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 17:08:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C2C510F0BC;
	Fri,  2 Feb 2024 16:07:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F88B10F0BC;
 Fri,  2 Feb 2024 16:07:56 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id
 46e09a7af769-6e129ea49b2so109160a34.0; 
 Fri, 02 Feb 2024 08:07:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706890075; x=1707494875;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pgmWK92TTcJysPwanSYXl5F0rKzCcp+c4VYB7wg/duc=;
 b=KLB33my+Vql1/Da/mQLWYbAKTHv7rjUHo6NGVlVtWCia7if2khWmTAdXJhpQU5Eb5q
 zUt0/0rj6PdRxmQvP+mSZCrWJePIVsVRATCfH/0XJqm4UImNHwzTJLr/nYXOsLOPp1NK
 nXyCCD8aBZOEB5Zg64DLHC3ZApW7e3qqOxnprEDsCNqKV8qWfq8Zc+lji8OLbvL3lI60
 m9JgbxqFkT1zrgX54VwQ6cF2lv2w96FuiruAVS+whNPoh7Ilqfn4yTuzC7JCphUzphVM
 jZDphEeDi58Vli9tpY8tgxVTdjVmCTkNPMJD+LWu/oywydLpLxdNfCgEtvU9cc854ULY
 xZ6w==
X-Gm-Message-State: AOJu0YyKwFV4JUI1L6AMKph0stwBnzXSCkBYgzC88xwlI9t3zPa93kNM
 SzEjc2WJudzeP3MONrcMhoRZyNAx7sY0DCfstOKpaxAeNiY+BZNSXe8cwnn9XNCIUIbLw2gqDc9
 qts9EuzJFFrFYn1DA2g/ffdI4cUQ=
X-Google-Smtp-Source: AGHT+IGuc57FvMYh/0xMC6KLl2NrvuWobBAsMype57vT1hgZsxVguNxvcJbjoc6y0gvTg0Vdy/ZmxN3RF7B4mSH4f3s=
X-Received: by 2002:a05:6870:d14d:b0:218:ee9c:11b6 with SMTP id
 f13-20020a056870d14d00b00218ee9c11b6mr5491841oac.3.1706890073813; Fri, 02 Feb
 2024 08:07:53 -0800 (PST)
MIME-Version: 1.0
References: <20240201221119.42564-1-mario.limonciello@amd.com>
 <20240201221119.42564-2-mario.limonciello@amd.com>
In-Reply-To: <20240201221119.42564-2-mario.limonciello@amd.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 2 Feb 2024 17:07:41 +0100
Message-ID: <CAJZ5v0iw3PLB4W0QNmRCgK2AWxe5A7wxnWSz-Jm--Mb=fnugEw@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] ACPI: video: Handle fetching EDID that is longer
 than 256 bytes
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>, 
 Harry Wentland <harry.wentland@amd.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, 
 Hans de Goede <hdegoede@redhat.com>,
 "open list:ACPI" <linux-acpi@vger.kernel.org>, 
 open list <linux-kernel@vger.kernel.org>, 
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Melissa Wen <mwen@igalia.com>, Mark Pearson <mpearson-lenovo@squebb.ca>
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

On Thu, Feb 1, 2024 at 11:11=E2=80=AFPM Mario Limonciello
<mario.limonciello@amd.com> wrote:
>
> The ACPI specification allows for an EDID to be up to 512 bytes but
> the _DDC EDID fetching code will only try up to 256 bytes.
>
> Modify the code to instead start at 512 bytes and work it's way
> down instead.
>
> As _DDC is now called up to 4 times on a machine debugging messages
> are noisier than necessary.  Decrease from info to debug.
>
> Link: https://uefi.org/htmlspecs/ACPI_Spec_6_4_html/Apx_B_Video_Extension=
s/output-device-specific-methods.html#ddc-return-the-edid-for-this-device
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

or I can apply it if that's preferred.

Thanks!

> ---
> v1->v2:
>  * Use for loop for acpi_video_get_edid()
>  * Use one of Rafael's suggestions for acpi_video_device_EDID()
>  * Decrease message level too
> ---
>  drivers/acpi/acpi_video.c | 25 +++++++++----------------
>  1 file changed, 9 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/acpi/acpi_video.c b/drivers/acpi/acpi_video.c
> index 4afdda9db019..3bfd013e09d2 100644
> --- a/drivers/acpi/acpi_video.c
> +++ b/drivers/acpi/acpi_video.c
> @@ -625,12 +625,9 @@ acpi_video_device_EDID(struct acpi_video_device *dev=
ice,
>
>         if (!device)
>                 return -ENODEV;
> -       if (length =3D=3D 128)
> -               arg0.integer.value =3D 1;
> -       else if (length =3D=3D 256)
> -               arg0.integer.value =3D 2;
> -       else
> +       if (!length || (length % 128))
>                 return -EINVAL;
> +       arg0.integer.value =3D length / 128;
>
>         status =3D acpi_evaluate_object(device->dev->handle, "_DDC", &arg=
s, &buffer);
>         if (ACPI_FAILURE(status))
> @@ -641,7 +638,8 @@ acpi_video_device_EDID(struct acpi_video_device *devi=
ce,
>         if (obj && obj->type =3D=3D ACPI_TYPE_BUFFER)
>                 *edid =3D obj;
>         else {
> -               acpi_handle_info(device->dev->handle, "Invalid _DDC data\=
n");
> +               acpi_handle_debug(device->dev->handle,
> +                                "Invalid _DDC data for length %ld\n", le=
ngth);
>                 status =3D -EFAULT;
>                 kfree(obj);
>         }
> @@ -1447,7 +1445,6 @@ int acpi_video_get_edid(struct acpi_device *device,=
 int type, int device_id,
>
>         for (i =3D 0; i < video->attached_count; i++) {
>                 video_device =3D video->attached_array[i].bind_info;
> -               length =3D 256;
>
>                 if (!video_device)
>                         continue;
> @@ -1478,18 +1475,14 @@ int acpi_video_get_edid(struct acpi_device *devic=
e, int type, int device_id,
>                         continue;
>                 }
>
> -               status =3D acpi_video_device_EDID(video_device, &buffer, =
length);
> -
> -               if (ACPI_FAILURE(status) || !buffer ||
> -                   buffer->type !=3D ACPI_TYPE_BUFFER) {
> -                       length =3D 128;
> +               for (length =3D 512; length > 0; length -=3D 128) {
>                         status =3D acpi_video_device_EDID(video_device, &=
buffer,
>                                                         length);
> -                       if (ACPI_FAILURE(status) || !buffer ||
> -                           buffer->type !=3D ACPI_TYPE_BUFFER) {
> -                               continue;
> -                       }
> +                       if (ACPI_SUCCESS(status))
> +                               break;
>                 }
> +               if (!length)
> +                       continue;
>
>                 *edid =3D buffer->buffer.pointer;
>                 return length;
> --
> 2.34.1
>
