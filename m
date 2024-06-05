Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBF08FD3A9
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 19:11:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A954B10E695;
	Wed,  5 Jun 2024 17:11:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A6x/2KCf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C9A110E66A;
 Wed,  5 Jun 2024 17:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717607497; x=1749143497;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TelzOKAp8eIYGM2Ai58/iX3rhHJpTovS/BmxLM9NNTY=;
 b=A6x/2KCf2lvZW7h4JdXutRq1apxK5GgaSDvLEb/npvKrh5k50S4AppIp
 vhvazVSrqmk/61HthjLTY0Ni1f97+ZBzBcTWEfI0xiBmvqvEfyZ9RDqao
 P0OR/D2yUc3Mn9jdJupV/RO6L/KhildmDD2zNO3asCaVi9hOjvXaCeMt7
 9MZeIS3J+eCVSHlDOtI5hixDkw+jkh6axUCcBAQLQq/Yrz0b8NcdW9lxw
 TR0rlbvKLE04Tm0zidxifsvKHghwy+pl40rcAfrzU0UZROcPblXJJRVBF
 sxTQrxWSHWiWmi3zSOpadmTUmiEhgOsM/HRHcDWYOKl3TAFQvImugbWJl w==;
X-CSE-ConnectionGUID: FETnQs64RQ6dFjCLC9uLgw==
X-CSE-MsgGUID: 6dcssssBRq2lm22FnRe49g==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="14452449"
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; d="scan'208";a="14452449"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 10:11:37 -0700
X-CSE-ConnectionGUID: X+DjW2PNSB6LAaUy9+oVrw==
X-CSE-MsgGUID: bUq6DdwMR9KW1LHu7JsW0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; d="scan'208";a="60848409"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by fmviesa002.fm.intel.com with ESMTP; 05 Jun 2024 10:11:36 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Subject: [PATCH v13 6/9] drm/i915/display: Add support for pack and unpack
Date: Wed,  5 Jun 2024 22:31:08 +0530
Message-Id: <20240605170111.494784-7-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240605170111.494784-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20240605170111.494784-1-mitulkumar.ajitkumar.golani@intel.com>
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
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index fd054e16850d..ac81b172b1ec 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4232,6 +4232,9 @@ static ssize_t intel_dp_as_sdp_pack(const struct drm_dp_as_sdp *as_sdp,
 	sdp->db[3] = as_sdp->target_rr & 0xFF;
 	sdp->db[4] = (as_sdp->target_rr >> 8) & 0x3;
 
+	if (as_sdp->target_rr_divider)
+		sdp->db[4] |= 0x20;
+
 	return length;
 }
 
@@ -4413,6 +4416,7 @@ int intel_dp_as_sdp_unpack(struct drm_dp_as_sdp *as_sdp,
 	as_sdp->mode = sdp->db[0] & DP_ADAPTIVE_SYNC_SDP_OPERATION_MODE;
 	as_sdp->vtotal = (sdp->db[2] << 8) | sdp->db[1];
 	as_sdp->target_rr = (u64)sdp->db[3] | ((u64)sdp->db[4] & 0x3);
+	as_sdp->target_rr_divider = sdp->db[4] & 0x20 ? true : false;
 
 	return 0;
 }
-- 
2.25.1

