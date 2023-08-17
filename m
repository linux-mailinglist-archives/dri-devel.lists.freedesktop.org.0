Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C98E7800EF
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 00:16:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EA1D10E0FD;
	Thu, 17 Aug 2023 22:16:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EF4C10E0D1
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 22:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1692310597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P3PCQOLRIx1PzYCe9IUSs5upGQv/qQEucYKv/C+9Pgc=;
 b=KdWwndt8YlXepkbtaxa27YbI9vzhqiRg7TSyN5eFhOkNbNcKeAiTUcYUZUbSVhCDDz8tD9
 z2KfptiYZ3ElSSl1wAM8YMNTrbkkLtwCKsuYC45SCNUCtScRlFZVwtIOlwHrK+HCqQV9Lt
 vIeBcFrfOc9lyPFRM9F/Qin7q5WA4bw=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-85-w3pHcO5QNmaTzA7R4opwyg-1; Thu, 17 Aug 2023 18:16:33 -0400
X-MC-Unique: w3pHcO5QNmaTzA7R4opwyg-1
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-76d808e4c26so36169685a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 15:16:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692310593; x=1692915393;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wFmO6dd22Ynp1gA2bq7Ob6T8/9nHQOvKS5RnaUrD8d8=;
 b=VPME43QGw2EbNRg7SyEPQaJZ69FTHqIGyJfLYn758sdUnruziHvk65aJ1ro/zUYQ6T
 3GQpASu09rxr1YaovfJ6QBT2H1ioMEjxSIvzBDlU7NeNK+BUfYcK1gYtRrtmNhjjRUJE
 qX4ISGONqwwgeIb87dWGs+3oKvIHglP8tX3vNPNuJIZYHEqXTa89lPapUvzsVt6W/Kba
 CpR1uHMQET2GasV0yXmDLH4ysgiOgFFdWWehgnK5dCuwl/dzKEB6FSDLSJhSYGCp9GMZ
 Iwa7e4iWXQyNbMjwjl42sT7bu4W+RbMm0ddwm4uXhfc1uvXShcplsfbbagfysItciZ4g
 DquQ==
X-Gm-Message-State: AOJu0YxWfkCb4lVPYk81l2ffUHfYyyZeWrGmFiZocqwI0E9w+7mlQi7X
 XKG10qpcsa5NSIg4W9U+j28DTAuO29P37pH/bxZtTRnQR/4ppVznKZ+GReVe/DN1KNQoUkuiUkE
 5lal8l1YCGklmPKzmbTwq8gH3t2el
X-Received: by 2002:a05:620a:45a6:b0:765:a23b:cc27 with SMTP id
 bp38-20020a05620a45a600b00765a23bcc27mr1188134qkb.14.1692310593096; 
 Thu, 17 Aug 2023 15:16:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHeJ10VEKKpM3M8Snpm188sQmR+JowiVyukpOAO/NHEnlB16s0WUXG4RBtbbUtcuSdK6GHFYA==
X-Received: by 2002:a05:620a:45a6:b0:765:a23b:cc27 with SMTP id
 bp38-20020a05620a45a600b00765a23bcc27mr1188118qkb.14.1692310592653; 
 Thu, 17 Aug 2023 15:16:32 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c7d:5f00::feb? ([2600:4040:5c7d:5f00::feb])
 by smtp.gmail.com with ESMTPSA id
 a11-20020a05620a16cb00b0076c701c3e71sm108697qkn.121.2023.08.17.15.16.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Aug 2023 15:16:32 -0700 (PDT)
Message-ID: <9b1c1ebc68a7c2adf8df86ca4a252e2d13a7b760.camel@redhat.com>
Subject: Re: [Patch v2 2/3] drm/mst: Refactor the flow for payload
 allocation/removement
From: Lyude Paul <lyude@redhat.com>
To: Wayne Lin <Wayne.Lin@amd.com>, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org
Date: Thu, 17 Aug 2023 18:16:31 -0400
In-Reply-To: <20230807025639.1612361-3-Wayne.Lin@amd.com>
References: <20230807025639.1612361-1-Wayne.Lin@amd.com>
 <20230807025639.1612361-3-Wayne.Lin@amd.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.48.3 (3.48.3-1.fc38)
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
Cc: jani.nikula@intel.com, jerry.zuo@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Two small comments:

On Mon, 2023-08-07 at 10:56 +0800, Wayne Lin wrote:
> [Why]
> Today, the allocation/deallocation steps and status is a bit unclear.
>=20
> For instance, payload->vc_start_slot =3D -1 stands for "the failure of
> updating DPCD payload ID table" and can also represent as "payload is not
> allocated yet". These two cases should be handled differently and hence
> better to distinguish them for better understanding.
>=20
> [How]
> Define enumeration - ALLOCATION_LOCAL, ALLOCATION_DFP and ALLOCATION_REMO=
TE
> to distinguish different allocation status. Adjust the code to handle
> different status accordingly for better understanding the sequence of
> payload allocation and payload removement.
>=20
> For payload creation, the procedure should look like this:
> DRM part 1:
> * step 1 - update sw mst mgr variables to add a new payload
> * step 2 - add payload at immediate DFP DPCD payload table
>=20
> Driver:
> * Add new payload in HW and sync up with DFP by sending ACT
>=20
> DRM Part 2:
> * Send ALLOCATE_PAYLOAD sideband message to allocate bandwidth along the
>   virtual channel.
>=20
> And as for payload removement, the procedure should look like this:
> DRM part 1:
> * step 1 - Send ALLOCATE_PAYLOAD sideband message to release bandwidth
>            along the virtual channel
> * step 2 - Clear payload allocation at immediate DFP DPCD payload table
>=20
> Driver:
> * Remove the payload in HW and sync up with DFP by sending ACT
>=20
> DRM part 2:
> * update sw mst mgr variables to remove the payload
>=20
> Note that it's fine to fail when communicate with the branch device
> connected at immediate downstrean-facing port, but updating variables of
> SW mst mgr and HW configuration should be conducted anyway. That's becaus=
e
> it's under commit_tail and we need to complete the HW programming.
>=20
> Changes since v1:
> * Remove the set but not use variable 'old_payload' in function
>   'nv50_msto_prepare'. Catched by kernel test robot <lkp@intel.com>
>=20
> Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
> ---
>  .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c |  20 ++-
>  drivers/gpu/drm/display/drm_dp_mst_topology.c | 159 +++++++++++-------
>  drivers/gpu/drm/i915/display/intel_dp_mst.c   |  18 +-
>  drivers/gpu/drm/nouveau/dispnv50/disp.c       |  21 +--
>  include/drm/display/drm_dp_mst_helper.h       |  23 ++-
>  5 files changed, 153 insertions(+), 88 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/=
drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> index d9a482908380..9ad509279b0a 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> @@ -219,7 +219,7 @@ static void dm_helpers_construct_old_payload(
>  =09/* Set correct time_slots/PBN of old payload.
>  =09 * other fields (delete & dsc_enabled) in
>  =09 * struct drm_dp_mst_atomic_payload are don't care fields
> -=09 * while calling drm_dp_remove_payload()
> +=09 * while calling drm_dp_remove_payload_part2()
>  =09 */
>  =09for (i =3D 0; i < current_link_table.stream_count; i++) {
>  =09=09dc_alloc =3D
> @@ -262,13 +262,12 @@ bool dm_helpers_dp_mst_write_payload_allocation_tab=
le(
> =20
>  =09mst_mgr =3D &aconnector->mst_root->mst_mgr;
>  =09mst_state =3D to_drm_dp_mst_topology_state(mst_mgr->base.state);
> -
> -=09/* It's OK for this to fail */
>  =09new_payload =3D drm_atomic_get_mst_payload_state(mst_state, aconnecto=
r->mst_output_port);
> =20
>  =09if (enable) {
>  =09=09target_payload =3D new_payload;
> =20
> +=09=09/* It's OK for this to fail */
>  =09=09drm_dp_add_payload_part1(mst_mgr, mst_state, new_payload);
>  =09} else {
>  =09=09/* construct old payload by VCPI*/
> @@ -276,7 +275,7 @@ bool dm_helpers_dp_mst_write_payload_allocation_table=
(
>  =09=09=09=09=09=09new_payload, &old_payload);
>  =09=09target_payload =3D &old_payload;
> =20
> -=09=09drm_dp_remove_payload(mst_mgr, mst_state, &old_payload, new_payloa=
d);
> +=09=09drm_dp_remove_payload_part1(mst_mgr, mst_state, new_payload);
>  =09}
> =20
>  =09/* mst_mgr->->payloads are VC payload notify MST branch using DPCD or
> @@ -342,7 +341,7 @@ bool dm_helpers_dp_mst_send_payload_allocation(
>  =09struct amdgpu_dm_connector *aconnector;
>  =09struct drm_dp_mst_topology_state *mst_state;
>  =09struct drm_dp_mst_topology_mgr *mst_mgr;
> -=09struct drm_dp_mst_atomic_payload *payload;
> +=09struct drm_dp_mst_atomic_payload *new_payload, *old_payload;
>  =09enum mst_progress_status set_flag =3D MST_ALLOCATE_NEW_PAYLOAD;
>  =09enum mst_progress_status clr_flag =3D MST_CLEAR_ALLOCATED_PAYLOAD;
>  =09int ret =3D 0;
> @@ -355,15 +354,20 @@ bool dm_helpers_dp_mst_send_payload_allocation(
>  =09mst_mgr =3D &aconnector->mst_root->mst_mgr;
>  =09mst_state =3D to_drm_dp_mst_topology_state(mst_mgr->base.state);
> =20
> -=09payload =3D drm_atomic_get_mst_payload_state(mst_state, aconnector->m=
st_output_port);
> +=09new_payload =3D drm_atomic_get_mst_payload_state(mst_state, aconnecto=
r->mst_output_port);
> =20
>  =09if (!enable) {
>  =09=09set_flag =3D MST_CLEAR_ALLOCATED_PAYLOAD;
>  =09=09clr_flag =3D MST_ALLOCATE_NEW_PAYLOAD;
>  =09}
> =20
> -=09if (enable)
> -=09=09ret =3D drm_dp_add_payload_part2(mst_mgr, mst_state->base.state, p=
ayload);
> +=09if (enable) {
> +=09=09ret =3D drm_dp_add_payload_part2(mst_mgr, mst_state->base.state, n=
ew_payload);
> +=09} else {
> +=09=09dm_helpers_construct_old_payload(stream->link, mst_state->pbn_div,
> +=09=09=09=09=09=09 new_payload, old_payload);
> +=09=09drm_dp_remove_payload_part2(mst_mgr, mst_state, old_payload, new_p=
ayload);
> +=09}
> =20
>  =09if (ret) {
>  =09=09amdgpu_dm_set_mst_status(&aconnector->mst_status,
> diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/=
drm/display/drm_dp_mst_topology.c
> index 4d80426757ab..e04f87ff755a 100644
> --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> @@ -3255,15 +3255,15 @@ int drm_dp_send_query_stream_enc_status(struct dr=
m_dp_mst_topology_mgr *mgr,
>  }
>  EXPORT_SYMBOL(drm_dp_send_query_stream_enc_status);
> =20
> -static int drm_dp_create_payload_step1(struct drm_dp_mst_topology_mgr *m=
gr,
> -=09=09=09=09       struct drm_dp_mst_atomic_payload *payload)
> +static int drm_dp_create_payload_at_dfp(struct drm_dp_mst_topology_mgr *=
mgr,
> +=09=09=09=09=09struct drm_dp_mst_atomic_payload *payload)
>  {
>  =09return drm_dp_dpcd_write_payload(mgr, payload->vcpi, payload->vc_star=
t_slot,
>  =09=09=09=09=09 payload->time_slots);
>  }
> =20
> -static int drm_dp_create_payload_step2(struct drm_dp_mst_topology_mgr *m=
gr,
> -=09=09=09=09       struct drm_dp_mst_atomic_payload *payload)
> +static int drm_dp_create_payload_to_remote(struct drm_dp_mst_topology_mg=
r *mgr,
> +=09=09=09=09=09   struct drm_dp_mst_atomic_payload *payload)
>  {
>  =09int ret;
>  =09struct drm_dp_mst_port *port =3D drm_dp_mst_topology_get_port_validat=
ed(mgr, payload->port);
> @@ -3276,17 +3276,20 @@ static int drm_dp_create_payload_step2(struct drm=
_dp_mst_topology_mgr *mgr,
>  =09return ret;
>  }
> =20
> -static int drm_dp_destroy_payload_step1(struct drm_dp_mst_topology_mgr *=
mgr,
> -=09=09=09=09=09struct drm_dp_mst_topology_state *mst_state,
> -=09=09=09=09=09struct drm_dp_mst_atomic_payload *payload)
> +static void drm_dp_destroy_payload_at_remote_and_dfp(struct drm_dp_mst_t=
opology_mgr *mgr,
> +=09=09=09=09=09=09     struct drm_dp_mst_topology_state *mst_state,
> +=09=09=09=09=09=09     struct drm_dp_mst_atomic_payload *payload)
>  {
>  =09drm_dbg_kms(mgr->dev, "\n");
> =20
>  =09/* it's okay for these to fail */
> -=09drm_dp_payload_send_msg(mgr, payload->port, payload->vcpi, 0);
> -=09drm_dp_dpcd_write_payload(mgr, payload->vcpi, payload->vc_start_slot,=
 0);
> +=09if (payload->payload_allocation_status =3D=3D DRM_DP_MST_PAYLOAD_ALLO=
CATION_REMOTE) {
> +=09=09drm_dp_payload_send_msg(mgr, payload->port, payload->vcpi, 0);
> +=09=09payload->payload_allocation_status =3D DRM_DP_MST_PAYLOAD_ALLOCATI=
ON_DFP;
> +=09}
> =20
> -=09return 0;
> +=09if (payload->payload_allocation_status =3D=3D DRM_DP_MST_PAYLOAD_ALLO=
CATION_DFP)
> +=09=09drm_dp_dpcd_write_payload(mgr, payload->vcpi, payload->vc_start_sl=
ot, 0);
>  }
> =20
>  /**
> @@ -3296,81 +3299,105 @@ static int drm_dp_destroy_payload_step1(struct d=
rm_dp_mst_topology_mgr *mgr,
>   * @payload: The payload to write
>   *
>   * Determines the starting time slot for the given payload, and programs=
 the VCPI for this payload
> - * into hardware. After calling this, the driver should generate ACT and=
 payload packets.
> + * into the DPCD of DPRX. After calling this, the driver should generate=
 ACT and payload packets.
>   *
> - * Returns: 0 on success, error code on failure. In the event that this =
fails,
> - * @payload.vc_start_slot will also be set to -1.
> + * Returns: 0 on success, error code on failure.
>   */
>  int drm_dp_add_payload_part1(struct drm_dp_mst_topology_mgr *mgr,
>  =09=09=09     struct drm_dp_mst_topology_state *mst_state,
>  =09=09=09     struct drm_dp_mst_atomic_payload *payload)
>  {
>  =09struct drm_dp_mst_port *port;
> -=09int ret;
> +=09int ret =3D 0;
> +=09bool allocate =3D true;
> +
> +=09/* Update mst mgr info */
> +=09if (mgr->payload_count =3D=3D 0)
> +=09=09mgr->next_start_slot =3D mst_state->start_slot;
> +
> +=09payload->vc_start_slot =3D mgr->next_start_slot;
> +
> +=09mgr->payload_count++;
> +=09mgr->next_start_slot +=3D payload->time_slots;
> =20
> +=09/* Allocate payload to immediate downstream facing port */
>  =09port =3D drm_dp_mst_topology_get_port_validated(mgr, payload->port);
>  =09if (!port) {
>  =09=09drm_dbg_kms(mgr->dev,
> -=09=09=09    "VCPI %d for port %p not in topology, not creating a payloa=
d\n",
> +=09=09=09    "VCPI %d for port %p not in topology, not creating a payloa=
d to remote\n",
>  =09=09=09    payload->vcpi, payload->port);
> -=09=09payload->vc_start_slot =3D -1;
> -=09=09return 0;
> +=09=09allocate =3D false;
>  =09}
> =20
> -=09if (mgr->payload_count =3D=3D 0)
> -=09=09mgr->next_start_slot =3D mst_state->start_slot;
> -
> -=09payload->vc_start_slot =3D mgr->next_start_slot;
> +=09if (allocate) {
> +=09=09ret =3D drm_dp_create_payload_at_dfp(mgr, payload);
> +=09=09if (ret < 0)
> +=09=09=09drm_warn(mgr->dev, "Failed to create MST payload for port %p: %=
d\n",
> +=09=09=09=09 payload->port, ret);
> =20
> -=09ret =3D drm_dp_create_payload_step1(mgr, payload);
> -=09drm_dp_mst_topology_put_port(port);
> -=09if (ret < 0) {
> -=09=09drm_warn(mgr->dev, "Failed to create MST payload for port %p: %d\n=
",
> -=09=09=09 payload->port, ret);
> -=09=09payload->vc_start_slot =3D -1;
> -=09=09return ret;
>  =09}
> =20
> -=09mgr->payload_count++;
> -=09mgr->next_start_slot +=3D payload->time_slots;
> +=09payload->payload_allocation_status =3D
> +=09=09(!allocate || ret < 0) ? DRM_DP_MST_PAYLOAD_ALLOCATION_LOCAL :
> +=09=09=09=09=09=09=09=09DRM_DP_MST_PAYLOAD_ALLOCATION_DFP;

Just need to fix indenting here

> =20
> -=09return 0;
> +=09drm_dp_mst_topology_put_port(port);
> +
> +=09return ret;
>  }
>  EXPORT_SYMBOL(drm_dp_add_payload_part1);
> =20
>  /**
> - * drm_dp_remove_payload() - Remove an MST payload
> + * drm_dp_remove_payload_part1() - Remove an MST payload along the virtu=
al channel
>   * @mgr: Manager to use.
>   * @mst_state: The MST atomic state
> - * @old_payload: The payload with its old state
> - * @new_payload: The payload to write
> + * @payload: The payload to remove
>   *
> - * Removes a payload from an MST topology if it was successfully assigne=
d a start slot. Also updates
> - * the starting time slots of all other payloads which would have been s=
hifted towards the start of
> - * the VC table as a result. After calling this, the driver should gener=
ate ACT and payload packets.
> + * Removes a payload along the virtual channel if it was successfully al=
located.
> + * After calling this, the driver should set HW to generate ACT and then=
 switch to new
> + * payload allocation state.
>   */
> -void drm_dp_remove_payload(struct drm_dp_mst_topology_mgr *mgr,
> -=09=09=09   struct drm_dp_mst_topology_state *mst_state,
> -=09=09=09   const struct drm_dp_mst_atomic_payload *old_payload,
> -=09=09=09   struct drm_dp_mst_atomic_payload *new_payload)
> +void drm_dp_remove_payload_part1(struct drm_dp_mst_topology_mgr *mgr,
> +=09=09=09=09 struct drm_dp_mst_topology_state *mst_state,
> +=09=09=09=09 struct drm_dp_mst_atomic_payload *payload)
>  {
> -=09struct drm_dp_mst_atomic_payload *pos;
> +=09/* Remove remote payload allocation */
>  =09bool send_remove =3D false;
> =20
> -=09/* We failed to make the payload, so nothing to do */
> -=09if (new_payload->vc_start_slot =3D=3D -1)
> -=09=09return;
> -
>  =09mutex_lock(&mgr->lock);
> -=09send_remove =3D drm_dp_mst_port_downstream_of_branch(new_payload->por=
t, mgr->mst_primary);
> +=09send_remove =3D drm_dp_mst_port_downstream_of_branch(payload->port, m=
gr->mst_primary);
>  =09mutex_unlock(&mgr->lock);
> =20
>  =09if (send_remove)
> -=09=09drm_dp_destroy_payload_step1(mgr, mst_state, new_payload);
> +=09=09drm_dp_destroy_payload_at_remote_and_dfp(mgr, mst_state, payload);
>  =09else
>  =09=09drm_dbg_kms(mgr->dev, "Payload for VCPI %d not in topology, not se=
nding remove\n",
> -=09=09=09    new_payload->vcpi);
> +=09=09=09    payload->vcpi);
> +
> +=09payload->payload_allocation_status =3D DRM_DP_MST_PAYLOAD_ALLOCATION_=
LOCAL;
> +}
> +EXPORT_SYMBOL(drm_dp_remove_payload_part1);
> =20
> +/**
> + * drm_dp_remove_payload_part2() - Remove an MST payload locally
> + * @mgr: Manager to use.
> + * @mst_state: The MST atomic state
> + * @old_payload: The payload with its old state
> + * @new_payload: The payload with its latest state
> + *
> + * Updates the starting time slots of all other payloads which would hav=
e been shifted towards
> + * the start of the payload ID table as a result of removing a payload. =
Driver should call this
> + * function whenever it removes a payload in its HW. It's independent to=
 the result of payload
> + * allocation/deallocation at branch devices along the virtual channel.
> + */
> +void drm_dp_remove_payload_part2(struct drm_dp_mst_topology_mgr *mgr,
> +=09=09=09=09 struct drm_dp_mst_topology_state *mst_state,
> +=09=09=09=09 const struct drm_dp_mst_atomic_payload *old_payload,
> +=09=09=09=09 struct drm_dp_mst_atomic_payload *new_payload)
> +{
> +=09struct drm_dp_mst_atomic_payload *pos;
> +
> +=09/* Remove local payload allocation */
>  =09list_for_each_entry(pos, &mst_state->payloads, next) {
>  =09=09if (pos !=3D new_payload && pos->vc_start_slot > new_payload->vc_s=
tart_slot)
>  =09=09=09pos->vc_start_slot -=3D old_payload->time_slots;
> @@ -3382,9 +3409,10 @@ void drm_dp_remove_payload(struct drm_dp_mst_topol=
ogy_mgr *mgr,
> =20
>  =09if (new_payload->delete)
>  =09=09drm_dp_mst_put_port_malloc(new_payload->port);
> -}
> -EXPORT_SYMBOL(drm_dp_remove_payload);
> =20
> +=09new_payload->payload_allocation_status =3D DRM_DP_MST_PAYLOAD_ALLOCAT=
ION_NONE;
> +}
> +EXPORT_SYMBOL(drm_dp_remove_payload_part2);
>  /**
>   * drm_dp_add_payload_part2() - Execute payload update part 2
>   * @mgr: Manager to use.
> @@ -3403,17 +3431,19 @@ int drm_dp_add_payload_part2(struct drm_dp_mst_to=
pology_mgr *mgr,
>  =09int ret =3D 0;
> =20
>  =09/* Skip failed payloads */
> -=09if (payload->vc_start_slot =3D=3D -1) {
> -=09=09drm_dbg_kms(mgr->dev, "Part 1 of payload creation for %s failed, s=
kipping part 2\n",
> +=09if (payload->payload_allocation_status !=3D DRM_DP_MST_PAYLOAD_ALLOCA=
TION_DFP) {
> +=09=09drm_dbg_kms(state->dev, "Part 1 of payload creation for %s failed,=
 skipping part 2\n",
>  =09=09=09    payload->port->connector->name);
>  =09=09return -EIO;
>  =09}
> =20
> -=09ret =3D drm_dp_create_payload_step2(mgr, payload);
> -=09if (ret < 0) {
> +=09/* Allocate payload to remote end */
> +=09ret =3D drm_dp_create_payload_to_remote(mgr, payload);
> +=09if (ret < 0)
>  =09=09drm_err(mgr->dev, "Step 2 of creating MST payload for %p failed: %=
d\n",
>  =09=09=09payload->port, ret);
> -=09}
> +=09else
> +=09=09payload->payload_allocation_status =3D DRM_DP_MST_PAYLOAD_ALLOCATI=
ON_REMOTE;
> =20
>  =09return ret;
>  }
> @@ -4324,6 +4354,7 @@ int drm_dp_atomic_find_time_slots(struct drm_atomic=
_state *state,
>  =09=09drm_dp_mst_get_port_malloc(port);
>  =09=09payload->port =3D port;
>  =09=09payload->vc_start_slot =3D -1;
> +=09=09payload->payload_allocation_status =3D DRM_DP_MST_PAYLOAD_ALLOCATI=
ON_NONE;
>  =09=09list_add(&payload->next, &topology_state->payloads);
>  =09}
>  =09payload->time_slots =3D req_slots;
> @@ -4493,7 +4524,7 @@ void drm_dp_mst_atomic_wait_for_dependencies(struct=
 drm_atomic_state *state)
>  =09=09}
> =20
>  =09=09/* Now that previous state is committed, it's safe to copy over th=
e start slot
> -=09=09 * assignments
> +=09=09 * and allocation status assignments
>  =09=09 */
>  =09=09list_for_each_entry(old_payload, &old_mst_state->payloads, next) {
>  =09=09=09if (old_payload->delete)
> @@ -4502,6 +4533,8 @@ void drm_dp_mst_atomic_wait_for_dependencies(struct=
 drm_atomic_state *state)
>  =09=09=09new_payload =3D drm_atomic_get_mst_payload_state(new_mst_state,
>  =09=09=09=09=09=09=09=09       old_payload->port);
>  =09=09=09new_payload->vc_start_slot =3D old_payload->vc_start_slot;
> +=09=09=09new_payload->payload_allocation_status =3D
> +=09=09=09=09=09=09=09old_payload->payload_allocation_status;

And here. Besides that, I think patches 1/3 and 2/3 look great! Just finish=
ed
testing them on nouveau:

Reviewed-by: Lyude Paul <lyude@redhat.com>

Patch 3/3 I gotta think about a bit more (and am curious about Imre's curre=
nt
take on it) I think

>  =09=09}
>  =09}
>  }
> @@ -4818,6 +4851,13 @@ void drm_dp_mst_dump_topology(struct seq_file *m,
>  =09struct drm_dp_mst_atomic_payload *payload;
>  =09int i, ret;
> =20
> +=09static const char *const status[] =3D {
> +=09=09"None",
> +=09=09"Local",
> +=09=09"DFP",
> +=09=09"Remote",
> +=09};
> +
>  =09mutex_lock(&mgr->lock);
>  =09if (mgr->mst_primary)
>  =09=09drm_dp_mst_dump_mstb(m, mgr->mst_primary);
> @@ -4834,7 +4874,7 @@ void drm_dp_mst_dump_topology(struct seq_file *m,
>  =09seq_printf(m, "payload_mask: %x, max_payloads: %d, start_slot: %u, pb=
n_div: %d\n",
>  =09=09   state->payload_mask, mgr->max_payloads, state->start_slot, stat=
e->pbn_div);
> =20
> -=09seq_printf(m, "\n| idx | port | vcpi | slots | pbn | dsc |     sink n=
ame     |\n");
> +=09seq_printf(m, "\n| idx | port | vcpi | slots | pbn | dsc | status |  =
   sink name     |\n");
>  =09for (i =3D 0; i < mgr->max_payloads; i++) {
>  =09=09list_for_each_entry(payload, &state->payloads, next) {
>  =09=09=09char name[14];
> @@ -4843,7 +4883,7 @@ void drm_dp_mst_dump_topology(struct seq_file *m,
>  =09=09=09=09continue;
> =20
>  =09=09=09fetch_monitor_name(mgr, payload->port, name, sizeof(name));
> -=09=09=09seq_printf(m, " %5d %6d %6d %02d - %02d %5d %5s %19s\n",
> +=09=09=09seq_printf(m, " %5d %6d %6d %02d - %02d %5d %5s %8s %19s\n",
>  =09=09=09=09   i,
>  =09=09=09=09   payload->port->port_num,
>  =09=09=09=09   payload->vcpi,
> @@ -4851,6 +4891,7 @@ void drm_dp_mst_dump_topology(struct seq_file *m,
>  =09=09=09=09   payload->vc_start_slot + payload->time_slots - 1,
>  =09=09=09=09   payload->pbn,
>  =09=09=09=09   payload->dsc_enabled ? "Y" : "N",
> +=09=09=09=09   status[payload->payload_allocation_status],
>  =09=09=09=09   (*name !=3D 0) ? name : "Unknown");
>  =09=09}
>  =09}
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/dr=
m/i915/display/intel_dp_mst.c
> index e3f176a093d2..5f73cdabe7a1 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -557,12 +557,8 @@ static void intel_mst_disable_dp(struct intel_atomic=
_state *state,
>  =09struct intel_dp *intel_dp =3D &dig_port->dp;
>  =09struct intel_connector *connector =3D
>  =09=09to_intel_connector(old_conn_state->connector);
> -=09struct drm_dp_mst_topology_state *old_mst_state =3D
> -=09=09drm_atomic_get_old_mst_topology_state(&state->base, &intel_dp->mst=
_mgr);
>  =09struct drm_dp_mst_topology_state *new_mst_state =3D
>  =09=09drm_atomic_get_new_mst_topology_state(&state->base, &intel_dp->mst=
_mgr);
> -=09const struct drm_dp_mst_atomic_payload *old_payload =3D
> -=09=09drm_atomic_get_mst_payload_state(old_mst_state, connector->port);
>  =09struct drm_dp_mst_atomic_payload *new_payload =3D
>  =09=09drm_atomic_get_mst_payload_state(new_mst_state, connector->port);
>  =09struct drm_i915_private *i915 =3D to_i915(connector->base.dev);
> @@ -572,8 +568,7 @@ static void intel_mst_disable_dp(struct intel_atomic_=
state *state,
> =20
>  =09intel_hdcp_disable(intel_mst->connector);
> =20
> -=09drm_dp_remove_payload(&intel_dp->mst_mgr, new_mst_state,
> -=09=09=09      old_payload, new_payload);
> +=09drm_dp_remove_payload_part1(&intel_dp->mst_mgr, new_mst_state, new_pa=
yload);
> =20
>  =09intel_audio_codec_disable(encoder, old_crtc_state, old_conn_state);
>  }
> @@ -588,6 +583,14 @@ static void intel_mst_post_disable_dp(struct intel_a=
tomic_state *state,
>  =09struct intel_dp *intel_dp =3D &dig_port->dp;
>  =09struct intel_connector *connector =3D
>  =09=09to_intel_connector(old_conn_state->connector);
> +=09struct drm_dp_mst_topology_state *old_mst_state =3D
> +=09=09drm_atomic_get_old_mst_topology_state(&state->base, &intel_dp->mst=
_mgr);
> +=09struct drm_dp_mst_topology_state *new_mst_state =3D
> +=09=09drm_atomic_get_new_mst_topology_state(&state->base, &intel_dp->mst=
_mgr);
> +=09const struct drm_dp_mst_atomic_payload *old_payload =3D
> +=09=09drm_atomic_get_mst_payload_state(old_mst_state, connector->port);
> +=09struct drm_dp_mst_atomic_payload *new_payload =3D
> +=09=09drm_atomic_get_mst_payload_state(new_mst_state, connector->port);
>  =09struct drm_i915_private *dev_priv =3D to_i915(connector->base.dev);
>  =09bool last_mst_stream;
> =20
> @@ -608,6 +611,9 @@ static void intel_mst_post_disable_dp(struct intel_at=
omic_state *state,
> =20
>  =09wait_for_act_sent(encoder, old_crtc_state);
> =20
> +=09drm_dp_remove_payload_part2(&intel_dp->mst_mgr, new_mst_state,
> +=09=09=09=09    old_payload, new_payload);
> +
>  =09intel_ddi_disable_transcoder_func(old_crtc_state);
> =20
>  =09if (DISPLAY_VER(dev_priv) >=3D 9)
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/no=
uveau/dispnv50/disp.c
> index 4e7c9c353c51..bba01fa0780c 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> @@ -882,21 +882,26 @@ struct nouveau_encoder *nv50_real_outp(struct drm_e=
ncoder *encoder)
> =20
>  static void
>  nv50_msto_cleanup(struct drm_atomic_state *state,
> -=09=09  struct drm_dp_mst_topology_state *mst_state,
> +=09=09  struct drm_dp_mst_topology_state *new_mst_state,
>  =09=09  struct drm_dp_mst_topology_mgr *mgr,
>  =09=09  struct nv50_msto *msto)
>  {
>  =09struct nouveau_drm *drm =3D nouveau_drm(msto->encoder.dev);
> -=09struct drm_dp_mst_atomic_payload *payload =3D
> -=09=09drm_atomic_get_mst_payload_state(mst_state, msto->mstc->port);
> +=09struct drm_dp_mst_atomic_payload *new_payload =3D
> +=09=09drm_atomic_get_mst_payload_state(new_mst_state, msto->mstc->port);
> +=09struct drm_dp_mst_topology_state *old_mst_state =3D
> +=09=09drm_atomic_get_old_mst_topology_state(state, mgr);
> +=09const struct drm_dp_mst_atomic_payload *old_payload =3D
> +=09=09drm_atomic_get_mst_payload_state(old_mst_state, msto->mstc->port);
> =20
>  =09NV_ATOMIC(drm, "%s: msto cleanup\n", msto->encoder.name);
> =20
>  =09if (msto->disabled) {
>  =09=09msto->mstc =3D NULL;
>  =09=09msto->disabled =3D false;
> +=09=09drm_dp_remove_payload_part2(mgr, new_mst_state, old_payload, new_p=
ayload);
>  =09} else if (msto->enabled) {
> -=09=09drm_dp_add_payload_part2(mgr, state, payload);
> +=09=09drm_dp_add_payload_part2(mgr, state, new_payload);
>  =09=09msto->enabled =3D false;
>  =09}
>  }
> @@ -910,19 +915,15 @@ nv50_msto_prepare(struct drm_atomic_state *state,
>  =09struct nouveau_drm *drm =3D nouveau_drm(msto->encoder.dev);
>  =09struct nv50_mstc *mstc =3D msto->mstc;
>  =09struct nv50_mstm *mstm =3D mstc->mstm;
> -=09struct drm_dp_mst_topology_state *old_mst_state;
> -=09struct drm_dp_mst_atomic_payload *payload, *old_payload;
> +=09struct drm_dp_mst_atomic_payload *payload;
> =20
>  =09NV_ATOMIC(drm, "%s: msto prepare\n", msto->encoder.name);
> =20
> -=09old_mst_state =3D drm_atomic_get_old_mst_topology_state(state, mgr);
> -
>  =09payload =3D drm_atomic_get_mst_payload_state(mst_state, mstc->port);
> -=09old_payload =3D drm_atomic_get_mst_payload_state(old_mst_state, mstc-=
>port);
> =20
>  =09// TODO: Figure out if we want to do a better job of handling VCPI al=
location failures here?
>  =09if (msto->disabled) {
> -=09=09drm_dp_remove_payload(mgr, mst_state, old_payload, payload);
> +=09=09drm_dp_remove_payload_part1(mgr, mst_state, payload);
> =20
>  =09=09nvif_outp_dp_mst_vcpi(&mstm->outp->outp, msto->head->base.index, 0=
, 0, 0, 0);
>  =09} else {
> diff --git a/include/drm/display/drm_dp_mst_helper.h b/include/drm/displa=
y/drm_dp_mst_helper.h
> index ed5c9660563c..4429d3b1745b 100644
> --- a/include/drm/display/drm_dp_mst_helper.h
> +++ b/include/drm/display/drm_dp_mst_helper.h
> @@ -46,6 +46,13 @@ struct drm_dp_mst_topology_ref_history {
>  };
>  #endif /* IS_ENABLED(CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS) */
> =20
> +enum drm_dp_mst_payload_allocation {
> +=09DRM_DP_MST_PAYLOAD_ALLOCATION_NONE,
> +=09DRM_DP_MST_PAYLOAD_ALLOCATION_LOCAL,
> +=09DRM_DP_MST_PAYLOAD_ALLOCATION_DFP,
> +=09DRM_DP_MST_PAYLOAD_ALLOCATION_REMOTE,
> +};
> +
>  struct drm_dp_mst_branch;
> =20
>  /**
> @@ -537,7 +544,7 @@ struct drm_dp_mst_atomic_payload {
>  =09 *   drm_dp_mst_atomic_wait_for_dependencies() has been called, which=
 will ensure the
>  =09 *   previous MST states payload start slots have been copied over to=
 the new state. Note
>  =09 *   that a new start slot won't be assigned/removed from this payloa=
d until
> -=09 *   drm_dp_add_payload_part1()/drm_dp_remove_payload() have been cal=
led.
> +=09 *   drm_dp_add_payload_part1()/drm_dp_remove_payload_part2() have be=
en called.
>  =09 * * Acquire the MST modesetting lock, and then wait for any pending =
MST-related commits to
>  =09 *   get committed to hardware by calling drm_crtc_commit_wait() on e=
ach of the
>  =09 *   &drm_crtc_commit structs in &drm_dp_mst_topology_state.commit_de=
ps.
> @@ -564,6 +571,9 @@ struct drm_dp_mst_atomic_payload {
>  =09/** @dsc_enabled: Whether or not this payload has DSC enabled */
>  =09bool dsc_enabled : 1;
> =20
> +=09/** @payload_allocation_status: The allocation status of this payload=
 */
> +=09enum drm_dp_mst_payload_allocation payload_allocation_status;
> +
>  =09/** @next: The list node for this payload */
>  =09struct list_head next;
>  };
> @@ -842,10 +852,13 @@ int drm_dp_add_payload_part1(struct drm_dp_mst_topo=
logy_mgr *mgr,
>  int drm_dp_add_payload_part2(struct drm_dp_mst_topology_mgr *mgr,
>  =09=09=09     struct drm_atomic_state *state,
>  =09=09=09     struct drm_dp_mst_atomic_payload *payload);
> -void drm_dp_remove_payload(struct drm_dp_mst_topology_mgr *mgr,
> -=09=09=09   struct drm_dp_mst_topology_state *mst_state,
> -=09=09=09   const struct drm_dp_mst_atomic_payload *old_payload,
> -=09=09=09   struct drm_dp_mst_atomic_payload *new_payload);
> +void drm_dp_remove_payload_part1(struct drm_dp_mst_topology_mgr *mgr,
> +=09=09=09=09 struct drm_dp_mst_topology_state *mst_state,
> +=09=09=09=09 struct drm_dp_mst_atomic_payload *payload);
> +void drm_dp_remove_payload_part2(struct drm_dp_mst_topology_mgr *mgr,
> +=09=09=09=09 struct drm_dp_mst_topology_state *mst_state,
> +=09=09=09=09 const struct drm_dp_mst_atomic_payload *old_payload,
> +=09=09=09=09 struct drm_dp_mst_atomic_payload *new_payload);
> =20
>  int drm_dp_check_act_status(struct drm_dp_mst_topology_mgr *mgr);
> =20

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

