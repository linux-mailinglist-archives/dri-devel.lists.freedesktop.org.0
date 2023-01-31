Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE3B683A42
	for <lists+dri-devel@lfdr.de>; Wed,  1 Feb 2023 00:13:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ED8510E2BA;
	Tue, 31 Jan 2023 23:13:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE6F310E04D
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Jan 2023 23:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675206793;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rtsjDP4dKZMDI4ZeFRDR5mr1YGHyi1B/+ezb84IEh6I=;
 b=LqKRlucoG8zlovw7uDgC6eNfU8hVYsRI1C70wzT2Hxzum8qD8cPlxvsTzhSqNp0a+6TPPJ
 IK9tCX3TNBtZm0qP+9+10j/O7y4AyyQDdjPwe1jRWQ54cB9weysAqyx/GEv0YMCzYAoNpa
 HXH74GM0GkGVi3Yt5mFc5JlzLwn953w=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-42-apECGyAbNri0lFKHEW24sg-1; Tue, 31 Jan 2023 18:13:12 -0500
X-MC-Unique: apECGyAbNri0lFKHEW24sg-1
Received: by mail-qv1-f69.google.com with SMTP id
 j7-20020a0cf507000000b0053b538958d5so4984927qvm.18
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Jan 2023 15:13:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GuPLxxwLlIMb4e5mC8mkW+RMdG9aD5bdoF2Q5DsUBtk=;
 b=0e7RUU6uyNC2/qqwPovAtNE8N+Mj50ry04HJcrJJYqfNh/ncEp8M1Stv1MPOIxQ6qp
 WVPbB7Cg3lyn4FYCwbfhZX6RFWG503a5Fym5f7Mdtko1DqYoslty2Z713VNMxNAk28MS
 XEPDRvyzJnJrtAs9KPQIiMwLRtKbawnFKJqPQOZM9hAzbGynlyA2uUpPP2ttkDAD3CmY
 xndb7NBwYCY/XwTGgM4D0NvTfFK7/TMZxnAs8/iAPxyIs+v5iAMX8xg4wHkF45tqxqTw
 YhCciXcyiAf3/8gplNqa9u3oD5bwezXLvBPNvZfghEo3MMsAnvw2EsHo1YI72eZ3w5dH
 J8cg==
X-Gm-Message-State: AO0yUKUdMT2m/pFWArBrrJ3DSwXerWzzYCJePlyszj9ZrWqapg91Cg7j
 cfqezc/0NSSga1u6JuKNC2mJtTZlOdFTdC97S5pvPObG5VMqjHAWl1eorSH7dvv2L0J3J4pENqb
 fQwQaj48MIoSXJXs/9z5RcU5sAsIa
X-Received: by 2002:a0c:ee90:0:b0:531:91cd:59de with SMTP id
 u16-20020a0cee90000000b0053191cd59demr16680085qvr.26.1675206791867; 
 Tue, 31 Jan 2023 15:13:11 -0800 (PST)
X-Google-Smtp-Source: AK7set+U8IFBJjnSngopEHdO6P381kRED55/VU9cShm+LNOPTG4WX6UdvtmgTYUVLk6QaAv2MzY6FA==
X-Received: by 2002:a0c:ee90:0:b0:531:91cd:59de with SMTP id
 u16-20020a0cee90000000b0053191cd59demr16680063qvr.26.1675206791634; 
 Tue, 31 Jan 2023 15:13:11 -0800 (PST)
Received: from ?IPv6:2600:4040:5c68:6800::feb? ([2600:4040:5c68:6800::feb])
 by smtp.gmail.com with ESMTPSA id
 o13-20020a05620a2a0d00b006ce580c2663sm11056795qkp.35.2023.01.31.15.13.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 15:13:11 -0800 (PST)
Message-ID: <ed8b73096a576f317979c3dd65392371d5b77612.camel@redhat.com>
Subject: Re: [PATCH v2 02/17] drm/display/dp_mst: Handle old/new payload
 states in drm_dp_remove_payload()
From: Lyude Paul <lyude@redhat.com>
To: Imre Deak <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org
Date: Tue, 31 Jan 2023 18:13:10 -0500
In-Reply-To: <20230131150548.1614458-3-imre.deak@intel.com>
References: <20230131150548.1614458-1-imre.deak@intel.com>
 <20230131150548.1614458-3-imre.deak@intel.com>
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
Cc: Karol Herbst <kherbst@redhat.com>, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>,
 Wayne Lin <Wayne.Lin@amd.com>, Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2023-01-31 at 17:05 +0200, Imre Deak wrote:
> Atm, drm_dp_remove_payload() uses the same payload state to both get the
> vc_start_slot required for the payload removal DPCD message and to
> deduct time_slots from vc_start_slot of all payloads after the one being
> removed.
>=20
> The above isn't always correct, as vc_start_slot must be the up-to-date
> version contained in the new payload state, but time_slots must be the
> one used when the payload was previously added, contained in the old
> payload state. The new payload's time_slots can change vs. the old one
> if the current atomic commit changes the corresponding mode.
>=20
> This patch let's drivers pass the old and new payload states to
> drm_dp_remove_payload(), but keeps these the same for now in all drivers
> not to change the behavior. A follow-up i915 patch will pass in that
> driver the correct old and new states to the function.

Oh wow, this was definitely a mistake on my part, thanks for catching this!
TBH, I think this behavior is correct so (now that I actually have a setup
capable of testing amdgpu's MST fully thanks to gitlab issue 2171=E2=80=A6)=
 if you'd
like to change it on other drivers as well I can test it fully. Or feel fre=
e
to leave it to me, shouldn't be too difficult I think :).

For 0-2:

Reviewed-by: Lyude Paul <lyude@redhat.com>

>=20
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Karol Herbst <kherbst@redhat.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Wayne Lin <Wayne.Lin@amd.com>
> Cc: stable@vger.kernel.org # 6.1
> Cc: dri-devel@lists.freedesktop.org
> Reviewed-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c |  2 +-
>  drivers/gpu/drm/display/drm_dp_mst_topology.c | 26 ++++++++++---------
>  drivers/gpu/drm/i915/display/intel_dp_mst.c   |  4 ++-
>  drivers/gpu/drm/nouveau/dispnv50/disp.c       |  2 +-
>  include/drm/display/drm_dp_mst_helper.h       |  3 ++-
>  5 files changed, 21 insertions(+), 16 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/=
drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> index a50319fc42b11..180d3893b68da 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> @@ -208,7 +208,7 @@ bool dm_helpers_dp_mst_write_payload_allocation_table=
(
>  =09if (enable)
>  =09=09drm_dp_add_payload_part1(mst_mgr, mst_state, payload);
>  =09else
> -=09=09drm_dp_remove_payload(mst_mgr, mst_state, payload);
> +=09=09drm_dp_remove_payload(mst_mgr, mst_state, payload, payload);
> =20
>  =09/* mst_mgr->->payloads are VC payload notify MST branch using DPCD or
>  =09 * AUX message. The sequence is slot 1-63 allocated sequence for each
> diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/=
drm/display/drm_dp_mst_topology.c
> index 847c10aa2098c..1990ff5dc7ddd 100644
> --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> @@ -3342,7 +3342,8 @@ EXPORT_SYMBOL(drm_dp_add_payload_part1);
>   * drm_dp_remove_payload() - Remove an MST payload
>   * @mgr: Manager to use.
>   * @mst_state: The MST atomic state
> - * @payload: The payload to write
> + * @old_payload: The payload with its old state
> + * @new_payload: The payload to write
>   *
>   * Removes a payload from an MST topology if it was successfully assigne=
d a start slot. Also updates
>   * the starting time slots of all other payloads which would have been s=
hifted towards the start of
> @@ -3350,36 +3351,37 @@ EXPORT_SYMBOL(drm_dp_add_payload_part1);
>   */
>  void drm_dp_remove_payload(struct drm_dp_mst_topology_mgr *mgr,
>  =09=09=09   struct drm_dp_mst_topology_state *mst_state,
> -=09=09=09   struct drm_dp_mst_atomic_payload *payload)
> +=09=09=09   const struct drm_dp_mst_atomic_payload *old_payload,
> +=09=09=09   struct drm_dp_mst_atomic_payload *new_payload)
>  {
>  =09struct drm_dp_mst_atomic_payload *pos;
>  =09bool send_remove =3D false;
> =20
>  =09/* We failed to make the payload, so nothing to do */
> -=09if (payload->vc_start_slot =3D=3D -1)
> +=09if (new_payload->vc_start_slot =3D=3D -1)
>  =09=09return;
> =20
>  =09mutex_lock(&mgr->lock);
> -=09send_remove =3D drm_dp_mst_port_downstream_of_branch(payload->port, m=
gr->mst_primary);
> +=09send_remove =3D drm_dp_mst_port_downstream_of_branch(new_payload->por=
t, mgr->mst_primary);
>  =09mutex_unlock(&mgr->lock);
> =20
>  =09if (send_remove)
> -=09=09drm_dp_destroy_payload_step1(mgr, mst_state, payload);
> +=09=09drm_dp_destroy_payload_step1(mgr, mst_state, new_payload);
>  =09else
>  =09=09drm_dbg_kms(mgr->dev, "Payload for VCPI %d not in topology, not se=
nding remove\n",
> -=09=09=09    payload->vcpi);
> +=09=09=09    new_payload->vcpi);
> =20
>  =09list_for_each_entry(pos, &mst_state->payloads, next) {
> -=09=09if (pos !=3D payload && pos->vc_start_slot > payload->vc_start_slo=
t)
> -=09=09=09pos->vc_start_slot -=3D payload->time_slots;
> +=09=09if (pos !=3D new_payload && pos->vc_start_slot > new_payload->vc_s=
tart_slot)
> +=09=09=09pos->vc_start_slot -=3D old_payload->time_slots;
>  =09}
> -=09payload->vc_start_slot =3D -1;
> +=09new_payload->vc_start_slot =3D -1;
> =20
>  =09mgr->payload_count--;
> -=09mgr->next_start_slot -=3D payload->time_slots;
> +=09mgr->next_start_slot -=3D old_payload->time_slots;
> =20
> -=09if (payload->delete)
> -=09=09drm_dp_mst_put_port_malloc(payload->port);
> +=09if (new_payload->delete)
> +=09=09drm_dp_mst_put_port_malloc(new_payload->port);
>  }
>  EXPORT_SYMBOL(drm_dp_remove_payload);
> =20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/dr=
m/i915/display/intel_dp_mst.c
> index f3cb12dcfe0a7..dc4e5ff1dbb31 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -526,6 +526,8 @@ static void intel_mst_disable_dp(struct intel_atomic_=
state *state,
>  =09=09to_intel_connector(old_conn_state->connector);
>  =09struct drm_dp_mst_topology_state *mst_state =3D
>  =09=09drm_atomic_get_mst_topology_state(&state->base, &intel_dp->mst_mgr=
);
> +=09struct drm_dp_mst_atomic_payload *payload =3D
> +=09=09drm_atomic_get_mst_payload_state(mst_state, connector->port);
>  =09struct drm_i915_private *i915 =3D to_i915(connector->base.dev);
> =20
>  =09drm_dbg_kms(&i915->drm, "active links %d\n",
> @@ -534,7 +536,7 @@ static void intel_mst_disable_dp(struct intel_atomic_=
state *state,
>  =09intel_hdcp_disable(intel_mst->connector);
> =20
>  =09drm_dp_remove_payload(&intel_dp->mst_mgr, mst_state,
> -=09=09=09      drm_atomic_get_mst_payload_state(mst_state, connector->po=
rt));
> +=09=09=09      payload, payload);
> =20
>  =09intel_audio_codec_disable(encoder, old_crtc_state, old_conn_state);
>  }
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/no=
uveau/dispnv50/disp.c
> index edcb2529b4025..ed9d374147b8d 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> @@ -885,7 +885,7 @@ nv50_msto_prepare(struct drm_atomic_state *state,
> =20
>  =09// TODO: Figure out if we want to do a better job of handling VCPI al=
location failures here?
>  =09if (msto->disabled) {
> -=09=09drm_dp_remove_payload(mgr, mst_state, payload);
> +=09=09drm_dp_remove_payload(mgr, mst_state, payload, payload);
> =20
>  =09=09nvif_outp_dp_mst_vcpi(&mstm->outp->outp, msto->head->base.index, 0=
, 0, 0, 0);
>  =09} else {
> diff --git a/include/drm/display/drm_dp_mst_helper.h b/include/drm/displa=
y/drm_dp_mst_helper.h
> index 41fd8352ab656..f5eb9aa152b14 100644
> --- a/include/drm/display/drm_dp_mst_helper.h
> +++ b/include/drm/display/drm_dp_mst_helper.h
> @@ -841,7 +841,8 @@ int drm_dp_add_payload_part2(struct drm_dp_mst_topolo=
gy_mgr *mgr,
>  =09=09=09     struct drm_dp_mst_atomic_payload *payload);
>  void drm_dp_remove_payload(struct drm_dp_mst_topology_mgr *mgr,
>  =09=09=09   struct drm_dp_mst_topology_state *mst_state,
> -=09=09=09   struct drm_dp_mst_atomic_payload *payload);
> +=09=09=09   const struct drm_dp_mst_atomic_payload *old_payload,
> +=09=09=09   struct drm_dp_mst_atomic_payload *new_payload);
> =20
>  int drm_dp_check_act_status(struct drm_dp_mst_topology_mgr *mgr);
> =20

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

