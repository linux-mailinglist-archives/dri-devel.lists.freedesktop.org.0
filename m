Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A37A17C8595
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 14:21:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B034810E5F5;
	Fri, 13 Oct 2023 12:21:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m15.mail.163.com (m15.mail.163.com [45.254.50.219])
 by gabe.freedesktop.org (Postfix) with ESMTP id F0B7510E5F5
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 12:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=IOWG0
 MbrbYhiKt6BQbObVALF/qURdsD/wOrjlu3Xh6Y=; b=EpjbJfZJTKzr6NJYkBNYz
 tyR+3paNFfi8L+izGcaYH8vi9SpwPqB77XT1zSHAwiKEkjlqPKV4KD/ZEFMZ7t6T
 dIWXMezc+UTQZfgRihsARoUZTTal8PUdmjxH9MAW8bxz4UHUBYmxjwhz8evLE0nY
 tp4PjvfwW75SzEj1bJ4658=
Received: from ProDesk.. (unknown [58.22.7.114])
 by zwqz-smtp-mta-g0-1 (Coremail) with SMTP id _____wD3_1g5NillDlfJAQ--.24625S2;
 Fri, 13 Oct 2023 20:21:17 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org,
 heiko@sntech.de
Subject: [PATCH v2 3/4] drm/rockchip: fix the plane format defination of
 rk3568/6
Date: Fri, 13 Oct 2023 20:21:12 +0800
Message-Id: <20231013122112.1594259-1-andyshrk@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231013122001.1594009-1-andyshrk@163.com>
References: <20231013122001.1594009-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3_1g5NillDlfJAQ--.24625S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uFWDAr18uryfuF18Jw17GFg_yoW8KryxpF
 WDArnrX3y09Fy8tF1kJr98Jr4rA3ZrCa1I9w4F93Z7KFy5KFyUKF9xtFyDCr9Fqry8Ca1I
 yr43JryrZF47JrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jyE__UUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiEAoIXl8YLt07VwACsW
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

Add the missing 10 bit RGB format for cluster window.
The cluster windows on rk3568/6 only support afbc format,
so change the  linear yuv format NV12/16/24 to non-Linear
YUV420_8BIT/YUV420_10BIT/YUYV/Y210.

Add NV15 for esmart windows.

Also add some comments.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

---

Changes in v2:
- split rename to another patch

 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c | 22 +++++++++++++-------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
index 62b573f282a7..05aee588e8c9 100644
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
@@ -24,9 +28,10 @@ static const uint32_t formats_win_full_10bit[] = {
 	DRM_FORMAT_BGR888,
 	DRM_FORMAT_RGB565,
 	DRM_FORMAT_BGR565,
-	DRM_FORMAT_NV12,
-	DRM_FORMAT_NV16,
-	DRM_FORMAT_NV24,
+	DRM_FORMAT_YUV420_8BIT, /* yuv420_8bit non-Linear mode only */
+	DRM_FORMAT_YUV420_10BIT, /* yuv420_10bit non-Linear mode only */
+	DRM_FORMAT_YUYV, /* yuv422_8bit non-Linear mode only*/
+	DRM_FORMAT_Y210, /* yuv422_10bit non-Linear mode only */
 };
 
 static const uint32_t formats_win_full_10bit_yuyv[] = {
@@ -38,11 +43,12 @@ static const uint32_t formats_win_full_10bit_yuyv[] = {
 	DRM_FORMAT_BGR888,
 	DRM_FORMAT_RGB565,
 	DRM_FORMAT_BGR565,
-	DRM_FORMAT_NV12,
-	DRM_FORMAT_NV16,
-	DRM_FORMAT_NV24,
-	DRM_FORMAT_YVYU,
-	DRM_FORMAT_VYUY,
+	DRM_FORMAT_NV12, /* yuv420_8bit linear mode, 2 plane */
+	DRM_FORMAT_NV15, /* yuv420_10bit linear mode, 2 plane, no padding */
+	DRM_FORMAT_NV16, /* yuv422_8bit linear mode, 2 plane */
+	DRM_FORMAT_NV24, /* yuv444_8bit linear mode, 2 plane */
+	DRM_FORMAT_YVYU, /* yuv422_8bit[YVYU] linear mode */
+	DRM_FORMAT_VYUY, /* yuv422_8bit[VYUY] linear mode */
 };
 
 static const uint32_t formats_win_lite[] = {
-- 
2.34.1

