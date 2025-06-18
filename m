Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEEFDADF13C
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 17:23:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C39110E8B2;
	Wed, 18 Jun 2025 15:23:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="nW004aAC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6424910E8AB;
 Wed, 18 Jun 2025 15:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=D0OJNW/MfD+AU7/BfJkq+E6ejRORSRx4pnRLkKRmg0U=; b=nW004aACTkLgl5qTPY1Zua7a8x
 ZUFSCTy9XOEsGD8rcv5SobbehT/d6WxeaeUSrxTWc35gDyhY/YqazLF16bsT6FMqCJmwqJkbDSn+0
 LYwZcES/5LO18IGxjfz/Tq1v/hBXZQMZfmC+9DD9hljt4VixEB/gli1lCu3yR21Vogv/MfeLIXqS2
 TxRG/MR+ZMQWP6n3tChTB3BH0C7J9r70lNczuxtvXcnJlukLiL7GRRMJh24bo+whb+CZBjAd3y75R
 N7isSTlON3a6BTJKDz1U+9r/VWtJ8NssyC91n6Bf+hTzMCpmxKYaqQiR/DEgKP7ZT+nZV8ahaRHDI
 rcI9vhag==;
Received: from [189.6.13.79] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uRudB-0057e5-JV; Wed, 18 Jun 2025 17:23:18 +0200
From: Melissa Wen <mwen@igalia.com>
To: Alex Hung <alex.hung@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Michel Daenzer <michel.daenzer@mailbox.org>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Subject: [PATCH v5 09/14] drm/amd/display: change DC functions to accept
 private types for edid
Date: Wed, 18 Jun 2025 12:19:48 -0300
Message-ID: <20250618152216.948406-10-mwen@igalia.com>
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
index 4984700b5f1b..86feef038de6 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -1911,11 +1911,10 @@ struct dc_sink_init_data;
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
index 7d16351bba99..5b30d6e6bea1 100644
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
index 5ac361c59371..863c24fe1117 100644
--- a/drivers/gpu/drm/amd/display/dc/link/link_detection.c
+++ b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
@@ -1385,7 +1385,7 @@ static bool link_add_remote_sink_helper(struct dc_link *dc_link, struct dc_sink
 
 struct dc_sink *link_add_remote_sink(
 		struct dc_link *link,
-		const uint8_t *edid,
+		const void *edid,
 		int len,
 		struct dc_sink_init_data *init_data)
 {
@@ -1412,7 +1412,7 @@ struct dc_sink *link_add_remote_sink(
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

