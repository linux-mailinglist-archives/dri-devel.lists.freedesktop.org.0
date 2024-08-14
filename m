Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB593951AC9
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 14:25:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F73B10E460;
	Wed, 14 Aug 2024 12:25:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ZCqHBxRX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com
 [209.85.219.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A11F10E460
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 12:25:49 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id
 3f1490d57ef6-e03caab48a2so725668276.1
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 05:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723638348; x=1724243148; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=c9W+rcl3/x6n/YcRtLISn/hkiAh/kVAHqezbuzoZlzs=;
 b=ZCqHBxRXwkhbNNdNJ0XMBHECg5x/xGHjWSF4TvCWtp9+20XGMRFiO89xH23S6qdfOi
 C4iCb3mEMWxOfZHVBgeR8Tu3hvEb5vbJikvoBwMIKiB7DYJizp7JFZ2lSW4B9PBTZ7IC
 TYIykDvtri+XhqERTmMFcGFsSSw1CKAUc/AVxaWCVAaZD9YkQvBBjbJluBu+vgsy+YxU
 CDevsHocj0SjJ+vSmd84s1gCrZcor/rZeMkhv45+62xVlS4ITtWLVehliAYXrH4NhoEz
 2ZxWAMFOWty7DMLj36yZBVlkqzazm5F69svb4m9G8oMBKhP0WanuYWl1uuAZrRV7HGfh
 fZQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723638348; x=1724243148;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=c9W+rcl3/x6n/YcRtLISn/hkiAh/kVAHqezbuzoZlzs=;
 b=YYwvcDB7I/iS2uG8o4yfCq+i7sX7miI0OHZ98s/xFgOE5EcbOP0puYNWz+8PQc5P5Q
 GYZSmUWDW8/SL6ucJSvHxiKlUL63AGXUwsuZWUYTkLWt/z+TW/SlsR3LTKI0zTD4Ggdg
 ts5yTFyc9NVHi5goxcCq2ENzE1Ruk4e+dp4ITi8JjJ/qsFAVTnnjK1+RaNCayNECg+r2
 WRns3CzlKbcbxIqKDPaKEENaIqO3Kndm0P29WUz1oFPx6Wc773vH0tnOnpNHIw9AMbCz
 euZ82yrJzBJ+K7S6ML5SXUMP0+Ic+vCar3wDvZvDn2wUnnjI5CC6YfKREg8iNuYkvayC
 67sQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOdQ1eCL0rUT0l+7OOq9EwkxcbMXX1E2+SuDnm/PnuwU4hNGyk5T0pshD3Hstcj+tZ+dh5fqF4jaTAb7cK6VAsqTCtTxnUhT43kEsOSahY
X-Gm-Message-State: AOJu0YwnnOd2ISxIjlEa506PRL5p8IKuRbADP1ZxkYZYBr5ed3YbyQoy
 XroaXjhIS5G114TlOjMslAhmddpOtLaGNfgMQJCZ//xeHmiddDU4AraXsXCIOAnpDhTY/cmVfp4
 A5ldRVU5aZwed7y+iIMfT3n9NkX/rdPv7i5S/6A==
X-Google-Smtp-Source: AGHT+IG9s5zKEuElzdmu8nYTv+TuYXsEEzkAtXGAXraUgcr2mrfhNdPpz8+DdeopqaF18UtxfyTI7E1EKXrMGt7AwqI=
X-Received: by 2002:a25:d685:0:b0:e0b:f963:263e with SMTP id
 3f1490d57ef6-e1140cd0625mr5768707276.9.1723638348494; Wed, 14 Aug 2024
 05:25:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240728114200.75559-1-wahrenst@gmx.net>
 <20240728114200.75559-6-wahrenst@gmx.net>
In-Reply-To: <20240728114200.75559-6-wahrenst@gmx.net>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 14 Aug 2024 14:25:12 +0200
Message-ID: <CAPDyKFpNbrgLOrtofdR3s0hHvao3gt4+6C0Oj5_phrRYi=enCQ@mail.gmail.com>
Subject: Re: [PATCH V2 05/16] pmdomain: raspberrypi-power: set flag
 GENPD_FLAG_ACTIVE_WAKEUP
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, Maxime Ripard <mripard@kernel.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
 Jiri Slaby <jirislaby@kernel.org>, Minas Harutyunyan <hminas@synopsys.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Lukas Wunner <lukas@wunner.de>, 
 Artur Petrosyan <Arthur.Petrosyan@synopsys.com>,
 Peter Robinson <pbrobinson@gmail.com>, 
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com, 
 linux-pm@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel-list@raspberrypi.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 28 Jul 2024 at 13:47, Stefan Wahren <wahrenst@gmx.net> wrote:
>
> Set flag GENPD_FLAG_ACTIVE_WAKEUP to rpi_power genpd, then when a device
> is set as wakeup source using device_set_wakeup_enable, the power
> domain could be kept on to make sure the device could wakeup the system.
>
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>

Patch 3 -> 5, applied for next to my pmdomain tree, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/bcm/raspberrypi-power.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/pmdomain/bcm/raspberrypi-power.c b/drivers/pmdomain/bcm/raspberrypi-power.c
> index fadedfc9c645..b87ea7adb7be 100644
> --- a/drivers/pmdomain/bcm/raspberrypi-power.c
> +++ b/drivers/pmdomain/bcm/raspberrypi-power.c
> @@ -91,6 +91,7 @@ static void rpi_common_init_power_domain(struct rpi_power_domains *rpi_domains,
>         dom->fw = rpi_domains->fw;
>
>         dom->base.name = name;
> +       dom->base.flags = GENPD_FLAG_ACTIVE_WAKEUP;
>         dom->base.power_on = rpi_domain_on;
>         dom->base.power_off = rpi_domain_off;
>
> --
> 2.34.1
>
>
