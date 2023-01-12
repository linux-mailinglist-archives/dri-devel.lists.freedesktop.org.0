Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01FEC66852C
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 22:16:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D08910E12C;
	Thu, 12 Jan 2023 21:16:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B57110E088
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 21:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673558186;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R82DV3K2hp1E5fMuOP7wFBmJoSrXBxh+d6WiWfM24PM=;
 b=LUjEJrXuZCfRKVV07TUGGdKU+30Iw1sHiENVl45UATqFIOyPX2UjzFCQPzVNJPUs/YOfSi
 KmO3s6gkCpIyb5Ki+zgzPr+6vsnRqv++0ZK3qsgwZ/Fu6KYFX6zvtqGIeJpOk7r4BiJLJT
 oFBDfJPMBMj70bsyF4Ahx/0Pm/un8RA=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-175-kg6gzJ5cMmGmZApm7DEKaQ-1; Thu, 12 Jan 2023 16:16:22 -0500
X-MC-Unique: kg6gzJ5cMmGmZApm7DEKaQ-1
Received: by mail-qt1-f197.google.com with SMTP id
 e18-20020ac84912000000b003a96d6f436fso9407212qtq.0
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 13:16:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=33a74eDSTYehaGfAn/enobUTzEmdNrC9VwI5gUaFWbI=;
 b=vZL9CNZYLMAB0PqWXGPf8vnO+BegCFj0mCP1Otpnia/q8j4aN2Blj+vUrzVU48weni
 j9gk/sLWOk/jv+f9NE2Duqy4Wf39nAQ96TPJsCkO3yfjksEGtDKd/2Wwd2s17ch3o6Xl
 vmIuWTeQpbNdvhTfOdJXI7pC+v7+OXMYPKfzwwRZRrSfPUx0gCaOwNSQYFTM7b3qgqBa
 L053lHgaBr6IKBEJRzrblXE0YRmsVjTFCK/q8hJnNWv7HBEVwMj+KZPcjNTucSBxsAWf
 +ZC29Qnq8OjSLvILL62kVrGCKfZ4Ic7/A04OkACRPOqWPvqv2tnw3FttQrTueRtwgU6z
 wl3Q==
X-Gm-Message-State: AFqh2kpojF8pIPfrkyqcc0QQoaSupUUgHOH5LdIIXLo259QCkqb1+0AZ
 nQu/NedfIV3T/F3sLOuPQQpRbvKH0ALhhHI6GAFjk+8RR8J3jo/DT76RuWgYzR9ffpYXIL3VT/P
 trFQLoZm0jSgo/dGiwIwRgig78i4j
X-Received: by 2002:a05:622a:1b18:b0:3ac:4611:ef20 with SMTP id
 bb24-20020a05622a1b1800b003ac4611ef20mr27380750qtb.55.1673558181842; 
 Thu, 12 Jan 2023 13:16:21 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvEv8HbgYs1GqViZYxO2IFPXguApuXkgA8HolKp63rRIiQ5uCyMXycxiSTlFV72KjILfN/yEg==
X-Received: by 2002:a05:622a:1b18:b0:3ac:4611:ef20 with SMTP id
 bb24-20020a05622a1b1800b003ac4611ef20mr27380699qtb.55.1673558181270; 
 Thu, 12 Jan 2023 13:16:21 -0800 (PST)
Received: from ?IPv6:2600:4040:5c68:6800:3463:5df7:aced:152e?
 ([2600:4040:5c68:6800:3463:5df7:aced:152e])
 by smtp.gmail.com with ESMTPSA id
 u8-20020a37ab08000000b00702311aea78sm11361220qke.82.2023.01.12.13.16.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jan 2023 13:16:20 -0800 (PST)
Message-ID: <4a303c926dc63a4451a661cdb4b4777c8830a17c.camel@redhat.com>
Subject: Re: [PATCH] Revert "drm/display/dp_mst: Move all payload info into
 the atomic state"
From: Lyude Paul <lyude@redhat.com>
To: Wayne Lin <Wayne.Lin@amd.com>, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org
Date: Thu, 12 Jan 2023 16:16:19 -0500
In-Reply-To: <20230112085044.1706379-1-Wayne.Lin@amd.com>
References: <20230112085044.1706379-1-Wayne.Lin@amd.com>
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
Cc: stable@vger.kernel.org, stanislav.lisovskiy@intel.com, jerry.zuo@amd.com,
 mario.limonciello@amd.com, bskeggs@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Acked-by: Lyude Paul <lyude@redhat.com>

On Thu, 2023-01-12 at 16:50 +0800, Wayne Lin wrote:
> This reverts commit 4d07b0bc403403438d9cf88450506240c5faf92f.
>=20
> [Why]
> Changes cause regression on amdgpu mst.
> E.g.
> In fill_dc_mst_payload_table_from_drm(), amdgpu expects to add/remove pay=
load
> one by one and call fill_dc_mst_payload_table_from_drm() to update the HW
> maintained payload table. But previous change tries to go through all the
> payloads in mst_state and update amdpug hw maintained table in once every=
time
> driver only tries to add/remove a specific payload stream only. The newly
> design idea conflicts with the implementation in amdgpu nowadays.
>=20
> [How]
> Revert this patch first. After addressing all regression problems caused =
by
> this previous patch, will add it back and adjust it.
>=20
> Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2171
> Cc: stable@vger.kernel.org # 6.1
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Mario Limonciello <mario.limonciello@amd.com>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
> Cc: Fangzhi Zuo <Jerry.Zuo@amd.com>
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  53 +-
>  .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 106 ++-
>  .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |  87 ++-
>  .../amd/display/include/link_service_types.h  |   3 -
>  drivers/gpu/drm/display/drm_dp_mst_topology.c | 724 ++++++++++++------
>  drivers/gpu/drm/i915/display/intel_dp_mst.c   |  67 +-
>  drivers/gpu/drm/i915/display/intel_hdcp.c     |  24 +-
>  drivers/gpu/drm/nouveau/dispnv50/disp.c       | 167 ++--
>  include/drm/display/drm_dp_mst_helper.h       | 177 +++--
>  9 files changed, 878 insertions(+), 530 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/=
gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 77277d90b6e2..674f5dc1102b 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -6548,7 +6548,6 @@ static int dm_encoder_helper_atomic_check(struct dr=
m_encoder *encoder,
>  =09const struct drm_display_mode *adjusted_mode =3D &crtc_state->adjuste=
d_mode;
>  =09struct drm_dp_mst_topology_mgr *mst_mgr;
>  =09struct drm_dp_mst_port *mst_port;
> -=09struct drm_dp_mst_topology_state *mst_state;
>  =09enum dc_color_depth color_depth;
>  =09int clock, bpp =3D 0;
>  =09bool is_y420 =3D false;
> @@ -6562,13 +6561,6 @@ static int dm_encoder_helper_atomic_check(struct d=
rm_encoder *encoder,
>  =09if (!crtc_state->connectors_changed && !crtc_state->mode_changed)
>  =09=09return 0;
> =20
> -=09mst_state =3D drm_atomic_get_mst_topology_state(state, mst_mgr);
> -=09if (IS_ERR(mst_state))
> -=09=09return PTR_ERR(mst_state);
> -
> -=09if (!mst_state->pbn_div)
> -=09=09mst_state->pbn_div =3D dm_mst_get_pbn_divider(aconnector->mst_port=
->dc_link);
> -
>  =09if (!state->duplicated) {
>  =09=09int max_bpc =3D conn_state->max_requested_bpc;
>  =09=09is_y420 =3D drm_mode_is_420_also(&connector->display_info, adjuste=
d_mode) &&
> @@ -6580,10 +6572,11 @@ static int dm_encoder_helper_atomic_check(struct =
drm_encoder *encoder,
>  =09=09clock =3D adjusted_mode->clock;
>  =09=09dm_new_connector_state->pbn =3D drm_dp_calc_pbn_mode(clock, bpp, f=
alse);
>  =09}
> -
> -=09dm_new_connector_state->vcpi_slots =3D
> -=09=09drm_dp_atomic_find_time_slots(state, mst_mgr, mst_port,
> -=09=09=09=09=09      dm_new_connector_state->pbn);
> +=09dm_new_connector_state->vcpi_slots =3D drm_dp_atomic_find_time_slots(=
state,
> +=09=09=09=09=09=09=09=09=09   mst_mgr,
> +=09=09=09=09=09=09=09=09=09   mst_port,
> +=09=09=09=09=09=09=09=09=09   dm_new_connector_state->pbn,
> +=09=09=09=09=09=09=09=09=09   dm_mst_get_pbn_divider(aconnector->dc_link=
));
>  =09if (dm_new_connector_state->vcpi_slots < 0) {
>  =09=09DRM_DEBUG_ATOMIC("failed finding vcpi slots: %d\n", (int)dm_new_co=
nnector_state->vcpi_slots);
>  =09=09return dm_new_connector_state->vcpi_slots;
> @@ -6654,14 +6647,17 @@ static int dm_update_mst_vcpi_slots_for_dsc(struc=
t drm_atomic_state *state,
>  =09=09=09dm_conn_state->vcpi_slots =3D slot_num;
> =20
>  =09=09=09ret =3D drm_dp_mst_atomic_enable_dsc(state, aconnector->port,
> -=09=09=09=09=09=09=09   dm_conn_state->pbn, false);
> +=09=09=09=09=09=09=09   dm_conn_state->pbn, 0, false);
>  =09=09=09if (ret < 0)
>  =09=09=09=09return ret;
> =20
>  =09=09=09continue;
>  =09=09}
> =20
> -=09=09vcpi =3D drm_dp_mst_atomic_enable_dsc(state, aconnector->port, pbn=
, true);
> +=09=09vcpi =3D drm_dp_mst_atomic_enable_dsc(state,
> +=09=09=09=09=09=09    aconnector->port,
> +=09=09=09=09=09=09    pbn, pbn_div,
> +=09=09=09=09=09=09    true);
>  =09=09if (vcpi < 0)
>  =09=09=09return vcpi;
> =20
> @@ -9497,6 +9493,8 @@ static int amdgpu_dm_atomic_check(struct drm_device=
 *dev,
>  =09struct dm_crtc_state *dm_old_crtc_state, *dm_new_crtc_state;
>  #if defined(CONFIG_DRM_AMD_DC_DCN)
>  =09struct dsc_mst_fairness_vars vars[MAX_PIPES];
> +=09struct drm_dp_mst_topology_state *mst_state;
> +=09struct drm_dp_mst_topology_mgr *mgr;
>  #endif
> =20
>  =09trace_amdgpu_dm_atomic_check_begin(state);
> @@ -9744,6 +9742,33 @@ static int amdgpu_dm_atomic_check(struct drm_devic=
e *dev,
>  =09=09lock_and_validation_needed =3D true;
>  =09}
> =20
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +=09/* set the slot info for each mst_state based on the link encoding fo=
rmat */
> +=09for_each_new_mst_mgr_in_state(state, mgr, mst_state, i) {
> +=09=09struct amdgpu_dm_connector *aconnector;
> +=09=09struct drm_connector *connector;
> +=09=09struct drm_connector_list_iter iter;
> +=09=09u8 link_coding_cap;
> +
> +=09=09if (!mgr->mst_state )
> +=09=09=09continue;
> +
> +=09=09drm_connector_list_iter_begin(dev, &iter);
> +=09=09drm_for_each_connector_iter(connector, &iter) {
> +=09=09=09int id =3D connector->index;
> +
> +=09=09=09if (id =3D=3D mst_state->mgr->conn_base_id) {
> +=09=09=09=09aconnector =3D to_amdgpu_dm_connector(connector);
> +=09=09=09=09link_coding_cap =3D dc_link_dp_mst_decide_link_encoding_form=
at(aconnector->dc_link);
> +=09=09=09=09drm_dp_mst_update_slots(mst_state, link_coding_cap);
> +
> +=09=09=09=09break;
> +=09=09=09}
> +=09=09}
> +=09=09drm_connector_list_iter_end(&iter);
> +
> +=09}
> +#endif
>  =09/**
>  =09 * Streams and planes are reset when there are changes that affect
>  =09 * bandwidth. Anything that affects bandwidth needs to go through
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/=
drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> index 6994c9a1ed85..ac5a8cad0695 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> @@ -27,7 +27,6 @@
>  #include <linux/acpi.h>
>  #include <linux/i2c.h>
> =20
> -#include <drm/drm_atomic.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/amdgpu_drm.h>
>  #include <drm/drm_edid.h>
> @@ -120,27 +119,40 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
>  }
> =20
>  static void
> -fill_dc_mst_payload_table_from_drm(struct drm_dp_mst_topology_state *mst=
_state,
> -=09=09=09=09   struct amdgpu_dm_connector *aconnector,
> -=09=09=09=09   struct dc_dp_mst_stream_allocation_table *table)
> -{
> -=09struct dc_dp_mst_stream_allocation_table new_table =3D { 0 };
> -=09struct dc_dp_mst_stream_allocation *sa;
> -=09struct drm_dp_mst_atomic_payload *payload;
> -
> -=09/* Fill payload info*/
> -=09list_for_each_entry(payload, &mst_state->payloads, next) {
> -=09=09if (payload->delete)
> -=09=09=09continue;
> -
> -=09=09sa =3D &new_table.stream_allocations[new_table.stream_count];
> -=09=09sa->slot_count =3D payload->time_slots;
> -=09=09sa->vcp_id =3D payload->vcpi;
> -=09=09new_table.stream_count++;
> +fill_dc_mst_payload_table_from_drm(struct amdgpu_dm_connector *aconnecto=
r,
> +=09=09=09=09   struct dc_dp_mst_stream_allocation_table *proposed_table)
> +{
> +=09int i;
> +=09struct drm_dp_mst_topology_mgr *mst_mgr =3D
> +=09=09=09&aconnector->mst_port->mst_mgr;
> +
> +=09mutex_lock(&mst_mgr->payload_lock);
> +
> +=09proposed_table->stream_count =3D 0;
> +
> +=09/* number of active streams */
> +=09for (i =3D 0; i < mst_mgr->max_payloads; i++) {
> +=09=09if (mst_mgr->payloads[i].num_slots =3D=3D 0)
> +=09=09=09break; /* end of vcp_id table */
> +
> +=09=09ASSERT(mst_mgr->payloads[i].payload_state !=3D
> +=09=09=09=09DP_PAYLOAD_DELETE_LOCAL);
> +
> +=09=09if (mst_mgr->payloads[i].payload_state =3D=3D DP_PAYLOAD_LOCAL ||
> +=09=09=09mst_mgr->payloads[i].payload_state =3D=3D
> +=09=09=09=09=09DP_PAYLOAD_REMOTE) {
> +
> +=09=09=09struct dc_dp_mst_stream_allocation *sa =3D
> +=09=09=09=09=09&proposed_table->stream_allocations[
> +=09=09=09=09=09=09proposed_table->stream_count];
> +
> +=09=09=09sa->slot_count =3D mst_mgr->payloads[i].num_slots;
> +=09=09=09sa->vcp_id =3D mst_mgr->proposed_vcpis[i]->vcpi;
> +=09=09=09proposed_table->stream_count++;
> +=09=09}
>  =09}
> =20
> -=09/* Overwrite the old table */
> -=09*table =3D new_table;
> +=09mutex_unlock(&mst_mgr->payload_lock);
>  }
> =20
>  void dm_helpers_dp_update_branch_info(
> @@ -158,9 +170,11 @@ bool dm_helpers_dp_mst_write_payload_allocation_tabl=
e(
>  =09=09bool enable)
>  {
>  =09struct amdgpu_dm_connector *aconnector;
> -=09struct drm_dp_mst_topology_state *mst_state;
> -=09struct drm_dp_mst_atomic_payload *payload;
> +=09struct dm_connector_state *dm_conn_state;
>  =09struct drm_dp_mst_topology_mgr *mst_mgr;
> +=09struct drm_dp_mst_port *mst_port;
> +=09bool ret;
> +=09u8 link_coding_cap =3D DP_8b_10b_ENCODING;
> =20
>  =09aconnector =3D (struct amdgpu_dm_connector *)stream->dm_stream_contex=
t;
>  =09/* Accessing the connector state is required for vcpi_slots allocatio=
n
> @@ -171,21 +185,40 @@ bool dm_helpers_dp_mst_write_payload_allocation_tab=
le(
>  =09if (!aconnector || !aconnector->mst_port)
>  =09=09return false;
> =20
> +=09dm_conn_state =3D to_dm_connector_state(aconnector->base.state);
> +
>  =09mst_mgr =3D &aconnector->mst_port->mst_mgr;
> -=09mst_state =3D to_drm_dp_mst_topology_state(mst_mgr->base.state);
> +
> +=09if (!mst_mgr->mst_state)
> +=09=09return false;
> +
> +=09mst_port =3D aconnector->port;
> +
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +=09link_coding_cap =3D dc_link_dp_mst_decide_link_encoding_format(aconne=
ctor->dc_link);
> +#endif
> +
> +=09if (enable) {
> +
> +=09=09ret =3D drm_dp_mst_allocate_vcpi(mst_mgr, mst_port,
> +=09=09=09=09=09       dm_conn_state->pbn,
> +=09=09=09=09=09       dm_conn_state->vcpi_slots);
> +=09=09if (!ret)
> +=09=09=09return false;
> +
> +=09} else {
> +=09=09drm_dp_mst_reset_vcpi_slots(mst_mgr, mst_port);
> +=09}
> =20
>  =09/* It's OK for this to fail */
> -=09payload =3D drm_atomic_get_mst_payload_state(mst_state, aconnector->p=
ort);
> -=09if (enable)
> -=09=09drm_dp_add_payload_part1(mst_mgr, mst_state, payload);
> -=09else
> -=09=09drm_dp_remove_payload(mst_mgr, mst_state, payload);
> +=09drm_dp_update_payload_part1(mst_mgr, (link_coding_cap =3D=3D DP_CAP_A=
NSI_128B132B) ? 0:1);
> =20
>  =09/* mst_mgr->->payloads are VC payload notify MST branch using DPCD or
>  =09 * AUX message. The sequence is slot 1-63 allocated sequence for each
>  =09 * stream. AMD ASIC stream slot allocation should follow the same
>  =09 * sequence. copy DRM MST allocation to dc */
> -=09fill_dc_mst_payload_table_from_drm(mst_state, aconnector, proposed_ta=
ble);
> +
> +=09fill_dc_mst_payload_table_from_drm(aconnector, proposed_table);
> =20
>  =09return true;
>  }
> @@ -242,9 +275,8 @@ bool dm_helpers_dp_mst_send_payload_allocation(
>  =09=09bool enable)
>  {
>  =09struct amdgpu_dm_connector *aconnector;
> -=09struct drm_dp_mst_topology_state *mst_state;
>  =09struct drm_dp_mst_topology_mgr *mst_mgr;
> -=09struct drm_dp_mst_atomic_payload *payload;
> +=09struct drm_dp_mst_port *mst_port;
>  =09enum mst_progress_status set_flag =3D MST_ALLOCATE_NEW_PAYLOAD;
>  =09enum mst_progress_status clr_flag =3D MST_CLEAR_ALLOCATED_PAYLOAD;
> =20
> @@ -253,16 +285,19 @@ bool dm_helpers_dp_mst_send_payload_allocation(
>  =09if (!aconnector || !aconnector->mst_port)
>  =09=09return false;
> =20
> +=09mst_port =3D aconnector->port;
> +
>  =09mst_mgr =3D &aconnector->mst_port->mst_mgr;
> -=09mst_state =3D to_drm_dp_mst_topology_state(mst_mgr->base.state);
> =20
> -=09payload =3D drm_atomic_get_mst_payload_state(mst_state, aconnector->p=
ort);
> +=09if (!mst_mgr->mst_state)
> +=09=09return false;
> +
>  =09if (!enable) {
>  =09=09set_flag =3D MST_CLEAR_ALLOCATED_PAYLOAD;
>  =09=09clr_flag =3D MST_ALLOCATE_NEW_PAYLOAD;
>  =09}
> =20
> -=09if (enable && drm_dp_add_payload_part2(mst_mgr, mst_state->base.state=
, payload)) {
> +=09if (drm_dp_update_payload_part2(mst_mgr)) {
>  =09=09amdgpu_dm_set_mst_status(&aconnector->mst_status,
>  =09=09=09set_flag, false);
>  =09} else {
> @@ -272,6 +307,9 @@ bool dm_helpers_dp_mst_send_payload_allocation(
>  =09=09=09clr_flag, false);
>  =09}
> =20
> +=09if (!enable)
> +=09=09drm_dp_mst_deallocate_vcpi(mst_mgr, mst_port);
> +
>  =09return true;
>  }
> =20
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c =
b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> index 1edf7385f8d8..6207026a200f 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> @@ -598,8 +598,15 @@ void amdgpu_dm_initialize_dp_connector(struct amdgpu=
_display_manager *dm,
> =20
>  =09dc_link_dp_get_max_link_enc_cap(aconnector->dc_link, &max_link_enc_ca=
p);
>  =09aconnector->mst_mgr.cbs =3D &dm_mst_cbs;
> -=09drm_dp_mst_topology_mgr_init(&aconnector->mst_mgr, adev_to_drm(dm->ad=
ev),
> -=09=09=09=09     &aconnector->dm_dp_aux.aux, 16, 4, aconnector->connecto=
r_id);
> +=09drm_dp_mst_topology_mgr_init(
> +=09=09&aconnector->mst_mgr,
> +=09=09adev_to_drm(dm->adev),
> +=09=09&aconnector->dm_dp_aux.aux,
> +=09=0916,
> +=09=094,
> +=09=09max_link_enc_cap.lane_count,
> +=09=09drm_dp_bw_code_to_link_rate(max_link_enc_cap.link_rate),
> +=09=09aconnector->connector_id);
> =20
>  =09drm_connector_attach_dp_subconnector_property(&aconnector->base);
>  }
> @@ -710,13 +717,12 @@ static int bpp_x16_from_pbn(struct dsc_mst_fairness=
_params param, int pbn)
>  =09return dsc_config.bits_per_pixel;
>  }
> =20
> -static int increase_dsc_bpp(struct drm_atomic_state *state,
> -=09=09=09    struct drm_dp_mst_topology_state *mst_state,
> -=09=09=09    struct dc_link *dc_link,
> -=09=09=09    struct dsc_mst_fairness_params *params,
> -=09=09=09    struct dsc_mst_fairness_vars *vars,
> -=09=09=09    int count,
> -=09=09=09    int k)
> +static bool increase_dsc_bpp(struct drm_atomic_state *state,
> +=09=09=09     struct dc_link *dc_link,
> +=09=09=09     struct dsc_mst_fairness_params *params,
> +=09=09=09     struct dsc_mst_fairness_vars *vars,
> +=09=09=09     int count,
> +=09=09=09     int k)
>  {
>  =09int i;
>  =09bool bpp_increased[MAX_PIPES];
> @@ -724,10 +730,13 @@ static int increase_dsc_bpp(struct drm_atomic_state=
 *state,
>  =09int min_initial_slack;
>  =09int next_index;
>  =09int remaining_to_increase =3D 0;
> +=09int pbn_per_timeslot;
>  =09int link_timeslots_used;
>  =09int fair_pbn_alloc;
>  =09int ret =3D 0;
> =20
> +=09pbn_per_timeslot =3D dm_mst_get_pbn_divider(dc_link);
> +
>  =09for (i =3D 0; i < count; i++) {
>  =09=09if (vars[i + k].dsc_enabled) {
>  =09=09=09initial_slack[i] =3D
> @@ -758,17 +767,18 @@ static int increase_dsc_bpp(struct drm_atomic_state=
 *state,
>  =09=09link_timeslots_used =3D 0;
> =20
>  =09=09for (i =3D 0; i < count; i++)
> -=09=09=09link_timeslots_used +=3D DIV_ROUND_UP(vars[i + k].pbn, mst_stat=
e->pbn_div);
> +=09=09=09link_timeslots_used +=3D DIV_ROUND_UP(vars[i + k].pbn, pbn_per_=
timeslot);
> =20
> -=09=09fair_pbn_alloc =3D
> -=09=09=09(63 - link_timeslots_used) / remaining_to_increase * mst_state-=
>pbn_div;
> +=09=09fair_pbn_alloc =3D (63 - link_timeslots_used) / remaining_to_incre=
ase * pbn_per_timeslot;
> =20
>  =09=09if (initial_slack[next_index] > fair_pbn_alloc) {
>  =09=09=09vars[next_index].pbn +=3D fair_pbn_alloc;
> +
>  =09=09=09ret =3D drm_dp_atomic_find_time_slots(state,
>  =09=09=09=09=09=09=09    params[next_index].port->mgr,
>  =09=09=09=09=09=09=09    params[next_index].port,
> -=09=09=09=09=09=09=09    vars[next_index].pbn);
> +=09=09=09=09=09=09=09    vars[next_index].pbn,
> +=09=09=09=09=09=09=09    pbn_per_timeslot);
>  =09=09=09if (ret < 0)
>  =09=09=09=09return ret;
> =20
> @@ -780,7 +790,8 @@ static int increase_dsc_bpp(struct drm_atomic_state *=
state,
>  =09=09=09=09ret =3D drm_dp_atomic_find_time_slots(state,
>  =09=09=09=09=09=09=09=09    params[next_index].port->mgr,
>  =09=09=09=09=09=09=09=09    params[next_index].port,
> -=09=09=09=09=09=09=09=09    vars[next_index].pbn);
> +=09=09=09=09=09=09=09=09    vars[next_index].pbn,
> +=09=09=09=09=09=09=09=09    pbn_per_timeslot);
>  =09=09=09=09if (ret < 0)
>  =09=09=09=09=09return ret;
>  =09=09=09}
> @@ -789,7 +800,8 @@ static int increase_dsc_bpp(struct drm_atomic_state *=
state,
>  =09=09=09ret =3D drm_dp_atomic_find_time_slots(state,
>  =09=09=09=09=09=09=09    params[next_index].port->mgr,
>  =09=09=09=09=09=09=09    params[next_index].port,
> -=09=09=09=09=09=09=09    vars[next_index].pbn);
> +=09=09=09=09=09=09=09    vars[next_index].pbn,
> +=09=09=09=09=09=09=09    pbn_per_timeslot);
>  =09=09=09if (ret < 0)
>  =09=09=09=09return ret;
> =20
> @@ -801,7 +813,8 @@ static int increase_dsc_bpp(struct drm_atomic_state *=
state,
>  =09=09=09=09ret =3D drm_dp_atomic_find_time_slots(state,
>  =09=09=09=09=09=09=09=09    params[next_index].port->mgr,
>  =09=09=09=09=09=09=09=09    params[next_index].port,
> -=09=09=09=09=09=09=09=09    vars[next_index].pbn);
> +=09=09=09=09=09=09=09=09    vars[next_index].pbn,
> +=09=09=09=09=09=09=09=09    pbn_per_timeslot);
>  =09=09=09=09if (ret < 0)
>  =09=09=09=09=09return ret;
>  =09=09=09}
> @@ -857,10 +870,12 @@ static int try_disable_dsc(struct drm_atomic_state =
*state,
>  =09=09=09break;
> =20
>  =09=09vars[next_index].pbn =3D kbps_to_peak_pbn(params[next_index].bw_ra=
nge.stream_kbps);
> +
>  =09=09ret =3D drm_dp_atomic_find_time_slots(state,
>  =09=09=09=09=09=09    params[next_index].port->mgr,
>  =09=09=09=09=09=09    params[next_index].port,
> -=09=09=09=09=09=09    vars[next_index].pbn);
> +=09=09=09=09=09=09    vars[next_index].pbn,
> +=09=09=09=09=09=09    dm_mst_get_pbn_divider(dc_link));
>  =09=09if (ret < 0)
>  =09=09=09return ret;
> =20
> @@ -870,10 +885,12 @@ static int try_disable_dsc(struct drm_atomic_state =
*state,
>  =09=09=09vars[next_index].bpp_x16 =3D 0;
>  =09=09} else {
>  =09=09=09vars[next_index].pbn =3D kbps_to_peak_pbn(params[next_index].bw=
_range.max_kbps);
> +
>  =09=09=09ret =3D drm_dp_atomic_find_time_slots(state,
>  =09=09=09=09=09=09=09    params[next_index].port->mgr,
>  =09=09=09=09=09=09=09    params[next_index].port,
> -=09=09=09=09=09=09=09    vars[next_index].pbn);
> +=09=09=09=09=09=09=09    vars[next_index].pbn,
> +=09=09=09=09=09=09=09    dm_mst_get_pbn_divider(dc_link));
>  =09=09=09if (ret < 0)
>  =09=09=09=09return ret;
>  =09=09}
> @@ -884,31 +901,21 @@ static int try_disable_dsc(struct drm_atomic_state =
*state,
>  =09return 0;
>  }
> =20
> -static int compute_mst_dsc_configs_for_link(struct drm_atomic_state *sta=
te,
> -=09=09=09=09=09    struct dc_state *dc_state,
> -=09=09=09=09=09    struct dc_link *dc_link,
> -=09=09=09=09=09    struct dsc_mst_fairness_vars *vars,
> -=09=09=09=09=09    struct drm_dp_mst_topology_mgr *mgr,
> -=09=09=09=09=09    int *link_vars_start_index)
> +static bool compute_mst_dsc_configs_for_link(struct drm_atomic_state *st=
ate,
> +=09=09=09=09=09     struct dc_state *dc_state,
> +=09=09=09=09=09     struct dc_link *dc_link,
> +=09=09=09=09=09     struct dsc_mst_fairness_vars *vars,
> +=09=09=09=09=09     int *link_vars_start_index)
>  {
> +=09int i, k, ret;
>  =09struct dc_stream_state *stream;
>  =09struct dsc_mst_fairness_params params[MAX_PIPES];
>  =09struct amdgpu_dm_connector *aconnector;
> -=09struct drm_dp_mst_topology_state *mst_state =3D drm_atomic_get_mst_to=
pology_state(state, mgr);
>  =09int count =3D 0;
> -=09int i, k, ret;
>  =09bool debugfs_overwrite =3D false;
> =20
>  =09memset(params, 0, sizeof(params));
> =20
> -=09if (IS_ERR(mst_state))
> -=09=09return PTR_ERR(mst_state);
> -
> -=09mst_state->pbn_div =3D dm_mst_get_pbn_divider(dc_link);
> -#if defined(CONFIG_DRM_AMD_DC_DCN)
> -=09drm_dp_mst_update_slots(mst_state, dc_link_dp_mst_decide_link_encodin=
g_format(dc_link));
> -#endif
> -
>  =09/* Set up params */
>  =09for (i =3D 0; i < dc_state->stream_count; i++) {
>  =09=09struct dc_dsc_policy dsc_policy =3D {0};
> @@ -968,7 +975,7 @@ static int compute_mst_dsc_configs_for_link(struct dr=
m_atomic_state *state,
>  =09=09vars[i + k].dsc_enabled =3D false;
>  =09=09vars[i + k].bpp_x16 =3D 0;
>  =09=09ret =3D drm_dp_atomic_find_time_slots(state, params[i].port->mgr, =
params[i].port,
> -=09=09=09=09=09=09    vars[i + k].pbn);
> +=09=09=09=09=09=09    vars[i + k].pbn, dm_mst_get_pbn_divider(dc_link));
>  =09=09if (ret < 0)
>  =09=09=09return ret;
>  =09}
> @@ -987,7 +994,7 @@ static int compute_mst_dsc_configs_for_link(struct dr=
m_atomic_state *state,
>  =09=09=09vars[i + k].dsc_enabled =3D true;
>  =09=09=09vars[i + k].bpp_x16 =3D params[i].bw_range.min_target_bpp_x16;
>  =09=09=09ret =3D drm_dp_atomic_find_time_slots(state, params[i].port->mg=
r,
> -=09=09=09=09=09=09=09    params[i].port, vars[i + k].pbn);
> +=09=09=09=09=09=09=09    params[i].port, vars[i + k].pbn, dm_mst_get_pbn=
_divider(dc_link));
>  =09=09=09if (ret < 0)
>  =09=09=09=09return ret;
>  =09=09} else {
> @@ -995,7 +1002,7 @@ static int compute_mst_dsc_configs_for_link(struct d=
rm_atomic_state *state,
>  =09=09=09vars[i + k].dsc_enabled =3D false;
>  =09=09=09vars[i + k].bpp_x16 =3D 0;
>  =09=09=09ret =3D drm_dp_atomic_find_time_slots(state, params[i].port->mg=
r,
> -=09=09=09=09=09=09=09    params[i].port, vars[i + k].pbn);
> +=09=09=09=09=09=09=09    params[i].port, vars[i + k].pbn, dm_mst_get_pbn=
_divider(dc_link));
>  =09=09=09if (ret < 0)
>  =09=09=09=09return ret;
>  =09=09}
> @@ -1005,7 +1012,7 @@ static int compute_mst_dsc_configs_for_link(struct =
drm_atomic_state *state,
>  =09=09return ret;
> =20
>  =09/* Optimize degree of compression */
> -=09ret =3D increase_dsc_bpp(state, mst_state, dc_link, params, vars, cou=
nt, k);
> +=09ret =3D increase_dsc_bpp(state, dc_link, params, vars, count, k);
>  =09if (ret < 0)
>  =09=09return ret;
> =20
> @@ -1155,7 +1162,7 @@ int compute_mst_dsc_configs_for_state(struct drm_at=
omic_state *state,
>  =09=09=09continue;
> =20
>  =09=09mst_mgr =3D aconnector->port->mgr;
> -=09=09ret =3D compute_mst_dsc_configs_for_link(state, dc_state, stream->=
link, vars, mst_mgr,
> +=09=09ret =3D compute_mst_dsc_configs_for_link(state, dc_state, stream->=
link, vars,
>  =09=09=09=09=09=09       &link_vars_start_index);
>  =09=09if (ret !=3D 0)
>  =09=09=09return ret;
> @@ -1213,7 +1220,7 @@ static int pre_compute_mst_dsc_configs_for_state(st=
ruct drm_atomic_state *state,
>  =09=09=09continue;
> =20
>  =09=09mst_mgr =3D aconnector->port->mgr;
> -=09=09ret =3D compute_mst_dsc_configs_for_link(state, dc_state, stream->=
link, vars, mst_mgr,
> +=09=09ret =3D compute_mst_dsc_configs_for_link(state, dc_state, stream->=
link, vars,
>  =09=09=09=09=09=09       &link_vars_start_index);
>  =09=09if (ret !=3D 0)
>  =09=09=09return ret;
> diff --git a/drivers/gpu/drm/amd/display/include/link_service_types.h b/d=
rivers/gpu/drm/amd/display/include/link_service_types.h
> index d1e91d31d151..0889c2a86733 100644
> --- a/drivers/gpu/drm/amd/display/include/link_service_types.h
> +++ b/drivers/gpu/drm/amd/display/include/link_service_types.h
> @@ -252,9 +252,6 @@ union dpcd_training_lane_set {
>   * _ONLY_ be filled out from DM and then passed to DC, do NOT use these =
for _any_ kind of atomic
>   * state calculations in DM, or you will break something.
>   */
> -
> -struct drm_dp_mst_port;
> -
>  /* DP MST stream allocation (payload bandwidth number) */
>  struct dc_dp_mst_stream_allocation {
>  =09uint8_t vcp_id;
> diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/=
drm/display/drm_dp_mst_topology.c
> index 51a46689cda7..95ff57d20216 100644
> --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> @@ -68,7 +68,8 @@ static bool dump_dp_payload_table(struct drm_dp_mst_top=
ology_mgr *mgr,
>  static void drm_dp_mst_topology_put_port(struct drm_dp_mst_port *port);
> =20
>  static int drm_dp_dpcd_write_payload(struct drm_dp_mst_topology_mgr *mgr=
,
> -=09=09=09=09     int id, u8 start_slot, u8 num_slots);
> +=09=09=09=09     int id,
> +=09=09=09=09     struct drm_dp_payload *payload);
> =20
>  static int drm_dp_send_dpcd_read(struct drm_dp_mst_topology_mgr *mgr,
>  =09=09=09=09 struct drm_dp_mst_port *port,
> @@ -1234,6 +1235,57 @@ build_query_stream_enc_status(struct drm_dp_sideba=
nd_msg_tx *msg, u8 stream_id,
>  =09return 0;
>  }
> =20
> +static int drm_dp_mst_assign_payload_id(struct drm_dp_mst_topology_mgr *=
mgr,
> +=09=09=09=09=09struct drm_dp_vcpi *vcpi)
> +{
> +=09int ret, vcpi_ret;
> +
> +=09mutex_lock(&mgr->payload_lock);
> +=09ret =3D find_first_zero_bit(&mgr->payload_mask, mgr->max_payloads + 1=
);
> +=09if (ret > mgr->max_payloads) {
> +=09=09ret =3D -EINVAL;
> +=09=09drm_dbg_kms(mgr->dev, "out of payload ids %d\n", ret);
> +=09=09goto out_unlock;
> +=09}
> +
> +=09vcpi_ret =3D find_first_zero_bit(&mgr->vcpi_mask, mgr->max_payloads +=
 1);
> +=09if (vcpi_ret > mgr->max_payloads) {
> +=09=09ret =3D -EINVAL;
> +=09=09drm_dbg_kms(mgr->dev, "out of vcpi ids %d\n", ret);
> +=09=09goto out_unlock;
> +=09}
> +
> +=09set_bit(ret, &mgr->payload_mask);
> +=09set_bit(vcpi_ret, &mgr->vcpi_mask);
> +=09vcpi->vcpi =3D vcpi_ret + 1;
> +=09mgr->proposed_vcpis[ret - 1] =3D vcpi;
> +out_unlock:
> +=09mutex_unlock(&mgr->payload_lock);
> +=09return ret;
> +}
> +
> +static void drm_dp_mst_put_payload_id(struct drm_dp_mst_topology_mgr *mg=
r,
> +=09=09=09=09      int vcpi)
> +{
> +=09int i;
> +
> +=09if (vcpi =3D=3D 0)
> +=09=09return;
> +
> +=09mutex_lock(&mgr->payload_lock);
> +=09drm_dbg_kms(mgr->dev, "putting payload %d\n", vcpi);
> +=09clear_bit(vcpi - 1, &mgr->vcpi_mask);
> +
> +=09for (i =3D 0; i < mgr->max_payloads; i++) {
> +=09=09if (mgr->proposed_vcpis[i] &&
> +=09=09    mgr->proposed_vcpis[i]->vcpi =3D=3D vcpi) {
> +=09=09=09mgr->proposed_vcpis[i] =3D NULL;
> +=09=09=09clear_bit(i + 1, &mgr->payload_mask);
> +=09=09}
> +=09}
> +=09mutex_unlock(&mgr->payload_lock);
> +}
> +
>  static bool check_txmsg_state(struct drm_dp_mst_topology_mgr *mgr,
>  =09=09=09      struct drm_dp_sideband_msg_tx *txmsg)
>  {
> @@ -1686,7 +1738,7 @@ drm_dp_mst_dump_port_topology_history(struct drm_dp=
_mst_port *port) {}
>  #define save_port_topology_ref(port, type)
>  #endif
> =20
> -struct drm_dp_mst_atomic_payload *
> +static struct drm_dp_mst_atomic_payload *
>  drm_atomic_get_mst_payload_state(struct drm_dp_mst_topology_state *state=
,
>  =09=09=09=09 struct drm_dp_mst_port *port)
>  {
> @@ -1698,7 +1750,6 @@ drm_atomic_get_mst_payload_state(struct drm_dp_mst_=
topology_state *state,
> =20
>  =09return NULL;
>  }
> -EXPORT_SYMBOL(drm_atomic_get_mst_payload_state);
> =20
>  static void drm_dp_destroy_mst_branch_device(struct kref *kref)
>  {
> @@ -3201,8 +3252,6 @@ int drm_dp_send_query_stream_enc_status(struct drm_=
dp_mst_topology_mgr *mgr,
>  =09=09struct drm_dp_mst_port *port,
>  =09=09struct drm_dp_query_stream_enc_status_ack_reply *status)
>  {
> -=09struct drm_dp_mst_topology_state *state;
> -=09struct drm_dp_mst_atomic_payload *payload;
>  =09struct drm_dp_sideband_msg_tx *txmsg;
>  =09u8 nonce[7];
>  =09int ret;
> @@ -3219,10 +3268,6 @@ int drm_dp_send_query_stream_enc_status(struct drm=
_dp_mst_topology_mgr *mgr,
> =20
>  =09get_random_bytes(nonce, sizeof(nonce));
> =20
> -=09drm_modeset_lock(&mgr->base.lock, NULL);
> -=09state =3D to_drm_dp_mst_topology_state(mgr->base.state);
> -=09payload =3D drm_atomic_get_mst_payload_state(state, port);
> -
>  =09/*
>  =09 * "Source device targets the QUERY_STREAM_ENCRYPTION_STATUS message
>  =09 *  transaction at the MST Branch device directly connected to the
> @@ -3230,7 +3275,7 @@ int drm_dp_send_query_stream_enc_status(struct drm_=
dp_mst_topology_mgr *mgr,
>  =09 */
>  =09txmsg->dst =3D mgr->mst_primary;
> =20
> -=09build_query_stream_enc_status(txmsg, payload->vcpi, nonce);
> +=09build_query_stream_enc_status(txmsg, port->vcpi.vcpi, nonce);
> =20
>  =09drm_dp_queue_down_tx(mgr, txmsg);
> =20
> @@ -3247,7 +3292,6 @@ int drm_dp_send_query_stream_enc_status(struct drm_=
dp_mst_topology_mgr *mgr,
>  =09memcpy(status, &txmsg->reply.u.enc_status, sizeof(*status));
> =20
>  out:
> -=09drm_modeset_unlock(&mgr->base.lock);
>  =09drm_dp_mst_topology_put_port(port);
>  out_get_port:
>  =09kfree(txmsg);
> @@ -3256,162 +3300,238 @@ int drm_dp_send_query_stream_enc_status(struct =
drm_dp_mst_topology_mgr *mgr,
>  EXPORT_SYMBOL(drm_dp_send_query_stream_enc_status);
> =20
>  static int drm_dp_create_payload_step1(struct drm_dp_mst_topology_mgr *m=
gr,
> -=09=09=09=09       struct drm_dp_mst_atomic_payload *payload)
> +=09=09=09=09       int id,
> +=09=09=09=09       struct drm_dp_payload *payload)
>  {
> -=09return drm_dp_dpcd_write_payload(mgr, payload->vcpi, payload->vc_star=
t_slot,
> -=09=09=09=09=09 payload->time_slots);
> +=09int ret;
> +
> +=09ret =3D drm_dp_dpcd_write_payload(mgr, id, payload);
> +=09if (ret < 0) {
> +=09=09payload->payload_state =3D 0;
> +=09=09return ret;
> +=09}
> +=09payload->payload_state =3D DP_PAYLOAD_LOCAL;
> +=09return 0;
>  }
> =20
>  static int drm_dp_create_payload_step2(struct drm_dp_mst_topology_mgr *m=
gr,
> -=09=09=09=09       struct drm_dp_mst_atomic_payload *payload)
> +=09=09=09=09       struct drm_dp_mst_port *port,
> +=09=09=09=09       int id,
> +=09=09=09=09       struct drm_dp_payload *payload)
>  {
>  =09int ret;
> -=09struct drm_dp_mst_port *port =3D drm_dp_mst_topology_get_port_validat=
ed(mgr, payload->port);
> -
> -=09if (!port)
> -=09=09return -EIO;
> =20
> -=09ret =3D drm_dp_payload_send_msg(mgr, port, payload->vcpi, payload->pb=
n);
> -=09drm_dp_mst_topology_put_port(port);
> +=09ret =3D drm_dp_payload_send_msg(mgr, port, id, port->vcpi.pbn);
> +=09if (ret < 0)
> +=09=09return ret;
> +=09payload->payload_state =3D DP_PAYLOAD_REMOTE;
>  =09return ret;
>  }
> =20
>  static int drm_dp_destroy_payload_step1(struct drm_dp_mst_topology_mgr *=
mgr,
> -=09=09=09=09=09struct drm_dp_mst_topology_state *mst_state,
> -=09=09=09=09=09struct drm_dp_mst_atomic_payload *payload)
> +=09=09=09=09=09struct drm_dp_mst_port *port,
> +=09=09=09=09=09int id,
> +=09=09=09=09=09struct drm_dp_payload *payload)
>  {
>  =09drm_dbg_kms(mgr->dev, "\n");
> -
>  =09/* it's okay for these to fail */
> -=09drm_dp_payload_send_msg(mgr, payload->port, payload->vcpi, 0);
> -=09drm_dp_dpcd_write_payload(mgr, payload->vcpi, payload->vc_start_slot,=
 0);
> +=09if (port) {
> +=09=09drm_dp_payload_send_msg(mgr, port, id, 0);
> +=09}
> =20
> +=09drm_dp_dpcd_write_payload(mgr, id, payload);
> +=09payload->payload_state =3D DP_PAYLOAD_DELETE_LOCAL;
> +=09return 0;
> +}
> +
> +static int drm_dp_destroy_payload_step2(struct drm_dp_mst_topology_mgr *=
mgr,
> +=09=09=09=09=09int id,
> +=09=09=09=09=09struct drm_dp_payload *payload)
> +{
> +=09payload->payload_state =3D 0;
>  =09return 0;
>  }
> =20
>  /**
> - * drm_dp_add_payload_part1() - Execute payload update part 1
> - * @mgr: Manager to use.
> - * @mst_state: The MST atomic state
> - * @payload: The payload to write
> + * drm_dp_update_payload_part1() - Execute payload update part 1
> + * @mgr: manager to use.
> + * @start_slot: this is the cur slot
> + *
> + * NOTE: start_slot is a temporary workaround for non-atomic drivers,
> + * this will be removed when non-atomic mst helpers are moved out of the=
 helper
>   *
> - * Determines the starting time slot for the given payload, and programs=
 the VCPI for this payload
> - * into hardware. After calling this, the driver should generate ACT and=
 payload packets.
> + * This iterates over all proposed virtual channels, and tries to
> + * allocate space in the link for them. For 0->slots transitions,
> + * this step just writes the VCPI to the MST device. For slots->0
> + * transitions, this writes the updated VCPIs and removes the
> + * remote VC payloads.
>   *
> - * Returns: 0 on success, error code on failure. In the event that this =
fails,
> - * @payload.vc_start_slot will also be set to -1.
> + * after calling this the driver should generate ACT and payload
> + * packets.
>   */
> -int drm_dp_add_payload_part1(struct drm_dp_mst_topology_mgr *mgr,
> -=09=09=09     struct drm_dp_mst_topology_state *mst_state,
> -=09=09=09     struct drm_dp_mst_atomic_payload *payload)
> +int drm_dp_update_payload_part1(struct drm_dp_mst_topology_mgr *mgr, int=
 start_slot)
>  {
> +=09struct drm_dp_payload req_payload;
>  =09struct drm_dp_mst_port *port;
> -=09int ret;
> +=09int i, j;
> +=09int cur_slots =3D start_slot;
> +=09bool skip;
> =20
> -=09port =3D drm_dp_mst_topology_get_port_validated(mgr, payload->port);
> -=09if (!port)
> -=09=09return 0;
> +=09mutex_lock(&mgr->payload_lock);
> +=09for (i =3D 0; i < mgr->max_payloads; i++) {
> +=09=09struct drm_dp_vcpi *vcpi =3D mgr->proposed_vcpis[i];
> +=09=09struct drm_dp_payload *payload =3D &mgr->payloads[i];
> +=09=09bool put_port =3D false;
> =20
> -=09if (mgr->payload_count =3D=3D 0)
> -=09=09mgr->next_start_slot =3D mst_state->start_slot;
> +=09=09/* solve the current payloads - compare to the hw ones
> +=09=09   - update the hw view */
> +=09=09req_payload.start_slot =3D cur_slots;
> +=09=09if (vcpi) {
> +=09=09=09port =3D container_of(vcpi, struct drm_dp_mst_port,
> +=09=09=09=09=09    vcpi);
> =20
> -=09payload->vc_start_slot =3D mgr->next_start_slot;
> +=09=09=09mutex_lock(&mgr->lock);
> +=09=09=09skip =3D !drm_dp_mst_port_downstream_of_branch(port, mgr->mst_p=
rimary);
> +=09=09=09mutex_unlock(&mgr->lock);
> =20
> -=09ret =3D drm_dp_create_payload_step1(mgr, payload);
> -=09drm_dp_mst_topology_put_port(port);
> -=09if (ret < 0) {
> -=09=09drm_warn(mgr->dev, "Failed to create MST payload for port %p: %d\n=
",
> -=09=09=09 payload->port, ret);
> -=09=09payload->vc_start_slot =3D -1;
> -=09=09return ret;
> -=09}
> +=09=09=09if (skip) {
> +=09=09=09=09drm_dbg_kms(mgr->dev,
> +=09=09=09=09=09    "Virtual channel %d is not in current topology\n",
> +=09=09=09=09=09    i);
> +=09=09=09=09continue;
> +=09=09=09}
> +=09=09=09/* Validated ports don't matter if we're releasing
> +=09=09=09 * VCPI
> +=09=09=09 */
> +=09=09=09if (vcpi->num_slots) {
> +=09=09=09=09port =3D drm_dp_mst_topology_get_port_validated(
> +=09=09=09=09    mgr, port);
> +=09=09=09=09if (!port) {
> +=09=09=09=09=09if (vcpi->num_slots =3D=3D payload->num_slots) {
> +=09=09=09=09=09=09cur_slots +=3D vcpi->num_slots;
> +=09=09=09=09=09=09payload->start_slot =3D req_payload.start_slot;
> +=09=09=09=09=09=09continue;
> +=09=09=09=09=09} else {
> +=09=09=09=09=09=09drm_dbg_kms(mgr->dev,
> +=09=09=09=09=09=09=09    "Fail:set payload to invalid sink");
> +=09=09=09=09=09=09mutex_unlock(&mgr->payload_lock);
> +=09=09=09=09=09=09return -EINVAL;
> +=09=09=09=09=09}
> +=09=09=09=09}
> +=09=09=09=09put_port =3D true;
> +=09=09=09}
> =20
> -=09mgr->payload_count++;
> -=09mgr->next_start_slot +=3D payload->time_slots;
> +=09=09=09req_payload.num_slots =3D vcpi->num_slots;
> +=09=09=09req_payload.vcpi =3D vcpi->vcpi;
> +=09=09} else {
> +=09=09=09port =3D NULL;
> +=09=09=09req_payload.num_slots =3D 0;
> +=09=09}
> =20
> -=09return 0;
> -}
> -EXPORT_SYMBOL(drm_dp_add_payload_part1);
> +=09=09payload->start_slot =3D req_payload.start_slot;
> +=09=09/* work out what is required to happen with this payload */
> +=09=09if (payload->num_slots !=3D req_payload.num_slots) {
> +
> +=09=09=09/* need to push an update for this payload */
> +=09=09=09if (req_payload.num_slots) {
> +=09=09=09=09drm_dp_create_payload_step1(mgr, vcpi->vcpi,
> +=09=09=09=09=09=09=09    &req_payload);
> +=09=09=09=09payload->num_slots =3D req_payload.num_slots;
> +=09=09=09=09payload->vcpi =3D req_payload.vcpi;
> +
> +=09=09=09} else if (payload->num_slots) {
> +=09=09=09=09payload->num_slots =3D 0;
> +=09=09=09=09drm_dp_destroy_payload_step1(mgr, port,
> +=09=09=09=09=09=09=09     payload->vcpi,
> +=09=09=09=09=09=09=09     payload);
> +=09=09=09=09req_payload.payload_state =3D
> +=09=09=09=09=09payload->payload_state;
> +=09=09=09=09payload->start_slot =3D 0;
> +=09=09=09}
> +=09=09=09payload->payload_state =3D req_payload.payload_state;
> +=09=09}
> +=09=09cur_slots +=3D req_payload.num_slots;
> =20
> -/**
> - * drm_dp_remove_payload() - Remove an MST payload
> - * @mgr: Manager to use.
> - * @mst_state: The MST atomic state
> - * @payload: The payload to write
> - *
> - * Removes a payload from an MST topology if it was successfully assigne=
d a start slot. Also updates
> - * the starting time slots of all other payloads which would have been s=
hifted towards the start of
> - * the VC table as a result. After calling this, the driver should gener=
ate ACT and payload packets.
> - */
> -void drm_dp_remove_payload(struct drm_dp_mst_topology_mgr *mgr,
> -=09=09=09   struct drm_dp_mst_topology_state *mst_state,
> -=09=09=09   struct drm_dp_mst_atomic_payload *payload)
> -{
> -=09struct drm_dp_mst_atomic_payload *pos;
> -=09bool send_remove =3D false;
> +=09=09if (put_port)
> +=09=09=09drm_dp_mst_topology_put_port(port);
> +=09}
> =20
> -=09/* We failed to make the payload, so nothing to do */
> -=09if (payload->vc_start_slot =3D=3D -1)
> -=09=09return;
> +=09for (i =3D 0; i < mgr->max_payloads; /* do nothing */) {
> +=09=09if (mgr->payloads[i].payload_state !=3D DP_PAYLOAD_DELETE_LOCAL) {
> +=09=09=09i++;
> +=09=09=09continue;
> +=09=09}
> =20
> -=09mutex_lock(&mgr->lock);
> -=09send_remove =3D drm_dp_mst_port_downstream_of_branch(payload->port, m=
gr->mst_primary);
> -=09mutex_unlock(&mgr->lock);
> +=09=09drm_dbg_kms(mgr->dev, "removing payload %d\n", i);
> +=09=09for (j =3D i; j < mgr->max_payloads - 1; j++) {
> +=09=09=09mgr->payloads[j] =3D mgr->payloads[j + 1];
> +=09=09=09mgr->proposed_vcpis[j] =3D mgr->proposed_vcpis[j + 1];
> =20
> -=09if (send_remove)
> -=09=09drm_dp_destroy_payload_step1(mgr, mst_state, payload);
> -=09else
> -=09=09drm_dbg_kms(mgr->dev, "Payload for VCPI %d not in topology, not se=
nding remove\n",
> -=09=09=09    payload->vcpi);
> +=09=09=09if (mgr->proposed_vcpis[j] &&
> +=09=09=09    mgr->proposed_vcpis[j]->num_slots) {
> +=09=09=09=09set_bit(j + 1, &mgr->payload_mask);
> +=09=09=09} else {
> +=09=09=09=09clear_bit(j + 1, &mgr->payload_mask);
> +=09=09=09}
> +=09=09}
> =20
> -=09list_for_each_entry(pos, &mst_state->payloads, next) {
> -=09=09if (pos !=3D payload && pos->vc_start_slot > payload->vc_start_slo=
t)
> -=09=09=09pos->vc_start_slot -=3D payload->time_slots;
> +=09=09memset(&mgr->payloads[mgr->max_payloads - 1], 0,
> +=09=09       sizeof(struct drm_dp_payload));
> +=09=09mgr->proposed_vcpis[mgr->max_payloads - 1] =3D NULL;
> +=09=09clear_bit(mgr->max_payloads, &mgr->payload_mask);
>  =09}
> -=09payload->vc_start_slot =3D -1;
> +=09mutex_unlock(&mgr->payload_lock);
> =20
> -=09mgr->payload_count--;
> -=09mgr->next_start_slot -=3D payload->time_slots;
> +=09return 0;
>  }
> -EXPORT_SYMBOL(drm_dp_remove_payload);
> +EXPORT_SYMBOL(drm_dp_update_payload_part1);
> =20
>  /**
> - * drm_dp_add_payload_part2() - Execute payload update part 2
> - * @mgr: Manager to use.
> - * @state: The global atomic state
> - * @payload: The payload to update
> - *
> - * If @payload was successfully assigned a starting time slot by drm_dp_=
add_payload_part1(), this
> - * function will send the sideband messages to finish allocating this pa=
yload.
> + * drm_dp_update_payload_part2() - Execute payload update part 2
> + * @mgr: manager to use.
>   *
> - * Returns: 0 on success, negative error code on failure.
> + * This iterates over all proposed virtual channels, and tries to
> + * allocate space in the link for them. For 0->slots transitions,
> + * this step writes the remote VC payload commands. For slots->0
> + * this just resets some internal state.
>   */
> -int drm_dp_add_payload_part2(struct drm_dp_mst_topology_mgr *mgr,
> -=09=09=09     struct drm_atomic_state *state,
> -=09=09=09     struct drm_dp_mst_atomic_payload *payload)
> +int drm_dp_update_payload_part2(struct drm_dp_mst_topology_mgr *mgr)
>  {
> +=09struct drm_dp_mst_port *port;
> +=09int i;
>  =09int ret =3D 0;
> +=09bool skip;
> =20
> -=09/* Skip failed payloads */
> -=09if (payload->vc_start_slot =3D=3D -1) {
> -=09=09drm_dbg_kms(state->dev, "Part 1 of payload creation for %s failed,=
 skipping part 2\n",
> -=09=09=09    payload->port->connector->name);
> -=09=09return -EIO;
> -=09}
> +=09mutex_lock(&mgr->payload_lock);
> +=09for (i =3D 0; i < mgr->max_payloads; i++) {
> =20
> -=09ret =3D drm_dp_create_payload_step2(mgr, payload);
> -=09if (ret < 0) {
> -=09=09if (!payload->delete)
> -=09=09=09drm_err(mgr->dev, "Step 2 of creating MST payload for %p failed=
: %d\n",
> -=09=09=09=09payload->port, ret);
> -=09=09else
> -=09=09=09drm_dbg_kms(mgr->dev, "Step 2 of removing MST payload for %p fa=
iled: %d\n",
> -=09=09=09=09    payload->port, ret);
> -=09}
> +=09=09if (!mgr->proposed_vcpis[i])
> +=09=09=09continue;
> =20
> -=09return ret;
> +=09=09port =3D container_of(mgr->proposed_vcpis[i], struct drm_dp_mst_po=
rt, vcpi);
> +
> +=09=09mutex_lock(&mgr->lock);
> +=09=09skip =3D !drm_dp_mst_port_downstream_of_branch(port, mgr->mst_prim=
ary);
> +=09=09mutex_unlock(&mgr->lock);
> +
> +=09=09if (skip)
> +=09=09=09continue;
> +
> +=09=09drm_dbg_kms(mgr->dev, "payload %d %d\n", i, mgr->payloads[i].paylo=
ad_state);
> +=09=09if (mgr->payloads[i].payload_state =3D=3D DP_PAYLOAD_LOCAL) {
> +=09=09=09ret =3D drm_dp_create_payload_step2(mgr, port, mgr->proposed_vc=
pis[i]->vcpi, &mgr->payloads[i]);
> +=09=09} else if (mgr->payloads[i].payload_state =3D=3D DP_PAYLOAD_DELETE=
_LOCAL) {
> +=09=09=09ret =3D drm_dp_destroy_payload_step2(mgr, mgr->proposed_vcpis[i=
]->vcpi, &mgr->payloads[i]);
> +=09=09}
> +=09=09if (ret) {
> +=09=09=09mutex_unlock(&mgr->payload_lock);
> +=09=09=09return ret;
> +=09=09}
> +=09}
> +=09mutex_unlock(&mgr->payload_lock);
> +=09return 0;
>  }
> -EXPORT_SYMBOL(drm_dp_add_payload_part2);
> +EXPORT_SYMBOL(drm_dp_update_payload_part2);
> =20
>  static int drm_dp_send_dpcd_read(struct drm_dp_mst_topology_mgr *mgr,
>  =09=09=09=09 struct drm_dp_mst_port *port,
> @@ -3591,6 +3711,7 @@ int drm_dp_mst_topology_mgr_set_mst(struct drm_dp_m=
st_topology_mgr *mgr, bool ms
>  =09int ret =3D 0;
>  =09struct drm_dp_mst_branch *mstb =3D NULL;
> =20
> +=09mutex_lock(&mgr->payload_lock);
>  =09mutex_lock(&mgr->lock);
>  =09if (mst_state =3D=3D mgr->mst_state)
>  =09=09goto out_unlock;
> @@ -3598,6 +3719,10 @@ int drm_dp_mst_topology_mgr_set_mst(struct drm_dp_=
mst_topology_mgr *mgr, bool ms
>  =09mgr->mst_state =3D mst_state;
>  =09/* set the device into MST mode */
>  =09if (mst_state) {
> +=09=09struct drm_dp_payload reset_pay;
> +=09=09int lane_count;
> +=09=09int link_rate;
> +
>  =09=09WARN_ON(mgr->mst_primary);
> =20
>  =09=09/* get dpcd info */
> @@ -3608,6 +3733,16 @@ int drm_dp_mst_topology_mgr_set_mst(struct drm_dp_=
mst_topology_mgr *mgr, bool ms
>  =09=09=09goto out_unlock;
>  =09=09}
> =20
> +=09=09lane_count =3D min_t(int, mgr->dpcd[2] & DP_MAX_LANE_COUNT_MASK, m=
gr->max_lane_count);
> +=09=09link_rate =3D min_t(int, drm_dp_bw_code_to_link_rate(mgr->dpcd[1])=
, mgr->max_link_rate);
> +=09=09mgr->pbn_div =3D drm_dp_get_vc_payload_bw(mgr,
> +=09=09=09=09=09=09=09link_rate,
> +=09=09=09=09=09=09=09lane_count);
> +=09=09if (mgr->pbn_div =3D=3D 0) {
> +=09=09=09ret =3D -EINVAL;
> +=09=09=09goto out_unlock;
> +=09=09}
> +
>  =09=09/* add initial branch device at LCT 1 */
>  =09=09mstb =3D drm_dp_add_mst_branch_device(1, NULL);
>  =09=09if (mstb =3D=3D NULL) {
> @@ -3627,8 +3762,9 @@ int drm_dp_mst_topology_mgr_set_mst(struct drm_dp_m=
st_topology_mgr *mgr, bool ms
>  =09=09if (ret < 0)
>  =09=09=09goto out_unlock;
> =20
> -=09=09/* Write reset payload */
> -=09=09drm_dp_dpcd_write_payload(mgr, 0, 0, 0x3f);
> +=09=09reset_pay.start_slot =3D 0;
> +=09=09reset_pay.num_slots =3D 0x3f;
> +=09=09drm_dp_dpcd_write_payload(mgr, 0, &reset_pay);
> =20
>  =09=09queue_work(system_long_wq, &mgr->work);
> =20
> @@ -3640,11 +3776,19 @@ int drm_dp_mst_topology_mgr_set_mst(struct drm_dp=
_mst_topology_mgr *mgr, bool ms
>  =09=09/* this can fail if the device is gone */
>  =09=09drm_dp_dpcd_writeb(mgr->aux, DP_MSTM_CTRL, 0);
>  =09=09ret =3D 0;
> +=09=09memset(mgr->payloads, 0,
> +=09=09       mgr->max_payloads * sizeof(mgr->payloads[0]));
> +=09=09memset(mgr->proposed_vcpis, 0,
> +=09=09       mgr->max_payloads * sizeof(mgr->proposed_vcpis[0]));
> +=09=09mgr->payload_mask =3D 0;
> +=09=09set_bit(0, &mgr->payload_mask);
> +=09=09mgr->vcpi_mask =3D 0;
>  =09=09mgr->payload_id_table_cleared =3D false;
>  =09}
> =20
>  out_unlock:
>  =09mutex_unlock(&mgr->lock);
> +=09mutex_unlock(&mgr->payload_lock);
>  =09if (mstb)
>  =09=09drm_dp_mst_topology_put_mstb(mstb);
>  =09return ret;
> @@ -4163,18 +4307,62 @@ struct edid *drm_dp_mst_get_edid(struct drm_conne=
ctor *connector, struct drm_dp_
>  }
>  EXPORT_SYMBOL(drm_dp_mst_get_edid);
> =20
> +/**
> + * drm_dp_find_vcpi_slots() - Find time slots for this PBN value
> + * @mgr: manager to use
> + * @pbn: payload bandwidth to convert into slots.
> + *
> + * Calculate the number of time slots that will be required for the give=
n PBN
> + * value. This function is deprecated, and should not be used in atomic
> + * drivers.
> + *
> + * RETURNS:
> + * The total slots required for this port, or error.
> + */
> +int drm_dp_find_vcpi_slots(struct drm_dp_mst_topology_mgr *mgr,
> +=09=09=09   int pbn)
> +{
> +=09int num_slots;
> +
> +=09num_slots =3D DIV_ROUND_UP(pbn, mgr->pbn_div);
> +
> +=09/* max. time slots - one slot for MTP header */
> +=09if (num_slots > 63)
> +=09=09return -ENOSPC;
> +=09return num_slots;
> +}
> +EXPORT_SYMBOL(drm_dp_find_vcpi_slots);
> +
> +static int drm_dp_init_vcpi(struct drm_dp_mst_topology_mgr *mgr,
> +=09=09=09    struct drm_dp_vcpi *vcpi, int pbn, int slots)
> +{
> +=09int ret;
> +
> +=09vcpi->pbn =3D pbn;
> +=09vcpi->aligned_pbn =3D slots * mgr->pbn_div;
> +=09vcpi->num_slots =3D slots;
> +
> +=09ret =3D drm_dp_mst_assign_payload_id(mgr, vcpi);
> +=09if (ret < 0)
> +=09=09return ret;
> +=09return 0;
> +}
> +
>  /**
>   * drm_dp_atomic_find_time_slots() - Find and add time slots to the stat=
e
>   * @state: global atomic state
>   * @mgr: MST topology manager for the port
>   * @port: port to find time slots for
>   * @pbn: bandwidth required for the mode in PBN
> + * @pbn_div: divider for DSC mode that takes FEC into account
>   *
> - * Allocates time slots to @port, replacing any previous time slot alloc=
ations it may
> - * have had. Any atomic drivers which support MST must call this functio=
n in
> - * their &drm_encoder_helper_funcs.atomic_check() callback unconditional=
ly to
> - * change the current time slot allocation for the new state, and ensure=
 the MST
> - * atomic state is added whenever the state of payloads in the topology =
changes.
> + * Allocates time slots to @port, replacing any previous timeslot alloca=
tions it
> + * may have had. Any atomic drivers which support MST must call this fun=
ction
> + * in their &drm_encoder_helper_funcs.atomic_check() callback to change =
the
> + * current timeslot allocation for the new state, but only when
> + * &drm_crtc_state.mode_changed or &drm_crtc_state.connectors_changed is=
 set
> + * to ensure compatibility with userspace applications that still use th=
e
> + * legacy modesetting UAPI.
>   *
>   * Allocations set by this function are not checked against the bandwidt=
h
>   * restraints of @mgr until the driver calls drm_dp_mst_atomic_check().
> @@ -4193,7 +4381,8 @@ EXPORT_SYMBOL(drm_dp_mst_get_edid);
>   */
>  int drm_dp_atomic_find_time_slots(struct drm_atomic_state *state,
>  =09=09=09=09  struct drm_dp_mst_topology_mgr *mgr,
> -=09=09=09=09  struct drm_dp_mst_port *port, int pbn)
> +=09=09=09=09  struct drm_dp_mst_port *port, int pbn,
> +=09=09=09=09  int pbn_div)
>  {
>  =09struct drm_dp_mst_topology_state *topology_state;
>  =09struct drm_dp_mst_atomic_payload *payload =3D NULL;
> @@ -4226,7 +4415,10 @@ int drm_dp_atomic_find_time_slots(struct drm_atomi=
c_state *state,
>  =09=09}
>  =09}
> =20
> -=09req_slots =3D DIV_ROUND_UP(pbn, topology_state->pbn_div);
> +=09if (pbn_div <=3D 0)
> +=09=09pbn_div =3D mgr->pbn_div;
> +
> +=09req_slots =3D DIV_ROUND_UP(pbn, pbn_div);
> =20
>  =09drm_dbg_atomic(mgr->dev, "[CONNECTOR:%d:%s] [MST PORT:%p] TU %d -> %d=
\n",
>  =09=09       port->connector->base.id, port->connector->name,
> @@ -4235,7 +4427,7 @@ int drm_dp_atomic_find_time_slots(struct drm_atomic=
_state *state,
>  =09=09       port->connector->base.id, port->connector->name,
>  =09=09       port, prev_bw, pbn);
> =20
> -=09/* Add the new allocation to the state, note the VCPI isn't assigned =
until the end */
> +=09/* Add the new allocation to the state */
>  =09if (!payload) {
>  =09=09payload =3D kzalloc(sizeof(*payload), GFP_KERNEL);
>  =09=09if (!payload)
> @@ -4243,7 +4435,6 @@ int drm_dp_atomic_find_time_slots(struct drm_atomic=
_state *state,
> =20
>  =09=09drm_dp_mst_get_port_malloc(port);
>  =09=09payload->port =3D port;
> -=09=09payload->vc_start_slot =3D -1;
>  =09=09list_add(&payload->next, &topology_state->payloads);
>  =09}
>  =09payload->time_slots =3D req_slots;
> @@ -4260,12 +4451,10 @@ EXPORT_SYMBOL(drm_dp_atomic_find_time_slots);
>   * @port: The port to release the time slots from
>   *
>   * Releases any time slots that have been allocated to a port in the ato=
mic
> - * state. Any atomic drivers which support MST must call this function
> - * unconditionally in their &drm_connector_helper_funcs.atomic_check() c=
allback.
> - * This helper will check whether time slots would be released by the ne=
w state and
> - * respond accordingly, along with ensuring the MST state is always adde=
d to the
> - * atomic state whenever a new state would modify the state of payloads =
on the
> - * topology.
> + * state. Any atomic drivers which support MST must call this function i=
n
> + * their &drm_connector_helper_funcs.atomic_check() callback when the
> + * connector will no longer have VCPI allocated (e.g. because its CRTC w=
as
> + * removed) when it had VCPI allocated in the previous atomic state.
>   *
>   * It is OK to call this even if @port has been removed from the system.
>   * Additionally, it is OK to call this function multiple times on the sa=
me
> @@ -4330,7 +4519,6 @@ int drm_dp_atomic_release_time_slots(struct drm_ato=
mic_state *state,
>  =09=09drm_dp_mst_put_port_malloc(port);
>  =09=09payload->pbn =3D 0;
>  =09=09payload->delete =3D true;
> -=09=09topology_state->payload_mask &=3D ~BIT(payload->vcpi - 1);
>  =09}
> =20
>  =09return 0;
> @@ -4381,8 +4569,7 @@ int drm_dp_mst_atomic_setup_commit(struct drm_atomi=
c_state *state)
>  EXPORT_SYMBOL(drm_dp_mst_atomic_setup_commit);
> =20
>  /**
> - * drm_dp_mst_atomic_wait_for_dependencies() - Wait for all pending comm=
its on MST topologies,
> - * prepare new MST state for commit
> + * drm_dp_mst_atomic_wait_for_dependencies() - Wait for all pending comm=
its on MST topologies
>   * @state: global atomic state
>   *
>   * Goes through any MST topologies in this atomic state, and waits for a=
ny pending commits which
> @@ -4400,30 +4587,17 @@ EXPORT_SYMBOL(drm_dp_mst_atomic_setup_commit);
>   */
>  void drm_dp_mst_atomic_wait_for_dependencies(struct drm_atomic_state *st=
ate)
>  {
> -=09struct drm_dp_mst_topology_state *old_mst_state, *new_mst_state;
> +=09struct drm_dp_mst_topology_state *old_mst_state;
>  =09struct drm_dp_mst_topology_mgr *mgr;
> -=09struct drm_dp_mst_atomic_payload *old_payload, *new_payload;
>  =09int i, j, ret;
> =20
> -=09for_each_oldnew_mst_mgr_in_state(state, mgr, old_mst_state, new_mst_s=
tate, i) {
> +=09for_each_old_mst_mgr_in_state(state, mgr, old_mst_state, i) {
>  =09=09for (j =3D 0; j < old_mst_state->num_commit_deps; j++) {
>  =09=09=09ret =3D drm_crtc_commit_wait(old_mst_state->commit_deps[j]);
>  =09=09=09if (ret < 0)
>  =09=09=09=09drm_err(state->dev, "Failed to wait for %s: %d\n",
>  =09=09=09=09=09old_mst_state->commit_deps[j]->crtc->name, ret);
>  =09=09}
> -
> -=09=09/* Now that previous state is committed, it's safe to copy over th=
e start slot
> -=09=09 * assignments
> -=09=09 */
> -=09=09list_for_each_entry(old_payload, &old_mst_state->payloads, next) {
> -=09=09=09if (old_payload->delete)
> -=09=09=09=09continue;
> -
> -=09=09=09new_payload =3D drm_atomic_get_mst_payload_state(new_mst_state,
> -=09=09=09=09=09=09=09=09       old_payload->port);
> -=09=09=09new_payload->vc_start_slot =3D old_payload->vc_start_slot;
> -=09=09}
>  =09}
>  }
>  EXPORT_SYMBOL(drm_dp_mst_atomic_wait_for_dependencies);
> @@ -4508,8 +4682,119 @@ void drm_dp_mst_update_slots(struct drm_dp_mst_to=
pology_state *mst_state, uint8_
>  }
>  EXPORT_SYMBOL(drm_dp_mst_update_slots);
> =20
> +/**
> + * drm_dp_mst_allocate_vcpi() - Allocate a virtual channel
> + * @mgr: manager for this port
> + * @port: port to allocate a virtual channel for.
> + * @pbn: payload bandwidth number to request
> + * @slots: returned number of slots for this PBN.
> + */
> +bool drm_dp_mst_allocate_vcpi(struct drm_dp_mst_topology_mgr *mgr,
> +=09=09=09      struct drm_dp_mst_port *port, int pbn, int slots)
> +{
> +=09int ret;
> +
> +=09if (slots < 0)
> +=09=09return false;
> +
> +=09port =3D drm_dp_mst_topology_get_port_validated(mgr, port);
> +=09if (!port)
> +=09=09return false;
> +
> +=09if (port->vcpi.vcpi > 0) {
> +=09=09drm_dbg_kms(mgr->dev,
> +=09=09=09    "payload: vcpi %d already allocated for pbn %d - requested =
pbn %d\n",
> +=09=09=09    port->vcpi.vcpi, port->vcpi.pbn, pbn);
> +=09=09if (pbn =3D=3D port->vcpi.pbn) {
> +=09=09=09drm_dp_mst_topology_put_port(port);
> +=09=09=09return true;
> +=09=09}
> +=09}
> +
> +=09ret =3D drm_dp_init_vcpi(mgr, &port->vcpi, pbn, slots);
> +=09if (ret) {
> +=09=09drm_dbg_kms(mgr->dev, "failed to init time slots=3D%d ret=3D%d\n",
> +=09=09=09    DIV_ROUND_UP(pbn, mgr->pbn_div), ret);
> +=09=09drm_dp_mst_topology_put_port(port);
> +=09=09goto out;
> +=09}
> +=09drm_dbg_kms(mgr->dev, "initing vcpi for pbn=3D%d slots=3D%d\n", pbn, =
port->vcpi.num_slots);
> +
> +=09/* Keep port allocated until its payload has been removed */
> +=09drm_dp_mst_get_port_malloc(port);
> +=09drm_dp_mst_topology_put_port(port);
> +=09return true;
> +out:
> +=09return false;
> +}
> +EXPORT_SYMBOL(drm_dp_mst_allocate_vcpi);
> +
> +int drm_dp_mst_get_vcpi_slots(struct drm_dp_mst_topology_mgr *mgr, struc=
t drm_dp_mst_port *port)
> +{
> +=09int slots =3D 0;
> +
> +=09port =3D drm_dp_mst_topology_get_port_validated(mgr, port);
> +=09if (!port)
> +=09=09return slots;
> +
> +=09slots =3D port->vcpi.num_slots;
> +=09drm_dp_mst_topology_put_port(port);
> +=09return slots;
> +}
> +EXPORT_SYMBOL(drm_dp_mst_get_vcpi_slots);
> +
> +/**
> + * drm_dp_mst_reset_vcpi_slots() - Reset number of slots to 0 for VCPI
> + * @mgr: manager for this port
> + * @port: unverified pointer to a port.
> + *
> + * This just resets the number of slots for the ports VCPI for later pro=
gramming.
> + */
> +void drm_dp_mst_reset_vcpi_slots(struct drm_dp_mst_topology_mgr *mgr, st=
ruct drm_dp_mst_port *port)
> +{
> +=09/*
> +=09 * A port with VCPI will remain allocated until its VCPI is
> +=09 * released, no verified ref needed
> +=09 */
> +
> +=09port->vcpi.num_slots =3D 0;
> +}
> +EXPORT_SYMBOL(drm_dp_mst_reset_vcpi_slots);
> +
> +/**
> + * drm_dp_mst_deallocate_vcpi() - deallocate a VCPI
> + * @mgr: manager for this port
> + * @port: port to deallocate vcpi for
> + *
> + * This can be called unconditionally, regardless of whether
> + * drm_dp_mst_allocate_vcpi() succeeded or not.
> + */
> +void drm_dp_mst_deallocate_vcpi(struct drm_dp_mst_topology_mgr *mgr,
> +=09=09=09=09struct drm_dp_mst_port *port)
> +{
> +=09bool skip;
> +
> +=09if (!port->vcpi.vcpi)
> +=09=09return;
> +
> +=09mutex_lock(&mgr->lock);
> +=09skip =3D !drm_dp_mst_port_downstream_of_branch(port, mgr->mst_primary=
);
> +=09mutex_unlock(&mgr->lock);
> +
> +=09if (skip)
> +=09=09return;
> +
> +=09drm_dp_mst_put_payload_id(mgr, port->vcpi.vcpi);
> +=09port->vcpi.num_slots =3D 0;
> +=09port->vcpi.pbn =3D 0;
> +=09port->vcpi.aligned_pbn =3D 0;
> +=09port->vcpi.vcpi =3D 0;
> +=09drm_dp_mst_put_port_malloc(port);
> +}
> +EXPORT_SYMBOL(drm_dp_mst_deallocate_vcpi);
> +
>  static int drm_dp_dpcd_write_payload(struct drm_dp_mst_topology_mgr *mgr=
,
> -=09=09=09=09     int id, u8 start_slot, u8 num_slots)
> +=09=09=09=09     int id, struct drm_dp_payload *payload)
>  {
>  =09u8 payload_alloc[3], status;
>  =09int ret;
> @@ -4519,8 +4804,8 @@ static int drm_dp_dpcd_write_payload(struct drm_dp_=
mst_topology_mgr *mgr,
>  =09=09=09   DP_PAYLOAD_TABLE_UPDATED);
> =20
>  =09payload_alloc[0] =3D id;
> -=09payload_alloc[1] =3D start_slot;
> -=09payload_alloc[2] =3D num_slots;
> +=09payload_alloc[1] =3D payload->start_slot;
> +=09payload_alloc[2] =3D payload->num_slots;
> =20
>  =09ret =3D drm_dp_dpcd_write(mgr->aux, DP_PAYLOAD_ALLOCATE_SET, payload_=
alloc, 3);
>  =09if (ret !=3D 3) {
> @@ -4735,9 +5020,8 @@ static void fetch_monitor_name(struct drm_dp_mst_to=
pology_mgr *mgr,
>  void drm_dp_mst_dump_topology(struct seq_file *m,
>  =09=09=09      struct drm_dp_mst_topology_mgr *mgr)
>  {
> -=09struct drm_dp_mst_topology_state *state;
> -=09struct drm_dp_mst_atomic_payload *payload;
> -=09int i, ret;
> +=09int i;
> +=09struct drm_dp_mst_port *port;
> =20
>  =09mutex_lock(&mgr->lock);
>  =09if (mgr->mst_primary)
> @@ -4746,35 +5030,36 @@ void drm_dp_mst_dump_topology(struct seq_file *m,
>  =09/* dump VCPIs */
>  =09mutex_unlock(&mgr->lock);
> =20
> -=09ret =3D drm_modeset_lock_single_interruptible(&mgr->base.lock);
> -=09if (ret < 0)
> -=09=09return;
> +=09mutex_lock(&mgr->payload_lock);
> +=09seq_printf(m, "\n*** VCPI Info ***\n");
> +=09seq_printf(m, "payload_mask: %lx, vcpi_mask: %lx, max_payloads: %d\n"=
, mgr->payload_mask, mgr->vcpi_mask, mgr->max_payloads);
> =20
> -=09state =3D to_drm_dp_mst_topology_state(mgr->base.state);
> -=09seq_printf(m, "\n*** Atomic state info ***\n");
> -=09seq_printf(m, "payload_mask: %x, max_payloads: %d, start_slot: %u, pb=
n_div: %d\n",
> -=09=09   state->payload_mask, mgr->max_payloads, state->start_slot, stat=
e->pbn_div);
> -
> -=09seq_printf(m, "\n| idx | port | vcpi | slots | pbn | dsc |     sink n=
ame     |\n");
> +=09seq_printf(m, "\n|   idx   |  port # |  vcp_id | # slots |     sink n=
ame     |\n");
>  =09for (i =3D 0; i < mgr->max_payloads; i++) {
> -=09=09list_for_each_entry(payload, &state->payloads, next) {
> +=09=09if (mgr->proposed_vcpis[i]) {
>  =09=09=09char name[14];
> =20
> -=09=09=09if (payload->vcpi !=3D i || payload->delete)
> -=09=09=09=09continue;
> -
> -=09=09=09fetch_monitor_name(mgr, payload->port, name, sizeof(name));
> -=09=09=09seq_printf(m, " %5d %6d %6d %02d - %02d %5d %5s %19s\n",
> +=09=09=09port =3D container_of(mgr->proposed_vcpis[i], struct drm_dp_mst=
_port, vcpi);
> +=09=09=09fetch_monitor_name(mgr, port, name, sizeof(name));
> +=09=09=09seq_printf(m, "%10d%10d%10d%10d%20s\n",
>  =09=09=09=09   i,
> -=09=09=09=09   payload->port->port_num,
> -=09=09=09=09   payload->vcpi,
> -=09=09=09=09   payload->vc_start_slot,
> -=09=09=09=09   payload->vc_start_slot + payload->time_slots - 1,
> -=09=09=09=09   payload->pbn,
> -=09=09=09=09   payload->dsc_enabled ? "Y" : "N",
> +=09=09=09=09   port->port_num,
> +=09=09=09=09   port->vcpi.vcpi,
> +=09=09=09=09   port->vcpi.num_slots,
>  =09=09=09=09   (*name !=3D 0) ? name : "Unknown");
> -=09=09}
> +=09=09} else
> +=09=09=09seq_printf(m, "%6d - Unused\n", i);
> +=09}
> +=09seq_printf(m, "\n*** Payload Info ***\n");
> +=09seq_printf(m, "|   idx   |  state  |  start slot  | # slots |\n");
> +=09for (i =3D 0; i < mgr->max_payloads; i++) {
> +=09=09seq_printf(m, "%10d%10d%15d%10d\n",
> +=09=09=09   i,
> +=09=09=09   mgr->payloads[i].payload_state,
> +=09=09=09   mgr->payloads[i].start_slot,
> +=09=09=09   mgr->payloads[i].num_slots);
>  =09}
> +=09mutex_unlock(&mgr->payload_lock);
> =20
>  =09seq_printf(m, "\n*** DPCD Info ***\n");
>  =09mutex_lock(&mgr->lock);
> @@ -4820,7 +5105,7 @@ void drm_dp_mst_dump_topology(struct seq_file *m,
> =20
>  out:
>  =09mutex_unlock(&mgr->lock);
> -=09drm_modeset_unlock(&mgr->base.lock);
> +
>  }
>  EXPORT_SYMBOL(drm_dp_mst_dump_topology);
> =20
> @@ -5141,22 +5426,9 @@ drm_dp_mst_atomic_check_payload_alloc_limits(struc=
t drm_dp_mst_topology_mgr *mgr
>  =09=09=09=09       mgr, mst_state, mgr->max_payloads);
>  =09=09=09return -EINVAL;
>  =09=09}
> -
> -=09=09/* Assign a VCPI */
> -=09=09if (!payload->vcpi) {
> -=09=09=09payload->vcpi =3D ffz(mst_state->payload_mask) + 1;
> -=09=09=09drm_dbg_atomic(mgr->dev, "[MST PORT:%p] assigned VCPI #%d\n",
> -=09=09=09=09       payload->port, payload->vcpi);
> -=09=09=09mst_state->payload_mask |=3D BIT(payload->vcpi - 1);
> -=09=09}
>  =09}
> -
> -=09if (!payload_count)
> -=09=09mst_state->pbn_div =3D 0;
> -
> -=09drm_dbg_atomic(mgr->dev, "[MST MGR:%p] mst state %p TU pbn_div=3D%d a=
vail=3D%d used=3D%d\n",
> -=09=09       mgr, mst_state, mst_state->pbn_div, avail_slots,
> -=09=09       mst_state->total_avail_slots - avail_slots);
> +=09drm_dbg_atomic(mgr->dev, "[MST MGR:%p] mst state %p TU avail=3D%d use=
d=3D%d\n",
> +=09=09       mgr, mst_state, avail_slots, mst_state->total_avail_slots -=
 avail_slots);
> =20
>  =09return 0;
>  }
> @@ -5227,6 +5499,7 @@ EXPORT_SYMBOL(drm_dp_mst_add_affected_dsc_crtcs);
>   * @state: Pointer to the new drm_atomic_state
>   * @port: Pointer to the affected MST Port
>   * @pbn: Newly recalculated bw required for link with DSC enabled
> + * @pbn_div: Divider to calculate correct number of pbn per slot
>   * @enable: Boolean flag to enable or disable DSC on the port
>   *
>   * This function enables DSC on the given Port
> @@ -5237,7 +5510,8 @@ EXPORT_SYMBOL(drm_dp_mst_add_affected_dsc_crtcs);
>   */
>  int drm_dp_mst_atomic_enable_dsc(struct drm_atomic_state *state,
>  =09=09=09=09 struct drm_dp_mst_port *port,
> -=09=09=09=09 int pbn, bool enable)
> +=09=09=09=09 int pbn, int pbn_div,
> +=09=09=09=09 bool enable)
>  {
>  =09struct drm_dp_mst_topology_state *mst_state;
>  =09struct drm_dp_mst_atomic_payload *payload;
> @@ -5263,7 +5537,7 @@ int drm_dp_mst_atomic_enable_dsc(struct drm_atomic_=
state *state,
>  =09}
> =20
>  =09if (enable) {
> -=09=09time_slots =3D drm_dp_atomic_find_time_slots(state, port->mgr, por=
t, pbn);
> +=09=09time_slots =3D drm_dp_atomic_find_time_slots(state, port->mgr, por=
t, pbn, pbn_div);
>  =09=09drm_dbg_atomic(state->dev,
>  =09=09=09       "[MST PORT:%p] Enabling DSC flag, reallocating %d time s=
lots on the port\n",
>  =09=09=09       port, time_slots);
> @@ -5276,7 +5550,6 @@ int drm_dp_mst_atomic_enable_dsc(struct drm_atomic_=
state *state,
>  =09return time_slots;
>  }
>  EXPORT_SYMBOL(drm_dp_mst_atomic_enable_dsc);
> -
>  /**
>   * drm_dp_mst_atomic_check - Check that the new state of an MST topology=
 in an
>   * atomic update is valid
> @@ -5334,6 +5607,7 @@ EXPORT_SYMBOL(drm_dp_mst_topology_state_funcs);
> =20
>  /**
>   * drm_atomic_get_mst_topology_state: get MST topology state
> + *
>   * @state: global atomic state
>   * @mgr: MST topology manager, also the private object in this case
>   *
> @@ -5352,31 +5626,6 @@ struct drm_dp_mst_topology_state *drm_atomic_get_m=
st_topology_state(struct drm_a
>  }
>  EXPORT_SYMBOL(drm_atomic_get_mst_topology_state);
> =20
> -/**
> - * drm_atomic_get_new_mst_topology_state: get new MST topology state in =
atomic state, if any
> - * @state: global atomic state
> - * @mgr: MST topology manager, also the private object in this case
> - *
> - * This function wraps drm_atomic_get_priv_obj_state() passing in the MS=
T atomic
> - * state vtable so that the private object state returned is that of a M=
ST
> - * topology object.
> - *
> - * Returns:
> - *
> - * The MST topology state, or NULL if there's no topology state for this=
 MST mgr
> - * in the global atomic state
> - */
> -struct drm_dp_mst_topology_state *
> -drm_atomic_get_new_mst_topology_state(struct drm_atomic_state *state,
> -=09=09=09=09      struct drm_dp_mst_topology_mgr *mgr)
> -{
> -=09struct drm_private_state *priv_state =3D
> -=09=09drm_atomic_get_new_private_obj_state(state, &mgr->base);
> -
> -=09return priv_state ? to_dp_mst_topology_state(priv_state) : NULL;
> -}
> -EXPORT_SYMBOL(drm_atomic_get_new_mst_topology_state);
> -
>  /**
>   * drm_dp_mst_topology_mgr_init - initialise a topology manager
>   * @mgr: manager struct to initialise
> @@ -5384,6 +5633,8 @@ EXPORT_SYMBOL(drm_atomic_get_new_mst_topology_state=
);
>   * @aux: DP helper aux channel to talk to this device
>   * @max_dpcd_transaction_bytes: hw specific DPCD transaction limit
>   * @max_payloads: maximum number of payloads this GPU can source
> + * @max_lane_count: maximum number of lanes this GPU supports
> + * @max_link_rate: maximum link rate per lane this GPU supports in kHz
>   * @conn_base_id: the connector object ID the MST device is connected to=
.
>   *
>   * Return 0 for success, or negative error code on failure
> @@ -5391,12 +5642,14 @@ EXPORT_SYMBOL(drm_atomic_get_new_mst_topology_sta=
te);
>  int drm_dp_mst_topology_mgr_init(struct drm_dp_mst_topology_mgr *mgr,
>  =09=09=09=09 struct drm_device *dev, struct drm_dp_aux *aux,
>  =09=09=09=09 int max_dpcd_transaction_bytes, int max_payloads,
> +=09=09=09=09 int max_lane_count, int max_link_rate,
>  =09=09=09=09 int conn_base_id)
>  {
>  =09struct drm_dp_mst_topology_state *mst_state;
> =20
>  =09mutex_init(&mgr->lock);
>  =09mutex_init(&mgr->qlock);
> +=09mutex_init(&mgr->payload_lock);
>  =09mutex_init(&mgr->delayed_destroy_lock);
>  =09mutex_init(&mgr->up_req_lock);
>  =09mutex_init(&mgr->probe_lock);
> @@ -5426,7 +5679,19 @@ int drm_dp_mst_topology_mgr_init(struct drm_dp_mst=
_topology_mgr *mgr,
>  =09mgr->aux =3D aux;
>  =09mgr->max_dpcd_transaction_bytes =3D max_dpcd_transaction_bytes;
>  =09mgr->max_payloads =3D max_payloads;
> +=09mgr->max_lane_count =3D max_lane_count;
> +=09mgr->max_link_rate =3D max_link_rate;
>  =09mgr->conn_base_id =3D conn_base_id;
> +=09if (max_payloads + 1 > sizeof(mgr->payload_mask) * 8 ||
> +=09    max_payloads + 1 > sizeof(mgr->vcpi_mask) * 8)
> +=09=09return -EINVAL;
> +=09mgr->payloads =3D kcalloc(max_payloads, sizeof(struct drm_dp_payload)=
, GFP_KERNEL);
> +=09if (!mgr->payloads)
> +=09=09return -ENOMEM;
> +=09mgr->proposed_vcpis =3D kcalloc(max_payloads, sizeof(struct drm_dp_vc=
pi *), GFP_KERNEL);
> +=09if (!mgr->proposed_vcpis)
> +=09=09return -ENOMEM;
> +=09set_bit(0, &mgr->payload_mask);
> =20
>  =09mst_state =3D kzalloc(sizeof(*mst_state), GFP_KERNEL);
>  =09if (mst_state =3D=3D NULL)
> @@ -5459,12 +5724,19 @@ void drm_dp_mst_topology_mgr_destroy(struct drm_d=
p_mst_topology_mgr *mgr)
>  =09=09destroy_workqueue(mgr->delayed_destroy_wq);
>  =09=09mgr->delayed_destroy_wq =3D NULL;
>  =09}
> +=09mutex_lock(&mgr->payload_lock);
> +=09kfree(mgr->payloads);
> +=09mgr->payloads =3D NULL;
> +=09kfree(mgr->proposed_vcpis);
> +=09mgr->proposed_vcpis =3D NULL;
> +=09mutex_unlock(&mgr->payload_lock);
>  =09mgr->dev =3D NULL;
>  =09mgr->aux =3D NULL;
>  =09drm_atomic_private_obj_fini(&mgr->base);
>  =09mgr->funcs =3D NULL;
> =20
>  =09mutex_destroy(&mgr->delayed_destroy_lock);
> +=09mutex_destroy(&mgr->payload_lock);
>  =09mutex_destroy(&mgr->qlock);
>  =09mutex_destroy(&mgr->lock);
>  =09mutex_destroy(&mgr->up_req_lock);
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/dr=
m/i915/display/intel_dp_mst.c
> index 8b0e4defa3f1..4428eabc6ff7 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -57,7 +57,6 @@ static int intel_dp_mst_find_vcpi_slots_for_bpp(struct =
intel_encoder *encoder,
>  =09struct drm_atomic_state *state =3D crtc_state->uapi.state;
>  =09struct intel_dp_mst_encoder *intel_mst =3D enc_to_mst(encoder);
>  =09struct intel_dp *intel_dp =3D &intel_mst->primary->dp;
> -=09struct drm_dp_mst_topology_state *mst_state;
>  =09struct intel_connector *connector =3D
>  =09=09to_intel_connector(conn_state->connector);
>  =09struct drm_i915_private *i915 =3D to_i915(connector->base.dev);
> @@ -66,30 +65,23 @@ static int intel_dp_mst_find_vcpi_slots_for_bpp(struc=
t intel_encoder *encoder,
>  =09int bpp, slots =3D -EINVAL;
>  =09int ret =3D 0;
> =20
> -=09mst_state =3D drm_atomic_get_mst_topology_state(state, &intel_dp->mst=
_mgr);
> -=09if (IS_ERR(mst_state))
> -=09=09return PTR_ERR(mst_state);
> -
>  =09crtc_state->lane_count =3D limits->max_lane_count;
>  =09crtc_state->port_clock =3D limits->max_rate;
> =20
> -=09// TODO: Handle pbn_div changes by adding a new MST helper
> -=09if (!mst_state->pbn_div) {
> -=09=09mst_state->pbn_div =3D drm_dp_get_vc_payload_bw(&intel_dp->mst_mgr=
,
> -=09=09=09=09=09=09=09      crtc_state->port_clock,
> -=09=09=09=09=09=09=09      crtc_state->lane_count);
> -=09}
> +=09for (bpp =3D limits->max_bpp; bpp >=3D limits->min_bpp; bpp -=3D 2 * =
3) {
> +=09=09crtc_state->pipe_bpp =3D bpp;
> =20
> -=09for (bpp =3D max_bpp; bpp >=3D min_bpp; bpp -=3D step) {
>  =09=09crtc_state->pbn =3D drm_dp_calc_pbn_mode(adjusted_mode->crtc_clock=
,
>  =09=09=09=09=09=09       dsc ? bpp << 4 : bpp,
>  =09=09=09=09=09=09       dsc);
> =20
> -=09=09drm_dbg_kms(&i915->drm, "Trying bpp %d\n", bpp);
> -
>  =09=09slots =3D drm_dp_atomic_find_time_slots(state, &intel_dp->mst_mgr,
>  =09=09=09=09=09=09      connector->port,
> -=09=09=09=09=09=09      crtc_state->pbn);
> +=09=09=09=09=09=09      crtc_state->pbn,
> +=09=09=09=09=09=09      drm_dp_get_vc_payload_bw(&intel_dp->mst_mgr,
> +=09=09=09=09=09=09=09=09=09       crtc_state->port_clock,
> +=09=09=09=09=09=09=09=09=09       crtc_state->lane_count));
> +
>  =09=09if (slots =3D=3D -EDEADLK)
>  =09=09=09return slots;
> =20
> @@ -524,17 +516,21 @@ static void intel_mst_disable_dp(struct intel_atomi=
c_state *state,
>  =09struct intel_dp *intel_dp =3D &dig_port->dp;
>  =09struct intel_connector *connector =3D
>  =09=09to_intel_connector(old_conn_state->connector);
> -=09struct drm_dp_mst_topology_state *mst_state =3D
> -=09=09drm_atomic_get_mst_topology_state(&state->base, &intel_dp->mst_mgr=
);
>  =09struct drm_i915_private *i915 =3D to_i915(connector->base.dev);
> +=09int start_slot =3D intel_dp_is_uhbr(old_crtc_state) ? 0 : 1;
> +=09int ret;
> =20
>  =09drm_dbg_kms(&i915->drm, "active links %d\n",
>  =09=09    intel_dp->active_mst_links);
> =20
>  =09intel_hdcp_disable(intel_mst->connector);
> =20
> -=09drm_dp_remove_payload(&intel_dp->mst_mgr, mst_state,
> -=09=09=09      drm_atomic_get_mst_payload_state(mst_state, connector->po=
rt));
> +=09drm_dp_mst_reset_vcpi_slots(&intel_dp->mst_mgr, connector->port);
> +
> +=09ret =3D drm_dp_update_payload_part1(&intel_dp->mst_mgr, start_slot);
> +=09if (ret) {
> +=09=09drm_dbg_kms(&i915->drm, "failed to update payload %d\n", ret);
> +=09}
> =20
>  =09intel_audio_codec_disable(encoder, old_crtc_state, old_conn_state);
>  }
> @@ -562,6 +558,8 @@ static void intel_mst_post_disable_dp(struct intel_at=
omic_state *state,
> =20
>  =09intel_disable_transcoder(old_crtc_state);
> =20
> +=09drm_dp_update_payload_part2(&intel_dp->mst_mgr);
> +
>  =09clear_act_sent(encoder, old_crtc_state);
> =20
>  =09intel_de_rmw(dev_priv, TRANS_DDI_FUNC_CTL(old_crtc_state->cpu_transco=
der),
> @@ -569,6 +567,8 @@ static void intel_mst_post_disable_dp(struct intel_at=
omic_state *state,
> =20
>  =09wait_for_act_sent(encoder, old_crtc_state);
> =20
> +=09drm_dp_mst_deallocate_vcpi(&intel_dp->mst_mgr, connector->port);
> +
>  =09intel_ddi_disable_transcoder_func(old_crtc_state);
> =20
>  =09if (DISPLAY_VER(dev_priv) >=3D 9)
> @@ -635,8 +635,7 @@ static void intel_mst_pre_enable_dp(struct intel_atom=
ic_state *state,
>  =09struct drm_i915_private *dev_priv =3D to_i915(encoder->base.dev);
>  =09struct intel_connector *connector =3D
>  =09=09to_intel_connector(conn_state->connector);
> -=09struct drm_dp_mst_topology_state *mst_state =3D
> -=09=09drm_atomic_get_new_mst_topology_state(&state->base, &intel_dp->mst=
_mgr);
> +=09int start_slot =3D intel_dp_is_uhbr(pipe_config) ? 0 : 1;
>  =09int ret;
>  =09bool first_mst_stream;
> =20
> @@ -662,13 +661,16 @@ static void intel_mst_pre_enable_dp(struct intel_at=
omic_state *state,
>  =09=09dig_port->base.pre_enable(state, &dig_port->base,
>  =09=09=09=09=09=09pipe_config, NULL);
> =20
> +=09ret =3D drm_dp_mst_allocate_vcpi(&intel_dp->mst_mgr,
> +=09=09=09=09       connector->port,
> +=09=09=09=09       pipe_config->pbn,
> +=09=09=09=09       pipe_config->dp_m_n.tu);
> +=09if (!ret)
> +=09=09drm_err(&dev_priv->drm, "failed to allocate vcpi\n");
> +
>  =09intel_dp->active_mst_links++;
> =20
> -=09ret =3D drm_dp_add_payload_part1(&intel_dp->mst_mgr, mst_state,
> -=09=09=09=09       drm_atomic_get_mst_payload_state(mst_state, connector=
->port));
> -=09if (ret < 0)
> -=09=09drm_err(&dev_priv->drm, "Failed to create MST payload for %s: %d\n=
",
> -=09=09=09connector->base.name, ret);
> +=09ret =3D drm_dp_update_payload_part1(&intel_dp->mst_mgr, start_slot);
> =20
>  =09/*
>  =09 * Before Gen 12 this is not done as part of
> @@ -691,10 +693,7 @@ static void intel_mst_enable_dp(struct intel_atomic_=
state *state,
>  =09struct intel_dp_mst_encoder *intel_mst =3D enc_to_mst(encoder);
>  =09struct intel_digital_port *dig_port =3D intel_mst->primary;
>  =09struct intel_dp *intel_dp =3D &dig_port->dp;
> -=09struct intel_connector *connector =3D to_intel_connector(conn_state->=
connector);
>  =09struct drm_i915_private *dev_priv =3D to_i915(encoder->base.dev);
> -=09struct drm_dp_mst_topology_state *mst_state =3D
> -=09=09drm_atomic_get_new_mst_topology_state(&state->base, &intel_dp->mst=
_mgr);
>  =09enum transcoder trans =3D pipe_config->cpu_transcoder;
> =20
>  =09drm_WARN_ON(&dev_priv->drm, pipe_config->has_pch_encoder);
> @@ -722,8 +721,7 @@ static void intel_mst_enable_dp(struct intel_atomic_s=
tate *state,
> =20
>  =09wait_for_act_sent(encoder, pipe_config);
> =20
> -=09drm_dp_add_payload_part2(&intel_dp->mst_mgr, &state->base,
> -=09=09=09=09 drm_atomic_get_mst_payload_state(mst_state, connector->port=
));
> +=09drm_dp_update_payload_part2(&intel_dp->mst_mgr);
> =20
>  =09if (DISPLAY_VER(dev_priv) >=3D 14 && pipe_config->fec_enable)
>  =09=09intel_de_rmw(dev_priv, MTL_CHICKEN_TRANS(trans), 0,
> @@ -1170,6 +1168,8 @@ intel_dp_mst_encoder_init(struct intel_digital_port=
 *dig_port, int conn_base_id)
>  =09struct intel_dp *intel_dp =3D &dig_port->dp;
>  =09enum port port =3D dig_port->base.port;
>  =09int ret;
> +=09int max_source_rate =3D
> +=09=09intel_dp->source_rates[intel_dp->num_source_rates - 1];
> =20
>  =09if (!HAS_DP_MST(i915) || intel_dp_is_edp(intel_dp))
>  =09=09return 0;
> @@ -1185,7 +1185,10 @@ intel_dp_mst_encoder_init(struct intel_digital_por=
t *dig_port, int conn_base_id)
>  =09/* create encoders */
>  =09intel_dp_create_fake_mst_encoders(dig_port);
>  =09ret =3D drm_dp_mst_topology_mgr_init(&intel_dp->mst_mgr, &i915->drm,
> -=09=09=09=09=09   &intel_dp->aux, 16, 3, conn_base_id);
> +=09=09=09=09=09   &intel_dp->aux, 16, 3,
> +=09=09=09=09=09   dig_port->max_lanes,
> +=09=09=09=09=09   max_source_rate,
> +=09=09=09=09=09   conn_base_id);
>  =09if (ret) {
>  =09=09intel_dp->mst_mgr.cbs =3D NULL;
>  =09=09return ret;
> diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/=
i915/display/intel_hdcp.c
> index 6406fd487ee5..987e02eea66a 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdcp.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
> @@ -31,30 +31,8 @@
> =20
>  static int intel_conn_to_vcpi(struct intel_connector *connector)
>  {
> -=09struct drm_dp_mst_topology_mgr *mgr;
> -=09struct drm_dp_mst_atomic_payload *payload;
> -=09struct drm_dp_mst_topology_state *mst_state;
> -=09int vcpi =3D 0;
> -
>  =09/* For HDMI this is forced to be 0x0. For DP SST also this is 0x0. */
> -=09if (!connector->port)
> -=09=09return 0;
> -=09mgr =3D connector->port->mgr;
> -
> -=09drm_modeset_lock(&mgr->base.lock, NULL);
> -=09mst_state =3D to_drm_dp_mst_topology_state(mgr->base.state);
> -=09payload =3D drm_atomic_get_mst_payload_state(mst_state, connector->po=
rt);
> -=09if (drm_WARN_ON(mgr->dev, !payload))
> -=09=09goto out;
> -
> -=09vcpi =3D payload->vcpi;
> -=09if (drm_WARN_ON(mgr->dev, vcpi < 0)) {
> -=09=09vcpi =3D 0;
> -=09=09goto out;
> -=09}
> -out:
> -=09drm_modeset_unlock(&mgr->base.lock);
> -=09return vcpi;
> +=09return connector->port=09? connector->port->vcpi.vcpi : 0;
>  }
> =20
>  /*
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/no=
uveau/dispnv50/disp.c
> index edcb2529b402..9bebe2a5e284 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> @@ -831,7 +831,6 @@ struct nv50_msto {
>  =09struct nv50_head *head;
>  =09struct nv50_mstc *mstc;
>  =09bool disabled;
> -=09bool enabled;
>  };
> =20
>  struct nouveau_encoder *nv50_real_outp(struct drm_encoder *encoder)
> @@ -847,55 +846,82 @@ struct nouveau_encoder *nv50_real_outp(struct drm_e=
ncoder *encoder)
>  =09return msto->mstc->mstm->outp;
>  }
> =20
> +static struct drm_dp_payload *
> +nv50_msto_payload(struct nv50_msto *msto)
> +{
> +=09struct nouveau_drm *drm =3D nouveau_drm(msto->encoder.dev);
> +=09struct nv50_mstc *mstc =3D msto->mstc;
> +=09struct nv50_mstm *mstm =3D mstc->mstm;
> +=09int vcpi =3D mstc->port->vcpi.vcpi, i;
> +
> +=09WARN_ON(!mutex_is_locked(&mstm->mgr.payload_lock));
> +
> +=09NV_ATOMIC(drm, "%s: vcpi %d\n", msto->encoder.name, vcpi);
> +=09for (i =3D 0; i < mstm->mgr.max_payloads; i++) {
> +=09=09struct drm_dp_payload *payload =3D &mstm->mgr.payloads[i];
> +=09=09NV_ATOMIC(drm, "%s: %d: vcpi %d start 0x%02x slots 0x%02x\n",
> +=09=09=09  mstm->outp->base.base.name, i, payload->vcpi,
> +=09=09=09  payload->start_slot, payload->num_slots);
> +=09}
> +
> +=09for (i =3D 0; i < mstm->mgr.max_payloads; i++) {
> +=09=09struct drm_dp_payload *payload =3D &mstm->mgr.payloads[i];
> +=09=09if (payload->vcpi =3D=3D vcpi)
> +=09=09=09return payload;
> +=09}
> +
> +=09return NULL;
> +}
> +
>  static void
> -nv50_msto_cleanup(struct drm_atomic_state *state,
> -=09=09  struct drm_dp_mst_topology_state *mst_state,
> -=09=09  struct drm_dp_mst_topology_mgr *mgr,
> -=09=09  struct nv50_msto *msto)
> +nv50_msto_cleanup(struct nv50_msto *msto)
>  {
>  =09struct nouveau_drm *drm =3D nouveau_drm(msto->encoder.dev);
> -=09struct drm_dp_mst_atomic_payload *payload =3D
> -=09=09drm_atomic_get_mst_payload_state(mst_state, msto->mstc->port);
> +=09struct nv50_mstc *mstc =3D msto->mstc;
> +=09struct nv50_mstm *mstm =3D mstc->mstm;
> +
> +=09if (!msto->disabled)
> +=09=09return;
> =20
>  =09NV_ATOMIC(drm, "%s: msto cleanup\n", msto->encoder.name);
> =20
> -=09if (msto->disabled) {
> -=09=09msto->mstc =3D NULL;
> -=09=09msto->disabled =3D false;
> -=09} else if (msto->enabled) {
> -=09=09drm_dp_add_payload_part2(mgr, state, payload);
> -=09=09msto->enabled =3D false;
> -=09}
> +=09drm_dp_mst_deallocate_vcpi(&mstm->mgr, mstc->port);
> +
> +=09msto->mstc =3D NULL;
> +=09msto->disabled =3D false;
>  }
> =20
>  static void
> -nv50_msto_prepare(struct drm_atomic_state *state,
> -=09=09  struct drm_dp_mst_topology_state *mst_state,
> -=09=09  struct drm_dp_mst_topology_mgr *mgr,
> -=09=09  struct nv50_msto *msto)
> +nv50_msto_prepare(struct nv50_msto *msto)
>  {
>  =09struct nouveau_drm *drm =3D nouveau_drm(msto->encoder.dev);
>  =09struct nv50_mstc *mstc =3D msto->mstc;
>  =09struct nv50_mstm *mstm =3D mstc->mstm;
> -=09struct drm_dp_mst_atomic_payload *payload;
> +=09struct drm_dp_payload *payload =3D NULL;
> =20
> -=09NV_ATOMIC(drm, "%s: msto prepare\n", msto->encoder.name);
> +=09mutex_lock(&mstm->mgr.payload_lock);
> =20
> -=09payload =3D drm_atomic_get_mst_payload_state(mst_state, mstc->port);
> +=09NV_ATOMIC(drm, "%s: msto prepare\n", msto->encoder.name);
> =20
> -=09// TODO: Figure out if we want to do a better job of handling VCPI al=
location failures here?
> -=09if (msto->disabled) {
> -=09=09drm_dp_remove_payload(mgr, mst_state, payload);
> +=09if (mstc->port->vcpi.vcpi > 0)
> +=09=09payload =3D nv50_msto_payload(msto);
> =20
> -=09=09nvif_outp_dp_mst_vcpi(&mstm->outp->outp, msto->head->base.index, 0=
, 0, 0, 0);
> -=09} else {
> -=09=09if (msto->enabled)
> -=09=09=09drm_dp_add_payload_part1(mgr, mst_state, payload);
> +=09if (payload) {
> +=09=09NV_ATOMIC(drm, "%s: %s: %02x %02x %04x %04x\n",
> +=09=09=09  msto->encoder.name, msto->head->base.base.name,
> +=09=09=09  payload->start_slot, payload->num_slots,
> +=09=09=09  mstc->port->vcpi.pbn, mstc->port->vcpi.aligned_pbn);
> =20
>  =09=09nvif_outp_dp_mst_vcpi(&mstm->outp->outp, msto->head->base.index,
> -=09=09=09=09      payload->vc_start_slot, payload->time_slots,
> -=09=09=09=09      payload->pbn, payload->time_slots * mst_state->pbn_div=
);
> +=09=09=09=09      payload->start_slot, payload->num_slots,
> +=09=09=09=09      mstc->port->vcpi.pbn, mstc->port->vcpi.aligned_pbn);
> +=09} else {
> +=09=09NV_ATOMIC(drm, "%s: %s: %02x %02x %04x %04x\n",
> +=09=09=09  msto->encoder.name, msto->head->base.base.name, 0, 0, 0, 0);
> +=09=09nvif_outp_dp_mst_vcpi(&mstm->outp->outp, msto->head->base.index, 0=
, 0, 0, 0);
>  =09}
> +
> +=09mutex_unlock(&mstm->mgr.payload_lock);
>  }
> =20
>  static int
> @@ -905,7 +931,6 @@ nv50_msto_atomic_check(struct drm_encoder *encoder,
>  {
>  =09struct drm_atomic_state *state =3D crtc_state->state;
>  =09struct drm_connector *connector =3D conn_state->connector;
> -=09struct drm_dp_mst_topology_state *mst_state;
>  =09struct nv50_mstc *mstc =3D nv50_mstc(connector);
>  =09struct nv50_mstm *mstm =3D mstc->mstm;
>  =09struct nv50_head_atom *asyh =3D nv50_head_atom(crtc_state);
> @@ -933,18 +958,8 @@ nv50_msto_atomic_check(struct drm_encoder *encoder,
>  =09=09=09=09=09=09    false);
>  =09}
> =20
> -=09mst_state =3D drm_atomic_get_mst_topology_state(state, &mstm->mgr);
> -=09if (IS_ERR(mst_state))
> -=09=09return PTR_ERR(mst_state);
> -
> -=09if (!mst_state->pbn_div) {
> -=09=09struct nouveau_encoder *outp =3D mstc->mstm->outp;
> -
> -=09=09mst_state->pbn_div =3D drm_dp_get_vc_payload_bw(&mstm->mgr,
> -=09=09=09=09=09=09=09      outp->dp.link_bw, outp->dp.link_nr);
> -=09}
> -
> -=09slots =3D drm_dp_atomic_find_time_slots(state, &mstm->mgr, mstc->port=
, asyh->dp.pbn);
> +=09slots =3D drm_dp_atomic_find_time_slots(state, &mstm->mgr, mstc->port=
,
> +=09=09=09=09=09      asyh->dp.pbn, 0);
>  =09if (slots < 0)
>  =09=09return slots;
> =20
> @@ -976,6 +991,7 @@ nv50_msto_atomic_enable(struct drm_encoder *encoder, =
struct drm_atomic_state *st
>  =09struct drm_connector *connector;
>  =09struct drm_connector_list_iter conn_iter;
>  =09u8 proto;
> +=09bool r;
> =20
>  =09drm_connector_list_iter_begin(encoder->dev, &conn_iter);
>  =09drm_for_each_connector_iter(connector, &conn_iter) {
> @@ -990,6 +1006,10 @@ nv50_msto_atomic_enable(struct drm_encoder *encoder=
, struct drm_atomic_state *st
>  =09if (WARN_ON(!mstc))
>  =09=09return;
> =20
> +=09r =3D drm_dp_mst_allocate_vcpi(&mstm->mgr, mstc->port, asyh->dp.pbn, =
asyh->dp.tu);
> +=09if (!r)
> +=09=09DRM_DEBUG_KMS("Failed to allocate VCPI\n");
> +
>  =09if (!mstm->links++) {
>  =09=09/*XXX: MST audio. */
>  =09=09nvif_outp_acquire_dp(&mstm->outp->outp, mstm->outp->dp.dpcd, 0, 0,=
 false, true);
> @@ -1004,7 +1024,6 @@ nv50_msto_atomic_enable(struct drm_encoder *encoder=
, struct drm_atomic_state *st
>  =09=09=09   nv50_dp_bpc_to_depth(asyh->or.bpc));
> =20
>  =09msto->mstc =3D mstc;
> -=09msto->enabled =3D true;
>  =09mstm->modified =3D true;
>  }
> =20
> @@ -1015,6 +1034,8 @@ nv50_msto_atomic_disable(struct drm_encoder *encode=
r, struct drm_atomic_state *s
>  =09struct nv50_mstc *mstc =3D msto->mstc;
>  =09struct nv50_mstm *mstm =3D mstc->mstm;
> =20
> +=09drm_dp_mst_reset_vcpi_slots(&mstm->mgr, mstc->port);
> +
>  =09mstm->outp->update(mstm->outp, msto->head->base.index, NULL, 0, 0);
>  =09mstm->modified =3D true;
>  =09if (!--mstm->links)
> @@ -1234,9 +1255,7 @@ nv50_mstc_new(struct nv50_mstm *mstm, struct drm_dp=
_mst_port *port,
>  }
> =20
>  static void
> -nv50_mstm_cleanup(struct drm_atomic_state *state,
> -=09=09  struct drm_dp_mst_topology_state *mst_state,
> -=09=09  struct nv50_mstm *mstm)
> +nv50_mstm_cleanup(struct nv50_mstm *mstm)
>  {
>  =09struct nouveau_drm *drm =3D nouveau_drm(mstm->outp->base.base.dev);
>  =09struct drm_encoder *encoder;
> @@ -1244,12 +1263,14 @@ nv50_mstm_cleanup(struct drm_atomic_state *state,
>  =09NV_ATOMIC(drm, "%s: mstm cleanup\n", mstm->outp->base.base.name);
>  =09drm_dp_check_act_status(&mstm->mgr);
> =20
> +=09drm_dp_update_payload_part2(&mstm->mgr);
> +
>  =09drm_for_each_encoder(encoder, mstm->outp->base.base.dev) {
>  =09=09if (encoder->encoder_type =3D=3D DRM_MODE_ENCODER_DPMST) {
>  =09=09=09struct nv50_msto *msto =3D nv50_msto(encoder);
>  =09=09=09struct nv50_mstc *mstc =3D msto->mstc;
>  =09=09=09if (mstc && mstc->mstm =3D=3D mstm)
> -=09=09=09=09nv50_msto_cleanup(state, mst_state, &mstm->mgr, msto);
> +=09=09=09=09nv50_msto_cleanup(msto);
>  =09=09}
>  =09}
> =20
> @@ -1257,34 +1278,20 @@ nv50_mstm_cleanup(struct drm_atomic_state *state,
>  }
> =20
>  static void
> -nv50_mstm_prepare(struct drm_atomic_state *state,
> -=09=09  struct drm_dp_mst_topology_state *mst_state,
> -=09=09  struct nv50_mstm *mstm)
> +nv50_mstm_prepare(struct nv50_mstm *mstm)
>  {
>  =09struct nouveau_drm *drm =3D nouveau_drm(mstm->outp->base.base.dev);
>  =09struct drm_encoder *encoder;
> =20
>  =09NV_ATOMIC(drm, "%s: mstm prepare\n", mstm->outp->base.base.name);
> +=09drm_dp_update_payload_part1(&mstm->mgr, 1);
> =20
> -=09/* Disable payloads first */
> -=09drm_for_each_encoder(encoder, mstm->outp->base.base.dev) {
> -=09=09if (encoder->encoder_type =3D=3D DRM_MODE_ENCODER_DPMST) {
> -=09=09=09struct nv50_msto *msto =3D nv50_msto(encoder);
> -=09=09=09struct nv50_mstc *mstc =3D msto->mstc;
> -=09=09=09if (mstc && mstc->mstm =3D=3D mstm && msto->disabled)
> -=09=09=09=09nv50_msto_prepare(state, mst_state, &mstm->mgr, msto);
> -=09=09}
> -=09}
> -
> -=09/* Add payloads for new heads, while also updating the start slots of=
 any unmodified (but
> -=09 * active) heads that may have had their VC slots shifted left after =
the previous step
> -=09 */
>  =09drm_for_each_encoder(encoder, mstm->outp->base.base.dev) {
>  =09=09if (encoder->encoder_type =3D=3D DRM_MODE_ENCODER_DPMST) {
>  =09=09=09struct nv50_msto *msto =3D nv50_msto(encoder);
>  =09=09=09struct nv50_mstc *mstc =3D msto->mstc;
> -=09=09=09if (mstc && mstc->mstm =3D=3D mstm && !msto->disabled)
> -=09=09=09=09nv50_msto_prepare(state, mst_state, &mstm->mgr, msto);
> +=09=09=09if (mstc && mstc->mstm =3D=3D mstm)
> +=09=09=09=09nv50_msto_prepare(msto);
>  =09=09}
>  =09}
> =20
> @@ -1455,7 +1462,9 @@ nv50_mstm_new(struct nouveau_encoder *outp, struct =
drm_dp_aux *aux, int aux_max,
>  =09mstm->mgr.cbs =3D &nv50_mstm;
> =20
>  =09ret =3D drm_dp_mst_topology_mgr_init(&mstm->mgr, dev, aux, aux_max,
> -=09=09=09=09=09   max_payloads, conn_base_id);
> +=09=09=09=09=09   max_payloads, outp->dcb->dpconf.link_nr,
> +=09=09=09=09=09   drm_dp_bw_code_to_link_rate(outp->dcb->dpconf.link_bw)=
,
> +=09=09=09=09=09   conn_base_id);
>  =09if (ret)
>  =09=09return ret;
> =20
> @@ -1902,20 +1911,20 @@ nv50_pior_create(struct drm_connector *connector,=
 struct dcb_output *dcbe)
>  static void
>  nv50_disp_atomic_commit_core(struct drm_atomic_state *state, u32 *interl=
ock)
>  {
> -=09struct drm_dp_mst_topology_mgr *mgr;
> -=09struct drm_dp_mst_topology_state *mst_state;
>  =09struct nouveau_drm *drm =3D nouveau_drm(state->dev);
>  =09struct nv50_disp *disp =3D nv50_disp(drm->dev);
>  =09struct nv50_core *core =3D disp->core;
>  =09struct nv50_mstm *mstm;
> -=09int i;
> +=09struct drm_encoder *encoder;
> =20
>  =09NV_ATOMIC(drm, "commit core %08x\n", interlock[NV50_DISP_INTERLOCK_BA=
SE]);
> =20
> -=09for_each_new_mst_mgr_in_state(state, mgr, mst_state, i) {
> -=09=09mstm =3D nv50_mstm(mgr);
> -=09=09if (mstm->modified)
> -=09=09=09nv50_mstm_prepare(state, mst_state, mstm);
> +=09drm_for_each_encoder(encoder, drm->dev) {
> +=09=09if (encoder->encoder_type !=3D DRM_MODE_ENCODER_DPMST) {
> +=09=09=09mstm =3D nouveau_encoder(encoder)->dp.mstm;
> +=09=09=09if (mstm && mstm->modified)
> +=09=09=09=09nv50_mstm_prepare(mstm);
> +=09=09}
>  =09}
> =20
>  =09core->func->ntfy_init(disp->sync, NV50_DISP_CORE_NTFY);
> @@ -1924,10 +1933,12 @@ nv50_disp_atomic_commit_core(struct drm_atomic_st=
ate *state, u32 *interlock)
>  =09=09=09=09       disp->core->chan.base.device))
>  =09=09NV_ERROR(drm, "core notifier timeout\n");
> =20
> -=09for_each_new_mst_mgr_in_state(state, mgr, mst_state, i) {
> -=09=09mstm =3D nv50_mstm(mgr);
> -=09=09if (mstm->modified)
> -=09=09=09nv50_mstm_cleanup(state, mst_state, mstm);
> +=09drm_for_each_encoder(encoder, drm->dev) {
> +=09=09if (encoder->encoder_type !=3D DRM_MODE_ENCODER_DPMST) {
> +=09=09=09mstm =3D nouveau_encoder(encoder)->dp.mstm;
> +=09=09=09if (mstm && mstm->modified)
> +=09=09=09=09nv50_mstm_cleanup(mstm);
> +=09=09}
>  =09}
>  }
> =20
> diff --git a/include/drm/display/drm_dp_mst_helper.h b/include/drm/displa=
y/drm_dp_mst_helper.h
> index 41fd8352ab65..6b8f738bd622 100644
> --- a/include/drm/display/drm_dp_mst_helper.h
> +++ b/include/drm/display/drm_dp_mst_helper.h
> @@ -48,6 +48,20 @@ struct drm_dp_mst_topology_ref_history {
> =20
>  struct drm_dp_mst_branch;
> =20
> +/**
> + * struct drm_dp_vcpi - Virtual Channel Payload Identifier
> + * @vcpi: Virtual channel ID.
> + * @pbn: Payload Bandwidth Number for this channel
> + * @aligned_pbn: PBN aligned with slot size
> + * @num_slots: number of slots for this PBN
> + */
> +struct drm_dp_vcpi {
> +=09int vcpi;
> +=09int pbn;
> +=09int aligned_pbn;
> +=09int num_slots;
> +};
> +
>  /**
>   * struct drm_dp_mst_port - MST port
>   * @port_num: port number
> @@ -131,6 +145,7 @@ struct drm_dp_mst_port {
>  =09struct drm_dp_aux *passthrough_aux;
>  =09struct drm_dp_mst_branch *parent;
> =20
> +=09struct drm_dp_vcpi vcpi;
>  =09struct drm_connector *connector;
>  =09struct drm_dp_mst_topology_mgr *mgr;
> =20
> @@ -515,6 +530,19 @@ struct drm_dp_mst_topology_cbs {
>  =09void (*poll_hpd_irq)(struct drm_dp_mst_topology_mgr *mgr);
>  };
> =20
> +#define DP_MAX_PAYLOAD (sizeof(unsigned long) * 8)
> +
> +#define DP_PAYLOAD_LOCAL 1
> +#define DP_PAYLOAD_REMOTE 2
> +#define DP_PAYLOAD_DELETE_LOCAL 3
> +
> +struct drm_dp_payload {
> +=09int payload_state;
> +=09int start_slot;
> +=09int num_slots;
> +=09int vcpi;
> +};
> +
>  #define to_dp_mst_topology_state(x) container_of(x, struct drm_dp_mst_to=
pology_state, base)
> =20
>  /**
> @@ -527,34 +555,6 @@ struct drm_dp_mst_atomic_payload {
>  =09/** @port: The MST port assigned to this payload */
>  =09struct drm_dp_mst_port *port;
> =20
> -=09/**
> -=09 * @vc_start_slot: The time slot that this payload starts on. Because=
 payload start slots
> -=09 * can't be determined ahead of time, the contents of this value are =
UNDEFINED at atomic
> -=09 * check time. This shouldn't usually matter, as the start slot shoul=
d never be relevant for
> -=09 * atomic state computations.
> -=09 *
> -=09 * Since this value is determined at commit time instead of check tim=
e, this value is
> -=09 * protected by the MST helpers ensuring that async commits operating=
 on the given topology
> -=09 * never run in parallel. In the event that a driver does need to rea=
d this value (e.g. to
> -=09 * inform hardware of the starting timeslot for a payload), the drive=
r may either:
> -=09 *
> -=09 * * Read this field during the atomic commit after
> -=09 *   drm_dp_mst_atomic_wait_for_dependencies() has been called, which=
 will ensure the
> -=09 *   previous MST states payload start slots have been copied over to=
 the new state. Note
> -=09 *   that a new start slot won't be assigned/removed from this payloa=
d until
> -=09 *   drm_dp_add_payload_part1()/drm_dp_remove_payload() have been cal=
led.
> -=09 * * Acquire the MST modesetting lock, and then wait for any pending =
MST-related commits to
> -=09 *   get committed to hardware by calling drm_crtc_commit_wait() on e=
ach of the
> -=09 *   &drm_crtc_commit structs in &drm_dp_mst_topology_state.commit_de=
ps.
> -=09 *
> -=09 * If neither of the two above solutions suffice (e.g. the driver nee=
ds to read the start
> -=09 * slot in the middle of an atomic commit without waiting for some re=
ason), then drivers
> -=09 * should cache this value themselves after changing payloads.
> -=09 */
> -=09s8 vc_start_slot;
> -
> -=09/** @vcpi: The Virtual Channel Payload Identifier */
> -=09u8 vcpi;
>  =09/**
>  =09 * @time_slots:
>  =09 * The number of timeslots allocated to this payload from the source =
DP Tx to
> @@ -582,6 +582,8 @@ struct drm_dp_mst_topology_state {
>  =09/** @base: Base private state for atomic */
>  =09struct drm_private_state base;
> =20
> +=09/** @payloads: The list of payloads being created/destroyed in this s=
tate */
> +=09struct list_head payloads;
>  =09/** @mgr: The topology manager */
>  =09struct drm_dp_mst_topology_mgr *mgr;
> =20
> @@ -598,21 +600,10 @@ struct drm_dp_mst_topology_state {
>  =09/** @num_commit_deps: The number of CRTC commits in @commit_deps */
>  =09size_t num_commit_deps;
> =20
> -=09/** @payload_mask: A bitmask of allocated VCPIs, used for VCPI assign=
ments */
> -=09u32 payload_mask;
> -=09/** @payloads: The list of payloads being created/destroyed in this s=
tate */
> -=09struct list_head payloads;
> -
>  =09/** @total_avail_slots: The total number of slots this topology can h=
andle (63 or 64) */
>  =09u8 total_avail_slots;
>  =09/** @start_slot: The first usable time slot in this topology (1 or 0)=
 */
>  =09u8 start_slot;
> -
> -=09/**
> -=09 * @pbn_div: The current PBN divisor for this topology. The driver is=
 expected to fill this
> -=09 * out itself.
> -=09 */
> -=09int pbn_div;
>  };
> =20
>  #define to_dp_mst_topology_mgr(x) container_of(x, struct drm_dp_mst_topo=
logy_mgr, base)
> @@ -652,6 +643,14 @@ struct drm_dp_mst_topology_mgr {
>  =09 * @max_payloads: maximum number of payloads the GPU can generate.
>  =09 */
>  =09int max_payloads;
> +=09/**
> +=09 * @max_lane_count: maximum number of lanes the GPU can drive.
> +=09 */
> +=09int max_lane_count;
> +=09/**
> +=09 * @max_link_rate: maximum link rate per lane GPU can output, in kHz.
> +=09 */
> +=09int max_link_rate;
>  =09/**
>  =09 * @conn_base_id: DRM connector ID this mgr is connected to. Only use=
d
>  =09 * to build the MST connector path value.
> @@ -694,20 +693,6 @@ struct drm_dp_mst_topology_mgr {
>  =09 */
>  =09bool payload_id_table_cleared : 1;
> =20
> -=09/**
> -=09 * @payload_count: The number of currently active payloads in hardwar=
e. This value is only
> -=09 * intended to be used internally by MST helpers for payload tracking=
, and is only safe to
> -=09 * read/write from the atomic commit (not check) context.
> -=09 */
> -=09u8 payload_count;
> -
> -=09/**
> -=09 * @next_start_slot: The starting timeslot to use for new VC payloads=
. This value is used
> -=09 * internally by MST helpers for payload tracking, and is only safe t=
o read/write from the
> -=09 * atomic commit (not check) context.
> -=09 */
> -=09u8 next_start_slot;
> -
>  =09/**
>  =09 * @mst_primary: Pointer to the primary/first branch device.
>  =09 */
> @@ -721,6 +706,10 @@ struct drm_dp_mst_topology_mgr {
>  =09 * @sink_count: Sink count from DEVICE_SERVICE_IRQ_VECTOR_ESI0.
>  =09 */
>  =09u8 sink_count;
> +=09/**
> +=09 * @pbn_div: PBN to slots divisor.
> +=09 */
> +=09int pbn_div;
> =20
>  =09/**
>  =09 * @funcs: Atomic helper callbacks
> @@ -737,6 +726,32 @@ struct drm_dp_mst_topology_mgr {
>  =09 */
>  =09struct list_head tx_msg_downq;
> =20
> +=09/**
> +=09 * @payload_lock: Protect payload information.
> +=09 */
> +=09struct mutex payload_lock;
> +=09/**
> +=09 * @proposed_vcpis: Array of pointers for the new VCPI allocation. Th=
e
> +=09 * VCPI structure itself is &drm_dp_mst_port.vcpi, and the size of
> +=09 * this array is determined by @max_payloads.
> +=09 */
> +=09struct drm_dp_vcpi **proposed_vcpis;
> +=09/**
> +=09 * @payloads: Array of payloads. The size of this array is determined
> +=09 * by @max_payloads.
> +=09 */
> +=09struct drm_dp_payload *payloads;
> +=09/**
> +=09 * @payload_mask: Elements of @payloads actually in use. Since
> +=09 * reallocation of active outputs isn't possible gaps can be created =
by
> +=09 * disabling outputs out of order compared to how they've been enable=
d.
> +=09 */
> +=09unsigned long payload_mask;
> +=09/**
> +=09 * @vcpi_mask: Similar to @payload_mask, but for @proposed_vcpis.
> +=09 */
> +=09unsigned long vcpi_mask;
> +
>  =09/**
>  =09 * @tx_waitq: Wait to queue stall for the tx worker.
>  =09 */
> @@ -808,7 +823,9 @@ struct drm_dp_mst_topology_mgr {
>  int drm_dp_mst_topology_mgr_init(struct drm_dp_mst_topology_mgr *mgr,
>  =09=09=09=09 struct drm_device *dev, struct drm_dp_aux *aux,
>  =09=09=09=09 int max_dpcd_transaction_bytes,
> -=09=09=09=09 int max_payloads, int conn_base_id);
> +=09=09=09=09 int max_payloads,
> +=09=09=09=09 int max_lane_count, int max_link_rate,
> +=09=09=09=09 int conn_base_id);
> =20
>  void drm_dp_mst_topology_mgr_destroy(struct drm_dp_mst_topology_mgr *mgr=
);
> =20
> @@ -831,17 +848,28 @@ int drm_dp_get_vc_payload_bw(const struct drm_dp_ms=
t_topology_mgr *mgr,
> =20
>  int drm_dp_calc_pbn_mode(int clock, int bpp, bool dsc);
> =20
> +bool drm_dp_mst_allocate_vcpi(struct drm_dp_mst_topology_mgr *mgr,
> +=09=09=09      struct drm_dp_mst_port *port, int pbn, int slots);
> +
> +int drm_dp_mst_get_vcpi_slots(struct drm_dp_mst_topology_mgr *mgr, struc=
t drm_dp_mst_port *port);
> +
> +
> +void drm_dp_mst_reset_vcpi_slots(struct drm_dp_mst_topology_mgr *mgr, st=
ruct drm_dp_mst_port *port);
> +
>  void drm_dp_mst_update_slots(struct drm_dp_mst_topology_state *mst_state=
, uint8_t link_encoding_cap);
> =20
> -int drm_dp_add_payload_part1(struct drm_dp_mst_topology_mgr *mgr,
> -=09=09=09     struct drm_dp_mst_topology_state *mst_state,
> -=09=09=09     struct drm_dp_mst_atomic_payload *payload);
> -int drm_dp_add_payload_part2(struct drm_dp_mst_topology_mgr *mgr,
> -=09=09=09     struct drm_atomic_state *state,
> -=09=09=09     struct drm_dp_mst_atomic_payload *payload);
> -void drm_dp_remove_payload(struct drm_dp_mst_topology_mgr *mgr,
> -=09=09=09   struct drm_dp_mst_topology_state *mst_state,
> -=09=09=09   struct drm_dp_mst_atomic_payload *payload);
> +void drm_dp_mst_deallocate_vcpi(struct drm_dp_mst_topology_mgr *mgr,
> +=09=09=09=09struct drm_dp_mst_port *port);
> +
> +
> +int drm_dp_find_vcpi_slots(struct drm_dp_mst_topology_mgr *mgr,
> +=09=09=09   int pbn);
> +
> +
> +int drm_dp_update_payload_part1(struct drm_dp_mst_topology_mgr *mgr, int=
 start_slot);
> +
> +
> +int drm_dp_update_payload_part2(struct drm_dp_mst_topology_mgr *mgr);
> =20
>  int drm_dp_check_act_status(struct drm_dp_mst_topology_mgr *mgr);
> =20
> @@ -863,22 +891,17 @@ int drm_dp_mst_connector_late_register(struct drm_c=
onnector *connector,
>  void drm_dp_mst_connector_early_unregister(struct drm_connector *connect=
or,
>  =09=09=09=09=09   struct drm_dp_mst_port *port);
> =20
> -struct drm_dp_mst_topology_state *
> -drm_atomic_get_mst_topology_state(struct drm_atomic_state *state,
> -=09=09=09=09  struct drm_dp_mst_topology_mgr *mgr);
> -struct drm_dp_mst_topology_state *
> -drm_atomic_get_new_mst_topology_state(struct drm_atomic_state *state,
> -=09=09=09=09      struct drm_dp_mst_topology_mgr *mgr);
> -struct drm_dp_mst_atomic_payload *
> -drm_atomic_get_mst_payload_state(struct drm_dp_mst_topology_state *state=
,
> -=09=09=09=09 struct drm_dp_mst_port *port);
> +struct drm_dp_mst_topology_state *drm_atomic_get_mst_topology_state(stru=
ct drm_atomic_state *state,
> +=09=09=09=09=09=09=09=09    struct drm_dp_mst_topology_mgr *mgr);
>  int __must_check
>  drm_dp_atomic_find_time_slots(struct drm_atomic_state *state,
>  =09=09=09      struct drm_dp_mst_topology_mgr *mgr,
> -=09=09=09      struct drm_dp_mst_port *port, int pbn);
> +=09=09=09      struct drm_dp_mst_port *port, int pbn,
> +=09=09=09      int pbn_div);
>  int drm_dp_mst_atomic_enable_dsc(struct drm_atomic_state *state,
>  =09=09=09=09 struct drm_dp_mst_port *port,
> -=09=09=09=09 int pbn, bool enable);
> +=09=09=09=09 int pbn, int pbn_div,
> +=09=09=09=09 bool enable);
>  int __must_check
>  drm_dp_mst_add_affected_dsc_crtcs(struct drm_atomic_state *state,
>  =09=09=09=09  struct drm_dp_mst_topology_mgr *mgr);
> @@ -902,12 +925,6 @@ void drm_dp_mst_put_port_malloc(struct drm_dp_mst_po=
rt *port);
> =20
>  struct drm_dp_aux *drm_dp_mst_dsc_aux_for_port(struct drm_dp_mst_port *p=
ort);
> =20
> -static inline struct drm_dp_mst_topology_state *
> -to_drm_dp_mst_topology_state(struct drm_private_state *state)
> -{
> -=09return container_of(state, struct drm_dp_mst_topology_state, base);
> -}
> -
>  extern const struct drm_private_state_funcs drm_dp_mst_topology_state_fu=
ncs;
> =20
>  /**

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

