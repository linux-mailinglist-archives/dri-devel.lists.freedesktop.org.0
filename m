Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80FAA674D4C
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 07:21:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3173510EA54;
	Fri, 20 Jan 2023 06:21:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D12A10EA03;
 Fri, 20 Jan 2023 06:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674195705; x=1705731705;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AASS0FwnVNe/OPJgQFOtVGbVsH7cgW31yZ998Bbq/EI=;
 b=MtWYklPRfcTTDGfROoN7euWz7Al5A2kb3Zy5USxOmOlfCoCQe9yRPtrI
 Hy0SG/dw4q2Y6LDlK6QSamZFZTlgW35/Q5IfUJ6UdXTQt5PplhyHq2sA2
 eIctcXltzbSudRDCWqrIwoc0V1XkgPZVq+zJPmYfXI3IPvAX+xS/D47hi
 T5DlGCOEVZdr8DSnFrIik1lZHW5nTG3jhddzig9krSQeEkY4DsPw3DhSJ
 KsuDOB1DDktjOgOGo+aHNxZ1LWxEg5ofDym9zJSiyN0Bc8Qzqhttq3c8D
 J/fiPjivcx9675VTkmkzNVc2KBLEyGpE/b8854XXMrt44f7GmEMrvyY1t g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="390030165"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; d="scan'208";a="390030165"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 22:21:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="729021177"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; d="scan'208";a="729021177"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmsmga004.fm.intel.com with ESMTP; 19 Jan 2023 22:21:32 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 jani.nikula@intel.com
Subject: [RESEND PATCHv2 1/2] drm: Add SDP Error Detection Configuration
 Register
Date: Fri, 20 Jan 2023 11:45:59 +0530
Message-Id: <20230120061600.1451088-2-arun.r.murthy@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230120061600.1451088-1-arun.r.murthy@intel.com>
References: <20230120061600.1451088-1-arun.r.murthy@intel.com>
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
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DP2.0 E11 defines a new register to facilitate SDP error detection by a
128B/132B capable DPRX device.

v2: Update the macro name to reflect the DP spec(Harry)

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
Reviewed-by: Harry Wentland <harry.wentland@amd.com>
---
 include/drm/display/drm_dp.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
index 632376c291db..358db4a9f167 100644
--- a/include/drm/display/drm_dp.h
+++ b/include/drm/display/drm_dp.h
@@ -692,6 +692,9 @@
 # define DP_FEC_LANE_2_SELECT		    (2 << 4)
 # define DP_FEC_LANE_3_SELECT		    (3 << 4)
 
+#define DP_SDP_ERROR_DETECTION_CONFIGURATION	0x121	/* DP 2.0 E11 */
+#define DP_SDP_CRC16_128B132B_EN		BIT(0)
+
 #define DP_AUX_FRAME_SYNC_VALUE		    0x15c   /* eDP 1.4 */
 # define DP_AUX_FRAME_SYNC_VALID	    (1 << 0)
 
-- 
2.25.1

