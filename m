Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CDAA866D3
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 22:14:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7785410EC85;
	Fri, 11 Apr 2025 20:14:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="qA8TaeB2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29DE010E059;
 Fri, 11 Apr 2025 20:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FvdMdmlGt5NIzYeDPVUJapuflhc5GuaJtNNUub5tKEU=; b=qA8TaeB2ZUWHhUL7vuF8uQ+mdX
 fr6LWUduAnZnNFH676xchKTHXG+KNz7pe/0LVkcdb3jSfrS0rWP+XLhpUdD3KjtOeVaa1/JweXpTk
 D0cE7OQ/ANs3pYG1riFIWEN6PWeIVsS6YNdmO4zbAd4lFQnPIlJY8eRYqCBRac2J41jlg1uP/dtOQ
 zPXzjxyXiRU/PesdqIDFepsikWofmet6w8p1SrL7Ei8e3iNFbe7iFg425u7d88nzWEqVWZvi6XVgH
 JQqt1y/dVGWTgzJmJGozMruO8rFYVK4n6RjxKOaaQeEBTD1iJhCydwsSt7wzOsB6AuJuao3QF1HAu
 cWgHqNtg==;
Received: from [189.6.35.67] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1u3Kl6-00FIP5-8A; Fri, 11 Apr 2025 22:13:52 +0200
From: Melissa Wen <mwen@igalia.com>
To: Alex Hung <alex.hung@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch
Cc: Jani Nikula <jani.nikula@linux.intel.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Subject: [PATCH 02/13] drm/amd/display: use drm_edid_product_id for parsing
 EDID product info
Date: Fri, 11 Apr 2025 17:08:32 -0300
Message-ID: <20250411201333.151335-3-mwen@igalia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250411201333.151335-1-mwen@igalia.com>
References: <20250411201333.151335-1-mwen@igalia.com>
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

Since [1], we can use drm_edid_product_id to get debug info from
drm_edid instead of directly parsing EDID.

Link: https://lore.kernel.org/dri-devel/cover.1712655867.git.jani.nikula@intel.com/ [1]
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c    | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index 62954b351ebd..e93adb7e48a5 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -108,6 +108,8 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
 	struct drm_connector *connector = &aconnector->base;
 	struct drm_device *dev = connector->dev;
 	struct edid *edid_buf = edid ? (struct edid *) edid->raw_edid : NULL;
+	struct drm_edid *drm_edid;
+	struct drm_edid_product_id product_id;
 	struct cea_sad *sads;
 	int sad_count = -1;
 	int sadb_count = -1;
@@ -122,13 +124,13 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
 	if (!drm_edid_is_valid(edid_buf))
 		result = EDID_BAD_CHECKSUM;
 
-	edid_caps->manufacturer_id = (uint16_t) edid_buf->mfg_id[0] |
-					((uint16_t) edid_buf->mfg_id[1])<<8;
-	edid_caps->product_id = (uint16_t) edid_buf->prod_code[0] |
-					((uint16_t) edid_buf->prod_code[1])<<8;
-	edid_caps->serial_number = edid_buf->serial;
-	edid_caps->manufacture_week = edid_buf->mfg_week;
-	edid_caps->manufacture_year = edid_buf->mfg_year;
+	drm_edid_get_product_id(drm_edid, &product_id);
+
+	edid_caps->manufacturer_id = le16_to_cpu(product_id.manufacturer_name);
+	edid_caps->product_id = le16_to_cpu(product_id.product_code);
+	edid_caps->serial_number = le32_to_cpu(product_id.serial_number);
+	edid_caps->manufacture_week = product_id.week_of_manufacture;
+	edid_caps->manufacture_year = product_id.year_of_manufacture;
 
 	drm_edid_get_monitor_name(edid_buf,
 				  edid_caps->display_name,
-- 
2.47.2

