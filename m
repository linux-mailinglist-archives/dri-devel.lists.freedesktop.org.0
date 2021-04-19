Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34112364DE8
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 00:55:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42B736E446;
	Mon, 19 Apr 2021 22:55:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 460306E444
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 22:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618872935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ApSxY6cQxPwMOv8yFBqAhygLAe9qmNzrZuA363mprUQ=;
 b=acQbrJ4IiXSH9VzSI5ifi/ksETLLDxBrpohFCJn/OrHrBEcoPnQpOm5O24C7ENlSVNDsud
 Rryk0rnRUSDfECFjf+wDbz/jFnPpyVAWaPx8Anow1wheMzZZZKbvGw+18ZwBCNFzcvOT4H
 MAVwdjvYIA4IZaftNNLLc2oxf6NitU0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-js6UxZP5M42NIbLfA5gs6A-1; Mon, 19 Apr 2021 18:55:31 -0400
X-MC-Unique: js6UxZP5M42NIbLfA5gs6A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB4618030C9;
 Mon, 19 Apr 2021 22:55:29 +0000 (UTC)
Received: from Ruby.lyude.net (ovpn-119-153.rdu2.redhat.com [10.10.119.153])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AC4135C1D0;
 Mon, 19 Apr 2021 22:55:28 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v3 00/20] drm: Use new DRM printk funcs (like drm_dbg_*()) in
 DP helpers
Date: Mon, 19 Apr 2021 18:55:02 -0400
Message-Id: <20210419225523.184856-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since it's been asked quite a few times on some of the various DP
related patch series I've submitted to use the new DRM printk helpers,
and it technically wasn't really trivial to do this before due to the
lack of a consistent way to find a drm_device for an AUX channel, this
patch series aims to address this. In this series we:

* (NEW!) Move i2c adapter setup into drm_dp_aux_init() and add
  drm_dp_aux_fini()
* Clean-up potentially erroneous usages of drm_dp_aux_init() and
  drm_dp_aux_register() so that actual AUX registration doesn't happen
  until we have an associated DRM device
* Clean-up any obvious errors in drivers we find along the way
* Add a backpointer to the respective drm_device for an AUX channel in
  drm_dp_aux.drm_dev, and hook it up in every driver with an AUX channel
  across the tree
* Add a new ratelimited print helper we'll need for converting the DP
  helpers over to using the new DRM printk helpers
* Fix any inconsistencies with logging in drm_dp_helper.c so we always
  have the aux channel name printed
* Prepare the various DP helpers so they can find the correct drm_device
  to use for logging
* And finally, convert all of the DP helpers over to using drm_dbg_*()
  and drm_err().

Lyude Paul (20):
  drm/amdgpu: Add error handling to amdgpu_dm_initialize_dp_connector()
  drm/dp: Add __no_check to drm_dp_aux_register()
  drm/dp: Move i2c init to drm_dp_aux_init, add __must_check and fini
  drm/bridge/cdns-mhdp8546: Register DP aux channel with userspace
  drm/nouveau/kms/nv50-: Move AUX adapter reg to connector late
    register/early unregister
  drm/dp: Add backpointer to drm_device in drm_dp_aux
  drm/dp: Clarify DP AUX registration time
  drm/dp: Pass drm_dp_aux to drm_dp_link_train_clock_recovery_delay()
  drm/dp: Pass drm_dp_aux to drm_dp*_link_train_channel_eq_delay()
  drm/dp: Always print aux channel name in logs
  drm/dp_dual_mode: Pass drm_device to drm_dp_dual_mode_detect()
  drm/dp_dual_mode: Pass drm_device to
    drm_dp_dual_mode_set_tmds_output()
  drm/dp_dual_mode: Pass drm_device to drm_dp_dual_mode_max_tmds_clock()
  drm/dp_dual_mode: Pass drm_device to
    drm_dp_dual_mode_get_tmds_output()
  drm/dp_dual_mode: Pass drm_device to drm_lspcon_(get|set)_mode()
  drm/dp_mst: Pass drm_dp_mst_topology_mgr to drm_dp_get_vc_payload_bw()
  drm/print: Handle potentially NULL drm_devices in drm_dbg_*
  drm/dp: Convert drm_dp_helper.c to using drm_err/drm_dbg_*()
  drm/dp_dual_mode: Convert drm_dp_dual_mode_helper.c to using
    drm_err/drm_dbg_kms()
  drm/dp_mst: Convert drm_dp_mst_topology.c to drm_err()/drm_dbg*()

 .../gpu/drm/amd/amdgpu/amdgpu_connectors.c    |   7 +-
 drivers/gpu/drm/amd/amdgpu/atombios_dp.c      |  17 +-
 drivers/gpu/drm/amd/amdgpu/atombios_dp.h      |   2 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  29 +-
 .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |  49 ++-
 .../display/amdgpu_dm/amdgpu_dm_mst_types.h   |   6 +-
 .../drm/bridge/analogix/analogix-anx6345.c    |   3 +
 .../drm/bridge/analogix/analogix-anx78xx.c    |   3 +
 .../drm/bridge/analogix/analogix_dp_core.c    |   2 +
 .../drm/bridge/cadence/cdns-mhdp8546-core.c   |  26 +-
 drivers/gpu/drm/bridge/tc358767.c             |   6 +-
 drivers/gpu/drm/bridge/ti-sn65dsi86.c         |  17 +-
 drivers/gpu/drm/drm_dp_aux_dev.c              |   6 +
 drivers/gpu/drm/drm_dp_dual_mode_helper.c     |  68 ++--
 drivers/gpu/drm/drm_dp_helper.c               | 260 +++++++-----
 drivers/gpu/drm/drm_dp_mst_topology.c         | 376 +++++++++---------
 drivers/gpu/drm/i915/display/intel_dp_aux.c   |  11 +-
 drivers/gpu/drm/i915/display/intel_dp_aux.h   |   2 +-
 .../drm/i915/display/intel_dp_link_training.c |   6 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |   3 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c     |   7 +-
 drivers/gpu/drm/i915/display/intel_lspcon.c   |  17 +-
 drivers/gpu/drm/msm/dp/dp_aux.c               |   1 +
 drivers/gpu/drm/msm/dp/dp_ctrl.c              |   6 +-
 drivers/gpu/drm/msm/edp/edp.h                 |   3 +-
 drivers/gpu/drm/msm/edp/edp_aux.c             |   6 +-
 drivers/gpu/drm/msm/edp/edp_ctrl.c            |   8 +-
 drivers/gpu/drm/nouveau/nouveau_connector.c   |  27 +-
 drivers/gpu/drm/radeon/atombios_dp.c          |   5 +-
 drivers/gpu/drm/radeon/radeon_connectors.c    |   1 +
 drivers/gpu/drm/tegra/dpaux.c                 |  15 +-
 drivers/gpu/drm/xlnx/zynqmp_dp.c              |   6 +-
 include/drm/drm_dp_dual_mode_helper.h         |  14 +-
 include/drm/drm_dp_helper.h                   |  24 +-
 include/drm/drm_dp_mst_helper.h               |   3 +-
 include/drm/drm_print.h                       |  20 +-
 36 files changed, 631 insertions(+), 431 deletions(-)

-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
