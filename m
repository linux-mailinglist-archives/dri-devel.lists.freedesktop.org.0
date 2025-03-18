Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 060A2A66484
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 02:03:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41DEE10E2A2;
	Tue, 18 Mar 2025 01:03:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="otGbGjfs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70C9910E234
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 01:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DYR9CwhR1Wn8pX+zVemRbM359wsKs1LR5JXoTIamaZA=; b=otGbGjfsZAqJZQg6QGwGSdqJAD
 /SaZEc5jQSnkUqPPy7JXjzXfD1/QCBwaYpbVtAJKASdR4DpB3mVSh3ArdbP/NDzxt+V88O5rV6O0Q
 X2iO31d90iRklWqj6GgZD3QMulq0mD46Hm9SuLb541TwlY5u1on3rqOTM1R37v9rEn3iUDDXG0NvI
 Bv23vAe2AE2OUfPQGuBOqps7wW6W6AV9XBPeaeA5mbta3PRosJQM4Oq2p8Wld68r1zgyX8hrSJRLv
 +Rgsjh4F7F6y7uozepekAN7oPUf3aVVmEao8WOGkq9wztsBlFDZGmi7MrcMufXHeL0TaT7KxV5O8S
 m4Xx8dCw==;
Received: from [189.7.87.178] (helo=janis.local)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tuLMs-002UCS-7X; Tue, 18 Mar 2025 02:03:42 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Mon, 17 Mar 2025 22:01:13 -0300
Subject: [PATCH v6 5/5] drm/v3d: Use V3D_SMS registers for power on/off and
 reset on V3D 7.x
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250317-v3d-gpu-reset-fixes-v6-5-f3ee7717ed17@igalia.com>
References: <20250317-v3d-gpu-reset-fixes-v6-0-f3ee7717ed17@igalia.com>
In-Reply-To: <20250317-v3d-gpu-reset-fixes-v6-0-f3ee7717ed17@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Nicolas Saenz Julienne <nsaenz@kernel.org>, 
 Stefan Wahren <wahrenst@gmx.net>, 
 Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Phil Elwell <phil@raspberrypi.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, kernel-dev@igalia.com, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7721; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=2t7ZnqSDK8vV9zqiaXNZbEh+hE7r4f9jW0353bVwGYE=;
 b=kA0DAAgBP/MOinaI+qoByyZiAGfYxkihXt/PEQeY9kL2ZtlzGRdSE/zEyfxiEDhndh5itCixe
 4kBMwQAAQgAHRYhBPjkXX0BFncHKaZ30T/zDop2iPqqBQJn2MZIAAoJED/zDop2iPqq1CcH/3ce
 8QLdcXTJTH7u9FJ02sUSXu5BL1V8oNaPnFbYShumdn1TR63cPFeVLypkz14YZyeX/zlJC2AR0+8
 pzWmmbXTsmGU1GlEsVWV7iezDEUJTTGYWgNyUVkHBL04b3IWfvPWFr687FJFqxzl5r0AWd0d+iq
 OGGK38c9PLF2nOhGbBEcQrCuj887oNnWPNErMr713fn3NTkxOU4xvHDXfYY4+92/wMzvW1DzRon
 9aaqkhdO+pZC7UDt5jZdZxsRjiF2dKs8zhLqXJPsl9tOgXo0Z7UtS433aIe53Gvk3g/79VbLFD5
 4+JCmlcHYF7Su7JhBrbdSlIoXzZQlSOPrpEV/EQ=
X-Developer-Key: i=mcanal@igalia.com; a=openpgp;
 fpr=F8E45D7D0116770729A677D13FF30E8A7688FAAA
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

In addition to the standard reset controller, V3D 7.x requires configuring
the V3D_SMS registers for proper power on/off and reset. Add the new
registers to `v3d_regs.h` and ensure they are properly configured during
device probing, removal, and reset.

This change fixes GPU reset issues on the Raspberry Pi 5 (BCM2712).
Without exposing these registers, a GPU reset causes the GPU to hang,
stopping any further job execution and freezing the desktop GUI. The same
issue occurs when unloading and loading the v3d driver.

Link: https://github.com/raspberrypi/linux/issues/6660
Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_drv.c  | 40 ++++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/v3d/v3d_drv.h  | 11 +++++++++++
 drivers/gpu/drm/v3d/v3d_gem.c  | 17 +++++++++++++++++
 drivers/gpu/drm/v3d/v3d_regs.h | 26 ++++++++++++++++++++++++++
 4 files changed, 94 insertions(+)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
index c63f0ed1bd8a3d5511085e76ed2fbd6ee7df6f80..122848cdccc4a02039d9ea2e77aa2f377886b5d6 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.c
+++ b/drivers/gpu/drm/v3d/v3d_drv.c
@@ -263,6 +263,36 @@ static const struct of_device_id v3d_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, v3d_of_match);
 
+static void
+v3d_idle_sms(struct v3d_dev *v3d)
+{
+	if (v3d->ver < V3D_GEN_71)
+		return;
+
+	V3D_SMS_WRITE(V3D_SMS_TEE_CS, V3D_SMS_CLEAR_POWER_OFF);
+
+	if (wait_for((V3D_GET_FIELD(V3D_SMS_READ(V3D_SMS_TEE_CS),
+				    V3D_SMS_STATE) == V3D_SMS_IDLE), 100)) {
+		DRM_ERROR("Failed to power up SMS\n");
+	}
+
+	v3d_reset_sms(v3d);
+}
+
+static void
+v3d_power_off_sms(struct v3d_dev *v3d)
+{
+	if (v3d->ver < V3D_GEN_71)
+		return;
+
+	V3D_SMS_WRITE(V3D_SMS_TEE_CS, V3D_SMS_POWER_OFF);
+
+	if (wait_for((V3D_GET_FIELD(V3D_SMS_READ(V3D_SMS_TEE_CS),
+				    V3D_SMS_STATE) == V3D_SMS_POWER_OFF_STATE), 100)) {
+		DRM_ERROR("Failed to power off SMS\n");
+	}
+}
+
 static int
 map_regs(struct v3d_dev *v3d, void __iomem **regs, const char *name)
 {
@@ -300,6 +330,12 @@ static int v3d_platform_drm_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	if (v3d->ver >= V3D_GEN_71) {
+		ret = map_regs(v3d, &v3d->sms_regs, "sms");
+		if (ret)
+			return ret;
+	}
+
 	v3d->clk = devm_clk_get_optional(dev, NULL);
 	if (IS_ERR(v3d->clk))
 		return dev_err_probe(dev, PTR_ERR(v3d->clk), "Failed to get V3D clock\n");
@@ -310,6 +346,8 @@ static int v3d_platform_drm_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	v3d_idle_sms(v3d);
+
 	mmu_debug = V3D_READ(V3D_MMU_DEBUG_INFO);
 	mask = DMA_BIT_MASK(30 + V3D_GET_FIELD(mmu_debug, V3D_MMU_PA_WIDTH));
 	ret = dma_set_mask_and_coherent(dev, mask);
@@ -410,6 +448,8 @@ static void v3d_platform_drm_remove(struct platform_device *pdev)
 	dma_free_wc(v3d->drm.dev, 4096, v3d->mmu_scratch,
 		    v3d->mmu_scratch_paddr);
 
+	v3d_power_off_sms(v3d);
+
 	clk_disable_unprepare(v3d->clk);
 }
 
diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
index de4a9e18f6a9039edf57f406ab1cee9dad4c0a49..b51f0b648a08011f737317ec1841d5ab316355b2 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.h
+++ b/drivers/gpu/drm/v3d/v3d_drv.h
@@ -118,6 +118,7 @@ struct v3d_dev {
 	void __iomem *core_regs[3];
 	void __iomem *bridge_regs;
 	void __iomem *gca_regs;
+	void __iomem *sms_regs;
 	struct clk *clk;
 	struct reset_control *reset;
 
@@ -268,6 +269,15 @@ to_v3d_fence(struct dma_fence *fence)
 #define V3D_GCA_READ(offset) readl(v3d->gca_regs + offset)
 #define V3D_GCA_WRITE(offset, val) writel(val, v3d->gca_regs + offset)
 
+#define V3D_SMS_IDLE				0x0
+#define V3D_SMS_ISOLATING_FOR_RESET		0xa
+#define V3D_SMS_RESETTING			0xb
+#define V3D_SMS_ISOLATING_FOR_POWER_OFF	0xc
+#define V3D_SMS_POWER_OFF_STATE		0xd
+
+#define V3D_SMS_READ(offset) readl(v3d->sms_regs + (offset))
+#define V3D_SMS_WRITE(offset, val) writel(val, v3d->sms_regs + (offset))
+
 #define V3D_CORE_READ(core, offset) readl(v3d->core_regs[core] + offset)
 #define V3D_CORE_WRITE(core, offset, val) writel(val, v3d->core_regs[core] + offset)
 
@@ -546,6 +556,7 @@ struct dma_fence *v3d_fence_create(struct v3d_dev *v3d, enum v3d_queue queue);
 /* v3d_gem.c */
 int v3d_gem_init(struct drm_device *dev);
 void v3d_gem_destroy(struct drm_device *dev);
+void v3d_reset_sms(struct v3d_dev *v3d);
 void v3d_reset(struct v3d_dev *v3d);
 void v3d_invalidate_caches(struct v3d_dev *v3d);
 void v3d_clean_caches(struct v3d_dev *v3d);
diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
index 1ea6d3832c2212d9cbbd90236478d18491f0ff14..d7d16da78db328f004d1d702731d1a1b5437a394 100644
--- a/drivers/gpu/drm/v3d/v3d_gem.c
+++ b/drivers/gpu/drm/v3d/v3d_gem.c
@@ -104,6 +104,22 @@ v3d_reset_v3d(struct v3d_dev *v3d)
 	v3d_init_hw_state(v3d);
 }
 
+void
+v3d_reset_sms(struct v3d_dev *v3d)
+{
+	if (v3d->ver < V3D_GEN_71)
+		return;
+
+	V3D_SMS_WRITE(V3D_SMS_REE_CS, V3D_SET_FIELD(0x4, V3D_SMS_STATE));
+
+	if (wait_for(!(V3D_GET_FIELD(V3D_SMS_READ(V3D_SMS_REE_CS),
+				     V3D_SMS_STATE) == V3D_SMS_ISOLATING_FOR_RESET) &&
+		     !(V3D_GET_FIELD(V3D_SMS_READ(V3D_SMS_REE_CS),
+				     V3D_SMS_STATE) == V3D_SMS_RESETTING), 100)) {
+		DRM_ERROR("Failed to wait for SMS reset\n");
+	}
+}
+
 void
 v3d_reset(struct v3d_dev *v3d)
 {
@@ -119,6 +135,7 @@ v3d_reset(struct v3d_dev *v3d)
 		v3d_idle_axi(v3d, 0);
 
 	v3d_idle_gca(v3d);
+	v3d_reset_sms(v3d);
 	v3d_reset_v3d(v3d);
 
 	v3d_mmu_set_page_table(v3d);
diff --git a/drivers/gpu/drm/v3d/v3d_regs.h b/drivers/gpu/drm/v3d/v3d_regs.h
index 6da3c69082bd6d5954bf88bd9ff2543a5e4e04c4..c1870265eaeecc188afc4f09cf13a5201d3aa1c6 100644
--- a/drivers/gpu/drm/v3d/v3d_regs.h
+++ b/drivers/gpu/drm/v3d/v3d_regs.h
@@ -515,4 +515,30 @@
 # define V3D_ERR_VPAERGS                               BIT(1)
 # define V3D_ERR_VPAEABB                               BIT(0)
 
+#define V3D_SMS_REE_CS                                 0x00000
+#define V3D_SMS_TEE_CS                                 0x00400
+# define V3D_SMS_INTERRUPT                             BIT(31)
+# define V3D_SMS_POWER_OFF                             BIT(30)
+# define V3D_SMS_CLEAR_POWER_OFF                       BIT(29)
+# define V3D_SMS_LOCK                                  BIT(28)
+# define V3D_SMS_CLEAR_LOCK                            BIT(27)
+# define V3D_SMS_SVP_MODE_EXIT                         BIT(26)
+# define V3D_SMS_CLEAR_SVP_MODE_EXIT                   BIT(25)
+# define V3D_SMS_SVP_MODE_ENTER                        BIT(24)
+# define V3D_SMS_CLEAR_SVP_MODE_ENTER                  BIT(23)
+# define V3D_SMS_THEIR_MODE_EXIT                       BIT(22)
+# define V3D_SMS_THEIR_MODE_ENTER                      BIT(21)
+# define V3D_SMS_OUR_MODE_EXIT                         BIT(20)
+# define V3D_SMS_CLEAR_OUR_MODE_EXIT                   BIT(19)
+# define V3D_SMS_SEQ_PC_MASK                           V3D_MASK(16, 10)
+# define V3D_SMS_SEQ_PC_SHIFT                          10
+# define V3D_SMS_HUBCORE_STATUS_MASK                   V3D_MASK(9, 8)
+# define V3D_SMS_HUBCORE_STATUS_SHIFT                  8
+# define V3D_SMS_NEW_MODE_MASK                         V3D_MASK(7, 6)
+# define V3D_SMS_NEW_MODE_SHIFT                        6
+# define V3D_SMS_OLD_MODE_MASK                         V3D_MASK(5, 4)
+# define V3D_SMS_OLD_MODE_SHIFT                        4
+# define V3D_SMS_STATE_MASK                            V3D_MASK(3, 0)
+# define V3D_SMS_STATE_SHIFT                           0
+
 #endif /* V3D_REGS_H */

-- 
2.49.0

