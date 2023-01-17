Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4778766DDB2
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 13:34:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5280410E53E;
	Tue, 17 Jan 2023 12:34:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 754B110E535
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 12:34:32 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id v6so44785363edd.6
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 04:34:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jdjH7apTcY9B0+5D5jb83+J30HHxoTwlJfxN/zgwRAU=;
 b=U8WKOMU9G5fdDaYIEwVmqMWjonn3RTgOXEKkmwKd92YSVBExK4XNTm2pmgmYQpLIJU
 Em4ywDWe+UoD5GShM38yMlu1GufZQCVe7678W21WH8HhxN6bjm6C91TnuqBTcO6WzXPh
 /IOldZu3wmsp/Ic2FQUQN+QOL7yRqgijyYKwtaeXTFksg4pB0yuVht/eOhb5ZVQLmQaN
 JWzgByfJfVth2aKjaoigIImFmMH5hG/Pl0PQomwtQHJGTP8jjaXj64e57oB+X65xU7yX
 VVN13UfLmO7kop74KxHCv64oNlRdAWezk6tlkjSRJx645xV538bq/YF3/xFbykfBAgnX
 rb4Q==
X-Gm-Message-State: AFqh2kp7g+y/leu1uxYgwTNQ0wZwyQUFsXh5ASOBQsi5wlAY9mODQW7Q
 pLNivx6OqrmhGMxNkNyBW1M+hL6H1zVB1bm9UaY=
X-Google-Smtp-Source: AMrXdXuFCOCNpoVmGyvFxctrN9qZgji19esmpfIQA+tLyPO9tyfRTurcKrMBVsO8XPIhkRuGqWM5x0uBdWAYIX+K37w=
X-Received: by 2002:a05:6402:94a:b0:47f:7465:6e76 with SMTP id
 h10-20020a056402094a00b0047f74656e76mr294884edz.181.1673958870716; Tue, 17
 Jan 2023 04:34:30 -0800 (PST)
MIME-Version: 1.0
References: <20230113114126.172078-1-hdegoede@redhat.com>
In-Reply-To: <20230113114126.172078-1-hdegoede@redhat.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 17 Jan 2023 13:34:14 +0100
Message-ID: <CAJZ5v0jt+AArS=QyuA0mi8c9_f=8mfWgp_kGHk_iR1m15QwHFw@mail.gmail.com>
Subject: Re: [PATCH] ACPI: video: Add backlight=native DMI quirk for Acer
 Aspire 4810T
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

On Fri, Jan 13, 2023 at 12:41 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> The Acer Aspire 4810T predates Windows 8, so it defaults to using
> acpi_video# for backlight control, but this is non functional on
> this model.
>
> Add a DMI quirk to use the native backlight interface which does
> work properly.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/acpi/video_detect.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/acpi/video_detect.c b/drivers/acpi/video_detect.c
> index d4edd64dcc2f..fb526ba8825b 100644
> --- a/drivers/acpi/video_detect.c
> +++ b/drivers/acpi/video_detect.c
> @@ -515,6 +515,14 @@ static const struct dmi_system_id video_detect_dmi_table[] = {
>                 DMI_MATCH(DMI_PRODUCT_NAME, "Precision 7510"),
>                 },
>         },
> +       {
> +        .callback = video_detect_force_native,
> +        /* Acer Aspire 4810T */
> +        .matches = {
> +               DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
> +               DMI_MATCH(DMI_PRODUCT_NAME, "Aspire 4810T"),
> +               },
> +       },
>         {
>          .callback = video_detect_force_native,
>          /* Acer Aspire 5738z */
> --

Applied as 6.2-rc material, thanks!
