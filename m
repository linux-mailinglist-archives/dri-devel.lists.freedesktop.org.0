Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +F4UF/CnnmmrWgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 08:42:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D7A193A95
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 08:42:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FAEB10E6CB;
	Wed, 25 Feb 2026 07:42:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WPU9A72j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 854B210E6C9;
 Wed, 25 Feb 2026 07:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772005354; x=1803541354;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zmyMepXaGOSTgkVPPvUlPLqYDw7JCNE5XUH1XiGR570=;
 b=WPU9A72j/qTNBw587/aJDW7gMfl+Y4xyHr+epCr6QzhCeOGBdTRcdfoJ
 GfR/Nr61+C12ZZ3vGTseh0oRgwBXwET+D+HliAHZZvteu2eJ5yDPiIhaM
 8tp19u0LUUHCMTOotcBFiel5MgyiOQ8VQokp99aURudDe7xgvYBaZQ0T7
 GwiINoktN0LF/3BRMSzmuvhVtz+e19BhwqjL2CmXfKT9B1yGgsNQunvtK
 iW9Rt8fDClL1AxY8bkOJO/FWVgctZEp+w6px9d8Xi6yV8qUgaWuEpHiuz
 293Sj4/IvHh5US1XnPdATa6qVbP9lBcVw9i4nxAtgB34R6VShKv3zyHyG w==;
X-CSE-ConnectionGUID: edjmAbnKSuqxnkA2PBN5KQ==
X-CSE-MsgGUID: YMBsk1jqTtWd83uCqPzF3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="90615837"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="90615837"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 23:42:34 -0800
X-CSE-ConnectionGUID: sX7DrIFVQ4eMVCdI7QGaDA==
X-CSE-MsgGUID: n/Q1MB46TseC47DLO4Lkdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="216295499"
Received: from vpanait-mobl.ger.corp.intel.com (HELO jhogande-mobl3.intel.com)
 ([10.245.244.5])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 23:42:33 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/dp: Add definition for Panel Replay full-line
 granularity
Date: Wed, 25 Feb 2026 09:42:20 +0200
Message-ID: <20260225074221.1744330-1-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_NEQ_ENVFROM(0.00)[jouni.hogander@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: 32D7A193A95
X-Rspamd-Action: no action

DP specification is saying value 0xff 0xff in PANEL REPLAY SELECTIVE UPDATE
X GRANULARITY CAPABILITY registers (0xb2 and 0xb3) means full-line
granularity. Add definition for this.

Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 include/drm/display/drm_dp.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
index e4eebabab975..8b15d3eeb716 100644
--- a/include/drm/display/drm_dp.h
+++ b/include/drm/display/drm_dp.h
@@ -571,6 +571,8 @@
 # define DP_PANEL_REPLAY_LINK_OFF_SUPPORTED_IN_PR_AFTER_ADAPTIVE_SYNC_SDP	(1 << 7)
 
 #define DP_PANEL_REPLAY_CAP_X_GRANULARITY		0xb2
+# define DP_PANEL_REPLAY_FULL_LINE_GRANULARITY		0xffff
+
 #define DP_PANEL_REPLAY_CAP_Y_GRANULARITY		0xb4
 
 /* Link Configuration */
-- 
2.43.0

