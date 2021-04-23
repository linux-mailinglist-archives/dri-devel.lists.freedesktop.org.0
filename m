Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABEC73699F3
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 20:43:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DC656E174;
	Fri, 23 Apr 2021 18:43:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 555896E17A
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 18:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619203411;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+swtazcwNbLfgM04sybYAGJfVx7ZPYjQP+dUg9WubdU=;
 b=ccXNappB1NHCHq/1z4xtKiOP2KPvm9nArgADGvWqCeXigjmGwjaxC7BcwdvGJMIXYzvt9/
 P/rrXzCQuzv/LhCgB8/yrAF+dnOC33163Jf5Dtbcb0kYh8MMOba8PQqsUHoCJluuVWJyNx
 L2wNpKkaSSxQBCJSyz2/Wn3h/weWpJA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-25v7JVbOPMCXCpj692otlw-1; Fri, 23 Apr 2021 14:43:27 -0400
X-MC-Unique: 25v7JVbOPMCXCpj692otlw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D6D191B18BC0;
 Fri, 23 Apr 2021 18:43:25 +0000 (UTC)
Received: from Ruby.lyude.net (ovpn-114-74.rdu2.redhat.com [10.10.114.74])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6C6856090F;
 Fri, 23 Apr 2021 18:43:23 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v4 00/17] drm: Use new DRM printk funcs (like drm_dbg_*()) in
 DP helpers
Date: Fri, 23 Apr 2021 14:42:52 -0400
Message-Id: <20210423184309.207645-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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

* (NEW! starting from V3) Make sure drm_dbg_*() and friends can handle
  NULL drm device pointers
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

Major changes in v4:
* Don't move i2c aux init into drm_dp_aux_init(), since I think I've
  found a much better solution to tegra's issues:
  https://patchwork.freedesktop.org/series/89420/

Lyude Paul (17):
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

 drivers/gpu/drm/amd/amdgpu/atombios_dp.c      |   6 +-
 .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |   1 +
 .../drm/bridge/analogix/analogix-anx6345.c    |   1 +
 .../drm/bridge/analogix/analogix-anx78xx.c    |   1 +
 .../drm/bridge/analogix/analogix_dp_core.c    |   1 +
 .../drm/bridge/cadence/cdns-mhdp8546-core.c   |  12 +-
 drivers/gpu/drm/bridge/tc358767.c             |   1 +
 drivers/gpu/drm/bridge/ti-sn65dsi86.c         |   1 +
 drivers/gpu/drm/drm_dp_aux_dev.c              |   6 +
 drivers/gpu/drm/drm_dp_dual_mode_helper.c     |  68 ++--
 drivers/gpu/drm/drm_dp_helper.c               | 184 +++++----
 drivers/gpu/drm/drm_dp_mst_topology.c         | 376 +++++++++---------
 drivers/gpu/drm/i915/display/intel_dp_aux.c   |   1 +
 .../drm/i915/display/intel_dp_link_training.c |   6 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |   3 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c     |   7 +-
 drivers/gpu/drm/i915/display/intel_lspcon.c   |  17 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.c              |   6 +-
 drivers/gpu/drm/msm/edp/edp.h                 |   3 +-
 drivers/gpu/drm/msm/edp/edp_aux.c             |   5 +-
 drivers/gpu/drm/msm/edp/edp_ctrl.c            |   8 +-
 drivers/gpu/drm/nouveau/nouveau_connector.c   |  26 +-
 drivers/gpu/drm/radeon/atombios_dp.c          |   5 +-
 drivers/gpu/drm/tegra/dpaux.c                 |   1 +
 drivers/gpu/drm/xlnx/zynqmp_dp.c              |   5 +-
 include/drm/drm_dp_dual_mode_helper.h         |  14 +-
 include/drm/drm_dp_helper.h                   |  19 +-
 include/drm/drm_dp_mst_helper.h               |   3 +-
 include/drm/drm_print.h                       |  20 +-
 29 files changed, 453 insertions(+), 354 deletions(-)

-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
