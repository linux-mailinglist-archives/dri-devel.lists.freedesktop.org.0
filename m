Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 387546786F8
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 21:00:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB1FE10E1F6;
	Mon, 23 Jan 2023 20:00:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2F5510E1F6
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 20:00:28 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id v6so33539754ejg.6
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 12:00:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=40qXZUnFGQ7ve0bNYv96SrOOUpKugaFZGVN1hQpqfP0=;
 b=jLrqhNaa0XpXUWPt9AdGMqgDOMzVIVJl36KbVMZHKo4diIoqQ8RcXdTmbLWa8L6Rdr
 aOsPmuavucdmZOw5IhWBWa0YAWjvCh9JHWfDNVUddnWEurMh37QqBuHOikBD4oodzHsy
 DoSwFAozJDgMT6Lu7//F+w72P+1uEhnC5zvQKBRgmXS5WrYhwPNdBeJnI05lKsKTJ1FZ
 nC/Cd53xLTBIdflw7KdpL+b42iH7kIwN/Dbn1jh7r5daBqc0i0fYO1yLjhZyMud03ZEe
 g/2S9OhCtO1M3lP1afryWdexGLrFU27EqozazkOJ7K3VZxfAXWY1YAhXuFVWVGpbX+BN
 w9QQ==
X-Gm-Message-State: AFqh2kq+68wuaoBQntqMpm7fOQvATEYgGqFngDnUOINTkHwg39SKeutf
 qV8LvldV4c/PkyeMLvt1hYwYvAdL9yjB7s3tNOg=
X-Google-Smtp-Source: AMrXdXtDkWPO0cICOZRJSCYboLUtX4oU3AuOqdMLnCRm9VggXqnac2q+nS8HXqfswKbhD4Rw9RobR/LLKvaU7lxDc68=
X-Received: by 2002:a17:906:2c4b:b0:870:3557:160e with SMTP id
 f11-20020a1709062c4b00b008703557160emr2001363ejh.78.1674504027140; Mon, 23
 Jan 2023 12:00:27 -0800 (PST)
MIME-Version: 1.0
References: <20230119163744.548749-1-hdegoede@redhat.com>
In-Reply-To: <20230119163744.548749-1-hdegoede@redhat.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 23 Jan 2023 21:00:16 +0100
Message-ID: <CAJZ5v0he+0WHk_iQB6T06h6Zx-UOW6F7R=ay-hLV9-_KxbTaiQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] ACPI: video: More backlight quirks
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

On Thu, Jan 19, 2023 at 5:38 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi Rafael,
>
> With the backlight changes landing in 6.1.y now showing up in
> distribution repositories I have been receiving a steady stream of
> backlight bug reports by email.
>
> These bug-reports fall into various categories and most of them are
> already fixed with some recent fixes which are in 6.1.7 and later.
>
> One category (unfortunately) requires adding DMI quirks.
>
> I have been receiving reports from users with pre Windows 8 laptops,
> who used to pass acpi_backlight=vendor on the kernel commandline to hide
> a non functioning acpi_video# backlight device, so that userspace will
> use the native (GPU driver) backlight device instead.
>
> Starting with 6.1.y acpi_backlight=vendor is now also honored by
> the native backlight drivers, hiding the native backlight device,
> leaving these users with no backlight device at all.
>
> This leads to them sending me a bug-report. Which in a way is a good
> thing because these models really needed to have a DMI quirk added
> all along, but this was never reported upstream.
>
> The fix here is to use "acpi_backlight=native" and to set this through
> a DMI quirk so that things will work out of the box.
>
> The Acer Aspire 4810T quirk from a couple of days was like this and
> the first quirk in this series is too.
>
> I expect to receive more bug-reports like this, so you can expect
> a steady trickle of backlight quirk patches from me the coming time.
>
> Note the second quirk in this series is also a "acpi_backlight=native"
> quirk, but the root cause is somewhat different, see the commit msg.
>
> Regards,
>
> Hans
>
>
>
> Hans de Goede (2):
>   ACPI: video: Add backlight=native DMI quirk for HP Pavilion g6-1d80nr
>   ACPI: video: Add backlight=native DMI quirk for HP EliteBook 8460p
>
>  drivers/acpi/video_detect.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> --

Both applied as 6.2-rc material, thanks!
