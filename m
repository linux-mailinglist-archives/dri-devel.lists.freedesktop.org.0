Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A04198A65D2
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 10:14:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF61610EF3E;
	Tue, 16 Apr 2024 08:14:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=sysophe.eu header.i=@sysophe.eu header.b="hBtx2u4w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 412 seconds by postgrey-1.36 at gabe;
 Tue, 16 Apr 2024 08:14:15 UTC
Received: from hygieia.sysophe.eu (hygieia.sysophe.eu [138.201.91.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56E6710E813
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 08:14:15 +0000 (UTC)
Received: from pluto.restena.lu (pluto.restena.lu [IPv6:2001:a18:1:10::156])
 by smtp.sysophe.eu (Postfix) with ESMTPSA id BF87F423AFD8;
 Tue, 16 Apr 2024 10:07:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=sysophe.eu; s=201205;
 t=1713254839; x=1713341239;
 bh=edjAuXfq7+W3fzyyUCf6+gD+x+TW33YMUHyBSQMWzgw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=hBtx2u4wwMPCrGRHsDjOek7TOVxJ+EO4t94+pjKgGj5Jq3lsOyt98ZscjEi/+iIQG
 ZIWcqqOnannDIoE8x6gsRU0m+AHxYHXD9OpBUFSbpK2k6tYnno4Z2GUQHaIQngB/9A
 gEWwQdxAk7698/Ja6pJx/z5yS68Geat/5Jt4W2J0=
Date: Tue, 16 Apr 2024 10:07:16 +0200
From: Bruno =?UTF-8?B?UHLDqW1vbnQ=?= <bonbons@sysophe.eu>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson
 <daniel.thompson@linaro.org>, Jingoo Han <jingoohan1@gmail.com>, Helge
 Deller <deller@gmx.de>, Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires
 <bentiss@kernel.org>, Alexander Shiyan <shc_work@mail.ru>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 linux-omap@vger.kernel.org
Subject: Re: [PATCH 15/18] HID: picoLCD: Constify lcd_ops
Message-ID: <20240416100716.7360ec35@pluto.restena.lu>
In-Reply-To: <20240414-video-backlight-lcd-ops-v1-15-9b37fcbf546a@kernel.org>
References: <20240414-video-backlight-lcd-ops-v1-0-9b37fcbf546a@kernel.org>
 <20240414-video-backlight-lcd-ops-v1-15-9b37fcbf546a@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.39; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

On Sun, 14 Apr 2024 18:36:13 +0200 Krzysztof Kozlowski wrote:
> 'struct lcd_ops' is not modified by core backlight code, so it can be
> made const for increased code safety.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Bruno Pr=C3=A9mont <bonbons@linux-vserver.org>

> ---
>=20
> Depends on the first patch in the series.
> ---
>  drivers/hid/hid-picolcd_lcd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/hid/hid-picolcd_lcd.c b/drivers/hid/hid-picolcd_lcd.c
> index 0c4b76de8ae5..061a33ba7b1d 100644
> --- a/drivers/hid/hid-picolcd_lcd.c
> +++ b/drivers/hid/hid-picolcd_lcd.c
> @@ -46,7 +46,7 @@ static int picolcd_check_lcd_fb(struct lcd_device *ldev=
, struct fb_info *fb)
>  	return fb && fb =3D=3D picolcd_fbinfo((struct picolcd_data *)lcd_get_da=
ta(ldev));
>  }
> =20
> -static struct lcd_ops picolcd_lcdops =3D {
> +static const struct lcd_ops picolcd_lcdops =3D {
>  	.get_contrast   =3D picolcd_get_contrast,
>  	.set_contrast   =3D picolcd_set_contrast,
>  	.check_fb       =3D picolcd_check_lcd_fb,
>=20
