Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D1A975C84
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 23:36:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1D3210EAB3;
	Wed, 11 Sep 2024 21:35:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Vs7D9C6/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B576210E922;
 Wed, 11 Sep 2024 21:35:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 5541AA44650;
 Wed, 11 Sep 2024 21:35:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 991D2C4CEC6;
 Wed, 11 Sep 2024 21:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726090554;
 bh=NQx4mqHS+mLTR+0LBNOQU6bmZLzqnc1wEp+jawVSYhU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Vs7D9C6/I8IRRJqOXIny4a0DdiQp3jmg6KoPVHNFPYTmeOND4Fx+zPuV5AjSxlCbm
 fRcyVQSpQScLyEPJWHMJ0u6fXpwYfgXyR0y2s/ySViAPY0qjzTuATG8jorSz72G0fk
 PBkL72KMGC66yrN9UWEkTM0C62FFrAjFxkq5elS39TUG9kJTIC4C52rEAubXoqFmgc
 tPiMUpj+NrNhUIRnqJX7WgY0r7be09RKAolUiH2USZqDf2uOGrjUNpK0JPtyVPD4gl
 8JMxvExW3D1ak24NkAqU/FP5HBkU9sFZTY08zSN1ryE0S0WPcMspdvyzeSQmP6yACE
 uehKoKMhCl6WA==
From: Mario Limonciello <superm1@kernel.org>
To: Alex Hung <alex.hung@amd.com>,
 Alexander Deucher <alexander.deucher@amd.com>,
 Melissa Wen <mwen@igalia.com>
Cc: kernel-dev@igalia.com, Mario Limonciello <mario.limonciello@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 harry.wentland@amd.com, sunpeng.li@amd.com,
 Mark Pearson <mpearson-lenovo@squebb.ca>
Subject: [PATCH v6 02/10] drm/amd/display: switch to setting physical address
 directly
Date: Wed, 11 Sep 2024 16:35:28 -0500
Message-ID: <20240911213537.2338164-3-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240911213537.2338164-1-superm1@kernel.org>
References: <20240911213537.2338164-1-superm1@kernel.org>
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

From: Melissa Wen <mwen@igalia.com>

Connectors have source physical address available in display
info. Use drm_dp_cec_attach() to use it instead of parsing the EDID
again.

Signed-off-by: Melissa Wen <mwen@igalia.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 4927fdd45073..f19afa117f15 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -3497,8 +3497,7 @@ void amdgpu_dm_update_connector_after_detect(
 		if (sink->dc_edid.length == 0) {
 			aconnector->drm_edid = NULL;
 			if (aconnector->dc_link->aux_mode) {
-				drm_dp_cec_unset_edid(
-					&aconnector->dm_dp_aux.aux);
+				drm_dp_cec_unset_edid(&aconnector->dm_dp_aux.aux);
 			}
 		} else {
 			const struct edid *edid = (const struct edid *)sink->dc_edid.raw_edid;
@@ -3507,7 +3506,8 @@ void amdgpu_dm_update_connector_after_detect(
 			drm_edid_connector_update(connector, aconnector->drm_edid);
 
 			if (aconnector->dc_link->aux_mode)
-				drm_dp_cec_set_edid(&aconnector->dm_dp_aux.aux, edid);
+				drm_dp_cec_attach(&aconnector->dm_dp_aux.aux,
+						  connector->display_info.source_physical_address);
 		}
 
 		if (!aconnector->timing_requested) {
-- 
2.43.0

