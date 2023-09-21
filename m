Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2C17A9381
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 12:15:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEA8410E5A5;
	Thu, 21 Sep 2023 10:15:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00176a03.pphosted.com (mx0b-00176a03.pphosted.com
 [67.231.157.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF9EA10E5A5
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 10:15:40 +0000 (UTC)
Received: from pps.filterd (m0048204.ppops.net [127.0.0.1])
 by m0048204.ppops.net-00176a03. (8.17.1.19/8.17.1.19) with ESMTP id
 38L3jhnq020091
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 06:15:39 -0400
From: Ian Ray <ian.ray@ge.com>
To: peter.senna@gmail.com, martyn.welch@collabora.co.uk,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH 1/2] drm/bridge: megachips-stdpxxxx-ge-b850v3-fw: switch to
 drm_do_get_edid()
Date: Thu, 21 Sep 2023 13:15:33 +0300
Message-Id: <20230921101534.53214-1-ian.ray@ge.com>
X-Mailer: git-send-email 2.10.1
X-Proofpoint-GUID: MLi3B_OYdiiFIcV7qf1slkUAC13Rsn3S
X-Proofpoint-ORIG-GUID: MLi3B_OYdiiFIcV7qf1slkUAC13Rsn3S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-21_06,2023-09-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 priorityscore=1501
 mlxscore=0 mlxlogscore=999 malwarescore=0 spamscore=0 adultscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2309210089
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Migrate away from custom EDID parsing and validity checks.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Ian Ray <ian.ray@ge.com>
---
 .../drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c   | 57 ++++------------------
 1 file changed, 9 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
index 460db3c..e93083b 100644
--- a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
+++ b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
@@ -65,12 +65,11 @@ struct ge_b850v3_lvds {
 
 static struct ge_b850v3_lvds *ge_b850v3_lvds_ptr;
 
-static u8 *stdp2690_get_edid(struct i2c_client *client)
+static int stdp2690_read_block(void *context, u8 *buf, unsigned int block, size_t len)
 {
+	struct i2c_client *client = context;
 	struct i2c_adapter *adapter = client->adapter;
-	unsigned char start = 0x00;
-	unsigned int total_size;
-	u8 *block = kmalloc(EDID_LENGTH, GFP_KERNEL);
+	unsigned char start = block * EDID_LENGTH;
 
 	struct i2c_msg msgs[] = {
 		{
@@ -81,53 +80,15 @@ static u8 *stdp2690_get_edid(struct i2c_client *client)
 		}, {
 			.addr	= client->addr,
 			.flags	= I2C_M_RD,
-			.len	= EDID_LENGTH,
-			.buf	= block,
+			.len	= len,
+			.buf	= buf,
 		}
 	};
 
-	if (!block)
-		return NULL;
+	if (i2c_transfer(adapter, msgs, 2) != 2)
+		return -1;
 
-	if (i2c_transfer(adapter, msgs, 2) != 2) {
-		DRM_ERROR("Unable to read EDID.\n");
-		goto err;
-	}
-
-	if (!drm_edid_block_valid(block, 0, false, NULL)) {
-		DRM_ERROR("Invalid EDID data\n");
-		goto err;
-	}
-
-	total_size = (block[EDID_EXT_BLOCK_CNT] + 1) * EDID_LENGTH;
-	if (total_size > EDID_LENGTH) {
-		kfree(block);
-		block = kmalloc(total_size, GFP_KERNEL);
-		if (!block)
-			return NULL;
-
-		/* Yes, read the entire buffer, and do not skip the first
-		 * EDID_LENGTH bytes.
-		 */
-		start = 0x00;
-		msgs[1].len = total_size;
-		msgs[1].buf = block;
-
-		if (i2c_transfer(adapter, msgs, 2) != 2) {
-			DRM_ERROR("Unable to read EDID extension blocks.\n");
-			goto err;
-		}
-		if (!drm_edid_block_valid(block, 1, false, NULL)) {
-			DRM_ERROR("Invalid EDID data\n");
-			goto err;
-		}
-	}
-
-	return block;
-
-err:
-	kfree(block);
-	return NULL;
+	return 0;
 }
 
 static struct edid *ge_b850v3_lvds_get_edid(struct drm_bridge *bridge,
@@ -137,7 +98,7 @@ static struct edid *ge_b850v3_lvds_get_edid(struct drm_bridge *bridge,
 
 	client = ge_b850v3_lvds_ptr->stdp2690_i2c;
 
-	return (struct edid *)stdp2690_get_edid(client);
+	return drm_do_get_edid(connector, stdp2690_read_block, client);
 }
 
 static int ge_b850v3_lvds_get_modes(struct drm_connector *connector)
-- 
2.10.1

