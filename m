Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB4966A84E
	for <lists+dri-devel@lfdr.de>; Sat, 14 Jan 2023 02:30:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEFD510E054;
	Sat, 14 Jan 2023 01:30:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-41104.protonmail.ch (mail-41104.protonmail.ch
 [185.70.41.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAC0610E054
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Jan 2023 01:30:50 +0000 (UTC)
Date: Sat, 14 Jan 2023 01:30:33 +0000
Authentication-Results: mail-41104.protonmail.ch;
 dkim=pass (1024-bit key) header.d=connolly.tech header.i=@connolly.tech
 header.b="Z4VjL+eg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
 s=protonmail; t=1673659842; x=1673919042;
 bh=AdZAhK55J//xC6CGMSCMaoU1ntstNCM0ncZKk8nZWlc=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=Z4VjL+egla2BJR+hp4BC/RWQ5LuWYsGA67ggqO1uEspGNjbvtK/CODPdqeNtIVbQu
 TbJVYk29SzPjUqxt+YlewOhw/xq8a1kzd+swnIdjKR3vbU/0JI/xmKy50zFHlGyx4P
 spgWJ2hZTA/y1c1QepxojQZXudhOlAN49SNhdUWU=
To: Richard Acayan <mailingradian@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Emil Velikov <emil.l.velikov@gmail.com>, Vinay Simha BN <simhavcs@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
From: Caleb Connolly <caleb@connolly.tech>
Subject: Re: [RFC PATCH v2 2/2] drm/panel: sofef00: Use 16-bit panel brightness
Message-ID: <160f5f63-6e80-a98c-c2c4-5e5e03e574da@connolly.tech>
In-Reply-To: <20230114010006.50471-3-mailingradian@gmail.com>
References: <20230114010006.50471-1-mailingradian@gmail.com>
 <20230114010006.50471-3-mailingradian@gmail.com>
Feedback-ID: 10753939:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: Daniel Mentz <danielmentz@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 14/01/2023 01:00, Richard Acayan wrote:
> These panels communicate brightness in big endian. This is not a quirk
> of the panels themselves, but rather, a part of the MIPI standard. Use
> the new mipi_dsi_dcs_set_display_brightness_wide() function that
> properly handles 16-bit brightness instead of doing special processing
> of the brightness values.
>
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>

Awesome! Thanks for this series, glad to know this isn't a weird panel
quirk aha.

This works fine on the OnePlus 6 (the user of this panel), so for both
patches:

Tested-by: Caleb Connolly <caleb@connolly.tech>
> ---
>  drivers/gpu/drm/panel/panel-samsung-sofef00.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/panel/panel-samsung-sofef00.c b/drivers/gpu/=
drm/panel/panel-samsung-sofef00.c
> index 1a0d24595faa..014fe350bc59 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-sofef00.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
> @@ -10,7 +10,6 @@
>  #include <linux/of.h>
>  #include <linux/of_device.h>
>  #include <linux/regulator/consumer.h>
> -#include <linux/swab.h>
>  #include <linux/backlight.h>
>
>  #include <video/mipi_display.h>
> @@ -221,13 +220,9 @@ static int sofef00_panel_bl_update_status(struct bac=
klight_device *bl)
>  {
>  =09struct mipi_dsi_device *dsi =3D bl_get_data(bl);
>  =09int err;
> -=09u16 brightness;
> +=09u16 brightness =3D (u16)backlight_get_brightness(bl);
>
> -=09brightness =3D (u16)backlight_get_brightness(bl);
> -=09// This panel needs the high and low bytes swapped for the brightness=
 value
> -=09brightness =3D __swab16(brightness);
> -
> -=09err =3D mipi_dsi_dcs_set_display_brightness(dsi, brightness);
> +=09err =3D mipi_dsi_dcs_set_display_brightness_large(dsi, brightness);
>  =09if (err < 0)
>  =09=09return err;
>
> --
> 2.39.0
>

--
Kind Regards,
Caleb

