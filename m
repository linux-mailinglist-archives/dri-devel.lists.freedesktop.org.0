Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5512568CB54
	for <lists+dri-devel@lfdr.de>; Tue,  7 Feb 2023 01:42:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C520B10E1B5;
	Tue,  7 Feb 2023 00:42:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 296E710E1B5
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Feb 2023 00:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675730558;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tylmpof53H6qt7xadysXblK1UhUYqNCo3xpusAQjAtQ=;
 b=e0YD4rEjiOFDqXH4/1ohStVd3krMyTtR2LlrjbMzQCazJM5p3u6YNb7KL0u55ByM9vIlu6
 r8e6kzCLL5NnflWEUMIGm7p8AWW7scoIbaeIEsA0ljkNyfEsZ2sOO5WgJvgrllePs2DAgz
 ntrF+xbMNcYnGpVTjgHybMrkzPQ1vFU=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-206-3D6Te3NgOTqpjgfthcW1WQ-1; Mon, 06 Feb 2023 19:42:35 -0500
X-MC-Unique: 3D6Te3NgOTqpjgfthcW1WQ-1
Received: by mail-qt1-f199.google.com with SMTP id
 bs11-20020ac86f0b000000b003b9b4ec27c4so7607281qtb.19
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Feb 2023 16:42:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9PL65Ot97HxurY2i6/J8tAA9u5Jl4yQNwsMewS8lKv8=;
 b=gHG1H0tblnr+r0n7mmiJ71h/QcU42kQk7yZ30EO/Ud0xt7ks5mKD+W9DolS/2cs1UV
 1LypSejH7GQMQfRCbrE4uGXWek7/NG5O/YhJIwutkx2mBgWGd64kq1OpTVzllcpemyvo
 x4j8IMzhlvY4I3911Fhb5BxeL5QVHadD0axUi8ex7uAjnJc0fpRHcDcCDWPKOB0lxGYg
 Mmm5EolfnYs+KnoRNRFbI0Ux5w4LhODK8p41sUp9eJE+FKcKm8abgyqX+r8+LOC8Gzbb
 zrBfkbismW/a5JN57z8atM2xF7qSwf/W/FMCh+mGSyfPFleVAP8MJTAD6VlejKKV8G3C
 2ADA==
X-Gm-Message-State: AO0yUKVIsRaj9utc9TtEl5pkxgIJPLPf4ieSyI2m+rxYTJ7N+6Yd5aLc
 byioO7s6+pxFLWFLH8ublJsMfuh/NWkFh3rgv+KkaTutVQAJwHHOMdZ+ijDellaX8BxdmxgVwzV
 ALrbVVL1Lp9z1eWKLV0e5Fcj1HfU8
X-Received: by 2002:a05:622a:513:b0:3b6:3512:eec9 with SMTP id
 l19-20020a05622a051300b003b63512eec9mr2084819qtx.51.1675730554720; 
 Mon, 06 Feb 2023 16:42:34 -0800 (PST)
X-Google-Smtp-Source: AK7set/2/RXcu0+XdXBcKJ9IB+foxl8+YciCfBTMv070Rr3TzCgj4JtCo/9brBcBRFuZJc3bcnGgJw==
X-Received: by 2002:a05:622a:513:b0:3b6:3512:eec9 with SMTP id
 l19-20020a05622a051300b003b63512eec9mr2084797qtx.51.1675730554423; 
 Mon, 06 Feb 2023 16:42:34 -0800 (PST)
Received: from ?IPv6:2600:4040:5c68:6800::feb? ([2600:4040:5c68:6800::feb])
 by smtp.gmail.com with ESMTPSA id
 y21-20020a05622a005500b003b9bb59543fsm8448841qtw.61.2023.02.06.16.42.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 16:42:33 -0800 (PST)
Message-ID: <c74b71b1d998ce6b062405508354dd1943aafa38.camel@redhat.com>
Subject: Re: [PATCH v2 02/17] drm/display/dp_mst: Handle old/new payload
 states in drm_dp_remove_payload()
From: Lyude Paul <lyude@redhat.com>
To: imre.deak@intel.com
Date: Mon, 06 Feb 2023 19:42:32 -0500
In-Reply-To: <Y9p/ZqVVpW/YMdUy@ideak-desk.fi.intel.com>
References: <20230131150548.1614458-1-imre.deak@intel.com>
 <20230131150548.1614458-3-imre.deak@intel.com>
 <ed8b73096a576f317979c3dd65392371d5b77612.camel@redhat.com>
 <Y9p/ZqVVpW/YMdUy@ideak-desk.fi.intel.com>
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
Cc: dri-devel@lists.freedesktop.org, Karol Herbst <kherbst@redhat.com>,
 intel-gfx@lists.freedesktop.org, stable@vger.kernel.org,
 Ben Skeggs <bskeggs@redhat.com>, Wayne Lin <Wayne.Lin@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2023-02-01 at 17:04 +0200, Imre Deak wrote:
>=20
> Yes, this patch should have no functional change, so please check what
> would apply to other drivers as well.
>=20
> Could you also check Ville's comment about storing start_slot elsewhere
> than the atomic state (leaving only time_slots there). I wonder if that
> would work, at least it would simplify things I think.

Ideally it'd be nice if we could have all this info in the atomic commit, b=
ut
yeah - you're not the first person to find this a bit confusing. FWIW thoug=
h,
the way we store start_slot right now is intended to follow the same kind o=
f
behavior we have with atomic CRTC commit dependencies, I think I also made =
it
that way so all of the state would be in a single place but there's no hard
requirement for it.

So if you guys think it'd be better design-wise to store this something els=
e,
I've got no strong feelings either way
>=20
> > For 0-2:
> >=20
> > Reviewed-by: Lyude Paul <lyude@redhat.com>
>=20
> Thanks.
>=20
> >=20
> > >=20
> > > Cc: Lyude Paul <lyude@redhat.com>
> > > Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> > > Cc: Ben Skeggs <bskeggs@redhat.com>
> > > Cc: Karol Herbst <kherbst@redhat.com>
> > > Cc: Harry Wentland <harry.wentland@amd.com>
> > > Cc: Alex Deucher <alexander.deucher@amd.com>
> > > Cc: Wayne Lin <Wayne.Lin@amd.com>
> > > Cc: stable@vger.kernel.org # 6.1
> > > Cc: dri-devel@lists.freedesktop.org
> > > Reviewed-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> > > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > > ---
> > >  .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c |  2 +-
> > >  drivers/gpu/drm/display/drm_dp_mst_topology.c | 26 ++++++++++-------=
--
> > >  drivers/gpu/drm/i915/display/intel_dp_mst.c   |  4 ++-
> > >  drivers/gpu/drm/nouveau/dispnv50/disp.c       |  2 +-
> > >  include/drm/display/drm_dp_mst_helper.h       |  3 ++-
> > >  5 files changed, 21 insertions(+), 16 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.=
c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> > > index a50319fc42b11..180d3893b68da 100644
> > > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> > > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> > > @@ -208,7 +208,7 @@ bool dm_helpers_dp_mst_write_payload_allocation_t=
able(
> > >  =09if (enable)
> > >  =09=09drm_dp_add_payload_part1(mst_mgr, mst_state, payload);
> > >  =09else
> > > -=09=09drm_dp_remove_payload(mst_mgr, mst_state, payload);
> > > +=09=09drm_dp_remove_payload(mst_mgr, mst_state, payload, payload);
> > > =20
> > >  =09/* mst_mgr->->payloads are VC payload notify MST branch using DPC=
D or
> > >  =09 * AUX message. The sequence is slot 1-63 allocated sequence for =
each
> > > diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/=
gpu/drm/display/drm_dp_mst_topology.c
> > > index 847c10aa2098c..1990ff5dc7ddd 100644
> > > --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > @@ -3342,7 +3342,8 @@ EXPORT_SYMBOL(drm_dp_add_payload_part1);
> > >   * drm_dp_remove_payload() - Remove an MST payload
> > >   * @mgr: Manager to use.
> > >   * @mst_state: The MST atomic state
> > > - * @payload: The payload to write
> > > + * @old_payload: The payload with its old state
> > > + * @new_payload: The payload to write
> > >   *
> > >   * Removes a payload from an MST topology if it was successfully ass=
igned a start slot. Also updates
> > >   * the starting time slots of all other payloads which would have be=
en shifted towards the start of
> > > @@ -3350,36 +3351,37 @@ EXPORT_SYMBOL(drm_dp_add_payload_part1);
> > >   */
> > >  void drm_dp_remove_payload(struct drm_dp_mst_topology_mgr *mgr,
> > >  =09=09=09   struct drm_dp_mst_topology_state *mst_state,
> > > -=09=09=09   struct drm_dp_mst_atomic_payload *payload)
> > > +=09=09=09   const struct drm_dp_mst_atomic_payload *old_payload,
> > > +=09=09=09   struct drm_dp_mst_atomic_payload *new_payload)
> > >  {
> > >  =09struct drm_dp_mst_atomic_payload *pos;
> > >  =09bool send_remove =3D false;
> > > =20
> > >  =09/* We failed to make the payload, so nothing to do */
> > > -=09if (payload->vc_start_slot =3D=3D -1)
> > > +=09if (new_payload->vc_start_slot =3D=3D -1)
> > >  =09=09return;
> > > =20
> > >  =09mutex_lock(&mgr->lock);
> > > -=09send_remove =3D drm_dp_mst_port_downstream_of_branch(payload->por=
t, mgr->mst_primary);
> > > +=09send_remove =3D drm_dp_mst_port_downstream_of_branch(new_payload-=
>port, mgr->mst_primary);
> > >  =09mutex_unlock(&mgr->lock);
> > > =20
> > >  =09if (send_remove)
> > > -=09=09drm_dp_destroy_payload_step1(mgr, mst_state, payload);
> > > +=09=09drm_dp_destroy_payload_step1(mgr, mst_state, new_payload);
> > >  =09else
> > >  =09=09drm_dbg_kms(mgr->dev, "Payload for VCPI %d not in topology, no=
t sending remove\n",
> > > -=09=09=09    payload->vcpi);
> > > +=09=09=09    new_payload->vcpi);
> > > =20
> > >  =09list_for_each_entry(pos, &mst_state->payloads, next) {
> > > -=09=09if (pos !=3D payload && pos->vc_start_slot > payload->vc_start=
_slot)
> > > -=09=09=09pos->vc_start_slot -=3D payload->time_slots;
> > > +=09=09if (pos !=3D new_payload && pos->vc_start_slot > new_payload->=
vc_start_slot)
> > > +=09=09=09pos->vc_start_slot -=3D old_payload->time_slots;
> > >  =09}
> > > -=09payload->vc_start_slot =3D -1;
> > > +=09new_payload->vc_start_slot =3D -1;
> > > =20
> > >  =09mgr->payload_count--;
> > > -=09mgr->next_start_slot -=3D payload->time_slots;
> > > +=09mgr->next_start_slot -=3D old_payload->time_slots;
> > > =20
> > > -=09if (payload->delete)
> > > -=09=09drm_dp_mst_put_port_malloc(payload->port);
> > > +=09if (new_payload->delete)
> > > +=09=09drm_dp_mst_put_port_malloc(new_payload->port);
> > >  }
> > >  EXPORT_SYMBOL(drm_dp_remove_payload);
> > > =20
> > > diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gp=
u/drm/i915/display/intel_dp_mst.c
> > > index f3cb12dcfe0a7..dc4e5ff1dbb31 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > > +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > > @@ -526,6 +526,8 @@ static void intel_mst_disable_dp(struct intel_ato=
mic_state *state,
> > >  =09=09to_intel_connector(old_conn_state->connector);
> > >  =09struct drm_dp_mst_topology_state *mst_state =3D
> > >  =09=09drm_atomic_get_mst_topology_state(&state->base, &intel_dp->mst=
_mgr);
> > > +=09struct drm_dp_mst_atomic_payload *payload =3D
> > > +=09=09drm_atomic_get_mst_payload_state(mst_state, connector->port);
> > >  =09struct drm_i915_private *i915 =3D to_i915(connector->base.dev);
> > > =20
> > >  =09drm_dbg_kms(&i915->drm, "active links %d\n",
> > > @@ -534,7 +536,7 @@ static void intel_mst_disable_dp(struct intel_ato=
mic_state *state,
> > >  =09intel_hdcp_disable(intel_mst->connector);
> > > =20
> > >  =09drm_dp_remove_payload(&intel_dp->mst_mgr, mst_state,
> > > -=09=09=09      drm_atomic_get_mst_payload_state(mst_state, connector=
->port));
> > > +=09=09=09      payload, payload);
> > > =20
> > >  =09intel_audio_codec_disable(encoder, old_crtc_state, old_conn_state=
);
> > >  }
> > > diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/dr=
m/nouveau/dispnv50/disp.c
> > > index edcb2529b4025..ed9d374147b8d 100644
> > > --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> > > +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> > > @@ -885,7 +885,7 @@ nv50_msto_prepare(struct drm_atomic_state *state,
> > > =20
> > >  =09// TODO: Figure out if we want to do a better job of handling VCP=
I allocation failures here?
> > >  =09if (msto->disabled) {
> > > -=09=09drm_dp_remove_payload(mgr, mst_state, payload);
> > > +=09=09drm_dp_remove_payload(mgr, mst_state, payload, payload);
> > > =20
> > >  =09=09nvif_outp_dp_mst_vcpi(&mstm->outp->outp, msto->head->base.inde=
x, 0, 0, 0, 0);
> > >  =09} else {
> > > diff --git a/include/drm/display/drm_dp_mst_helper.h b/include/drm/di=
splay/drm_dp_mst_helper.h
> > > index 41fd8352ab656..f5eb9aa152b14 100644
> > > --- a/include/drm/display/drm_dp_mst_helper.h
> > > +++ b/include/drm/display/drm_dp_mst_helper.h
> > > @@ -841,7 +841,8 @@ int drm_dp_add_payload_part2(struct drm_dp_mst_to=
pology_mgr *mgr,
> > >  =09=09=09     struct drm_dp_mst_atomic_payload *payload);
> > >  void drm_dp_remove_payload(struct drm_dp_mst_topology_mgr *mgr,
> > >  =09=09=09   struct drm_dp_mst_topology_state *mst_state,
> > > -=09=09=09   struct drm_dp_mst_atomic_payload *payload);
> > > +=09=09=09   const struct drm_dp_mst_atomic_payload *old_payload,
> > > +=09=09=09   struct drm_dp_mst_atomic_payload *new_payload);
> > > =20
> > >  int drm_dp_check_act_status(struct drm_dp_mst_topology_mgr *mgr);
> > > =20
> >=20
> > --=20
> > Cheers,
> >  Lyude Paul (she/her)
> >  Software Engineer at Red Hat
> >=20
>=20

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

