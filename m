Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27EC0B517B6
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 15:15:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABDFA10E106;
	Wed, 10 Sep 2025 13:15:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=crapouillou.net header.i=@crapouillou.net header.b="1KIPccLu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [185.119.170.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B5B710E106
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 13:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1757510097;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=z9+3n1dAJecvjrvWL9D12fOLN+UlVOGCwHMCorB07go=;
 b=1KIPccLu81BpazDRk5PNQt+8IkU4E6h132Q/TCEzUKfiewiCYSkCNoCfU0Y6gV5qZ8QVBT
 KVbJIJXXw6GDS0CO6SozYWX57oh/yprMSx5oK8/1hKq0SncBuQYEC9N1ZaKh22yINK6Yfi
 lvOnBlKjX0QTF36KVBqwdhq4Efahmd0=
Message-ID: <57549583d196e7556c4433884925570519804e5f.camel@crapouillou.net>
Subject: Re: [PATCH v3 37/39] drm/ingenic: crtc: Switch to
 ingenic_drm_get_new_priv_state()
From: Paul Cercueil <paul@crapouillou.net>
To: Maxime Ripard <mripard@kernel.org>
Cc: Ville =?ISO-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie	 <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, 	dri-devel@lists.freedesktop.org, Dmitry Baryshkov	
 <dmitry.baryshkov@oss.qualcomm.com>, linux-mips@vger.kernel.org
Date: Wed, 10 Sep 2025 15:14:55 +0200
In-Reply-To: <20250910-magnetic-hot-lizard-cfecd2@houat>
References: <20250909-drm-no-more-existing-state-v3-0-1c7a7d960c33@kernel.org>
 <20250909-drm-no-more-existing-state-v3-37-1c7a7d960c33@kernel.org>
 <aMAxEjIJOvxmOj2D@intel.com>
 <3d9058a503d6b852756476490f091e43358c21ba.camel@crapouillou.net>
 <20250910-magnetic-hot-lizard-cfecd2@houat>
Autocrypt: addr=paul@crapouillou.net; prefer-encrypt=mutual;
 keydata=mQENBF0KhcEBCADkfmrzdTOp/gFOMQX0QwKE2WgeCJiHPWkpEuPH81/HB2dpjPZNW03ZM
 LQfECbbaEkdbN4YnPfXgcc1uBe5mwOAPV1MBlaZcEt4M67iYQwSNrP7maPS3IaQJ18ES8JJ5Uf5Uz
 FZaUawgH+oipYGW+v31cX6L3k+dGsPRM0Pyo0sQt52fsopNPZ9iag0iY7dGNuKenaEqkYNjwEgTtN
 z8dt6s3hMpHIKZFL3OhAGi88wF/21isv0zkF4J0wlf9gYUTEEY3Eulx80PTVqGIcHZzfavlWIdzhe
 +rxHTDGVwseR2Y1WjgFGQ2F+vXetAB8NEeygXee+i9nY5qt9c07m8mzjABEBAAG0JFBhdWwgQ2VyY
 3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0PokBTgQTAQoAOBYhBNdHYd8OeCBwpMuVxnPua9InSr
 1BBQJdCoXBAhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEHPua9InSr1BgvIH/0kLyrI3V0f
 33a6D3BJwc1grbygPVYGuC5l5eMnAI+rDmLR19E2yvibRpgUc87NmPEQPpbbtAZt8On/2WZoE5OIP
 dlId/AHNpdgAtGXo0ZX4LGeVPjxjdkbrKVHxbcdcnY+zzaFglpbVSvp76pxqgVg8PgxkAAeeJV+ET
 4t0823Gz2HzCL/6JZhvKAEtHVulOWoBh368SYdolp1TSfORWmHzvQiCCCA+j0cMkYVGzIQzEQhX7U
 rf9N/nhU5/SGLFEi9DcBfXoGzhyQyLXflhJtKm3XGB1K/pPulbKaPcKAl6rIDWPuFpHkSbmZ9r4KF
 lBwgAhlGy6nqP7O3u7q23hRU=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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

Hi Maxime,

Le mercredi 10 septembre 2025 =C3=A0 13:26 +0200, Maxime Ripard a =C3=A9cri=
t=C2=A0:
> On Tue, Sep 09, 2025 at 04:45:27PM +0200, Paul Cercueil wrote:
> > Hi Ville,
> >=20
> > Le mardi 09 septembre 2025 =C3=A0 16:52 +0300, Ville Syrj=C3=A4l=C3=A4 =
a =C3=A9crit=C2=A0:
> > > On Tue, Sep 09, 2025 at 01:27:56PM +0200, Maxime Ripard wrote:
> > > > The ingenic CRTC atomic_enable() implementation will indirectly
> > > > call
> > > > drm_atomic_get_private_obj_state() through
> > > > ingenic_drm_get_priv_state().
> > > >=20
> > > > drm_atomic_get_private_obj_state() will either return the new
> > > > state
> > > > for
> > > > the object in the global state if it exists, or will allocate a
> > > > new
> > > > one
> > > > and add it to the global state.
> > > >=20
> > > > atomic_enable() however isn't allowed to modify the global
> > > > state.
> > > > So
> > > > what the implementation should use is the
> > > > drm_atomic_get_new_private_obj_state() helper to get the new
> > > > state
> > > > for
> > > > the CRTC, without performing an extra allocation.
> > > >=20
> > > > The ingenic driver has a wrapper around that helper with
> > > > ingenic_drm_get_new_priv_state(), so let's use that instead.
> > > >=20
> > > > Reported-by: Dmitry Baryshkov
> > > > <dmitry.baryshkov@oss.qualcomm.com>
> > > > Suggested-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.co=
m>
> > > > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > > >=20
> > > > ---
> > > > To: Paul Cercueil <paul@crapouillou.net>
> > > > Cc: linux-mips@vger.kernel.org
> > > > ---
> > > > =C2=A0drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 2 +-
> > > > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> > > >=20
> > > > diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> > > > b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> > > > index
> > > > 05faed933e5619c796f2a4fa1906e0eaa029ac68..a1b641d63fc500dc169d0
> > > > b0e2
> > > > 2f93168c343a242 100644
> > > > --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> > > > +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> > > > @@ -245,11 +245,11 @@ static void
> > > > ingenic_drm_crtc_atomic_enable(struct drm_crtc *crtc,
> > > > =C2=A0{
> > > > =C2=A0	struct ingenic_drm *priv =3D drm_crtc_get_priv(crtc);
> > > > =C2=A0	struct ingenic_drm_private_state *priv_state;
> > > > =C2=A0	unsigned int next_id;
> > > > =C2=A0
> > > > -	priv_state =3D ingenic_drm_get_priv_state(priv, state);
> > > > +	priv_state =3D ingenic_drm_get_new_priv_state(priv,
> > > > state);
> > > > =C2=A0	if (WARN_ON(IS_ERR(priv_state)))
> > >=20
> > > get_new_state() will never return an error pointer. It's either
> > > a valid pointer or NULL.
> >=20
> > Good catch.
>=20
> Yeah, thanks.
>=20
> > > To me it looks like this could potentially be NULL here as the
> > > get_pvi_state() call is done from the plane .atomic_check()
> > > whereas this gets called for the crtc. So if the plane is
> > > disabled there might not be any private state included in the
> > > commit.
> > >=20
> > > Not sure how this driver/hardware is supposed to work so not
> > > sure what the proper fix for that is...
> >=20
> > Would it be just a matter of calling
> > drm_atomic_get_private_obj_state()
> > in the crtc's .atomic_check() to make sure the object is created?
>=20
> It's really not clear to me what that private object stores in the
> first
> place. It looks like it's about toggling a bit in the crtc DMA
> descriptors, but it's only set by planes?
>=20
> Can you expand a bit on the hw design and why you're using a private
> object to store that?

The primary plane f0 supports paletted 8bpp, in which case the palette
needs to be DMA'd once per frame. The "use_palette" is set in the
plane's .atomic_check as it has access to the new frame's pixel format.
It is used in the plane's .atomic_update to configure the DMA chain of
the f0 plane to either transfer the frame data continuously (if non-
paletted) or alternate between transferring the frame data and the
palette. This field is also needed in the CRTC's .atomic_enable as
we're writing a different DMA descriptor chain address if the palette
is used (as the palette must be transferred before the frame).

Cheers,
-Paul
