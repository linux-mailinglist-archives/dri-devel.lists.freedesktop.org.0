Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE987DADFD
	for <lists+dri-devel@lfdr.de>; Sun, 29 Oct 2023 20:46:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ADAD10E192;
	Sun, 29 Oct 2023 19:46:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 845CE10E192
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Oct 2023 19:46:15 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8CxtPCFtj5lx5s1AA--.40173S3;
 Mon, 30 Oct 2023 03:46:13 +0800 (CST)
Received: from openarena.loongson.cn (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8AxXNx+tj5lKq02AA--.51878S9; 
 Mon, 30 Oct 2023 03:46:13 +0800 (CST)
From: Sui Jingfeng <suijingfeng@loongson.cn>
To: Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 7/8] drm/loongson: Support to infer DC reversion from CPU's
 PRID value
Date: Mon, 30 Oct 2023 03:46:06 +0800
Message-Id: <20231029194607.379459-8-suijingfeng@loongson.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231029194607.379459-1-suijingfeng@loongson.cn>
References: <20231029194607.379459-1-suijingfeng@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8AxXNx+tj5lKq02AA--.51878S9
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxJw4kKw4UCw15AF1ruFWfJFc_yoWrGw4xpr
 ZxAFySkryDGw12y39xAr18Aa4fAa4fXFZ3uFZ2kw1qgw1UAa4UWFyUCF4YvrZrZryxJry2
 v3sakrWUuF1aywcCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUkYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
 6r4j6r4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
 02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAF
 wI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7V
 AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
 r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6x
 IIjxv20xvE14v26ryj6F1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAI
 w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x
 0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8l38UUUUUU==
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Due to the fact that the same display IP core has been integrated into
different platform, there is a need to differentiate them on the runtime.
The DC in LS7A1000/LS2K1000 has the PCI vendor & device ID of 0x0014:0x7A06
The DC in LS7A2000/LS2K2000 has the PCI vendor & device ID of 0x0014:0x7A36

Because the output ports and host platform of the DC IP varies, without a
revision information we can't achieve fine-grained controls. The canonical
approach to do such a thing is to read reversion register from the PCIe
device. But LS2K1000 SoC was taped out at 2017, it is rather old. Our BIOS
engineer don't assign a different revision ID to it, probably because of
ignorance.

LS2K2000 SoC was newly taped on 2023, we strictly force the BIOS engineer
assign a different revision ID(0x10) to it. But the problem is that it is
too casual, there is no formal convention or public documented rule
established. For Loongson LS2K series SoC, the display controller IP is
taped togather with the CPU core. For Loongson LS7A series bridge chips,
the display controller IP is taped togather with the bridge chips itself.
Consider the fact the all Loongson CPU has a unique PRID, this patch choose
to infer DC reversion from CPU's PRID value.

 - LS3A4000/LS3A5000 has 0xC0 as its processor ID.
 - LS2K2000 has 0xB0 as its processor ID.
 - LS2K2000LA has 0xA0 as its processor ID.

The provided approach has no dependency on DT or ACPI, thus is preferfed.
Besides, this approach can be used to acquire more addtional HW features.
So the provided method has the potential to bring more benifits.

Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/gpu/drm/loongson/lsdc_drv.h   |  2 ++
 drivers/gpu/drm/loongson/lsdc_probe.c | 35 +++++++++++++++++++++++++++
 drivers/gpu/drm/loongson/lsdc_probe.h |  2 ++
 3 files changed, 39 insertions(+)

diff --git a/drivers/gpu/drm/loongson/lsdc_drv.h b/drivers/gpu/drm/loongson/lsdc_drv.h
index 46ba9b88a30d..e1f4a2db2a0a 100644
--- a/drivers/gpu/drm/loongson/lsdc_drv.h
+++ b/drivers/gpu/drm/loongson/lsdc_drv.h
@@ -42,6 +42,8 @@
 enum loongson_chip_id {
 	CHIP_LS7A1000 = 0,
 	CHIP_LS7A2000 = 1,
+	CHIP_LS2K1000 = 2,
+	CHIP_LS2K2000 = 3,
 	CHIP_LS_LAST,
 };
 
diff --git a/drivers/gpu/drm/loongson/lsdc_probe.c b/drivers/gpu/drm/loongson/lsdc_probe.c
index 48ba69bb8a98..f49b642d8f65 100644
--- a/drivers/gpu/drm/loongson/lsdc_probe.c
+++ b/drivers/gpu/drm/loongson/lsdc_probe.c
@@ -54,3 +54,38 @@ unsigned int loongson_cpu_get_prid(u8 *imp, u8 *rev)
 
 	return prid;
 }
+
+enum loongson_chip_id loongson_chip_id_fixup(enum loongson_chip_id chip_id)
+{
+	u8 impl;
+
+	if (loongson_cpu_get_prid(&impl, NULL)) {
+		/*
+		 * LS2K2000 only has the LoongArch edition.
+		 */
+		if (chip_id == CHIP_LS7A2000) {
+			if (impl == LOONGARCH_CPU_IMP_LS2K2000)
+				return CHIP_LS2K2000;
+		}
+
+		/*
+		 * LS2K1000 has the LoongArch edition(with two LA264 CPU core)
+		 * and the Mips edition(with two mips64r2 CPU core), Only the
+		 * instruction set of the CPU are changed, the peripheral
+		 * devices are basically same.
+		 */
+		if (chip_id == CHIP_LS7A1000) {
+#if defined(__loongarch__)
+			if (impl == LOONGARCH_CPU_IMP_LS2K1000)
+				return CHIP_LS2K1000;
+#endif
+
+#if defined(__mips__)
+			if (impl == LOONGSON_CPU_MIPS_IMP_LS2K)
+				return CHIP_LS2K1000;
+#endif
+		}
+	}
+
+	return chip_id;
+}
diff --git a/drivers/gpu/drm/loongson/lsdc_probe.h b/drivers/gpu/drm/loongson/lsdc_probe.h
index 8bb6de2e3c64..8c630c5c90ce 100644
--- a/drivers/gpu/drm/loongson/lsdc_probe.h
+++ b/drivers/gpu/drm/loongson/lsdc_probe.h
@@ -9,4 +9,6 @@
 /* Helpers for chip detection */
 unsigned int loongson_cpu_get_prid(u8 *impl, u8 *rev);
 
+enum loongson_chip_id loongson_chip_id_fixup(enum loongson_chip_id chip_id);
+
 #endif
-- 
2.34.1

