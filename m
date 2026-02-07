Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gHY4A0sMh2mQTAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 07 Feb 2026 10:56:27 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C071056A4
	for <lists+dri-devel@lfdr.de>; Sat, 07 Feb 2026 10:56:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D828910E21C;
	Sat,  7 Feb 2026 09:56:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=huawei.com header.i=@huawei.com header.b="uMmtOERG";
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="uMmtOERG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0BE010E216
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Feb 2026 09:56:16 +0000 (UTC)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
 c=relaxed/relaxed; q=dns/txt; h=From;
 bh=lQzJiDlQmkLEbZnwSaMgzOTay0f0SozmEbd6odkr0R8=;
 b=uMmtOERGPMiJeZeBfm0AfN948UHRTG1zTuUVMwa12DYerfLW2gIk4HLuSy+Zylb3C3cpU5oEs
 o95zpVhnXoldz6sIzDKEOIq6/k5IqGocf42R0t8NOWs/9jVKih2j2tBpG3oj9prTXZ8udGcvkD/
 2W2XtMDMsjjPjWSviJKcyZg=
Received: from canpmsgout02.his.huawei.com (unknown [172.19.92.185])
 by szxga01-in.huawei.com (SkyGuard) with ESMTPS id 4f7RCd1R4Gz1BFsW
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Feb 2026 17:55:25 +0800 (CST)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
 c=relaxed/relaxed; q=dns/txt; h=From;
 bh=lQzJiDlQmkLEbZnwSaMgzOTay0f0SozmEbd6odkr0R8=;
 b=uMmtOERGPMiJeZeBfm0AfN948UHRTG1zTuUVMwa12DYerfLW2gIk4HLuSy+Zylb3C3cpU5oEs
 o95zpVhnXoldz6sIzDKEOIq6/k5IqGocf42R0t8NOWs/9jVKih2j2tBpG3oj9prTXZ8udGcvkD/
 2W2XtMDMsjjPjWSviJKcyZg=
Received: from mail.maildlp.com (unknown [172.19.162.223])
 by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4f7R7M5BLwzcb0x;
 Sat,  7 Feb 2026 17:51:43 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
 by mail.maildlp.com (Postfix) with ESMTPS id BCFD440569;
 Sat,  7 Feb 2026 17:56:11 +0800 (CST)
Received: from kwepemq100007.china.huawei.com (7.202.195.175) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
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
Subject: [PATCH drm-dp 4/4] drm/hisilicon/hibmc: use clock to look up the PLL
 value
Date: Sat, 7 Feb 2026 17:48:37 +0800
Message-ID: <20260207094837.1468985-5-shiyongbang@huawei.com>
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
	NEURAL_HAM(-0.00)[-0.940];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[huawei.com:email,huawei.com:dkim,huawei.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A7C071056A4
X-Rspamd-Action: no action

From: Lin He <helin52@huawei.com>

In the past, we use width and height to look up our PLL value.
But actually the actual clock check is also necessnary. There are
some resolutions that width and height same, but its clock different.
Add the clock check when using pll_table to determine the PLL value.

Fixes: da52605eea8f ("drm/hisilicon/hibmc: Add support for display engine")
Signed-off-by: Lin He <helin52@huawei.com>
Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
---
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_de.c    | 80 +++++++++++--------
 1 file changed, 46 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
index 89bed78f1466..8561acbbc3c8 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
@@ -22,6 +22,8 @@
 #include "hibmc_drm_drv.h"
 #include "hibmc_drm_regs.h"
 
+#define CLOCK_TOLERANCE 100 /* kHz tolerance */
+
 struct hibmc_display_panel_pll {
 	u64 M;
 	u64 N;
@@ -32,26 +34,43 @@ struct hibmc_display_panel_pll {
 struct hibmc_dislay_pll_config {
 	u64 hdisplay;
 	u64 vdisplay;
+	int clock;
 	u32 pll1_config_value;
 	u32 pll2_config_value;
 };
 
 static const struct hibmc_dislay_pll_config hibmc_pll_table[] = {
-	{640, 480, CRT_PLL1_HS_25MHZ, CRT_PLL2_HS_25MHZ},
-	{800, 600, CRT_PLL1_HS_40MHZ, CRT_PLL2_HS_40MHZ},
-	{1024, 768, CRT_PLL1_HS_65MHZ, CRT_PLL2_HS_65MHZ},
-	{1152, 864, CRT_PLL1_HS_80MHZ_1152, CRT_PLL2_HS_80MHZ},
-	{1280, 768, CRT_PLL1_HS_80MHZ, CRT_PLL2_HS_80MHZ},
-	{1280, 720, CRT_PLL1_HS_74MHZ, CRT_PLL2_HS_74MHZ},
-	{1280, 960, CRT_PLL1_HS_108MHZ, CRT_PLL2_HS_108MHZ},
-	{1280, 1024, CRT_PLL1_HS_108MHZ, CRT_PLL2_HS_108MHZ},
-	{1440, 900, CRT_PLL1_HS_106MHZ, CRT_PLL2_HS_106MHZ},
-	{1600, 900, CRT_PLL1_HS_108MHZ, CRT_PLL2_HS_108MHZ},
-	{1600, 1200, CRT_PLL1_HS_162MHZ, CRT_PLL2_HS_162MHZ},
-	{1920, 1080, CRT_PLL1_HS_148MHZ, CRT_PLL2_HS_148MHZ},
-	{1920, 1200, CRT_PLL1_HS_193MHZ, CRT_PLL2_HS_193MHZ},
+	{640, 480, 25000, CRT_PLL1_HS_25MHZ, CRT_PLL2_HS_25MHZ},
+	{800, 600, 40000, CRT_PLL1_HS_40MHZ, CRT_PLL2_HS_40MHZ},
+	{1024, 768, 65000, CRT_PLL1_HS_65MHZ, CRT_PLL2_HS_65MHZ},
+	{1152, 864, 78750, CRT_PLL1_HS_80MHZ_1152, CRT_PLL2_HS_80MHZ},
+	{1280, 768, 80000, CRT_PLL1_HS_80MHZ, CRT_PLL2_HS_80MHZ},
+	{1280, 720, 74375, CRT_PLL1_HS_74MHZ, CRT_PLL2_HS_74MHZ},
+	{1280, 960, 108000, CRT_PLL1_HS_108MHZ, CRT_PLL2_HS_108MHZ},
+	{1280, 1024, 108000, CRT_PLL1_HS_108MHZ, CRT_PLL2_HS_108MHZ},
+	{1440, 900, 105952, CRT_PLL1_HS_106MHZ, CRT_PLL2_HS_106MHZ},
+	{1600, 900, 108000, CRT_PLL1_HS_108MHZ, CRT_PLL2_HS_108MHZ},
+	{1600, 1200, 162500, CRT_PLL1_HS_162MHZ, CRT_PLL2_HS_162MHZ},
+	{1920, 1080, 148750, CRT_PLL1_HS_148MHZ, CRT_PLL2_HS_148MHZ},
+	{1920, 1200, 193750, CRT_PLL1_HS_193MHZ, CRT_PLL2_HS_193MHZ},
 };
 
+static int hibmc_get_best_clock_idx(const struct drm_display_mode *mode)
+{
+	int i, diff;
+
+	for (i = 0; i < ARRAY_SIZE(hibmc_pll_table); i++) {
+		if (hibmc_pll_table[i].hdisplay == mode->hdisplay &&
+		    hibmc_pll_table[i].vdisplay == mode->vdisplay) {
+			diff = abs(mode->clock - hibmc_pll_table[i].clock);
+			if (diff < mode->clock / 100) /* tolerance 1/100 */
+				return i;
+		}
+	}
+
+	return -EOPNOTSUPP;
+}
+
 static int hibmc_plane_atomic_check(struct drm_plane *plane,
 				    struct drm_atomic_state *state)
 {
@@ -214,17 +233,13 @@ static enum drm_mode_status
 hibmc_crtc_mode_valid(struct drm_crtc *crtc,
 		      const struct drm_display_mode *mode)
 {
-	size_t i = 0;
 	int vrefresh = drm_mode_vrefresh(mode);
 
 	if (vrefresh < 59 || vrefresh > 61)
 		return MODE_NOCLOCK;
 
-	for (i = 0; i < ARRAY_SIZE(hibmc_pll_table); i++) {
-		if (hibmc_pll_table[i].hdisplay == mode->hdisplay &&
-		    hibmc_pll_table[i].vdisplay == mode->vdisplay)
-			return MODE_OK;
-	}
+	if (hibmc_get_best_clock_idx(mode) >= 0)
+		return MODE_OK;
 
 	return MODE_BAD;
 }
@@ -281,23 +296,20 @@ static void set_vclock_hisilicon(struct drm_device *dev, u64 pll)
 	writel(val, priv->mmio + CRT_PLL1_HS);
 }
 
-static void get_pll_config(u64 x, u64 y, u32 *pll1, u32 *pll2)
+static void get_pll_config(struct drm_display_mode *mode, u32 *pll1, u32 *pll2)
 {
-	size_t i;
-	size_t count = ARRAY_SIZE(hibmc_pll_table);
-
-	for (i = 0; i < count; i++) {
-		if (hibmc_pll_table[i].hdisplay == x &&
-		    hibmc_pll_table[i].vdisplay == y) {
-			*pll1 = hibmc_pll_table[i].pll1_config_value;
-			*pll2 = hibmc_pll_table[i].pll2_config_value;
-			return;
-		}
+	int idx;
+
+	idx = hibmc_get_best_clock_idx(mode);
+	if (idx < 0) {
+		/* if found none, we use default value */
+		*pll1 = CRT_PLL1_HS_25MHZ;
+		*pll2 = CRT_PLL2_HS_25MHZ;
+		return;
 	}
 
-	/* if found none, we use default value */
-	*pll1 = CRT_PLL1_HS_25MHZ;
-	*pll2 = CRT_PLL2_HS_25MHZ;
+	*pll1 = hibmc_pll_table[idx].pll1_config_value;
+	*pll2 = hibmc_pll_table[idx].pll2_config_value;
 }
 
 /*
@@ -319,7 +331,7 @@ static u32 display_ctrl_adjust(struct drm_device *dev,
 	x = mode->hdisplay;
 	y = mode->vdisplay;
 
-	get_pll_config(x, y, &pll1, &pll2);
+	get_pll_config(mode, &pll1, &pll2);
 	writel(pll2, priv->mmio + CRT_PLL2_HS);
 	set_vclock_hisilicon(dev, pll1);
 
-- 
2.33.0

