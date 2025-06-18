Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE64ADF142
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 17:23:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A735610E8A5;
	Wed, 18 Jun 2025 15:23:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Nqxey/3J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEF6C10E8B3;
 Wed, 18 Jun 2025 15:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ks+nTccYNodiI3kNyRal5bFCvsLvBdAyq27yE7GKxb4=; b=Nqxey/3J9qHQdCBxPAoIO8wsyE
 4kjk96Vc4PNRYA1ojsp3UK8G14CK3ZgH3vHwFxU5PF+tgLUsI+RXgLs3+UxADAgvpsty3wfM9met6
 jBfKHYKs3wKhU0+Zi8W4JBsOPhd63993eXA95HwTclbPhuEpbwaxRON8GLYigGt/fLCNDdN5YKNwk
 /j+2PkpEY29IczYw/C3L9dpKDG1G+tbamI4+LGTg16r2/nMuIT3qlvLx7l34fCNNabqYSOJVaHIHZ
 Go+ox9KngskYdLl835iWGTwEkNBryApgyIgbtYcoG74vQ2VjBQbEd6vK2iEAtYSAMo75zD/Ck+NPi
 LdsgNa/w==;
Received: from [189.6.13.79] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uRudM-0057e5-IM; Wed, 18 Jun 2025 17:23:29 +0200
From: Melissa Wen <mwen@igalia.com>
To: Alex Hung <alex.hung@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Michel Daenzer <michel.daenzer@mailbox.org>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Subject: [PATCH v5 11/14] drm/amd/display: create a function to fill dc_sink
 with edid data
Date: Wed, 18 Jun 2025 12:19:50 -0300
Message-ID: <20250618152216.948406-12-mwen@igalia.com>
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

From: Rodrigo Siqueira <siqueira@igalia.com>

As part of the effort of stopping using raw edid, this commit move the
copy of the edid in DC to a dedicated function that will allow the usage
of drm_edid in the next steps.

Signed-off-by: Rodrigo Siqueira <siqueira@igalia.com>
Co-developer-by: Melissa Wen <mwen@igalia.com>
Signed-off-by: Melissa Wen <mwen@igalia.com>

---

v3:
- remove superfulous cast (jani)
---
 drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c      | 8 ++++++++
 drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h      | 2 ++
 drivers/gpu/drm/amd/display/dc/link/link_detection.c | 3 +--
 3 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c
index 3f8295a68a72..b4ccc111fa08 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c
@@ -17,3 +17,11 @@ bool dc_edid_is_same_edid(struct dc_sink *prev_sink,
        return (memcmp(old_edid->raw_edid,
                       new_edid->raw_edid, new_edid->length) == 0);
 }
+
+void dc_edid_copy_edid_to_dc(struct dc_sink *dc_sink,
+			     const void *edid,
+			     int len)
+{
+	memmove(dc_sink->dc_edid.raw_edid, edid, len);
+	dc_sink->dc_edid.length = len;
+}
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h
index 7e3b1177bc8a..f42cd5bbc730 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h
@@ -7,5 +7,7 @@
 
 bool dc_edid_is_same_edid(struct dc_sink *prev_sink,
 			  struct dc_sink *current_sink);
+void dc_edid_copy_edid_to_dc(struct dc_sink *dc_sink,
+			     const void *edid, int len);
 
 #endif /* __DC_EDID_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/link/link_detection.c b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
index 957d74ff1294..891d35274f69 100644
--- a/drivers/gpu/drm/amd/display/dc/link/link_detection.c
+++ b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
@@ -1401,8 +1401,7 @@ struct dc_sink *link_add_remote_sink(
 	if (!dc_sink)
 		return NULL;
 
-	memmove(dc_sink->dc_edid.raw_edid, (const uint8_t *) edid, len);
-	dc_sink->dc_edid.length = len;
+	dc_edid_copy_edid_to_dc(dc_sink, edid, len);
 
 	if (!link_add_remote_sink_helper(
 			link,
-- 
2.47.2

