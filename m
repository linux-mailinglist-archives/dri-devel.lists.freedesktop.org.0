Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B70AA77BAB4
	for <lists+dri-devel@lfdr.de>; Mon, 14 Aug 2023 15:57:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D41B410E20C;
	Mon, 14 Aug 2023 13:57:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7056A10E20B
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Aug 2023 13:56:58 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D4B6A61796;
 Mon, 14 Aug 2023 13:56:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9043C433C8;
 Mon, 14 Aug 2023 13:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692021417;
 bh=nN7A8aX650BJayqTH47PuZ20wjfgMPZ8NkgLMf28J08=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Fog9q62hsfReC7FGCvqSNnMF1whoWFVhYEG9/nafcBXtHi2+RdzOUOvBe1zfcU0eC
 5tBO3GLSKjyZTpIJtWn8TD38IloC6/SirAA63RdpxgtX6Bwpu+UnTyEP9rjzxSYuvk
 1LllQgoGyDv/HHI67lH1//CEiywsiAcrvnMZM+we8EYhj5hDwZ9CMWr61GGwFXLPH6
 f9q6JqcBiY9wVF3wUVGH8bylZFcEKOnFdAWMCS+1dnd/j1qbavn70n62+yD1ILfrhb
 VTueLBY1PiJbeUfBFU3ZtIXsm7StVNnalgB8FfUAtpFe41hw/Dt2vrJAMlbLxvkjoA
 rH5BEpshpnNaA==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 14 Aug 2023 15:56:23 +0200
Subject: [PATCH RFC 11/13] drm/connector: hdmi: Create Infoframe DebugFS
 entries
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230814-kms-hdmi-connector-state-v1-11-048054df3654@kernel.org>
References: <20230814-kms-hdmi-connector-state-v1-0-048054df3654@kernel.org>
In-Reply-To: <20230814-kms-hdmi-connector-state-v1-0-048054df3654@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5070; i=mripard@kernel.org;
 h=from:subject:message-id; bh=nN7A8aX650BJayqTH47PuZ20wjfgMPZ8NkgLMf28J08=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCm3jNp0zn/at0gv6fEib6aQwIP+0xssXsyVaYh8tTVdO
 sVbyFiso5SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABMRFWFk+P5fdjrHhG0/JZ9O
 fZhi6ucwaRrPO/cAYRPFMwqXVDVP7mX4nxhdpP10wV7NyPhm5qvxB1kX170PCZe7wPXtglzz3tL
 bfAA=
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
Cc: Hans Verkuil <hverkuil@xs4all.nl>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
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
 drivers/gpu/drm/drm_hdmi_connector.c | 124 +++++++++++++++++++++++++++++++++++
 include/drm/drm_connector.h          |   4 ++
 2 files changed, 128 insertions(+)

diff --git a/drivers/gpu/drm/drm_hdmi_connector.c b/drivers/gpu/drm/drm_hdmi_connector.c
index 46cafb17def7..dcc45b1080f9 100644
--- a/drivers/gpu/drm/drm_hdmi_connector.c
+++ b/drivers/gpu/drm/drm_hdmi_connector.c
@@ -907,6 +907,130 @@ void drm_atomic_helper_hdmi_connector_print_state(struct drm_printer *p,
 }
 EXPORT_SYMBOL(drm_atomic_helper_hdmi_connector_print_state);
 
+struct debugfs_wrapper {
+	struct drm_hdmi_connector *hdmi_connector;
+	union hdmi_infoframe *frame;
+};
+
+static ssize_t
+infoframe_read(struct file *filp, char __user *ubuf, size_t count, loff_t *ppos)
+{
+	const struct debugfs_wrapper *wrapper = filp->private_data;
+	struct drm_hdmi_connector *hdmi_connector = wrapper->hdmi_connector;
+	union hdmi_infoframe *frame = wrapper->frame;
+	u8 buf[HDMI_MAX_INFOFRAME_SIZE];
+	ssize_t len;
+
+	len = hdmi_infoframe_pack(frame, buf, sizeof(buf));
+	if (len < 0)
+		return len;
+
+	mutex_lock(&hdmi_connector->infoframes.lock);
+	len = simple_read_from_buffer(ubuf, count, ppos, buf, len);
+	mutex_unlock(&hdmi_connector->infoframes.lock);
+
+	return len;
+}
+
+static const struct file_operations infoframe_fops = {
+	.owner   = THIS_MODULE,
+	.open    = simple_open,
+	.read    = infoframe_read,
+};
+
+static int create_debugfs_infoframe_file(struct drm_hdmi_connector *hdmi_connector,
+					 struct dentry *parent,
+					 const char *filename,
+					 union hdmi_infoframe *frame)
+{
+	struct drm_device *dev = hdmi_connector->base.dev;
+	struct debugfs_wrapper *wrapper;
+	struct dentry *file;
+
+	wrapper = drmm_kzalloc(dev, sizeof(*wrapper), GFP_KERNEL);
+	if (!wrapper)
+		return -ENOMEM;
+
+	wrapper->hdmi_connector = hdmi_connector;
+	wrapper->frame = frame;
+
+	file = debugfs_create_file(filename, 0400, parent, wrapper, &infoframe_fops);
+	if (IS_ERR(file))
+		return PTR_ERR(file);
+
+	return 0;
+}
+
+#define CREATE_INFOFRAME_FILE(c, p, i)		\
+	create_debugfs_infoframe_file(c, p, #i, (union hdmi_infoframe *)&(c)->infoframes.i)
+
+static int create_debugfs_infoframe_files(struct drm_hdmi_connector *hdmi_connector,
+					  struct dentry *parent)
+{
+	int ret;
+
+	ret = CREATE_INFOFRAME_FILE(hdmi_connector, parent, audio);
+	if (ret)
+		return ret;
+
+	ret = CREATE_INFOFRAME_FILE(hdmi_connector, parent, avi);
+	if (ret)
+		return ret;
+
+	ret = CREATE_INFOFRAME_FILE(hdmi_connector, parent, drm);
+	if (ret)
+		return ret;
+
+	ret = CREATE_INFOFRAME_FILE(hdmi_connector, parent, spd);
+	if (ret)
+		return ret;
+
+	ret = CREATE_INFOFRAME_FILE(hdmi_connector, parent, vendor);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+#undef CREATE_INFOFRAME_FILE
+
+static void remove_debugfs_dir(struct drm_device *dev, void *data)
+{
+	struct dentry *dir = data;
+
+	debugfs_remove_recursive(dir);
+}
+
+/**
+ * drm_helper_hdmi_connector_debugfs_init - DebugFS init for HDMI connectors
+ * @connector: Parent Connector
+ * @dentry: DebugFS root dentry
+ *
+ * Provides a default implementation for
+ * @drm_connector_helper_funcs.debugfs_init that will create all the
+ * files relevant for a @drm_hdmi_connector.
+ */
+void drm_helper_hdmi_connector_debugfs_init(struct drm_connector *connector,
+					    struct dentry *root)
+{
+	struct drm_hdmi_connector *hdmi_connector =
+		connector_to_hdmi_connector(connector);
+	struct drm_device *dev = hdmi_connector->base.dev;
+	struct dentry *dir;
+	int ret;
+
+	dir = debugfs_create_dir("infoframes", root);
+	if (IS_ERR(dir))
+		return;
+
+	ret = drmm_add_action_or_reset(dev, remove_debugfs_dir, dir);
+	if (ret)
+		return;
+
+	create_debugfs_infoframe_files(hdmi_connector, dir);
+}
+EXPORT_SYMBOL(drm_helper_hdmi_connector_debugfs_init);
+
 /**
  * drmm_hdmi_connector_init - Init a preallocated HDMI connector
  * @dev: DRM device
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 21da6f428101..e5faaeb35a9d 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -2294,6 +2294,10 @@ int drmm_hdmi_connector_init(struct drm_device *dev,
 			     struct i2c_adapter *ddc,
 			     unsigned int max_bpc);
 
+void drm_helper_hdmi_connector_debugfs_init(struct drm_connector *connector,
+					    struct dentry *root);
+
+
 /**
  * struct drm_tile_group - Tile group metadata
  * @refcount: reference count

-- 
2.41.0

