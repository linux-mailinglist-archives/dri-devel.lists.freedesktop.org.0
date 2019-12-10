Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3AAE119ED0
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 23:59:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B80536E9F5;
	Tue, 10 Dec 2019 22:58:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F2AE6E9EA
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 22:58:28 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 45BFA1990;
 Tue, 10 Dec 2019 23:58:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1576018705;
 bh=AiMoze30i54HEC11zAkVzqUODR7EeoNSiISgg/mlXTM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JPiY+7phshZeMb92UW9wO8V6QMV8pAqUivlPd3bymntlc862p75ylOPqjeqCiuAG8
 kfDWE9Dkrj8YARo+gW3mzYcbYGQmPmH/TEnn6J45W7Ri2AfGGx+1VEnzJ4WMKMxxiW
 bv6AcnG2ZiQseCxjkF42eIIy8HPvcc35/kYr7eFo=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 26/50] drm/omap: hdmi4: Rework EDID read to isolate data
 read
Date: Wed, 11 Dec 2019 00:57:26 +0200
Message-Id: <20191210225750.15709-27-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191210225750.15709-1-laurent.pinchart@ideasonboard.com>
References: <20191210225750.15709-1-laurent.pinchart@ideasonboard.com>
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
Cc: Boris Brezillon <bbrezillon@kernel.org>, Sean Paul <sean@poorly.run>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In preparation of adding DRM bridge support to the hdmi4 encoder code,
rework the EDID read to isolate data read.

The hdmi_read_edid() function is the main entry point. It performs all
initialisation steps required prior to reading the EDID (such as
ensuring the device is powered on), as well as corresponding cleanup
steps afterwards. EDID read itself is handled by hdmi_read_edid_data()
that calls the hdmi4_core_ddc_read() function to read individual blocks.

This new code architecture will allow reusing hdmi_read_edid() and
hdmi4_core_ddc_read() for the drm_bridge EDID read implementation, while
swapping out hdmi_read_edid_data() for the DRM drm_do_get_edid()
function.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v2:

- Expand commit message
---
 drivers/gpu/drm/omapdrm/dss/hdmi4.c      | 94 +++++++++++++++---------
 drivers/gpu/drm/omapdrm/dss/hdmi4_core.c | 59 +++------------
 drivers/gpu/drm/omapdrm/dss/hdmi4_core.h |  4 +-
 3 files changed, 73 insertions(+), 84 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4.c b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
index e15fa3862922..37536b9f3114 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi4.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
@@ -272,23 +272,6 @@ static int hdmi_dump_regs(struct seq_file *s, void *p)
 	return 0;
 }
 
-static int read_edid(struct omap_hdmi *hdmi, u8 *buf, int len)
-{
-	int r;
-
-	mutex_lock(&hdmi->lock);
-
-	r = hdmi_runtime_get(hdmi);
-	BUG_ON(r);
-
-	r = hdmi4_read_edid(&hdmi->core,  buf, len);
-
-	hdmi_runtime_put(hdmi);
-	mutex_unlock(&hdmi->lock);
-
-	return r;
-}
-
 static void hdmi_start_audio_stream(struct omap_hdmi *hd)
 {
 	hdmi_wp_audio_enable(&hd->wp, true);
@@ -407,10 +390,8 @@ static void hdmi_disconnect(struct omap_dss_device *src,
 
 #define MAX_EDID	512
 
-static struct edid *hdmi_read_edid(struct omap_dss_device *dssdev)
+static struct edid *hdmi_read_edid_data(struct omap_hdmi *hdmi)
 {
-	struct omap_hdmi *hdmi = dssdev_to_hdmi(dssdev);
-	bool need_enable;
 	u8 *edid;
 	int r;
 
@@ -418,32 +399,79 @@ static struct edid *hdmi_read_edid(struct omap_dss_device *dssdev)
 	if (!edid)
 		return NULL;
 
+	r = hdmi4_core_ddc_read(&hdmi->core, edid, 0, EDID_LENGTH);
+	if (r)
+		goto error;
+
+	if (edid[0x7e] > 0) {
+		char checksum = 0;
+		unsigned int i;
+
+		r = hdmi4_core_ddc_read(&hdmi->core, edid + EDID_LENGTH, 1,
+					EDID_LENGTH);
+		if (r)
+			goto error;
+
+		for (i = 0; i < EDID_LENGTH; ++i)
+			checksum += edid[EDID_LENGTH + i];
+
+		if (checksum != 0) {
+			DSSERR("E-EDID checksum failed!!\n");
+			goto error;
+		}
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
+	struct edid *edid = NULL;
+	unsigned int cec_addr;
+	bool need_enable;
+	int r;
+
 	need_enable = hdmi->core_enabled == false;
 
 	if (need_enable) {
 		r = hdmi4_core_enable(&hdmi->core);
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
-	} else {
-		unsigned int cec_addr;
+	mutex_lock(&hdmi->lock);
+	r = hdmi_runtime_get(hdmi);
+	BUG_ON(r);
+
+	r = hdmi4_core_ddc_init(&hdmi->core);
+	if (r)
+		goto done;
 
-		cec_addr = r >= 256 ? cec_get_edid_phys_addr(edid, r, NULL)
-			 : CEC_PHYS_ADDR_INVALID;
-		hdmi4_cec_set_phys_addr(&hdmi->core, cec_addr);
+	edid = hdmi_read_edid_data(hdmi);
+
+done:
+	hdmi_runtime_put(hdmi);
+	mutex_unlock(&hdmi->lock);
+
+	if (edid && edid->extensions) {
+		unsigned int len = (edid->extensions + 1) * EDID_LENGTH;
+
+		cec_addr = cec_get_edid_phys_addr((u8 *)edid, len, NULL);
+	} else {
+		cec_addr = CEC_PHYS_ADDR_INVALID;
 	}
 
+	hdmi4_cec_set_phys_addr(&hdmi->core, cec_addr);
+
 	if (need_enable)
 		hdmi4_core_disable(&hdmi->core);
 
-	return (struct edid *)edid;
+	return edid;
 }
 
 static void hdmi_lost_hotplug(struct omap_dss_device *dssdev)
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4_core.c b/drivers/gpu/drm/omapdrm/dss/hdmi4_core.c
index ea5d5c228534..751985a2679a 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi4_core.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi4_core.c
@@ -32,7 +32,7 @@ static inline void __iomem *hdmi_av_base(struct hdmi_core_data *core)
 	return core->base + HDMI_CORE_AV;
 }
 
-static int hdmi_core_ddc_init(struct hdmi_core_data *core)
+int hdmi4_core_ddc_init(struct hdmi_core_data *core)
 {
 	void __iomem *base = core->base;
 
@@ -74,13 +74,11 @@ static int hdmi_core_ddc_init(struct hdmi_core_data *core)
 	return 0;
 }
 
-static int hdmi_core_ddc_edid(struct hdmi_core_data *core,
-		u8 *pedid, int ext)
+int hdmi4_core_ddc_read(void *data, u8 *buf, unsigned int block, size_t len)
 {
+	struct hdmi_core_data *core = data;
 	void __iomem *base = core->base;
 	u32 i;
-	char checksum;
-	u32 offset = 0;
 
 	/* HDMI_CORE_DDC_STATUS_IN_PROG */
 	if (hdmi_wait_for_bit_change(base, HDMI_CORE_DDC_STATUS,
@@ -89,24 +87,21 @@ static int hdmi_core_ddc_edid(struct hdmi_core_data *core,
 		return -ETIMEDOUT;
 	}
 
-	if (ext % 2 != 0)
-		offset = 0x80;
-
 	/* Load Segment Address Register */
-	REG_FLD_MOD(base, HDMI_CORE_DDC_SEGM, ext / 2, 7, 0);
+	REG_FLD_MOD(base, HDMI_CORE_DDC_SEGM, block / 2, 7, 0);
 
 	/* Load Slave Address Register */
 	REG_FLD_MOD(base, HDMI_CORE_DDC_ADDR, 0xA0 >> 1, 7, 1);
 
 	/* Load Offset Address Register */
-	REG_FLD_MOD(base, HDMI_CORE_DDC_OFFSET, offset, 7, 0);
+	REG_FLD_MOD(base, HDMI_CORE_DDC_OFFSET, block % 2 ? 0x80 : 0, 7, 0);
 
 	/* Load Byte Count */
-	REG_FLD_MOD(base, HDMI_CORE_DDC_COUNT1, 0x80, 7, 0);
+	REG_FLD_MOD(base, HDMI_CORE_DDC_COUNT1, len, 7, 0);
 	REG_FLD_MOD(base, HDMI_CORE_DDC_COUNT2, 0x0, 1, 0);
 
 	/* Set DDC_CMD */
-	if (ext)
+	if (block)
 		REG_FLD_MOD(base, HDMI_CORE_DDC_CMD, 0x4, 3, 0);
 	else
 		REG_FLD_MOD(base, HDMI_CORE_DDC_CMD, 0x2, 3, 0);
@@ -122,7 +117,7 @@ static int hdmi_core_ddc_edid(struct hdmi_core_data *core,
 		return -EIO;
 	}
 
-	for (i = 0; i < 0x80; ++i) {
+	for (i = 0; i < len; ++i) {
 		int t;
 
 		/* IN_PROG */
@@ -141,48 +136,12 @@ static int hdmi_core_ddc_edid(struct hdmi_core_data *core,
 			udelay(1);
 		}
 
-		pedid[i] = REG_GET(base, HDMI_CORE_DDC_DATA, 7, 0);
-	}
-
-	checksum = 0;
-	for (i = 0; i < 0x80; ++i)
-		checksum += pedid[i];
-
-	if (checksum != 0) {
-		DSSERR("E-EDID checksum failed!!\n");
-		return -EIO;
+		buf[i] = REG_GET(base, HDMI_CORE_DDC_DATA, 7, 0);
 	}
 
 	return 0;
 }
 
-int hdmi4_read_edid(struct hdmi_core_data *core, u8 *edid, int len)
-{
-	int r, l;
-
-	if (len < 128)
-		return -EINVAL;
-
-	r = hdmi_core_ddc_init(core);
-	if (r)
-		return r;
-
-	r = hdmi_core_ddc_edid(core, edid, 0);
-	if (r)
-		return r;
-
-	l = 128;
-
-	if (len >= 128 * 2 && edid[0x7e] > 0) {
-		r = hdmi_core_ddc_edid(core, edid + 0x80, 1);
-		if (r)
-			return r;
-		l += 128;
-	}
-
-	return l;
-}
-
 static void hdmi_core_init(struct hdmi_core_video_config *video_cfg)
 {
 	DSSDBG("Enter hdmi_core_init\n");
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4_core.h b/drivers/gpu/drm/omapdrm/dss/hdmi4_core.h
index 11c4b7ba1eee..dc64ae2aa300 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi4_core.h
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi4_core.h
@@ -249,7 +249,9 @@ struct hdmi_core_packet_enable_repeat {
 	u32	generic_pkt_repeat;
 };
 
-int hdmi4_read_edid(struct hdmi_core_data *core, u8 *edid, int len);
+int hdmi4_core_ddc_init(struct hdmi_core_data *core);
+int hdmi4_core_ddc_read(void *data, u8 *buf, unsigned int block, size_t len);
+
 void hdmi4_configure(struct hdmi_core_data *core, struct hdmi_wp_data *wp,
 		struct hdmi_config *cfg);
 void hdmi4_core_dump(struct hdmi_core_data *core, struct seq_file *s);
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
