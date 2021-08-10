Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFD63E86C1
	for <lists+dri-devel@lfdr.de>; Wed, 11 Aug 2021 01:52:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26A586E064;
	Tue, 10 Aug 2021 23:52:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E8C16E063;
 Tue, 10 Aug 2021 23:52:23 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10072"; a="215006850"
X-IronPort-AV: E=Sophos;i="5.84,311,1620716400"; d="scan'208";a="215006850"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2021 16:52:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,311,1620716400"; d="scan'208";a="460567777"
Received: from jhli-desk1.jf.intel.com ([10.54.74.156])
 by orsmga007.jf.intel.com with ESMTP; 10 Aug 2021 16:52:20 -0700
From: Juston Li <juston.li@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: seanpaul@chromium.org, anshuman.gupta@intel.com, ramalingam.c@intel.com,
 rodrigo.vivi@intel.com, Juston Li <juston.li@intel.com>
Subject: [Intel-gfx] [PATCH v3 0/3] drm/i915/hdcp: HDCP2.2 MST dock fixes
Date: Tue, 10 Aug 2021 16:52:09 -0700
Message-Id: <20210810235212.138721-1-juston.li@intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes to get HDCP2.2 over MST working on MST docking stations with
certain behaviors that cause the current flow to fail.
Tested with Dell WD-19 and Lenovo ThinkPad USB Type-C Dock Gen 2.

These fixes should make the flow more robust to handle behaviors that as
far as I can tell are unclear in the HDCP spec:

RxInfo contains repeater topology information needed for MST. The
behavior on these docks is that this can only be read during 
RepeaterAuth_Send_ReceiverID_List when the RxStatus READY bit is set
otherwise the dock will return NACK. It seems these docks treat
reading this range at any other time as invalid when the READY bit
isn't set possibly because it could be stale. The HDCP spec also states
the READY bit is cleared after RxInfo is read.

These fixes address this behavior by only reading RxInfo once during the 
AKE flow and reusing that data.

Changes since v2:
 - Remove no longer used variables in _intel_hdcp2_enable()

Changes since v1:
 - Fix subject line for 3/3

Juston Li (3):
  drm/i915/hdcp: update cp_irq_count_cached in intel_dp_hdcp2_read_msg()
  drm/i915/hdcp: read RxInfo once when reading
    RepeaterAuth_Send_ReceiverID_List
  drm/i915/hdcp: reuse rx_info for mst stream type1 capability check

 .../drm/i915/display/intel_display_types.h    |  2 +
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c  | 77 +++++--------------
 drivers/gpu/drm/i915/display/intel_hdcp.c     | 49 +++++-------
 include/drm/drm_dp_helper.h                   |  2 +-
 4 files changed, 43 insertions(+), 87 deletions(-)

-- 
2.31.1

