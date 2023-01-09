Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6A26628D0
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 15:44:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D0E610E43E;
	Mon,  9 Jan 2023 14:44:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A12410E436;
 Mon,  9 Jan 2023 14:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cUoeBdofxkXT9xFOFSawmIrJOWQdaUxVUBcCykFvQKk=; b=PbpZ4nD0OTMS3q3O0nQsr54b3O
 GqC9EJeBrL8zeqDYc6S74QTyTMFncpixOmXOs+QL71atJRURwswLPZ3rkffhW6th+uJefkjfvPauc
 nzuvo9Znfu+d/uybFmKXDkwG/qlQyv7pjEyyc8DkWC4ZskaIJcJXw4RhL22kho7U5aLcyAKSFPfJh
 sG3B/0blpbXjNxJNmFQcyr8tcpLhsmjRCCCdYZbeg/3fYR+/yvOav9W9rDFj9qeH2xM1kFeR1D0WL
 P6SRgKAIY2xPlKhUlPK/kcdRGw9L2IQIxHbL7micTwx9852i3bEHw8AHXVl0K5pDyU3gpqL3aqcNp
 s+1cN9Tg==;
Received: from [41.74.137.107] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pEtNu-003TyM-OC; Mon, 09 Jan 2023 15:44:22 +0100
From: Melissa Wen <mwen@igalia.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch
Subject: [RFC PATCH v2 13/18] drm/amd/display: Define 3D LUT struct for HDR
 planes
Date: Mon,  9 Jan 2023 13:38:41 -0100
Message-Id: <20230109143846.1966301-14-mwen@igalia.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230109143846.1966301-1-mwen@igalia.com>
References: <20230109143846.1966301-1-mwen@igalia.com>
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
Cc: laurent.pinchart+renesas@ideasonboard.com, kernel-dev@igalia.com,
 Shashank Sharma <shashank.sharma@amd.com>, alex.hung@amd.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 seanpaul@chromium.org, tzimmermann@suse.de, amd-gfx@lists.freedesktop.org,
 bhawanpreet.lakha@amd.com, nicholas.kazlauskas@amd.com,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alex Hung <alex.hung@amd.com>

Add a 3D LUT mode supported by amdgpu driver.

Note: A patchset "IGT tests for pre-blending 3D LUT interfaces" for this
proposal is sent to IGT mailing list.

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 .../gpu/drm/amd/display/modules/color/color_gamma.h  | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/modules/color/color_gamma.h b/drivers/gpu/drm/amd/display/modules/color/color_gamma.h
index 2893abf48208..8e159b1eb9c6 100644
--- a/drivers/gpu/drm/amd/display/modules/color/color_gamma.h
+++ b/drivers/gpu/drm/amd/display/modules/color/color_gamma.h
@@ -27,6 +27,7 @@
 #define COLOR_MOD_COLOR_GAMMA_H_
 
 #include "color_table.h"
+#include <drm/drm_fourcc.h>
 
 struct dc_transfer_func;
 struct dc_gamma;
@@ -35,6 +36,17 @@ struct dc_rgb_fixed;
 struct dc_color_caps;
 enum dc_transfer_func_predefined;
 
+/*
+ * 3D LUT mode for 17x17x17 LUT and 12 bits of color depth
+ */
+static const struct drm_mode_lut3d_mode lut3d_mode_17_12bit = {
+	.lut_size = 17,
+	.lut_stride = {17, 17, 18},
+	.bit_depth = 12,
+	.color_format = DRM_FORMAT_XRGB16161616,
+	.flags = 0,
+};
+
 /* For SetRegamma ADL interface support
  * Must match escape type
  */
-- 
2.35.1

