Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F45737D1B
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 10:10:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 962BB10E3FC;
	Wed, 21 Jun 2023 08:10:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06EA410E3FA;
 Wed, 21 Jun 2023 08:10:49 +0000 (UTC)
Received: from uno.lan (unknown [IPv6:2001:b07:5d2e:52c9:1cf0:b3bc:c785:4625])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A5036556;
 Wed, 21 Jun 2023 10:10:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1687335012;
 bh=w1iXcw/V3spckvEgKXCmL4tvJ5rQs45envQm9GmietU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lijEoFGnxbBm9UH+qEciP0O20xYkPzvcOmQZI9V7xuKhb0TOaQ1cL5nBuq8pcIRAd
 C6229VvyMxhIzx8qb5JiZiLKcVjaUHdpVoBrTO059t988qV8D8rufYJAURSi7+cpZR
 MXOBMtk2mcUkk5OIOA6JtlhslxhviA/IHEIubY3Y=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [RFC 1/9] drm: Add 3D LUT mode and its attributes
Date: Wed, 21 Jun 2023 10:10:23 +0200
Message-Id: <20230621081031.7876-2-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230621081031.7876-1-jacopo.mondi@ideasonboard.com>
References: <20230621081031.7876-1-jacopo.mondi@ideasonboard.com>
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
Cc: Victoria Brekenfeld <victoria@system76.com>,
 DRI Development <dri-devel@lists.freedesktop.org>, mdaenzer@redhat.com,
 aleixpol@kde.org, Rodrigo.Siqueira@amd.com, amd-gfx@lists.freedesktop.org,
 wayland-devel <wayland-devel@lists.freedesktop.org>,
 Alex Hung <alex.hung@amd.com>,
 =?UTF-8?q?Jonas=20=C3=85dahl?= <jadahl@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>, tzimmermann@suse.de, sunpeng.li@amd.com,
 Sebastian Wick <sebastian.wick@redhat.com>, mripard@kernel.org,
 Melissa Wen <mwen@igalia.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>, Xinhui.Pan@amd.com,
 xaver.hugl@gmail.com, linux-renesas-soc@vger.kernel.org,
 alexander.deucher@amd.com, christian.koenig@amd.com,
 Joshua Ashton <joshua@froggi.es>
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
index 43691058d28f..3b40694259c7 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -854,6 +854,23 @@ struct drm_color_lut {
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
2.40.1

