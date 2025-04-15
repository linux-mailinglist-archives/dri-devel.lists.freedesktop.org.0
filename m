Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCA4A89AAD
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 12:44:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA50A10E71D;
	Tue, 15 Apr 2025 10:44:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="H0GcVP4N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D52110E720
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 10:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1744713848;
 bh=xh7Jj9EwZ14z10Z5YmH2kybmKZ8PUNlCUMcMfNXz5ow=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=H0GcVP4NzvA1Xb/LixrkEuPOh9lBAgvyY+YWlLvxVXJdSASm7CzedyjhX+ZMiFVzV
 KDYppK/mxYep+iSKfSrJBLXJD/wqcE566DwkwMwqNOmiLwkaW4UA32w+saCGVRwiLN
 7l88q2RwRRrRLQbAD8TFGaZ9hGbIog/AuZiEzw1I74hiNVW9ngFCGFMrXtmSx8kCWk
 iSfV+OX6i2TpTNriz3kSl9rBQ+1rh2E62ZdxIgjCg3fr3+X7KJFqkPBLxeXbWkdPqt
 W9dRNMLBWW1a+dY7iKMHvWGZAkwn/xDA0yuzm/f1oLEzVtR296ggt0W1PJpG3+BNcc
 q93y/0RhL4VZw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 5BC0017E35E5;
 Tue, 15 Apr 2025 12:44:07 +0200 (CEST)
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
 kernel@collabora.com, dmitry.baryshkov@linaro.org, lewis.liao@mediatek.com,
 ives.chenjh@mediatek.com, tommyyl.chen@mediatek.com,
 jason-jh.lin@mediatek.com
Subject: [PATCH v9 23/23] drm/mediatek: mtk_hdmi_v2: Add debugfs ops and
 implement ABIST
Date: Tue, 15 Apr 2025 12:43:21 +0200
Message-ID: <20250415104321.51149-24-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250415104321.51149-1-angelogioacchino.delregno@collabora.com>
References: <20250415104321.51149-1-angelogioacchino.delregno@collabora.com>
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

Implement the Automated Built-In Self-Test ABIST functionality
provided by the HDMIv2 IP and expose it through the "hdmi_abist"
debugfs file.

Write "1" to this file to activate ABIST, or "0" to deactivate.

The ABIST functionality can be used to validate that the HDMI
Transmitter itself works and that can output a valid image to
the HDMI Display that is connected.

This is especially useful when trying to rule out any possible
issue that is related to the display pipeline, as the HDMI Tx
is always the last component; this means that HDMI ABIST can be
used even without prior display controller pipeline configuration.

The expected output is a 100% color bar (rainbow) test pattern.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi_v2.c | 123 +++++++++++++++++++++++++
 1 file changed, 123 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c b/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
index dd10f272eabd..284d5cc0cffd 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
@@ -1188,6 +1188,128 @@ static int mtk_hdmi_v2_hdmi_write_infoframe(struct drm_bridge *bridge,
 	return 0;
 }
 
+static int mtk_hdmi_v2_set_abist(struct mtk_hdmi *hdmi, bool enable)
+{
+	struct drm_display_mode *mode = &hdmi->mode;
+	int abist_format = -EINVAL;
+	bool interlaced;
+
+	if (!enable) {
+		regmap_clear_bits(hdmi->regs, TOP_CFG00, HDMI_ABIST_ENABLE);
+		return 0;
+	}
+
+	if (!mode->hdisplay || !mode->vdisplay)
+		return -EINVAL;
+
+	interlaced = mode->flags & DRM_MODE_FLAG_INTERLACE;
+
+	switch (mode->hdisplay) {
+	case 720:
+		if (mode->vdisplay == 480)
+			abist_format = 2;
+		else if (mode->vdisplay == 576)
+			abist_format = 11;
+		break;
+	case 1280:
+		if (mode->vdisplay == 720)
+			abist_format = 3;
+		break;
+	case 1440:
+		if (mode->vdisplay == 480)
+			abist_format = interlaced ? 5 : 9;
+		else if (mode->vdisplay == 576)
+			abist_format = interlaced ? 14 : 18;
+		break;
+	case 1920:
+		if (mode->vdisplay == 1080)
+			abist_format = interlaced ? 4 : 10;
+		break;
+	case 3840:
+		if (mode->vdisplay == 2160)
+			abist_format = 25;
+		break;
+	case 4096:
+		if (mode->vdisplay == 2160)
+			abist_format = 26;
+		break;
+	default:
+		break;
+	}
+	if (abist_format < 0)
+		return abist_format;
+
+	regmap_update_bits(hdmi->regs, TOP_CFG00, HDMI_ABIST_VIDEO_FORMAT,
+			   FIELD_PREP(HDMI_ABIST_VIDEO_FORMAT, abist_format));
+	regmap_set_bits(hdmi->regs, TOP_CFG00, HDMI_ABIST_ENABLE);
+	return 0;
+}
+
+static int mtk_hdmi_v2_debug_abist_show(struct seq_file *m, void *arg)
+{
+	struct mtk_hdmi *hdmi = m->private;
+	bool en;
+	u32 val;
+	int ret;
+
+	if (!hdmi)
+		return -EINVAL;
+
+	ret = regmap_read(hdmi->regs, TOP_CFG00, &val);
+	if (ret)
+		return ret;
+
+	en = FIELD_GET(HDMI_ABIST_ENABLE, val);
+
+	seq_printf(m, "HDMI Automated Built-In Self Test: %s\n",
+		   en ? "Enabled" : "Disabled");
+
+	return 0;
+}
+
+static ssize_t mtk_hdmi_v2_debug_abist_write(struct file *file,
+					     const char __user *ubuf,
+					     size_t len, loff_t *offp)
+{
+	struct seq_file *m = file->private_data;
+	int ret;
+	u32 en;
+
+	if (!m || !m->private || *offp)
+		return -EINVAL;
+
+	ret = kstrtouint_from_user(ubuf, len, 0, &en);
+	if (ret)
+		return ret;
+
+	if (en < 0 || en > 1)
+		return -EINVAL;
+
+	mtk_hdmi_v2_set_abist((struct mtk_hdmi *)m->private, en);
+	return len;
+}
+
+static int mtk_hdmi_v2_debug_abist_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, mtk_hdmi_v2_debug_abist_show, inode->i_private);
+}
+
+static const struct file_operations mtk_hdmi_debug_abist_fops = {
+	.owner = THIS_MODULE,
+	.open = mtk_hdmi_v2_debug_abist_open,
+	.read = seq_read,
+	.write = mtk_hdmi_v2_debug_abist_write,
+	.llseek = seq_lseek,
+	.release = single_release,
+};
+
+static void mtk_hdmi_v2_debugfs_init(struct drm_bridge *bridge, struct dentry *root)
+{
+	struct mtk_hdmi *dpi = hdmi_ctx_from_bridge(bridge);
+
+	debugfs_create_file("hdmi_abist", 0640, root, dpi, &mtk_hdmi_debug_abist_fops);
+}
+
 static const struct drm_bridge_funcs mtk_v2_hdmi_bridge_funcs = {
 	.attach = mtk_hdmi_v2_bridge_attach,
 	.detach = mtk_hdmi_v2_bridge_detach,
@@ -1207,6 +1329,7 @@ static const struct drm_bridge_funcs mtk_v2_hdmi_bridge_funcs = {
 	.hdmi_tmds_char_rate_valid = mtk_hdmi_v2_hdmi_tmds_char_rate_valid,
 	.hdmi_clear_infoframe = mtk_hdmi_v2_hdmi_clear_infoframe,
 	.hdmi_write_infoframe = mtk_hdmi_v2_hdmi_write_infoframe,
+	.debugfs_init = mtk_hdmi_v2_debugfs_init,
 };
 
 /*
-- 
2.49.0

