Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C9279F519
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 00:40:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E26B10E114;
	Wed, 13 Sep 2023 22:40:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0138510E114;
 Wed, 13 Sep 2023 22:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694644829; x=1726180829;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=5zlMG7saJPP4wStxj9Fev7cCg0ozD2LFX95CtqDqTgE=;
 b=fnT+mhQEk+HPebK4LnLInqSQPoFVQtCPhFQJPj4QVfYWuZ8nEqSYZO9e
 VLNNXCp8FdZpep5tyO5z3lfPlAJtbjL0hl1DScLgCuAsuDmChnNBH1SgN
 20m8DtjjsJp8IDqHdvBxwEPPsMnXNn24CKeFCZRYG38pu4JZjegDGkOUm
 auooSrZuD+JZmsRcaaRo9r9faNuSs3qfkDxKzHJG/RmUklpidSqMTuHu/
 G06vTb5kb3YD9HBnyzHROvMcF7AT3P+YE3pdGj/8K0WzGnhQuY9lizteh
 yan0UTv7LYvN1/f8jFUzbAKBN906jM2PaauF8WPDhj4fUbdEWDdmi+8Eg Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="409756004"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; d="scan'208";a="409756004"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 15:40:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="834495405"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; d="scan'208";a="834495405"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 15:40:24 -0700
Date: Thu, 14 Sep 2023 01:40:43 +0300
From: Imre Deak <imre.deak@intel.com>
To: "Lin, Wayne" <Wayne.Lin@amd.com>
Subject: Re: [Patch v2 2/3] drm/mst: Refactor the flow for payload
 allocation/removement
Message-ID: <ZQI6a1/3BDfGQMWd@ideak-desk.fi.intel.com>
References: <20230807025639.1612361-1-Wayne.Lin@amd.com>
 <20230807025639.1612361-3-Wayne.Lin@amd.com>
 <9b1c1ebc68a7c2adf8df86ca4a252e2d13a7b760.camel@redhat.com>
 <CO6PR12MB5489FA922EB2DC8C6261F65DFC1CA@CO6PR12MB5489.namprd12.prod.outlook.com>
 <7ab7ee7447977e625a72fa9cbe4b5d5d7d8145dd.camel@redhat.com>
 <CO6PR12MB548966C22F58172CE72647A3FC1DA@CO6PR12MB5489.namprd12.prod.outlook.com>
 <241a34e5c3e160a7516e6ea55581f7ac2e4ed3ab.camel@redhat.com>
 <CADnq5_OqT_3tZU+j64fTctF77PFQ96XtkMoxEKxcpFp5vdForw@mail.gmail.com>
 <CO6PR12MB5489183A922A081600A6E626FCE9A@CO6PR12MB5489.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CO6PR12MB5489183A922A081600A6E626FCE9A@CO6PR12MB5489.namprd12.prod.outlook.com>
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
Reply-To: imre.deak@intel.com
Cc: "jani.nikula@intel.com" <jani.nikula@intel.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Zuo,
 Jerry" <Jerry.Zuo@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 04, 2023 at 06:58:20AM +0000, Lin, Wayne wrote:
> [Public]
> 
> Thank you Lyude and Alex!

This patch had i915 changes, please also Cc the
intel-gfx@lists.freedesktop.org list for such patchsets, so that
we get CI test results for it.

Also, I think patches with i915 changes need an Ack from an i915
developer before pushing.

Thanks,
Imre

> Regards,
> Wayne
> > -----Original Message-----
> > From: Alex Deucher <alexdeucher@gmail.com>
> > Sent: Saturday, September 2, 2023 3:38 AM
> > To: Lyude Paul <lyude@redhat.com>
> > Cc: Lin, Wayne <Wayne.Lin@amd.com>; dri-devel@lists.freedesktop.org;
> > amd-gfx@lists.freedesktop.org; jani.nikula@intel.com; imre.deak@intel.com;
> > Wentland, Harry <Harry.Wentland@amd.com>; Zuo, Jerry
> > <Jerry.Zuo@amd.com>; ville.syrjala@linux.intel.com
> > Subject: Re: [Patch v2 2/3] drm/mst: Refactor the flow for payload
> > allocation/removement
> >
> > On Thu, Aug 31, 2023 at 6:45 PM Lyude Paul <lyude@redhat.com> wrote:
> > >
> > > On Thu, 2023-08-24 at 04:12 +0000, Lin, Wayne wrote:
> > > > [Public]
> > > >
> > > > Hi Lyude,
> > > >
> > > > I'm afraid that I don't have the permissions to push and would like
> > > > to have your help. Thanks!
> > >
> > > Whoops, sorry I only just noticed this message. I set a reminder on my
> > > phone to bug me to push it tomorrow :), sorry about the delay
> > >
> >
> > Wayne, I don't see why we couldn't give you commit permissions for drm-
> > misc.
> >
> > Alex
> >
> > > >
> > > > > -----Original Message-----
> > > > > From: Lyude Paul <lyude@redhat.com>
> > > > > Sent: Thursday, August 24, 2023 5:00 AM
> > > > > To: Lin, Wayne <Wayne.Lin@amd.com>;
> > > > > dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org
> > > > > Cc: jani.nikula@intel.com; ville.syrjala@linux.intel.com;
> > > > > imre.deak@intel.com; Wentland, Harry <Harry.Wentland@amd.com>;
> > > > > Zuo, Jerry <Jerry.Zuo@amd.com>
> > > > > Subject: Re: [Patch v2 2/3] drm/mst: Refactor the flow for payload
> > > > > allocation/removement
> > > > >
> > > > > Sure - you're also welcome to push the first two patches after
> > > > > fixing the indentation if you'd like
> > > > >
> > > > > On Wed, 2023-08-23 at 03:19 +0000, Lin, Wayne wrote:
> > > > > > [Public]
> > > > > >
> > > > > > Thanks, Lyude!
> > > > > > Should I push another version to fix the indention?
> > > > > >
> > > > > > > -----Original Message-----
> > > > > > > From: Lyude Paul <lyude@redhat.com>
> > > > > > > Sent: Friday, August 18, 2023 6:17 AM
> > > > > > > To: Lin, Wayne <Wayne.Lin@amd.com>;
> > > > > > > dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org
> > > > > > > Cc: jani.nikula@intel.com; ville.syrjala@linux.intel.com;
> > > > > > > imre.deak@intel.com; Wentland, Harry <Harry.Wentland@amd.com>;
> > > > > > > Zuo, Jerry <Jerry.Zuo@amd.com>
> > > > > > > Subject: Re: [Patch v2 2/3] drm/mst: Refactor the flow for
> > > > > > > payload allocation/removement
> > > > > > >
> > > > > > > Two small comments:
> > > > > > >
> > > > > > > On Mon, 2023-08-07 at 10:56 +0800, Wayne Lin wrote:
> > > > > > > > [Why]
> > > > > > > > Today, the allocation/deallocation steps and status is a bit unclear.
> > > > > > > >
> > > > > > > > For instance, payload->vc_start_slot = -1 stands for "the
> > > > > > > > failure of updating DPCD payload ID table" and can also
> > > > > > > > represent as "payload is not allocated yet". These two cases
> > > > > > > > should be handled differently and hence better to distinguish them
> > for better understanding.
> > > > > > > >
> > > > > > > > [How]
> > > > > > > > Define enumeration - ALLOCATION_LOCAL, ALLOCATION_DFP and
> > > > > > > > ALLOCATION_REMOTE to distinguish different allocation status.
> > > > > > > > Adjust the code to handle different status accordingly for
> > > > > > > > better understanding the sequence of payload allocation and
> > > > > > > > payload
> > > > > > > removement.
> > > > > > > >
> > > > > > > > For payload creation, the procedure should look like this:
> > > > > > > > DRM part 1:
> > > > > > > > * step 1 - update sw mst mgr variables to add a new payload
> > > > > > > > * step 2 - add payload at immediate DFP DPCD payload table
> > > > > > > >
> > > > > > > > Driver:
> > > > > > > > * Add new payload in HW and sync up with DFP by sending ACT
> > > > > > > >
> > > > > > > > DRM Part 2:
> > > > > > > > * Send ALLOCATE_PAYLOAD sideband message to allocate
> > > > > > > > bandwidth along
> > > > > > > the
> > > > > > > >   virtual channel.
> > > > > > > >
> > > > > > > > And as for payload removement, the procedure should look like this:
> > > > > > > > DRM part 1:
> > > > > > > > * step 1 - Send ALLOCATE_PAYLOAD sideband message to release
> > > > > bandwidth
> > > > > > > >            along the virtual channel
> > > > > > > > * step 2 - Clear payload allocation at immediate DFP DPCD
> > > > > > > > payload table
> > > > > > > >
> > > > > > > > Driver:
> > > > > > > > * Remove the payload in HW and sync up with DFP by sending
> > > > > > > > ACT
> > > > > > > >
> > > > > > > > DRM part 2:
> > > > > > > > * update sw mst mgr variables to remove the payload
> > > > > > > >
> > > > > > > > Note that it's fine to fail when communicate with the branch
> > > > > > > > device connected at immediate downstrean-facing port, but
> > > > > > > > updating variables of SW mst mgr and HW configuration should
> > > > > > > > be conducted anyway. That's because it's under commit_tail
> > > > > > > > and we need to complete the HW
> > > > > > > programming.
> > > > > > > >
> > > > > > > > Changes since v1:
> > > > > > > > * Remove the set but not use variable 'old_payload' in function
> > > > > > > >   'nv50_msto_prepare'. Catched by kernel test robot
> > > > > > > > <lkp@intel.com>
> > > > > > > >
> > > > > > > > Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
> > > > > > > > ---
> > > > > > > >  .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c |  20 ++-
> > > > > > > > drivers/gpu/drm/display/drm_dp_mst_topology.c | 159
> > > > > > > > +++++++++++------
> > > > > > > -
> > > > > > > >  drivers/gpu/drm/i915/display/intel_dp_mst.c   |  18 +-
> > > > > > > >  drivers/gpu/drm/nouveau/dispnv50/disp.c       |  21 +--
> > > > > > > >  include/drm/display/drm_dp_mst_helper.h       |  23 ++-
> > > > > > > >  5 files changed, 153 insertions(+), 88 deletions(-)
> > > > > > > >
> > > > > > > > diff --git
> > > > > > >
> > a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> > > > > > > >
> > b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> > > > > > > > index d9a482908380..9ad509279b0a 100644
> > > > > > > > ---
> > > > > > > >
> > a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> > > > > > > > +++
> > > > > b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> > > > > > > > @@ -219,7 +219,7 @@ static void
> > dm_helpers_construct_old_payload(
> > > > > > > >     /* Set correct time_slots/PBN of old payload.
> > > > > > > >      * other fields (delete & dsc_enabled) in
> > > > > > > >      * struct drm_dp_mst_atomic_payload are don't care fields
> > > > > > > > -    * while calling drm_dp_remove_payload()
> > > > > > > > +    * while calling drm_dp_remove_payload_part2()
> > > > > > > >      */
> > > > > > > >     for (i = 0; i < current_link_table.stream_count; i++) {
> > > > > > > >             dc_alloc =
> > > > > > > > @@ -262,13 +262,12 @@ bool
> > > > > > > > dm_helpers_dp_mst_write_payload_allocation_table(
> > > > > > > >
> > > > > > > >     mst_mgr = &aconnector->mst_root->mst_mgr;
> > > > > > > >     mst_state =
> > > > > > > > to_drm_dp_mst_topology_state(mst_mgr->base.state);
> > > > > > > > -
> > > > > > > > -   /* It's OK for this to fail */
> > > > > > > >     new_payload =
> > > > > > > > drm_atomic_get_mst_payload_state(mst_state,
> > > > > > > > aconnector->mst_output_port);
> > > > > > > >
> > > > > > > >     if (enable) {
> > > > > > > >             target_payload = new_payload;
> > > > > > > >
> > > > > > > > +           /* It's OK for this to fail */
> > > > > > > >             drm_dp_add_payload_part1(mst_mgr, mst_state,
> > > > > > > new_payload);
> > > > > > > >     } else {
> > > > > > > >             /* construct old payload by VCPI*/ @@ -276,7
> > > > > > > > +275,7 @@ bool
> > > > > > > dm_helpers_dp_mst_write_payload_allocation_table(
> > > > > > > >                                             new_payload, &old_payload);
> > > > > > > >             target_payload = &old_payload;
> > > > > > > >
> > > > > > > > -           drm_dp_remove_payload(mst_mgr, mst_state,
> > > > > > > &old_payload, new_payload);
> > > > > > > > +           drm_dp_remove_payload_part1(mst_mgr, mst_state,
> > > > > > > new_payload);
> > > > > > > >     }
> > > > > > > >
> > > > > > > >     /* mst_mgr->->payloads are VC payload notify MST branch
> > > > > > > > using
> > > > > > > DPCD
> > > > > > > > or @@ -342,7 +341,7 @@ bool
> > > > > > > dm_helpers_dp_mst_send_payload_allocation(
> > > > > > > >     struct amdgpu_dm_connector *aconnector;
> > > > > > > >     struct drm_dp_mst_topology_state *mst_state;
> > > > > > > >     struct drm_dp_mst_topology_mgr *mst_mgr;
> > > > > > > > -   struct drm_dp_mst_atomic_payload *payload;
> > > > > > > > +   struct drm_dp_mst_atomic_payload *new_payload,
> > > > > > > > + *old_payload;
> > > > > > > >     enum mst_progress_status set_flag =
> > > > > > > MST_ALLOCATE_NEW_PAYLOAD;
> > > > > > > >     enum mst_progress_status clr_flag =
> > > > > > > MST_CLEAR_ALLOCATED_PAYLOAD;
> > > > > > > >     int ret = 0;
> > > > > > > > @@ -355,15 +354,20 @@ bool
> > > > > > > dm_helpers_dp_mst_send_payload_allocation(
> > > > > > > >     mst_mgr = &aconnector->mst_root->mst_mgr;
> > > > > > > >     mst_state =
> > > > > > > > to_drm_dp_mst_topology_state(mst_mgr->base.state);
> > > > > > > >
> > > > > > > > -   payload = drm_atomic_get_mst_payload_state(mst_state,
> > > > > > > aconnector->mst_output_port);
> > > > > > > > +   new_payload =
> > > > > > > > + drm_atomic_get_mst_payload_state(mst_state,
> > > > > > > > +aconnector->mst_output_port);
> > > > > > > >
> > > > > > > >     if (!enable) {
> > > > > > > >             set_flag = MST_CLEAR_ALLOCATED_PAYLOAD;
> > > > > > > >             clr_flag = MST_ALLOCATE_NEW_PAYLOAD;
> > > > > > > >     }
> > > > > > > >
> > > > > > > > -   if (enable)
> > > > > > > > -           ret = drm_dp_add_payload_part2(mst_mgr, mst_state-
> > > > > > > > base.state, payload);
> > > > > > > > +   if (enable) {
> > > > > > > > +           ret = drm_dp_add_payload_part2(mst_mgr,
> > > > > > > > + mst_state-
> > > > > > > > base.state, new_payload);
> > > > > > > > +   } else {
> > > > > > > > +           dm_helpers_construct_old_payload(stream->link,
> > > > > > > > + mst_state-
> > > > > > > > pbn_div,
> > > > > > > > +                                            new_payload, old_payload);
> > > > > > > > +           drm_dp_remove_payload_part2(mst_mgr, mst_state,
> > > > > > > old_payload, new_payload);
> > > > > > > > +   }
> > > > > > > >
> > > > > > > >     if (ret) {
> > > > > > > >
> > > > > > > > amdgpu_dm_set_mst_status(&aconnector->mst_status,
> > > > > > > > diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > > > > > > b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > > > > > > index 4d80426757ab..e04f87ff755a 100644
> > > > > > > > --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > > > > > > +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > > > > > > @@ -3255,15 +3255,15 @@ int
> > > > > > > drm_dp_send_query_stream_enc_status(struct
> > > > > > > > drm_dp_mst_topology_mgr *mgr,  }
> > > > > > > > EXPORT_SYMBOL(drm_dp_send_query_stream_enc_status);
> > > > > > > >
> > > > > > > > -static int drm_dp_create_payload_step1(struct
> > > > > > > > drm_dp_mst_topology_mgr
> > > > > > > *mgr,
> > > > > > > > -                                  struct drm_dp_mst_atomic_payload
> > > > > > > *payload)
> > > > > > > > +static int drm_dp_create_payload_at_dfp(struct
> > > > > > > drm_dp_mst_topology_mgr *mgr,
> > > > > > > > +                                   struct
> > > > > > > > + drm_dp_mst_atomic_payload
> > > > > > > *payload)
> > > > > > > >  {
> > > > > > > >     return drm_dp_dpcd_write_payload(mgr, payload->vcpi,
> > > > > > > > payload- vc_start_slot,
> > > > > > > >                                      payload->time_slots);
> > > > > > > > }
> > > > > > > >
> > > > > > > > -static int drm_dp_create_payload_step2(struct
> > > > > > > > drm_dp_mst_topology_mgr
> > > > > > > *mgr,
> > > > > > > > -                                  struct drm_dp_mst_atomic_payload
> > > > > > > *payload)
> > > > > > > > +static int drm_dp_create_payload_to_remote(struct
> > > > > > > drm_dp_mst_topology_mgr *mgr,
> > > > > > > > +                                      struct
> > > > > > > > + drm_dp_mst_atomic_payload
> > > > > > > *payload)
> > > > > > > >  {
> > > > > > > >     int ret;
> > > > > > > >     struct drm_dp_mst_port *port =
> > > > > > > > drm_dp_mst_topology_get_port_validated(mgr, payload->port);
> > > > > > > > @@ -
> > > > > > > 3276,17 +3276,20 @@ static int
> > > > > > > drm_dp_create_payload_step2(struct
> > > > > > > drm_dp_mst_topology_mgr *mgr,
> > > > > > > >     return ret;
> > > > > > > >  }
> > > > > > > >
> > > > > > > > -static int drm_dp_destroy_payload_step1(struct
> > > > > > > drm_dp_mst_topology_mgr *mgr,
> > > > > > > > -                                   struct drm_dp_mst_topology_state
> > > > > > > *mst_state,
> > > > > > > > -                                   struct drm_dp_mst_atomic_payload
> > > > > > > *payload)
> > > > > > > > +static void drm_dp_destroy_payload_at_remote_and_dfp(struct
> > > > > > > drm_dp_mst_topology_mgr *mgr,
> > > > > > > > +                                                struct
> > > > > > > drm_dp_mst_topology_state *mst_state,
> > > > > > > > +                                                struct
> > > > > > > drm_dp_mst_atomic_payload *payload)
> > > > > > > >  {
> > > > > > > >     drm_dbg_kms(mgr->dev, "\n");
> > > > > > > >
> > > > > > > >     /* it's okay for these to fail */
> > > > > > > > -   drm_dp_payload_send_msg(mgr, payload->port, payload->vcpi,
> > 0);
> > > > > > > > -   drm_dp_dpcd_write_payload(mgr, payload->vcpi, payload-
> > > > > > > > vc_start_slot, 0);
> > > > > > > > +   if (payload->payload_allocation_status ==
> > > > > > > DRM_DP_MST_PAYLOAD_ALLOCATION_REMOTE) {
> > > > > > > > +           drm_dp_payload_send_msg(mgr, payload->port,
> > > > > > > > + payload-
> > > > > > > > vcpi, 0);
> > > > > > > > +           payload->payload_allocation_status =
> > > > > > > DRM_DP_MST_PAYLOAD_ALLOCATION_DFP;
> > > > > > > > +   }
> > > > > > > >
> > > > > > > > -   return 0;
> > > > > > > > +   if (payload->payload_allocation_status ==
> > > > > > > DRM_DP_MST_PAYLOAD_ALLOCATION_DFP)
> > > > > > > > +           drm_dp_dpcd_write_payload(mgr, payload->vcpi,
> > > > > > > > +payload->vc_start_slot, 0);
> > > > > > > >  }
> > > > > > > >
> > > > > > > >  /**
> > > > > > > > @@ -3296,81 +3299,105 @@ static int
> > > > > > > drm_dp_destroy_payload_step1(struct drm_dp_mst_topology_mgr
> > > > > > > *mgr,
> > > > > > > >   * @payload: The payload to write
> > > > > > > >   *
> > > > > > > >   * Determines the starting time slot for the given payload,
> > > > > > > > and programs the VCPI for this payload
> > > > > > > > - * into hardware. After calling this, the driver should
> > > > > > > > generate ACT and
> > > > > > > payload packets.
> > > > > > > > + * into the DPCD of DPRX. After calling this, the driver
> > > > > > > > + should generate ACT
> > > > > > > and payload packets.
> > > > > > > >   *
> > > > > > > > - * Returns: 0 on success, error code on failure. In the
> > > > > > > > event that this fails,
> > > > > > > > - * @payload.vc_start_slot will also be set to -1.
> > > > > > > > + * Returns: 0 on success, error code on failure.
> > > > > > > >   */
> > > > > > > >  int drm_dp_add_payload_part1(struct drm_dp_mst_topology_mgr
> > > > > *mgr,
> > > > > > > >                          struct drm_dp_mst_topology_state *mst_state,
> > > > > > > >                          struct drm_dp_mst_atomic_payload *payload)  {
> > > > > > > >     struct drm_dp_mst_port *port;
> > > > > > > > -   int ret;
> > > > > > > > +   int ret = 0;
> > > > > > > > +   bool allocate = true;
> > > > > > > > +
> > > > > > > > +   /* Update mst mgr info */
> > > > > > > > +   if (mgr->payload_count == 0)
> > > > > > > > +           mgr->next_start_slot = mst_state->start_slot;
> > > > > > > > +
> > > > > > > > +   payload->vc_start_slot = mgr->next_start_slot;
> > > > > > > > +
> > > > > > > > +   mgr->payload_count++;
> > > > > > > > +   mgr->next_start_slot += payload->time_slots;
> > > > > > > >
> > > > > > > > +   /* Allocate payload to immediate downstream facing port
> > > > > > > > + */
> > > > > > > >     port = drm_dp_mst_topology_get_port_validated(mgr,
> > > > > > > > payload- port);
> > > > > > > >     if (!port) {
> > > > > > > >             drm_dbg_kms(mgr->dev,
> > > > > > > > -                       "VCPI %d for port %p not in topology, not creating a
> > > > > > > payload\n",
> > > > > > > > +                       "VCPI %d for port %p not in
> > > > > > > > + topology, not creating a
> > > > > > > payload
> > > > > > > > +to remote\n",
> > > > > > > >                         payload->vcpi, payload->port);
> > > > > > > > -           payload->vc_start_slot = -1;
> > > > > > > > -           return 0;
> > > > > > > > +           allocate = false;
> > > > > > > >     }
> > > > > > > >
> > > > > > > > -   if (mgr->payload_count == 0)
> > > > > > > > -           mgr->next_start_slot = mst_state->start_slot;
> > > > > > > > -
> > > > > > > > -   payload->vc_start_slot = mgr->next_start_slot;
> > > > > > > > +   if (allocate) {
> > > > > > > > +           ret = drm_dp_create_payload_at_dfp(mgr, payload);
> > > > > > > > +           if (ret < 0)
> > > > > > > > +                   drm_warn(mgr->dev, "Failed to create MST
> > > > > > > > + payload
> > > > > > > for port %p: %d\n",
> > > > > > > > +                            payload->port, ret);
> > > > > > > >
> > > > > > > > -   ret = drm_dp_create_payload_step1(mgr, payload);
> > > > > > > > -   drm_dp_mst_topology_put_port(port);
> > > > > > > > -   if (ret < 0) {
> > > > > > > > -           drm_warn(mgr->dev, "Failed to create MST payload for port
> > > > > > > %p: %d\n",
> > > > > > > > -                    payload->port, ret);
> > > > > > > > -           payload->vc_start_slot = -1;
> > > > > > > > -           return ret;
> > > > > > > >     }
> > > > > > > >
> > > > > > > > -   mgr->payload_count++;
> > > > > > > > -   mgr->next_start_slot += payload->time_slots;
> > > > > > > > +   payload->payload_allocation_status =
> > > > > > > > +           (!allocate || ret < 0) ?
> > > > > > > DRM_DP_MST_PAYLOAD_ALLOCATION_LOCAL :
> > > > > > > > +
> > > > > > >       DRM_DP_MST_PAYLOAD_ALLOCATION_DFP;
> > > > > > >
> > > > > > > Just need to fix indenting here
> > > > > > >
> > > > > > > >
> > > > > > > > -   return 0;
> > > > > > > > +   drm_dp_mst_topology_put_port(port);
> > > > > > > > +
> > > > > > > > +   return ret;
> > > > > > > >  }
> > > > > > > >  EXPORT_SYMBOL(drm_dp_add_payload_part1);
> > > > > > > >
> > > > > > > >  /**
> > > > > > > > - * drm_dp_remove_payload() - Remove an MST payload
> > > > > > > > + * drm_dp_remove_payload_part1() - Remove an MST payload
> > > > > > > > + along the virtual channel
> > > > > > > >   * @mgr: Manager to use.
> > > > > > > >   * @mst_state: The MST atomic state
> > > > > > > > - * @old_payload: The payload with its old state
> > > > > > > > - * @new_payload: The payload to write
> > > > > > > > + * @payload: The payload to remove
> > > > > > > >   *
> > > > > > > > - * Removes a payload from an MST topology if it was
> > > > > > > > successfully assigned a start slot. Also updates
> > > > > > > > - * the starting time slots of all other payloads which
> > > > > > > > would have been shifted towards the start of
> > > > > > > > - * the VC table as a result. After calling this, the driver
> > > > > > > > should generate ACT
> > > > > > > and payload packets.
> > > > > > > > + * Removes a payload along the virtual channel if it was
> > > > > > > > + successfully
> > > > > > > allocated.
> > > > > > > > + * After calling this, the driver should set HW to generate
> > > > > > > > + ACT and then switch to new
> > > > > > > > + * payload allocation state.
> > > > > > > >   */
> > > > > > > > -void drm_dp_remove_payload(struct drm_dp_mst_topology_mgr
> > *mgr,
> > > > > > > > -                      struct drm_dp_mst_topology_state *mst_state,
> > > > > > > > -                      const struct drm_dp_mst_atomic_payload
> > > > > > > *old_payload,
> > > > > > > > -                      struct drm_dp_mst_atomic_payload *new_payload)
> > > > > > > > +void drm_dp_remove_payload_part1(struct
> > > > > drm_dp_mst_topology_mgr
> > > > > > > *mgr,
> > > > > > > > +                            struct
> > > > > > > > + drm_dp_mst_topology_state
> > > > > > > *mst_state,
> > > > > > > > +                            struct
> > > > > > > > + drm_dp_mst_atomic_payload
> > > > > > > *payload)
> > > > > > > >  {
> > > > > > > > -   struct drm_dp_mst_atomic_payload *pos;
> > > > > > > > +   /* Remove remote payload allocation */
> > > > > > > >     bool send_remove = false;
> > > > > > > >
> > > > > > > > -   /* We failed to make the payload, so nothing to do */
> > > > > > > > -   if (new_payload->vc_start_slot == -1)
> > > > > > > > -           return;
> > > > > > > > -
> > > > > > > >     mutex_lock(&mgr->lock);
> > > > > > > > -   send_remove =
> > > > > > > drm_dp_mst_port_downstream_of_branch(new_payload->port,
> > mgr-
> > > > > > > > mst_primary);
> > > > > > > > +   send_remove =
> > > > > > > > + drm_dp_mst_port_downstream_of_branch(payload-
> > > > > > > > port,
> > > > > > > > +mgr->mst_primary);
> > > > > > > >     mutex_unlock(&mgr->lock);
> > > > > > > >
> > > > > > > >     if (send_remove)
> > > > > > > > -           drm_dp_destroy_payload_step1(mgr, mst_state,
> > > > > > > new_payload);
> > > > > > > > +           drm_dp_destroy_payload_at_remote_and_dfp(mgr,
> > > > > > > mst_state, payload);
> > > > > > > >     else
> > > > > > > >             drm_dbg_kms(mgr->dev, "Payload for VCPI %d not
> > > > > > > > in
> > > > > > > topology, not sending remove\n",
> > > > > > > > -                       new_payload->vcpi);
> > > > > > > > +                       payload->vcpi);
> > > > > > > > +
> > > > > > > > +   payload->payload_allocation_status =
> > > > > > > > +DRM_DP_MST_PAYLOAD_ALLOCATION_LOCAL;
> > > > > > > > +}
> > > > > > > > +EXPORT_SYMBOL(drm_dp_remove_payload_part1);
> > > > > > > >
> > > > > > > > +/**
> > > > > > > > + * drm_dp_remove_payload_part2() - Remove an MST payload
> > > > > > > > +locally
> > > > > > > > + * @mgr: Manager to use.
> > > > > > > > + * @mst_state: The MST atomic state
> > > > > > > > + * @old_payload: The payload with its old state
> > > > > > > > + * @new_payload: The payload with its latest state
> > > > > > > > + *
> > > > > > > > + * Updates the starting time slots of all other payloads
> > > > > > > > +which would have been shifted towards
> > > > > > > > + * the start of the payload ID table as a result of
> > > > > > > > +removing a payload. Driver should call this
> > > > > > > > + * function whenever it removes a payload in its HW. It's
> > > > > > > > +independent to the result of payload
> > > > > > > > + * allocation/deallocation at branch devices along the virtual
> > channel.
> > > > > > > > + */
> > > > > > > > +void drm_dp_remove_payload_part2(struct
> > > > > drm_dp_mst_topology_mgr
> > > > > > > *mgr,
> > > > > > > > +                            struct
> > > > > > > > + drm_dp_mst_topology_state
> > > > > > > *mst_state,
> > > > > > > > +                            const struct
> > > > > > > > + drm_dp_mst_atomic_payload
> > > > > > > *old_payload,
> > > > > > > > +                            struct
> > > > > > > > + drm_dp_mst_atomic_payload
> > > > > > > *new_payload) {
> > > > > > > > +   struct drm_dp_mst_atomic_payload *pos;
> > > > > > > > +
> > > > > > > > +   /* Remove local payload allocation */
> > > > > > > >     list_for_each_entry(pos, &mst_state->payloads, next) {
> > > > > > > >             if (pos != new_payload && pos->vc_start_slot >
> > > > > > > > new_payload-
> > > > > > > > vc_start_slot)
> > > > > > > >                     pos->vc_start_slot -=
> > > > > > > > old_payload->time_slots; @@ -
> > > > > > > 3382,9 +3409,10
> > > > > > > > @@ void drm_dp_remove_payload(struct
> > drm_dp_mst_topology_mgr
> > > > > > > *mgr,
> > > > > > > >
> > > > > > > >     if (new_payload->delete)
> > > > > > > >             drm_dp_mst_put_port_malloc(new_payload->port);
> > > > > > > > -}
> > > > > > > > -EXPORT_SYMBOL(drm_dp_remove_payload);
> > > > > > > >
> > > > > > > > +   new_payload->payload_allocation_status =
> > > > > > > > +DRM_DP_MST_PAYLOAD_ALLOCATION_NONE;
> > > > > > > > +}
> > > > > > > > +EXPORT_SYMBOL(drm_dp_remove_payload_part2);
> > > > > > > >  /**
> > > > > > > >   * drm_dp_add_payload_part2() - Execute payload update part 2
> > > > > > > >   * @mgr: Manager to use.
> > > > > > > > @@ -3403,17 +3431,19 @@ int
> > drm_dp_add_payload_part2(struct
> > > > > > > drm_dp_mst_topology_mgr *mgr,
> > > > > > > >     int ret = 0;
> > > > > > > >
> > > > > > > >     /* Skip failed payloads */
> > > > > > > > -   if (payload->vc_start_slot == -1) {
> > > > > > > > -           drm_dbg_kms(mgr->dev, "Part 1 of payload creation for %s
> > > > > > > failed, skipping part 2\n",
> > > > > > > > +   if (payload->payload_allocation_status !=
> > > > > > > DRM_DP_MST_PAYLOAD_ALLOCATION_DFP) {
> > > > > > > > +           drm_dbg_kms(state->dev, "Part 1 of payload
> > > > > > > > + creation for %s
> > > > > > > failed,
> > > > > > > > +skipping part 2\n",
> > > > > > > >                         payload->port->connector->name);
> > > > > > > >             return -EIO;
> > > > > > > >     }
> > > > > > > >
> > > > > > > > -   ret = drm_dp_create_payload_step2(mgr, payload);
> > > > > > > > -   if (ret < 0) {
> > > > > > > > +   /* Allocate payload to remote end */
> > > > > > > > +   ret = drm_dp_create_payload_to_remote(mgr, payload);
> > > > > > > > +   if (ret < 0)
> > > > > > > >             drm_err(mgr->dev, "Step 2 of creating MST
> > > > > > > > payload for %p
> > > > > > > failed: %d\n",
> > > > > > > >                     payload->port, ret);
> > > > > > > > -   }
> > > > > > > > +   else
> > > > > > > > +           payload->payload_allocation_status =
> > > > > > > > +DRM_DP_MST_PAYLOAD_ALLOCATION_REMOTE;
> > > > > > > >
> > > > > > > >     return ret;
> > > > > > > >  }
> > > > > > > > @@ -4324,6 +4354,7 @@ int
> > > > > > > > drm_dp_atomic_find_time_slots(struct
> > > > > > > drm_atomic_state *state,
> > > > > > > >             drm_dp_mst_get_port_malloc(port);
> > > > > > > >             payload->port = port;
> > > > > > > >             payload->vc_start_slot = -1;
> > > > > > > > +           payload->payload_allocation_status =
> > > > > > > > +DRM_DP_MST_PAYLOAD_ALLOCATION_NONE;
> > > > > > > >             list_add(&payload->next, &topology_state->payloads);
> > > > > > > >     }
> > > > > > > >     payload->time_slots = req_slots; @@ -4493,7 +4524,7 @@
> > > > > > > > void
> > > > > > > drm_dp_mst_atomic_wait_for_dependencies(struct
> > > > > > > drm_atomic_state
> > > > > > > *state)
> > > > > > > >             }
> > > > > > > >
> > > > > > > >             /* Now that previous state is committed, it's
> > > > > > > > safe to copy over
> > > > > > > the start slot
> > > > > > > > -            * assignments
> > > > > > > > +            * and allocation status assignments
> > > > > > > >              */
> > > > > > > >             list_for_each_entry(old_payload,
> > > > > > > > &old_mst_state->payloads,
> > > > > > > next) {
> > > > > > > >                     if (old_payload->delete) @@ -4502,6
> > > > > > > > +4533,8 @@ void
> > > > > > > drm_dp_mst_atomic_wait_for_dependencies(struct
> > > > > > > drm_atomic_state
> > > > > > > *state)
> > > > > > > >                     new_payload =
> > > > > > > drm_atomic_get_mst_payload_state(new_mst_state,
> > > > > > > >
> > > > > > > old_payload->port);
> > > > > > > >                     new_payload->vc_start_slot =
> > > > > > > > old_payload- vc_start_slot;
> > > > > > > > +                   new_payload->payload_allocation_status =
> > > > > > > > +
> > > > > > > > + old_payload-
> > > > > > > > payload_allocation_status;
> > > > > > >
> > > > > > > And here. Besides that, I think patches 1/3 and 2/3 look
> > > > > > > great! Just finished testing them on nouveau:
> > > > > > >
> > > > > > > Reviewed-by: Lyude Paul <lyude@redhat.com>
> > > > > > >
> > > > > > > Patch 3/3 I gotta think about a bit more (and am curious about
> > > > > > > Imre's current take on it) I think
> > > > > > >
> > > > > > > >             }
> > > > > > > >     }
> > > > > > > >  }
> > > > > > > > @@ -4818,6 +4851,13 @@ void
> > drm_dp_mst_dump_topology(struct
> > > > > > > seq_file *m,
> > > > > > > >     struct drm_dp_mst_atomic_payload *payload;
> > > > > > > >     int i, ret;
> > > > > > > >
> > > > > > > > +   static const char *const status[] = {
> > > > > > > > +           "None",
> > > > > > > > +           "Local",
> > > > > > > > +           "DFP",
> > > > > > > > +           "Remote",
> > > > > > > > +   };
> > > > > > > > +
> > > > > > > >     mutex_lock(&mgr->lock);
> > > > > > > >     if (mgr->mst_primary)
> > > > > > > >             drm_dp_mst_dump_mstb(m, mgr->mst_primary); @@ -
> > > > > > > 4834,7 +4874,7 @@
> > > > > > > > void drm_dp_mst_dump_topology(struct seq_file *m,
> > > > > > > >     seq_printf(m, "payload_mask: %x, max_payloads: %d, start_slot:
> > > > > > > > %u,
> > > > > > > pbn_div: %d\n",
> > > > > > > >                state->payload_mask, mgr->max_payloads,
> > > > > > > > state- start_slot,
> > > > > > > > state->pbn_div);
> > > > > > > >
> > > > > > > > -   seq_printf(m, "\n| idx | port | vcpi | slots | pbn | dsc |     sink
> > name
> > > > > > > > \n");
> > > > > > > > +   seq_printf(m, "\n| idx | port | vcpi | slots | pbn | dsc | status |
> > sink
> > > > > > > name     |\n");
> > > > > > > >     for (i = 0; i < mgr->max_payloads; i++) {
> > > > > > > >             list_for_each_entry(payload, &state->payloads, next) {
> > > > > > > >                     char name[14]; @@ -4843,7 +4883,7 @@
> > > > > > > > void drm_dp_mst_dump_topology(struct
> > > > > > > seq_file *m,
> > > > > > > >                             continue;
> > > > > > > >
> > > > > > > >                     fetch_monitor_name(mgr, payload->port,
> > > > > > > > name,
> > > > > > > sizeof(name));
> > > > > > > > -                   seq_printf(m, " %5d %6d %6d %02d - %02d %5d %5s
> > > > > > > %19s\n",
> > > > > > > > +                   seq_printf(m, " %5d %6d %6d %02d - %02d
> > > > > > > > + %5d %5s
> > > > > > > %8s %19s\n",
> > > > > > > >                                i,
> > > > > > > >                                payload->port->port_num,
> > > > > > > >                                payload->vcpi, @@ -4851,6
> > > > > > > > +4891,7 @@ void drm_dp_mst_dump_topology(struct
> > > > > > > seq_file *m,
> > > > > > > >                                payload->vc_start_slot +
> > > > > > > > payload- time_slots - 1,
> > > > > > > >                                payload->pbn,
> > > > > > > >                                payload->dsc_enabled ? "Y" :
> > > > > > > > "N",
> > > > > > > > +
> > > > > > > > + status[payload->payload_allocation_status],
> > > > > > > >                                (*name != 0) ? name : "Unknown");
> > > > > > > >             }
> > > > > > > >     }
> > > > > > > > diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > > > > > > > b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > > > > > > > index e3f176a093d2..5f73cdabe7a1 100644
> > > > > > > > --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > > > > > > > +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > > > > > > > @@ -557,12 +557,8 @@ static void intel_mst_disable_dp(struct
> > > > > > > intel_atomic_state *state,
> > > > > > > >     struct intel_dp *intel_dp = &dig_port->dp;
> > > > > > > >     struct intel_connector *connector =
> > > > > > > >             to_intel_connector(old_conn_state->connector);
> > > > > > > > -   struct drm_dp_mst_topology_state *old_mst_state =
> > > > > > > > -           drm_atomic_get_old_mst_topology_state(&state->base,
> > > > > > > &intel_dp->mst_mgr);
> > > > > > > >     struct drm_dp_mst_topology_state *new_mst_state =
> > > > > > > >
> > > > > > > > drm_atomic_get_new_mst_topology_state(&state->base,
> > > > > > > &intel_dp->mst_mgr);
> > > > > > > > -   const struct drm_dp_mst_atomic_payload *old_payload =
> > > > > > > > -           drm_atomic_get_mst_payload_state(old_mst_state,
> > > > > > > connector->port);
> > > > > > > >     struct drm_dp_mst_atomic_payload *new_payload =
> > > > > > > >             drm_atomic_get_mst_payload_state(new_mst_state,
> > > > > > > connector->port);
> > > > > > > >     struct drm_i915_private *i915 =
> > > > > > > > to_i915(connector->base.dev); @@
> > > > > > > > -572,8 +568,7 @@ static void intel_mst_disable_dp(struct
> > > > > > > > intel_atomic_state *state,
> > > > > > > >
> > > > > > > >     intel_hdcp_disable(intel_mst->connector);
> > > > > > > >
> > > > > > > > -   drm_dp_remove_payload(&intel_dp->mst_mgr, new_mst_state,
> > > > > > > > -                         old_payload, new_payload);
> > > > > > > > +   drm_dp_remove_payload_part1(&intel_dp->mst_mgr,
> > > > > > > new_mst_state,
> > > > > > > > +new_payload);
> > > > > > > >
> > > > > > > >     intel_audio_codec_disable(encoder, old_crtc_state,
> > > > > > > > old_conn_state); } @@ -588,6 +583,14 @@ static void
> > > > > > > > intel_mst_post_disable_dp(struct intel_atomic_state *state,
> > > > > > > >     struct intel_dp *intel_dp = &dig_port->dp;
> > > > > > > >     struct intel_connector *connector =
> > > > > > > >             to_intel_connector(old_conn_state->connector);
> > > > > > > > +   struct drm_dp_mst_topology_state *old_mst_state =
> > > > > > > > +
> > > > > > > > + drm_atomic_get_old_mst_topology_state(&state->base,
> > > > > > > &intel_dp->mst_mgr);
> > > > > > > > +   struct drm_dp_mst_topology_state *new_mst_state =
> > > > > > > > +
> > > > > > > > + drm_atomic_get_new_mst_topology_state(&state->base,
> > > > > > > &intel_dp->mst_mgr);
> > > > > > > > +   const struct drm_dp_mst_atomic_payload *old_payload =
> > > > > > > > +           drm_atomic_get_mst_payload_state(old_mst_state,
> > > > > > > connector->port);
> > > > > > > > +   struct drm_dp_mst_atomic_payload *new_payload =
> > > > > > > > +           drm_atomic_get_mst_payload_state(new_mst_state,
> > > > > > > connector->port);
> > > > > > > >     struct drm_i915_private *dev_priv = to_i915(connector-
> > >base.dev);
> > > > > > > >     bool last_mst_stream;
> > > > > > > >
> > > > > > > > @@ -608,6 +611,9 @@ static void
> > > > > > > > intel_mst_post_disable_dp(struct intel_atomic_state *state,
> > > > > > > >
> > > > > > > >     wait_for_act_sent(encoder, old_crtc_state);
> > > > > > > >
> > > > > > > > +   drm_dp_remove_payload_part2(&intel_dp->mst_mgr,
> > > > > > > new_mst_state,
> > > > > > > > +                               old_payload, new_payload);
> > > > > > > > +
> > > > > > > >     intel_ddi_disable_transcoder_func(old_crtc_state);
> > > > > > > >
> > > > > > > >     if (DISPLAY_VER(dev_priv) >= 9) diff --git
> > > > > > > > a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> > > > > > > > b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> > > > > > > > index 4e7c9c353c51..bba01fa0780c 100644
> > > > > > > > --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> > > > > > > > +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> > > > > > > > @@ -882,21 +882,26 @@ struct nouveau_encoder
> > > > > > > > *nv50_real_outp(struct drm_encoder *encoder)
> > > > > > > >
> > > > > > > >  static void
> > > > > > > >  nv50_msto_cleanup(struct drm_atomic_state *state,
> > > > > > > > -             struct drm_dp_mst_topology_state *mst_state,
> > > > > > > > +             struct drm_dp_mst_topology_state
> > > > > > > > + *new_mst_state,
> > > > > > > >               struct drm_dp_mst_topology_mgr *mgr,
> > > > > > > >               struct nv50_msto *msto)  {
> > > > > > > >     struct nouveau_drm *drm = nouveau_drm(msto->encoder.dev);
> > > > > > > > -   struct drm_dp_mst_atomic_payload *payload =
> > > > > > > > -           drm_atomic_get_mst_payload_state(mst_state, msto->mstc-
> > > > > > > > port);
> > > > > > > > +   struct drm_dp_mst_atomic_payload *new_payload =
> > > > > > > > +           drm_atomic_get_mst_payload_state(new_mst_state,
> > > > > > > > + msto-
> > > > > > > > mstc->port);
> > > > > > > > +   struct drm_dp_mst_topology_state *old_mst_state =
> > > > > > > > +           drm_atomic_get_old_mst_topology_state(state, mgr);
> > > > > > > > +   const struct drm_dp_mst_atomic_payload *old_payload =
> > > > > > > > +           drm_atomic_get_mst_payload_state(old_mst_state,
> > > > > > > > + msto-
> > > > > > > > mstc->port);
> > > > > > > >
> > > > > > > >     NV_ATOMIC(drm, "%s: msto cleanup\n",
> > > > > > > > msto->encoder.name);
> > > > > > > >
> > > > > > > >     if (msto->disabled) {
> > > > > > > >             msto->mstc = NULL;
> > > > > > > >             msto->disabled = false;
> > > > > > > > +           drm_dp_remove_payload_part2(mgr, new_mst_state,
> > > > > > > old_payload,
> > > > > > > > +new_payload);
> > > > > > > >     } else if (msto->enabled) {
> > > > > > > > -           drm_dp_add_payload_part2(mgr, state, payload);
> > > > > > > > +           drm_dp_add_payload_part2(mgr, state,
> > > > > > > > + new_payload);
> > > > > > > >             msto->enabled = false;
> > > > > > > >     }
> > > > > > > >  }
> > > > > > > > @@ -910,19 +915,15 @@ nv50_msto_prepare(struct
> > > > > > > > drm_atomic_state
> > > > > > > *state,
> > > > > > > >     struct nouveau_drm *drm = nouveau_drm(msto->encoder.dev);
> > > > > > > >     struct nv50_mstc *mstc = msto->mstc;
> > > > > > > >     struct nv50_mstm *mstm = mstc->mstm;
> > > > > > > > -   struct drm_dp_mst_topology_state *old_mst_state;
> > > > > > > > -   struct drm_dp_mst_atomic_payload *payload, *old_payload;
> > > > > > > > +   struct drm_dp_mst_atomic_payload *payload;
> > > > > > > >
> > > > > > > >     NV_ATOMIC(drm, "%s: msto prepare\n",
> > > > > > > > msto->encoder.name);
> > > > > > > >
> > > > > > > > -   old_mst_state = drm_atomic_get_old_mst_topology_state(state,
> > > > > > > mgr);
> > > > > > > > -
> > > > > > > >     payload = drm_atomic_get_mst_payload_state(mst_state,
> > > > > > > > mstc- port);
> > > > > > > > -   old_payload =
> > drm_atomic_get_mst_payload_state(old_mst_state,
> > > > > > > mstc->port);
> > > > > > > >
> > > > > > > >     // TODO: Figure out if we want to do a better job of
> > > > > > > > handling VCPI
> > > > > > > allocation failures here?
> > > > > > > >     if (msto->disabled) {
> > > > > > > > -           drm_dp_remove_payload(mgr, mst_state, old_payload,
> > > > > > > payload);
> > > > > > > > +           drm_dp_remove_payload_part1(mgr, mst_state,
> > > > > > > > + payload);
> > > > > > > >
> > > > > > > >             nvif_outp_dp_mst_vcpi(&mstm->outp->outp,
> > > > > > > > msto->head- base.index, 0, 0, 0, 0);
> > > > > > > >     } else {
> > > > > > > > diff --git a/include/drm/display/drm_dp_mst_helper.h
> > > > > > > > b/include/drm/display/drm_dp_mst_helper.h
> > > > > > > > index ed5c9660563c..4429d3b1745b 100644
> > > > > > > > --- a/include/drm/display/drm_dp_mst_helper.h
> > > > > > > > +++ b/include/drm/display/drm_dp_mst_helper.h
> > > > > > > > @@ -46,6 +46,13 @@ struct drm_dp_mst_topology_ref_history {
> > > > > > > > }; #endif /*
> > > > > IS_ENABLED(CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS) */
> > > > > > > >
> > > > > > > > +enum drm_dp_mst_payload_allocation {
> > > > > > > > +   DRM_DP_MST_PAYLOAD_ALLOCATION_NONE,
> > > > > > > > +   DRM_DP_MST_PAYLOAD_ALLOCATION_LOCAL,
> > > > > > > > +   DRM_DP_MST_PAYLOAD_ALLOCATION_DFP,
> > > > > > > > +   DRM_DP_MST_PAYLOAD_ALLOCATION_REMOTE,
> > > > > > > > +};
> > > > > > > > +
> > > > > > > >  struct drm_dp_mst_branch;
> > > > > > > >
> > > > > > > >  /**
> > > > > > > > @@ -537,7 +544,7 @@ struct drm_dp_mst_atomic_payload {
> > > > > > > >      *   drm_dp_mst_atomic_wait_for_dependencies() has been
> > called,
> > > > > > > which will ensure the
> > > > > > > >      *   previous MST states payload start slots have been copied over
> > to
> > > > > > > the new state. Note
> > > > > > > >      *   that a new start slot won't be assigned/removed from this
> > payload
> > > > > > > until
> > > > > > > > -    *   drm_dp_add_payload_part1()/drm_dp_remove_payload()
> > have
> > > > > > > been called.
> > > > > > > > +    *
> > drm_dp_add_payload_part1()/drm_dp_remove_payload_part2()
> > > > > > > have been called.
> > > > > > > >      * * Acquire the MST modesetting lock, and then wait for
> > > > > > > > any pending
> > > > > > > MST-related commits to
> > > > > > > >      *   get committed to hardware by calling drm_crtc_commit_wait()
> > on
> > > > > > > each of the
> > > > > > > >      *   &drm_crtc_commit structs in
> > > > > > > &drm_dp_mst_topology_state.commit_deps.
> > > > > > > > @@ -564,6 +571,9 @@ struct drm_dp_mst_atomic_payload {
> > > > > > > >     /** @dsc_enabled: Whether or not this payload has DSC enabled
> > */
> > > > > > > >     bool dsc_enabled : 1;
> > > > > > > >
> > > > > > > > +   /** @payload_allocation_status: The allocation status of
> > > > > > > > + this payload
> > > > > > > */
> > > > > > > > +   enum drm_dp_mst_payload_allocation
> > > > > > > > + payload_allocation_status;
> > > > > > > > +
> > > > > > > >     /** @next: The list node for this payload */
> > > > > > > >     struct list_head next;
> > > > > > > >  };
> > > > > > > > @@ -842,10 +852,13 @@ int drm_dp_add_payload_part1(struct
> > > > > > > > drm_dp_mst_topology_mgr *mgr,  int
> > > > > drm_dp_add_payload_part2(struct
> > > > > > > drm_dp_mst_topology_mgr *mgr,
> > > > > > > >                          struct drm_atomic_state *state,
> > > > > > > >                          struct drm_dp_mst_atomic_payload
> > > > > > > > *payload); -
> > > > > > > void
> > > > > > > > drm_dp_remove_payload(struct drm_dp_mst_topology_mgr *mgr,
> > > > > > > > -                      struct drm_dp_mst_topology_state *mst_state,
> > > > > > > > -                      const struct drm_dp_mst_atomic_payload
> > > > > > > *old_payload,
> > > > > > > > -                      struct drm_dp_mst_atomic_payload
> > > > > > > *new_payload);
> > > > > > > > +void drm_dp_remove_payload_part1(struct
> > > > > drm_dp_mst_topology_mgr
> > > > > > > *mgr,
> > > > > > > > +                            struct
> > > > > > > > + drm_dp_mst_topology_state
> > > > > > > *mst_state,
> > > > > > > > +                            struct
> > > > > > > > + drm_dp_mst_atomic_payload
> > > > > > > *payload); void
> > > > > > > > +drm_dp_remove_payload_part2(struct
> > drm_dp_mst_topology_mgr
> > > > > *mgr,
> > > > > > > > +                            struct
> > > > > > > > + drm_dp_mst_topology_state
> > > > > > > *mst_state,
> > > > > > > > +                            const struct
> > > > > > > > + drm_dp_mst_atomic_payload
> > > > > > > *old_payload,
> > > > > > > > +                            struct
> > > > > > > > + drm_dp_mst_atomic_payload
> > > > > > > *new_payload);
> > > > > > > >
> > > > > > > >  int drm_dp_check_act_status(struct drm_dp_mst_topology_mgr
> > > > > > > > *mgr);
> > > > > > > >
> > > > > > >
> > > > > > > --
> > > > > > > Cheers,
> > > > > > >  Lyude Paul (she/her)
> > > > > > >  Software Engineer at Red Hat
> > > > > > --
> > > > > > Regards,
> > > > > > Wayne
> > > > >
> > > > > --
> > > > > Cheers,
> > > > >  Lyude Paul (she/her)
> > > > >  Software Engineer at Red Hat
> > > > --
> > > > Regards,
> > > > Wayne
> > > >
> > >
> > > --
> > > Cheers,
> > >  Lyude Paul (she/her)
> > >  Software Engineer at Red Hat
> > >
