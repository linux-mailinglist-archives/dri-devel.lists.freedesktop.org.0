Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8792C3C9DC
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 17:56:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E982410E96A;
	Thu,  6 Nov 2025 16:56:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="EfvNqu8D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94E8C10E983;
 Thu,  6 Nov 2025 16:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tny8kikPqTlkUDzsoOFvtws73c9RxASJRvdxVrt+aOM=; b=EfvNqu8DRRm1ioceU84H040Am9
 PJnKlPBTgW5vA5jneQAvwkroWvW5TvF5aDJsFqIwzR9PO5NAkBLrOBLu2/wfqOIWGq9kNKg50yqeP
 556ZEqxrfT4u8IY2MnhsETHhOBMaMnpzecIaNZenafvzRBmd9O9E69QZQrcJybGedP+q094skeMzP
 D4S52MoHBFC4Fe9FvaVj3nItIlBOPfyHx3coIA3C+qcZC6aqJaQK5AsHYEbFq2+TntzRQhZT5LhM4
 QdMpZBaQYAPf2xVZNfoC0PNvc0LBiwrG+psuaWbs6TJkuPM0rfEfvz4yvLA7Uo4Gtur/oBEQY5/eX
 lBRb6oLw==;
Received: from [186.208.74.26] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vH3HL-0035jh-Pg; Thu, 06 Nov 2025 17:56:08 +0100
From: Melissa Wen <mwen@igalia.com>
To: Harry Wentland <harry.wentland@amd.com>, Alex Hung <alex.hung@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, airlied@gmail.com,
 alexander.deucher@amd.com, andrzej.hajda@intel.com,
 christian.koenig@amd.com, jernej.skrabec@gmail.com, jonas@kwiboo.se,
 Laurent.pinchart@ideasonboard.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, mwen@igalia.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, simona@ffwll.ch, sunpeng.li@amd.com, tzimmermann@suse.de
Cc: Michel Daenzer <michel.daenzer@mailbox.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Subject: [PATCH v7 04/15] drm/amd/display: use drm_edid helper to set analog
 EDID caps
Date: Thu,  6 Nov 2025 13:49:07 -0300
Message-ID: <20251106165536.161662-5-mwen@igalia.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251106165536.161662-1-mwen@igalia.com>
References: <20251106165536.161662-1-mwen@igalia.com>
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

Use drm_edid_is_digital helper instead of open-coded mask.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index 7d05cff08233..05e5f51b0a90 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -135,7 +135,7 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
 	edid_caps->serial_number = le32_to_cpu(product_id.serial_number);
 	edid_caps->manufacture_week = product_id.week_of_manufacture;
 	edid_caps->manufacture_year = product_id.year_of_manufacture;
-	edid_caps->analog = !(edid_buf->input & DRM_EDID_INPUT_DIGITAL);
+	edid_caps->analog = !drm_edid_is_digital(drm_edid);
 
 	drm_edid_get_monitor_name(edid_buf,
 				  edid_caps->display_name,
-- 
2.51.0

