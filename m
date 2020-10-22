Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF18295BE8
	for <lists+dri-devel@lfdr.de>; Thu, 22 Oct 2020 11:36:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64D2E6F555;
	Thu, 22 Oct 2020 09:36:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFA076F555;
 Thu, 22 Oct 2020 09:36:03 +0000 (UTC)
IronPort-SDR: hFSdVWUxkCmOfc9K6wZdDKKWqKP85ocI0nmSr8C25ueSVlDRd2kAkTq+Lt1Sr/o6iSgTujR6QD
 mjzUklRznLSQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9781"; a="164905499"
X-IronPort-AV: E=Sophos;i="5.77,404,1596524400"; d="scan'208";a="164905499"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2020 02:36:03 -0700
IronPort-SDR: sF84PalZcvAKXlh77uSTeZzNiFL0uSOndESg+ieqYb4JV4VXqdRkT07RNUVQs2annNcvNc1zvv
 BqjIw7ur4f8w==
X-IronPort-AV: E=Sophos;i="5.77,404,1596524400"; d="scan'208";a="359807221"
Received: from genxfsim-desktop.iind.intel.com ([10.223.74.178])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2020 02:36:00 -0700
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 00/16] HDCP 2.2 DP MST Support 
Date: Thu, 22 Oct 2020 14:25:36 +0530
Message-Id: <20201022085552.18353-1-anshuman.gupta@intel.com>
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

v3 version of this series has fixed the CI reported failures
and added below  patch in this series.
[PATCH v3 02/16] drm/i915/hdcp: Get conn while content_type changed

It has also added the Ack of Tomas to merge the mei_hdcp.c patch
via drm-intel.

This series has been tested with IGT changes to do
a single commit to enable HDCP on all DP-MST connector.

HDCP 2.2 support over DP MST actually starts from below patch
[PATCH v3 08/16] drm/i915/hdcp: Pass dig_port to intel_hdcp_init.

Gen12 HDCP 1.4 support of this series has also floated separately 
with below series.
(https://patchwork.freedesktop.org/series/82605/)

Anshuman Gupta (16):
  drm/i915/hdcp: Update CP property in update_pipe
  drm/i915/hdcp: Get conn while content_type changed
  drm/i915/hotplug: Handle CP_IRQ for DP-MST
  drm/i915/hdcp: DP MST transcoder for link and stream
  drm/i915/hdcp: Move HDCP enc status timeout to header
  drm/i915/hdcp: HDCP stream encryption support
  drm/i915/hdcp: Enable Gen12 HDCP 1.4 DP MST support
  drm/i915/hdcp: Pass dig_port to intel_hdcp_init
  drm/i915/hdcp: Encapsulate hdcp_port_data to dig_port
  misc/mei/hdcp: Fix AUTH_STREAM_REQ cmd buffer len
  drm/hdcp: Max MST content streams
  drm/i915/hdcp: MST streams support in hdcp port_data
  drm/i915/hdcp: Pass connector to check_2_2_link
  drm/i915/hdcp: Add HDCP 2.2 stream register
  drm/i915/hdcp: Support for HDCP 2.2 MST shim callbacks
  drm/i915/hdcp: Enable HDCP 2.2 MST support

 drivers/gpu/drm/i915/display/intel_ddi.c      |  14 +-
 drivers/gpu/drm/i915/display/intel_ddi.h      |   6 +-
 .../drm/i915/display/intel_display_types.h    |  20 +-
 drivers/gpu/drm/i915/display/intel_dp.c       |  14 +-
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c  | 168 +++++++++--
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |  12 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c     | 282 ++++++++++++++----
 drivers/gpu/drm/i915/display/intel_hdcp.h     |   8 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c     |  19 +-
 drivers/gpu/drm/i915/i915_reg.h               |  31 ++
 drivers/misc/mei/hdcp/mei_hdcp.c              |   3 +-
 include/drm/drm_hdcp.h                        |   8 +-
 12 files changed, 465 insertions(+), 120 deletions(-)

-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
