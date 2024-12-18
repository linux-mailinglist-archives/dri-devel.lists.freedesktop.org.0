Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 790A99F5C86
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 03:01:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BC4310E41B;
	Wed, 18 Dec 2024 02:01:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="opR4lpxn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [IPv6:2a00:1098:5b::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 365E410E41B
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 02:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=Qh0nWV41X9SryCodaXXT0A6zUdLXy8TkuLue1NyLu8w=; b=opR4lpxnI5RG5RTd
 087i1mpbbAzJh/MvjVCIrzuaPgorloDdpemzBc33M+1361Zvv4GBqkd+gnQ6zjfBNS6z+D/erqriW
 lxOvRjmgvTkxVdEmcla4VKHdxnl1qQ7QlojY9nGCHHjNVZ2eRolWFOTrA26BKiIyhLIk/AAfngW3y
 WK8fOybMTiIxpjRmHZ1vVOB42PeEx88aYJpwnghwhPy7p42eP31mExDkFV2pNaKBcQCpoSiti1bUu
 T4WPd/4xQGinSLoNyy8671ddMgj3tRu8i0JBEojJAYzEsoIInQZP4+Rx3BfOiTLBW1mYxi223JWUX
 OzYSJdDfxE6I3o7rEQ==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1tNjNN-0060St-1q;
 Wed, 18 Dec 2024 02:01:25 +0000
From: linux@treblig.org
To: tomi.valkeinen@ideasonboard.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, simona@ffwll.ch, airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] drm/omap: Remove hdmi5_core_handle_irqs()
Date: Wed, 18 Dec 2024 02:01:24 +0000
Message-ID: <20241218020124.278925-1-linux@treblig.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: "Dr. David Alan Gilbert" <linux@treblig.org>

hdmi5_core_handle_irqs() is a function that was copied from omapdss by
commit f76ee892a99e ("omapfb: copy omapdss & displays for omapfb")

but it wasn't used in the original anyway.

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/gpu/drm/omapdrm/dss/hdmi5_core.c | 17 -----------------
 drivers/gpu/drm/omapdrm/dss/hdmi5_core.h |  1 -
 2 files changed, 18 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi5_core.c b/drivers/gpu/drm/omapdrm/dss/hdmi5_core.c
index 21564c38234f..12ef47cd232b 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi5_core.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi5_core.c
@@ -545,23 +545,6 @@ static void hdmi_core_enable_interrupts(struct hdmi_core_data *core)
 	REG_FLD_MOD(core->base, HDMI_CORE_IH_MUTE, 0x0, 1, 0);
 }
 
-int hdmi5_core_handle_irqs(struct hdmi_core_data *core)
-{
-	void __iomem *base = core->base;
-
-	REG_FLD_MOD(base, HDMI_CORE_IH_FC_STAT0, 0xff, 7, 0);
-	REG_FLD_MOD(base, HDMI_CORE_IH_FC_STAT1, 0xff, 7, 0);
-	REG_FLD_MOD(base, HDMI_CORE_IH_FC_STAT2, 0xff, 7, 0);
-	REG_FLD_MOD(base, HDMI_CORE_IH_AS_STAT0, 0xff, 7, 0);
-	REG_FLD_MOD(base, HDMI_CORE_IH_PHY_STAT0, 0xff, 7, 0);
-	REG_FLD_MOD(base, HDMI_CORE_IH_I2CM_STAT0, 0xff, 7, 0);
-	REG_FLD_MOD(base, HDMI_CORE_IH_CEC_STAT0, 0xff, 7, 0);
-	REG_FLD_MOD(base, HDMI_CORE_IH_VP_STAT0, 0xff, 7, 0);
-	REG_FLD_MOD(base, HDMI_CORE_IH_I2CMPHY_STAT0, 0xff, 7, 0);
-
-	return 0;
-}
-
 void hdmi5_configure(struct hdmi_core_data *core, struct hdmi_wp_data *wp,
 		struct hdmi_config *cfg)
 {
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi5_core.h b/drivers/gpu/drm/omapdrm/dss/hdmi5_core.h
index 070cbf5fb57d..b8ed21156e8c 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi5_core.h
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi5_core.h
@@ -286,7 +286,6 @@ int hdmi5_core_ddc_read(void *data, u8 *buf, unsigned int block, size_t len);
 void hdmi5_core_ddc_uninit(struct hdmi_core_data *core);
 
 void hdmi5_core_dump(struct hdmi_core_data *core, struct seq_file *s);
-int hdmi5_core_handle_irqs(struct hdmi_core_data *core);
 void hdmi5_configure(struct hdmi_core_data *core, struct hdmi_wp_data *wp,
 			struct hdmi_config *cfg);
 int hdmi5_core_init(struct platform_device *pdev, struct hdmi_core_data *core);
-- 
2.47.1

