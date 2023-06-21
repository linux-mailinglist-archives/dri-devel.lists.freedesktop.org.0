Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9E07390B9
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 22:25:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF7F110E35D;
	Wed, 21 Jun 2023 20:25:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE35510E35B;
 Wed, 21 Jun 2023 20:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UJ2N4hpPRvWDuzI6rxDT0n0LIA9MntiG/Tq21yGX0Ss=; b=f6es/VPamjUr26Mdt8h0aMjY3Y
 27t1y9SY7FkfX7yBJrkCbEuzBwf5a0poegmMHv0SFkcsUGiYDm1IgBr6DqGA0Y84OtccG5UrB0wUn
 7PgUInCa44ibICDW44egfjNmcbSWHJgtDVZUp+jdrhm3Y7+AdPpZorZ0EY110ZBP0K6NiAN+8eHit
 o5dDWCRC0lyXKVLxCtXlcC72XvXhIe7j6WMgIMvA4BHXBiOj2uNbx2kGBXbIcN7Po5SrHagitpe1j
 kh5tNmO2YalziGDBxWZ9jVu63szaLeZW0s1z9r00vZV1XPWktq1cvR2GXwG7JB8FQppxNUXUaDMnY
 3On+P0FQ==;
Received: from [179.113.218.86] (helo=steammachine.lan)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qC4OJ-001TKu-78; Wed, 21 Jun 2023 22:25:23 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] amd/display: only accept async flips for fast updates
Date: Wed, 21 Jun 2023 17:24:59 -0300
Message-ID: <20230621202459.979661-2-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230621202459.979661-1-andrealmeid@igalia.com>
References: <20230621202459.979661-1-andrealmeid@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 =?UTF-8?q?=27Marek=20Ol=C5=A1=C3=A1k=27?= <maraeo@gmail.com>,
 michel.daenzer@mailbox.org, kernel-dev@igalia.com, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Simon Ser <contact@emersion.fr>

Up until now, amdgpu was silently degrading to vsync when
user-space requested an async flip but the hardware didn't support
it.

The hardware doesn't support immediate flips when the update changes
the FB pitch, the DCC state, the rotation, enables or disables CRTCs
or planes, etc. This is reflected in the dm_crtc_state.update_type
field: UPDATE_TYPE_FAST means that immediate flip is supported.

Silently degrading async flips to vsync is not the expected behavior
from a uAPI point-of-view. Xorg expects async flips to fail if
unsupported, to be able to fall back to a blit. i915 already behaves
this way.

This patch aligns amdgpu with uAPI expectations and returns a failure
when an async flip is not possible.

Signed-off-by: Simon Ser <contact@emersion.fr>
Reviewed-by: André Almeida <andrealmeid@igalia.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c    |  8 ++++++++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c   | 12 ++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 514f6785a020..1d9b84e5835f 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -8136,7 +8136,15 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 		 * Only allow immediate flips for fast updates that don't
 		 * change memory domain, FB pitch, DCC state, rotation or
 		 * mirroring.
+		 *
+		 * dm_crtc_helper_atomic_check() only accepts async flips with
+		 * fast updates.
 		 */
+		if (crtc->state->async_flip &&
+		    acrtc_state->update_type != UPDATE_TYPE_FAST)
+			drm_warn_once(state->dev,
+				      "[PLANE:%d:%s] async flip with non-fast update\n",
+				      plane->base.id, plane->name);
 		bundle->flip_addrs[planes_count].flip_immediate =
 			crtc->state->async_flip &&
 			acrtc_state->update_type == UPDATE_TYPE_FAST &&
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
index 440fc0869a34..30d4c6fd95f5 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
@@ -398,6 +398,18 @@ static int dm_crtc_helper_atomic_check(struct drm_crtc *crtc,
 		return -EINVAL;
 	}
 
+	/*
+	 * Only allow async flips for fast updates that don't change the FB
+	 * pitch, the DCC state, rotation, etc.
+	 */
+	if (crtc_state->async_flip &&
+	    dm_crtc_state->update_type != UPDATE_TYPE_FAST) {
+		drm_dbg_atomic(crtc->dev,
+			       "[CRTC:%d:%s] async flips are only supported for fast updates\n",
+			       crtc->base.id, crtc->name);
+		return -EINVAL;
+	}
+
 	/* In some use cases, like reset, no stream is attached */
 	if (!dm_crtc_state->stream)
 		return 0;
-- 
2.41.0

