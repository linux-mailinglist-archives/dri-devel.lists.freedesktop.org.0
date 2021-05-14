Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C084A380849
	for <lists+dri-devel@lfdr.de>; Fri, 14 May 2021 13:16:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A86766EE50;
	Fri, 14 May 2021 11:16:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F2AD6EE50
 for <dri-devel@lists.freedesktop.org>; Fri, 14 May 2021 11:16:49 +0000 (UTC)
IronPort-SDR: tm+RjTL4D0gr4Y3QHEkwcf33iEQpNiotGA1wIOFc4RNELnOe28PiEoc7mRlb4MeWPDfom1cjOe
 /+8SbSMUabdA==
X-IronPort-AV: E=McAfee;i="6200,9189,9983"; a="187571217"
X-IronPort-AV: E=Sophos;i="5.82,299,1613462400"; d="scan'208";a="187571217"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2021 04:16:47 -0700
IronPort-SDR: 3B9oYuAxq54p4R1uSTn+M7QFk1rwcY+BCptYtxgSQbxc/EYlwj3kZdJf+35VQ2yU76ENAa+k4n
 q/SSyW8AGxkw==
X-IronPort-AV: E=Sophos;i="5.82,299,1613462400"; d="scan'208";a="626929096"
Received: from abacha1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.34.141])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2021 04:16:40 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Lyude Paul <lyude@redhat.com>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 David Airlie <airlied@redhat.com>, Ville Syrjala <ville.syrjala@intel.com>
Subject: Re: [PATCH v6 2/5] drm/dp: Allow an early call to register DDC i2c bus
In-Reply-To: <22632aba5bc118f5e96e155f240445b1547733c7.camel@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210503215844.2996320-1-dianders@chromium.org>
 <20210503145750.v6.2.Iff8f2957d86af40f2bfcfb5a7163928481fccea4@changeid>
 <8eedeb02dc56ecaed5d2f3cb8d929a3675b2c3da.camel@redhat.com>
 <20210507220036.GI2484@yoga>
 <22632aba5bc118f5e96e155f240445b1547733c7.camel@redhat.com>
Date: Fri, 14 May 2021 14:16:37 +0300
Message-ID: <871ra9tvje.fsf@intel.com>
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
Cc: robdclark@chromium.org, Wolfram Sang <wsa@kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Douglas Anderson <dianders@chromium.org>,
 Ville Syrjala <ville.syrjala@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Thierry Reding <treding@nvidia.com>,
 Sam Ravnborg <sam@ravnborg.org>, Steev Klimaszewski <steev@kali.org>,
 linux-i2c@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 07 May 2021, Lyude Paul <lyude@redhat.com> wrote:
> On Fri, 2021-05-07 at 17:00 -0500, Bjorn Andersson wrote:
>> On Fri 07 May 16:18 CDT 2021, Lyude Paul wrote:
>>=20
>> > Adding ville from Intel to also get their take on this.
>> >=20
>> > In general we've been trying to move DRM to a design where we don't ex=
pose
>> > any
>> > devices until everything is ready. That's pretty much the main reason =
that
>> > we
>> > register things during bridge attach time. Note though that even before
>> > the
>> > DDC bus is registered it should still be usable, just things like
>> > get_device()
>> > won't work.
>> >=20
>> > This isn't the first time we've run into a problem like the one you're
>> > trying
>> > to solve though, Tegra currently has a similar issue. Something we
>> > discussed
>> > as a possible long-term solution for this was splitting i2c_add_adapte=
r()
>> > into
>> > a minimal initialization function and a registration function. Linux's
>> > device
>> > core already allows for this (device_initialize() and device_add(), wh=
ich
>> > are
>> > called together when device_register() is called). Would this be a
>> > solution
>> > that might work for you (and even better, would you possibly be willin=
g to
>> > write the patches? :)
>> >=20
>>=20
>> It's not enough that the adapter is half-baked, because the bridge's
>> initialization depends on that the panel device is done probing, and the
>> panel driver will only complete its probe if it can find it's resources.
>>=20
>> So we need a mechanism to fully create the resources exposed by the
>> bridge chip (i2c bus, gpio chip and (soon) a pwm chip), then allow the
>> panel to probe and after that initialize the bridge.
>>=20
>> We did discuss possible ways to register these resources and then
>> "sleep for a while" before resolving the panel, but what we came up with
>> was definitely suboptimal - and ugly.
>
> Sigh, I'm really starting to wonder if we should reconsider the rules on
> exposing ddc adapters early...
>
> Danvet, Jani, and/or airlied: can I get your take on this?

Granted, I did not study this in detail, but it sounds like we'd need to
be able to add and use an i2c adapter in kernel, before deciding to
register it with the userspace. But that does not seem to be as trivial
as making it possible to call the now-static i2c_register_adapter()
separately.


BR,
Jani.


>
>>=20
>> Regards,
>> Bjorn
>>=20
>> > On Mon, 2021-05-03 at 14:58 -0700, Douglas Anderson wrote:
>> > > It can be helpful to fully register the AUX channel as an i2c bus ev=
en
>> > > before the bridge is created. Let's optionally allow bridges to do
>> > > that.
>> > >=20
>> > > Specifically the case we're running into:
>> > > - The panel driver wants to get its DDC bus at probe time.
>> > > - The ti-sn65dsi86 MIPI-to-eDP bridge code, which provides the DDC
>> > > =C2=A0 bus, wants to get the panel at probe time.
>> > >=20
>> > > The next patches ("drm/bridge: ti-sn65dsi86: Promote the AUX channel
>> > > to its own sub-dev") solves the chicken-and-egg problem by breaking
>> > > the ti-sn65dsi86 driver into sub-devices, but in order for it to
>> > > actually work we need the i2c bus to get registered at probe time and
>> > > not in bridge attach time.
>> > >=20
>> > > Cc: Lyude Paul <lyude@redhat.com>
>> > > Cc: Thierry Reding <treding@nvidia.com>
>> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
>> > > ---
>> > >=20
>> > > Changes in v6:
>> > > - ("drm/dp: Allow an early call to register DDC i2c bus") new for v6.
>> > >=20
>> > > =C2=A0drivers/gpu/drm/drm_dp_helper.c | 67 +++++++++++++++++++++++++=
++------
>> > > =C2=A0include/drm/drm_dp_helper.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +
>> > > =C2=A02 files changed, 57 insertions(+), 12 deletions(-)
>> > >=20
>> > > diff --git a/drivers/gpu/drm/drm_dp_helper.c
>> > > b/drivers/gpu/drm/drm_dp_helper.c
>> > > index cb56d74e9d38..830294f0b341 100644
>> > > --- a/drivers/gpu/drm/drm_dp_helper.c
>> > > +++ b/drivers/gpu/drm/drm_dp_helper.c
>> > > @@ -1757,6 +1757,49 @@ void drm_dp_aux_init(struct drm_dp_aux *aux)
>> > > =C2=A0}
>> > > =C2=A0EXPORT_SYMBOL(drm_dp_aux_init);
>> > > =C2=A0
>> > > +/**
>> > > + * drm_dp_aux_register_ddc() - register the DDC parts of the aux
>> > > channel
>> > > + * @aux: DisplayPort AUX channel
>> > > + *
>> > > + * This can be called after drm_dp_aux_init() to fully register the=
 ddc
>> > > bus
>> > > + * as an i2c adapter with the rest of Linux.
>> > > + *
>> > > + * If you don't explicitly call this function it will be done
>> > > implicitly as
>> > > + * part of drm_dp_aux_register().
>> > > + *
>> > > + * Returns 0 on success or a negative error code on failure.
>> > > + */
>> > > +int drm_dp_aux_register_ddc(struct drm_dp_aux *aux)
>> > > +{
>> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0WARN_ON_ONCE(!aux->dev);
>> > > +
>> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0aux->ddc.class =3D I2C_CL=
ASS_DDC;
>> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0aux->ddc.owner =3D THIS_M=
ODULE;
>> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0aux->ddc.dev.parent =3D a=
ux->dev;
>> > > +
>> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0strlcpy(aux->ddc.name, au=
x->name ? aux->name : dev_name(aux-
>> > > >dev),
>> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0sizeof(aux->ddc.name));
>> > > +
>> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return i2c_add_adapter(&a=
ux->ddc);
>> > > +}
>> > > +EXPORT_SYMBOL(drm_dp_aux_register_ddc);
>> > > +
>> > > +/**
>> > > + * drm_dp_aux_unregister_ddc() - unregister the DDC parts of the aux
>> > > channel
>> > > + *
>> > > + * This is useful if you called drm_dp_aux_register_ddc(). If you l=
et
>> > > + * drm_dp_aux_register() implicitly register the DDC for you then y=
ou
>> > > don't
>> > > + * need to worry about calling this yourself.
>> > > + *
>> > > + * @aux: DisplayPort AUX channel
>> > > + */
>> > > +void drm_dp_aux_unregister_ddc(struct drm_dp_aux *aux)
>> > > +{
>> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0i2c_del_adapter(&aux->ddc=
);
>> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0aux->ddc.dev.parent =3D N=
ULL;
>> > > +}
>> > > +EXPORT_SYMBOL(drm_dp_aux_unregister_ddc);
>> > > +
>> > > =C2=A0/**
>> > > =C2=A0 * drm_dp_aux_register() - initialise and register aux channel
>> > > =C2=A0 * @aux: DisplayPort AUX channel
>> > > @@ -1793,20 +1836,19 @@ int drm_dp_aux_register(struct drm_dp_aux *a=
ux)
>> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!aux->ddc.algo)
>> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drm_dp_aux_init(aux);
>> > > =C2=A0
>> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0aux->ddc.class =3D I2C_CL=
ASS_DDC;
>> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0aux->ddc.owner =3D THIS_M=
ODULE;
>> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0aux->ddc.dev.parent =3D a=
ux->dev;
>> > > -
>> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0strlcpy(aux->ddc.name, au=
x->name ? aux->name : dev_name(aux-
>> > > >dev),
>> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0sizeof(aux->ddc.name));
>> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/*
>> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Implicitly register if=
 drm_dp_aux_register_ddc() wasn't
>> > > already
>> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * called (as evidenced b=
y a NULL parent pointer).
>> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!aux->ddc.dev.parent)=
 {
>> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0ret =3D drm_dp_aux_register_ddc(aux);
>> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0if (ret)
>> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ret=
urn ret;
>> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
>> > > =C2=A0
>> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ret =3D drm_dp_aux_r=
egister_devnode(aux);
>> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (ret)
>> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0return ret;
>> > > -
>> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ret =3D i2c_add_adapter(&=
aux->ddc);
>> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (ret) {
>> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0drm_dp_aux_unregister_devnode(aux);
>> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0drm_dp_aux_unregister_ddc(aux);
>> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return ret;
>> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
>> > > =C2=A0
>> > > @@ -1821,7 +1863,8 @@ EXPORT_SYMBOL(drm_dp_aux_register);
>> > > =C2=A0void drm_dp_aux_unregister(struct drm_dp_aux *aux)
>> > > =C2=A0{
>> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drm_dp_aux_unregiste=
r_devnode(aux);
>> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0i2c_del_adapter(&aux->ddc=
);
>> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (aux->ddc.dev.parent)
>> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0drm_dp_aux_unregister_ddc(aux);
>> > > =C2=A0}
>> > > =C2=A0EXPORT_SYMBOL(drm_dp_aux_unregister);
>> > > =C2=A0
>> > > diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper=
.h
>> > > index e932b2c40095..d4d2d5e25bb7 100644
>> > > --- a/include/drm/drm_dp_helper.h
>> > > +++ b/include/drm/drm_dp_helper.h
>> > > @@ -2021,6 +2021,8 @@ bool
>> > > drm_dp_lttpr_pre_emphasis_level_3_supported(const
>> > > u8 caps[DP_LTTPR_PHY_CAP_
>> > > =C2=A0
>> > > =C2=A0void drm_dp_remote_aux_init(struct drm_dp_aux *aux);
>> > > =C2=A0void drm_dp_aux_init(struct drm_dp_aux *aux);
>> > > +int drm_dp_aux_register_ddc(struct drm_dp_aux *aux);
>> > > +void drm_dp_aux_unregister_ddc(struct drm_dp_aux *aux);
>> > > =C2=A0int drm_dp_aux_register(struct drm_dp_aux *aux);
>> > > =C2=A0void drm_dp_aux_unregister(struct drm_dp_aux *aux);
>> > > =C2=A0
>> >=20
>> > --=20
>> > Cheers,
>> > =C2=A0Lyude Paul (she/her)
>> > =C2=A0Software Engineer at Red Hat
>> >=20
>>=20

--=20
Jani Nikula, Intel Open Source Graphics Center
