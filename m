Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C092F0DFA
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 09:26:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A40A189CBE;
	Mon, 11 Jan 2021 08:26:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3591289CBE;
 Mon, 11 Jan 2021 08:26:13 +0000 (UTC)
IronPort-SDR: 2O8nBq4ZRnjxDWj5J8eQtl7YtJwzs5IVkH50p8qhhR9UWt5yS7akkqqPqtQJc+P+9Cbth9+nUd
 kAEbWYq0/9bw==
X-IronPort-AV: E=McAfee;i="6000,8403,9860"; a="177046055"
X-IronPort-AV: E=Sophos;i="5.79,338,1602572400"; d="scan'208";a="177046055"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2021 00:26:12 -0800
IronPort-SDR: BOceyqvVqc45LTx+9Gog6vh12mzLwcxx7e4l5zJtKH6QpFSq5cWPPEPIDwEb/dI/8paPx5ZxSk
 cJhbAYPS98Ig==
X-IronPort-AV: E=Sophos;i="5.79,338,1602572400"; d="scan'208";a="464093941"
Received: from unknown (HELO genxfsim-desktop.iind.intel.com) ([10.223.74.179])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2021 00:26:09 -0800
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v9 00/19] HDCP 2.2 and HDCP 1.4 Gen12 DP MST support
Date: Mon, 11 Jan 2021 13:41:01 +0530
Message-Id: <20210111081120.28417-1-anshuman.gupta@intel.com>
X-Mailer: git-send-email 2.26.2
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
Cc: jani.nikula@intel.com, uma.shankar@intel.com, seanpaul@chromium.org,
 Anshuman Gupta <anshuman.gupta@intel.com>, juston.li@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This v9 version has fixed crome-os NULL pointer dereference
by just reordering connector status condition.
 
It has been tested manually with below IGT series on TGL and ICL.
https://patchwork.freedesktop.org/series/82987/

[PATCH v9 12/19] misc/mei/hdcp: Fix AUTH_STREAM_REQ cmd buffer len
has an Ack from Tomas to merge it via drm-intel.

[PATCH v9 13/19] drm/hdcp: Max MST content streams
has an Ack from drm-misc maintainer to merge it via drm-intel.

Test-with: 20201126050320.2434-2-karthik.b.s@intel.com

Anshuman Gupta (19):
  drm/i915/hdcp: Update CP property in update_pipe
  drm/i915/hdcp: Get conn while content_type changed
  drm/i915/hotplug: Handle CP_IRQ for DP-MST
  drm/i915/hdcp: No HDCP when encoder is't initialized
  drm/i915/hdcp: DP MST transcoder for link and stream
  drm/i915/hdcp: Move HDCP enc status timeout to header
  drm/i915/hdcp: HDCP stream encryption support
  drm/i915/hdcp: Configure HDCP1.4 MST steram encryption status
  drm/i915/hdcp: Enable Gen12 HDCP 1.4 DP MST support
  drm/i915/hdcp: Pass dig_port to intel_hdcp_init
  drm/i915/hdcp: Encapsulate hdcp_port_data to dig_port
  misc/mei/hdcp: Fix AUTH_STREAM_REQ cmd buffer len
  drm/hdcp: Max MST content streams
  drm/i915/hdcp: MST streams support in hdcp port_data
  drm/i915/hdcp: Pass connector to check_2_2_link
  drm/i915/hdcp: Add HDCP 2.2 stream register
  drm/i915/hdcp: Support for HDCP 2.2 MST shim callbacks
  drm/i915/hdcp: Configure HDCP2.2 MST steram encryption status
  drm/i915/hdcp: Enable HDCP 2.2 MST support

 drivers/gpu/drm/i915/display/intel_ddi.c      |  14 +-
 drivers/gpu/drm/i915/display/intel_ddi.h      |   6 +-
 .../drm/i915/display/intel_display_types.h    |  20 +-
 drivers/gpu/drm/i915/display/intel_dp.c       |  14 +-
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c  | 186 +++++++++--
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |   9 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c     | 303 ++++++++++++++----
 drivers/gpu/drm/i915/display/intel_hdcp.h     |   8 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c     |  19 +-
 drivers/gpu/drm/i915/i915_reg.h               |  40 +++
 drivers/misc/mei/hdcp/mei_hdcp.c              |   3 +-
 include/drm/drm_hdcp.h                        |   8 +-
 12 files changed, 510 insertions(+), 120 deletions(-)

-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
