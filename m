Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDFE2D7167
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 09:17:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 699956ECBF;
	Fri, 11 Dec 2020 08:16:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 232306E5CE
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 01:32:24 +0000 (UTC)
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4CsYDB5McLzhqPJ;
 Fri, 11 Dec 2020 09:31:54 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.487.0; Fri, 11 Dec 2020 09:32:17 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <airlied@redhat.com>, <kraxel@redhat.com>, <airlied@linux.ie>,
 <daniel@ffwll.ch>
Subject: [PATCH] drm/qxl: use flexible-array member instead of zero-length
 array
Date: Fri, 11 Dec 2020 09:32:29 +0800
Message-ID: <1607650349-28513-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 11 Dec 2020 08:16:07 +0000
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use flexible-array member introduced in C99 instead of zero-length
array. Most of zero-length array was already taken care in previous
patch [1]. Now modified few more cases which were not handled earlier.

[1]. https://patchwork.kernel.org/patch/11394197/

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/gpu/drm/qxl/qxl_dev.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_dev.h b/drivers/gpu/drm/qxl/qxl_dev.h
index a7bc31f..06caa61 100644
--- a/drivers/gpu/drm/qxl/qxl_dev.h
+++ b/drivers/gpu/drm/qxl/qxl_dev.h
@@ -271,7 +271,7 @@ struct qxl_mode {
 /* qxl-1 compat: fixed */
 struct qxl_modes {
 	uint32_t n_modes;
-	struct qxl_mode modes[0];
+	struct qxl_mode modes[];
 };
 
 /* qxl-1 compat: append only */
@@ -382,12 +382,12 @@ struct qxl_data_chunk {
 	uint32_t data_size;
 	QXLPHYSICAL prev_chunk;
 	QXLPHYSICAL next_chunk;
-	uint8_t data[0];
+	uint8_t data[];
 };
 
 struct qxl_message {
 	union qxl_release_info release_info;
-	uint8_t data[0];
+	uint8_t data[];
 };
 
 struct qxl_compat_update_cmd {
@@ -469,7 +469,7 @@ struct qxl_raster_glyph {
 	struct qxl_point glyph_origin;
 	uint16_t width;
 	uint16_t height;
-	uint8_t data[0];
+	uint8_t data[];
 };
 
 struct qxl_string {
@@ -768,7 +768,7 @@ enum {
 struct qxl_path_seg {
 	uint32_t flags;
 	uint32_t count;
-	struct qxl_point_fix points[0];
+	struct qxl_point_fix points[];
 };
 
 struct qxl_path {
@@ -819,7 +819,7 @@ struct qxl_image_descriptor {
 struct qxl_palette {
 	uint64_t unique;
 	uint16_t num_ents;
-	uint32_t ents[0];
+	uint32_t ents[];
 };
 
 struct qxl_bitmap {
@@ -838,7 +838,7 @@ struct qxl_surface_id {
 
 struct qxl_encoder_data {
 	uint32_t data_size;
-	uint8_t data[0];
+	uint8_t data[];
 };
 
 struct qxl_image {
@@ -868,7 +868,7 @@ struct qxl_monitors_config {
 	uint16_t count;
 	uint16_t max_allowed; /* If it is 0 no fixed limit is given by the
 				 driver */
-	struct qxl_head heads[0];
+	struct qxl_head heads[];
 };
 
 #pragma pack(pop)
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
