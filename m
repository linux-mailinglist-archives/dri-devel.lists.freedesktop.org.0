Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02EB79863F9
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 17:43:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6641910E121;
	Wed, 25 Sep 2024 15:43:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="rDKkAfhN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54EDB10E122;
 Wed, 25 Sep 2024 15:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1gZCCExOJ8BLuVIACQp6NZYsnDxOnwhLvgUxXVihlYE=; b=rDKkAfhNx83p4ILiehc8uXAq4C
 AaESzC7uqmsOlQJq4J4UiuU1KuQ4MpTRBRc5NIUL3jL9d0+xpCTJZIb2uW7T+GCh9xOKkuGTuJfrW
 y3XhHxy8mUpEqfaMI4TuD8wIzsHoy59VWEoCYMnSN9U4LwxV8d2BATRMOitRfF4WVMBxld7ngTJm7
 u+Y6mrgkA0BuFkVEE3N6oTv2/zC4p+ijZdsQL3kRFrQr0bqB39ZIbIJlgc8/TpaizWjC6Yz3cwX+b
 uLSln+aWj7Hq9DTrqUTJ1yJb/do5AHRxl2Oo21tO+ux5ZbtvN3l3HLazgh/w8OMXoMK6ZfU5sKEoH
 JcGHAjog==;
Received: from [189.6.17.125] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1stUB0-000y8P-R1; Wed, 25 Sep 2024 17:43:39 +0200
From: Melissa Wen <mwen@igalia.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/amd/display: add warnings for MAX_SURFACES mismatch
Date: Wed, 25 Sep 2024 12:37:19 -0300
Message-ID: <20240925154324.348774-3-mwen@igalia.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240925154324.348774-1-mwen@igalia.com>
References: <20240925154324.348774-1-mwen@igalia.com>
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

So that, in the future, when the max number of planes and streams
increases, they might be synced with the number of surfaces to prevent
array-index-out-of-bounds issues.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 6d12def3e8b3..95db2b1cc91a 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -3098,6 +3098,13 @@ static void dm_gpureset_commit_state(struct dc_state *dc_state,
 	for (k = 0; k < dc_state->stream_count; k++) {
 		bundle->stream_update.stream = dc_state->streams[k];
 
+		if (MAX_SURFACES < dc_state->stream_status->plane_count) {
+			drm_warn(dm->ddev, "Not enough dc_surface_update for the "
+					   "number of planes. Please increase "
+					   "MAX_SURFACES inline to MAX_PLANES.\n");
+			continue;
+		}
+
 		for (m = 0; m < dc_state->stream_status->plane_count; m++) {
 			bundle->surface_updates[m].surface =
 				dc_state->stream_status->plane_states[m];
@@ -8923,6 +8930,13 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 		if (!dc_plane)
 			continue;
 
+		if (MAX_SURFACES < planes_count) {
+			drm_warn(dev, "Not enough dc_surface_update for the "
+				      "number of planes. Please increase "
+				      "MAX_SURFACES inline to MAX_PLANES.\n");
+			continue;
+		}
+
 		bundle->surface_updates[planes_count].surface = dc_plane;
 		if (new_pcrtc_state->color_mgmt_changed) {
 			bundle->surface_updates[planes_count].gamma = &dc_plane->gamma_correction;
@@ -9874,6 +9888,12 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
 
 		WARN_ON(!status->plane_count);
 
+		if (MAX_SURFACES < status->plane_count) {
+			drm_warn(dev, "Not enough dc_surface_update for the "
+				      "number of planes. Please increase "
+				      "MAX_SURFACES inline to MAX_PLANES.\n");
+			continue;
+		}
 		/*
 		 * TODO: DC refuses to perform stream updates without a dc_surface_update.
 		 * Here we create an empty update on each plane.
-- 
2.45.2

