Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D78616628C2
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 15:44:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A14110E1FB;
	Mon,  9 Jan 2023 14:44:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7198710E0A7
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 14:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9648VuOhk39mU4vg9P8mrkFGTnpgxLJ7uh8m6YPwrNA=; b=NMPPemoP+IGrVEVN7n9QvaBAEc
 xnsdpArCjxljyG+xkK+NSzx9kcYcpp3MM+SCH1sHSIbB5AgNnYpzlcp91xRyIRwPemLFkOPT2j1Ij
 esfPb4u2z3zDGc4+6PQRvGeQHd4z0HwXF3ihgULOT6P/Ycs8AnNWWEFdR0vIZi+QG6w+ajnffhBdD
 x/gbiBJ+/HYn/QiFKmRWbk3toGrzTI1WMs+rJZvZvKyVgM2qP+HYIJWlugxU1TyEadmjGrL0rIg35
 RjzFh06bbyRZBk5lBk4cayR6G6m1BO/nbjWUxExXKNvOQoxgxi+kvUGXmijc+b5GM+oyAxVwwvZxA
 W9d3LIMw==;
Received: from [41.74.137.107] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pEtNL-003TyM-DW; Mon, 09 Jan 2023 15:43:47 +0100
From: Melissa Wen <mwen@igalia.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch
Subject: [RFC PATCH v2 01/18] drm: Add 3D LUT mode and its attributes
Date: Mon,  9 Jan 2023 13:38:29 -0100
Message-Id: <20230109143846.1966301-2-mwen@igalia.com>
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
Cc: laurent.pinchart+renesas@ideasonboard.com,
 Shashank Sharma <shashank.sharma@amd.com>, alex.hung@amd.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 seanpaul@chromium.org, kernel-dev@igalia.com, bhawanpreet.lakha@amd.com,
 nicholas.kazlauskas@amd.com, Joshua Ashton <joshua@froggi.es>,
 sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alex Hung <alex.hung@amd.com>

A struct is defined for 3D LUT modes to be supported by hardware.
The elements includes lut_size, lut_stride, bit_depth, color_format
and flags.

Note: A patchset "IGT tests for pre-blending 3D LUT interfaces" for this
proposal is sent to IGT mailing list.

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 include/uapi/drm/drm_mode.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index fa953309d9ce..fddb86dad4db 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -849,6 +849,23 @@ struct drm_color_lut {
 	__u16 reserved;
 };
 
+/*
+ * struct drm_mode_lut3d_mode - 3D LUT mode information.
+ * @lut_size: number of valid points on every dimension of 3D LUT.
+ * @lut_stride: number of points on every dimension of 3D LUT.
+ * @bit_depth: number of bits of RGB. If color_mode defines entries with higher
+ *             bit_depth the least significant bits will be truncated.
+ * @color_format: fourcc values, ex. DRM_FORMAT_XRGB16161616 or DRM_FORMAT_XBGR16161616.
+ * @flags: flags for hardware-sepcific features
+ */
+struct drm_mode_lut3d_mode {
+	__u16 lut_size;
+	__u16 lut_stride[3];
+	__u16 bit_depth;
+	__u32 color_format;
+	__u32 flags;
+};
+
 /**
  * struct hdr_metadata_infoframe - HDR Metadata Infoframe Data.
  *
-- 
2.35.1

