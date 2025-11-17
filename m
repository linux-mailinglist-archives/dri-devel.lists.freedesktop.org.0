Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 870FBC637C7
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 11:19:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09A8510E33D;
	Mon, 17 Nov 2025 10:19:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X0Wdmvzo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D23610E335;
 Mon, 17 Nov 2025 10:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763374765; x=1794910765;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=PCJleoQJ7kNNK4RhfKz4IgKRPFtwGeZQEjBjnIBOZYM=;
 b=X0Wdmvzo7zP3uypCnnWvZDHV/BQCLP8+ekBiWvfWHll45lWarLKocZw5
 dtrP117hmOxx2fMFeDWjHvJ/S49UCXFHIFGOpK3cadimruxHN+XCF5f9E
 kRmm1Nj93eK1B5crZMKHKFbv6/a42LlcIheb3lz3TVTDrixLRqI6gE2yu
 CvZKNK7q0r+JS0YFKzcurQo6BI2fymN5nl5l8sz3nuaMPLQQ12JTalIeS
 p0JH/90vjC6A9jS4unpsHXplCZZ01Y8Z4GhqXm2ywf6T4z2n8wGBm/IWm
 bV17mKdWbO9erKFyXqBxOs+vjpKjxD8nJLvlIhYMV3hwFwBSbxEllNAfl g==;
X-CSE-ConnectionGUID: HJDxiaZuQ9aBdz2E1QUNyw==
X-CSE-MsgGUID: KjfXBDO7SViiB1obGyQo7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="64373365"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; d="scan'208";a="64373365"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 02:19:24 -0800
X-CSE-ConnectionGUID: 9QyNFrfvTquJ0IPlM3c1Xw==
X-CSE-MsgGUID: 3YhNZn72S06ymNPcXfRwYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; d="scan'208";a="194869380"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.42])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 02:19:22 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: imre.deak@intel.com, Suraj Kandpal <suraj.kandpal@intel.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, Ankit
 K Nautiyal <ankit.k.nautiyal@intel.com>, Arun R Murthy
 <arun.r.murthy@intel.com>
Subject: Re: [PATCH] drm/display/dp_mst: Add protection against 0 vcpi
In-Reply-To: <aRr0MJbOaHXMXEtO@ideak-desk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251113043918.716367-1-suraj.kandpal@intel.com>
 <aRWU-ovOdSRUQI-B@ideak-desk>
 <689e22d69f7ad9be4f4a78b5194d8c4965be8ca8@intel.com>
 <DM3PPF208195D8D4E9B5E427A947CB14523E3C9A@DM3PPF208195D8D.namprd11.prod.outlook.com>
 <aRr0MJbOaHXMXEtO@ideak-desk>
Date: Mon, 17 Nov 2025 12:19:18 +0200
Message-ID: <2804e0989a1251c4223aeb64b1220e0b01ba66ef@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Mon, 17 Nov 2025, Imre Deak <imre.deak@intel.com> wrote:
> On Mon, Nov 17, 2025 at 07:09:38AM +0200, Suraj Kandpal wrote:
>> > -----Original Message-----
>> > From: Jani Nikula <jani.nikula@linux.intel.com>
>> > Sent: Thursday, November 13, 2025 9:55 PM
>> > To: Deak, Imre <imre.deak@intel.com>; Kandpal, Suraj
>> > <suraj.kandpal@intel.com>
>> > Cc: dri-devel@lists.freedesktop.org; intel-xe@lists.freedesktop.org; intel-
>> > gfx@lists.freedesktop.org; Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>;
>> > Murthy, Arun R <arun.r.murthy@intel.com>
>> > Subject: Re: [PATCH] drm/display/dp_mst: Add protection against 0 vcpi
>> > 
>> > On Thu, 13 Nov 2025, Imre Deak <imre.deak@intel.com> wrote:
>> > > On Thu, Nov 13, 2025 at 10:09:19AM +0530, Suraj Kandpal wrote:
>> > >> When releasing a timeslot there is a slight chance we may end up with
>> > >> the wrong payload mask due to overflow if the delayed_destroy_work
>> > >> ends up coming into play after a DP 2.1 monitor gets disconnected
>> > >> which causes vcpi to become 0 then we try to make the payload =
>> > >> ~BIT(vcpi - 1) which is a negative shift.
>> > >>
>> > >> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
>> > >> ---
>> > >>  drivers/gpu/drm/display/drm_dp_mst_topology.c | 4 +++-
>> > >>  1 file changed, 3 insertions(+), 1 deletion(-)
>> > >>
>> > >> diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c
>> > >> b/drivers/gpu/drm/display/drm_dp_mst_topology.c
>> > >> index 64e5c176d5cc..3cf1eafcfcb5 100644
>> > >> --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
>> > >> +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
>> > >> @@ -4531,6 +4531,7 @@ int drm_dp_atomic_release_time_slots(struct
>> > drm_atomic_state *state,
>> > >>  	struct drm_dp_mst_atomic_payload *payload;
>> > >>  	struct drm_connector_state *old_conn_state, *new_conn_state;
>> > >>  	bool update_payload = true;
>> > >> +	int bit;
>> > >>
>> > >>  	old_conn_state = drm_atomic_get_old_connector_state(state, port-
>> > >connector);
>> > >>  	if (!old_conn_state->crtc)
>> > >> @@ -4572,7 +4573,8 @@ int drm_dp_atomic_release_time_slots(struct
>> > drm_atomic_state *state,
>> > >>  	if (!payload->delete) {
>> > >>  		payload->pbn = 0;
>> > >>  		payload->delete = true;
>> > >> -		topology_state->payload_mask &= ~BIT(payload->vcpi - 1);
>> > >> +		bit = payload->vcpi ? payload->vcpi - 1 : 0;
>> > >> +		topology_state->payload_mask &= ~BIT(bit);
>> > >
>> > > This looks wrong, clearing the bit for an unrelated payload.
>> > 
>> > Agreed.
>> > 
>> > The logs have, among other things,
>> > 
>> > <7> [515.138211] xe 0000:03:00.0: [drm:intel_dp_sink_set_dsc_decompression
>> > [xe]] Failed to enable sink decompression state
>> > 
>> > <7> [515.193484] xe 0000:03:00.0: [drm:drm_dp_add_payload_part1
>> > [drm_display_helper]] VCPI 0 for port ffff888126ce9000 not in topology, not
>> > creating a payload to remote
>> > 
>> > <7> [515.194671] xe 0000:03:00.0: [drm:drm_dp_add_payload_part2
>> > [drm_display_helper]] Part 1 of payload creation for DP-5 failed, skipping part 2
>> > 
>> > <7> [515.347331] xe 0000:03:00.0: [drm:drm_dp_remove_payload_part1
>> > [drm_display_helper]] Payload for VCPI 0 not in topology, not sending remove
>> > 
>> > So it's no wonder the port's not in topology and everything fails. We obviously
>> > need to skip payload_mask updates when the VCPI is 0, but that's just a
>> > symptom of other stuff going wrong first. Perhaps we could do with some
>> > earlier error handling too?
>> 
>> Yes I agree the question is how high will the error handling needs to be added.
>> A lot of weird things going on here.
>>
>> 1st one is how is it finding a payload which we do not create while we
>> call destroy function
>>
>> 2nd how is VCPI with id 0 possible from what I see VCPI are 1 at least
>> that's what I gather from drm_dp_mst_atomic_check_payload_alloc_limits.So what
>> are we missing when we create a payload?
>>
>> Imre, Jani any idea still new to how payload creation work so am I
>> missing something.
>
> A VCPI ID will be assigned to a payload during an atomic commit only if
> the corresponding MST connector is still connected. If the MST connector
> gets disconnected by the time of the atomic commit - as in the above
> case - no VCPI ID will assigned and the allocation table in the branch
> device cannot be updated either for the payload, as indicated by the
> above payload creation/removal failed messages.
>
> I think the fix should be not to clear the VCPI ID if it's 0. Valid VCPI
> IDs start from 1.

Agreed. As I said above, "We obviously need to skip payload_mask updates
when the VCPI is 0".

But there are *also* a bunch of other things going wrong before that,
but we plunge on. Should we do something about that?

BR,
Jani.




>
>> Regards
>> Suraj Kandpal 
>> 
>> > BR,
>> > Jani.
>> > 
>> > 
>> > >
>> > >>  	}
>> > >>
>> > >>  	return 0;
>> > >> --
>> > >> 2.34.1
>> > >>
>> > 
>> > --
>> > Jani Nikula, Intel

-- 
Jani Nikula, Intel
