Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C6BB1E637
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 12:13:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 880BF10E904;
	Fri,  8 Aug 2025 10:13:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="MkqC5Cz4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BA0310E904
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Aug 2025 10:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1754648010;
 bh=LZRxfKMpuPgfyyNWM5Qp7e2cOlzoGXkBOwyd3OgH5g4=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=MkqC5Cz4bRluAEk8mhJNxRS6iS5IgGDcK6h3ZZM+JGM/wFhm0WOYggw9YfMUqQTA1
 DoTI3hOE7SJeRuCsHbYfCbD+ZnwQcA688H+NhDY23ggMdcgfaJ9IlaXJoipkfvQpJ1
 oThhV5jQoJcy0NF5N6PWoeJjiwuq9mpZrKMz0L0DaHVjGfg2UBNHiQbvzn2hR3qU/T
 pxOcjLFLG8JpdCrg5/K/lIIY1PkquK4GDEB+J8lHhk+aYGot5MbgnVBFGx1Udx2JBH
 DkrLemIabWvY8Eui+2ufFQAya6xSrURaklz6Dj4ZiJVjkA28/Ten5W8J2zpNT48T23
 XvNv4phAtp8YQ==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr
 [83.113.51.247])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: laeyraud)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id D1F4517E01F5;
 Fri,  8 Aug 2025 12:13:29 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Fri, 08 Aug 2025 12:12:20 +0200
Subject: [PATCH v10 10/10] drm/mediatek: mtk_hdmi_v2: Add debugfs ops and
 implement ABIST
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-mediatek-drm-hdmi-v2-v10-10-21ea82eec1f6@collabora.com>
References: <20250808-mediatek-drm-hdmi-v2-v10-0-21ea82eec1f6@collabora.com>
In-Reply-To: <20250808-mediatek-drm-hdmi-v2-v10-0-21ea82eec1f6@collabora.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 CK Hu <ck.hu@mediatek.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754648002; l=4864;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=59N2cla9Emq1ytbntdF30iQ+szR28dGc6Xg6uqfCh0M=;
 b=KsUO3c5rhM4Dpkvtprk+n0IaAuO+WVQ3k4TjZj2ZB+L84ltxtsVbudlyKwRKPO6uj/nsV6wez
 xL3Ax+Ja+MnCi70mKqUAJIOBn0e0d3x90/hONPlDCR2g6XNTSvfhw1E
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
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

From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

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
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi_v2.c | 123 +++++++++++++++++++++++++++++++++
 1 file changed, 123 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c b/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
index 2e8d8aed3c47417200dd951755cc2e3ef41df75d..c272e1e74b7de03a726402f77296b05c87b24e05 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
@@ -1190,6 +1190,128 @@ static int mtk_hdmi_v2_hdmi_write_infoframe(struct drm_bridge *bridge,
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
@@ -1209,6 +1331,7 @@ static const struct drm_bridge_funcs mtk_v2_hdmi_bridge_funcs = {
 	.hdmi_tmds_char_rate_valid = mtk_hdmi_v2_hdmi_tmds_char_rate_valid,
 	.hdmi_clear_infoframe = mtk_hdmi_v2_hdmi_clear_infoframe,
 	.hdmi_write_infoframe = mtk_hdmi_v2_hdmi_write_infoframe,
+	.debugfs_init = mtk_hdmi_v2_debugfs_init,
 };
 
 /*

-- 
2.50.1

