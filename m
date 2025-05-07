Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E339AAD227
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 02:18:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEF7410E715;
	Wed,  7 May 2025 00:18:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="ICupIJ9g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF53210E715;
 Wed,  7 May 2025 00:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Py01DQ9xYbpFzr91ErTRYrXU/5Ow+oC2G1NDUju4/5o=; b=ICupIJ9g81mMKWrmFkzMZmKhJK
 USP4N2xRfhjWRf6opCpPe+FNGjCXVw7h1qRVY2Q5IBQJQ54+o3C5Yi1AENfjI8TDOt0wOe+0cQR2M
 S7Zcme/7VbL810BpbERT+pPQKiZvrtq3HD/XlcW8MU8fyXkQxBJiP1UCuYpjE5rEmBv2MhUM37XL5
 YhPV7VHJCiX3TGH4elrrUn29bLouREUloaYVqH+GhXGEQjPadyFE5DOzFI75vTkAxLz9pSaN/JP8a
 N7GZSQiRAvCjvtraaZ7GVmKwHue1reHfeVjFfiF2ivNhcnYAcM3a1Yuo38a53zM7ecdBjIDFNOg8e
 CWBjLrrQ==;
Received: from [189.6.16.79] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uCSQa-004SNM-Dm; Wed, 07 May 2025 02:18:09 +0200
From: Melissa Wen <mwen@igalia.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch
Cc: Jani Nikula <jani.nikula@linux.intel.com>, amd-gfx@lists.freedesktop.org,
 Alex Hung <alex.hung@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Michel Daenzer <michel.daenzer@mailbox.org>,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Subject: [PATCH v2 09/14] drm/amd/display: change DC functions to accept
 private types for edid
Date: Tue,  6 May 2025 21:04:03 -0300
Message-ID: <20250507001712.120215-10-mwen@igalia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250507001712.120215-1-mwen@igalia.com>
References: <20250507001712.120215-1-mwen@igalia.com>
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

There is an opaque obj in Linux/DRM to encapsulate edid data as
`drm_edid`. This obj isn't present in other platforms but we need to
pass it through DC when adding sink. To pass this data without
compromise the independence of DC code, make some DC functions accept
edid data as private options.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc_link_exports.c | 9 ++++-----
 drivers/gpu/drm/amd/display/dc/dc.h                   | 9 ++++-----
 drivers/gpu/drm/amd/display/dc/inc/link.h             | 9 ++++-----
 drivers/gpu/drm/amd/display/dc/link/link_detection.c  | 4 ++--
 drivers/gpu/drm/amd/display/dc/link/link_detection.h  | 9 ++++-----
 5 files changed, 18 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_exports.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_exports.c
index 71e15da4bb69..b6f03ac16cad 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link_exports.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_exports.c
@@ -278,11 +278,10 @@ unsigned int dc_dp_trace_get_link_loss_count(struct dc_link *link)
 	return link->dc->link_srv->dp_trace_get_link_loss_count(link);
 }
 
-struct dc_sink *dc_link_add_remote_sink(
-		struct dc_link *link,
-		const uint8_t *edid,
-		int len,
-		struct dc_sink_init_data *init_data)
+struct dc_sink *dc_link_add_remote_sink(struct dc_link *link,
+					const void *edid,
+					int len,
+					struct dc_sink_init_data *init_data)
 {
 	return link->dc->link_srv->add_remote_sink(link, edid, len, init_data);
 }
diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
index 2230e36c4f12..c93e074ea736 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -1878,11 +1878,10 @@ struct dc_sink_init_data;
  * @len - size of the edid in byte
  * @init_data -
  */
-struct dc_sink *dc_link_add_remote_sink(
-		struct dc_link *dc_link,
-		const uint8_t *edid,
-		int len,
-		struct dc_sink_init_data *init_data);
+struct dc_sink *dc_link_add_remote_sink(struct dc_link *dc_link,
+					const void *edid,
+					int len,
+					struct dc_sink_init_data *init_data);
 
 /* Remove remote sink from a link with dc_connection_mst_branch connection type.
  * @link - link the sink should be removed from
diff --git a/drivers/gpu/drm/amd/display/dc/inc/link.h b/drivers/gpu/drm/amd/display/dc/inc/link.h
index 2948a696ee12..ab69af34ec82 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/link.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/link.h
@@ -107,11 +107,10 @@ struct link_service {
 	bool (*detect_link)(struct dc_link *link, enum dc_detect_reason reason);
 	bool (*detect_connection_type)(struct dc_link *link,
 			enum dc_connection_type *type);
-	struct dc_sink *(*add_remote_sink)(
-			struct dc_link *link,
-			const uint8_t *edid,
-			int len,
-			struct dc_sink_init_data *init_data);
+	struct dc_sink *(*add_remote_sink)(struct dc_link *link,
+					   const void *edid,
+					   int len,
+					   struct dc_sink_init_data *init_data);
 	void (*remove_remote_sink)(struct dc_link *link, struct dc_sink *sink);
 	bool (*get_hpd_state)(struct dc_link *link);
 	struct gpio *(*get_hpd_gpio)(struct dc_bios *dcb,
diff --git a/drivers/gpu/drm/amd/display/dc/link/link_detection.c b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
index 8c7a00c1ad2b..6d05ddb194c9 100644
--- a/drivers/gpu/drm/amd/display/dc/link/link_detection.c
+++ b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
@@ -1394,7 +1394,7 @@ static bool link_add_remote_sink_helper(struct dc_link *dc_link, struct dc_sink
 
 struct dc_sink *link_add_remote_sink(
 		struct dc_link *link,
-		const uint8_t *edid,
+		const void *edid,
 		int len,
 		struct dc_sink_init_data *init_data)
 {
@@ -1421,7 +1421,7 @@ struct dc_sink *link_add_remote_sink(
 	if (!dc_sink)
 		return NULL;
 
-	memmove(dc_sink->dc_edid.raw_edid, edid, len);
+	memmove(dc_sink->dc_edid.raw_edid, (const uint8_t *) edid, len);
 	dc_sink->dc_edid.length = len;
 
 	if (!link_add_remote_sink_helper(
diff --git a/drivers/gpu/drm/amd/display/dc/link/link_detection.h b/drivers/gpu/drm/amd/display/dc/link/link_detection.h
index 7da05078721e..9cd3aa36c7d8 100644
--- a/drivers/gpu/drm/amd/display/dc/link/link_detection.h
+++ b/drivers/gpu/drm/amd/display/dc/link/link_detection.h
@@ -29,11 +29,10 @@
 bool link_detect(struct dc_link *link, enum dc_detect_reason reason);
 bool link_detect_connection_type(struct dc_link *link,
 		enum dc_connection_type *type);
-struct dc_sink *link_add_remote_sink(
-		struct dc_link *link,
-		const uint8_t *edid,
-		int len,
-		struct dc_sink_init_data *init_data);
+struct dc_sink *link_add_remote_sink(struct dc_link *link,
+				     const void *edid,
+				     int len,
+				     struct dc_sink_init_data *init_data);
 void link_remove_remote_sink(struct dc_link *link, struct dc_sink *sink);
 bool link_reset_cur_dp_mst_topology(struct dc_link *link);
 const struct dc_link_status *link_get_status(const struct dc_link *link);
-- 
2.47.2

