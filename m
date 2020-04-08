Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E861A3035
	for <lists+dri-devel@lfdr.de>; Thu,  9 Apr 2020 09:34:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64ADF6EB80;
	Thu,  9 Apr 2020 07:33:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F6736EA0F
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 10:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1586340756; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XHrGg1kJSJbVqULtFtoJ40tkSeQG6c2tAyLWZHr7Y9s=;
 b=QYg3ozUG1fuyCrM29sl/nZlbn3oH7p7oZtVxLZ1+yJZoycw5Ca/jO6fB6DbneZ5+ohlmIc
 y2QHAkweKrAICcYYMWXlFQcN4ul64o6cWE09OyVWbdqPPvDF9CM7CL/RIP9w5HwRnR47Gl
 X2fpx/pMTuMLH9tSzdudeouogOqEV6g=
Date: Wed, 08 Apr 2020 12:12:26 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 1/2] drm/panel: NT39016: Add support for multiple modes
To: Sam Ravnborg <sam@ravnborg.org>
Message-Id: <QCSG8Q.N40UK3F20OVT2@crapouillou.net>
In-Reply-To: <20200408100452.GA20795@ravnborg.org>
References: <20200408095830.8131-1-paul@crapouillou.net>
 <20200408100452.GA20795@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 09 Apr 2020 07:33:24 +0000
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
Cc: Thierry Reding <thierry.reding@gmail.com>, od@zcrc.me,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,


Le mer. 8 avril 2020 =E0 12:04, Sam Ravnborg <sam@ravnborg.org> a =E9crit =

:
> Hi Paul.
> =

> On Wed, Apr 08, 2020 at 11:58:29AM +0200, Paul Cercueil wrote:
>>  Add support for multiple drm_display_mode entries. This will allow =

>> to
>>  add a 50 Hz mode later.
>> =

>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Patch looks good.
> =

> Could we please use lower case in the $subject?

You mean 's/Add/add/' or the panel name as well?

-Paul

> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> =

> I asume you will apply yourself.
> =

> 	Sam
> =

>>  ---
>>   drivers/gpu/drm/panel/panel-novatek-nt39016.c | 33 =

>> +++++++++++++------
>>   1 file changed, 23 insertions(+), 10 deletions(-)
>> =

>>  diff --git a/drivers/gpu/drm/panel/panel-novatek-nt39016.c =

>> b/drivers/gpu/drm/panel/panel-novatek-nt39016.c
>>  index a470810f7dbe..f1286cf6528b 100644
>>  --- a/drivers/gpu/drm/panel/panel-novatek-nt39016.c
>>  +++ b/drivers/gpu/drm/panel/panel-novatek-nt39016.c
>>  @@ -49,7 +49,8 @@ enum nt39016_regs {
>>   #define NT39016_SYSTEM_STANDBY	BIT(1)
>> =

>>   struct nt39016_panel_info {
>>  -	struct drm_display_mode display_mode;
>>  +	const struct drm_display_mode *display_modes;
>>  +	unsigned int num_modes;
>>   	u16 width_mm, height_mm;
>>   	u32 bus_format, bus_flags;
>>   };
>>  @@ -212,15 +213,22 @@ static int nt39016_get_modes(struct drm_panel =

>> *drm_panel,
>>   	struct nt39016 *panel =3D to_nt39016(drm_panel);
>>   	const struct nt39016_panel_info *panel_info =3D panel->panel_info;
>>   	struct drm_display_mode *mode;
>>  +	unsigned int i;
>> =

>>  -	mode =3D drm_mode_duplicate(connector->dev, =

>> &panel_info->display_mode);
>>  -	if (!mode)
>>  -		return -ENOMEM;
>>  +	for (i =3D 0; i < panel_info->num_modes; i++) {
>>  +		mode =3D drm_mode_duplicate(connector->dev,
>>  +					  &panel_info->display_modes[i]);
>>  +		if (!mode)
>>  +			return -ENOMEM;
>>  +
>>  +		drm_mode_set_name(mode);
>> =

>>  -	drm_mode_set_name(mode);
>>  +		mode->type =3D DRM_MODE_TYPE_DRIVER;
>>  +		if (panel_info->num_modes =3D=3D 1)
>>  +			mode->type |=3D DRM_MODE_TYPE_PREFERRED;
>> =

>>  -	mode->type =3D DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
>>  -	drm_mode_probed_add(connector, mode);
>>  +		drm_mode_probed_add(connector, mode);
>>  +	}
>> =

>>   	connector->display_info.bpc =3D 8;
>>   	connector->display_info.width_mm =3D panel_info->width_mm;
>>  @@ -230,7 +238,7 @@ static int nt39016_get_modes(struct drm_panel =

>> *drm_panel,
>>   					 &panel_info->bus_format, 1);
>>   	connector->display_info.bus_flags =3D panel_info->bus_flags;
>> =

>>  -	return 1;
>>  +	return panel_info->num_modes;
>>   }
>> =

>>   static const struct drm_panel_funcs nt39016_funcs =3D {
>>  @@ -316,8 +324,8 @@ static int nt39016_remove(struct spi_device =

>> *spi)
>>   	return 0;
>>   }
>> =

>>  -static const struct nt39016_panel_info kd035g6_info =3D {
>>  -	.display_mode =3D {
>>  +static const struct drm_display_mode kd035g6_display_modes[] =3D {
>>  +	{
>>   		.clock =3D 6000,
>>   		.hdisplay =3D 320,
>>   		.hsync_start =3D 320 + 10,
>>  @@ -330,6 +338,11 @@ static const struct nt39016_panel_info =

>> kd035g6_info =3D {
>>   		.vrefresh =3D 60,
>>   		.flags =3D DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
>>   	},
>>  +};
>>  +
>>  +static const struct nt39016_panel_info kd035g6_info =3D {
>>  +	.display_modes =3D kd035g6_display_modes,
>>  +	.num_modes =3D ARRAY_SIZE(kd035g6_display_modes),
>>   	.width_mm =3D 71,
>>   	.height_mm =3D 53,
>>   	.bus_format =3D MEDIA_BUS_FMT_RGB888_1X24,
>>  --
>>  2.25.1


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
