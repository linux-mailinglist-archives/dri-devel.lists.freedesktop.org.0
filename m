Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 808DB7EB311
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 16:09:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F60110E236;
	Tue, 14 Nov 2023 15:09:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com
 [95.215.58.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E0B810E206
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 15:09:32 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1699974147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7fhy2BdhWb4isZ8fdQwycwXhv0lYWLOPVT6/N56SGbY=;
 b=mmQDOwqK8B5ctogSr2HC/KmzDYYRDtMtPUdLgd4bOhuRUXf+o2wbSvB60vY1wXe4Trwv8N
 JSoEbBgebPLxXManXcCNGf4wDGVv7+gXTY1y6+0AE0XBKESbyoqG/LRpzFeL2R2Fj4o1hW
 gJKplKgscixJPf4rRPCLhYQEiKzq2P0=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Phong LE <ple@baylibre.com>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 7/8] drm/bridge: it66121: Add another implementation for
 getting match data
Date: Tue, 14 Nov 2023 23:01:29 +0800
Message-Id: <20231114150130.497915-8-sui.jingfeng@linux.dev>
In-Reply-To: <20231114150130.497915-1-sui.jingfeng@linux.dev>
References: <20231114150130.497915-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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
Cc: Maxime Ripard <mripard@kernel.org>, Sui Jingfeng <suijingfeng@loongson.cn>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sui Jingfeng <suijingfeng@loongson.cn>

Because if use the i2c_get_match_data() function on our platform, the
following error will emerge.

[    3.597872] ACPI: bus type drm_connector registered
[    3.602877] loongson 0000:00:06.1: Found LS7A1000 bridge chipset, revision: 1
[    3.610013] loongson 0000:00:06.1: [drm] dc: 264MHz, gmc: 529MHz, gpu: 529MHz
[    3.617111] loongson 0000:00:06.1: [drm] Dedicated vram start: 0xe0030000000, size: 64MiB
[    3.633628] loongson 0000:00:06.1: [drm] Loongson VBIOS version: 0.3
[    3.639944] loongson 0000:00:06.1: [drm] Loongson VBIOS: has 8 DCBs
[    3.646271] Console: switching to colour dummy device 80x25
[    3.651902] loongson 0000:00:06.1: [drm] VRAM: 4096 pages ready
[    3.657791] loongson 0000:00:06.1: [drm] GTT: 32768 pages ready
[    3.663731] loongson 0000:00:06.1: [drm] lsdc-i2c0(sda pin mask=1, scl pin mask=2) created
[    3.671966] loongson 0000:00:06.1: [drm] lsdc-i2c1(sda pin mask=4, scl pin mask=8) created
[    3.680188] loongson 0000:00:06.1: [drm] DisplayPipe-0 has DVO-0 connector
[    3.711860] debugfs: Directory '1-004c' with parent 'regmap' already present!
[    3.720312] CPU 0 Unable to handle kernel paging request at virtual address 0000000000000090, era == 9000000002faffec, ra == 9000000002faffc8
[    3.732935] Oops[#1]:
[    3.735187] CPU: 0 PID: 8 Comm: kworker/0:0 Not tainted 6.6.0-rc3+ #941
[    3.741757] Hardware name: Loongson Loongson-3A5000-7A1000-1w-ML5A/Loongson-LS3A5000-7A1000-1w-ML5A, BIOS vUDK2018-LoongArch-V4.0.05-test-stable202305 06/
[    3.755500] Workqueue: events work_for_cpu_fn
[    3.759833] pc 9000000002faffec ra 9000000002faffc8 tp 900000010017c000 sp 900000010017fb80
[    3.768132] a0 0000000000000000 a1 9000000101c00420 a2 0000000000000001 a3 900000010017fbc0
[    3.776430] a4 0000000000000004 a5 0000000000000000 a6 0000000000000001 a7 0000000000000001
[    3.784727] t0 0000000000000000 t1 0000000000000001 t2 0000000006124954 t3 0000000000000012
[    3.793026] t4 0000000000004954 t5 900000000800b530 t6 0000000000000000 t7 0000000000018500
[    3.801324] t8 90000001019c90c0 u0 9000000101c00c00 s9 fffffffffffff000 s0 9000000101c00400
[    3.809621] s1 0000000000000000 s2 0000000000000000 s3 9000000003c42cb0 s4 9000000101c00420
[    3.817920] s5 900000010017fc48 s6 0000000000000000 s7 0000000000000000 s8 90000000037fa000
[    3.826219]    ra: 9000000002faffc8 i2c_get_match_data+0x24/0xac
[    3.832189]   ERA: 9000000002faffec i2c_get_match_data+0x48/0xac
[    3.838156]  CRMD: 000000b0 (PLV0 -IE -DA +PG DACF=CC DACM=CC -WE)
[    3.844303]  PRMD: 00000004 (PPLV0 +PIE -PWE)
[    3.848631]  EUEN: 00000000 (-FPE -SXE -ASXE -BTE)
[    3.853391]  ECFG: 00071c1d (LIE=0,2-4,10-12 VS=7)
[    3.858149] ESTAT: 00010000 [PIL] (IS= ECode=1 EsubCode=0)
[    3.863599]  BADV: 0000000000000090
[    3.867058]  PRID: 0014c011 (Loongson-64bit, Loongson-3A5000)
[    3.872764] Modules linked in:
[    3.875793] Process kworker/0:0 (pid: 8, threadinfo=(____ptrval____), task=(____ptrval____))
[    3.884180] Stack : 9000000101c00400 0000000000000000 900000010177f428 9000000002ceb734
[    3.892137]         9000000101c00404 90000000037fa000 900000010017fc60 9000000101c00400
[    3.900093]         9000000016124954 8c326e68047d36df 0000004c037fa000 900000010017fc50
[    3.908050]         0000000000000080 9000000003c44490 900000010017fcb0 90000001003e9ec0
[    3.916007]         0000000000000001 900000010044f000 900000010017fc60 9000000101c00400
[    3.923964]         90000000037fa000 9000000002cf05a8 90000001003e8000 900000010017fcb2
[    3.931920]         000000304c17fc68 0000000000000000 000000000000004c 0000000000000000
[    3.939877]         4031323136365449 0000000000006334 004c000000000000 0000000000000000
[    3.947833]         0000000000000000 0000000000000000 0000000000000000 0000000000000000
[    3.955790]         0000000000000000 0000000000000000 9000000100449a98 8c326e68047d36df
[    3.963746]         ...
[    3.966170] Call Trace:
[    3.966172] [<9000000002faffec>] i2c_get_match_data+0x48/0xac
[    3.974304] [<9000000002ceb734>] it66121_create_bridge+0x15c/0x404
[    3.980446] [<9000000002cf05a8>] ls7a1000_output_init+0x228/0x248
[    3.986503] [<9000000002cee494>] lsdc_pci_probe+0x4dc/0x5b0
[    3.992038] [<9000000002b86b50>] local_pci_probe+0x48/0xa0
[    3.997487] [<90000000023b5d04>] work_for_cpu_fn+0x1c/0x30
[    4.002936] [<90000000023b7c0c>] process_one_work+0x14c/0x288
[    4.008644] [<90000000023b8084>] worker_thread+0x33c/0x438
[    4.014092] [<90000000023c1ccc>] kthread+0x124/0x130
[    4.019023] [<9000000002381188>] ret_from_kernel_thread+0xc/0xa4
[    4.024991]
[    4.026463] Code: 26000079  02c08063  4c000020 <28c24318> 43ffe31f  43ffdeff  2a00030c  43ffd59f  02c012f7
[    4.036154]
[    4.037630] ---[ end trace 0000000000000000 ]---

Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/gpu/drm/bridge/ite-it66121.c | 51 +++++++++++++++++++---------
 1 file changed, 35 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
index 2f7f00f1bedb..8971414a2a60 100644
--- a/drivers/gpu/drm/bridge/ite-it66121.c
+++ b/drivers/gpu/drm/bridge/ite-it66121.c
@@ -292,8 +292,39 @@ enum chip_id {
 struct it66121_chip_info {
 	enum chip_id id;
 	u16 vid, pid;
+	char name[24];
 };
 
+static const struct it66121_chip_info it66121_chip_info[] = {
+	{
+		.id = ID_IT66121,
+		.vid = 0x4954,
+		.pid = 0x0612,
+		.name = "IT66121",
+	},
+	{
+		.id = ID_IT6610,
+		.vid = 0xca00,
+		.pid = 0x0611,
+		.name = "IT6610",
+	},
+};
+
+static const struct it66121_chip_info *
+it66121_get_match_data(u16 vender_id, u16 device_id)
+{
+	const struct it66121_chip_info *info;
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(it66121_chip_info); i++) {
+		info = &it66121_chip_info[i];
+		if (info->vid == vender_id && info->pid == device_id)
+			return info;
+	}
+
+	return NULL;
+}
+
 struct it66121_ctx {
 	struct regmap *regmap;
 	struct drm_bridge bridge;
@@ -1677,28 +1708,16 @@ static void it66121_remove(struct i2c_client *client)
 	mutex_destroy(&ctx->lock);
 }
 
-static const struct it66121_chip_info it66121_chip_info = {
-	.id = ID_IT66121,
-	.vid = 0x4954,
-	.pid = 0x0612,
-};
-
-static const struct it66121_chip_info it6610_chip_info = {
-	.id = ID_IT6610,
-	.vid = 0xca00,
-	.pid = 0x0611,
-};
-
 static const struct of_device_id it66121_dt_match[] = {
-	{ .compatible = "ite,it66121", &it66121_chip_info },
-	{ .compatible = "ite,it6610", &it6610_chip_info },
+	{ .compatible = "ite,it66121", &it66121_chip_info[0] },
+	{ .compatible = "ite,it6610", &it66121_chip_info[1] },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, it66121_dt_match);
 
 static const struct i2c_device_id it66121_id[] = {
-	{ "it66121", (kernel_ulong_t) &it66121_chip_info },
-	{ "it6610", (kernel_ulong_t) &it6610_chip_info },
+	{ "it66121", (kernel_ulong_t) &it66121_chip_info[0] },
+	{ "it6610", (kernel_ulong_t) &it66121_chip_info[1] },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, it66121_id);
-- 
2.34.1

