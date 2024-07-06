Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F4D929083
	for <lists+dri-devel@lfdr.de>; Sat,  6 Jul 2024 05:40:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4D6F10E2DD;
	Sat,  6 Jul 2024 03:40:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="H2SqAAy8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AE2B10E2D2;
 Sat,  6 Jul 2024 03:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QIysGNR/fQi6tp97TXdzgzFAV8AulxuJZ6vL+thmoaU=; b=H2SqAAy8GFWIR63lQLIFPZkRDN
 nHoq29ZjXQcH3P/i+x8mqT/euN9ul0vvQXL/SowAdEquRU3vbv4gNoN0tL+MFPBIxt4X25m3/XDYS
 NnVPmOIWqxQmz3oqI9+2V3YuzvEpdY5Dq3Nxlz6tEcHSNuDyaTMYSyEZqyP5uYpr18FUPBpoNVil0
 4A37iE9f0y9NGqULTgv2Zl6qEI4e0GTMIaR9Uh5oz96A9/DlHcOd0C9qTUDZv4jUNXlXmvZQOe9ks
 kzWgzfn+F0ySxHbOpOoYwpOUTDThW/wqLS60kuAZyZ4LEFoGHfhNCWKZrZ9N89P/hp+h07zBaNNNA
 5ULMMavg==;
Received: from [189.6.17.125] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sPwHk-00Bj27-AA; Sat, 06 Jul 2024 05:40:28 +0200
From: Melissa Wen <mwen@igalia.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch
Cc: Alex Hung <alex.hung@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Subject: [PATCH v4 03/11] drm/amd/display: switch to setting physical address
 directly
Date: Sat,  6 Jul 2024 00:35:04 -0300
Message-ID: <20240706034004.801329-4-mwen@igalia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240706034004.801329-1-mwen@igalia.com>
References: <20240706034004.801329-1-mwen@igalia.com>
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
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 49b8c5b00728..163850aeac4a 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -3477,10 +3477,9 @@ void amdgpu_dm_update_connector_after_detect(
 			aconnector->drm_edid = drm_edid_alloc(edid, sink->dc_edid.length);
 			drm_edid_connector_update(connector, aconnector->drm_edid);
 
-			/* FIXME: Get rid of drm_edid_raw() */
 			if (aconnector->dc_link->aux_mode)
-				drm_dp_cec_set_edid(&aconnector->dm_dp_aux.aux,
-						    drm_edid_raw(aconnector->drm_edid));
+				drm_dp_cec_attach(&aconnector->dm_dp_aux.aux,
+						  connector->display_info.source_physical_address);
 		}
 
 		if (!aconnector->timing_requested) {
-- 
2.43.0

