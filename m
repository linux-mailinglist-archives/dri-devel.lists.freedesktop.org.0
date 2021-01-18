Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 159812FB448
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jan 2021 09:38:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFD9F6E857;
	Tue, 19 Jan 2021 08:38:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05CEA89A32
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jan 2021 11:38:05 +0000 (UTC)
Date: Mon, 18 Jan 2021 11:37:49 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 2/3] drm/ingenic: Register devm action to cleanup encoders
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Message-Id: <1BO4NQ.1RZAXLMVC01T@crapouillou.net>
In-Reply-To: <YAVYUzR9+ic5lEjE@pendragon.ideasonboard.com>
References: <20210117112646.98353-1-paul@crapouillou.net>
 <20210117112646.98353-3-paul@crapouillou.net>
 <YAVYUzR9+ic5lEjE@pendragon.ideasonboard.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 19 Jan 2021 08:37:25 +0000
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, od@zcrc.me, dri-devel@lists.freedesktop.org,
 Sam Ravnborg <sam@ravnborg.org>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

Le lun. 18 janv. 2021 =E0 11:43, Laurent Pinchart =

<laurent.pinchart@ideasonboard.com> a =E9crit :
> Hi Paul,
> =

> Thank you for the patch.
> =

> On Sun, Jan 17, 2021 at 11:26:45AM +0000, Paul Cercueil wrote:
>>  Since the encoders have been devm-allocated, they will be freed way
>>  before drm_mode_config_cleanup() is called. To avoid use-after-free
>>  conditions, we then must ensure that drm_encoder_cleanup() is called
>>  before the encoders are freed.
> =

> How about allocating the encoder with drmm_encoder_alloc() instead ?

That would work, but it is not yet in drm-misc-fixes :(

-Paul

>>  Fixes: c369cb27c267 ("drm/ingenic: Support multiple panels/bridges")
>>  Cc: <stable@vger.kernel.org> # 5.8+
>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>  ---
>>   drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>> =

>>  diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c =

>> b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>  index 368bfef8b340..d23a3292a0e0 100644
>>  --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>  +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>  @@ -803,6 +803,11 @@ static void __maybe_unused =

>> ingenic_drm_release_rmem(void *d)
>>   	of_reserved_mem_device_release(d);
>>   }
>> =

>>  +static void ingenic_drm_encoder_cleanup(void *encoder)
>>  +{
>>  +	drm_encoder_cleanup(encoder);
>>  +}
>>  +
>>   static int ingenic_drm_bind(struct device *dev, bool =

>> has_components)
>>   {
>>   	struct platform_device *pdev =3D to_platform_device(dev);
>>  @@ -1011,6 +1016,11 @@ static int ingenic_drm_bind(struct device =

>> *dev, bool has_components)
>>   			return ret;
>>   		}
>> =

>>  +		ret =3D devm_add_action_or_reset(dev, ingenic_drm_encoder_cleanup,
>>  +					       encoder);
>>  +		if (ret)
>>  +			return ret;
>>  +
>>   		ret =3D drm_bridge_attach(encoder, bridge, NULL, 0);
>>   		if (ret) {
>>   			dev_err(dev, "Unable to attach bridge\n");
> =

> --
> Regards,
> =

> Laurent Pinchart


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
