Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6983F955C32
	for <lists+dri-devel@lfdr.de>; Sun, 18 Aug 2024 12:44:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDE8710E047;
	Sun, 18 Aug 2024 10:43:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.b="GupqK+Wr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00BED10E01F;
 Sun, 18 Aug 2024 10:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
 s=mail; t=1723977821;
 bh=fKGZWTylCrkUKzQxU1idZr4kJxvtu34DylGKZuIhUtA=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=GupqK+WrC/nHKVQ5eWB9kr93LX9LI6thKXSmKxYtAVW1ijm/f+ffxRvsdc0QgIrAy
 D1HMYMDaCwnEgcfh2gfd6oKBmUZ6H9Q9vjwQvelhd8rbP77BGxPczu5nq8EBfXdzWj
 IJX0GZbbNw6KQIWE+p3yo476z/JDy9mF1S7L5wtM=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 18 Aug 2024 12:43:28 +0200
Subject: [PATCH 04/12] drm/amd/display: Simplify raw_edid handling in
 dm_helpers_parse_edid_caps()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240818-amdgpu-drm_edid-v1-4-aea66c1f7cf4@weissschuh.net>
References: <20240818-amdgpu-drm_edid-v1-0-aea66c1f7cf4@weissschuh.net>
In-Reply-To: <20240818-amdgpu-drm_edid-v1-0-aea66c1f7cf4@weissschuh.net>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, jinzh <jinzh@github.amd.com>, 
 Aric Cyr <Aric.Cyr@amd.com>, Alan Liu <HaoPing.Liu@amd.com>, 
 Tony Cheng <Tony.Cheng@amd.com>, 
 Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Harry Wentland <Harry.Wentland@amd.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723977820; l=1951;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=fKGZWTylCrkUKzQxU1idZr4kJxvtu34DylGKZuIhUtA=;
 b=D+2ZzYzLkZGs1ZeuVCYAu/pTWlUI0ONm5mk0bbsmU6kf5nUOmkTVd8DylIc43uDOMTa63uem3
 UdTFJEirwidAlIhNDuac7hDAswD6GOTLuWTrqVB0QK2uUqayvmPTDao
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
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

Reduce the number of casts needed by reusing the edid_buf variable.
Also initialize edid_buf after the !edid case has been handled to avoid
the ternary expression.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index 165e010fe69c..3cc0808f391a 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -94,7 +94,7 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
 {
 	struct amdgpu_dm_connector *aconnector = link->priv;
 	struct drm_connector *connector = &aconnector->base;
-	struct edid *edid_buf = edid ? (struct edid *) edid->raw_edid : NULL;
+	struct edid *edid_buf;
 	struct cea_sad *sads;
 	int sad_count = -1;
 	int sadb_count = -1;
@@ -106,6 +106,8 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
 	if (!edid_caps || !edid)
 		return EDID_BAD_INPUT;
 
+	edid_buf = (struct edid *)edid->raw_edid;
+
 	if (!drm_edid_is_valid(edid_buf))
 		result = EDID_BAD_CHECKSUM;
 
@@ -125,7 +127,7 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
 
 	apply_edid_quirks(edid_buf, edid_caps);
 
-	sad_count = drm_edid_to_sad((struct edid *) edid->raw_edid, &sads);
+	sad_count = drm_edid_to_sad(edid_buf, &sads);
 	if (sad_count <= 0)
 		return result;
 
@@ -139,7 +141,7 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
 		edid_caps->audio_modes[i].sample_size = sad->byte2;
 	}
 
-	sadb_count = drm_edid_to_speaker_allocation((struct edid *) edid->raw_edid, &sadb);
+	sadb_count = drm_edid_to_speaker_allocation(edid_buf, &sadb);
 
 	if (sadb_count < 0) {
 		DRM_ERROR("Couldn't read Speaker Allocation Data Block: %d\n", sadb_count);

-- 
2.46.0

