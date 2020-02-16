Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 549E8160686
	for <lists+dri-devel@lfdr.de>; Sun, 16 Feb 2020 22:04:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42D106E4A1;
	Sun, 16 Feb 2020 21:04:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81BFD6E497
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Feb 2020 21:03:57 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 03A761273;
 Sun, 16 Feb 2020 22:03:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1581887034;
 bh=HXeEPngBC4fjd9ffSmxP6GZItXr4Uwcn2Zw2FAvvFCU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nV+hvOqN8W2/qFgkSof49j7HqVkn2FXpqnKM9y/+4lcmWl2xRt4noEpeaXn0cR9gp
 +O8j5OhSLvsS06R5Ppp8TiW3uU/d205c9AGjkzVbRsReyLpzlHXzA1gEz8TpBls24s
 TCfOV6Gd76JVPBhFWUjBp9QIEYUlBT/6hCehjqCQ=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 27/51] drm/omap: hdmi5: Rework EDID read to isolate data
 read
Date: Sun, 16 Feb 2020 23:02:44 +0200
Message-Id: <20200216210308.17312-28-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200216210308.17312-1-laurent.pinchart@ideasonboard.com>
References: <20200216210308.17312-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>, Sam Ravnborg <sam@ravnborg.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In preparation of adding DRM bridge support to the hdmi5 encoder code,
rework the EDID read to isolate data read.

The hdmi_read_edid() function is the main entry point. It performs all
initialisation steps required prior to reading the EDID (such as
ensuring the device is powered on), as well as corresponding cleanup
steps afterwards. EDID read itself is handled by hdmi_read_edid_data()
that calls the hdmi5_core_ddc_read() function to read individual blocks.

This new code architecture will allow reusing hdmi_read_edid() and
hdmi5_core_ddc_read() for the drm_bridge EDID read implementation, while
swapping out hdmi_read_edid_data() for the DRM drm_do_get_edid()
function.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
Changes since v2:

- Expand commit message
---
 drivers/gpu/drm/omapdrm/dss/hdmi5.c      | 89 ++++++++++++++----------
 drivers/gpu/drm/omapdrm/dss/hdmi5_core.c | 48 +++----------
 drivers/gpu/drm/omapdrm/dss/hdmi5_core.h |  5 +-
 3 files changed, 65 insertions(+), 77 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi5.c b/drivers/gpu/drm/omapdrm/dss/hdmi5.c
index 99720dfc5769..2b02b0a11696 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi5.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi5.c
@@ -271,30 +271,6 @@ static int hdmi_dump_regs(struct seq_file *s, void *p)
 	return 0;
 }
 
-static int read_edid(struct omap_hdmi *hdmi, u8 *buf, int len)
-{
-	int r;
-	int idlemode;
-
-	mutex_lock(&hdmi->lock);
-
-	r = hdmi_runtime_get(hdmi);
-	BUG_ON(r);
-
-	idlemode = REG_GET(hdmi->wp.base, HDMI_WP_SYSCONFIG, 3, 2);
-	/* No-idle mode */
-	REG_FLD_MOD(hdmi->wp.base, HDMI_WP_SYSCONFIG, 1, 3, 2);
-
-	r = hdmi5_read_edid(&hdmi->core,  buf, len);
-
-	REG_FLD_MOD(hdmi->wp.base, HDMI_WP_SYSCONFIG, idlemode, 3, 2);
-
-	hdmi_runtime_put(hdmi);
-	mutex_unlock(&hdmi->lock);
-
-	return r;
-}
-
 static void hdmi_start_audio_stream(struct omap_hdmi *hd)
 {
 	REG_FLD_MOD(hd->wp.base, HDMI_WP_SYSCONFIG, 1, 3, 2);
@@ -412,32 +388,73 @@ static void hdmi_disconnect(struct omap_dss_device *src,
 
 #define MAX_EDID	512
 
-static struct edid *hdmi_read_edid(struct omap_dss_device *dssdev)
+static struct edid *hdmi_read_edid_data(struct hdmi_core_data *core)
 {
-	struct omap_hdmi *hdmi = dssdev_to_hdmi(dssdev);
-	bool need_enable;
+	int max_ext_blocks = 3;
+	int r, n, i;
 	u8 *edid;
-	int r;
 
 	edid = kzalloc(MAX_EDID, GFP_KERNEL);
 	if (!edid)
 		return NULL;
 
+	r = hdmi5_core_ddc_read(core, edid, 0, EDID_LENGTH);
+	if (r)
+		goto error;
+
+	n = edid[0x7e];
+
+	if (n > max_ext_blocks)
+		n = max_ext_blocks;
+
+	for (i = 1; i <= n; i++) {
+		r = hdmi5_core_ddc_read(core, edid + i * EDID_LENGTH, i,
+					EDID_LENGTH);
+		if (r)
+			goto error;
+	}
+
+	return (struct edid *)edid;
+
+error:
+	kfree(edid);
+	return NULL;
+}
+
+static struct edid *hdmi_read_edid(struct omap_dss_device *dssdev)
+{
+	struct omap_hdmi *hdmi = dssdev_to_hdmi(dssdev);
+	struct edid *edid;
+	bool need_enable;
+	int idlemode;
+	int r;
+
 	need_enable = hdmi->core_enabled == false;
 
 	if (need_enable) {
 		r = hdmi_core_enable(hdmi);
-		if (r) {
-			kfree(edid);
+		if (r)
 			return NULL;
-		}
 	}
 
-	r = read_edid(hdmi, edid, MAX_EDID);
-	if (r < 0) {
-		kfree(edid);
-		edid = NULL;
-	}
+	mutex_lock(&hdmi->lock);
+	r = hdmi_runtime_get(hdmi);
+	BUG_ON(r);
+
+	idlemode = REG_GET(hdmi->wp.base, HDMI_WP_SYSCONFIG, 3, 2);
+	/* No-idle mode */
+	REG_FLD_MOD(hdmi->wp.base, HDMI_WP_SYSCONFIG, 1, 3, 2);
+
+	hdmi5_core_ddc_init(&hdmi->core);
+
+	edid = hdmi_read_edid_data(&hdmi->core);
+
+	hdmi5_core_ddc_uninit(&hdmi->core);
+
+	REG_FLD_MOD(hdmi->wp.base, HDMI_WP_SYSCONFIG, idlemode, 3, 2);
+
+	hdmi_runtime_put(hdmi);
+	mutex_unlock(&hdmi->lock);
 
 	if (need_enable)
 		hdmi_core_disable(hdmi);
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi5_core.c b/drivers/gpu/drm/omapdrm/dss/hdmi5_core.c
index ff4d35c8771f..7dd587035160 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi5_core.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi5_core.c
@@ -23,7 +23,7 @@
 
 #include "hdmi5_core.h"
 
-static void hdmi_core_ddc_init(struct hdmi_core_data *core)
+void hdmi5_core_ddc_init(struct hdmi_core_data *core)
 {
 	void __iomem *base = core->base;
 	const unsigned long long iclk = 266000000;	/* DSS L3 ICLK */
@@ -102,7 +102,7 @@ static void hdmi_core_ddc_init(struct hdmi_core_data *core)
 	REG_FLD_MOD(base, HDMI_CORE_I2CM_INT, 0x0, 2, 2);
 }
 
-static void hdmi_core_ddc_uninit(struct hdmi_core_data *core)
+void hdmi5_core_ddc_uninit(struct hdmi_core_data *core)
 {
 	void __iomem *base = core->base;
 
@@ -112,14 +112,14 @@ static void hdmi_core_ddc_uninit(struct hdmi_core_data *core)
 	REG_FLD_MOD(base, HDMI_CORE_I2CM_INT, 0x1, 2, 2);
 }
 
-static int hdmi_core_ddc_edid(struct hdmi_core_data *core, u8 *pedid, u8 ext)
+int hdmi5_core_ddc_read(void *data, u8 *buf, unsigned int block, size_t len)
 {
+	struct hdmi_core_data *core = data;
 	void __iomem *base = core->base;
 	u8 cur_addr;
-	char checksum = 0;
 	const int retries = 1000;
-	u8 seg_ptr = ext / 2;
-	u8 edidbase = ((ext % 2) * 0x80);
+	u8 seg_ptr = block / 2;
+	u8 edidbase = ((block % 2) * EDID_LENGTH);
 
 	REG_FLD_MOD(base, HDMI_CORE_I2CM_SEGPTR, seg_ptr, 7, 0);
 
@@ -127,7 +127,7 @@ static int hdmi_core_ddc_edid(struct hdmi_core_data *core, u8 *pedid, u8 ext)
 	 * TODO: We use polling here, although we probably should use proper
 	 * interrupts.
 	 */
-	for (cur_addr = 0; cur_addr < 128; ++cur_addr) {
+	for (cur_addr = 0; cur_addr < len; ++cur_addr) {
 		int i;
 
 		/* clear ERROR and DONE */
@@ -164,45 +164,13 @@ static int hdmi_core_ddc_edid(struct hdmi_core_data *core, u8 *pedid, u8 ext)
 			return -EIO;
 		}
 
-		pedid[cur_addr] = REG_GET(base, HDMI_CORE_I2CM_DATAI, 7, 0);
-		checksum += pedid[cur_addr];
+		buf[cur_addr] = REG_GET(base, HDMI_CORE_I2CM_DATAI, 7, 0);
 	}
 
 	return 0;
 
 }
 
-int hdmi5_read_edid(struct hdmi_core_data *core, u8 *edid, int len)
-{
-	int r, n, i;
-	int max_ext_blocks = (len / 128) - 1;
-
-	if (len < 128)
-		return -EINVAL;
-
-	hdmi_core_ddc_init(core);
-
-	r = hdmi_core_ddc_edid(core, edid, 0);
-	if (r)
-		goto out;
-
-	n = edid[0x7e];
-
-	if (n > max_ext_blocks)
-		n = max_ext_blocks;
-
-	for (i = 1; i <= n; i++) {
-		r = hdmi_core_ddc_edid(core, edid + i * EDID_LENGTH, i);
-		if (r)
-			goto out;
-	}
-
-out:
-	hdmi_core_ddc_uninit(core);
-
-	return r ? r : len;
-}
-
 void hdmi5_core_dump(struct hdmi_core_data *core, struct seq_file *s)
 {
 
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi5_core.h b/drivers/gpu/drm/omapdrm/dss/hdmi5_core.h
index f10b8a283011..65eadefdb3f9 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi5_core.h
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi5_core.h
@@ -281,7 +281,10 @@ struct csc_table {
 	u16 c1, c2, c3, c4;
 };
 
-int hdmi5_read_edid(struct hdmi_core_data *core, u8 *edid, int len);
+void hdmi5_core_ddc_init(struct hdmi_core_data *core);
+int hdmi5_core_ddc_read(void *data, u8 *buf, unsigned int block, size_t len);
+void hdmi5_core_ddc_uninit(struct hdmi_core_data *core);
+
 void hdmi5_core_dump(struct hdmi_core_data *core, struct seq_file *s);
 int hdmi5_core_handle_irqs(struct hdmi_core_data *core);
 void hdmi5_configure(struct hdmi_core_data *core, struct hdmi_wp_data *wp,
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
