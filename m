Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0592EA98A87
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 15:08:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 418B710E1A0;
	Wed, 23 Apr 2025 13:08:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=mcst.ru header.i=@mcst.ru header.b="d2vTtl4t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 900 seconds by postgrey-1.36 at gabe;
 Wed, 23 Apr 2025 13:08:45 UTC
Received: from tretyak2q.mcst.ru (tretyak2q.mcst.ru [213.247.143.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5577B10E1A0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 13:08:45 +0000 (UTC)
Received: from tretyak2q.mcst.ru (localhost.localdomain [127.0.0.1])
 by tretyak2q.mcst.ru (Proxmox) with ESMTP id E98BB100C30
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 15:39:44 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mcst.ru; h=cc:cc
 :content-transfer-encoding:date:from:from:message-id
 :mime-version:reply-to:subject:subject:to:to; s=dkim; bh=2VRR1Cy
 u8OkmME9Et2pZK3JY6/+89JeRSKN0C/QUg+Q=; b=d2vTtl4tZc+HUgwG2Iy7X+w
 3L3+2Z0JugeEVFTndi3dPvldn1XABXCP1aD+4Xcgdg/48Q3IIFzzttfHkXrbZo39
 i1BMZaHUNsgoBEQm2eMD1hspDjWS/WwgsOk/mSEOICkwwmxeX0Zpq98ZtzVsxErN
 pl58Y5t8fA7+6W8OKdqGOz0YEkK/M5oUHOWXSr89FOY5aKXxyU/Rfmrdov87DaQP
 FwShXl6hTxjUHP9odX29IA194l42XJ8LAGH5MqI3hESyCgmVQNiBxwsg+l/rhBN6
 zKrZa/n9pcNTZYfmelm93+tv0mxuS3+nCgP2fVhTerQM4PJv4DAHJd8nHTzW8NA=
 =
X-Virus-Scanned: Debian amavis at mcst.ru
From: Igor Artemiev <Igor.A.Artemiev@mcst.ru>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: Igor Artemiev <Igor.A.Artemiev@mcst.ru>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
Subject: [lvc-project] [PATCH] drm/radeon: fix possible NULL pointer
 dereference in atombios_set_encoder_crtc_source()
Date: Wed, 23 Apr 2025 15:31:42 +0300
Message-Id: <20250423123142.1499351-1-Igor.A.Artemiev@mcst.ru>
X-Mailer: git-send-email 2.39.2
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

The function radeon_get_connector_for_encoder() can return NULL
and its result is checked before dereference in all functions
except atombios_set_encoder_crtc_source().

Add a NULL pointer check before dereference.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: a4863ca93ccc ("drm/radeon/kms/DCE4.1: fix Select_CrtcSource EncodeMode setting for DP bridges (v2)")
Signed-off-by: Igor Artemiev <Igor.A.Artemiev@mcst.ru>
---
 drivers/gpu/drm/radeon/atombios_encoders.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/radeon/atombios_encoders.c b/drivers/gpu/drm/radeon/atombios_encoders.c
index d1c5e471bdca..0cda4e6749f0 100644
--- a/drivers/gpu/drm/radeon/atombios_encoders.c
+++ b/drivers/gpu/drm/radeon/atombios_encoders.c
@@ -1913,9 +1913,9 @@ atombios_set_encoder_crtc_source(struct drm_encoder *encoder)
 			if (radeon_encoder_get_dp_bridge_encoder_id(encoder) != ENCODER_OBJECT_ID_NONE) {
 				struct drm_connector *connector = radeon_get_connector_for_encoder(encoder);
 
-				if (connector->connector_type == DRM_MODE_CONNECTOR_LVDS)
+				if (connector && connector->connector_type == DRM_MODE_CONNECTOR_LVDS)
 					args.v2.ucEncodeMode = ATOM_ENCODER_MODE_LVDS;
-				else if (connector->connector_type == DRM_MODE_CONNECTOR_VGA)
+				else if (connector && connector->connector_type == DRM_MODE_CONNECTOR_VGA)
 					args.v2.ucEncodeMode = ATOM_ENCODER_MODE_CRT;
 				else
 					args.v2.ucEncodeMode = atombios_get_encoder_mode(encoder);
-- 
2.39.2


