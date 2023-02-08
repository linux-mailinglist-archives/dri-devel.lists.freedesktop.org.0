Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8EC68E4EB
	for <lists+dri-devel@lfdr.de>; Wed,  8 Feb 2023 01:21:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CCB110E655;
	Wed,  8 Feb 2023 00:21:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91E8410E655
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Feb 2023 00:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675815711;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4rhaaQwDM5EYixux1uAXKC33JKuk9epUIo+b+x8R89s=;
 b=Y65uVL5DBpwRZQ672/qEqvUBC9/Gk2e6oUGj25wY539uA8j/vDUGJGKG8cjyC+VDyeEo0C
 wQOC+nn3nY4Vj/zm1eUMKe+QmVrQFJ6k/wfDc8n49ZDJgiNLmkllfEs2qtwMOjRZ6ONGfW
 P+xr2eLnKnoxUnQZweBMjjy791u7ypA=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-372-0bjM7w1mOM-COzCMbQOjsg-1; Tue, 07 Feb 2023 19:21:50 -0500
X-MC-Unique: 0bjM7w1mOM-COzCMbQOjsg-1
Received: by mail-qk1-f198.google.com with SMTP id
 j29-20020a05620a001d00b00724fd33cb3eso11016961qki.14
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Feb 2023 16:21:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QlaUdh4KoWNakZ21Hl3i617t/NE4YAHF2tjk/IFExBM=;
 b=d4iPr61C+PhkyzHdc1pyOfbQJIFaQdVN42PQ8p5PtmzWWq+ZuwL36iUyHlqUPPr32R
 QET5D4H3LLXRaR2qAeOaW4dK77YvZCEVKahMRUEFEsZTogIhK6or6NwQnj5nlr2eEfRj
 oGEO2pO+lgr1FUBsA2q0RYIQUDfBLX79Kd0PTVhUq7GIYZlts4dVsEmXKvYkPEfS4L6L
 4IIFykyXSxI1HeJZVayXPb/hTIo06217wHyw+QIi0KAaeNFeZiZFAQbZIlcngFBqn9ra
 HudhQo+Z3ORS5hwVgv3uQ4bukzBuDHgODuNOKm2cEqWDYaM+/wPxZl1pAj2OYCsY0Fbp
 cz+g==
X-Gm-Message-State: AO0yUKU1l+SEwyf+gwm/w1XyXBRuAgoICwxeYO0MO5uh4RIgVIcbL/YT
 yGcLWS/KKVFkOLA9iIsDXG4Rq+iFO++W4ZxB7NDQ2BrNsn8zCZgSun3LuLdXtuBo+hcgG2RBYYh
 CYLuIXZR8ZOmnia0iIlPYR1YoEog7
X-Received: by 2002:a05:6214:27ed:b0:552:9c08:7c9a with SMTP id
 jt13-20020a05621427ed00b005529c087c9amr8224575qvb.15.1675815710086; 
 Tue, 07 Feb 2023 16:21:50 -0800 (PST)
X-Google-Smtp-Source: AK7set8j37SaVmDthdtoNsuUzThCD02eR3sPjVgr3thH5HgHBGqZcHfxdBETYCiKWLgG9W/T1DMZKQ==
X-Received: by 2002:a05:6214:27ed:b0:552:9c08:7c9a with SMTP id
 jt13-20020a05621427ed00b005529c087c9amr8224543qvb.15.1675815709749; 
 Tue, 07 Feb 2023 16:21:49 -0800 (PST)
Received: from ?IPv6:2600:4040:5c68:6800::feb? ([2600:4040:5c68:6800::feb])
 by smtp.gmail.com with ESMTPSA id
 x8-20020a05620a0b4800b006bb29d932e1sm10404009qkg.105.2023.02.07.16.21.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 16:21:49 -0800 (PST)
Message-ID: <045569b5595e77d169bb91c101df7544fb94bf0b.camel@redhat.com>
Subject: Re: [PATCH v2 02/17] drm/display/dp_mst: Handle old/new payload
 states in drm_dp_remove_payload()
From: Lyude Paul <lyude@redhat.com>
To: imre.deak@intel.com
Date: Tue, 07 Feb 2023 19:21:48 -0500
In-Reply-To: <Y+I/wcEExBEbAV4L@ideak-desk.fi.intel.com>
References: <20230131150548.1614458-1-imre.deak@intel.com>
 <20230131150548.1614458-3-imre.deak@intel.com>
 <ed8b73096a576f317979c3dd65392371d5b77612.camel@redhat.com>
 <Y9p/ZqVVpW/YMdUy@ideak-desk.fi.intel.com>
 <c74b71b1d998ce6b062405508354dd1943aafa38.camel@redhat.com>
 <Y+I/wcEExBEbAV4L@ideak-desk.fi.intel.com>
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

On Tue, 2023-02-07 at 14:11 +0200, Imre Deak wrote:
> On Mon, Feb 06, 2023 at 07:42:32PM -0500, Lyude Paul wrote:
> > On Wed, 2023-02-01 at 17:04 +0200, Imre Deak wrote:
> > >=20
> > > Yes, this patch should have no functional change, so please check wha=
t
> > > would apply to other drivers as well.
> > >=20
> > > Could you also check Ville's comment about storing start_slot elsewhe=
re
> > > than the atomic state (leaving only time_slots there). I wonder if th=
at
> > > would work, at least it would simplify things I think.
> >=20
> > Ideally it'd be nice if we could have all this info in the atomic commi=
t, but
> > yeah - you're not the first person to find this a bit confusing. FWIW t=
hough,
> > the way we store start_slot right now is intended to follow the same ki=
nd of
> > behavior we have with atomic CRTC commit dependencies, I think I also m=
ade it
> > that way so all of the state would be in a single place but there's no =
hard
> > requirement for it.
>=20
> As I understood the atomic state should be precomputed during atomic
> check and not changed later during the commit phase. In case of
> start_slot this would mean knowing in advance the actual (driver
> specific) disabling / enabling sequence of the payloads, not sure how
> feasible it is to figure that out. start_slot also changes dynamically

It isn't feasible afaict, which was the main motivation for having the stra=
nge
update procedure - this is pretty much something that needs to be determine=
d
at commit time.

> as each payload is disabled, so these intermediate versions of the field
> would need to be tracked somehow separately from the final (precomputed)
> versions.

FWIW, the current way this works is that we call
drm_dp_mst_atomic_wait_for_dependencies() in order to ensure that no one's
currently writing to the start_slot field (remember, at this point we may n=
ot
have atomic locks held anymore). Then at that point, start_slot in the new
atomic state should hold the current in-hw start_slot value. start_slot isn=
't
actually set to the new starting slot until drm_dp_add_payload_part1(). Tha=
t
of course as you pointed out, doesn't help us unless we read all of the
start_slot values before we start changing payloads - since disabling paylo=
ads
inevitably changes the start slot of payloads that come afterwards.

I'll admit I'm a bit surprised this logic was wrong - if I recall the whole
reason I assumed this was OK when writing this code was that since we're
updating one payload at a time, ACT, repeat, that the start slots of each
payload in hardware _would_ actually change in the same way we modify them =
in
helpers. e.g., my expectation was if we had a bunch of payloads like this:

Payload #1: 15 slots, start_slot=3D0
Payload #2: 15 slots, start_slot=3D15
Payload #3: 15 slots, start_slot=3D30

And then disabled say, payload #1, that immediately after we get the ACT th=
at
the payload table in hardware would look like this:

Payload #2: 15 slots, start_slot=3D0
Payload #3: 15 slots, start_slot=3D15

But it sounds like it actually would look like this in the real world?

Payload #2: 15 slots, start_slot=3D15
Payload #3: 15 slots, start_slot=3D30

So I'm curious, is there something I missed here? At what point does the MS=
T
hub at the other end decide that it's time to move the start slots back? (k=
eep
in mind, the MST specification does explicitly mention that there should ne=
ver
be holes in the payload table - so something has to be shifting the payload=
s
back).

>=20
> > So if you guys think it'd be better design-wise to store this something=
 else,
> > I've got no strong feelings either way
> > >=20
> > > > For 0-2:
> > > >=20
> > > > Reviewed-by: Lyude Paul <lyude@redhat.com>
> > >=20
> > > Thanks.
> > >=20
> > > >=20
> > > > >=20
> > > > > Cc: Lyude Paul <lyude@redhat.com>
> > > > > Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> > > > > Cc: Ben Skeggs <bskeggs@redhat.com>
> > > > > Cc: Karol Herbst <kherbst@redhat.com>
> > > > > Cc: Harry Wentland <harry.wentland@amd.com>
> > > > > Cc: Alex Deucher <alexander.deucher@amd.com>
> > > > > Cc: Wayne Lin <Wayne.Lin@amd.com>
> > > > > Cc: stable@vger.kernel.org # 6.1
> > > > > Cc: dri-devel@lists.freedesktop.org
> > > > > Reviewed-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.c=
om>
> > > > > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > > > > ---
> > > > >  .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c |  2 +-
> > > > >  drivers/gpu/drm/display/drm_dp_mst_topology.c | 26 ++++++++++---=
------
> > > > >  drivers/gpu/drm/i915/display/intel_dp_mst.c   |  4 ++-
> > > > >  drivers/gpu/drm/nouveau/dispnv50/disp.c       |  2 +-
> > > > >  include/drm/display/drm_dp_mst_helper.h       |  3 ++-
> > > > >  5 files changed, 21 insertions(+), 16 deletions(-)
> > > > >=20
> > > > > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_help=
ers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> > > > > index a50319fc42b11..180d3893b68da 100644
> > > > > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> > > > > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> > > > > @@ -208,7 +208,7 @@ bool dm_helpers_dp_mst_write_payload_allocati=
on_table(
> > > > >  =09if (enable)
> > > > >  =09=09drm_dp_add_payload_part1(mst_mgr, mst_state, payload);
> > > > >  =09else
> > > > > -=09=09drm_dp_remove_payload(mst_mgr, mst_state, payload);
> > > > > +=09=09drm_dp_remove_payload(mst_mgr, mst_state, payload, payload=
);
> > > > > =20
> > > > >  =09/* mst_mgr->->payloads are VC payload notify MST branch using=
 DPCD or
> > > > >  =09 * AUX message. The sequence is slot 1-63 allocated sequence =
for each
> > > > > diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/driv=
ers/gpu/drm/display/drm_dp_mst_topology.c
> > > > > index 847c10aa2098c..1990ff5dc7ddd 100644
> > > > > --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > > > +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > > > @@ -3342,7 +3342,8 @@ EXPORT_SYMBOL(drm_dp_add_payload_part1);
> > > > >   * drm_dp_remove_payload() - Remove an MST payload
> > > > >   * @mgr: Manager to use.
> > > > >   * @mst_state: The MST atomic state
> > > > > - * @payload: The payload to write
> > > > > + * @old_payload: The payload with its old state
> > > > > + * @new_payload: The payload to write
> > > > >   *
> > > > >   * Removes a payload from an MST topology if it was successfully=
 assigned a start slot. Also updates
> > > > >   * the starting time slots of all other payloads which would hav=
e been shifted towards the start of
> > > > > @@ -3350,36 +3351,37 @@ EXPORT_SYMBOL(drm_dp_add_payload_part1);
> > > > >   */
> > > > >  void drm_dp_remove_payload(struct drm_dp_mst_topology_mgr *mgr,
> > > > >  =09=09=09   struct drm_dp_mst_topology_state *mst_state,
> > > > > -=09=09=09   struct drm_dp_mst_atomic_payload *payload)
> > > > > +=09=09=09   const struct drm_dp_mst_atomic_payload *old_payload,
> > > > > +=09=09=09   struct drm_dp_mst_atomic_payload *new_payload)
> > > > >  {
> > > > >  =09struct drm_dp_mst_atomic_payload *pos;
> > > > >  =09bool send_remove =3D false;
> > > > > =20
> > > > >  =09/* We failed to make the payload, so nothing to do */
> > > > > -=09if (payload->vc_start_slot =3D=3D -1)
> > > > > +=09if (new_payload->vc_start_slot =3D=3D -1)
> > > > >  =09=09return;
> > > > > =20
> > > > >  =09mutex_lock(&mgr->lock);
> > > > > -=09send_remove =3D drm_dp_mst_port_downstream_of_branch(payload-=
>port, mgr->mst_primary);
> > > > > +=09send_remove =3D drm_dp_mst_port_downstream_of_branch(new_payl=
oad->port, mgr->mst_primary);
> > > > >  =09mutex_unlock(&mgr->lock);
> > > > > =20
> > > > >  =09if (send_remove)
> > > > > -=09=09drm_dp_destroy_payload_step1(mgr, mst_state, payload);
> > > > > +=09=09drm_dp_destroy_payload_step1(mgr, mst_state, new_payload);
> > > > >  =09else
> > > > >  =09=09drm_dbg_kms(mgr->dev, "Payload for VCPI %d not in topology=
, not sending remove\n",
> > > > > -=09=09=09    payload->vcpi);
> > > > > +=09=09=09    new_payload->vcpi);
> > > > > =20
> > > > >  =09list_for_each_entry(pos, &mst_state->payloads, next) {
> > > > > -=09=09if (pos !=3D payload && pos->vc_start_slot > payload->vc_s=
tart_slot)
> > > > > -=09=09=09pos->vc_start_slot -=3D payload->time_slots;
> > > > > +=09=09if (pos !=3D new_payload && pos->vc_start_slot > new_paylo=
ad->vc_start_slot)
> > > > > +=09=09=09pos->vc_start_slot -=3D old_payload->time_slots;
> > > > >  =09}
> > > > > -=09payload->vc_start_slot =3D -1;
> > > > > +=09new_payload->vc_start_slot =3D -1;
> > > > > =20
> > > > >  =09mgr->payload_count--;
> > > > > -=09mgr->next_start_slot -=3D payload->time_slots;
> > > > > +=09mgr->next_start_slot -=3D old_payload->time_slots;
> > > > > =20
> > > > > -=09if (payload->delete)
> > > > > -=09=09drm_dp_mst_put_port_malloc(payload->port);
> > > > > +=09if (new_payload->delete)
> > > > > +=09=09drm_dp_mst_put_port_malloc(new_payload->port);
> > > > >  }
> > > > >  EXPORT_SYMBOL(drm_dp_remove_payload);
> > > > > =20
> > > > > diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/driver=
s/gpu/drm/i915/display/intel_dp_mst.c
> > > > > index f3cb12dcfe0a7..dc4e5ff1dbb31 100644
> > > > > --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > > > > +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > > > > @@ -526,6 +526,8 @@ static void intel_mst_disable_dp(struct intel=
_atomic_state *state,
> > > > >  =09=09to_intel_connector(old_conn_state->connector);
> > > > >  =09struct drm_dp_mst_topology_state *mst_state =3D
> > > > >  =09=09drm_atomic_get_mst_topology_state(&state->base, &intel_dp-=
>mst_mgr);
> > > > > +=09struct drm_dp_mst_atomic_payload *payload =3D
> > > > > +=09=09drm_atomic_get_mst_payload_state(mst_state, connector->por=
t);
> > > > >  =09struct drm_i915_private *i915 =3D to_i915(connector->base.dev=
);
> > > > > =20
> > > > >  =09drm_dbg_kms(&i915->drm, "active links %d\n",
> > > > > @@ -534,7 +536,7 @@ static void intel_mst_disable_dp(struct intel=
_atomic_state *state,
> > > > >  =09intel_hdcp_disable(intel_mst->connector);
> > > > > =20
> > > > >  =09drm_dp_remove_payload(&intel_dp->mst_mgr, mst_state,
> > > > > -=09=09=09      drm_atomic_get_mst_payload_state(mst_state, conne=
ctor->port));
> > > > > +=09=09=09      payload, payload);
> > > > > =20
> > > > >  =09intel_audio_codec_disable(encoder, old_crtc_state, old_conn_s=
tate);
> > > > >  }
> > > > > diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gp=
u/drm/nouveau/dispnv50/disp.c
> > > > > index edcb2529b4025..ed9d374147b8d 100644
> > > > > --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> > > > > +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> > > > > @@ -885,7 +885,7 @@ nv50_msto_prepare(struct drm_atomic_state *st=
ate,
> > > > > =20
> > > > >  =09// TODO: Figure out if we want to do a better job of handling=
 VCPI allocation failures here?
> > > > >  =09if (msto->disabled) {
> > > > > -=09=09drm_dp_remove_payload(mgr, mst_state, payload);
> > > > > +=09=09drm_dp_remove_payload(mgr, mst_state, payload, payload);
> > > > > =20
> > > > >  =09=09nvif_outp_dp_mst_vcpi(&mstm->outp->outp, msto->head->base.=
index, 0, 0, 0, 0);
> > > > >  =09} else {
> > > > > diff --git a/include/drm/display/drm_dp_mst_helper.h b/include/dr=
m/display/drm_dp_mst_helper.h
> > > > > index 41fd8352ab656..f5eb9aa152b14 100644
> > > > > --- a/include/drm/display/drm_dp_mst_helper.h
> > > > > +++ b/include/drm/display/drm_dp_mst_helper.h
> > > > > @@ -841,7 +841,8 @@ int drm_dp_add_payload_part2(struct drm_dp_ms=
t_topology_mgr *mgr,
> > > > >  =09=09=09     struct drm_dp_mst_atomic_payload *payload);
> > > > >  void drm_dp_remove_payload(struct drm_dp_mst_topology_mgr *mgr,
> > > > >  =09=09=09   struct drm_dp_mst_topology_state *mst_state,
> > > > > -=09=09=09   struct drm_dp_mst_atomic_payload *payload);
> > > > > +=09=09=09   const struct drm_dp_mst_atomic_payload *old_payload,
> > > > > +=09=09=09   struct drm_dp_mst_atomic_payload *new_payload);
> > > > > =20
> > > > >  int drm_dp_check_act_status(struct drm_dp_mst_topology_mgr *mgr)=
;
> > > > > =20
> > > >=20
> > > > --=20
> > > > Cheers,
> > > >  Lyude Paul (she/her)
> > > >  Software Engineer at Red Hat
> > > >=20
> > >=20
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

