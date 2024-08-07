Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC8194B160
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 22:33:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CBBC10E5D3;
	Wed,  7 Aug 2024 20:33:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="jvpNDBbt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAD8A10E5D1;
 Wed,  7 Aug 2024 20:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=35df+jtS1rykgMVGama1CAHEXtCP8zO+IFlyKeAORkw=; b=jvpNDBbtUk8L8yZ2w476eArRMA
 I0LlaXKQNSQrV6laXJmICxYjmGUkCx2tSdHx31vl5fnFc4v11GjHAn98UyCMtOfUueSnxnq5wkqYs
 y5sw35Qf7d5+akND43C+KNuVFwrp1PkxINgQygnCNGHzOgHwGvw+E531lzz1O61xpgZgZn8Zk4SaH
 zN3GXJgqv9OSiEjPYp10ISNLA+kAoS/TCMzGUSoaizHdF+0Rr3VLJLe1ZNeb25/TPuPjug4KTugQz
 FG6QwF7s+eb3nbDjk98y4bn8AcG1Dwf0VR/8SPQpAQC4nJZoYzAcJiI9jynPvTXHMMIkVSZ2aohjG
 FulbsA1g==;
Received: from [189.6.17.125] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sbnLk-0098Re-B8; Wed, 07 Aug 2024 22:33:36 +0200
From: Melissa Wen <mwen@igalia.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch
Cc: Alex Hung <alex.hung@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, kernel-dev@igalia.com,
 Melissa Wen <mwen@igalia.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v5 2/9] drm/amd/display: switch to setting physical address
 directly
Date: Wed,  7 Aug 2024 19:25:04 -0100
Message-ID: <20240807203207.2830-3-mwen@igalia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240807203207.2830-1-mwen@igalia.com>
References: <20240807203207.2830-1-mwen@igalia.com>
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

Connectors have source physical address available in display
info. Use drm_dp_cec_attach() to use it instead of parsing the EDID
again.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index fff1f0c524fc..c43baa3d30f8 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -3484,8 +3484,7 @@ void amdgpu_dm_update_connector_after_detect(
 		if (sink->dc_edid.length == 0) {
 			aconnector->drm_edid = NULL;
 			if (aconnector->dc_link->aux_mode) {
-				drm_dp_cec_unset_edid(
-					&aconnector->dm_dp_aux.aux);
+				drm_dp_cec_unset_edid(&aconnector->dm_dp_aux.aux);
 			}
 		} else {
 			const struct edid *edid = (const struct edid *)sink->dc_edid.raw_edid;
@@ -3493,7 +3492,8 @@ void amdgpu_dm_update_connector_after_detect(
 			drm_edid_connector_update(connector, aconnector->drm_edid);
 
 			if (aconnector->dc_link->aux_mode)
-				drm_dp_cec_set_edid(&aconnector->dm_dp_aux.aux, edid);
+				drm_dp_cec_attach(&aconnector->dm_dp_aux.aux,
+						  connector->display_info.source_physical_address);
 		}
 
 		if (!aconnector->timing_requested) {
-- 
2.43.0

