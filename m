Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 774D9210489
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 09:12:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19ADB6E7D2;
	Wed,  1 Jul 2020 07:12:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A5056E0EC
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 11:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1593518102; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iLivQZbuAtImOA556A9/GwUMm1HUXka6DPlyQAzwKuo=;
 b=Q/LSsYXZWBuyh3RUShBSmnkCNm3OyljvBxuq7YsUziu9aEZs299XhTkBGr9tr0Vk/6OK0l
 0ehGwufTYFqKBASWXDhdCexfbuQqnfAcYbmJZLcPrEdMC6yBgFauZJXyceTNFvTKj/2stY
 u8pTDrig8VjQB57LdZpNC3n9/a9sxxo=
Date: Tue, 30 Jun 2020 13:54:51 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 06/10] drm/ingenic: Set DMA descriptor chain address in
 probe
To: Sam Ravnborg <sam@ravnborg.org>
Message-Id: <FFMQCQ.LQ37IHUC6U3Z@crapouillou.net>
In-Reply-To: <20200630114453.GB560155@ravnborg.org>
References: <20200629235210.441709-1-paul@crapouillou.net>
 <20200629235210.441709-6-paul@crapouillou.net>
 <20200630114453.GB560155@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 01 Jul 2020 07:12:04 +0000
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
Cc: devicetree@vger.kernel.org, od@zcrc.me, David Airlie <airlied@linux.ie>,
 linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

Le mar. 30 juin 2020 =E0 13:44, Sam Ravnborg <sam@ravnborg.org> a =E9crit =

:
> Hi Paul.
> =

> On Tue, Jun 30, 2020 at 01:52:06AM +0200, Paul Cercueil wrote:
>>  The address of the DMA descriptor never changes. It can therefore =

>> be set
>>  in the probe function.
>> =

>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>  ---
>> =

>>  Notes:
>>      v2: No change
>> =

>>   drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>> =

>>  diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c =

>> b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>  index 924c8daf071a..f7b0c5dc8cd8 100644
>>  --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>  +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>  @@ -358,8 +358,6 @@ static void =

>> ingenic_drm_crtc_atomic_flush(struct drm_crtc *crtc,
>>   		ingenic_drm_crtc_update_ctrl(priv, finfo);
>> =

>>   		clk_set_rate(priv->pix_clk, state->adjusted_mode.clock * 1000);
>>  -
>>  -		regmap_write(priv->map, JZ_REG_LCD_DA0, priv->dma_hwdesc->next);
>>   	}
>> =

>>   	if (event) {
>>  @@ -757,6 +755,9 @@ static int ingenic_drm_probe(struct =

>> platform_device *pdev)
>>   		}
>>   	}
>> =

>>  +	/* Set address of our DMA descriptor chain */
>>  +	regmap_write(priv->map, JZ_REG_LCD_DA0, priv->dma_hwdesc_phys);
>>  +
> =

> =

> What is the purpose of this code after the assignment was moved:
> =

> static int ingenic_drm_probe(struct platform_device *pdev)
> {
> ...
> 	priv->dma_hwdesc->next =3D priv->dma_hwdesc_phys;
> =

> I do not see ->next used anymore.
> Could this assignment be dropped?
> =

> =

> And the following line:
> 	priv->dma_hwdesc->id =3D 0xdeafbead;
> =

> I can only see ->id be assingned, it is never referenced??
> =

> Maybe this is all related to the structure assumed by the data pointed
> to by JZ_REG_LCD_DA0?

As its name suggests, 'dma_hwdesc' points to a DMA hardware descriptor. =

Setting ->next sets the address of the next descriptor (which is itself =

since we only use one descriptor). The 'id' field will be copied by the =

hardware to a register when the DMA descriptor is loaded, so we can =

know from userspace (debugfs) what DMA descriptors are loaded by =

looking up the IDs.

-Paul

> 	Sam
> =

>>   	ret =3D drm_dev_register(drm, 0);
>>   	if (ret) {
>>   		dev_err(dev, "Failed to register DRM driver\n");
>>  --
>>  2.27.0
>> =

>>  _______________________________________________
>>  dri-devel mailing list
>>  dri-devel@lists.freedesktop.org
>>  https://lists.freedesktop.org/mailman/listinfo/dri-devel


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
