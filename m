Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBFD6D38CD
	for <lists+dri-devel@lfdr.de>; Sun,  2 Apr 2023 17:41:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EAAE10E097;
	Sun,  2 Apr 2023 15:41:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from kozue.soulik.info (kozue.soulik.info
 [IPv6:2001:19f0:7000:8404:5054:ff:fe75:428f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1625B10E0C7
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Apr 2023 15:41:26 +0000 (UTC)
Received: from ritsuko.sh.sumomo.pri (unknown [112.64.60.49])
 by kozue.soulik.info (Postfix) with ESMTPSA id A709B101DA9;
 Mon,  3 Apr 2023 00:34:27 +0900 (JST)
From: Randy Li <ayaka@soulik.info>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v7 2/2] Documentation/gpu: Add Synaptics tiling formats
 documentation
Date: Sun,  2 Apr 2023 23:33:58 +0800
Message-Id: <20230402153358.32948-3-ayaka@soulik.info>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230402153358.32948-1-ayaka@soulik.info>
References: <20230402153358.32948-1-ayaka@soulik.info>
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
Cc: tzimmermann@suse.de, Randy Li <ayaka@soulik.info>,
 linux-kernel@vger.kernel.org, tfiga@chromium.org,
 Hsia-Jun Li <randy.li@synaptics.com>, laurent.pinchart@ideasonboard.com,
 ribalda@chromium.org, nicolas@ndufresne.ca
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Randy Li <ayaka@soulik.info>
Signed-off-by: Hsia-Jun(Randy) Li <randy.li@synaptics.com>
---
 Documentation/gpu/drivers.rst   |  1 +
 Documentation/gpu/synaptics.rst | 81 +++++++++++++++++++++++++++++++++
 2 files changed, 82 insertions(+)
 create mode 100644 Documentation/gpu/synaptics.rst

diff --git a/Documentation/gpu/drivers.rst b/Documentation/gpu/drivers.rst
index 3a52f48215a3..7e820c93d994 100644
--- a/Documentation/gpu/drivers.rst
+++ b/Documentation/gpu/drivers.rst
@@ -18,6 +18,7 @@ GPU Driver Documentation
    xen-front
    afbc
    komeda-kms
+   synaptics
 
 .. only::  subproject and html
 
diff --git a/Documentation/gpu/synaptics.rst b/Documentation/gpu/synaptics.rst
new file mode 100644
index 000000000000..a3b24c297186
--- /dev/null
+++ b/Documentation/gpu/synaptics.rst
@@ -0,0 +1,81 @@
+.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+
+================
+Synaptics Tiling
+================
+
+The tiling pixel formats in Synpatics Video Smart platform have
+many variants. Tiles could form the group of tiles, pixels within
+the group (nearest) width and height are stored into tile.
+Meanwhile, the tile in a group may not follow dimension layout,
+tile could form a small group of tiles, then that (sub)group
+of tiles would form a bigger group. We won't describe the dimension
+layout inside the group of tiles here. The layout of the group
+of tiles is fixed with the group width and height parameters
+in the same generation of the platform.
+
+Compression
+===========
+The proprietary lossless image compression protocol in Synaptics
+could minimizes the amount of data transferred (less memory bandwidth
+consumption) between devices. It would usually apply to the tiling
+pixel format.
+
+Each component would request an extra page aligned length buffer
+for storing the compression meta data. Also a 32 bytes parameters
+set would come with a compression meta data buffer.
+
+The component here corresponds to a signal type (i.e. Luma, chroma).
+They could be encoded into one or multiple metadata planes, but
+their compression parameters still would be individual.
+
+Pixel format modifiers
+======================
+Addition alignment requirement for stride and size of a memory plane
+could apply beyond what has been mentioned below. Remember always
+negotiating with all the devices in pipeline before allocation.
+
+.. flat-table:: Synpatics Image Format Modifiers
+
+  * - Identifier
+    - Fourcc
+    - Details
+
+  * - DRM_FORMAT_MOD_SYNA_V4H1
+    - DRM_FORMAT_NV12
+    - The plain uncompressed 8 bits tile format. It sounds similar to
+      Intel's Y-tile. but it won't take any pixel from the next X direction
+      in a tile group. The line stride and image height must be aligned to
+      a multiple of 16. The height of chrominance plane would plus 8.
+
+  * - DRM_FORMAT_MOD_SYNA_V4H3P8
+    - DRM_FORMAT_NV15
+    - The plain uncompressed 10 bits tile format. It stores pixel in 2D
+      3x4 tiles with a 8bits padding to each of tile. Then a tile is in a
+      128 bits cache line.
+
+  * - DRM_FORMAT_MOD_SYNA_V4H1_64L4_COMPRESSED
+    - DRM_FORMAT_NV12
+    - Group of tiles and compressed variant of ``DRM_FORMAT_MOD_SYNA_V4H1``.
+      A group of tiles would contain 64x4 pixels, where a tile has 1x4
+      pixel.
+
+  * - DRM_FORMAT_MOD_SYNA_V4H3P8_64L4_COMPRESSED
+    - DRM_FORMAT_NV15
+    - Group of tiles and compressed variant of ``DRM_FORMAT_MOD_SYNA_V4H3P8``.
+      A group of tiles would contains 48x4 pixels, where a tile has 3x4 pixels
+      and a 8 bits padding in the end of a tile. A group of tiles would
+      be 256 bytes.
+
+  * - ``DRM_FORMAT_MOD_SYNA_V4H1_128L128_COMPRESSED``
+    - DRM_FORMAT_NV12
+    - Group of tiles and compressed variant of ``DRM_FORMAT_MOD_SYNA_V4H1``.
+      A group of tiles would contain 128x32 pixels, where a tile has 1x4
+      pixel.
+
+  * - ``DRM_FORMAT_MOD_SYNA_V4H3P8_128L128_COMPRESSED``
+    - DRM_FORMAT_NV15
+    - Group of tiles and compressed variant of ``DRM_FORMAT_MOD_SYNA_V4H3P8``.
+      A group of tiles would contains 96x128 pixels, where a tile has 3x4 pixels
+      and a 8 bits padding in the end of a tile. A group of tiles would
+      be 16 KiB.
-- 
2.39.2

