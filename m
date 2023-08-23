Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 697127861DE
	for <lists+dri-devel@lfdr.de>; Wed, 23 Aug 2023 22:59:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2495910E0ED;
	Wed, 23 Aug 2023 20:59:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5048010E0AB
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 20:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1692824381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hAmzPbYN83RuIB2POplZMO/1Uv+OMsR8psocTCuSnPI=;
 b=ET+loZ8zLbWjG8JU8/3J6U2h181/14ck+hSwww3V5TznkE/uClrAI0noCshEfKCBSINxLz
 vAcdKYizcrRkeVDUGyxQlOgfUZZkhaKIJM7IjASWzKrzlfqawkKuAwak8RJ0mdOepmCMFW
 LnWugNLIyzl5J1gUVvptukQtFL4Xbao=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-306-Tk7MJVXVOXK-QDcZHiOL6A-1; Wed, 23 Aug 2023 16:59:39 -0400
X-MC-Unique: Tk7MJVXVOXK-QDcZHiOL6A-1
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-76d9d16f4a1so20282785a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 13:59:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692824378; x=1693429178;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hAmzPbYN83RuIB2POplZMO/1Uv+OMsR8psocTCuSnPI=;
 b=JK6BYfF/CHAgoUVA8InmUdOJ8ScA4jrmN07eNuHQeE/74f02iErhMN3kneAPhVDw/6
 40QnYUfJ0szc0LCIcn2wseUkdhPlaKwlk68JdUVSWQJ0t6FEYuAYRQuYeShf6Ai7bywk
 zyeVk0qZ47q3xwsTglpLf1J8X4oNV4PFPHI1nC/mF2w9AeNQiFs0luGzXHLyVU8g/MRU
 HnTTgcm1+D/1JzhCwyo4AWcRd1QpvYFOhlpmP6/x/o4jeR11bLxzbT7OuaP0sg0FOQ6b
 IIYZgJfK5khSuiBJbrKP/aFfO1MMMXWXS0EBEbr3LMnlp17VNTIoeXBmaLpUo4CYyfRE
 xSZw==
X-Gm-Message-State: AOJu0Yw5bME+GwhRV2kRCJsoivw+R7dUi5+VmkeiSmM4WJ+FL94WTa/5
 45jIm0J1GODE0CqWjYnxM90tokVizAs5Gq0eIsy2YmJoMyfAL4PMOTIioEFxIqwWo3SWnoMIq4I
 WkImNcMaCEry4VsQ3nfN3Yr/j2sHdLxSGbgM/
X-Received: by 2002:a05:620a:bc7:b0:76c:b468:2efe with SMTP id
 s7-20020a05620a0bc700b0076cb4682efemr18419016qki.20.1692824378304; 
 Wed, 23 Aug 2023 13:59:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/EI81yiMpAzIH2dNxnAXfn73mvMg+FU1hG0obxWvMpY9FlvX03ec11JNKWhBkQjDPpYH6yw==
X-Received: by 2002:a05:620a:bc7:b0:76c:b468:2efe with SMTP id
 s7-20020a05620a0bc700b0076cb4682efemr18418993qki.20.1692824377953; 
 Wed, 23 Aug 2023 13:59:37 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c7d:5f00::feb? ([2600:4040:5c7d:5f00::feb])
 by smtp.gmail.com with ESMTPSA id
 n17-20020a0cdc91000000b0064f45b8c02bsm2314842qvk.49.2023.08.23.13.59.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Aug 2023 13:59:37 -0700 (PDT)
Message-ID: <7ab7ee7447977e625a72fa9cbe4b5d5d7d8145dd.camel@redhat.com>
Subject: Re: [Patch v2 2/3] drm/mst: Refactor the flow for payload
 allocation/removement
From: Lyude Paul <lyude@redhat.com>
To: "Lin, Wayne" <Wayne.Lin@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Date: Wed, 23 Aug 2023 16:59:36 -0400
In-Reply-To: <CO6PR12MB5489FA922EB2DC8C6261F65DFC1CA@CO6PR12MB5489.namprd12.prod.outlook.com>
References: <20230807025639.1612361-1-Wayne.Lin@amd.com>
 <20230807025639.1612361-3-Wayne.Lin@amd.com>
 <9b1c1ebc68a7c2adf8df86ca4a252e2d13a7b760.camel@redhat.com>
 <CO6PR12MB5489FA922EB2DC8C6261F65DFC1CA@CO6PR12MB5489.namprd12.prod.outlook.com>
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
Cc: "jani.nikula@intel.com" <jani.nikula@intel.com>, "Zuo,
 Jerry" <Jerry.Zuo@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sure - you're also welcome to push the first two patches after fixing the
indentation if you'd like

On Wed, 2023-08-23 at 03:19 +0000, Lin, Wayne wrote:
> [Public]
>=20
> Thanks, Lyude!
> Should I push another version to fix the indention?
>=20
> > -----Original Message-----
> > From: Lyude Paul <lyude@redhat.com>
> > Sent: Friday, August 18, 2023 6:17 AM
> > To: Lin, Wayne <Wayne.Lin@amd.com>; dri-devel@lists.freedesktop.org;
> > amd-gfx@lists.freedesktop.org
> > Cc: jani.nikula@intel.com; ville.syrjala@linux.intel.com; imre.deak@int=
el.com;
> > Wentland, Harry <Harry.Wentland@amd.com>; Zuo, Jerry
> > <Jerry.Zuo@amd.com>
> > Subject: Re: [Patch v2 2/3] drm/mst: Refactor the flow for payload
> > allocation/removement
> >=20
> > Two small comments:
> >=20
> > On Mon, 2023-08-07 at 10:56 +0800, Wayne Lin wrote:
> > > [Why]
> > > Today, the allocation/deallocation steps and status is a bit unclear.
> > >=20
> > > For instance, payload->vc_start_slot =3D -1 stands for "the failure o=
f
> > > updating DPCD payload ID table" and can also represent as "payload is
> > > not allocated yet". These two cases should be handled differently and
> > > hence better to distinguish them for better understanding.
> > >=20
> > > [How]
> > > Define enumeration - ALLOCATION_LOCAL, ALLOCATION_DFP and
> > > ALLOCATION_REMOTE to distinguish different allocation status. Adjust
> > > the code to handle different status accordingly for better
> > > understanding the sequence of payload allocation and payload
> > removement.
> > >=20
> > > For payload creation, the procedure should look like this:
> > > DRM part 1:
> > > * step 1 - update sw mst mgr variables to add a new payload
> > > * step 2 - add payload at immediate DFP DPCD payload table
> > >=20
> > > Driver:
> > > * Add new payload in HW and sync up with DFP by sending ACT
> > >=20
> > > DRM Part 2:
> > > * Send ALLOCATE_PAYLOAD sideband message to allocate bandwidth along
> > the
> > >   virtual channel.
> > >=20
> > > And as for payload removement, the procedure should look like this:
> > > DRM part 1:
> > > * step 1 - Send ALLOCATE_PAYLOAD sideband message to release bandwidt=
h
> > >            along the virtual channel
> > > * step 2 - Clear payload allocation at immediate DFP DPCD payload
> > > table
> > >=20
> > > Driver:
> > > * Remove the payload in HW and sync up with DFP by sending ACT
> > >=20
> > > DRM part 2:
> > > * update sw mst mgr variables to remove the payload
> > >=20
> > > Note that it's fine to fail when communicate with the branch device
> > > connected at immediate downstrean-facing port, but updating variables
> > > of SW mst mgr and HW configuration should be conducted anyway. That's
> > > because it's under commit_tail and we need to complete the HW
> > programming.
> > >=20
> > > Changes since v1:
> > > * Remove the set but not use variable 'old_payload' in function
> > >   'nv50_msto_prepare'. Catched by kernel test robot <lkp@intel.com>
> > >=20
> > > Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
> > > ---
> > >  .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c |  20 ++-
> > > drivers/gpu/drm/display/drm_dp_mst_topology.c | 159 +++++++++++------
> > -
> > >  drivers/gpu/drm/i915/display/intel_dp_mst.c   |  18 +-
> > >  drivers/gpu/drm/nouveau/dispnv50/disp.c       |  21 +--
> > >  include/drm/display/drm_dp_mst_helper.h       |  23 ++-
> > >  5 files changed, 153 insertions(+), 88 deletions(-)
> > >=20
> > > diff --git
> > a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> > > b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> > > index d9a482908380..9ad509279b0a 100644
> > > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> > > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> > > @@ -219,7 +219,7 @@ static void dm_helpers_construct_old_payload(
> > >     /* Set correct time_slots/PBN of old payload.
> > >      * other fields (delete & dsc_enabled) in
> > >      * struct drm_dp_mst_atomic_payload are don't care fields
> > > -    * while calling drm_dp_remove_payload()
> > > +    * while calling drm_dp_remove_payload_part2()
> > >      */
> > >     for (i =3D 0; i < current_link_table.stream_count; i++) {
> > >             dc_alloc =3D
> > > @@ -262,13 +262,12 @@ bool
> > > dm_helpers_dp_mst_write_payload_allocation_table(
> > >=20
> > >     mst_mgr =3D &aconnector->mst_root->mst_mgr;
> > >     mst_state =3D to_drm_dp_mst_topology_state(mst_mgr->base.state);
> > > -
> > > -   /* It's OK for this to fail */
> > >     new_payload =3D drm_atomic_get_mst_payload_state(mst_state,
> > > aconnector->mst_output_port);
> > >=20
> > >     if (enable) {
> > >             target_payload =3D new_payload;
> > >=20
> > > +           /* It's OK for this to fail */
> > >             drm_dp_add_payload_part1(mst_mgr, mst_state,
> > new_payload);
> > >     } else {
> > >             /* construct old payload by VCPI*/
> > > @@ -276,7 +275,7 @@ bool
> > dm_helpers_dp_mst_write_payload_allocation_table(
> > >                                             new_payload, &old_payload=
);
> > >             target_payload =3D &old_payload;
> > >=20
> > > -           drm_dp_remove_payload(mst_mgr, mst_state,
> > &old_payload, new_payload);
> > > +           drm_dp_remove_payload_part1(mst_mgr, mst_state,
> > new_payload);
> > >     }
> > >=20
> > >     /* mst_mgr->->payloads are VC payload notify MST branch using
> > DPCD
> > > or @@ -342,7 +341,7 @@ bool
> > dm_helpers_dp_mst_send_payload_allocation(
> > >     struct amdgpu_dm_connector *aconnector;
> > >     struct drm_dp_mst_topology_state *mst_state;
> > >     struct drm_dp_mst_topology_mgr *mst_mgr;
> > > -   struct drm_dp_mst_atomic_payload *payload;
> > > +   struct drm_dp_mst_atomic_payload *new_payload, *old_payload;
> > >     enum mst_progress_status set_flag =3D
> > MST_ALLOCATE_NEW_PAYLOAD;
> > >     enum mst_progress_status clr_flag =3D
> > MST_CLEAR_ALLOCATED_PAYLOAD;
> > >     int ret =3D 0;
> > > @@ -355,15 +354,20 @@ bool
> > dm_helpers_dp_mst_send_payload_allocation(
> > >     mst_mgr =3D &aconnector->mst_root->mst_mgr;
> > >     mst_state =3D to_drm_dp_mst_topology_state(mst_mgr->base.state);
> > >=20
> > > -   payload =3D drm_atomic_get_mst_payload_state(mst_state,
> > aconnector->mst_output_port);
> > > +   new_payload =3D drm_atomic_get_mst_payload_state(mst_state,
> > > +aconnector->mst_output_port);
> > >=20
> > >     if (!enable) {
> > >             set_flag =3D MST_CLEAR_ALLOCATED_PAYLOAD;
> > >             clr_flag =3D MST_ALLOCATE_NEW_PAYLOAD;
> > >     }
> > >=20
> > > -   if (enable)
> > > -           ret =3D drm_dp_add_payload_part2(mst_mgr, mst_state-
> > > base.state, payload);
> > > +   if (enable) {
> > > +           ret =3D drm_dp_add_payload_part2(mst_mgr, mst_state-
> > > base.state, new_payload);
> > > +   } else {
> > > +           dm_helpers_construct_old_payload(stream->link, mst_state-
> > > pbn_div,
> > > +                                            new_payload, old_payload=
);
> > > +           drm_dp_remove_payload_part2(mst_mgr, mst_state,
> > old_payload, new_payload);
> > > +   }
> > >=20
> > >     if (ret) {
> > >             amdgpu_dm_set_mst_status(&aconnector->mst_status,
> > > diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > index 4d80426757ab..e04f87ff755a 100644
> > > --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > @@ -3255,15 +3255,15 @@ int
> > drm_dp_send_query_stream_enc_status(struct
> > > drm_dp_mst_topology_mgr *mgr,  }
> > > EXPORT_SYMBOL(drm_dp_send_query_stream_enc_status);
> > >=20
> > > -static int drm_dp_create_payload_step1(struct drm_dp_mst_topology_mg=
r
> > *mgr,
> > > -                                  struct drm_dp_mst_atomic_payload
> > *payload)
> > > +static int drm_dp_create_payload_at_dfp(struct
> > drm_dp_mst_topology_mgr *mgr,
> > > +                                   struct drm_dp_mst_atomic_payload
> > *payload)
> > >  {
> > >     return drm_dp_dpcd_write_payload(mgr, payload->vcpi, payload-
> > > vc_start_slot,
> > >                                      payload->time_slots);
> > >  }
> > >=20
> > > -static int drm_dp_create_payload_step2(struct drm_dp_mst_topology_mg=
r
> > *mgr,
> > > -                                  struct drm_dp_mst_atomic_payload
> > *payload)
> > > +static int drm_dp_create_payload_to_remote(struct
> > drm_dp_mst_topology_mgr *mgr,
> > > +                                      struct drm_dp_mst_atomic_paylo=
ad
> > *payload)
> > >  {
> > >     int ret;
> > >     struct drm_dp_mst_port *port =3D
> > > drm_dp_mst_topology_get_port_validated(mgr, payload->port); @@ -
> > 3276,17 +3276,20 @@ static int drm_dp_create_payload_step2(struct
> > drm_dp_mst_topology_mgr *mgr,
> > >     return ret;
> > >  }
> > >=20
> > > -static int drm_dp_destroy_payload_step1(struct
> > drm_dp_mst_topology_mgr *mgr,
> > > -                                   struct drm_dp_mst_topology_state
> > *mst_state,
> > > -                                   struct drm_dp_mst_atomic_payload
> > *payload)
> > > +static void drm_dp_destroy_payload_at_remote_and_dfp(struct
> > drm_dp_mst_topology_mgr *mgr,
> > > +                                                struct
> > drm_dp_mst_topology_state *mst_state,
> > > +                                                struct
> > drm_dp_mst_atomic_payload *payload)
> > >  {
> > >     drm_dbg_kms(mgr->dev, "\n");
> > >=20
> > >     /* it's okay for these to fail */
> > > -   drm_dp_payload_send_msg(mgr, payload->port, payload->vcpi, 0);
> > > -   drm_dp_dpcd_write_payload(mgr, payload->vcpi, payload-
> > > vc_start_slot, 0);
> > > +   if (payload->payload_allocation_status =3D=3D
> > DRM_DP_MST_PAYLOAD_ALLOCATION_REMOTE) {
> > > +           drm_dp_payload_send_msg(mgr, payload->port, payload-
> > > vcpi, 0);
> > > +           payload->payload_allocation_status =3D
> > DRM_DP_MST_PAYLOAD_ALLOCATION_DFP;
> > > +   }
> > >=20
> > > -   return 0;
> > > +   if (payload->payload_allocation_status =3D=3D
> > DRM_DP_MST_PAYLOAD_ALLOCATION_DFP)
> > > +           drm_dp_dpcd_write_payload(mgr, payload->vcpi,
> > > +payload->vc_start_slot, 0);
> > >  }
> > >=20
> > >  /**
> > > @@ -3296,81 +3299,105 @@ static int
> > drm_dp_destroy_payload_step1(struct drm_dp_mst_topology_mgr *mgr,
> > >   * @payload: The payload to write
> > >   *
> > >   * Determines the starting time slot for the given payload, and
> > > programs the VCPI for this payload
> > > - * into hardware. After calling this, the driver should generate ACT=
 and
> > payload packets.
> > > + * into the DPCD of DPRX. After calling this, the driver should gene=
rate ACT
> > and payload packets.
> > >   *
> > > - * Returns: 0 on success, error code on failure. In the event that
> > > this fails,
> > > - * @payload.vc_start_slot will also be set to -1.
> > > + * Returns: 0 on success, error code on failure.
> > >   */
> > >  int drm_dp_add_payload_part1(struct drm_dp_mst_topology_mgr *mgr,
> > >                          struct drm_dp_mst_topology_state *mst_state,
> > >                          struct drm_dp_mst_atomic_payload *payload)  =
{
> > >     struct drm_dp_mst_port *port;
> > > -   int ret;
> > > +   int ret =3D 0;
> > > +   bool allocate =3D true;
> > > +
> > > +   /* Update mst mgr info */
> > > +   if (mgr->payload_count =3D=3D 0)
> > > +           mgr->next_start_slot =3D mst_state->start_slot;
> > > +
> > > +   payload->vc_start_slot =3D mgr->next_start_slot;
> > > +
> > > +   mgr->payload_count++;
> > > +   mgr->next_start_slot +=3D payload->time_slots;
> > >=20
> > > +   /* Allocate payload to immediate downstream facing port */
> > >     port =3D drm_dp_mst_topology_get_port_validated(mgr, payload-
> > > port);
> > >     if (!port) {
> > >             drm_dbg_kms(mgr->dev,
> > > -                       "VCPI %d for port %p not in topology, not cre=
ating a
> > payload\n",
> > > +                       "VCPI %d for port %p not in topology, not cre=
ating a
> > payload
> > > +to remote\n",
> > >                         payload->vcpi, payload->port);
> > > -           payload->vc_start_slot =3D -1;
> > > -           return 0;
> > > +           allocate =3D false;
> > >     }
> > >=20
> > > -   if (mgr->payload_count =3D=3D 0)
> > > -           mgr->next_start_slot =3D mst_state->start_slot;
> > > -
> > > -   payload->vc_start_slot =3D mgr->next_start_slot;
> > > +   if (allocate) {
> > > +           ret =3D drm_dp_create_payload_at_dfp(mgr, payload);
> > > +           if (ret < 0)
> > > +                   drm_warn(mgr->dev, "Failed to create MST payload
> > for port %p: %d\n",
> > > +                            payload->port, ret);
> > >=20
> > > -   ret =3D drm_dp_create_payload_step1(mgr, payload);
> > > -   drm_dp_mst_topology_put_port(port);
> > > -   if (ret < 0) {
> > > -           drm_warn(mgr->dev, "Failed to create MST payload for port
> > %p: %d\n",
> > > -                    payload->port, ret);
> > > -           payload->vc_start_slot =3D -1;
> > > -           return ret;
> > >     }
> > >=20
> > > -   mgr->payload_count++;
> > > -   mgr->next_start_slot +=3D payload->time_slots;
> > > +   payload->payload_allocation_status =3D
> > > +           (!allocate || ret < 0) ?
> > DRM_DP_MST_PAYLOAD_ALLOCATION_LOCAL :
> > > +
> >       DRM_DP_MST_PAYLOAD_ALLOCATION_DFP;
> >=20
> > Just need to fix indenting here
> >=20
> > >=20
> > > -   return 0;
> > > +   drm_dp_mst_topology_put_port(port);
> > > +
> > > +   return ret;
> > >  }
> > >  EXPORT_SYMBOL(drm_dp_add_payload_part1);
> > >=20
> > >  /**
> > > - * drm_dp_remove_payload() - Remove an MST payload
> > > + * drm_dp_remove_payload_part1() - Remove an MST payload along the
> > > + virtual channel
> > >   * @mgr: Manager to use.
> > >   * @mst_state: The MST atomic state
> > > - * @old_payload: The payload with its old state
> > > - * @new_payload: The payload to write
> > > + * @payload: The payload to remove
> > >   *
> > > - * Removes a payload from an MST topology if it was successfully
> > > assigned a start slot. Also updates
> > > - * the starting time slots of all other payloads which would have
> > > been shifted towards the start of
> > > - * the VC table as a result. After calling this, the driver should g=
enerate ACT
> > and payload packets.
> > > + * Removes a payload along the virtual channel if it was successfull=
y
> > allocated.
> > > + * After calling this, the driver should set HW to generate ACT and
> > > + then switch to new
> > > + * payload allocation state.
> > >   */
> > > -void drm_dp_remove_payload(struct drm_dp_mst_topology_mgr *mgr,
> > > -                      struct drm_dp_mst_topology_state *mst_state,
> > > -                      const struct drm_dp_mst_atomic_payload
> > *old_payload,
> > > -                      struct drm_dp_mst_atomic_payload *new_payload)
> > > +void drm_dp_remove_payload_part1(struct drm_dp_mst_topology_mgr
> > *mgr,
> > > +                            struct drm_dp_mst_topology_state
> > *mst_state,
> > > +                            struct drm_dp_mst_atomic_payload
> > *payload)
> > >  {
> > > -   struct drm_dp_mst_atomic_payload *pos;
> > > +   /* Remove remote payload allocation */
> > >     bool send_remove =3D false;
> > >=20
> > > -   /* We failed to make the payload, so nothing to do */
> > > -   if (new_payload->vc_start_slot =3D=3D -1)
> > > -           return;
> > > -
> > >     mutex_lock(&mgr->lock);
> > > -   send_remove =3D
> > drm_dp_mst_port_downstream_of_branch(new_payload->port, mgr-
> > > mst_primary);
> > > +   send_remove =3D drm_dp_mst_port_downstream_of_branch(payload-
> > > port,
> > > +mgr->mst_primary);
> > >     mutex_unlock(&mgr->lock);
> > >=20
> > >     if (send_remove)
> > > -           drm_dp_destroy_payload_step1(mgr, mst_state,
> > new_payload);
> > > +           drm_dp_destroy_payload_at_remote_and_dfp(mgr,
> > mst_state, payload);
> > >     else
> > >             drm_dbg_kms(mgr->dev, "Payload for VCPI %d not in
> > topology, not sending remove\n",
> > > -                       new_payload->vcpi);
> > > +                       payload->vcpi);
> > > +
> > > +   payload->payload_allocation_status =3D
> > > +DRM_DP_MST_PAYLOAD_ALLOCATION_LOCAL;
> > > +}
> > > +EXPORT_SYMBOL(drm_dp_remove_payload_part1);
> > >=20
> > > +/**
> > > + * drm_dp_remove_payload_part2() - Remove an MST payload locally
> > > + * @mgr: Manager to use.
> > > + * @mst_state: The MST atomic state
> > > + * @old_payload: The payload with its old state
> > > + * @new_payload: The payload with its latest state
> > > + *
> > > + * Updates the starting time slots of all other payloads which would
> > > +have been shifted towards
> > > + * the start of the payload ID table as a result of removing a
> > > +payload. Driver should call this
> > > + * function whenever it removes a payload in its HW. It's independen=
t
> > > +to the result of payload
> > > + * allocation/deallocation at branch devices along the virtual chann=
el.
> > > + */
> > > +void drm_dp_remove_payload_part2(struct drm_dp_mst_topology_mgr
> > *mgr,
> > > +                            struct drm_dp_mst_topology_state
> > *mst_state,
> > > +                            const struct drm_dp_mst_atomic_payload
> > *old_payload,
> > > +                            struct drm_dp_mst_atomic_payload
> > *new_payload) {
> > > +   struct drm_dp_mst_atomic_payload *pos;
> > > +
> > > +   /* Remove local payload allocation */
> > >     list_for_each_entry(pos, &mst_state->payloads, next) {
> > >             if (pos !=3D new_payload && pos->vc_start_slot > new_payl=
oad-
> > > vc_start_slot)
> > >                     pos->vc_start_slot -=3D old_payload->time_slots; =
@@ -
> > 3382,9 +3409,10
> > > @@ void drm_dp_remove_payload(struct drm_dp_mst_topology_mgr
> > *mgr,
> > >=20
> > >     if (new_payload->delete)
> > >             drm_dp_mst_put_port_malloc(new_payload->port);
> > > -}
> > > -EXPORT_SYMBOL(drm_dp_remove_payload);
> > >=20
> > > +   new_payload->payload_allocation_status =3D
> > > +DRM_DP_MST_PAYLOAD_ALLOCATION_NONE;
> > > +}
> > > +EXPORT_SYMBOL(drm_dp_remove_payload_part2);
> > >  /**
> > >   * drm_dp_add_payload_part2() - Execute payload update part 2
> > >   * @mgr: Manager to use.
> > > @@ -3403,17 +3431,19 @@ int drm_dp_add_payload_part2(struct
> > drm_dp_mst_topology_mgr *mgr,
> > >     int ret =3D 0;
> > >=20
> > >     /* Skip failed payloads */
> > > -   if (payload->vc_start_slot =3D=3D -1) {
> > > -           drm_dbg_kms(mgr->dev, "Part 1 of payload creation for %s
> > failed, skipping part 2\n",
> > > +   if (payload->payload_allocation_status !=3D
> > DRM_DP_MST_PAYLOAD_ALLOCATION_DFP) {
> > > +           drm_dbg_kms(state->dev, "Part 1 of payload creation for %=
s
> > failed,
> > > +skipping part 2\n",
> > >                         payload->port->connector->name);
> > >             return -EIO;
> > >     }
> > >=20
> > > -   ret =3D drm_dp_create_payload_step2(mgr, payload);
> > > -   if (ret < 0) {
> > > +   /* Allocate payload to remote end */
> > > +   ret =3D drm_dp_create_payload_to_remote(mgr, payload);
> > > +   if (ret < 0)
> > >             drm_err(mgr->dev, "Step 2 of creating MST payload for %p
> > failed: %d\n",
> > >                     payload->port, ret);
> > > -   }
> > > +   else
> > > +           payload->payload_allocation_status =3D
> > > +DRM_DP_MST_PAYLOAD_ALLOCATION_REMOTE;
> > >=20
> > >     return ret;
> > >  }
> > > @@ -4324,6 +4354,7 @@ int drm_dp_atomic_find_time_slots(struct
> > drm_atomic_state *state,
> > >             drm_dp_mst_get_port_malloc(port);
> > >             payload->port =3D port;
> > >             payload->vc_start_slot =3D -1;
> > > +           payload->payload_allocation_status =3D
> > > +DRM_DP_MST_PAYLOAD_ALLOCATION_NONE;
> > >             list_add(&payload->next, &topology_state->payloads);
> > >     }
> > >     payload->time_slots =3D req_slots;
> > > @@ -4493,7 +4524,7 @@ void
> > drm_dp_mst_atomic_wait_for_dependencies(struct drm_atomic_state
> > *state)
> > >             }
> > >=20
> > >             /* Now that previous state is committed, it's safe to cop=
y over
> > the start slot
> > > -            * assignments
> > > +            * and allocation status assignments
> > >              */
> > >             list_for_each_entry(old_payload, &old_mst_state->payloads=
,
> > next) {
> > >                     if (old_payload->delete)
> > > @@ -4502,6 +4533,8 @@ void
> > drm_dp_mst_atomic_wait_for_dependencies(struct drm_atomic_state
> > *state)
> > >                     new_payload =3D
> > drm_atomic_get_mst_payload_state(new_mst_state,
> > >=20
> > old_payload->port);
> > >                     new_payload->vc_start_slot =3D old_payload-
> > > vc_start_slot;
> > > +                   new_payload->payload_allocation_status =3D
> > > +                                                   old_payload-
> > > payload_allocation_status;
> >=20
> > And here. Besides that, I think patches 1/3 and 2/3 look great! Just fi=
nished
> > testing them on nouveau:
> >=20
> > Reviewed-by: Lyude Paul <lyude@redhat.com>
> >=20
> > Patch 3/3 I gotta think about a bit more (and am curious about Imre's c=
urrent
> > take on it) I think
> >=20
> > >             }
> > >     }
> > >  }
> > > @@ -4818,6 +4851,13 @@ void drm_dp_mst_dump_topology(struct
> > seq_file *m,
> > >     struct drm_dp_mst_atomic_payload *payload;
> > >     int i, ret;
> > >=20
> > > +   static const char *const status[] =3D {
> > > +           "None",
> > > +           "Local",
> > > +           "DFP",
> > > +           "Remote",
> > > +   };
> > > +
> > >     mutex_lock(&mgr->lock);
> > >     if (mgr->mst_primary)
> > >             drm_dp_mst_dump_mstb(m, mgr->mst_primary); @@ -
> > 4834,7 +4874,7 @@
> > > void drm_dp_mst_dump_topology(struct seq_file *m,
> > >     seq_printf(m, "payload_mask: %x, max_payloads: %d, start_slot: %u=
,
> > pbn_div: %d\n",
> > >                state->payload_mask, mgr->max_payloads, state-
> > > start_slot,
> > > state->pbn_div);
> > >=20
> > > -   seq_printf(m, "\n| idx | port | vcpi | slots | pbn | dsc |     si=
nk name
> > > \n");
> > > +   seq_printf(m, "\n| idx | port | vcpi | slots | pbn | dsc | status=
 |     sink
> > name     |\n");
> > >     for (i =3D 0; i < mgr->max_payloads; i++) {
> > >             list_for_each_entry(payload, &state->payloads, next) {
> > >                     char name[14];
> > > @@ -4843,7 +4883,7 @@ void drm_dp_mst_dump_topology(struct
> > seq_file *m,
> > >                             continue;
> > >=20
> > >                     fetch_monitor_name(mgr, payload->port, name,
> > sizeof(name));
> > > -                   seq_printf(m, " %5d %6d %6d %02d - %02d %5d %5s
> > %19s\n",
> > > +                   seq_printf(m, " %5d %6d %6d %02d - %02d %5d %5s
> > %8s %19s\n",
> > >                                i,
> > >                                payload->port->port_num,
> > >                                payload->vcpi,
> > > @@ -4851,6 +4891,7 @@ void drm_dp_mst_dump_topology(struct
> > seq_file *m,
> > >                                payload->vc_start_slot + payload-
> > > time_slots - 1,
> > >                                payload->pbn,
> > >                                payload->dsc_enabled ? "Y" : "N",
> > > +                              status[payload->payload_allocation_sta=
tus],
> > >                                (*name !=3D 0) ? name : "Unknown");
> > >             }
> > >     }
> > > diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > > b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > > index e3f176a093d2..5f73cdabe7a1 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > > +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > > @@ -557,12 +557,8 @@ static void intel_mst_disable_dp(struct
> > intel_atomic_state *state,
> > >     struct intel_dp *intel_dp =3D &dig_port->dp;
> > >     struct intel_connector *connector =3D
> > >             to_intel_connector(old_conn_state->connector);
> > > -   struct drm_dp_mst_topology_state *old_mst_state =3D
> > > -           drm_atomic_get_old_mst_topology_state(&state->base,
> > &intel_dp->mst_mgr);
> > >     struct drm_dp_mst_topology_state *new_mst_state =3D
> > >             drm_atomic_get_new_mst_topology_state(&state->base,
> > &intel_dp->mst_mgr);
> > > -   const struct drm_dp_mst_atomic_payload *old_payload =3D
> > > -           drm_atomic_get_mst_payload_state(old_mst_state,
> > connector->port);
> > >     struct drm_dp_mst_atomic_payload *new_payload =3D
> > >             drm_atomic_get_mst_payload_state(new_mst_state,
> > connector->port);
> > >     struct drm_i915_private *i915 =3D to_i915(connector->base.dev); @=
@
> > > -572,8 +568,7 @@ static void intel_mst_disable_dp(struct
> > > intel_atomic_state *state,
> > >=20
> > >     intel_hdcp_disable(intel_mst->connector);
> > >=20
> > > -   drm_dp_remove_payload(&intel_dp->mst_mgr, new_mst_state,
> > > -                         old_payload, new_payload);
> > > +   drm_dp_remove_payload_part1(&intel_dp->mst_mgr,
> > new_mst_state,
> > > +new_payload);
> > >=20
> > >     intel_audio_codec_disable(encoder, old_crtc_state, old_conn_state=
);
> > > } @@ -588,6 +583,14 @@ static void intel_mst_post_disable_dp(struct
> > > intel_atomic_state *state,
> > >     struct intel_dp *intel_dp =3D &dig_port->dp;
> > >     struct intel_connector *connector =3D
> > >             to_intel_connector(old_conn_state->connector);
> > > +   struct drm_dp_mst_topology_state *old_mst_state =3D
> > > +           drm_atomic_get_old_mst_topology_state(&state->base,
> > &intel_dp->mst_mgr);
> > > +   struct drm_dp_mst_topology_state *new_mst_state =3D
> > > +           drm_atomic_get_new_mst_topology_state(&state->base,
> > &intel_dp->mst_mgr);
> > > +   const struct drm_dp_mst_atomic_payload *old_payload =3D
> > > +           drm_atomic_get_mst_payload_state(old_mst_state,
> > connector->port);
> > > +   struct drm_dp_mst_atomic_payload *new_payload =3D
> > > +           drm_atomic_get_mst_payload_state(new_mst_state,
> > connector->port);
> > >     struct drm_i915_private *dev_priv =3D to_i915(connector->base.dev=
);
> > >     bool last_mst_stream;
> > >=20
> > > @@ -608,6 +611,9 @@ static void intel_mst_post_disable_dp(struct
> > > intel_atomic_state *state,
> > >=20
> > >     wait_for_act_sent(encoder, old_crtc_state);
> > >=20
> > > +   drm_dp_remove_payload_part2(&intel_dp->mst_mgr,
> > new_mst_state,
> > > +                               old_payload, new_payload);
> > > +
> > >     intel_ddi_disable_transcoder_func(old_crtc_state);
> > >=20
> > >     if (DISPLAY_VER(dev_priv) >=3D 9)
> > > diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> > > b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> > > index 4e7c9c353c51..bba01fa0780c 100644
> > > --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> > > +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> > > @@ -882,21 +882,26 @@ struct nouveau_encoder *nv50_real_outp(struct
> > > drm_encoder *encoder)
> > >=20
> > >  static void
> > >  nv50_msto_cleanup(struct drm_atomic_state *state,
> > > -             struct drm_dp_mst_topology_state *mst_state,
> > > +             struct drm_dp_mst_topology_state *new_mst_state,
> > >               struct drm_dp_mst_topology_mgr *mgr,
> > >               struct nv50_msto *msto)
> > >  {
> > >     struct nouveau_drm *drm =3D nouveau_drm(msto->encoder.dev);
> > > -   struct drm_dp_mst_atomic_payload *payload =3D
> > > -           drm_atomic_get_mst_payload_state(mst_state, msto->mstc-
> > > port);
> > > +   struct drm_dp_mst_atomic_payload *new_payload =3D
> > > +           drm_atomic_get_mst_payload_state(new_mst_state, msto-
> > > mstc->port);
> > > +   struct drm_dp_mst_topology_state *old_mst_state =3D
> > > +           drm_atomic_get_old_mst_topology_state(state, mgr);
> > > +   const struct drm_dp_mst_atomic_payload *old_payload =3D
> > > +           drm_atomic_get_mst_payload_state(old_mst_state, msto-
> > > mstc->port);
> > >=20
> > >     NV_ATOMIC(drm, "%s: msto cleanup\n", msto->encoder.name);
> > >=20
> > >     if (msto->disabled) {
> > >             msto->mstc =3D NULL;
> > >             msto->disabled =3D false;
> > > +           drm_dp_remove_payload_part2(mgr, new_mst_state,
> > old_payload,
> > > +new_payload);
> > >     } else if (msto->enabled) {
> > > -           drm_dp_add_payload_part2(mgr, state, payload);
> > > +           drm_dp_add_payload_part2(mgr, state, new_payload);
> > >             msto->enabled =3D false;
> > >     }
> > >  }
> > > @@ -910,19 +915,15 @@ nv50_msto_prepare(struct drm_atomic_state
> > *state,
> > >     struct nouveau_drm *drm =3D nouveau_drm(msto->encoder.dev);
> > >     struct nv50_mstc *mstc =3D msto->mstc;
> > >     struct nv50_mstm *mstm =3D mstc->mstm;
> > > -   struct drm_dp_mst_topology_state *old_mst_state;
> > > -   struct drm_dp_mst_atomic_payload *payload, *old_payload;
> > > +   struct drm_dp_mst_atomic_payload *payload;
> > >=20
> > >     NV_ATOMIC(drm, "%s: msto prepare\n", msto->encoder.name);
> > >=20
> > > -   old_mst_state =3D drm_atomic_get_old_mst_topology_state(state,
> > mgr);
> > > -
> > >     payload =3D drm_atomic_get_mst_payload_state(mst_state, mstc-
> > > port);
> > > -   old_payload =3D drm_atomic_get_mst_payload_state(old_mst_state,
> > mstc->port);
> > >=20
> > >     // TODO: Figure out if we want to do a better job of handling VCP=
I
> > allocation failures here?
> > >     if (msto->disabled) {
> > > -           drm_dp_remove_payload(mgr, mst_state, old_payload,
> > payload);
> > > +           drm_dp_remove_payload_part1(mgr, mst_state, payload);
> > >=20
> > >             nvif_outp_dp_mst_vcpi(&mstm->outp->outp, msto->head-
> > > base.index, 0, 0, 0, 0);
> > >     } else {
> > > diff --git a/include/drm/display/drm_dp_mst_helper.h
> > > b/include/drm/display/drm_dp_mst_helper.h
> > > index ed5c9660563c..4429d3b1745b 100644
> > > --- a/include/drm/display/drm_dp_mst_helper.h
> > > +++ b/include/drm/display/drm_dp_mst_helper.h
> > > @@ -46,6 +46,13 @@ struct drm_dp_mst_topology_ref_history {  };
> > > #endif /* IS_ENABLED(CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS) */
> > >=20
> > > +enum drm_dp_mst_payload_allocation {
> > > +   DRM_DP_MST_PAYLOAD_ALLOCATION_NONE,
> > > +   DRM_DP_MST_PAYLOAD_ALLOCATION_LOCAL,
> > > +   DRM_DP_MST_PAYLOAD_ALLOCATION_DFP,
> > > +   DRM_DP_MST_PAYLOAD_ALLOCATION_REMOTE,
> > > +};
> > > +
> > >  struct drm_dp_mst_branch;
> > >=20
> > >  /**
> > > @@ -537,7 +544,7 @@ struct drm_dp_mst_atomic_payload {
> > >      *   drm_dp_mst_atomic_wait_for_dependencies() has been called,
> > which will ensure the
> > >      *   previous MST states payload start slots have been copied ove=
r to
> > the new state. Note
> > >      *   that a new start slot won't be assigned/removed from this pa=
yload
> > until
> > > -    *   drm_dp_add_payload_part1()/drm_dp_remove_payload() have
> > been called.
> > > +    *   drm_dp_add_payload_part1()/drm_dp_remove_payload_part2()
> > have been called.
> > >      * * Acquire the MST modesetting lock, and then wait for any pend=
ing
> > MST-related commits to
> > >      *   get committed to hardware by calling drm_crtc_commit_wait() =
on
> > each of the
> > >      *   &drm_crtc_commit structs in
> > &drm_dp_mst_topology_state.commit_deps.
> > > @@ -564,6 +571,9 @@ struct drm_dp_mst_atomic_payload {
> > >     /** @dsc_enabled: Whether or not this payload has DSC enabled */
> > >     bool dsc_enabled : 1;
> > >=20
> > > +   /** @payload_allocation_status: The allocation status of this pay=
load
> > */
> > > +   enum drm_dp_mst_payload_allocation payload_allocation_status;
> > > +
> > >     /** @next: The list node for this payload */
> > >     struct list_head next;
> > >  };
> > > @@ -842,10 +852,13 @@ int drm_dp_add_payload_part1(struct
> > > drm_dp_mst_topology_mgr *mgr,  int drm_dp_add_payload_part2(struct
> > drm_dp_mst_topology_mgr *mgr,
> > >                          struct drm_atomic_state *state,
> > >                          struct drm_dp_mst_atomic_payload *payload); =
-
> > void
> > > drm_dp_remove_payload(struct drm_dp_mst_topology_mgr *mgr,
> > > -                      struct drm_dp_mst_topology_state *mst_state,
> > > -                      const struct drm_dp_mst_atomic_payload
> > *old_payload,
> > > -                      struct drm_dp_mst_atomic_payload
> > *new_payload);
> > > +void drm_dp_remove_payload_part1(struct drm_dp_mst_topology_mgr
> > *mgr,
> > > +                            struct drm_dp_mst_topology_state
> > *mst_state,
> > > +                            struct drm_dp_mst_atomic_payload
> > *payload); void
> > > +drm_dp_remove_payload_part2(struct drm_dp_mst_topology_mgr *mgr,
> > > +                            struct drm_dp_mst_topology_state
> > *mst_state,
> > > +                            const struct drm_dp_mst_atomic_payload
> > *old_payload,
> > > +                            struct drm_dp_mst_atomic_payload
> > *new_payload);
> > >=20
> > >  int drm_dp_check_act_status(struct drm_dp_mst_topology_mgr *mgr);
> > >=20
> >=20
> > --
> > Cheers,
> >  Lyude Paul (she/her)
> >  Software Engineer at Red Hat
> --
> Regards,
> Wayne

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

