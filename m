Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A0E4B73E6
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 17:52:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 352F710E543;
	Tue, 15 Feb 2022 16:52:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE20710E542
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 16:52:33 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:7534:e0be:5adf:2691])
 by michel.telenet-ops.be with bizsmtp
 id vUsV2600518GbK106UsVDG; Tue, 15 Feb 2022 17:52:31 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nK140-000tUr-LD; Tue, 15 Feb 2022 17:52:28 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nK140-00BUSC-3a; Tue, 15 Feb 2022 17:52:28 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>
Subject: [PATCH 8/8] drm/fourcc: Add DRM_FORMAT_D1
Date: Tue, 15 Feb 2022 17:52:26 +0100
Message-Id: <20220215165226.2738568-9-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220215165226.2738568-1-geert@linux-m68k.org>
References: <20220215165226.2738568-1-geert@linux-m68k.org>
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
Cc: linux-fbdev@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-m68k@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Introduce a fourcc code for a single-channel frame buffer format with two
darkness levels.  This can be used for two-level dark-on-light displays.

As the number of bits per pixel is less than eight, this relies on
proper block handling for the calculation of bits per pixel and pitch.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/gpu/drm/drm_fourcc.c  | 2 ++
 include/uapi/drm/drm_fourcc.h | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
index c12e48ecb1ab8aad..d00ce5d8d1fb9dd3 100644
--- a/drivers/gpu/drm/drm_fourcc.c
+++ b/drivers/gpu/drm/drm_fourcc.c
@@ -151,6 +151,8 @@ const struct drm_format_info *__drm_format_info(u32 format)
 		{ .format = DRM_FORMAT_C4,		.depth = 4,  .num_planes = 1,
 		  .char_per_block = { 1, }, .block_w = { 2, }, .block_h = { 1, }, .hsub = 1, .vsub = 1 },
 		{ .format = DRM_FORMAT_C8,		.depth = 8,  .num_planes = 1, .cpp = { 1, 0, 0 }, .hsub = 1, .vsub = 1 },
+		{ .format = DRM_FORMAT_D1,		.depth = 1,  .num_planes = 1,
+		  .char_per_block = { 1, }, .block_w = { 8, }, .block_h = { 1, }, .hsub = 1, .vsub = 1 },
 		{ .format = DRM_FORMAT_R1,		.depth = 1,  .num_planes = 1,
 		  .char_per_block = { 1, }, .block_w = { 8, }, .block_h = { 1, }, .hsub = 1, .vsub = 1 },
 		{ .format = DRM_FORMAT_R2,		.depth = 2,  .num_planes = 1,
diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 8605a1acc6813e6c..c15c6efcc65e5827 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -104,6 +104,9 @@ extern "C" {
 #define DRM_FORMAT_C4		fourcc_code('C', '4', ' ', ' ') /* [3:0] C */
 #define DRM_FORMAT_C8		fourcc_code('C', '8', ' ', ' ') /* [7:0] C */
 
+/* 1 bpp Darkness */
+#define DRM_FORMAT_D1		fourcc_code('D', '1', ' ', ' ') /* [0] D */
+
 /* 1 bpp Red */
 #define DRM_FORMAT_R1		fourcc_code('R', '1', ' ', ' ') /* [0] R */
 
-- 
2.25.1

