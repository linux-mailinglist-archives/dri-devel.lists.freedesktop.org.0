Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1678AE2C1
	for <lists+dri-devel@lfdr.de>; Tue, 23 Apr 2024 12:47:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ADB510F067;
	Tue, 23 Apr 2024 10:47:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aFdzmB31";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDA321132C5
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 10:46:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 49D0ACE0AB2;
 Tue, 23 Apr 2024 10:46:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DF05C2BD11;
 Tue, 23 Apr 2024 10:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713869210;
 bh=yBVGbOn1bf7ryiz3KRf1IjjU0UqAVQczNOu1n0TpvrU=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=aFdzmB31TWK3HyErEcJhUWl4Kviv2rIPrMuB/zl0MCNTX07Qw7kKuDtUXAsXM9qax
 bb2eY2bbL3zoVxfvQNeyuiBcZFijfG3VXnYac/r1hNH+m2VxLgfkx+hB8Nv1P2fOjm
 UQAbN7XTEUiTLyX5ICX1TnN4Pb10BV/psEntuoxVzEu8NUHQEMcMc1eKkkVtiAg/j5
 mTi9ToEa8g+S8NZYrgKxTh+oMF1W2JNDuvYwW6SBGJb2PjoprQVo5Kr1NNapDZl0h/
 T8cBd8ET4BANlFfbQpEbw2tTAH4BgfoQ/89HbbndHswycvx9PQDUHp3hMOdOy9lHcY
 s4ZKdCE63QRdA==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 23 Apr 2024 12:45:52 +0200
Subject: [PATCH v12 23/28] drm/connector: hdmi: Create Infoframe DebugFS
 entries
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240423-kms-hdmi-connector-state-v12-23-3338e4c0b189@kernel.org>
References: <20240423-kms-hdmi-connector-state-v12-0-3338e4c0b189@kernel.org>
In-Reply-To: <20240423-kms-hdmi-connector-state-v12-0-3338e4c0b189@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Andy Yan <andy.yan@rock-chips.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, 
 Sebastian Wick <sebastian.wick@redhat.com>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5419; i=mripard@kernel.org;
 h=from:subject:message-id; bh=yBVGbOn1bf7ryiz3KRf1IjjU0UqAVQczNOu1n0TpvrU=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDGnqE0NNu/LKxL+yvV55zuny+QTpOeafMw7ci4wzXfzu/
 9pr9ZYqHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAi3NqMDS16plIWUw1WHmcL
 bC49kmdUejxl9ts/m5afmcX473fh2rbZy9tDX+wsmFg/oUgoMCxWmLFh0/lDV89e/2S+YedyB4n
 rbs4C2s8fNE35/irP51nf0we7T/TZOh9NDOz1WrzjNftLRVk7AA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

There has been some discussions recently about the infoframes sent by
drivers and if they were properly generated.

In parallel, there's been some interest in creating an infoframe-decode
tool similar to edid-decode.

Both would be much easier if we were to expose the infoframes programmed
in the hardware. It won't be perfect since we have no guarantee that
it's actually what goes through the wire, but it's the best we can do.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_debugfs.c | 152 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 152 insertions(+)

diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index 08fcefd804bc..dd39a5b7a711 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -518,10 +518,160 @@ static const struct file_operations drm_connector_fops = {
 	.llseek = seq_lseek,
 	.release = single_release,
 	.write = connector_write
 };
 
+#define HDMI_MAX_INFOFRAME_SIZE		29
+
+static ssize_t
+audio_infoframe_read(struct file *filp, char __user *ubuf, size_t count, loff_t *ppos)
+{
+	struct drm_connector_hdmi_infoframe *infoframe;
+	struct drm_connector *connector;
+	union hdmi_infoframe *frame;
+	u8 buf[HDMI_INFOFRAME_SIZE(AUDIO)];
+	ssize_t len = 0;
+
+	connector = filp->private_data;
+	mutex_lock(&connector->hdmi.infoframes.lock);
+
+	infoframe = &connector->hdmi.infoframes.audio;
+	if (!infoframe->set)
+		goto out;
+
+	frame = &infoframe->data;
+	len = hdmi_infoframe_pack(frame, buf, sizeof(buf));
+	if (len < 0)
+		goto out;
+
+	len = simple_read_from_buffer(ubuf, count, ppos, buf, len);
+
+out:
+	mutex_unlock(&connector->hdmi.infoframes.lock);
+	return len;
+}
+
+static const struct file_operations audio_infoframe_fops = {
+	.owner   = THIS_MODULE,
+	.open    = simple_open,
+	.read    = audio_infoframe_read,
+};
+
+static int create_hdmi_audio_infoframe_file(struct drm_connector *connector,
+					    struct dentry *parent)
+{
+	struct dentry *file;
+
+	file = debugfs_create_file("audio", 0400, parent, connector, &audio_infoframe_fops);
+	if (IS_ERR(file))
+		return PTR_ERR(file);
+
+	return 0;
+}
+
+#define DEFINE_INFOFRAME_FILE(_f) \
+static ssize_t _f##_read_infoframe(struct file *filp, \
+				   char __user *ubuf, \
+				   size_t count,      \
+				   loff_t *ppos)      \
+{ \
+	struct drm_connector_hdmi_infoframe *infoframe; \
+	struct drm_connector_state *conn_state; \
+	struct drm_connector *connector; \
+	union hdmi_infoframe *frame; \
+	struct drm_device *dev; \
+	u8 buf[HDMI_MAX_INFOFRAME_SIZE]; \
+	ssize_t len = 0; \
+	\
+	connector = filp->private_data; \
+	dev = connector->dev; \
+	\
+	drm_modeset_lock(&dev->mode_config.connection_mutex, NULL); \
+	\
+	conn_state = connector->state; \
+	infoframe = &conn_state->hdmi.infoframes._f; \
+	if (!infoframe->set) \
+		goto out; \
+	\
+	frame = &infoframe->data; \
+	len = hdmi_infoframe_pack(frame, buf, sizeof(buf)); \
+	if (len < 0) \
+		goto out; \
+	\
+	len = simple_read_from_buffer(ubuf, count, ppos, buf, len); \
+	\
+out: \
+	drm_modeset_unlock(&dev->mode_config.connection_mutex); \
+	return len; \
+} \
+\
+static const struct file_operations _f##_infoframe_fops = { \
+	.owner = THIS_MODULE, \
+	.open = simple_open, \
+	.read = _f##_read_infoframe, \
+}; \
+\
+static int create_hdmi_## _f ## _infoframe_file (struct drm_connector *connector, \
+						 struct dentry *parent) \
+{ \
+	struct dentry *file; \
+	\
+	file = debugfs_create_file(#_f, 0400, parent, connector, & _f ## _infoframe_fops); \
+	if (IS_ERR(file)) \
+		return PTR_ERR(file); \
+	\
+	return 0; \
+}
+
+DEFINE_INFOFRAME_FILE(avi);
+DEFINE_INFOFRAME_FILE(hdmi);
+DEFINE_INFOFRAME_FILE(hdr_drm);
+DEFINE_INFOFRAME_FILE(spd);
+
+static int create_hdmi_infoframe_files(struct drm_connector *connector,
+				       struct dentry *parent)
+{
+	int ret;
+
+	ret = create_hdmi_audio_infoframe_file(connector, parent);
+	if (ret)
+		return ret;
+
+	ret = create_hdmi_avi_infoframe_file(connector, parent);
+	if (ret)
+		return ret;
+
+	ret = create_hdmi_hdmi_infoframe_file(connector, parent);
+	if (ret)
+		return ret;
+
+	ret = create_hdmi_hdr_drm_infoframe_file(connector, parent);
+	if (ret)
+		return ret;
+
+	ret = create_hdmi_spd_infoframe_file(connector, parent);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static void hdmi_debugfs_add(struct drm_connector *connector)
+{
+	struct dentry *dir;
+
+	if (!(connector->connector_type == DRM_MODE_CONNECTOR_HDMIA ||
+	      connector->connector_type == DRM_MODE_CONNECTOR_HDMIB))
+		return;
+
+	dir = debugfs_create_dir("infoframes", connector->debugfs_entry);
+	if (IS_ERR(dir))
+		return;
+
+	create_hdmi_infoframe_files(connector, dir);
+}
+
 void drm_debugfs_connector_add(struct drm_connector *connector)
 {
 	struct drm_device *dev = connector->dev;
 	struct dentry *root;
 
@@ -545,10 +695,12 @@ void drm_debugfs_connector_add(struct drm_connector *connector)
 
 	/* max bpc */
 	debugfs_create_file("output_bpc", 0444, root, connector,
 			    &output_bpc_fops);
 
+	hdmi_debugfs_add(connector);
+
 	if (connector->funcs->debugfs_init)
 		connector->funcs->debugfs_init(connector, root);
 }
 
 void drm_debugfs_connector_remove(struct drm_connector *connector)

-- 
2.44.0

