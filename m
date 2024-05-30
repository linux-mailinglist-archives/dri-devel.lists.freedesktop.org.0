Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF328D455D
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 08:15:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 428D611B46F;
	Thu, 30 May 2024 06:14:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EmOehMZA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9484011B466;
 Thu, 30 May 2024 06:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717049684; x=1748585684;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CisULbMevhQi6s8Mnmi6gzr2KbjQvWUp1RaitIPqz+g=;
 b=EmOehMZAhFs9om5FdR5NwovfRnaTSBToCgzdXVG7htFZ+6O11Ivfu9JV
 hK+D6B6IMcgE5E1ge3SDhldR03FezrsGcnS9//ZDz/OsyjSF+1GzYcHfG
 lmRj60VjkpVY5sUGTYmJc+VZC52hXKgH09SaUZ3FouOZtk3Nl9zHxtynE
 H+WBZoxRnBF+VRCTBmGkRJJvoC11U+Xy4qK89Imsq5H9AhVf2RMYgrieE
 rYgbtZFbh/9j58oC58/iFfNxbWiQX0BhTEEYTffgmrVZJuCv1+DGT0Q+G
 2yHmHMhUymoOJJDgJSArMKWnpiDM9UC/0uLW0QEtOELb+jBGcYMVMLsVt w==;
X-CSE-ConnectionGUID: jTWURHr1Q2KCNBaS639cSw==
X-CSE-MsgGUID: n/SDwRXUTsCKXIR31wS/Eg==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="24915530"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="24915530"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 23:14:43 -0700
X-CSE-ConnectionGUID: jrKF1OXHRou6qEPKshUF3g==
X-CSE-MsgGUID: 54hvUYNCSfiB0HE/oE+ELw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="36335688"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orviesa007.jf.intel.com with ESMTP; 29 May 2024 23:14:42 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, ankit.k.nautiyal@intel.com,
 jani.nikula@intel.com
Subject: [PATCH v10 6/8] drm/i915/display: Add support for pack and unpack
Date: Thu, 30 May 2024 11:34:06 +0530
Message-Id: <20240530060408.67027-7-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240530060408.67027-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20240530060408.67027-1-mitulkumar.ajitkumar.golani@intel.com>
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

Add support of pack and unpack for target_rr_divider.

--v2:
- Set Target Refresh Rate Divider bit when related
AS SDP bit is set (Ankit).

--v3:
- target_rr_divider is bools so set accordingly (Ankit).
Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 4fa977f1e6c4..95cf586f3bed 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4230,6 +4230,9 @@ static ssize_t intel_dp_as_sdp_pack(const struct drm_dp_as_sdp *as_sdp,
 	sdp->db[3] = as_sdp->target_rr & 0xFF;
 	sdp->db[4] = (as_sdp->target_rr >> 8) & 0x3;
 
+	if (as_sdp->target_rr_divider)
+		sdp->db[4] |= 0x20;
+
 	return length;
 }
 
@@ -4411,6 +4414,7 @@ int intel_dp_as_sdp_unpack(struct drm_dp_as_sdp *as_sdp,
 	as_sdp->mode = sdp->db[0] & DP_ADAPTIVE_SYNC_SDP_OPERATION_MODE;
 	as_sdp->vtotal = (sdp->db[2] << 8) | sdp->db[1];
 	as_sdp->target_rr = (u64)sdp->db[3] | ((u64)sdp->db[4] & 0x3);
+	as_sdp->target_rr_divider = sdp->db[4] & 0x20 ? true : false;
 
 	return 0;
 }
-- 
2.25.1

