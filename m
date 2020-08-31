Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 513D925763C
	for <lists+dri-devel@lfdr.de>; Mon, 31 Aug 2020 11:12:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DEAA89C51;
	Mon, 31 Aug 2020 09:12:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A97FD899DC
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Aug 2020 00:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1598834865; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v2ssJ1yv5aon1LfrE8cgekSZHIbaEmOxzv3PnSPTv9E=;
 b=MxDynaNYRTsDJmhtwqSq/jecLtv6XeyiCCfeD64BaiOnch1VFXIUBL2cJt2v12XOd7o3FJ
 G6xkoeu919cPdRBwOhD/3cvYHfLHXLftWf29X32Ez4immtVJEQKSaBq1K7OFABRzHUWYo5
 LqEJVAEzqkVEHYeiPpPjyntSuwfuEXQ=
Date: Mon, 31 Aug 2020 02:47:34 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 2/2] drm/ingenic: Fix driver not probing when IPU port
 is missing
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Message-Id: <AVKWFQ.TNMR0WH83TFS2@crapouillou.net>
In-Reply-To: <CAAEAJfD9q-iB9iCgCBWdA0_77=T1zsk9DFh-qvVtLHWqEnOWbQ@mail.gmail.com>
References: <20200827114404.36748-1-paul@crapouillou.net>
 <20200827114404.36748-2-paul@crapouillou.net>
 <CAAEAJfD9q-iB9iCgCBWdA0_77=T1zsk9DFh-qvVtLHWqEnOWbQ@mail.gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 31 Aug 2020 09:12:28 +0000
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
Cc: David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, od@zcrc.me,
 Sam Ravnborg <sam@ravnborg.org>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Le dim. 30 ao=FBt 2020 =E0 21:21, Ezequiel Garcia =

<ezequiel@vanguardiasur.com.ar> a =E9crit :
> Hi Paul,
> =

> On Thu, 27 Aug 2020 at 09:04, Paul Cercueil <paul@crapouillou.net> =

> wrote:
>> =

>>  Even if support for the IPU was compiled in, we may run on a device
>>  (e.g. the Qi LB60) where the IPU is not available, or simply with =

>> an old
>>  devicetree without the IPU node. In that case the ingenic-drm =

>> refused to
>>  probe.
>> =

>>  Fix the driver so that it will probe even if the IPU node is not =

>> present
>>  in devicetree (but then IPU support is disabled of course).
>> =

>>  v2: Take a different approach
>> =

>>  Fixes: fc1acf317b01 ("drm/ingenic: Add support for the IPU")
>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>  ---
>>   drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 19 +++++++++++--------
>>   1 file changed, 11 insertions(+), 8 deletions(-)
>> =

>>  diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c =

>> b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>  index c1bcb93aed2d..b7074161ccf0 100644
>>  --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>  +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>  @@ -673,7 +673,7 @@ static void ingenic_drm_unbind_all(void *d)
>>          component_unbind_all(priv->dev, &priv->drm);
>>   }
>> =

>>  -static int ingenic_drm_bind(struct device *dev)
>>  +static int ingenic_drm_bind(struct device *dev, bool =

>> has_components)
>>   {
>>          struct platform_device *pdev =3D to_platform_device(dev);
>>          const struct jz_soc_info *soc_info;
>>  @@ -808,7 +808,7 @@ static int ingenic_drm_bind(struct device *dev)
>>                          return ret;
>>                  }
>> =

>>  -               if (IS_ENABLED(CONFIG_DRM_INGENIC_IPU)) {
>>  +               if (IS_ENABLED(CONFIG_DRM_INGENIC_IPU) && =

>> has_components) {
>>                          ret =3D component_bind_all(dev, drm);
>>                          if (ret) {
>>                                  if (ret !=3D -EPROBE_DEFER)
>>  @@ -939,6 +939,11 @@ static int ingenic_drm_bind(struct device *dev)
>>          return ret;
>>   }
>> =

>>  +static int ingenic_drm_bind_with_components(struct device *dev)
>>  +{
>>  +       return ingenic_drm_bind(dev, true);
>>  +}
>>  +
>>   static int compare_of(struct device *dev, void *data)
>>   {
>>          return dev->of_node =3D=3D data;
>>  @@ -957,7 +962,7 @@ static void ingenic_drm_unbind(struct device =

>> *dev)
>>   }
>> =

>>   static const struct component_master_ops ingenic_master_ops =3D {
>>  -       .bind =3D ingenic_drm_bind,
>>  +       .bind =3D ingenic_drm_bind_with_components,
>>          .unbind =3D ingenic_drm_unbind,
>>   };
>> =

>>  @@ -968,14 +973,12 @@ static int ingenic_drm_probe(struct =

>> platform_device *pdev)
>>          struct device_node *np;
>> =

>>          if (!IS_ENABLED(CONFIG_DRM_INGENIC_IPU))
>>  -               return ingenic_drm_bind(dev);
>>  +               return ingenic_drm_bind(dev, false);
>> =

>>          /* IPU is at port address 8 */
>>          np =3D of_graph_get_remote_node(dev->of_node, 8, 0);
> =

> How about we get rid of this (seems a bit odd to rely on port =

> address) ?
> Rockchip-drm driver has a nice approach, and I think we might need
> something like that going forward, to support dw-hdmi.

The rockchip-drm approach works because all the sub-drivers must probe. =

In the case of ingenic-drm, even if the ingenic-drm driver was compiled =

with the ipu and dw-hdmi sub-drivers, you can't rely on these probing, =

as they are not present on e.g. the JZ4740.

Cheers,
-Paul


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
