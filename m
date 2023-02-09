Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D866912E1
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 22:59:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A264210EBCC;
	Thu,  9 Feb 2023 21:59:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E30F10EBC6
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 21:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675979937;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HLCQcIULWT7VzeepNybvN+ui3XDFDU11HIdfZbVE8fU=;
 b=PhNmtOtq8793uPeYFXta3GoKLZozPGaa2iIKLo2uRLd3c+6uTVDzdvAZBMib5H9n5+twjO
 LlFlSuceyuExuh5hkmZ2Z8WNyrqbdaIVLmhNG+ZNL5EdfUiA3iH9KjhcxvR02ISgA8XfVA
 f1mLbOcAgR/i4U3NuSfY4ZNYAYj7f3Y=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-116-RDhodI-GN62T4tqvFMLsKA-1; Thu, 09 Feb 2023 16:58:56 -0500
X-MC-Unique: RDhodI-GN62T4tqvFMLsKA-1
Received: by mail-qt1-f199.google.com with SMTP id
 he22-20020a05622a601600b003ba3c280fabso1943090qtb.2
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Feb 2023 13:58:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vXYIk8oZD/hNuBr0ZdgeM5sLVWe+1NS473W5ypKbHCs=;
 b=DA8GKHNaHUsxwZpW6CbBwK2kiuxu3ISRyJeFaKahOeOqZXroPmZ3y3/oNUMlmi6Urf
 +vksiOFuDAjMReAUH2yuCaQHBg3rzLTfiF54zwGcyGgcmm6/3bXhTM17/boQMR2Wb61G
 xhx4X61miC3fSkbWS8UgdHjoqkhj6sgxh1T4hj+4Bp0fIbD0ru3lvcO6FmYblcwqDC0l
 NY2nhkYzwOAym9SVqB4Z5zh9i8hoHG27oR6cOK9IXv1Fll2I+iMGp3d1S5TtUEkMQdbY
 AZM0kDoFpgCGciAfKQCkSZkeF5rcHI7H8DSmk7xEMIDX/Hs0YdVgXHdn7BFL8Kqpsfo8
 w9wg==
X-Gm-Message-State: AO0yUKXpYJPiPSOpeLvrKo4/AX5jmkbhTaukHvu2jXFvCZXuj0p8ucb+
 QhRBe6v5TdECAL5iDrOriQjUl4TrSpZ4wX0eegTlbbDVfLdGgrKhrvvuVPtY3j3Fca0fWdrfhSf
 aCAjjCgY6ha8SZvg64Dm/iesoAdhnMSNJew==
X-Received: by 2002:a05:6214:5013:b0:56b:ed80:6bec with SMTP id
 jo19-20020a056214501300b0056bed806becmr24159258qvb.20.1675979935787; 
 Thu, 09 Feb 2023 13:58:55 -0800 (PST)
X-Google-Smtp-Source: AK7set+GMJqeL5R/Cw8KkWGw/2A6ABhbVBnlRlSuL6pwgE1TsHJROGJi+T47vCS/Y6G9Cr7p4GwYJA==
X-Received: by 2002:a05:6214:5013:b0:56b:ed80:6bec with SMTP id
 jo19-20020a056214501300b0056bed806becmr24159232qvb.20.1675979935528; 
 Thu, 09 Feb 2023 13:58:55 -0800 (PST)
Received: from ?IPv6:2600:4040:5c68:6800:3463:5df7:aced:152e?
 ([2600:4040:5c68:6800:3463:5df7:aced:152e])
 by smtp.gmail.com with ESMTPSA id
 b62-20020a378041000000b00726b480880esm2164111qkd.68.2023.02.09.13.58.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Feb 2023 13:58:55 -0800 (PST)
Message-ID: <0b5a4e81dc98f9c28d77f0f53741712d1c7c3c09.camel@redhat.com>
Subject: [Cc: drm-misc folks] Re: [Intel-gfx] [CI 1/4] drm/i915/dp_mst: Add
 the MST topology state for modesetted CRTCs
From: Lyude Paul <lyude@redhat.com>
To: imre.deak@intel.com, Harry Wentland <harry.wentland@amd.com>, Alex
 Deucher <alexander.deucher@amd.com>, Jani Nikula <jani.nikula@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 09 Feb 2023 16:58:54 -0500
In-Reply-To: <Y+JLQfuSAS6xLPIS@ideak-desk.fi.intel.com>
References: <20230206114856.2665066-1-imre.deak@intel.com>
 <Y+JLQfuSAS6xLPIS@ideak-desk.fi.intel.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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
Cc: Karol Herbst <kherbst@redhat.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, stable@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Wayne Lin <Wayne.Lin@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2023-02-07 at 14:59 +0200, Imre Deak wrote:
> Hi all,
>=20
> On Mon, Feb 06, 2023 at 01:48:53PM +0200, Imre Deak wrote:
> > Add the MST topology for a CRTC to the atomic state if the driver
> > needs to force a modeset on the CRTC after the encoder compute config
> > functions are called.
> >=20
> > Later the MST encoder's disable hook also adds the state, but that isn'=
t
> > guaranteed to work (since in that hook getting the state may fail, whic=
h
> > can't be handled there). This should fix that, while a later patch fixe=
s
> > the use of the MST state in the disable hook.
> >=20
> > v2: Add missing forward struct declartions, caught by hdrtest.
> > v3: Factor out intel_dp_mst_add_topology_state_for_connector() used
> >     later in the patchset.
> >=20
> > Cc: Lyude Paul <lyude@redhat.com>
> > Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> > Cc: stable@vger.kernel.org # 6.1
> > Reviewed-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> # =
v2
> > Reviewed-by: Lyude Paul <lyude@redhat.com>
> > Signed-off-by: Imre Deak <imre.deak@intel.com>
>=20
> Is it ok to merge these 4 patches (also at [1]), via the i915 tree?
>=20
> If so could it be also acked from the AMD and Nouveau side?

Whichever branch works best for y'all is fine by me, if it's via i915's tre=
e I
guess we might need to back-merge drm-misc at some point so I can write up
equivalent fixes for nouveau as well.

(Added Thomas Zimmermann to Cc)

>=20
> [1] https://patchwork.freedesktop.org/series/113703/
>=20
> > ---
> >  drivers/gpu/drm/i915/display/intel_display.c |  4 ++
> >  drivers/gpu/drm/i915/display/intel_dp_mst.c  | 61 ++++++++++++++++++++
> >  drivers/gpu/drm/i915/display/intel_dp_mst.h  |  4 ++
> >  3 files changed, 69 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu=
/drm/i915/display/intel_display.c
> > index 166662ade593c..38106cf63b3b9 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display.c
> > +++ b/drivers/gpu/drm/i915/display/intel_display.c
> > @@ -5936,6 +5936,10 @@ int intel_modeset_all_pipes(struct intel_atomic_=
state *state,
> >  =09=09if (ret)
> >  =09=09=09return ret;
> > =20
> > +=09=09ret =3D intel_dp_mst_add_topology_state_for_crtc(state, crtc);
> > +=09=09if (ret)
> > +=09=09=09return ret;
> > +
> >  =09=09ret =3D intel_atomic_add_affected_planes(state, crtc);
> >  =09=09if (ret)
> >  =09=09=09return ret;
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/=
drm/i915/display/intel_dp_mst.c
> > index 8b0e4defa3f10..f3cb12dcfe0a7 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > @@ -1223,3 +1223,64 @@ bool intel_dp_mst_is_slave_trans(const struct in=
tel_crtc_state *crtc_state)
> >  =09return crtc_state->mst_master_transcoder !=3D INVALID_TRANSCODER &&
> >  =09       crtc_state->mst_master_transcoder !=3D crtc_state->cpu_trans=
coder;
> >  }
> > +
> > +/**
> > + * intel_dp_mst_add_topology_state_for_connector - add MST topology st=
ate for a connector
> > + * @state: atomic state
> > + * @connector: connector to add the state for
> > + * @crtc: the CRTC @connector is attached to
> > + *
> > + * Add the MST topology state for @connector to @state.
> > + *
> > + * Returns 0 on success, negative error code on failure.
> > + */
> > +static int
> > +intel_dp_mst_add_topology_state_for_connector(struct intel_atomic_stat=
e *state,
> > +=09=09=09=09=09      struct intel_connector *connector,
> > +=09=09=09=09=09      struct intel_crtc *crtc)
> > +{
> > +=09struct drm_dp_mst_topology_state *mst_state;
> > +
> > +=09if (!connector->mst_port)
> > +=09=09return 0;
> > +
> > +=09mst_state =3D drm_atomic_get_mst_topology_state(&state->base,
> > +=09=09=09=09=09=09      &connector->mst_port->mst_mgr);
> > +=09if (IS_ERR(mst_state))
> > +=09=09return PTR_ERR(mst_state);
> > +
> > +=09mst_state->pending_crtc_mask |=3D drm_crtc_mask(&crtc->base);
> > +
> > +=09return 0;
> > +}
> > +
> > +/**
> > + * intel_dp_mst_add_topology_state_for_crtc - add MST topology state f=
or a CRTC
> > + * @state: atomic state
> > + * @crtc: CRTC to add the state for
> > + *
> > + * Add the MST topology state for @crtc to @state.
> > + *
> > + * Returns 0 on success, negative error code on failure.
> > + */
> > +int intel_dp_mst_add_topology_state_for_crtc(struct intel_atomic_state=
 *state,
> > +=09=09=09=09=09     struct intel_crtc *crtc)
> > +{
> > +=09struct drm_connector *_connector;
> > +=09struct drm_connector_state *conn_state;
> > +=09int i;
> > +
> > +=09for_each_new_connector_in_state(&state->base, _connector, conn_stat=
e, i) {
> > +=09=09struct intel_connector *connector =3D to_intel_connector(_connec=
tor);
> > +=09=09int ret;
> > +
> > +=09=09if (conn_state->crtc !=3D &crtc->base)
> > +=09=09=09continue;
> > +
> > +=09=09ret =3D intel_dp_mst_add_topology_state_for_connector(state, con=
nector, crtc);
> > +=09=09if (ret)
> > +=09=09=09return ret;
> > +=09}
> > +
> > +=09return 0;
> > +}
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.h b/drivers/gpu/=
drm/i915/display/intel_dp_mst.h
> > index f7301de6cdfb3..f1815bb722672 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp_mst.h
> > +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.h
> > @@ -8,6 +8,8 @@
> > =20
> >  #include <linux/types.h>
> > =20
> > +struct intel_atomic_state;
> > +struct intel_crtc;
> >  struct intel_crtc_state;
> >  struct intel_digital_port;
> >  struct intel_dp;
> > @@ -18,5 +20,7 @@ int intel_dp_mst_encoder_active_links(struct intel_di=
gital_port *dig_port);
> >  bool intel_dp_mst_is_master_trans(const struct intel_crtc_state *crtc_=
state);
> >  bool intel_dp_mst_is_slave_trans(const struct intel_crtc_state *crtc_s=
tate);
> >  bool intel_dp_mst_source_support(struct intel_dp *intel_dp);
> > +int intel_dp_mst_add_topology_state_for_crtc(struct intel_atomic_state=
 *state,
> > +=09=09=09=09=09     struct intel_crtc *crtc);
> > =20
> >  #endif /* __INTEL_DP_MST_H__ */
> > --=20
> > 2.37.1
> >=20
>=20

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

