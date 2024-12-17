Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71BF49F4FAF
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 16:44:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98D6A10E9DC;
	Tue, 17 Dec 2024 15:43:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="jda6xm3x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [IPv6:2a01:4f8:201:9162::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBBDF10E2FA
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 15:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1734450233;
 bh=qou8FRG6wfCQblYalK/e8GWmOLSjRBX+IlyVTdAwo4M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jda6xm3xcWOzp80srT/Qb9lR1Z/CJEV/UNGeGthwxNoal1IDJzfiRs8w3W+6eXfsu
 82GPr2MFM6NOYwvCRjj8wxgq/FLGi1NeG4lB802WschKD6/Lu1ZPIKWNUrfIrfP4QC
 pbDsqHasT9UVLr061ef5pB41rO8cl53CibGToOeR6Sgw/w+aS6FEh9b2tauA2V8uEZ
 RA089r3g4X8snpbebATmNix7VaIKAYEVbX6lYGwWzfmN7U9IalHcJgJaM/GUbrW9k3
 hnN/gvG7pmf7R6NiDcqweljbw2VKP/Q67ebGKFp3sUI7y1/Wm38FMoDkaN4n30UI9F
 O6jQ3T4CdgFUw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 5853C17E378C;
 Tue, 17 Dec 2024 16:43:52 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 ck.hu@mediatek.com, jitao.shi@mediatek.com, jie.qiu@mediatek.com,
 junzhi.zhao@mediatek.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, dmitry.baryshkov@linaro.org
Subject: [PATCH v3 02/33] drm/mediatek: mtk_dpi: Add support for Pattern
 Generator in debugfs
Date: Tue, 17 Dec 2024 16:43:14 +0100
Message-ID: <20241217154345.276919-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241217154345.276919-1-angelogioacchino.delregno@collabora.com>
References: <20241217154345.276919-1-angelogioacchino.delregno@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This IP includes a Pattern Generator which is useful for debugging
and testing purposes: add the relevant register and bits to the
mtk_dpi_regs.h header, and implement support for it in mtk_dpi.

Adding this required to introduce a .debugfs_init() callback for
the DPI bridge, which creates a "dpi_test_pattern" file in the
directory of the appropriate connector.

The pattern generator can generate various internal patterns and
this submission includes support for:
 - 256 or 1024 shades of gray in a Vertical or Horizontal Pattern
 - Vertical Color Bars
 - Frame border
 - Dot Moire

This generator also supports filling the entire screen with one
custom color, but support for that is not included in this commit.

Enabling and disabling this generator can be done by sending a
string to the dpi_test_pattern debugfs file; the pattern is
expected to be formatted as follows:

         <enable (1) or disable (0)> <pattern number>

where the pattern number can be a number from 0 to 7, excluding 5.

Of course 5 is excluded because that activates custom color fill
which, again, is not supported in this commit.

Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c      | 107 ++++++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_dpi_regs.h |   4 +
 2 files changed, 111 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 1864eb02dbf5..4194ac328b0b 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -6,6 +6,7 @@
 
 #include <linux/clk.h>
 #include <linux/component.h>
+#include <linux/debugfs.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/media-bus-format.h>
@@ -166,6 +167,18 @@ static void mtk_dpi_mask(struct mtk_dpi *dpi, u32 offset, u32 val, u32 mask)
 	writel(tmp, dpi->regs + offset);
 }
 
+static void mtk_dpi_test_pattern_en(struct mtk_dpi *dpi, u8 type, bool enable)
+{
+	u32 val;
+
+	if (enable)
+		val = FIELD_PREP(DPI_PAT_SEL, type) | DPI_PAT_EN;
+	else
+		val = 0;
+
+	mtk_dpi_mask(dpi, DPI_PATTERN0, val, DPI_PAT_SEL | DPI_PAT_EN);
+}
+
 static void mtk_dpi_sw_reset(struct mtk_dpi *dpi, bool reset)
 {
 	mtk_dpi_mask(dpi, DPI_RET, reset ? RST : 0, RST);
@@ -767,6 +780,99 @@ mtk_dpi_bridge_mode_valid(struct drm_bridge *bridge,
 	return MODE_OK;
 }
 
+static int mtk_dpi_debug_tp_show(struct seq_file *m, void *arg)
+{
+	struct mtk_dpi *dpi = m->private;
+	bool en;
+	u32 val;
+
+	if (!dpi)
+		return -EINVAL;
+
+	val = readl(dpi->regs + DPI_PATTERN0);
+	en = val & DPI_PAT_EN;
+	val = FIELD_GET(DPI_PAT_SEL, val);
+
+	seq_printf(m, "DPI Test Pattern: %s\n", en ? "Enabled" : "Disabled");
+
+	if (en) {
+		seq_printf(m, "Internal pattern %d: ", val);
+		switch (val) {
+		case 0:
+			seq_puts(m, "256 Vertical Gray\n");
+			break;
+		case 1:
+			seq_puts(m, "1024 Vertical Gray\n");
+			break;
+		case 2:
+			seq_puts(m, "256 Horizontal Gray\n");
+			break;
+		case 3:
+			seq_puts(m, "1024 Horizontal Gray\n");
+			break;
+		case 4:
+			seq_puts(m, "Vertical Color bars\n");
+			break;
+		case 6:
+			seq_puts(m, "Frame border\n");
+			break;
+		case 7:
+			seq_puts(m, "Dot moire\n");
+			break;
+		default:
+			seq_puts(m, "Invalid selection\n");
+			break;
+		}
+	}
+
+	return 0;
+}
+
+static ssize_t mtk_dpi_debug_tp_write(struct file *file, const char __user *ubuf,
+				      size_t len, loff_t *offp)
+{
+	struct seq_file *m = file->private_data;
+	u32 en, type;
+	char buf[6];
+
+	if (!m || !m->private || *offp || len > sizeof(buf) - 1)
+		return -EINVAL;
+
+	memset(buf, 0, sizeof(buf));
+	if (copy_from_user(buf, ubuf, len))
+		return -EFAULT;
+
+	if (sscanf(buf, "%u %u", &en, &type) != 2)
+		return -EINVAL;
+
+	if (en < 0 || en > 1 || type < 0 || type > 7)
+		return -EINVAL;
+
+	mtk_dpi_test_pattern_en((struct mtk_dpi *)m->private, type, en);
+	return len;
+}
+
+static int mtk_dpi_debug_tp_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, mtk_dpi_debug_tp_show, inode->i_private);
+}
+
+static const struct file_operations mtk_dpi_debug_tp_fops = {
+	.owner = THIS_MODULE,
+	.open = mtk_dpi_debug_tp_open,
+	.read = seq_read,
+	.write = mtk_dpi_debug_tp_write,
+	.llseek = seq_lseek,
+	.release = single_release,
+};
+
+static void mtk_dpi_debugfs_init(struct drm_bridge *bridge, struct dentry *root)
+{
+	struct mtk_dpi *dpi = bridge_to_dpi(bridge);
+
+	debugfs_create_file("dpi_test_pattern", 0640, root, dpi, &mtk_dpi_debug_tp_fops);
+}
+
 static const struct drm_bridge_funcs mtk_dpi_bridge_funcs = {
 	.attach = mtk_dpi_bridge_attach,
 	.mode_set = mtk_dpi_bridge_mode_set,
@@ -779,6 +885,7 @@ static const struct drm_bridge_funcs mtk_dpi_bridge_funcs = {
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.debugfs_init = mtk_dpi_debugfs_init,
 };
 
 void mtk_dpi_start(struct device *dev)
diff --git a/drivers/gpu/drm/mediatek/mtk_dpi_regs.h b/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
index 62bd4931b344..a0b1d18bbbf7 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
+++ b/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
@@ -235,4 +235,8 @@
 #define MATRIX_SEL_RGB_TO_JPEG		0
 #define MATRIX_SEL_RGB_TO_BT601		2
 
+#define DPI_PATTERN0		0xf00
+#define DPI_PAT_EN			BIT(0)
+#define DPI_PAT_SEL			GENMASK(6, 4)
+
 #endif /* __MTK_DPI_REGS_H */
-- 
2.47.0

