Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B8167871A
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 21:03:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BE9410E1FE;
	Mon, 23 Jan 2023 20:03:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D0AF10E1FE
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 20:03:10 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id ud5so33581534ejc.4
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 12:03:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=E3fVX9/iO2GxBu3HeDkyOtWJr/a2aLFft23eQ4Bm/IA=;
 b=yi/4kgWZle/IpJCT1Euma4vMXHHs7nyXlrb2meBWxpf8K0KdqDfKMqWzIeccw284vA
 bAZXwgXlswH5NhKFmQLgkzREOXsH1oujghyM42Dw0Y2y0H+k4Mb9ftyHe1MuBSi+9wj1
 4jrta3u3QGQyNrbvo07FoH5Ao4Jd+sPEt3Yl5L2bf3llZx+jL2ps4TzXFJ7NWZvaipes
 XhRCJvMB/xmqIINa7OULrtBDwsDI48+UJ3zOgiDibDWxAaEWKkvD0ymwm2V+hcrkegV7
 Ewf6pYj+h8o90SEJwTJIOq3BPvX67wJNAJIbghWqD3WRZNaBUESYmd7k/LXUvyVEMM3o
 LZDg==
X-Gm-Message-State: AFqh2kpqWxBy1Xp8Ymzy/nzvX69zqu3wyvYTn9qMrZQAod3FZP9bCJIa
 pNxdHwYNvqrBk/90Xua3D0/9BQRciu104kn/BWDImGQm
X-Google-Smtp-Source: AMrXdXuENRkvRLb6rYTN1lIZOmvWYGb1pdtChgR0SFwD3x+I9wxq0FF7oammztxQkdMfNYMJH+HQ+pmHm6yEdpT0l7g=
X-Received: by 2002:a17:906:92c8:b0:877:8b1c:fd7c with SMTP id
 d8-20020a17090692c800b008778b1cfd7cmr2051945ejx.67.1674504188794; Mon, 23 Jan
 2023 12:03:08 -0800 (PST)
MIME-Version: 1.0
References: <20230119172441.623918-1-hdegoede@redhat.com>
In-Reply-To: <20230119172441.623918-1-hdegoede@redhat.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 23 Jan 2023 21:02:57 +0100
Message-ID: <CAJZ5v0geNw_RcQBpnrfA3qpnqDjyoJCACoJG+v9vCEFr6RMgKA@mail.gmail.com>
Subject: Re: [PATCH] ACPI: video: Add backlight=native DMI quirk for Asus U46E
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
Cc: linux-acpi@vger.kernel.org, Len Brown <lenb@kernel.org>,
 dri-devel@lists.freedesktop.org, "Rafael J . Wysocki" <rafael@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 19, 2023 at 6:24 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> The Asus U46E backlight tables have a set of interesting problems:
>
> 1. Its ACPI tables do make _OSI ("Windows 2012") checks, so
>    acpi_osi_is_win8() should return true.
>
>    But the tables have 2 sets of _OSI calls, one from the usual global
>    _INI method setting a global OSYS variable and a second set of _OSI
>    calls from a MSOS method and the MSOS method is the only one calling
>    _OSI ("Windows 2012").
>
>    The MSOS method only gets called in the following cases:
>    1. From some Asus specific WMI methods
>    2. From _DOD, which only runs after acpi_video_get_backlight_type()
>       has already been called by the i915 driver
>    3. From other ACPI video bus methods which never run (see below)
>    4. From some EC query callbacks
>
>    So when i915 calls acpi_video_get_backlight_type() MSOS has never run
>    and acpi_osi_is_win8() returns false, so acpi_video_get_backlight_type()
>    returns acpi_video as the desired backlight type, which causes
>    the intel_backlight device to not register.
>
> 2. _DOD effectively does this:
>
>                     Return (Package (0x01)
>                     {
>                         0x0400
>                     })
>
>    causing acpi_video_device_in_dod() to return false, which causes
>    the acpi_video backlight device to not register.
>
> Leaving the user with no backlight device at all. Note that before 6.1.y
> the i915 driver would register the intel_backlight device unconditionally
> and since that then was the only backlight device userspace would use that.
>
> Add a backlight=native DMI quirk for this special laptop to restore
> the old (and working) behavior of the intel_backlight device registering.
>
> Fixes: fb1836c91317 ("ACPI: video: Prefer native over vendor")
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/acpi/video_detect.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/acpi/video_detect.c b/drivers/acpi/video_detect.c
> index aa6196e5e574..64eab35037c3 100644
> --- a/drivers/acpi/video_detect.c
> +++ b/drivers/acpi/video_detect.c
> @@ -610,6 +610,14 @@ static const struct dmi_system_id video_detect_dmi_table[] = {
>                 DMI_MATCH(DMI_PRODUCT_NAME, "GA503"),
>                 },
>         },
> +       {
> +        .callback = video_detect_force_native,
> +        /* Asus U46E */
> +        .matches = {
> +               DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK Computer Inc."),
> +               DMI_MATCH(DMI_PRODUCT_NAME, "U46E"),
> +               },
> +       },
>         {
>          .callback = video_detect_force_native,
>          /* Asus UX303UB */
> --

Applied as 6.2-rcf material, thanks!
