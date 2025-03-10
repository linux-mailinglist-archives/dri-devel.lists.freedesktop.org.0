Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 003B1A5A3CD
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 20:28:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A0EC10E4C6;
	Mon, 10 Mar 2025 19:28:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com
 [95.215.58.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFA9610E4C6
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 19:28:18 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
 s=key1; t=1741634893;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9999RLa6slu4bV0OtUy1wWkUi/wxX/HStoyqP0HD3P4=;
 b=qXgdLNp0d4h9G8/m7acdcBeQNavvweFagi4uC6smbHQ1aDPdXPoBeUOHdaPUNvChCPJVwn
 1Wr6qvwLkcETt6CJ8fZRREoLQQRfuFhEqIEMkkZ4x3ZxTRit1cQS9fA+LlPFtZz5/PwhjA
 Fh133JPQOztjssgJCe7xZckkFKu5UfEAAONXWOF0+QGzNGNtrYENG/NtwdxySB6EjrnBNm
 vni4NSdUj/1DNVLeEeeeuHJnQC5s2k9MW90kqpi09vty0Mv79F+qQjD9Hi7c0UXRImqhiU
 zb9FVpar6CzAdrVQBDghq7Trzn920UZa2ADa3dwK4Djc8Sg9oKtDLkoEeLID2g==
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Date: Mon, 10 Mar 2025 15:28:02 -0400
Subject: [PATCH v4] drm: add modifiers for Apple GPU layouts
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250310-apple-twiddled-modifiers-v4-1-1ccac9544808@rosenzweig.io>
X-B4-Tracking: v=1; b=H4sIAEE9z2cC/43NywrCMBCF4VcpWRtJJk0vrnwPcdE0k3agNiWRe
 qPvbnSjiIjL/8B8c2MRA2Fkm+zGAs4UyY8p8lXG2r4ZO+RkUzMQoAXIijfTNCA/nsjaAS0/eEu
 OMETuLMqmcLkSomXpfAro6Pykd/vUPcWjD5fnp1k+1j/QWXLJK62laUyuQLpt8BHH6wmpW5NnD
 3iGNwz0DwwS1rqiLqHGqnTFN0y9MCXkD0wlLDe1MWVdgXb4iS3LcgffJDY/XgEAAA==
X-Change-ID: 20250218-apple-twiddled-modifiers-fde1a6f4300c
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, Faith Ekstrand <faith.ekstrand@collabora.com>, 
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>
X-Developer-Signature: v=1; a=openpgp-sha256; l=4815; i=alyssa@rosenzweig.io; 
 h=from:subject:message-id;
 bh=UIAR8pl5wDADA7Rf+rS4oV7FqF5qP3rt9mHR+3I6SKc=; 
 b=owEBbQKS/ZANAwAIAf7+UFoK9VgNAcsmYgBnzz1FFpf0BBtQsMU7Scsn1bEOO2j/hrvcKvaJn
 ytwhricu6WJAjMEAAEIAB0WIQRDXuCbsK8A0B2q9jj+/lBaCvVYDQUCZ889RQAKCRD+/lBaCvVY
 DQ+jD/0f+40M05Qu7kldwLeLL73Ab9aAi2e3bzaugXnMnU3PJ++Q7l6RTlhQVMteMz9zICzQKgr
 j/DTiOWjPDQIhm8l7gvVCPOgxLcri9D1dm1IPQGmbbjZ7ojvLTSUHQlg8+q/QK+o2p+E4jyndy+
 gc1Ln3GkcWqec60U4LEIf3ca8HdJ1LeDVxv7fAzxsTkhrowvS6siuB5y63AZKaArAbGOhLQ4GaO
 7NQWBrc/ri9ZUlv7kTL0nzgSUWBpJb7k2IoZoz9cxQk2k3vkwqHeTTyu+YycOyjmsgsAXDxMtfE
 CwXPbPshxO6w1z4R975TVcWjQOTxpXT2NFGv+cAgGJ5T/aI7gXVgvf7CZfM8EAoCwvZ/ZWqpxm7
 wP1mvYBAOUJzaVJVBrlushez4EvhB90Qcn1hx4rBjTtPRahE8nvYzRvlvAvp1xpsFBVxiJD673T
 g73CYSZ7kCp3BQcRHLBCbzkOdCNvmPoYlQHiMxHoHvokNZEUQozpcRxLTqAds05GPl26t8rXWN/
 uH2tUy/5b/HYBydfTZtqpGkwnMfVLOEZ/zFLxKG/rSvEMOs1ljtUHvl8jnICspmYNd8wS6y4QKk
 2UWmhhUht4eB1oEgFpLqvmOqZ94n0O5s43bxEaI8+aMXdj9R3WD7F5J7Z7OBJrpBGaDacQdRStX
 VZUE1xpsOzEjwBg==
X-Developer-Key: i=alyssa@rosenzweig.io; a=openpgp;
 fpr=435EE09BB0AF00D01DAAF638FEFE505A0AF5580D
X-Migadu-Flow: FLOW_OUT
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

Apple GPUs support non-linear "GPU-tiled" image layouts. Add modifiers
for these layouts. Mesa requires these modifiers to share non-linear
buffers across processes, but no other userspace or kernel support is
required/expected.

These layouts are notably not used for interchange across hardware
blocks (e.g. with the display controller). There are other layouts for
that but we don't support them either in userspace or kernelspace yet
(even downstream), so we don't add modifiers here.

Acked-by: Faith Ekstrand <faith.ekstrand@collabora.com>
Reviewed-by: Sven Peter <sven@svenpeter.dev>
Signed-off-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
---
Changes in v4:
- Remove twiddled modifiers as it is only used for sparse and therefore
  not shareable and therefore doesn't need a modifier.
- Reflow comments accordingly.
- Increase alignment to 128B out of abundance of caution.
- Collect acks.
- Link to v3: https://lore.kernel.org/r/20250301-apple-twiddled-modifiers-v3-1-4b9bb79825fe@rosenzweig.io

Changes in v3:
- Condense comments for clarity and concision.
- Add text explaining strides and planes with justification.
- Add table giving tile sizes for GPU tiled images.
- Tighten up wording.
- Link to v2: https://lore.kernel.org/r/20250225-apple-twiddled-modifiers-v2-1-cf69729e87f6@rosenzweig.io

Changes in v2:
- Rename "Twiddled" to "GPU-tiled" to match what I now believe is the canonical name.
- Add modifiers for the actual "Twiddled" layouts.
- Clarify that the body of compressed images are laid out like their
  uncompressed counterparts.
- Link to v1: https://lore.kernel.org/r/20250218-apple-twiddled-modifiers-v1-1-8551bab4321f@rosenzweig.io
---
 include/uapi/drm/drm_fourcc.h | 45 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index e41a3cec6a9ed18760f3b0c88ba437c9aba3dd4f..81202a50dc9e2e4363abba91ca164b30d5b2f71d 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -422,6 +422,7 @@ extern "C" {
 #define DRM_FORMAT_MOD_VENDOR_ALLWINNER 0x09
 #define DRM_FORMAT_MOD_VENDOR_AMLOGIC 0x0a
 #define DRM_FORMAT_MOD_VENDOR_MTK     0x0b
+#define DRM_FORMAT_MOD_VENDOR_APPLE   0x0c
 
 /* add more to the end as needed */
 
@@ -1494,6 +1495,50 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
 /* alias for the most common tiling format */
 #define DRM_FORMAT_MOD_MTK_16L_32S_TILE  DRM_FORMAT_MOD_MTK(MTK_FMT_MOD_TILE_16L32S)
 
+/*
+ * Apple GPU-tiled layouts.
+ *
+ * Apple GPUs support nonlinear tilings with optional lossless compression.
+ *
+ * GPU-tiled images are divided into 16KiB tiles:
+ *
+ *     Bytes per pixel  Tile size
+ *     ---------------  ---------
+ *                   1  128x128
+ *                   2  128x64
+ *                   4  64x64
+ *                   8  64x32
+ *                  16  32x32
+ *
+ * Tiles are raster-order. Pixels within a tile are interleaved (Morton order).
+ *
+ * Compressed images pad the body to 128-bytes and are immediately followed by a
+ * metadata section. The metadata section rounds the image dimensions to
+ * powers-of-two and contains 8 bytes for each 16x16 compression subtile.
+ * Subtiles are interleaved (Morton order).
+ *
+ * All images are 128-byte aligned.
+ *
+ * These layouts fundamentally do not have meaningful strides. No matter how we
+ * specify strides for these layouts, userspace unaware of Apple image layouts
+ * will be unable to use correctly the specified stride for any purpose.
+ * Userspace aware of the image layouts do not use strides. The most "correct"
+ * convention would be setting the image stride to 0. Unfortunately, some
+ * software assumes the stride is at least (width * bytes per pixel). We
+ * therefore require that stride equals (width * bytes per pixel). Since the
+ * stride is arbitrary here, we pick the simplest convention.
+ *
+ * Although containing two sections, compressed image layouts are treated in
+ * software as a single plane. This is modelled after AFBC, a similar
+ * scheme. Attempting to separate the sections to be "explicit" in DRM would
+ * only generate more confusion, as software does not treat the image this way.
+ *
+ * For detailed information on the hardware image layouts, see
+ * https://docs.mesa3d.org/drivers/asahi.html#image-layouts
+ */
+#define DRM_FORMAT_MOD_APPLE_GPU_TILED fourcc_mod_code(APPLE, 1)
+#define DRM_FORMAT_MOD_APPLE_GPU_TILED_COMPRESSED fourcc_mod_code(APPLE, 2)
+
 /*
  * AMD modifiers
  *

---
base-commit: 0ed1356af8f629ae807963b7db4e501e3b580bc2
change-id: 20250218-apple-twiddled-modifiers-fde1a6f4300c

Best regards,
-- 
Alyssa Rosenzweig <alyssa@rosenzweig.io>

