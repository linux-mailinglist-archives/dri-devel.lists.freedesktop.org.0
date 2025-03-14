Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 310B4A607D3
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 04:39:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB3CA10E289;
	Fri, 14 Mar 2025 03:39:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="dnh3dwFV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
 by gabe.freedesktop.org (Postfix) with ESMTP id CA48910E289
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 03:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=2a2NW
 3UqryyRJnCGgSJ1wvchXl4pZnQGntQzL3ReM88=; b=dnh3dwFV0JdaiHHcdb9gk
 RAyiJlhlsvjaapRkfkBe/x4OyvCOOWttt/Cs6Sx/UiEKoYYCao9HIG0nCDRsH5Xv
 vhvPREpzo/7QpeuJp/kLXVOD3auzLqntVSQCLS1+BNBbpp3cuviQ6R2/X4iA3abA
 Jyj+gz+idzRigEkScuSM9w=
Received: from ProDesk.. (unknown [])
 by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id
 _____wC3bE_SpNNn4bIfSw--.42501S3; 
 Fri, 14 Mar 2025 11:39:05 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: lumag@kernel.org
Cc: mripard@kernel.org, neil.armstrong@linaro.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org,
 jani.nikula@intel.com, lyude@redhat.com, jonathanh@nvidia.com,
 thierry.reding@gmail.com, victor.liu@nxp.com, rfoss@kernel.org,
 linux-rockchip@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH 2/5] drm/bridge: cdns-mhdp8546: Switch to common helpers to
 power up/down dp link
Date: Fri, 14 Mar 2025 11:38:41 +0800
Message-ID: <20250314033856.538352-2-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250314033856.538352-1-andyshrk@163.com>
References: <20250314033856.538352-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wC3bE_SpNNn4bIfSw--.42501S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxZw18Xr1xtF4xAF4UZF4fXwb_yoW5ZFy5pF
 ZxW34UtF4vvw4DZF4ktF10vr43A3W7Ca1kGrW8Gw48Z3WYya4Dta4akF17JFWrGr97Ca1a
 qFnYvayxWFZ2kr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jzLvtUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0gUQXmfTn9eT4wABsU
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

From: Andy Yan <andy.yan@rock-chips.com>

Use the common dp link power up/down helpers to avoid duplicating code.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

 .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 74 +------------------
 1 file changed, 2 insertions(+), 72 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index 81fad14c2cd5..6094ecde35ff 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -545,76 +545,6 @@ int cdns_mhdp_adjust_lt(struct cdns_mhdp_device *mhdp, unsigned int nlanes,
 	return ret;
 }
 
-/**
- * cdns_mhdp_link_power_up() - power up a DisplayPort link
- * @aux: DisplayPort AUX channel
- * @link: pointer to a structure containing the link configuration
- *
- * Returns 0 on success or a negative error code on failure.
- */
-static
-int cdns_mhdp_link_power_up(struct drm_dp_aux *aux, struct cdns_mhdp_link *link)
-{
-	u8 value;
-	int err;
-
-	/* DP_SET_POWER register is only available on DPCD v1.1 and later */
-	if (link->revision < 0x11)
-		return 0;
-
-	err = drm_dp_dpcd_readb(aux, DP_SET_POWER, &value);
-	if (err < 0)
-		return err;
-
-	value &= ~DP_SET_POWER_MASK;
-	value |= DP_SET_POWER_D0;
-
-	err = drm_dp_dpcd_writeb(aux, DP_SET_POWER, value);
-	if (err < 0)
-		return err;
-
-	/*
-	 * According to the DP 1.1 specification, a "Sink Device must exit the
-	 * power saving state within 1 ms" (Section 2.5.3.1, Table 5-52, "Sink
-	 * Control Field" (register 0x600).
-	 */
-	usleep_range(1000, 2000);
-
-	return 0;
-}
-
-/**
- * cdns_mhdp_link_power_down() - power down a DisplayPort link
- * @aux: DisplayPort AUX channel
- * @link: pointer to a structure containing the link configuration
- *
- * Returns 0 on success or a negative error code on failure.
- */
-static
-int cdns_mhdp_link_power_down(struct drm_dp_aux *aux,
-			      struct cdns_mhdp_link *link)
-{
-	u8 value;
-	int err;
-
-	/* DP_SET_POWER register is only available on DPCD v1.1 and later */
-	if (link->revision < 0x11)
-		return 0;
-
-	err = drm_dp_dpcd_readb(aux, DP_SET_POWER, &value);
-	if (err < 0)
-		return err;
-
-	value &= ~DP_SET_POWER_MASK;
-	value |= DP_SET_POWER_D3;
-
-	err = drm_dp_dpcd_writeb(aux, DP_SET_POWER, value);
-	if (err < 0)
-		return err;
-
-	return 0;
-}
-
 /**
  * cdns_mhdp_link_configure() - configure a DisplayPort link
  * @aux: DisplayPort AUX channel
@@ -1453,7 +1383,7 @@ static int cdns_mhdp_link_up(struct cdns_mhdp_device *mhdp)
 		mhdp->link.capabilities |= DP_LINK_CAP_ENHANCED_FRAMING;
 
 	dev_dbg(mhdp->dev, "Set sink device power state via DPCD\n");
-	cdns_mhdp_link_power_up(&mhdp->aux, &mhdp->link);
+	drm_dp_link_power_up(&mhdp->aux, mhdp->link.revision);
 
 	cdns_mhdp_fill_sink_caps(mhdp, dpcd);
 
@@ -1500,7 +1430,7 @@ static void cdns_mhdp_link_down(struct cdns_mhdp_device *mhdp)
 	WARN_ON(!mutex_is_locked(&mhdp->link_mutex));
 
 	if (mhdp->plugged)
-		cdns_mhdp_link_power_down(&mhdp->aux, &mhdp->link);
+		drm_dp_link_power_down(&mhdp->aux, mhdp->link.revision);
 
 	mhdp->link_up = false;
 }
-- 
2.34.1

