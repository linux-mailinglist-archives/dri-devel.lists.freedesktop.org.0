Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F1D9F5C7E
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 02:59:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F31CB10E484;
	Wed, 18 Dec 2024 01:59:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="g/C4WVSU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [IPv6:2a00:1098:5b::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7817810E484
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 01:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=fvWjV+WoCvCiUYH1QrxuKTN+iR1HO0UZuMqDsRyqOqw=; b=g/C4WVSUvDeIq7GW
 w7cysvSH60gmvv+5KYRAzatIkkHzvqaUF5zREVdCB84OlYw1lKSRBlIaWK74DSotn8/0kCNNuP8cc
 GThBcrYgZRf8v7BDHEQ0NiHYazHtDjqTtn4ckwqCc8rW34NzVXuJuL/hckWDLmKE9soDygakcGscP
 3sFdWp6B5g80DqhhJTMkxPCWdT6X41tKUj0zmrWJ+4DAZ2YJJkaSdTYqXsyRnnQvlwpbdobC+NN0F
 lwLsKEYqvW92lW5yNsAPE8HqsGiJybz1WS68rSa69eLjcEDAymgeubZGFe7/nRYalpRdEE2O5YQdh
 sv7IHIj4ctn/Zyi8og==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1tNjLe-0060Ro-17;
 Wed, 18 Dec 2024 01:59:38 +0000
From: linux@treblig.org
To: deller@gmx.de,
	linux-omap@vger.kernel.org
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] fbdev: omapfb: Remove unused hdmi5_core_handle_irqs
Date: Wed, 18 Dec 2024 01:59:37 +0000
Message-ID: <20241218015937.278817-1-linux@treblig.org>
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

hdmi5_core_handle_irqs() has been unused since
commit f5bab2229190 ("OMAPDSS: HDMI: Add OMAP5 HDMI support")

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 .../video/fbdev/omap2/omapfb/dss/hdmi5_core.c   | 17 -----------------
 .../video/fbdev/omap2/omapfb/dss/hdmi5_core.h   |  1 -
 2 files changed, 18 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/dss/hdmi5_core.c b/drivers/video/fbdev/omap2/omapfb/dss/hdmi5_core.c
index b33f62c5cb22..bb7fe54dd019 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/hdmi5_core.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/hdmi5_core.c
@@ -567,23 +567,6 @@ static void hdmi_core_enable_interrupts(struct hdmi_core_data *core)
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
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/hdmi5_core.h b/drivers/video/fbdev/omap2/omapfb/dss/hdmi5_core.h
index 192c9b6e2f7b..493857374a15 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/hdmi5_core.h
+++ b/drivers/video/fbdev/omap2/omapfb/dss/hdmi5_core.h
@@ -283,7 +283,6 @@ struct csc_table {
 
 int hdmi5_read_edid(struct hdmi_core_data *core, u8 *edid, int len);
 void hdmi5_core_dump(struct hdmi_core_data *core, struct seq_file *s);
-int hdmi5_core_handle_irqs(struct hdmi_core_data *core);
 void hdmi5_configure(struct hdmi_core_data *core, struct hdmi_wp_data *wp,
 			struct hdmi_config *cfg);
 int hdmi5_core_init(struct platform_device *pdev, struct hdmi_core_data *core);
-- 
2.47.1

