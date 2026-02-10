Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wLTbIrbbimkOOgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 08:18:14 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA42117CE6
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 08:18:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93F9B10E4EA;
	Tue, 10 Feb 2026 07:18:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="V73MpKje";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m32116.qiye.163.com (mail-m32116.qiye.163.com
 [220.197.32.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D9DF10E4EA
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 07:18:11 +0000 (UTC)
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 33b530baf;
 Tue, 10 Feb 2026 15:13:03 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, inki.dae@samsung.com,
 sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org,
 alim.akhtar@samsung.com, jingoohan1@gmail.com, p.zabel@pengutronix.de,
 hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 dmitry.baryshkov@oss.qualcomm.com, dianders@chromium.org,
 m.szyprowski@samsung.com, luca.ceresoli@bootlin.com, jani.nikula@intel.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v9 11/15] drm/rockchip: analogix_dp: Apply
 analogix_dp_finish_probe()
Date: Tue, 10 Feb 2026 15:12:21 +0800
Message-Id: <20260210071225.2566099-12-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260210071225.2566099-1-damon.ding@rock-chips.com>
References: <20260210071225.2566099-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9c4665825103a3kunm1f53a888aefa75
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGU9LQ1ZDTklMTE8eHx1NTkpWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
 1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
 b=V73MpKje/vXZJnw4oGiaOp6oTPp5c/1tdHyeIho+qGHpkj6wP70LYz46kqidPVorFI5biuZ6SYGWQR8rxpsrUMqm9m7OjS5VxJkht5zPfUr33JJUk70Yq3X4JyOu/qoxjG4zwbtqcor/DIJ1MKvSC3u8aQBR5yepphY0GYbh/B0=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=mk0+XJCrbVuVI95YpCP85qcHGZMCnqLhGyVW6OtFE7c=;
 h=date:mime-version:subject:message-id:from;
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[rock-chips.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[rock-chips.com:s=default];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:inki.dae@samsung.com,m:sw0312.kim@samsung.com,m:kyungmin.park@samsung.com,m:krzk@kernel.org,m:alim.akhtar@samsung.com,m:jingoohan1@gmail.com,m:p.zabel@pengutronix.de,m:hjc@rock-chips.com,m:heiko@sntech.de,m:andy.yan@rock-chips.com,m:dmitry.baryshkov@oss.qualcomm.com,m:dianders@chromium.org,m:m.szyprowski@samsung.com,m:luca.ceresoli@bootlin.com,m:jani.nikula@intel.com,m:linux-kernel@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:damon.ding@rock-chips.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[damon.ding@rock-chips.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[37];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,pengutronix.de,samsung.com,rock-chips.com,sntech.de,oss.qualcomm.com,chromium.org,bootlin.com,intel.com,vger.kernel.org,lists.freedesktop.org,lists.linux.dev,lists.infradead.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[rock-chips.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[damon.ding@rock-chips.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sntech.de:email,rock-chips.com:mid,rock-chips.com:dkim,rock-chips.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 3DA42117CE6
X-Rspamd-Action: no action

Apply analogix_dp_finish_probe() in order to move the panel/bridge
parsing from Rockchip side to the Analogix side.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Tested-by: Heiko Stuebner <heiko@sntech.de> (on rk3588)

---

Changes in v4:
- Rename analogix_dp_find_panel_or_bridge() to
  analogix_dp_finish_probe().

Changes in v5:
- Remove DRM_DISPLAY_DP_AUX_BUS for ROCKCHIP_ANALOGIX_DP

Changes in v9:
- Add Tested-by tag.
---
 .../gpu/drm/rockchip/analogix_dp-rockchip.c   | 38 +------------------
 1 file changed, 2 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
index 7fa17ba26c46..832e9766bef0 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -21,14 +21,12 @@
 #include <video/of_videomode.h>
 #include <video/videomode.h>
 
-#include <drm/display/drm_dp_aux_bus.h>
 #include <drm/display/drm_dp_helper.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge_connector.h>
 #include <drm/bridge/analogix_dp.h>
 #include <drm/drm_of.h>
-#include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
@@ -417,24 +415,6 @@ static const struct component_ops rockchip_dp_component_ops = {
 	.unbind = rockchip_dp_unbind,
 };
 
-static int rockchip_dp_link_panel(struct drm_dp_aux *aux)
-{
-	struct analogix_dp_plat_data *plat_data = analogix_dp_aux_to_plat_data(aux);
-	struct rockchip_dp_device *dp = pdata_encoder_to_dp(plat_data);
-	int ret;
-
-	/*
-	 * If drm_of_find_panel_or_bridge() returns -ENODEV, there may be no valid panel
-	 * or bridge nodes. The driver should go on for the driver-free bridge or the DP
-	 * mode applications.
-	 */
-	ret = drm_of_find_panel_or_bridge(dp->dev->of_node, 1, 0, &plat_data->panel, NULL);
-	if (ret && ret != -ENODEV)
-		return ret;
-
-	return component_add(dp->dev, &rockchip_dp_component_ops);
-}
-
 static int rockchip_dp_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -473,6 +453,7 @@ static int rockchip_dp_probe(struct platform_device *pdev)
 	dp->plat_data.dev_type = dp->data->chip_type;
 	dp->plat_data.power_on = rockchip_dp_poweron;
 	dp->plat_data.power_off = rockchip_dp_powerdown;
+	dp->plat_data.ops = &rockchip_dp_component_ops;
 
 	ret = rockchip_dp_of_probe(dp);
 	if (ret < 0)
@@ -484,22 +465,7 @@ static int rockchip_dp_probe(struct platform_device *pdev)
 	if (IS_ERR(dp->adp))
 		return PTR_ERR(dp->adp);
 
-	ret = devm_of_dp_aux_populate_bus(analogix_dp_get_aux(dp->adp), rockchip_dp_link_panel);
-	if (ret) {
-		/*
-		 * If devm_of_dp_aux_populate_bus() returns -ENODEV, the done_probing() will not
-		 * be called because there are no EP devices. Then the rockchip_dp_link_panel()
-		 * will be called directly in order to support the other valid DT configurations.
-		 *
-		 * NOTE: The devm_of_dp_aux_populate_bus() is allowed to return -EPROBE_DEFER.
-		 */
-		if (ret != -ENODEV)
-			return dev_err_probe(dp->dev, ret, "failed to populate aux bus\n");
-
-		return rockchip_dp_link_panel(analogix_dp_get_aux(dp->adp));
-	}
-
-	return 0;
+	return analogix_dp_finish_probe(dp->adp);
 }
 
 static void rockchip_dp_remove(struct platform_device *pdev)
-- 
2.34.1

