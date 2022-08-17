Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6AA5976A4
	for <lists+dri-devel@lfdr.de>; Wed, 17 Aug 2022 21:40:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 581F2A523D;
	Wed, 17 Aug 2022 19:39:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5702A51EF
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 19:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660765154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=AQdElMOBqNwCUNSzM6jowFAj5/LKM6OhpXSrVpWye1g=;
 b=CYZ+mm0fTv6CrztxUW+p8QoVxAL7wD2TGac4zalTv5nTMfWQ1vQR7t+PsqyxrF8BQ80yA/
 zxLqGJnemZnLOaahOpv9nSId1F442UKL9AgLgJVXXLIKnkEYRWMyAtDAHxY4r4OkHymKZ5
 u2eHuBwAWqvoh18xBvgZpinXqnAxupg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-93-HHKcV3N_NNWdZv5P6t3Ysw-1; Wed, 17 Aug 2022 15:39:08 -0400
X-MC-Unique: HHKcV3N_NNWdZv5P6t3Ysw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8F695803520;
 Wed, 17 Aug 2022 19:39:07 +0000 (UTC)
Received: from emerald.redhat.com (unknown [10.22.18.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AA0F3492C3B;
 Wed, 17 Aug 2022 19:39:06 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [RFC v4 00/17] drm/display/dp_mst: Drop Radeon MST support,
 make MST atomic-only
Date: Wed, 17 Aug 2022 15:38:29 -0400
Message-Id: <20220817193847.557945-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, Wayne Lin <Wayne.Lin@amd.com>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For quite a while we've been carrying around a lot of legacy modesetting
code in the MST helpers that has been rather annoying to keep around,
and very often gets in the way of trying to implement additional
functionality in MST such as fallback link rate retraining, dynamic BPC
management and DSC support, etc. because of the fact that we can't rely
on atomic for everything.

Luckily, we only actually have one user of the legacy MST code in the
kernel - radeon. Originally I was thinking of trying to maintain this
code and keep it around in some form, but I'm pretty unconvinced anyone
is actually using this. My reasoning for that is because I've seen
nearly no issues regarding MST on radeon for quite a while now - despite
the fact my local testing seems to indicate it's quite broken. This
isn't too surprising either, as MST support in radeon.ko is gated behind
a module parameter that isn't enabled by default. This isn't to say I
wouldn't be open to alternative suggestions, but I'd rather not be the
one to have to spend time on that if at all possible! Plus, I already
floated the idea of dropping this code by AMD folks a few times and
didn't get much resistance.

As well, this series has some basic refactoring that I did along the way
and some bugs I had to fix in order to get my atomic-only MST code
working. Most of this is pretty straight forward and simply renaming
things to more closely match the DisplayPort specification, as I think
this will also make maintaining this code a lot easier in the long run
(I've gotten myself confused way too many times because of this).

So far I've tested this on all three MST drivers: amdgpu, i915 and
nouveau, along with making sure that removing the radeon MST code
doesn't break anything else. The one thing I very much could use help
with regarding testing though is making sure that this works with
amdgpu's DSC support on MST.

So, with this we should be using the atomic state as much as possible
with MST modesetting, hooray!

V4:
* Get rid of fix that Wayne pointed out isn't needed

Cc: Wayne Lin <Wayne.Lin@amd.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Fangzhi Zuo <Jerry.Zuo@amd.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Imre Deak <imre.deak@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Sean Paul <sean@poorly.run>

Lyude Paul (17):
  drm/amdgpu/dc/mst: Rename dp_mst_stream_allocation(_table)
  drm/amdgpu/dm/mst: Rename get_payload_table()
  drm/display/dp_mst: Rename drm_dp_mst_vcpi_allocation
  drm/display/dp_mst: Call them time slots, not VCPI slots
  drm/display/dp_mst: Fix confusing docs for
    drm_dp_atomic_release_time_slots()
  drm/display/dp_mst: Add some missing kdocs for atomic MST structs
  drm/display/dp_mst: Add helper for finding payloads in atomic MST
    state
  drm/display/dp_mst: Add nonblocking helpers for DP MST
  drm/display/dp_mst: Don't open code modeset checks for releasing time
    slots
  drm/display/dp_mst: Fix modeset tracking in
    drm_dp_atomic_release_vcpi_slots()
  drm/nouveau/kms: Cache DP encoders in nouveau_connector
  drm/nouveau/kms: Pull mst state in for all modesets
  drm/display/dp_mst: Add helpers for serializing SST <-> MST
    transitions
  drm/display/dp_mst: Drop all ports from topology on CSNs before
    queueing link address work
  drm/display/dp_mst: Maintain time slot allocations when deleting
    payloads
  drm/radeon: Drop legacy MST support
  drm/display/dp_mst: Move all payload info into the atomic state

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   68 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c |  108 +-
 .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |  125 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link.c |   10 +-
 drivers/gpu/drm/amd/display/dc/dm_helpers.h   |    4 +-
 .../amd/display/include/link_service_types.h  |   14 +-
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 1137 ++++++++---------
 drivers/gpu/drm/i915/display/intel_display.c  |    6 +
 drivers/gpu/drm/i915/display/intel_dp.c       |    9 +
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |   91 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c     |   24 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c       |  197 ++-
 drivers/gpu/drm/nouveau/dispnv50/disp.h       |    2 +
 drivers/gpu/drm/nouveau/nouveau_connector.c   |   18 +-
 drivers/gpu/drm/nouveau/nouveau_connector.h   |    3 +
 drivers/gpu/drm/radeon/Makefile               |    2 +-
 drivers/gpu/drm/radeon/atombios_crtc.c        |   11 +-
 drivers/gpu/drm/radeon/atombios_encoders.c    |   59 -
 drivers/gpu/drm/radeon/radeon_atombios.c      |    2 -
 drivers/gpu/drm/radeon/radeon_connectors.c    |   61 +-
 drivers/gpu/drm/radeon/radeon_device.c        |    1 -
 drivers/gpu/drm/radeon/radeon_dp_mst.c        |  778 -----------
 drivers/gpu/drm/radeon/radeon_drv.c           |    4 -
 drivers/gpu/drm/radeon/radeon_encoders.c      |   14 +-
 drivers/gpu/drm/radeon/radeon_irq_kms.c       |   10 +-
 drivers/gpu/drm/radeon/radeon_mode.h          |   40 -
 include/drm/display/drm_dp_mst_helper.h       |  234 ++--
 27 files changed, 955 insertions(+), 2077 deletions(-)
 delete mode 100644 drivers/gpu/drm/radeon/radeon_dp_mst.c

-- 
2.37.1

