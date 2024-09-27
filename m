Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2404988CD2
	for <lists+dri-devel@lfdr.de>; Sat, 28 Sep 2024 01:06:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2F4810ED37;
	Fri, 27 Sep 2024 23:06:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="q2TyFRuk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9A0510ED37;
 Fri, 27 Sep 2024 23:06:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4F5905C03F5;
 Fri, 27 Sep 2024 23:06:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 075F2C4CEC4;
 Fri, 27 Sep 2024 23:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727478375;
 bh=NkODC7VbcWZq7ffnIjMnAjBGByr5La8NApJvOcHIers=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=q2TyFRuk6IwcSQJMd3/2AlX2abblJa58bFEipOVKNyNNk59i2TVaGjEnvukkamZIm
 OlsAZbB3wkMfln94EDczQ01dVBxH4ZdtWNyf9GZWRxasoANJu9fUSdq2UWE+zQvC+U
 FCdvBB00o94b3EaYNh6cmVlqM8PTkvdXh2gap4ypaxCat+QU2slYBSFdL+D0uzDuEs
 HnhEvZn+5hd8ioqRjBXO2g50nm/C/QKfXhumPjSM+JdpgTY9E+vcKBXSwOoTwSei0Z
 hJEhTtt/cILkQRa4NLb2Eo/O19v0SAxQmOIUtCMUBYq6VjL+7jel9HXpFJEroHoqOP
 9/m80jO+XXxvg==
From: Mario Limonciello <superm1@kernel.org>
To: Alex Hung <alex.hung@amd.com>,
 Alexander Deucher <alexander.deucher@amd.com>,
 Melissa Wen <mwen@igalia.com>
Cc: kernel-dev@igalia.com, Mario Limonciello <mario.limonciello@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 harry.wentland@amd.com, sunpeng.li@amd.com,
 Mark Pearson <mpearson-lenovo@squebb.ca>
Subject: [PATCH v8 2/5] drm/amd/display: switch to setting physical address
 directly
Date: Fri, 27 Sep 2024 18:05:57 -0500
Message-ID: <20240927230600.2619844-3-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240927230600.2619844-1-superm1@kernel.org>
References: <20240927230600.2619844-1-superm1@kernel.org>
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
index b7d93787667c..0b6c936be7a6 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -3548,8 +3548,7 @@ void amdgpu_dm_update_connector_after_detect(
 		if (sink->dc_edid.length == 0) {
 			aconnector->drm_edid = NULL;
 			if (aconnector->dc_link->aux_mode) {
-				drm_dp_cec_unset_edid(
-					&aconnector->dm_dp_aux.aux);
+				drm_dp_cec_unset_edid(&aconnector->dm_dp_aux.aux);
 			}
 		} else {
 			const struct edid *edid = (const struct edid *)sink->dc_edid.raw_edid;
@@ -3558,7 +3557,8 @@ void amdgpu_dm_update_connector_after_detect(
 			drm_edid_connector_update(connector, aconnector->drm_edid);
 
 			if (aconnector->dc_link->aux_mode)
-				drm_dp_cec_set_edid(&aconnector->dm_dp_aux.aux, edid);
+				drm_dp_cec_attach(&aconnector->dm_dp_aux.aux,
+						  connector->display_info.source_physical_address);
 		}
 
 		if (!aconnector->timing_requested) {
-- 
2.43.0

