Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D524AC3CA33
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 17:57:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1383A10E97D;
	Thu,  6 Nov 2025 16:57:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="m/NoHnzj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7628D10E97A;
 Thu,  6 Nov 2025 16:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HC9s9JGXZvse/uUT2SkzfidcCEH9h+cqp5+7VuyOSX0=; b=m/NoHnzjqB0VaQ3CdpDB6+eRpv
 8VT0OU3y1QXljE86WfzxoGFmRrBmhQ2jSybtp+3qt/GUMqwZJ56cUHYqg6ymrN8A/aQD3O+qszXDW
 HBmCz2CayiFhX0344EZk4Wh1Yfv7vZb72wHEQyu/1HF0Utf1TlvIs07/g2tAA4EPf6wtYnp835DcT
 TWbDa+C/KkY7SdHix81ngU6po0WJV184qaFipDENTxH4yxaEomRYHOCL8v7hDWPxj917I69PfS3vJ
 /pEycTdnoZWi16vkqt8TiC6959YF4q9BVBQi6xqBkVYGqDwfw0nsAfj0P7qqj/0tSUNvfiYAJJgoo
 rhMpYydQ==;
Received: from [186.208.74.26] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vH3I6-0035jh-5s; Thu, 06 Nov 2025 17:56:54 +0100
From: Melissa Wen <mwen@igalia.com>
To: Harry Wentland <harry.wentland@amd.com>, Alex Hung <alex.hung@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, airlied@gmail.com,
 alexander.deucher@amd.com, andrzej.hajda@intel.com,
 christian.koenig@amd.com, jernej.skrabec@gmail.com, jonas@kwiboo.se,
 Laurent.pinchart@ideasonboard.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, mwen@igalia.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, simona@ffwll.ch, sunpeng.li@amd.com, tzimmermann@suse.de
Cc: Michel Daenzer <michel.daenzer@mailbox.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Subject: [PATCH v7 12/15] drm/amd/display: create a function to fill dc_sink
 with edid data
Date: Thu,  6 Nov 2025 13:49:15 -0300
Message-ID: <20251106165536.161662-13-mwen@igalia.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251106165536.161662-1-mwen@igalia.com>
References: <20251106165536.161662-1-mwen@igalia.com>
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

As part of the effort of stopping using raw edid, this commit move the
copy of the edid in DC to a dedicated function that will allow the usage
of drm_edid in the next steps.

v7:
- linux-specific func should be in dm_helpers not in a new file (Harry)

Signed-off-by: Rodrigo Siqueira <siqueira@igalia.com>
Co-developer-by: Rodrigo Siqueira <siqueira@igalia.com>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 8 ++++++++
 drivers/gpu/drm/amd/display/dc/dm_helpers.h               | 3 +++
 drivers/gpu/drm/amd/display/dc/link/link_detection.c      | 3 +--
 3 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index f3cc6ea11c6f..a7ad93c2eb5f 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -999,6 +999,14 @@ bool dm_helpers_is_same_edid(struct dc_sink *prev_sink,
                       new_edid->raw_edid, new_edid->length) == 0);
 }
 
+void dm_helpers_copy_edid_to_dc(struct dc_sink *dc_sink,
+				const void *edid,
+				int len)
+{
+	memmove(dc_sink->dc_edid.raw_edid, edid, len);
+	dc_sink->dc_edid.length = len;
+}
+
 enum dc_edid_status dm_helpers_read_local_edid(
 		struct dc_context *ctx,
 		struct dc_link *link,
diff --git a/drivers/gpu/drm/amd/display/dc/dm_helpers.h b/drivers/gpu/drm/amd/display/dc/dm_helpers.h
index 2fb445933350..0415cb50fe32 100644
--- a/drivers/gpu/drm/amd/display/dc/dm_helpers.h
+++ b/drivers/gpu/drm/amd/display/dc/dm_helpers.h
@@ -65,6 +65,9 @@ enum dc_edid_status dm_helpers_parse_edid_caps(struct dc_link *link,
 /* Compare two EDIDs */
 bool dm_helpers_is_same_edid(struct dc_sink *prev_sink,
 			     struct dc_sink *current_sink);
+void dm_helpers_copy_edid_to_dc(struct dc_sink *dc_sink,
+				const void *edid, int len);
+
 
 /*
  * Update DP branch info
diff --git a/drivers/gpu/drm/amd/display/dc/link/link_detection.c b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
index 616540acc6ee..2ab1f28d0d19 100644
--- a/drivers/gpu/drm/amd/display/dc/link/link_detection.c
+++ b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
@@ -1554,8 +1554,7 @@ struct dc_sink *link_add_remote_sink(
 	if (!dc_sink)
 		return NULL;
 
-	memmove(dc_sink->dc_edid.raw_edid, (const uint8_t *) edid, len);
-	dc_sink->dc_edid.length = len;
+	dm_helpers_copy_edid_to_dc(dc_sink, edid, len);
 
 	if (!link_add_remote_sink_helper(
 			link,
-- 
2.51.0

