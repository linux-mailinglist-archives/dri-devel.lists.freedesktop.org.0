Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 784066210D4
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 13:33:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EA8410E41A;
	Tue,  8 Nov 2022 12:33:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5871310E41A
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 12:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1667910825; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RiuMl0wIYLemKsntWqF37IR2ppjmdHzm41vMMbwpFfk=;
 b=df+IgAAZ34PlYhbpVWvHT6l//QSqi7ZtbTzPVCLFwbui3OgMRPOoqa85q9EqzC8PKE1tb6
 Mu9pZrkDjkC0Rz1kHlusPruJbzvtaU3bikB3EDOtX6RGLtQ9kD6owuyKbWIk0NrRYB1YGr
 ajTMu6SzuNirp+66lwZjpDB5RFccWHw=
Date: Tue, 08 Nov 2022 12:33:34 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 01/26] drm: modeset-helper: Export dev_pm_ops for simple
 drivers
To: Thomas Zimmermann <tzimmermann@suse.de>
Message-Id: <Y741LR.3LC5VO42RZFD3@crapouillou.net>
In-Reply-To: <39a93eaa-8942-d630-243a-f6e34a16718d@suse.de>
References: <20221107175106.360578-1-paul@crapouillou.net>
 <20221107175106.360578-2-paul@crapouillou.net>
 <39a93eaa-8942-d630-243a-f6e34a16718d@suse.de>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

Le mar. 8 nov. 2022 =E0 13:10:49 +0100, Thomas Zimmermann=20
<tzimmermann@suse.de> a =E9crit :
> Hi Paul,
>=20
> thanks for cleaning up. Please see my comments below.
>=20
> Am 07.11.22 um 18:50 schrieb Paul Cercueil:
>> Export a dev_pm_ops meant to be used with simple drivers, which have
>> their struct drm_device registered as their struct device's drvdata,=20
>> and
>> only call drm_mode_config_pm_{suspend,resume}.
>>=20
>> The symbol is conditionally exported if IS_ENABLED(CONFIG_PM_SLEEP),=20
>> and
>> therefore it should always be referenced using the pm_sleep_ptr()=20
>> macro.
>>=20
>> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>> ---
>>   drivers/gpu/drm/drm_modeset_helper.c | 32=20
>> ++++++++++++++++++++++++++++
>>   include/drm/drm_modeset_helper.h     |  4 ++++
>>   2 files changed, 36 insertions(+)
>>=20
>> diff --git a/drivers/gpu/drm/drm_modeset_helper.c=20
>> b/drivers/gpu/drm/drm_modeset_helper.c
>> index f858dfedf2cf..0bc9f9228a60 100644
>> --- a/drivers/gpu/drm/drm_modeset_helper.c
>> +++ b/drivers/gpu/drm/drm_modeset_helper.c
>> @@ -20,6 +20,9 @@
>>    * OF THIS SOFTWARE.
>>    */
>>=20
>> +#include <linux/device.h>
>> +#include <linux/pm.h>
>> +
>>   #include <drm/drm_atomic_helper.h>
>>   #include <drm/drm_fb_helper.h>
>>   #include <drm/drm_fourcc.h>
>> @@ -244,3 +247,32 @@ int drm_mode_config_helper_resume(struct=20
>> drm_device *dev)
>>   	return ret;
>>   }
>>   EXPORT_SYMBOL(drm_mode_config_helper_resume);
>> +
>> +static int drm_mode_config_pm_suspend(struct device *dev)
>> +{
>> +	struct drm_device *drm =3D dev_get_drvdata(dev);
>> +
>> +	return drm_mode_config_helper_suspend(drm);
>> +}
>> +
>> +static int drm_mode_config_pm_resume(struct device *dev)
>> +{
>> +	struct drm_device *drm =3D dev_get_drvdata(dev);
>> +
>> +	return drm_mode_config_helper_resume(drm);
>> +}
>> +
>> +/**
>> + * drm_mode_config_pm_ops - Exported dev_pm_ops helper for simple=20
>> drivers
>> + *
>> + * This dev_pm_ops can be used for simple drivers that would=20
>> otherwise only call
>> + * drm_mode_config_helper_suspend / drm_mode_config_helper_resume=20
>> in their PM
>> + * callbacks. It is only valid if the driver's drm_device has been=20
>> registered as
>> + * the struct device's drvdata.
>> + *
>> + * The exported symbol must always be used with the pm_sleep_ptr()=20
>> macro, like
>> + * this:
>> + * .pm =3D pm_sleep_ptr(&drm_mode_config_pm_ops),
>> + */
>> +EXPORT_SIMPLE_DEV_PM_OPS(drm_mode_config_pm_ops,
>> +			 drm_mode_config_pm_suspend, drm_mode_config_pm_resume);
>> diff --git a/include/drm/drm_modeset_helper.h=20
>> b/include/drm/drm_modeset_helper.h
>> index 995fd981cab0..85f29637e9c1 100644
>> --- a/include/drm/drm_modeset_helper.h
>> +++ b/include/drm/drm_modeset_helper.h
>> @@ -23,6 +23,8 @@
>>   #ifndef __DRM_KMS_HELPER_H__
>>   #define __DRM_KMS_HELPER_H__
>=20
> I like that you clean up the driver, but not how it's done TBH.
>=20
>>=20
>> +#include <linux/pm.h>
>> +
>=20
> Half of DRM somehow incudes drm_kms_helper.h. So this include=20
> statements
> affects more or less everything.
>=20
>>   struct drm_crtc;
>>   struct drm_crtc_funcs;
>>   struct drm_device;
>> @@ -41,4 +43,6 @@ int drm_crtc_init(struct drm_device *dev, struct=20
>> drm_crtc *crtc,
>>   int drm_mode_config_helper_suspend(struct drm_device *dev);
>>   int drm_mode_config_helper_resume(struct drm_device *dev);
>>=20
>> +extern const struct dev_pm_ops drm_mode_config_pm_ops;
>> +
>=20
> That's maybe subjective, but I don't like exporting such _funcs and=20
> _ops
> instances. They are like blackboxes.  And they pollute the symbol
> namespace unnecessarily.
>=20
> I propose a solution similar to DEFINE_DRM_GEM_FOPS [1] or
> drm_module_pci_driver. [2]
>=20
> Define a macro in the header to create the _ops instance, such as
>=20
> #if defined(CONFIG_PM)
> #define DEFINE_DRM_MODE_CONFIG_HELPER_PM_OPS(_name)  \
>   static __ ## _name ## _suspend() {  \
>     call drm_mode_config_helper_suspend()  \
>   } \
>   static __ ## _name ## _resume() {  \
>     call drm_mode_config_helper_resume()  \
>   }  \
>   static SIMPLE_DEV_PM_OPS(_name, __ ## _name ## _suspend, __ ## _name
> ## _resume);
> #else
> #define DEFINE_DRM_MODE_CONFIG_HELPER_PM_OPS(_name)
> #endif
>=20
> Drivers can then keep the instance and the include for pm.h internal
> within their _drv.c file. The small callback functions are within the
> source file as well.  If CONFIG_PM has been disabled, nothing is being
> generated.

Another alternative would be to make the exported=20
"drm_mode_config_pm_ops" a pointer. Then it can be opaque and you=20
wouldn't need the <linux/pm.h> include in the header.

Your solution works too, I guess. I find it inelegant, but I won't=20
fight you hard on this.

Cheers,
-Paul

>=20
> Best regards
> Thomas
>=20
> [1]
> https://elixir.bootlin.com/linux/v6.1-rc4/source/include/drm/drm_gem.h#L3=
96
> [2]
> https://elixir.bootlin.com/linux/v6.1-rc4/source/include/drm/drm_module.h=
#L58
>=20
>=20
>>   #endif
>=20
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=FCrnberg, Germany
> (HRB 36809, AG N=FCrnberg)
> Gesch=E4ftsf=FChrer: Ivo Totev


