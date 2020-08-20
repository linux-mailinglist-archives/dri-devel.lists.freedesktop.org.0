Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D19FC24CE9D
	for <lists+dri-devel@lfdr.de>; Fri, 21 Aug 2020 09:11:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EE846EAAB;
	Fri, 21 Aug 2020 07:11:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5CFD6E97A
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 16:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1597941431; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Na0xzDfd/uDMnlsu4QBaVN1Vj7lsvYAbVxxdwdvXK7M=;
 b=TexsUcZY5iCszseErJKhI2ki7tmwPMmQwbgQzSDcSoTR4eRBoLeB87RhNA2PxYJNUTIoEE
 wm/rJuE3Z0Thb75uR89TLEEt3RH9Lpr0l4z0Sj6hYPNnMBVlMrEB0hWJ3lhXbHXUgHBd2t
 HhRdLlyNuF5p1R87iwEHfNXPKhqIXpI=
Date: Thu, 20 Aug 2020 18:37:01 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 1/2] drm/panel: novatek, nt39016: Reorder calls in probe
To: Sam Ravnborg <sam@ravnborg.org>
Message-Id: <PHFDFQ.XMQO5QM3591V@crapouillou.net>
In-Reply-To: <20200820155302.GA194134@ravnborg.org>
References: <20200820121256.32037-1-paul@crapouillou.net>
 <20200820121256.32037-2-paul@crapouillou.net>
 <20200820155302.GA194134@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 21 Aug 2020 07:11:07 +0000
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

Le jeu. 20 ao=FBt 2020 =E0 17:53, Sam Ravnborg <sam@ravnborg.org> a =

=E9crit :
> On Thu, Aug 20, 2020 at 02:12:55PM +0200, Paul Cercueil wrote:
>>  The drm_panel_of_backlight() function must be called after
>>  drm_panel_init(), according to the function's documentation; =

>> otherwise
>>  the backlight won't be properly initialized.
>> =

>>  v2: New patch
>> =

>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

Patchset pushed to drm-misc-next.

Thanks!
-Paul

>>  ---
>>   drivers/gpu/drm/panel/panel-novatek-nt39016.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>> =

>>  diff --git a/drivers/gpu/drm/panel/panel-novatek-nt39016.c =

>> b/drivers/gpu/drm/panel/panel-novatek-nt39016.c
>>  index 39f7be679da5..daa583030246 100644
>>  --- a/drivers/gpu/drm/panel/panel-novatek-nt39016.c
>>  +++ b/drivers/gpu/drm/panel/panel-novatek-nt39016.c
>>  @@ -285,6 +285,9 @@ static int nt39016_probe(struct spi_device *spi)
>>   		return PTR_ERR(panel->map);
>>   	}
>> =

>>  +	drm_panel_init(&panel->drm_panel, dev, &nt39016_funcs,
>>  +		       DRM_MODE_CONNECTOR_DPI);
>>  +
>>   	err =3D drm_panel_of_backlight(&panel->drm_panel);
>>   	if (err) {
>>   		if (err !=3D -EPROBE_DEFER)
>>  @@ -292,9 +295,6 @@ static int nt39016_probe(struct spi_device *spi)
>>   		return err;
>>   	}
>> =

>>  -	drm_panel_init(&panel->drm_panel, dev, &nt39016_funcs,
>>  -		       DRM_MODE_CONNECTOR_DPI);
>>  -
>>   	drm_panel_add(&panel->drm_panel);
>> =

>>   	return 0;
>>  --
>>  2.28.0


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
