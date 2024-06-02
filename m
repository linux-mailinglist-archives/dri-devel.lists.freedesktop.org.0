Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA73E8D762C
	for <lists+dri-devel@lfdr.de>; Sun,  2 Jun 2024 16:21:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B02910E010;
	Sun,  2 Jun 2024 14:21:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U9Rs4twq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71CE610E010;
 Sun,  2 Jun 2024 14:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717338077; x=1748874077;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oadUV7GI47XB1/5yBXbfmigyApPprinWQqP+x7Kl/Hk=;
 b=U9Rs4twqpddq6X072IOOag3mkFc2UVl2gAwITmdcvc3z59ThQW9xqlw9
 kd7iAN6p57oDf4cW3t7YZ3Uw+xnBHPctMNthTX0gvk3euDdZ0nfQbqb8i
 9xt5wro/q9T9fjTtDRRFDIGcprpurehSPiTUrvbdXkBH1hDsGTSQOuJ7I
 ZhwFeaExxRV7JjmhzyEUDAg1naRGVf7eZxxbeqhiN/zT8reC67vbTzL1j
 KfxqYFIEDApen41Kblf/5rvU0hDsgmoUCpjmye6WwFYLvM6AczIdiKDvV
 tR3TSnC0UXR5E2QXoNY9IGYnUCxIUUBpP0WDGb7pcbxTEXFBRTWD1Ie2Q A==;
X-CSE-ConnectionGUID: FqH1Dg0nSEmo+EWKDY7Sng==
X-CSE-MsgGUID: IYNuKEcYTgyeSyGvJdlEgQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="25238384"
X-IronPort-AV: E=Sophos;i="6.08,209,1712646000"; d="scan'208";a="25238384"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2024 07:21:12 -0700
X-CSE-ConnectionGUID: x7cBwlDkQniQF7ZWg474Ag==
X-CSE-MsgGUID: 9l107NcSSH+Iotuu6PVigA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,209,1712646000"; d="scan'208";a="59808440"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa002.fm.intel.com with ESMTP; 02 Jun 2024 07:21:09 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id EF6921CB; Sun, 02 Jun 2024 17:21:07 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 Lewis Huang <lewis.huang@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] drm/amd/display: Fix too big frame size
Date: Sun,  2 Jun 2024 17:21:03 +0300
Message-ID: <20240602142103.3259613-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
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

Compilation fails on arm with:

  link_factory.c:743:1: error: the frame size of 1032 bytes is larger than 1024 bytes [-Werror=frame-larger-than=]

Fix the frame size by allocation one of the big structures.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 .../gpu/drm/amd/display/dc/link/link_factory.c    | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/link/link_factory.c b/drivers/gpu/drm/amd/display/dc/link/link_factory.c
index cf22b8f28ba6..78f1b2102839 100644
--- a/drivers/gpu/drm/amd/display/dc/link/link_factory.c
+++ b/drivers/gpu/drm/amd/display/dc/link/link_factory.c
@@ -456,10 +456,10 @@ static bool construct_phy(struct dc_link *link,
 	struct dc_context *dc_ctx = init_params->ctx;
 	struct encoder_init_data enc_init_data = { 0 };
 	struct panel_cntl_init_data panel_cntl_init_data = { 0 };
-	struct integrated_info info = { 0 };
 	struct dc_bios *bios = init_params->dc->ctx->dc_bios;
 	const struct dc_vbios_funcs *bp_funcs = bios->funcs;
 	struct bp_disp_connector_caps_info disp_connect_caps_info = { 0 };
+	struct integrated_info *info;
 
 	DC_LOGGER_INIT(dc_ctx->logger);
 
@@ -672,12 +672,16 @@ static bool construct_phy(struct dc_link *link,
 	}
 
 	if (bios->integrated_info)
-		info = *bios->integrated_info;
+		info = kmemdup(bios->integrated_info, sizeof(*info), GFP_KERNEL);
+	else
+		info = kzalloc(sizeof(*info), GFP_KERNEL);
+	if (!info)
+		goto device_tag_fail;
 
 	/* Look for channel mapping corresponding to connector and device tag */
 	for (i = 0; i < MAX_NUMBER_OF_EXT_DISPLAY_PATH; i++) {
 		struct external_display_path *path =
-			&info.ext_disp_conn_info.path[i];
+			&info->ext_disp_conn_info.path[i];
 
 		if (path->device_connector_id.enum_id == link->link_id.enum_id &&
 		    path->device_connector_id.id == link->link_id.id &&
@@ -698,14 +702,15 @@ static bool construct_phy(struct dc_link *link,
 
 			if (link->chip_caps & EXT_DISPLAY_PATH_CAPS__DP_FIXED_VS_EN) {
 				link->bios_forced_drive_settings.VOLTAGE_SWING =
-						(info.ext_disp_conn_info.fixdpvoltageswing & 0x3);
+						info->ext_disp_conn_info.fixdpvoltageswing & 0x3;
 				link->bios_forced_drive_settings.PRE_EMPHASIS =
-						((info.ext_disp_conn_info.fixdpvoltageswing >> 2) & 0x3);
+						(info->ext_disp_conn_info.fixdpvoltageswing >> 2) & 0x3;
 			}
 
 			break;
 		}
 	}
+	kfree(info);
 
 	if (bios->funcs->get_atom_dc_golden_table)
 		bios->funcs->get_atom_dc_golden_table(bios);
-- 
2.43.0.rc1.1336.g36b5255a03ac

