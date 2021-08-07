Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 044B03E36D0
	for <lists+dri-devel@lfdr.de>; Sat,  7 Aug 2021 20:40:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0F7889CA8;
	Sat,  7 Aug 2021 18:40:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E38A89C49;
 Sat,  7 Aug 2021 18:40:42 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7DD3E22163;
 Sat,  7 Aug 2021 18:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1628361640; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z9k+480c114dUaRAgAUgeeoUlyvszQlBnNx2bBbYuVM=;
 b=ykEsFZWyqDR9rnZJC8ClUqGi/4VcTAPuqJ/e96Nqjq2a6wN6TVuaXt+QUWY9NHXWEPlPpb
 snZC+WOvITZz2kz40jKSPGt55IxTtL3q96T8MbM3Kj1E7u4tD8Xw5Al4b2EHchaJqdJvm4
 0+lfKiB1tpeKGYUqDXft3Xfl1wg51EQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1628361640;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z9k+480c114dUaRAgAUgeeoUlyvszQlBnNx2bBbYuVM=;
 b=8Se6fRxrldUaL3mrpsv8p6aYbcPXG9qSZMT39B8vVwvUwAZc92s9OY9eR5wYrxhFZNrtpt
 A9bEMaP8Q2swO9Bw==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id AF10713A64;
 Sat,  7 Aug 2021 18:40:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id iS/yKKfTDmFgFAAAGKfGzw
 (envelope-from <tzimmermann@suse.de>); Sat, 07 Aug 2021 18:40:39 +0000
Subject: Re: [PATCH v2 07/14] drm/msm: Convert to Linux IRQ interfaces
To: Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Alexander Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Brian Starkey <brian.starkey@arm.com>,
 Sam Ravnborg <sam@ravnborg.org>, Boris Brezillon <bbrezillon@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Stefan Agner <stefan@agner.ch>,
 alison.wang@nxp.com, Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 anitha.chrisanthus@intel.com, edmund.j.dea@intel.com,
 Sean Paul <sean@poorly.run>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sascha Hauer <kernel@pengutronix.de>,
 jyri.sarha@iki.fi, tomba@kernel.org, Dan.Sneddon@microchip.com,
 tomi.valkeinen@ideasonboard.com, amd-gfx list
 <amd-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>
References: <20210803090704.32152-1-tzimmermann@suse.de>
 <20210803090704.32152-8-tzimmermann@suse.de>
 <1f5f285a-b923-16ff-2ca1-6f92e22ffcab@linaro.org>
 <CAF6AEGu-Vj_3ex1Auae_SQvFkwgaXVokqhL_nsFzXOKP0p06SQ@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <9c6471b2-cd6b-d5b9-0c93-1f3e498233ee@suse.de>
Date: Sat, 7 Aug 2021 20:40:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAF6AEGu-Vj_3ex1Auae_SQvFkwgaXVokqhL_nsFzXOKP0p06SQ@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="oTZ8XjA78Q60FwLhG4KW3tt2F76JSG34R"
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

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--oTZ8XjA78Q60FwLhG4KW3tt2F76JSG34R
Content-Type: multipart/mixed; boundary="n74XQmmIP5SUR12YsoSr17imnH92wpwvw";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Alexander Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Brian Starkey <brian.starkey@arm.com>,
 Sam Ravnborg <sam@ravnborg.org>, Boris Brezillon <bbrezillon@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Stefan Agner <stefan@agner.ch>,
 alison.wang@nxp.com, Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 anitha.chrisanthus@intel.com, edmund.j.dea@intel.com,
 Sean Paul <sean@poorly.run>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sascha Hauer <kernel@pengutronix.de>,
 jyri.sarha@iki.fi, tomba@kernel.org, Dan.Sneddon@microchip.com,
 tomi.valkeinen@ideasonboard.com, amd-gfx list
 <amd-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>
Message-ID: <9c6471b2-cd6b-d5b9-0c93-1f3e498233ee@suse.de>
Subject: Re: [PATCH v2 07/14] drm/msm: Convert to Linux IRQ interfaces
References: <20210803090704.32152-1-tzimmermann@suse.de>
 <20210803090704.32152-8-tzimmermann@suse.de>
 <1f5f285a-b923-16ff-2ca1-6f92e22ffcab@linaro.org>
 <CAF6AEGu-Vj_3ex1Auae_SQvFkwgaXVokqhL_nsFzXOKP0p06SQ@mail.gmail.com>
In-Reply-To: <CAF6AEGu-Vj_3ex1Auae_SQvFkwgaXVokqhL_nsFzXOKP0p06SQ@mail.gmail.com>

--n74XQmmIP5SUR12YsoSr17imnH92wpwvw
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 07.08.21 um 19:08 schrieb Rob Clark:
> On Tue, Aug 3, 2021 at 2:37 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>>
>> On 03/08/2021 12:06, Thomas Zimmermann wrote:
>>> Drop the DRM IRQ midlayer in favor of Linux IRQ interfaces. DRM's
>>> IRQ helpers are mostly useful for UMS drivers. Modern KMS drivers
>>> don't benefit from using it.
>>>
>>> DRM IRQ callbacks are now being called directly or inlined.
>>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>
>> Rob should probably also give his blessing on this patch though.
>>
>=20
> I've pushed this to msm-next-staging, but if Thomas would prefer to
> merge the series together then I can drop it (in which case a-b for
> this patch)

Yes, please. I'd prefer to merge the whole patchset at once through=20
drm-misc-next.

Best regards
Thomas

>=20
> BR,
> -R
>=20
>>> ---
>>>    drivers/gpu/drm/msm/msm_drv.c | 113 ++++++++++++++++++++----------=
----
>>>    drivers/gpu/drm/msm/msm_kms.h |   2 +-
>>>    2 files changed, 69 insertions(+), 46 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_=
drv.c
>>> index 1594ae39d54f..a332b09a5a11 100644
>>> --- a/drivers/gpu/drm/msm/msm_drv.c
>>> +++ b/drivers/gpu/drm/msm/msm_drv.c
>>> @@ -14,7 +14,6 @@
>>>    #include <drm/drm_drv.h>
>>>    #include <drm/drm_file.h>
>>>    #include <drm/drm_ioctl.h>
>>> -#include <drm/drm_irq.h>
>>>    #include <drm/drm_prime.h>
>>>    #include <drm/drm_of.h>
>>>    #include <drm/drm_vblank.h>
>>> @@ -201,6 +200,71 @@ void msm_rmw(void __iomem *addr, u32 mask, u32 o=
r)
>>>        msm_writel(val | or, addr);
>>>    }
>>>
>>> +static irqreturn_t msm_irq(int irq, void *arg)
>>> +{
>>> +     struct drm_device *dev =3D arg;
>>> +     struct msm_drm_private *priv =3D dev->dev_private;
>>> +     struct msm_kms *kms =3D priv->kms;
>>> +
>>> +     BUG_ON(!kms);
>>> +
>>> +     return kms->funcs->irq(kms);
>>> +}
>>> +
>>> +static void msm_irq_preinstall(struct drm_device *dev)
>>> +{
>>> +     struct msm_drm_private *priv =3D dev->dev_private;
>>> +     struct msm_kms *kms =3D priv->kms;
>>> +
>>> +     BUG_ON(!kms);
>>> +
>>> +     kms->funcs->irq_preinstall(kms);
>>> +}
>>> +
>>> +static int msm_irq_postinstall(struct drm_device *dev)
>>> +{
>>> +     struct msm_drm_private *priv =3D dev->dev_private;
>>> +     struct msm_kms *kms =3D priv->kms;
>>> +
>>> +     BUG_ON(!kms);
>>> +
>>> +     if (kms->funcs->irq_postinstall)
>>> +             return kms->funcs->irq_postinstall(kms);
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static int msm_irq_install(struct drm_device *dev, unsigned int irq)=

>>> +{
>>> +     int ret;
>>> +
>>> +     if (irq =3D=3D IRQ_NOTCONNECTED)
>>> +             return -ENOTCONN;
>>> +
>>> +     msm_irq_preinstall(dev);
>>> +
>>> +     ret =3D request_irq(irq, msm_irq, 0, dev->driver->name, dev);
>>> +     if (ret)
>>> +             return ret;
>>> +
>>> +     ret =3D msm_irq_postinstall(dev);
>>> +     if (ret) {
>>> +             free_irq(irq, dev);
>>> +             return ret;
>>> +     }
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static void msm_irq_uninstall(struct drm_device *dev)
>>> +{
>>> +     struct msm_drm_private *priv =3D dev->dev_private;
>>> +     struct msm_kms *kms =3D priv->kms;
>>> +
>>> +     kms->funcs->irq_uninstall(kms);
>>> +     free_irq(kms->irq, dev);
>>> +}
>>> +
>>>    struct msm_vblank_work {
>>>        struct work_struct work;
>>>        int crtc_id;
>>> @@ -265,7 +329,7 @@ static int msm_drm_uninit(struct device *dev)
>>>        }
>>>
>>>        /* We must cancel and cleanup any pending vblank enable/disabl=
e
>>> -      * work before drm_irq_uninstall() to avoid work re-enabling an=

>>> +      * work before msm_irq_uninstall() to avoid work re-enabling an=

>>>         * irq after uninstall has disabled it.
>>>         */
>>>
>>> @@ -294,7 +358,7 @@ static int msm_drm_uninit(struct device *dev)
>>>        drm_mode_config_cleanup(ddev);
>>>
>>>        pm_runtime_get_sync(dev);
>>> -     drm_irq_uninstall(ddev);
>>> +     msm_irq_uninstall(ddev);
>>>        pm_runtime_put_sync(dev);
>>>
>>>        if (kms && kms->funcs)
>>> @@ -553,7 +617,7 @@ static int msm_drm_init(struct device *dev, const=
 struct drm_driver *drv)
>>>
>>>        if (kms) {
>>>                pm_runtime_get_sync(dev);
>>> -             ret =3D drm_irq_install(ddev, kms->irq);
>>> +             ret =3D msm_irq_install(ddev, kms->irq);
>>>                pm_runtime_put_sync(dev);
>>>                if (ret < 0) {
>>>                        DRM_DEV_ERROR(dev, "failed to install IRQ hand=
ler\n");
>>> @@ -662,43 +726,6 @@ static void msm_postclose(struct drm_device *dev=
, struct drm_file *file)
>>>        context_close(ctx);
>>>    }
>>>
>>> -static irqreturn_t msm_irq(int irq, void *arg)
>>> -{
>>> -     struct drm_device *dev =3D arg;
>>> -     struct msm_drm_private *priv =3D dev->dev_private;
>>> -     struct msm_kms *kms =3D priv->kms;
>>> -     BUG_ON(!kms);
>>> -     return kms->funcs->irq(kms);
>>> -}
>>> -
>>> -static void msm_irq_preinstall(struct drm_device *dev)
>>> -{
>>> -     struct msm_drm_private *priv =3D dev->dev_private;
>>> -     struct msm_kms *kms =3D priv->kms;
>>> -     BUG_ON(!kms);
>>> -     kms->funcs->irq_preinstall(kms);
>>> -}
>>> -
>>> -static int msm_irq_postinstall(struct drm_device *dev)
>>> -{
>>> -     struct msm_drm_private *priv =3D dev->dev_private;
>>> -     struct msm_kms *kms =3D priv->kms;
>>> -     BUG_ON(!kms);
>>> -
>>> -     if (kms->funcs->irq_postinstall)
>>> -             return kms->funcs->irq_postinstall(kms);
>>> -
>>> -     return 0;
>>> -}
>>> -
>>> -static void msm_irq_uninstall(struct drm_device *dev)
>>> -{
>>> -     struct msm_drm_private *priv =3D dev->dev_private;
>>> -     struct msm_kms *kms =3D priv->kms;
>>> -     BUG_ON(!kms);
>>> -     kms->funcs->irq_uninstall(kms);
>>> -}
>>> -
>>>    int msm_crtc_enable_vblank(struct drm_crtc *crtc)
>>>    {
>>>        struct drm_device *dev =3D crtc->dev;
>>> @@ -1051,10 +1078,6 @@ static const struct drm_driver msm_driver =3D =
{
>>>        .open               =3D msm_open,
>>>        .postclose           =3D msm_postclose,
>>>        .lastclose          =3D drm_fb_helper_lastclose,
>>> -     .irq_handler        =3D msm_irq,
>>> -     .irq_preinstall     =3D msm_irq_preinstall,
>>> -     .irq_postinstall    =3D msm_irq_postinstall,
>>> -     .irq_uninstall      =3D msm_irq_uninstall,
>>>        .dumb_create        =3D msm_gem_dumb_create,
>>>        .dumb_map_offset    =3D msm_gem_dumb_map_offset,
>>>        .prime_handle_to_fd =3D drm_gem_prime_handle_to_fd,
>>> diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_=
kms.h
>>> index 086a2d59b8c8..9de7c42e1071 100644
>>> --- a/drivers/gpu/drm/msm/msm_kms.h
>>> +++ b/drivers/gpu/drm/msm/msm_kms.h
>>> @@ -150,7 +150,7 @@ struct msm_kms {
>>>        const struct msm_kms_funcs *funcs;
>>>        struct drm_device *dev;
>>>
>>> -     /* irq number to be passed on to drm_irq_install */
>>> +     /* irq number to be passed on to msm_irq_install */
>>>        int irq;
>>>
>>>        /* mapper-id used to request GEM buffer mapped for scanout: */=

>>>
>>
>>
>> --
>> With best wishes
>> Dmitry

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--n74XQmmIP5SUR12YsoSr17imnH92wpwvw--

--oTZ8XjA78Q60FwLhG4KW3tt2F76JSG34R
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmEO06cFAwAAAAAACgkQlh/E3EQov+A1
6g//W5N4JGbWfrGY72DYK0fCWfDMhL84OIHalyu6tWezCFU849krdZJsmCRmmOe31So4K62BHbqv
A+PDKazDzKqWRVBIVW7As7unNK3qsHhP+BbCy+wNs+aP9+v2mkWClJKUdBIdHrhqlXPX9ePRiVlJ
IooWGUii968gI1lGSmUP9PqqtvXnL29xL8OOZuDg9xbbyw0PfyFmcEmQcy4UipuvO7I7o+xHHA4y
38gqOsH7AUVYKKg7NjahmppwY4XPLfYITv5Xy6T6if1S7x21BGCaRFAQHKlVQ0JzLowZNTGIBuNH
j270h+3I2ATfVAh+TJDn8nKbG0JB0cdmQ9uayXloxiedk9njohOuUDSJ3ZhMWHsywYZUWJ3L3iao
JbzT6rJAwckBgWOf/qlDXdh0La0Od1K0AlEznJy4uN2m0comE8kwnyh229C6Rqo4gP2YDmm7pprl
WOEN15n6G/4rtnbnTvr/NgR8sVAkNTcLU2boOyjy+5ihycxG5LPnuU/UrE6uCbtpJBj8JywWjakL
mw9q3p+mAVlhY9A0WMF5eDpieZQgyN50x00K6yNJMFbIfK3fM43VIcCowVLx9uXyWzuyuMb2Z1Fg
KLZfaKigP4zRRdUPTyCmhpqXyLbQTHVTa8orF9mOdItRcf1sP13N1yv+cqYQgxzgI+pxTPWDUHSg
4Zc=
=kN6N
-----END PGP SIGNATURE-----

--oTZ8XjA78Q60FwLhG4KW3tt2F76JSG34R--
