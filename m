Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 506AD17CCE7
	for <lists+dri-devel@lfdr.de>; Sat,  7 Mar 2020 09:41:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DDF76E0DC;
	Sat,  7 Mar 2020 08:41:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E5676E0DC;
 Sat,  7 Mar 2020 08:41:44 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Mar 2020 00:41:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,525,1574150400"; d="scan'208";a="230335128"
Received: from pktinlab.iind.intel.com ([10.66.253.121])
 by orsmga007.jf.intel.com with ESMTP; 07 Mar 2020 00:41:41 -0800
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
To: emil.velikov@collabora.com, lyude@redhat.com, jani.nikula@linux.intel.com,
 daniel@ffwll.ch, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 0/5] Cleanup drm_dp_mst_topology_cbs hooks
Date: Sat,  7 Mar 2020 14:00:18 +0530
Message-Id: <20200307083023.76498-1-pankaj.laxminarayan.bharadiya@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
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
Cc: pankaj.laxminarayan.bharadiya@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_dp_mst_topology_mgr_cbs.register_connector callbacks are identical
amongst every driver and don't do anything other than calling
drm_connector_register().
drm_dp_mst_topology_mgr_cbs.destroy_connector callbacks are identical
amongst every driver and don't do anything other than cleaning up the
connector((drm_connector_unregister()/drm_connector_put())) except for
amdgpu_dm driver where some amdgpu_dm specific code in there.

This series aims to cleaup these drm_dp_mst_topology_mgr_cbs hooks. 

Pankaj Bharadiya (5):
  drm: Register connector instead of calling register_connector callback
  drm: Remove dp mst register connector callbacks
  drm/dp_mst: Remove register_connector callback
  drm: Add drm_dp_destroy_connector helper and use it
  drm: Remove drm dp mst destroy_connector callbacks

 .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |  6 ------
 drivers/gpu/drm/drm_dp_mst_topology.c         | 18 +++++++++++++++---
 drivers/gpu/drm/i915/display/intel_dp_mst.c   | 16 ----------------
 drivers/gpu/drm/nouveau/dispnv50/disp.c       | 19 -------------------
 drivers/gpu/drm/radeon/radeon_dp_mst.c        | 17 -----------------
 include/drm/drm_dp_mst_helper.h               |  1 -
 6 files changed, 15 insertions(+), 62 deletions(-)

-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
