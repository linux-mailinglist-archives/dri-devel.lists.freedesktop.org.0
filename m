Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EACB157D66
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2020 15:30:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB16F6E995;
	Mon, 10 Feb 2020 14:30:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13CEA6EC5D
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2020 14:30:00 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 941F12080C
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2020 14:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581344999;
 bh=srVv0k1PUHqV+iykNI1ngzesXpD86NAK0uNW9suEACs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=oEiWLmd1kSXZ5sypE8oAAinphmmZLmxs31uhycX9azwpOPFqTXO/+UVFMqbsYyiMx
 krkL49X6CUHw2+HY5lSc9gnxuh3NOnPRfarRYnw7W7j8G7jQtesLpUU3EvqIoG7jeA
 i1qkf8TCQyMX1IgXDqVs298UE8ud75+y3W8Y6ikU=
Received: by mail-lf1-f54.google.com with SMTP id 203so4311015lfa.12
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2020 06:29:59 -0800 (PST)
X-Gm-Message-State: APjAAAUxO2r1mj+4Dhn4yzviTNPRrDKz3XZwwnA+8FMovSCqIyqYHOh+
 mrSNTD7A+lwAbvM6LXVDfn951AaHxdP/isN7X4A=
X-Google-Smtp-Source: APXvYqzmUwB64vGBYzVzZamaC5P7yO6lrotLzuwaIsiD/JXK5oCwW0cmlX60GO7+HofSYdj5YL/zDkbiJVIo2+R50L4=
X-Received: by 2002:a19:4855:: with SMTP id v82mr842321lfa.197.1581344997745; 
 Mon, 10 Feb 2020 06:29:57 -0800 (PST)
MIME-Version: 1.0
References: <20200210101546.287565-1-linus.walleij@linaro.org>
In-Reply-To: <20200210101546.287565-1-linus.walleij@linaro.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Mon, 10 Feb 2020 15:29:46 +0100
X-Gmail-Original-Message-ID: <CAJKOXPfGvOH=TbpFwh7QUT8001UAo7tdiaVNGSj97ytkNmo5cg@mail.gmail.com>
Message-ID: <CAJKOXPfGvOH=TbpFwh7QUT8001UAo7tdiaVNGSj97ytkNmo5cg@mail.gmail.com>
Subject: Re: [PATCH v3] backlight: pwm_bl: Switch to full GPIO descriptor
To: Linus Walleij <linus.walleij@linaro.org>
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 dri-devel@lists.freedesktop.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Lee Jones <lee.jones@linaro.org>, Guan Xuetao <gxt@pku.edu.cn>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 10 Feb 2020 at 11:15, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> The PWM backlight still supports passing a enable GPIO line as
> platform data using the legacy <linux/gpio.h> API.
>
> It turns out that ever board using this mechanism except one
> is pass .enable_gpio = -1. So we drop all these cargo-culted -1's
> from all instances of this platform data in the kernel.
>
> The remaning board, Palm TC, is converted to pass a machine
> descriptior table with the "enable" GPIO instead, and delete the
> platform data entry for enable_gpio and the code handling it
> and things should work smoothly with the new API.
>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Guan Xuetao <gxt@pku.edu.cn>
> Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>
> Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v2->v3:
> - Collect Robert's ACK.

You missed my ack:

For s3c:
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
