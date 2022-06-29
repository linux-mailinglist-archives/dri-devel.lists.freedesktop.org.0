Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F4F560156
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 15:33:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 884C4112A7F;
	Wed, 29 Jun 2022 13:33:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04A66112885;
 Wed, 29 Jun 2022 13:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656509608; x=1688045608;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=xN97QMRyWKE3GLq5caI2Z/69zV73n52esPprkpGOnwY=;
 b=QVp2VoANmTZoxKmc3H/kvgA5EHCeD/UcnpQcBblNfH35AeQljyCKtAYi
 F/x+w6ZiXxnUGTwXgxdVcIav2PebQrnffphMI1WtIkZpuxhiXiEEjfrj5
 bphgxk8WUkKMIEx195cZPF4zkQsDSiDYZACzSr5ptkwvoLe0KGKt48a1m
 W19HeuOC1M9ACwC6kvLeqXNq9sjdhXoqh4Ad7T0GTKiHoruwyiPgaMZ1U
 NqOxIHx/JRDhbmwr7N8AxC26QRj8N/jdZudTpbMJpja7uDBgbubtvLr0w
 n1JVqgphul4kyUQgxgK1Ya65U+AowbVDSXUt5C4hdOWff1Q6j/KXmVCGZ g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10392"; a="279575377"
X-IronPort-AV: E=Sophos;i="5.92,231,1650956400"; d="scan'208";a="279575377"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2022 06:33:27 -0700
X-IronPort-AV: E=Sophos;i="5.92,231,1650956400"; d="scan'208";a="647395862"
Received: from clauter-mobl.amr.corp.intel.com (HELO localhost)
 ([10.252.48.175])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2022 06:33:21 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: Re: [RESEND RFC 00/18] drm/display/dp_mst: Drop Radeon MST support,
 make MST atomic-only
In-Reply-To: <20220607192933.1333228-1-lyude@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220607192933.1333228-1-lyude@redhat.com>
Date: Wed, 29 Jun 2022 16:33:18 +0300
Message-ID: <87o7ybppb5.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Fangzhi Zuo <Jerry.Zuo@amd.com>,
 Wayne Lin <Wayne.Lin@amd.com>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 07 Jun 2022, Lyude Paul <lyude@redhat.com> wrote:
> Ugh, thanks ./scripts/get_maintainers.pl for confusing and breaking
> git-send email <<. Sorry for the resend everyone.
>
> For quite a while we've been carrying around a lot of legacy modesetting
> code in the MST helpers that has been rather annoying to keep around,
> and very often gets in the way of trying to implement additional
> functionality in MST such as fallback link rate retraining, dynamic BPC
> management and DSC support, etc. because of the fact that we can't rely
> on atomic for everything.
>
> Luckily, we only actually have one user of the legacy MST code in the
> kernel - radeon. Originally I was thinking of trying to maintain this
> code and keep it around in some form, but I'm pretty unconvinced anyone
> is actually using this. My reasoning for that is because I've seen
> nearly no issues regarding MST on radeon for quite a while now - despite
> the fact my local testing seems to indicate it's quite broken. This
> isn't too surprising either, as MST support in radeon.ko is gated behind
> a module parameter that isn't enabled by default. This isn't to say I
> wouldn't be open to alternative suggestions, but I'd rather not be the
> one to have to spend time on that if at all possible! Plus, I already
> floated the idea of dropping this code by AMD folks a few times and
> didn't get much resistance.
>
> As well, this series has some basic refactoring that I did along the way
> and some bugs I had to fix in order to get my atomic-only MST code
> working. Most of this is pretty straight forward and simply renaming
> things to more closely match the DisplayPort specification, as I think
> this will also make maintaining this code a lot easier in the long run
> (I've gotten myself confused way too many times because of this).
>
> So far I've tested this on all three MST drivers: amdgpu, i915 and
> nouveau, along with making sure that removing the radeon MST code
> doesn't break anything else. The one thing I very much could use help
> with regarding testing though is making sure that this works with
> amdgpu's DSC support on MST.
>
> So, with this we should be using the atomic state as much as possible
> with MST modesetting, hooray!

I admit and regret I haven't had the time to go through this in detail
and thought. I've glanced over it on a few occasions, and I don't have
anything against it really.

Acked-by: Jani Nikula <jani.nikula@intel.com>

Before merging, please ensure you've sent the entire series Cc'd
intel-gfx, and got a green light from CI.

>
> Cc: Wayne Lin <Wayne.Lin@amd.com>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Cc: Fangzhi Zuo <Jerry.Zuo@amd.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Imre Deak <imre.deak@intel.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Sean Paul <sean@poorly.run>
>
> Lyude Paul (18):
>   drm/amdgpu/dc/mst: Rename dp_mst_stream_allocation(_table)
>   drm/amdgpu/dm/mst: Rename get_payload_table()
>   drm/display/dp_mst: Rename drm_dp_mst_vcpi_allocation
>   drm/display/dp_mst: Call them time slots, not VCPI slots
>   drm/display/dp_mst: Fix confusing docs for
>     drm_dp_atomic_release_time_slots()
>   drm/display/dp_mst: Add some missing kdocs for atomic MST structs
>   drm/display/dp_mst: Add helper for finding payloads in atomic MST
>     state
>   drm/display/dp_mst: Add nonblocking helpers for DP MST
>   drm/display/dp_mst: Don't open code modeset checks for releasing time
>     slots
>   drm/display/dp_mst: Fix modeset tracking in
>     drm_dp_atomic_release_vcpi_slots()
>   drm/nouveau/kms: Cache DP encoders in nouveau_connector
>   drm/nouveau/kms: Pull mst state in for all modesets
>   drm/display/dp_mst: Add helpers for serializing SST <-> MST
>     transitions
>   drm/display/dp_mst: Drop all ports from topology on CSNs before
>     queueing link address work
>   drm/display/dp_mst: Skip releasing payloads if last connected port
>     isn't connected
>   drm/display/dp_mst: Maintain time slot allocations when deleting
>     payloads
>   drm/radeon: Drop legacy MST support
>   drm/display/dp_mst: Move all payload info into the atomic state
>
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   72 +-
>  .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c |  111 +-
>  .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |  126 +-
>  drivers/gpu/drm/amd/display/dc/core/dc_link.c |   10 +-
>  drivers/gpu/drm/amd/display/dc/dm_helpers.h   |    4 +-
>  .../amd/display/include/link_service_types.h  |   18 +-
>  drivers/gpu/drm/display/drm_dp_mst_topology.c | 1160 ++++++++---------
>  drivers/gpu/drm/i915/display/intel_display.c  |   11 +
>  drivers/gpu/drm/i915/display/intel_dp.c       |    9 +
>  drivers/gpu/drm/i915/display/intel_dp_mst.c   |   91 +-
>  drivers/gpu/drm/i915/display/intel_hdcp.c     |   24 +-
>  drivers/gpu/drm/nouveau/dispnv50/disp.c       |  202 ++-
>  drivers/gpu/drm/nouveau/dispnv50/disp.h       |    2 +
>  drivers/gpu/drm/nouveau/nouveau_connector.c   |   18 +-
>  drivers/gpu/drm/nouveau/nouveau_connector.h   |    3 +
>  drivers/gpu/drm/radeon/Makefile               |    2 +-
>  drivers/gpu/drm/radeon/atombios_crtc.c        |   11 +-
>  drivers/gpu/drm/radeon/atombios_encoders.c    |   59 -
>  drivers/gpu/drm/radeon/radeon_atombios.c      |    2 -
>  drivers/gpu/drm/radeon/radeon_connectors.c    |   61 +-
>  drivers/gpu/drm/radeon/radeon_device.c        |    1 -
>  drivers/gpu/drm/radeon/radeon_dp_mst.c        |  778 -----------
>  drivers/gpu/drm/radeon/radeon_drv.c           |    4 -
>  drivers/gpu/drm/radeon/radeon_encoders.c      |   14 +-
>  drivers/gpu/drm/radeon/radeon_irq_kms.c       |   10 +-
>  drivers/gpu/drm/radeon/radeon_mode.h          |   40 -
>  include/drm/display/drm_dp_mst_helper.h       |  230 ++--
>  27 files changed, 991 insertions(+), 2082 deletions(-)
>  delete mode 100644 drivers/gpu/drm/radeon/radeon_dp_mst.c

--=20
Jani Nikula, Intel Open Source Graphics Center
