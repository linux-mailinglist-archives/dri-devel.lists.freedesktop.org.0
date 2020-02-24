Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F2D16BC80
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 09:52:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D65246EA47;
	Tue, 25 Feb 2020 08:51:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BC626E9B4
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 23:21:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id 0860029360F
Received: by earth.universe (Postfix, from userid 1000)
 id B2F783C0C89; Tue, 25 Feb 2020 00:21:30 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Sebastian Reichel <sre@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCHv2 06/56] drm/omap: constify write buffers
Date: Tue, 25 Feb 2020 00:20:36 +0100
Message-Id: <20200224232126.3385250-7-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
References: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 25 Feb 2020 08:50:43 +0000
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
Cc: kernel@collabora.com, Tony Lindgren <tony@atomide.com>,
 "H. Nikolaus Schaller" <hns@goldelico.com>, Merlijn Wajer <merlijn@wizzup.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The write buffers are not modified, so they can be constant.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/omapdrm/dss/dsi.c     | 24 ++++++++++++------------
 drivers/gpu/drm/omapdrm/dss/omapdss.h | 10 +++++-----
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index bb2548d091ef..f01e0476296d 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -2601,11 +2601,11 @@ static inline void dsi_vc_write_long_payload(struct dsi_data *dsi, int channel,
 }
 
 static int dsi_vc_send_long(struct dsi_data *dsi, int channel, u8 data_type,
-			    u8 *data, u16 len, u8 ecc)
+			    const u8 *data, u16 len, u8 ecc)
 {
 	/*u32 val; */
 	int i;
-	u8 *p;
+	const u8 *p;
 	int r = 0;
 	u8 b1, b2, b3, b4;
 
@@ -2698,7 +2698,7 @@ static int dsi_vc_send_null(struct dsi_data *dsi, int channel)
 }
 
 static int dsi_vc_write_nosync_common(struct dsi_data *dsi, int channel,
-				      u8 *data, int len,
+				      const u8 *data, int len,
 				      enum dss_dsi_content_type type)
 {
 	int r;
@@ -2729,7 +2729,7 @@ static int dsi_vc_write_nosync_common(struct dsi_data *dsi, int channel,
 }
 
 static int dsi_vc_dcs_write_nosync(struct omap_dss_device *dssdev, int channel,
-		u8 *data, int len)
+		const u8 *data, int len)
 {
 	struct dsi_data *dsi = to_dsi_data(dssdev);
 
@@ -2738,7 +2738,7 @@ static int dsi_vc_dcs_write_nosync(struct omap_dss_device *dssdev, int channel,
 }
 
 static int dsi_vc_generic_write_nosync(struct omap_dss_device *dssdev, int channel,
-		u8 *data, int len)
+		const u8 *data, int len)
 {
 	struct dsi_data *dsi = to_dsi_data(dssdev);
 
@@ -2747,7 +2747,7 @@ static int dsi_vc_generic_write_nosync(struct omap_dss_device *dssdev, int chann
 }
 
 static int dsi_vc_write_common(struct omap_dss_device *dssdev,
-			       int channel, u8 *data, int len,
+			       int channel, const u8 *data, int len,
 			       enum dss_dsi_content_type type)
 {
 	struct dsi_data *dsi = to_dsi_data(dssdev);
@@ -2776,15 +2776,15 @@ static int dsi_vc_write_common(struct omap_dss_device *dssdev,
 	return r;
 }
 
-static int dsi_vc_dcs_write(struct omap_dss_device *dssdev, int channel, u8 *data,
-		int len)
+static int dsi_vc_dcs_write(struct omap_dss_device *dssdev, int channel,
+		const u8 *data, int len)
 {
 	return dsi_vc_write_common(dssdev, channel, data, len,
 			DSS_DSI_CONTENT_DCS);
 }
 
-static int dsi_vc_generic_write(struct omap_dss_device *dssdev, int channel, u8 *data,
-		int len)
+static int dsi_vc_generic_write(struct omap_dss_device *dssdev, int channel,
+		const u8 *data, int len)
 {
 	return dsi_vc_write_common(dssdev, channel, data, len,
 			DSS_DSI_CONTENT_GENERIC);
@@ -2810,7 +2810,7 @@ static int dsi_vc_dcs_send_read_request(struct dsi_data *dsi, int channel,
 }
 
 static int dsi_vc_generic_send_read_request(struct dsi_data *dsi, int channel,
-					    u8 *reqdata, int reqlen)
+					    const u8 *reqdata, int reqlen)
 {
 	u16 data;
 	u8 data_type;
@@ -2983,7 +2983,7 @@ static int dsi_vc_dcs_read(struct omap_dss_device *dssdev, int channel, u8 dcs_c
 }
 
 static int dsi_vc_generic_read(struct omap_dss_device *dssdev, int channel,
-		u8 *reqdata, int reqlen, u8 *buf, int buflen)
+		const u8 *reqdata, int reqlen, u8 *buf, int buflen)
 {
 	struct dsi_data *dsi = to_dsi_data(dssdev);
 	int r;
diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
index 53fea1cbbc2d..b909b3a8c835 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
@@ -308,18 +308,18 @@ struct omapdss_dsi_ops {
 
 	/* data transfer */
 	int (*dcs_write)(struct omap_dss_device *dssdev, int channel,
-			u8 *data, int len);
+			const u8 *data, int len);
 	int (*dcs_write_nosync)(struct omap_dss_device *dssdev, int channel,
-			u8 *data, int len);
+			const u8 *data, int len);
 	int (*dcs_read)(struct omap_dss_device *dssdev, int channel, u8 dcs_cmd,
 			u8 *data, int len);
 
 	int (*gen_write)(struct omap_dss_device *dssdev, int channel,
-			u8 *data, int len);
+			const u8 *data, int len);
 	int (*gen_write_nosync)(struct omap_dss_device *dssdev, int channel,
-			u8 *data, int len);
+			const u8 *data, int len);
 	int (*gen_read)(struct omap_dss_device *dssdev, int channel,
-			u8 *reqdata, int reqlen,
+			const u8 *reqdata, int reqlen,
 			u8 *data, int len);
 
 	int (*bta_sync)(struct omap_dss_device *dssdev, int channel);
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
