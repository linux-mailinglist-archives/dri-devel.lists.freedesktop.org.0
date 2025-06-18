Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2631CADF12C
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 17:22:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7521A10E89A;
	Wed, 18 Jun 2025 15:22:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="rVrDiNEN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59BBD10E895;
 Wed, 18 Jun 2025 15:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=q2Vk700nSpsNQ1b/g/kem3UFqzMJrSKH+P9IpaOCARE=; b=rVrDiNENakkoB6urifm1o9Bk4/
 TCrMzdR6zI1epRax1iS/c5FRDej9Jbgz/hH+47zkjPkE+057PseQPv/tAozdZ3zANWfXpNsxJALlR
 DNvix3P7xb3+z+1D+D4r5pwfOJaIQHV0AYChvDKi60JEOqATNnyArcsL0MCr0SFYaM61LiNMXqoy9
 5GuTJWtRmZHsgoacL+0v2lOJ2jz4dOISOAE9m9xFwN9CLXPjuqRNF/7ntctB7Jq00ZLzRCBWZZHCe
 bt2wELOuhguY+XxxKRkrCrNT5bpw7+eP7Yui0KxUURVHgmdAFOq9JxoKeYnGcqmwriZWhaK7A4I55
 58tqrOkA==;
Received: from [189.6.13.79] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uRucd-0057e5-QD; Wed, 18 Jun 2025 17:22:44 +0200
From: Melissa Wen <mwen@igalia.com>
To: Alex Hung <alex.hung@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Michel Daenzer <michel.daenzer@mailbox.org>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Subject: [PATCH v5 03/14] drm/amd/display: use drm_edid_product_id for parsing
 EDID product info
Date: Wed, 18 Jun 2025 12:19:42 -0300
Message-ID: <20250618152216.948406-4-mwen@igalia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250618152216.948406-1-mwen@igalia.com>
References: <20250618152216.948406-1-mwen@igalia.com>
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

Use drm_edid_product_id [1] to get debug info from drm_edid instead of
directly parsing raw EDID.

[1] 3ddbd345539e ("drm/edid: add drm_edid_get_product_id()").

Signed-off-by: Melissa Wen <mwen@igalia.com>
--

v5:
- replace series url to commit hash (Mario)
---
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index 5543780f1024..b1085f1195f7 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -109,6 +109,7 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
 	struct drm_device *dev = connector->dev;
 	struct edid *edid_buf = edid ? (struct edid *) edid->raw_edid : NULL;
 	const struct drm_edid *drm_edid;
+	struct drm_edid_product_id product_id;
 	struct cea_sad *sads;
 	int sad_count = -1;
 	int sadb_count = -1;
@@ -125,13 +126,13 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
 	if (!drm_edid_valid(drm_edid))
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
+	edid_caps->manufacturer_id = product_id.manufacturer_name;
+	edid_caps->product_id = le16_to_cpu(product_id.product_code);
+	edid_caps->serial_number = le32_to_cpu(product_id.serial_number);
+	edid_caps->manufacture_week = product_id.week_of_manufacture;
+	edid_caps->manufacture_year = product_id.year_of_manufacture;
 
 	drm_edid_get_monitor_name(edid_buf,
 				  edid_caps->display_name,
-- 
2.47.2

