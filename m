Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1FFBA55F82
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 05:35:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95AC410EAC8;
	Fri,  7 Mar 2025 04:35:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ua5JdOyE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 517D910EABE;
 Fri,  7 Mar 2025 04:35:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D61685C5BA4;
 Fri,  7 Mar 2025 04:33:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBA3AC4CEE3;
 Fri,  7 Mar 2025 04:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741322136;
 bh=6ZCI/e7lhl23csgrc+82Crw3tN/S2yWqUimyde72NNU=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Ua5JdOyETpgwg+IUOUY+l2lXkds2uhihN5IaIOLmaVucymJyUT3nMbswUyEoJrHVt
 I6EUYCD2Xa1hUuGd1Mlwo8lMxsNqqS6O9SI8RyhzXRLzvrSmBZ39t6ErL680vlOOK3
 yx0kel68LjYyHYD8VUN8G9VLfR5ydmLld3x8IjLj2syh4xRiVxO67I/5SxZu5kU/jS
 41QW57w1PNLk/MAk7M9YQkltwfsGrTzda9m4pnbVR9HLZZu6JcO+zUvJqZ6/WLc6UP
 Ic2RmdmLg1vq1t/o+mrEideekC2BMY4vkYExGY+O9NTqagb/ElV4mZphQ/iO7/H1Eg
 zjzEEJGj7mzSQ==
From: Dmitry Baryshkov <lumag@kernel.org>
Date: Fri, 07 Mar 2025 06:34:48 +0200
Subject: [PATCH RFC v3 6/7] drm/display: dp-mst-topology: use new DCPD
 access helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250307-drm-rework-dpcd-access-v3-6-9044a3a868ee@linaro.org>
References: <20250307-drm-rework-dpcd-access-v3-0-9044a3a868ee@linaro.org>
In-Reply-To: <20250307-drm-rework-dpcd-access-v3-0-9044a3a868ee@linaro.org>
To: Lyude Paul <lyude@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>, 
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8924;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=HHjW0O7WQSBAANLkv3PxOaSuiPNntikvFuh8IL45sr0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnyndm3sYdJ7WCw1+Wpi7cA+3dycvahDl1/2a/x
 Yo2dv9N8rWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8p3ZgAKCRCLPIo+Aiko
 1feTB/4wdyVQJmKRVYYMN2pQCxTR2NF0GH6BpxtYFXbQiou/RJHxNo+hJbQyt2j/dARYdhcbbDb
 aoABfLiFPoqUUHbxdilkgAvVrUfkxZWzefQI23vgZ9Xdxdf/O+dQwvlZPgGIzBHzvN8ydWvogLr
 NhWmLG4WhwX1fKglt/y+VUtaU3EJ0cv6OGdqQM3cptpELIT/MlYNZSheUMDOPvMrQ17bjo1vO+g
 Hq4nepIhovxmXMw3XXcZW7ZyCc8DHNHufdPbCoRzV/vXpiKh5FgiN//LgVzT68KuOKYENx272hi
 voloB8XrbLdm3tDKKRWi8inkflDPjAqVJd8RYCn/7sOtTWMH
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Switch drm_dp_mst_topology.c to use new set of DPCD read / write helpers.

Reviewed-by: Lyude Paul <lyude@redhat.com>
Acked-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 105 +++++++++++++-------------
 1 file changed, 51 insertions(+), 54 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index 8b68bb3fbffb04dfcbd910fd0fd78b998440d6e8..e8716e73480bdf6abbef71897d1632f69a7b8a47 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -2201,15 +2201,12 @@ static int drm_dp_check_mstb_guid(struct drm_dp_mst_branch *mstb, guid_t *guid)
 						     mstb->port_parent,
 						     DP_GUID, sizeof(buf), buf);
 		} else {
-			ret = drm_dp_dpcd_write(mstb->mgr->aux,
-						DP_GUID, buf, sizeof(buf));
+			ret = drm_dp_dpcd_write_data(mstb->mgr->aux,
+						     DP_GUID, buf, sizeof(buf));
 		}
 	}
 
-	if (ret < 16 && ret > 0)
-		return -EPROTO;
-
-	return ret == 16 ? 0 : ret;
+	return ret;
 }
 
 static void build_mst_prop_path(const struct drm_dp_mst_branch *mstb,
@@ -2744,14 +2741,13 @@ static int drm_dp_send_sideband_msg(struct drm_dp_mst_topology_mgr *mgr,
 	do {
 		tosend = min3(mgr->max_dpcd_transaction_bytes, 16, total);
 
-		ret = drm_dp_dpcd_write(mgr->aux, regbase + offset,
-					&msg[offset],
-					tosend);
-		if (ret != tosend) {
-			if (ret == -EIO && retries < 5) {
-				retries++;
-				goto retry;
-			}
+		ret = drm_dp_dpcd_write_data(mgr->aux, regbase + offset,
+					     &msg[offset],
+					     tosend);
+		if (ret == -EIO && retries < 5) {
+			retries++;
+			goto retry;
+		} else if (ret < 0) {
 			drm_dbg_kms(mgr->dev, "failed to dpcd write %d %d\n", tosend, ret);
 
 			return -EIO;
@@ -3624,7 +3620,7 @@ enum drm_dp_mst_mode drm_dp_read_mst_cap(struct drm_dp_aux *aux,
 	if (dpcd[DP_DPCD_REV] < DP_DPCD_REV_12)
 		return DRM_DP_SST;
 
-	if (drm_dp_dpcd_readb(aux, DP_MSTM_CAP, &mstm_cap) != 1)
+	if (drm_dp_dpcd_read_byte(aux, DP_MSTM_CAP, &mstm_cap) < 0)
 		return DRM_DP_SST;
 
 	if (mstm_cap & DP_MST_CAP)
@@ -3679,10 +3675,10 @@ int drm_dp_mst_topology_mgr_set_mst(struct drm_dp_mst_topology_mgr *mgr, bool ms
 		mgr->mst_primary = mstb;
 		drm_dp_mst_topology_get_mstb(mgr->mst_primary);
 
-		ret = drm_dp_dpcd_writeb(mgr->aux, DP_MSTM_CTRL,
-					 DP_MST_EN |
-					 DP_UP_REQ_EN |
-					 DP_UPSTREAM_IS_SRC);
+		ret = drm_dp_dpcd_write_byte(mgr->aux, DP_MSTM_CTRL,
+					     DP_MST_EN |
+					     DP_UP_REQ_EN |
+					     DP_UPSTREAM_IS_SRC);
 		if (ret < 0)
 			goto out_unlock;
 
@@ -3697,7 +3693,7 @@ int drm_dp_mst_topology_mgr_set_mst(struct drm_dp_mst_topology_mgr *mgr, bool ms
 		mstb = mgr->mst_primary;
 		mgr->mst_primary = NULL;
 		/* this can fail if the device is gone */
-		drm_dp_dpcd_writeb(mgr->aux, DP_MSTM_CTRL, 0);
+		drm_dp_dpcd_write_byte(mgr->aux, DP_MSTM_CTRL, 0);
 		ret = 0;
 		mgr->payload_id_table_cleared = false;
 
@@ -3763,8 +3759,8 @@ EXPORT_SYMBOL(drm_dp_mst_topology_queue_probe);
 void drm_dp_mst_topology_mgr_suspend(struct drm_dp_mst_topology_mgr *mgr)
 {
 	mutex_lock(&mgr->lock);
-	drm_dp_dpcd_writeb(mgr->aux, DP_MSTM_CTRL,
-			   DP_MST_EN | DP_UPSTREAM_IS_SRC);
+	drm_dp_dpcd_write_byte(mgr->aux, DP_MSTM_CTRL,
+			       DP_MST_EN | DP_UPSTREAM_IS_SRC);
 	mutex_unlock(&mgr->lock);
 	flush_work(&mgr->up_req_work);
 	flush_work(&mgr->work);
@@ -3813,18 +3809,18 @@ int drm_dp_mst_topology_mgr_resume(struct drm_dp_mst_topology_mgr *mgr,
 		goto out_fail;
 	}
 
-	ret = drm_dp_dpcd_writeb(mgr->aux, DP_MSTM_CTRL,
-				 DP_MST_EN |
-				 DP_UP_REQ_EN |
-				 DP_UPSTREAM_IS_SRC);
+	ret = drm_dp_dpcd_write_byte(mgr->aux, DP_MSTM_CTRL,
+				     DP_MST_EN |
+				     DP_UP_REQ_EN |
+				     DP_UPSTREAM_IS_SRC);
 	if (ret < 0) {
 		drm_dbg_kms(mgr->dev, "mst write failed - undocked during suspend?\n");
 		goto out_fail;
 	}
 
 	/* Some hubs forget their guids after they resume */
-	ret = drm_dp_dpcd_read(mgr->aux, DP_GUID, buf, sizeof(buf));
-	if (ret != sizeof(buf)) {
+	ret = drm_dp_dpcd_read_data(mgr->aux, DP_GUID, buf, sizeof(buf));
+	if (ret < 0) {
 		drm_dbg_kms(mgr->dev, "dpcd read failed - undocked during suspend?\n");
 		goto out_fail;
 	}
@@ -3883,8 +3879,8 @@ drm_dp_get_one_sb_msg(struct drm_dp_mst_topology_mgr *mgr, bool up,
 		*mstb = NULL;
 
 	len = min(mgr->max_dpcd_transaction_bytes, 16);
-	ret = drm_dp_dpcd_read(mgr->aux, basereg, replyblock, len);
-	if (ret != len) {
+	ret = drm_dp_dpcd_read_data(mgr->aux, basereg, replyblock, len);
+	if (ret < 0) {
 		drm_dbg_kms(mgr->dev, "failed to read DPCD down rep %d %d\n", len, ret);
 		return false;
 	}
@@ -3922,9 +3918,9 @@ drm_dp_get_one_sb_msg(struct drm_dp_mst_topology_mgr *mgr, bool up,
 	curreply = len;
 	while (replylen > 0) {
 		len = min3(replylen, mgr->max_dpcd_transaction_bytes, 16);
-		ret = drm_dp_dpcd_read(mgr->aux, basereg + curreply,
-				    replyblock, len);
-		if (ret != len) {
+		ret = drm_dp_dpcd_read_data(mgr->aux, basereg + curreply,
+					    replyblock, len);
+		if (ret < 0) {
 			drm_dbg_kms(mgr->dev, "failed to read a chunk (len %d, ret %d)\n",
 				    len, ret);
 			return false;
@@ -4873,9 +4869,9 @@ static bool dump_dp_payload_table(struct drm_dp_mst_topology_mgr *mgr,
 	int i;
 
 	for (i = 0; i < DP_PAYLOAD_TABLE_SIZE; i += 16) {
-		if (drm_dp_dpcd_read(mgr->aux,
-				     DP_PAYLOAD_TABLE_UPDATE_STATUS + i,
-				     &buf[i], 16) != 16)
+		if (drm_dp_dpcd_read_data(mgr->aux,
+					  DP_PAYLOAD_TABLE_UPDATE_STATUS + i,
+					  &buf[i], 16) < 0)
 			return false;
 	}
 	return true;
@@ -4964,23 +4960,24 @@ void drm_dp_mst_dump_topology(struct seq_file *m,
 		}
 		seq_printf(m, "dpcd: %*ph\n", DP_RECEIVER_CAP_SIZE, buf);
 
-		ret = drm_dp_dpcd_read(mgr->aux, DP_FAUX_CAP, buf, 2);
-		if (ret != 2) {
+		ret = drm_dp_dpcd_read_data(mgr->aux, DP_FAUX_CAP, buf, 2);
+		if (ret < 0) {
 			seq_printf(m, "faux/mst read failed\n");
 			goto out;
 		}
 		seq_printf(m, "faux/mst: %*ph\n", 2, buf);
 
-		ret = drm_dp_dpcd_read(mgr->aux, DP_MSTM_CTRL, buf, 1);
-		if (ret != 1) {
+		ret = drm_dp_dpcd_read_data(mgr->aux, DP_MSTM_CTRL, buf, 1);
+		if (ret < 0) {
 			seq_printf(m, "mst ctrl read failed\n");
 			goto out;
 		}
 		seq_printf(m, "mst ctrl: %*ph\n", 1, buf);
 
 		/* dump the standard OUI branch header */
-		ret = drm_dp_dpcd_read(mgr->aux, DP_BRANCH_OUI, buf, DP_BRANCH_OUI_HEADER_SIZE);
-		if (ret != DP_BRANCH_OUI_HEADER_SIZE) {
+		ret = drm_dp_dpcd_read_data(mgr->aux, DP_BRANCH_OUI, buf,
+					    DP_BRANCH_OUI_HEADER_SIZE);
+		if (ret < 0) {
 			seq_printf(m, "branch oui read failed\n");
 			goto out;
 		}
@@ -6104,14 +6101,14 @@ struct drm_dp_aux *drm_dp_mst_dsc_aux_for_port(struct drm_dp_mst_port *port)
 
 	/* DP-to-DP peer device */
 	if (drm_dp_mst_is_virtual_dpcd(immediate_upstream_port)) {
-		if (drm_dp_dpcd_read(&port->aux,
-				     DP_DSC_SUPPORT, &endpoint_dsc, 1) != 1)
+		if (drm_dp_dpcd_read_data(&port->aux,
+					  DP_DSC_SUPPORT, &endpoint_dsc, 1) < 0)
 			return NULL;
-		if (drm_dp_dpcd_read(&port->aux,
-				     DP_FEC_CAPABILITY, &endpoint_fec, 1) != 1)
+		if (drm_dp_dpcd_read_data(&port->aux,
+					  DP_FEC_CAPABILITY, &endpoint_fec, 1) < 0)
 			return NULL;
-		if (drm_dp_dpcd_read(&immediate_upstream_port->aux,
-				     DP_DSC_SUPPORT, &upstream_dsc, 1) != 1)
+		if (drm_dp_dpcd_read_data(&immediate_upstream_port->aux,
+					  DP_DSC_SUPPORT, &upstream_dsc, 1) < 0)
 			return NULL;
 
 		/* Enpoint decompression with DP-to-DP peer device */
@@ -6149,8 +6146,8 @@ struct drm_dp_aux *drm_dp_mst_dsc_aux_for_port(struct drm_dp_mst_port *port)
 	if (drm_dp_has_quirk(&desc, DP_DPCD_QUIRK_DSC_WITHOUT_VIRTUAL_DPCD)) {
 		u8 dpcd_ext[DP_RECEIVER_CAP_SIZE];
 
-		if (drm_dp_dpcd_read(immediate_upstream_aux,
-				     DP_DSC_SUPPORT, &upstream_dsc, 1) != 1)
+		if (drm_dp_dpcd_read_data(immediate_upstream_aux,
+					  DP_DSC_SUPPORT, &upstream_dsc, 1) < 0)
 			return NULL;
 
 		if (!(upstream_dsc & DP_DSC_DECOMPRESSION_IS_SUPPORTED))
@@ -6172,11 +6169,11 @@ struct drm_dp_aux *drm_dp_mst_dsc_aux_for_port(struct drm_dp_mst_port *port)
 	 * therefore the endpoint needs to be
 	 * both DSC and FEC capable.
 	 */
-	if (drm_dp_dpcd_read(&port->aux,
-	   DP_DSC_SUPPORT, &endpoint_dsc, 1) != 1)
+	if (drm_dp_dpcd_read_data(&port->aux,
+				  DP_DSC_SUPPORT, &endpoint_dsc, 1) < 0)
 		return NULL;
-	if (drm_dp_dpcd_read(&port->aux,
-	   DP_FEC_CAPABILITY, &endpoint_fec, 1) != 1)
+	if (drm_dp_dpcd_read_data(&port->aux,
+				  DP_FEC_CAPABILITY, &endpoint_fec, 1) < 0)
 		return NULL;
 	if ((endpoint_dsc & DP_DSC_DECOMPRESSION_IS_SUPPORTED) &&
 	   (endpoint_fec & DP_FEC_CAPABLE))

-- 
2.39.5

