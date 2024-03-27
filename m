Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5C188F159
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 22:50:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0780A1120AC;
	Wed, 27 Mar 2024 21:50:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="l/iTc4n8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1921C1120AF;
 Wed, 27 Mar 2024 21:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=avL7qCn1g5IAe0g2VenqKyAhopYdXXva2eLK9wbfsJE=; b=l/iTc4n8LzfBxTGb3g7CLSsg2M
 EruU4a5D7Ck8kgHnzmIlCBCIXKMpQgI0AXjEaHouDwiyvz/oaD1hUkU4XR2NTKK4kQn146jKqOnuV
 RJsUP1J/6DwTfdttkNz9Tmq9HU+C13MjVU8aPGZy6IkHVVPI9JpW2DrkuKsmGbmDysQHYiu70fklX
 7qP5tjnL0zakDfDCiGQHTOOWIAT+5nT+Rjuoqu+QXjWGqH3gmjV5KpVFLIBEbZzLc/5l6HbEd+qWa
 frhJQbybwxllYKLiEv42s2U6isH74dlgpjYt/lk/enAYfgmBNQFO0uaS4cyF6ZoRq9BGNm7Lhevno
 SqQ5mMpQ==;
Received: from [189.6.17.125] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rpbA8-00G1qx-78; Wed, 27 Mar 2024 22:50:24 +0100
From: Melissa Wen <mwen@igalia.com>
To: Harry Wentland <harry.wentland@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, Alex Hung <alex.hung@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>, airlied@gmail.com,
 daniel@ffwll.ch
Cc: Jani Nikula <jani.nikula@linux.intel.com>, amd-gfx@lists.freedesktop.org,
 kernel-dev@igalia.com, dri-devel@lists.freedesktop.org
Subject: [RFC PATCH v3 4/6] drm/amd/display: switch to setting physical
 address directly
Date: Wed, 27 Mar 2024 18:44:05 -0300
Message-ID: <20240327214953.367126-5-mwen@igalia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240327214953.367126-1-mwen@igalia.com>
References: <20240327214953.367126-1-mwen@igalia.com>
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
index bbbf9c9d40d5..edc5418db5be 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -3277,11 +3277,11 @@ void amdgpu_dm_update_connector_after_detect(
 		} else {
 			const struct edid *edid = (const struct edid *)sink->dc_edid.raw_edid;
 			aconnector->edid = drm_edid_alloc(edid, sink->dc_edid.length);
+			drm_edid_connector_update(connector, aconnector->edid);
 
-			/* FIXME: Get rid of drm_edid_raw() */
 			if (aconnector->dc_link->aux_mode)
-				drm_dp_cec_set_edid(&aconnector->dm_dp_aux.aux,
-						    drm_edid_raw(aconnector->edid));
+				drm_dp_cec_attach(&aconnector->dm_dp_aux.aux,
+						  connector->display_info.source_physical_address);
 		}
 
 		if (!aconnector->timing_requested) {
-- 
2.43.0

