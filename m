Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uA1HAkwMh2mQTAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 07 Feb 2026 10:56:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A50DB1056AB
	for <lists+dri-devel@lfdr.de>; Sat, 07 Feb 2026 10:56:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E05410E230;
	Sat,  7 Feb 2026 09:56:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=huawei.com header.i=@huawei.com header.b="l0DqnOSq";
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="l0DqnOSq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A444C10E217
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Feb 2026 09:56:16 +0000 (UTC)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
 c=relaxed/relaxed; q=dns/txt; h=From;
 bh=gaaccTEGgYSF/Y51slW2XBH57ChBtzMNGdlBF3cTEnw=;
 b=l0DqnOSqYvjKukF9hAc+24Z2WXAINJ3+aTUUGdcBfp0AH8lz6CGNXFr0IvfRHn/DTh7r6JakL
 l6iG2d/x25pZaItMxOtt2jXSMadW+VcVnXL88PtxUtUknexYW/nUbC57BcSe8wcY4+cke2Suz+B
 /xIZuzfFCWL2aH8CmvLb3Jg=
Received: from canpmsgout03.his.huawei.com (unknown [172.19.92.159])
 by szxga01-in.huawei.com (SkyGuard) with ESMTPS id 4f7RCd15rJz1BFsF
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Feb 2026 17:55:25 +0800 (CST)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
 c=relaxed/relaxed; q=dns/txt; h=From;
 bh=gaaccTEGgYSF/Y51slW2XBH57ChBtzMNGdlBF3cTEnw=;
 b=l0DqnOSqYvjKukF9hAc+24Z2WXAINJ3+aTUUGdcBfp0AH8lz6CGNXFr0IvfRHn/DTh7r6JakL
 l6iG2d/x25pZaItMxOtt2jXSMadW+VcVnXL88PtxUtUknexYW/nUbC57BcSe8wcY4+cke2Suz+B
 /xIZuzfFCWL2aH8CmvLb3Jg=
Received: from mail.maildlp.com (unknown [172.19.162.197])
 by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4f7R7b2DXczpSvG;
 Sat,  7 Feb 2026 17:51:55 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
 by mail.maildlp.com (Postfix) with ESMTPS id 538E940569;
 Sat,  7 Feb 2026 17:56:11 +0800 (CST)
Received: from kwepemq100007.china.huawei.com (7.202.195.175) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 7 Feb 2026 17:56:11 +0800
Received: from localhost.huawei.com (10.169.71.169) by
 kwepemq100007.china.huawei.com (7.202.195.175) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 7 Feb 2026 17:56:10 +0800
From: Yongbang Shi <shiyongbang@huawei.com>
To: <xinliang.liu@linaro.org>, <tiantao6@hisilicon.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <kong.kongxinwei@hisilicon.com>, <dmitry.baryshkov@oss.qualcomm.com>
CC: <liangjian010@huawei.com>, <chenjianmin@huawei.com>,
 <fengsheng5@huawei.com>, <shiyongbang@huawei.com>, <helin52@h-partners.com>,
 <shenjian15@huawei.com>, <shaojijie@huawei.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH drm-dp 3/4] drm/hisilicon/hibmc: move display contrl config to
 hibmc_probe()
Date: Sat, 7 Feb 2026 17:48:36 +0800
Message-ID: <20260207094837.1468985-4-shiyongbang@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20260207094837.1468985-1-shiyongbang@huawei.com>
References: <20260207094837.1468985-1-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.169.71.169]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemq100007.china.huawei.com (7.202.195.175)
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
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[huawei.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[huawei.com:s=dkim];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xinliang.liu@linaro.org,m:tiantao6@hisilicon.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:daniel@ffwll.ch,m:kong.kongxinwei@hisilicon.com,m:dmitry.baryshkov@oss.qualcomm.com,m:liangjian010@huawei.com,m:chenjianmin@huawei.com,m:fengsheng5@huawei.com,m:shiyongbang@huawei.com,m:helin52@h-partners.com,m:shenjian15@huawei.com,m:shaojijie@huawei.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,hisilicon.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER(0.00)[shiyongbang@huawei.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shiyongbang@huawei.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[huawei.com:+];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.939];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,huawei.com:email,huawei.com:dkim,huawei.com:mid];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A50DB1056AB
X-Rspamd-Action: no action

From: Lin He <helin52@huawei.com>

If there's no VGA output, this encoder modeset won't be called, which
will cause displaying data from GPU being cut off. It's actually a
common display config for DP and VGA, so move the vdac encoder modeset
to driver load stage.

Fixes: 5294967f4ae4 ("drm/hisilicon/hibmc: Add support for VDAC")
Signed-off-by: Lin He <helin52@huawei.com>
Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
---
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   | 14 ++++++++++++
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c  | 22 -------------------
 2 files changed, 14 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
index 289304500ab0..c7ce44a5370b 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
@@ -214,6 +214,18 @@ void hibmc_set_current_gate(struct hibmc_drm_private *priv, unsigned int gate)
 	writel(gate, mmio + gate_reg);
 }
 
+static void hibmc_display_ctrl(struct hibmc_drm_private *priv)
+{
+	u32 reg;
+
+	reg = readl(priv->mmio + HIBMC_DISPLAY_CONTROL_HISILE);
+	reg |= HIBMC_DISPLAY_CONTROL_FPVDDEN(1);
+	reg |= HIBMC_DISPLAY_CONTROL_PANELDATE(1);
+	reg |= HIBMC_DISPLAY_CONTROL_FPEN(1);
+	reg |= HIBMC_DISPLAY_CONTROL_VBIASEN(1);
+	writel(reg, priv->mmio + HIBMC_DISPLAY_CONTROL_HISILE);
+}
+
 static void hibmc_hw_config(struct hibmc_drm_private *priv)
 {
 	u32 reg;
@@ -245,6 +257,8 @@ static void hibmc_hw_config(struct hibmc_drm_private *priv)
 	reg |= HIBMC_MSCCTL_LOCALMEM_RESET(1);
 
 	writel(reg, priv->mmio + HIBMC_MISC_CTRL);
+
+	hibmc_display_ctrl(priv);
 }
 
 static int hibmc_hw_map(struct hibmc_drm_private *priv)
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
index 502494cba541..b02e9753112b 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
@@ -85,26 +85,6 @@ static const struct drm_connector_funcs hibmc_connector_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
-static void hibmc_encoder_mode_set(struct drm_encoder *encoder,
-				   struct drm_display_mode *mode,
-				   struct drm_display_mode *adj_mode)
-{
-	u32 reg;
-	struct drm_device *dev = encoder->dev;
-	struct hibmc_drm_private *priv = to_hibmc_drm_private(dev);
-
-	reg = readl(priv->mmio + HIBMC_DISPLAY_CONTROL_HISILE);
-	reg |= HIBMC_DISPLAY_CONTROL_FPVDDEN(1);
-	reg |= HIBMC_DISPLAY_CONTROL_PANELDATE(1);
-	reg |= HIBMC_DISPLAY_CONTROL_FPEN(1);
-	reg |= HIBMC_DISPLAY_CONTROL_VBIASEN(1);
-	writel(reg, priv->mmio + HIBMC_DISPLAY_CONTROL_HISILE);
-}
-
-static const struct drm_encoder_helper_funcs hibmc_encoder_helper_funcs = {
-	.mode_set = hibmc_encoder_mode_set,
-};
-
 int hibmc_vdac_init(struct hibmc_drm_private *priv)
 {
 	struct drm_device *dev = &priv->dev;
@@ -127,8 +107,6 @@ int hibmc_vdac_init(struct hibmc_drm_private *priv)
 		goto err;
 	}
 
-	drm_encoder_helper_add(encoder, &hibmc_encoder_helper_funcs);
-
 	ret = drm_connector_init_with_ddc(dev, connector,
 					  &hibmc_connector_funcs,
 					  DRM_MODE_CONNECTOR_VGA,
-- 
2.33.0

