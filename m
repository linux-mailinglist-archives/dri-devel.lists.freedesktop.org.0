Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A146794ECDE
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 14:23:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 625CD10E1D8;
	Mon, 12 Aug 2024 12:23:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LngOK4dB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF33410E1D5;
 Mon, 12 Aug 2024 12:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723465404; x=1755001404;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CvEgD4Uzq1is/G5cUFFcJr+ZFmfaPi9/+03D+xhZGZ4=;
 b=LngOK4dB+IgypsNBgRYXMBSCYwZc3DrQZpz68+Lz0cPL6HQqZrM2IJX/
 ovIWWsocKQhprzOy92fC4cvkSvb4a2BlOhaDlTZuDx9TZqsPsH6A/tW/Q
 GxP0sSpjpf18jEMYfwkexWYwnKcXDJhZAzr3oNCMgFlIH6VyOpKUDEYTw
 2q7CRoNSUY+S3s4XOVwQAY7Obp9wKL9nHcAgh85KmEd1GHRYmWhHfj0xl
 56ylcTLy1n0Cm+LLakUUCzuRZHNq9S1caMNUzyYW/oa9FZChlxOs+g7I0
 /neKycW+8LtSLqhHz2iWxc1z+VUbxdAYPB75DLrVGld4/4eboNgHQSSv2 g==;
X-CSE-ConnectionGUID: ZUP2YmzSR8+deMB/NW8blQ==
X-CSE-MsgGUID: vbm6MN3+S0uk3Bq+0Pvb0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="44088438"
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; d="scan'208";a="44088438"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 05:23:24 -0700
X-CSE-ConnectionGUID: fpgAgFklQR+0iu2Va4M2/w==
X-CSE-MsgGUID: rBrNZOqLTd6+VBsawnS5rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; d="scan'208";a="58326981"
Received: from iklimasz-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.117])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 05:23:22 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
	jani.nikula@intel.com
Subject: [RESEND 2/3] drm/mst: switch to guid_gen() to generate valid GUIDs
Date: Mon, 12 Aug 2024 15:23:11 +0300
Message-Id: <20240812122312.1567046-2-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240812122312.1567046-1-jani.nikula@intel.com>
References: <20240812122312.1567046-1-jani.nikula@intel.com>
MIME-Version: 1.0
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

Instead of just smashing jiffies into a GUID, use guid_gen() to generate
RFC 4122 compliant GUIDs.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index 39f1dc45004e..38a9a1441e62 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -2700,18 +2700,10 @@ static void drm_dp_mst_queue_probe_work(struct drm_dp_mst_topology_mgr *mgr)
 static bool drm_dp_validate_guid(struct drm_dp_mst_topology_mgr *mgr,
 				 guid_t *guid)
 {
-	u64 salt;
-	u8 buf[UUID_SIZE];
-
 	if (!guid_is_null(guid))
 		return true;
 
-	salt = get_jiffies_64();
-
-	memcpy(&buf[0], &salt, sizeof(u64));
-	memcpy(&buf[8], &salt, sizeof(u64));
-
-	import_guid(guid, buf);
+	guid_gen(guid);
 
 	return false;
 }
-- 
2.39.2

