Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41BC87CD874
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 11:43:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5160410E3CA;
	Wed, 18 Oct 2023 09:43:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m15.mail.163.com (m15.mail.163.com [45.254.50.220])
 by gabe.freedesktop.org (Postfix) with ESMTP id 54B5810E3CC
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Oct 2023 09:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=uiQQD
 tfygYo4EUNy6SV7Ypp0InUq5o+D7+iBms9x5o0=; b=VZQ3cTban/OTlTAhIBn3h
 ku4ATVFcsSqwmot3V/iYcUoTSsguj5Zemh905yhy5T2LJwQ5GM64jsaCqicfuPqT
 0mHM7kuHIZadSKG67MjT+SMLvVu44HrYmFbgExWc67cW4EycrwvZYEfeiAyTlH62
 y5nDkhqYL7yY7wx4xV27to=
Received: from ProDesk.. (unknown [58.22.7.114])
 by zwqz-smtp-mta-g1-1 (Coremail) with SMTP id _____wDXj2O3qC9lom9_Aw--.48679S2;
 Wed, 18 Oct 2023 17:43:22 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org,
 heiko@sntech.de, jonas@kwiboo.se
Subject: [PATCH v3 3/4] drm/rockchip: Add more format supported by vop2
Date: Wed, 18 Oct 2023 17:43:18 +0800
Message-Id: <20231018094318.2476081-1-andyshrk@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231018094122.2475668-1-andyshrk@163.com>
References: <20231018094122.2475668-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDXj2O3qC9lom9_Aw--.48679S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxKw13tFWxGFWUKrWDWFy5twb_yoW7Zr1rpr
 WUAFZrXa10vFy8KFsrJr95Ar4rZ3ZrGa1Iq3yqvan2gFyUGFyvqr9xJFy5ZrnFgFyxCw1I
 kr45Jr4rZr48J3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jSzuAUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiEB0NXl8YL0Q+bQAAsh
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
Cc: Andy Yan <andy.yan@rock-chips.com>, s.hauer@pengutronix.de,
 sjoerd.simons@collabora.com, hjc@rock-chips.com,
 sebastian.reichel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Andy Yan <andy.yan@rock-chips.com>

Add 10 bit RGB and AFBC based YUV format supported
by vop2.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

---

Changes in v3:
- add format check and convert

 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 45 +++++++++++++++++++-
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c | 22 +++++++---
 2 files changed, 61 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 8289ddc95bee..0f3df8d3eec2 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -299,6 +299,11 @@ static u32 vop2_get_bpp(const struct drm_format_info *format)
 static enum vop2_data_format vop2_convert_format(u32 format)
 {
 	switch (format) {
+	case DRM_FORMAT_XRGB2101010:
+	case DRM_FORMAT_ARGB2101010:
+	case DRM_FORMAT_XBGR2101010:
+	case DRM_FORMAT_ABGR2101010:
+		return VOP2_FMT_XRGB101010;
 	case DRM_FORMAT_XRGB8888:
 	case DRM_FORMAT_ARGB8888:
 	case DRM_FORMAT_XBGR8888:
@@ -311,10 +316,19 @@ static enum vop2_data_format vop2_convert_format(u32 format)
 	case DRM_FORMAT_BGR565:
 		return VOP2_FMT_RGB565;
 	case DRM_FORMAT_NV12:
+	case DRM_FORMAT_NV21:
+	case DRM_FORMAT_YUV420_8BIT:
 		return VOP2_FMT_YUV420SP;
+	case DRM_FORMAT_NV15:
+	case DRM_FORMAT_YUV420_10BIT:
+		return VOP2_FMT_YUV420SP_10;
 	case DRM_FORMAT_NV16:
+	case DRM_FORMAT_NV61:
 		return VOP2_FMT_YUV422SP;
+	case DRM_FORMAT_Y210:
+		return VOP2_FMT_YUV422SP_10;
 	case DRM_FORMAT_NV24:
+	case DRM_FORMAT_NV42:
 		return VOP2_FMT_YUV444SP;
 	case DRM_FORMAT_YUYV:
 	case DRM_FORMAT_YVYU:
@@ -331,6 +345,11 @@ static enum vop2_data_format vop2_convert_format(u32 format)
 static enum vop2_afbc_format vop2_convert_afbc_format(u32 format)
 {
 	switch (format) {
+	case DRM_FORMAT_XRGB2101010:
+	case DRM_FORMAT_ARGB2101010:
+	case DRM_FORMAT_XBGR2101010:
+	case DRM_FORMAT_ABGR2101010:
+		return VOP2_AFBC_FMT_ARGB2101010;
 	case DRM_FORMAT_XRGB8888:
 	case DRM_FORMAT_ARGB8888:
 	case DRM_FORMAT_XBGR8888:
@@ -342,6 +361,17 @@ static enum vop2_afbc_format vop2_convert_afbc_format(u32 format)
 	case DRM_FORMAT_RGB565:
 	case DRM_FORMAT_BGR565:
 		return VOP2_AFBC_FMT_RGB565;
+	case DRM_FORMAT_YUV420_8BIT:
+		return VOP2_AFBC_FMT_YUV420;
+	case DRM_FORMAT_YUV420_10BIT:
+		return VOP2_AFBC_FMT_YUV420_10BIT;
+	case DRM_FORMAT_YVYU:
+	case DRM_FORMAT_YUYV:
+	case DRM_FORMAT_VYUY:
+	case DRM_FORMAT_UYVY:
+		return VOP2_AFBC_FMT_YUV422;
+	case DRM_FORMAT_Y210:
+		return VOP2_AFBC_FMT_YUV422_10BIT;
 	default:
 		return VOP2_AFBC_FMT_INVALID;
 	}
@@ -352,6 +382,8 @@ static enum vop2_afbc_format vop2_convert_afbc_format(u32 format)
 static bool vop2_win_rb_swap(u32 format)
 {
 	switch (format) {
+	case DRM_FORMAT_XBGR2101010:
+	case DRM_FORMAT_ABGR2101010:
 	case DRM_FORMAT_XBGR8888:
 	case DRM_FORMAT_ABGR8888:
 	case DRM_FORMAT_BGR888:
@@ -364,7 +396,15 @@ static bool vop2_win_rb_swap(u32 format)
 
 static bool vop2_afbc_uv_swap(u32 format)
 {
-	return false;
+	switch (format) {
+	case DRM_FORMAT_YUYV:
+	case DRM_FORMAT_Y210:
+	case DRM_FORMAT_YUV420_8BIT:
+	case DRM_FORMAT_YUV420_10BIT:
+		return true;
+	default:
+		return false;
+	}
 }
 
 static bool vop2_win_uv_swap(u32 format)
@@ -373,6 +413,9 @@ static bool vop2_win_uv_swap(u32 format)
 	case DRM_FORMAT_NV12:
 	case DRM_FORMAT_NV16:
 	case DRM_FORMAT_NV24:
+	case DRM_FORMAT_NV15:
+	case DRM_FORMAT_YUYV:
+	case DRM_FORMAT_UYVY:
 		return true;
 	default:
 		return false;
diff --git a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
index b5e59dd34325..bcc224624a26 100644
--- a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
+++ b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
@@ -16,6 +16,10 @@
 #include "rockchip_drm_vop2.h"
 
 static const uint32_t formats_win_full_10bit[] = {
+	DRM_FORMAT_XRGB2101010,
+	DRM_FORMAT_ARGB2101010,
+	DRM_FORMAT_XBGR2101010,
+	DRM_FORMAT_ABGR2101010,
 	DRM_FORMAT_XRGB8888,
 	DRM_FORMAT_ARGB8888,
 	DRM_FORMAT_XBGR8888,
@@ -24,6 +28,10 @@ static const uint32_t formats_win_full_10bit[] = {
 	DRM_FORMAT_BGR888,
 	DRM_FORMAT_RGB565,
 	DRM_FORMAT_BGR565,
+	DRM_FORMAT_YUV420_8BIT, /* yuv420_8bit non-Linear mode only */
+	DRM_FORMAT_YUV420_10BIT, /* yuv420_10bit non-Linear mode only */
+	DRM_FORMAT_YUYV, /* yuv422_8bit non-Linear mode only*/
+	DRM_FORMAT_Y210, /* yuv422_10bit non-Linear mode only */
 };
 
 static const uint32_t formats_win_full_10bit_yuyv[] = {
@@ -35,11 +43,15 @@ static const uint32_t formats_win_full_10bit_yuyv[] = {
 	DRM_FORMAT_BGR888,
 	DRM_FORMAT_RGB565,
 	DRM_FORMAT_BGR565,
-	DRM_FORMAT_NV12,
-	DRM_FORMAT_NV16,
-	DRM_FORMAT_NV24,
-	DRM_FORMAT_YVYU,
-	DRM_FORMAT_VYUY,
+	DRM_FORMAT_NV12, /* yuv420_8bit linear mode, 2 plane */
+	DRM_FORMAT_NV21, /* yuv420_8bit linear mode, 2 plane */
+	DRM_FORMAT_NV15, /* yuv420_10bit linear mode, 2 plane, no padding */
+	DRM_FORMAT_NV16, /* yuv422_8bit linear mode, 2 plane */
+	DRM_FORMAT_NV61, /* yuv422_8bit linear mode, 2 plane */
+	DRM_FORMAT_NV24, /* yuv444_8bit linear mode, 2 plane */
+	DRM_FORMAT_NV42, /* yuv444_8bit linear mode, 2 plane */
+	DRM_FORMAT_YVYU, /* yuv422_8bit[YVYU] linear mode */
+	DRM_FORMAT_VYUY, /* yuv422_8bit[VYUY] linear mode */
 };
 
 static const uint32_t formats_win_lite[] = {
-- 
2.34.1

