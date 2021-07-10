Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2BDE3C3410
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jul 2021 12:04:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13B7B6EB1A;
	Sat, 10 Jul 2021 10:04:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB5CE6EB1A
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jul 2021 10:04:21 +0000 (UTC)
Date: Sat, 10 Jul 2021 11:04:11 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] drm/ingenic: Convert to Linux IRQ interfaces
To: Sam Ravnborg <sam@ravnborg.org>
Message-Id: <ZAX0WQ.WYKBDC2M1I1Y2@crapouillou.net>
In-Reply-To: <YOk/S1MTPWEbe93Y@ravnborg.org>
References: <20210706074409.8664-1-tzimmermann@suse.de>
 <YOk/S1MTPWEbe93Y@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-mips@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Le sam., juil. 10 2021 at 08:33:47 +0200, Sam Ravnborg=20
<sam@ravnborg.org> a =E9crit :
> Hi Thomas,
>=20
> On Tue, Jul 06, 2021 at 09:44:09AM +0200, Thomas Zimmermann wrote:
>>  Drop the DRM IRQ midlayer in favor of Linux IRQ interfaces. DRM's
>>  IRQ helpers are mostly useful for UMS drivers. Modern KMS drivers
>>  don't benefit from using it.
>>=20
>>  Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>  ---
>>   drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 13 +++++++------
>>   1 file changed, 7 insertions(+), 6 deletions(-)
>>=20
>>  diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c=20
>> b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>  index c296472164d9..a09b7da21b53 100644
>>  --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>  +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>  @@ -33,7 +33,6 @@
>>   #include <drm/drm_fourcc.h>
>>   #include <drm/drm_gem_atomic_helper.h>
>>   #include <drm/drm_gem_framebuffer_helper.h>
>>  -#include <drm/drm_irq.h>
>>   #include <drm/drm_managed.h>
>>   #include <drm/drm_of.h>
>>   #include <drm/drm_panel.h>
>>  @@ -799,8 +798,6 @@ static const struct drm_driver=20
>> ingenic_drm_driver_data =3D {
>>   	.fops			=3D &ingenic_drm_fops,
>>   	.gem_create_object	=3D ingenic_drm_gem_create_object,
>>   	DRM_GEM_CMA_DRIVER_OPS,
>>  -
>>  -	.irq_handler		=3D ingenic_drm_irq_handler,
>>   };
>>=20
>>   static const struct drm_plane_funcs=20
>> ingenic_drm_primary_plane_funcs =3D {
>>  @@ -1098,7 +1095,7 @@ static int ingenic_drm_bind(struct device=20
>> *dev, bool has_components)
>>   		encoder->possible_clones =3D clone_mask;
>>   	}
>>=20
>>  -	ret =3D drm_irq_install(drm, irq);
>>  +	ret =3D request_irq(irq, ingenic_drm_irq_handler, 0,=20
>> drm->driver->name, drm);
>>=20

Can't you use the devm variant?

>>   	if (ret) {
>>   		dev_err(dev, "Unable to install IRQ handler\n");
>>   		return ret;
>>  @@ -1192,14 +1189,18 @@ static void ingenic_drm_unbind(struct=20
>> device *dev)
>>   {
>>   	struct ingenic_drm *priv =3D dev_get_drvdata(dev);
>>   	struct clk *parent_clk =3D clk_get_parent(priv->pix_clk);
>>  +	struct drm_device *drm =3D &priv->drm;
>>  +	struct platform_device *pdev =3D to_platform_device(drm->dev);
>>  +
>>  +	free_irq(platform_get_irq(pdev, 0), drm);
>=20
> The driver was missing a drm_irq_uninstall() so the above code is
> actually a small bug-fix. It should be mentioned in the changelog.
> With this fixed:
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
>=20
> Note: I expect Paul to review too and apply.

I wasn't Cc'd? :(

-Paul

>=20
> 	Sam
>=20
>>=20
>>   	clk_notifier_unregister(parent_clk, &priv->clock_nb);
>>   	if (priv->lcd_clk)
>>   		clk_disable_unprepare(priv->lcd_clk);
>>   	clk_disable_unprepare(priv->pix_clk);
>>=20
>>  -	drm_dev_unregister(&priv->drm);
>>  -	drm_atomic_helper_shutdown(&priv->drm);
>>  +	drm_dev_unregister(drm);
>>  +	drm_atomic_helper_shutdown(drm);
>>   }
>>=20
>>   static const struct component_master_ops ingenic_master_ops =3D {
>>  --
>>  2.32.0


