Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD018840787
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 14:54:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 234B511293D;
	Mon, 29 Jan 2024 13:54:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com
 [209.85.161.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5355611294A;
 Mon, 29 Jan 2024 13:54:55 +0000 (UTC)
Received: by mail-oo1-f43.google.com with SMTP id
 006d021491bc7-59a1f85923aso126630eaf.1; 
 Mon, 29 Jan 2024 05:54:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706536494; x=1707141294;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pYlBZ5W/rq3MF6m5qquOJIF/ojrZUdhYO+OW6wTYHOk=;
 b=Bnm5E2APDZpzLqqLbzjTmxKe7vXgj1EbJC15x9DVaxLWe1mCM3nxcd8d8qIojErbYr
 UL4H40tu3d2DVJ31F+4uyvNkSwP915n7CntsMx7LmtSF+CjOWkyrHke2f3c1ANXz7kwZ
 Ar76JK1J3ntlVoNxLZxAFURWAisWeZeSQaQkd1uma2F9M6fPWoruJL7e3kwJGgOWt4ev
 dpOeAqR+0sIMcWox1sqNjGbPc5b5TDCUqbtoC2Tyo7RNEM/3u4cFLQFugpKsJ/V5hPEh
 MSWoG2OdZQH0YqqkRusUiOJp/bPQYn+Ut36umwj4PDegQFGnYzx7yZQMxbrcX+rBbOy2
 B0Mg==
X-Forwarded-Encrypted: i=0;
 AJvYcCWI5wW92nq0cHRDPvGThcIK+vYi7JZFDWcBmYDMFZ6JkrLgi4yFe4D9QYu0GL8AhRFdT6L4FHgOj1aonzfeXxb5A0g1B4nPchYr3EcS36iu
X-Gm-Message-State: AOJu0YxKG77EqK8jQt2NhzzV/jRzyWnOwna4EWNQgw4GHk2bwQ4tnGu0
 I+9KoNYGEejNEZfgW3WBBoOrQxSbrveFPCrbIEfHHS1/ow+Wd6Z0/ZCyuZ50Itg5zh6f+Ck4lje
 XJqKDMPaBba5F/S0jRf5n8AZqcn0=
X-Google-Smtp-Source: AGHT+IGYDlwxaaseY0LM9XvqXJBdwuD8nvxYIF014j7kc1xHNle26/I11S8aooxI2NqU4SudQWrClPjl81PcCR1+t0A=
X-Received: by 2002:a05:6870:230d:b0:214:fddf:99f7 with SMTP id
 w13-20020a056870230d00b00214fddf99f7mr7112645oao.5.1706536494486; Mon, 29 Jan
 2024 05:54:54 -0800 (PST)
MIME-Version: 1.0
References: <20240126184639.8187-1-mario.limonciello@amd.com>
 <20240126184639.8187-2-mario.limonciello@amd.com>
In-Reply-To: <20240126184639.8187-2-mario.limonciello@amd.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 29 Jan 2024 14:54:43 +0100
Message-ID: <CAJZ5v0iX5=u5y0JS2OzYMvYNnjZBCM2YfSTsSdg3CtH4rBMyUw@mail.gmail.com>
Subject: Re: [PATCH 1/2] ACPI: video: Handle fetching EDID that is longer than
 256 bytes
To: Mario Limonciello <mario.limonciello@amd.com>
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
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>,
 "open list:ACPI" <linux-acpi@vger.kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 open list <linux-kernel@vger.kernel.org>, amd-gfx@lists.freedesktop.org,
 Melissa Wen <mwen@igalia.com>, Hans de Goede <hdegoede@redhat.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 26, 2024 at 7:55=E2=80=AFPM Mario Limonciello
<mario.limonciello@amd.com> wrote:
>
> The ACPI specification allows for an EDID to be up to 512 bytes but
> the _DDC EDID fetching code will only try up to 256 bytes.
>
> Modify the code to instead start at 512 bytes and work it's way
> down instead.
>
> Link: https://uefi.org/htmlspecs/ACPI_Spec_6_4_html/Apx_B_Video_Extension=
s/output-device-specific-methods.html#ddc-return-the-edid-for-this-device
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>  drivers/acpi/acpi_video.c | 23 ++++++++++++++++-------
>  1 file changed, 16 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/acpi/acpi_video.c b/drivers/acpi/acpi_video.c
> index 62f4364e4460..b3b15dd4755d 100644
> --- a/drivers/acpi/acpi_video.c
> +++ b/drivers/acpi/acpi_video.c
> @@ -624,6 +624,10 @@ acpi_video_device_EDID(struct acpi_video_device *dev=
ice,
>                 arg0.integer.value =3D 1;
>         else if (length =3D=3D 256)
>                 arg0.integer.value =3D 2;
> +       else if (length =3D=3D 384)
> +               arg0.integer.value =3D 3;
> +       else if (length =3D=3D 512)
> +               arg0.integer.value =3D 4;

It looks like switch () would be somewhat better.

Or maybe even

arg0.integer.value =3D length / 128;

The validation could be added too:

if (arg0.integer.value > 4 || arg0.integer.value * 128 !=3D length)
        return -EINVAL;

but it is pointless, because the caller is never passing an invalid
number to it AFAICS.

>         else
>                 return -EINVAL;
>
> @@ -1443,7 +1447,7 @@ int acpi_video_get_edid(struct acpi_device *device,=
 int type, int device_id,
>
>         for (i =3D 0; i < video->attached_count; i++) {
>                 video_device =3D video->attached_array[i].bind_info;
> -               length =3D 256;
> +               length =3D 512;
>
>                 if (!video_device)
>                         continue;
> @@ -1478,13 +1482,18 @@ int acpi_video_get_edid(struct acpi_device *devic=
e, int type, int device_id,
>
>                 if (ACPI_FAILURE(status) || !buffer ||
>                     buffer->type !=3D ACPI_TYPE_BUFFER) {
> -                       length =3D 128;
> -                       status =3D acpi_video_device_EDID(video_device, &=
buffer,
> -                                                       length);
> -                       if (ACPI_FAILURE(status) || !buffer ||
> -                           buffer->type !=3D ACPI_TYPE_BUFFER) {
> -                               continue;
> +                       while (length) {

I would prefer a do {} while () loop here, which could include the
first invocation of acpi_video_device_EDID() too (and reduce code
duplication a bit).

> +                               length -=3D 128;
> +                               status =3D acpi_video_device_EDID(video_d=
evice, &buffer,
> +                                                               length);

No line break, please.

> +                               if (ACPI_FAILURE(status) || !buffer ||
> +                                   buffer->type !=3D ACPI_TYPE_BUFFER) {
> +                                       continue;
> +                               }
> +                               break;
>                         }
> +                       if (!length)
> +                               continue;
>                 }
>
>                 *edid =3D buffer->buffer.pointer;
> --
