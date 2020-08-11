Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F422425CB
	for <lists+dri-devel@lfdr.de>; Wed, 12 Aug 2020 09:05:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEB3A6E8AD;
	Wed, 12 Aug 2020 07:05:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5523D6E83F
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 20:26:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id 85BD329916D
From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, stable@vger.kernel.org,
 hjc@rock-chips.com, heiko@sntech.de, airlied@linux.ie, daniel@ffwll.ch,
 andrzej.p@collabora.com, daniels@collabora.com
Subject: [PATCH] drm/rockchip: Require the YTR modifier for AFBC
Date: Tue, 11 Aug 2020 16:26:31 -0400
Message-Id: <20200811202631.3603-1-alyssa.rosenzweig@collabora.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 12 Aug 2020 07:05:21 +0000
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
Cc: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The AFBC decoder used in the Rockchip VOP assumes the use of the
YUV-like colourspace transform (YTR). YTR is lossless for RGB(A)
buffers, which covers the RGBA8 and RGB565 formats supported in
vop_convert_afbc_format. Use of YTR is signaled with the
AFBC_FORMAT_MOD_YTR modifier, which prior to this commit was missing. As
such, a producer would have to generate buffers that do not use YTR,
which the VOP would erroneously decode as YTR, leading to severe visual
corruption.

The upstream AFBC support was developed against a captured frame, which
failed to exercise modifier support. Prior to bring-up of AFBC in Mesa
(in the Panfrost driver), no open userspace respected modifier
reporting. As such, this change is not expected to affect broken
userspaces.

Tested on RK3399 with Panfrost and Weston.

Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.h b/drivers/gpu/drm/rockchip/rockchip_drm_vop.h
index 4a2099cb5..857d97cdc 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.h
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.h
@@ -17,9 +17,20 @@
 
 #define NUM_YUV2YUV_COEFFICIENTS 12
 
+/* AFBC supports a number of configurable modes. Relevant to us is block size
+ * (16x16 or 32x8), storage modifiers (SPARSE, SPLIT), and the YUV-like
+ * colourspace transform (YTR). 16x16 SPARSE mode is always used. SPLIT mode
+ * could be enabled via the hreg_block_split register, but is not currently
+ * handled. The colourspace transform is implicitly always assumed by the
+ * decoder, so consumers must use this transform as well.
+ *
+ * Failure to match modifiers will cause errors displaying AFBC buffers
+ * produced by conformant AFBC producers, including Mesa.
+ */
 #define ROCKCHIP_AFBC_MOD \
 	DRM_FORMAT_MOD_ARM_AFBC( \
 		AFBC_FORMAT_MOD_BLOCK_SIZE_16x16 | AFBC_FORMAT_MOD_SPARSE \
+			| AFBC_FORMAT_MOD_YTR \
 	)
 
 enum vop_data_format {
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
