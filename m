Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8054990792F
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 19:01:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B7DD10EB37;
	Thu, 13 Jun 2024 17:01:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="OBaJd/sB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2051.outbound.protection.outlook.com [40.107.92.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85BBE10EB08;
 Thu, 13 Jun 2024 17:00:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NfaWJoPUe5DPODNHN5dM1OD4Nv70M5Kw/HktJJD13Yp0o/YtBAbgO6n9Oq+Nl1tf/nlG7YYCs3ZmqUXbOCSZyTnkAj74obgT1q6PEvR+Gjgfz/i4ozblojLcVKp3kqM7F2VC2TuMcMttEUmzcrJFXT7eISMcUqlXXTIyuaRg3Ua2/YWBtIkxT055e1+HQvJelJVw+oXB7JvNyQmPXVaFYUBcrg5qvb15vzZTeCciYrxKxJTK4609a2GCfuMFqhWo6U8btg/vRp3DBbn+1+BOVE5NNygL2ME487pVyteZxrwaZmNCgWAQS3K8/31MHydXHURBBVJ4osuh/MJItRo8rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RV7AjZ+3B21X2dGN5XfZTJUji46AefPMgcv8CJzZpKE=;
 b=debcx53pGrfZksh4SaDzJF3Ok/U/Ttn4xM0Wz4adLeN/pRl5aRpufBY7sWtpD7G6+Vs4cjqCcEsgozM8Vrl2Qn3k7e2RoXolvr5jpjfciHB1XGATK7O+jjdYCYvcN711EV56JSkxINoKuNbZ8YIaEAPrwbzKHuR6IC4zE+YWi6xhJYjXg0IcrziogoKQlSw3UWCLxbKPHoV+CwWaKN07oP3Uji2s2dCTys1+PfTgv/nWgLim209YyMVYYexo81cjJmNF80lCMXgtReR2YtwSyhhzvnXQI+lws/skT3l9aGrQ/qyO2VAXVeNdU6LBhkY0jZ5Ko/KfcIrAPB1U2zVbIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RV7AjZ+3B21X2dGN5XfZTJUji46AefPMgcv8CJzZpKE=;
 b=OBaJd/sBw7+RkvD4jx7u75OjRFzDdVaREXEhoUfiPF0R6rfNerOL7aUzS7P9pOBjX0PSovBvJFHlmQ1GUUxVWiOtwDm4BibFXys9fPWU6HFX+2OHWU1r2y4J/YFG7xKdXMm26WhBpA+RzNfG0AiPSSPIQnjOE8ybO4JC6zJUf3g5zJyG2OZqGI/PY2DsnHkTzToLGIU5reksxeHsfFvToN4qk0qrnH3G0SndL0LxIh2xyzILBz8ZlfDsYmIS/yNhr2g5jcUs66rvS1tiOf7pzLdlivKLOXKApOQ0jcALDg2Fan8B1HrckXdDr6TVgN3WW8DJCzR7rv+qkfG15Th6Sg==
Received: from SN4PR0501CA0044.namprd05.prod.outlook.com
 (2603:10b6:803:41::21) by IA1PR12MB6625.namprd12.prod.outlook.com
 (2603:10b6:208:3a3::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.20; Thu, 13 Jun
 2024 17:00:31 +0000
Received: from SA2PEPF00003F65.namprd04.prod.outlook.com
 (2603:10b6:803:41:cafe::8a) by SN4PR0501CA0044.outlook.office365.com
 (2603:10b6:803:41::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.20 via Frontend
 Transport; Thu, 13 Jun 2024 17:00:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SA2PEPF00003F65.mail.protection.outlook.com (10.167.248.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.15 via Frontend Transport; Thu, 13 Jun 2024 17:00:31 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 13 Jun
 2024 10:00:08 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 13 Jun
 2024 10:00:06 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 21/21] drm/nouveau/nvkm: s/nouveau/nvkm/ over code moved from
 drm
Date: Fri, 14 Jun 2024 03:00:13 +1000
Message-ID: <20240613170046.88687-22-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240613170046.88687-1-bskeggs@nvidia.com>
References: <20240613170046.88687-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F65:EE_|IA1PR12MB6625:EE_
X-MS-Office365-Filtering-Correlation-Id: c0fabad1-2179-4e17-9e69-08dc8bca556c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230035|376009|1800799019|82310400021|36860700008; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?s8AzxOq2/C8nOUYL7fVhb9KyGCq33QOH7Yaob2fR+p2HWZBUSd1fjIxbzlPd?=
 =?us-ascii?Q?BkI3CFdiNo+sttdEMP84A/j1dCuiHYY8kIbfFRlQSZ2d+OJF8NyB09QE3+iP?=
 =?us-ascii?Q?zMKnzE/Tsh8/psiwnHSI9EBro33Nc27HAj5JeBOhuQFx15+NrPdJk78lHjMg?=
 =?us-ascii?Q?XCnrF1cR1Ysi0szMhQq9hZGVO9mzpqGJ8idLnaTiEW0UcDRyX4p7aECk5zpG?=
 =?us-ascii?Q?xmv2n6sqMkY0ko0A3UWD1rpSLSXqQ6iFNd9ehbu1Fa3QtpGd4aoQDqVY+qKo?=
 =?us-ascii?Q?p7ISUqoYGYoX55KbTO1XvySK3fNMnErwXfnU4tE5ry5l884Nb8I+PENdow+N?=
 =?us-ascii?Q?gpwUenUU2z7rTH0Z3mWLSSzmNAHGoKtF/3VUaFZ6QXThaoprMQMh/AY8J09W?=
 =?us-ascii?Q?Ece5RYlEY2HXpfCdY9jMA2iln4yqnFZ+s1capmhZHU1lLUgNhMEqobiOVp8/?=
 =?us-ascii?Q?BGe+sn4sC2qGWctS4LBoKAInrTwbyHq2HteETPg0Pes8L8nroR19yHXL4/nC?=
 =?us-ascii?Q?XuK24SL5vwWUhfB/Rj9u/EhOWzTkV8uWYQ6hS7VrD0Zt/J1DHCsm9R0sW2og?=
 =?us-ascii?Q?lZWXFWEP36FyIpoRCFU1SFo/2Ge4L5JymaVic2d1V6dRq5SHtcvi0tZZ6DUo?=
 =?us-ascii?Q?zEQJNutdI5YrugpgyWnq+Sz0SWcJ1zHP/CsZ2oIbT170c3VZGtNgJvSu/uCW?=
 =?us-ascii?Q?6n/4h9F9XN292spXA2qbOq6KET6GIH9RZaNsc5wsSrWlI68hHCaEVkomoeeC?=
 =?us-ascii?Q?u0kp71phfLtc0szPqEOLMxXFwzrm5sp6K1qV3HqlK9SErHICisijrZA2br0l?=
 =?us-ascii?Q?pk82ilKCQTBvE6/jZfSHBEugQD5Qn82cYnr98R3kkVj7FT8SUWYeNLLmNlIz?=
 =?us-ascii?Q?/cUQpCFYYS8AE2kmeddZ8FQ+JJey7pvphQT8KNg1RtYSB+4ua34X5VtaPP+D?=
 =?us-ascii?Q?dhZeRw/u8DwUAMMAUv/0D5mYqfBVmZAGTB+QuyB+s990FyeaiXu5honCmNTG?=
 =?us-ascii?Q?41yvxRn5uo62NaGKeZU5nm4crt8DH28VZpgAHlHrnn1+qJZmkJ3bq+sIm5KG?=
 =?us-ascii?Q?fbB1qCsLZUEo0I23Zsvb+Ebfxb6UWxIi6w5pJU38THqD12FgS0kjFzp6sYbY?=
 =?us-ascii?Q?J2A2pzT+DB6LtQTzLSHyhJlFp6oLqr/XzBt87bQoYG7vW+lRlhM2+W3c8JYE?=
 =?us-ascii?Q?WWjWuFjlBCiP8f/TCjx3ACAiJMi4ioor6khkg+U8jjm62gHMQEVtASOBRB0d?=
 =?us-ascii?Q?5z62/BllieJWmybe03kuxLq5XSoQ9PD4HLzg6c+E8rS/eHnuAHQnVy8B/FEW?=
 =?us-ascii?Q?rsmk5Ij1cE+wyHU70nl7VZ8i7TmjKzazaewRFthTMX1qg3tzzmORCWE3HYpo?=
 =?us-ascii?Q?TcPsxr3cKjqS9V3+AbkYXuo4sleGPUX4NREl15OGeY5cUs0rfQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230035)(376009)(1800799019)(82310400021)(36860700008); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2024 17:00:31.1198 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c0fabad1-2179-4e17-9e69-08dc8bca556c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003F65.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6625
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

The move and renames were kept separate for cleaner diffs.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/device/acpi.c  | 113 ++++++++++----------
 drivers/gpu/drm/nouveau/nvkm/device/acpi.h  |   4 +-
 drivers/gpu/drm/nouveau/nvkm/device/pci.c   |   8 +-
 drivers/gpu/drm/nouveau/nvkm/device/tegra.c |   6 +-
 4 files changed, 64 insertions(+), 67 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/device/acpi.c b/drivers/gpu/drm/nouveau/nvkm/device/acpi.c
index c4cbdf172499..ff8a3027c1bc 100644
--- a/drivers/gpu/drm/nouveau/nvkm/device/acpi.c
+++ b/drivers/gpu/drm/nouveau/nvkm/device/acpi.c
@@ -32,9 +32,9 @@
 #include <linux/vga_switcheroo.h>
 
 #ifdef CONFIG_VGA_SWITCHEROO
-struct nouveau_dsm_priv nouveau_dsm_priv = {};
+struct nvkm_dsm_priv nvkm_dsm_priv = {};
 
-static const guid_t nouveau_op_dsm_muid =
+static const guid_t nvkm_op_dsm_muid =
 	GUID_INIT(0xA486D8F8, 0x0BDA, 0x471B,
 		  0xA7, 0x2B, 0x60, 0x42, 0xA6, 0xB5, 0xBE, 0xE0);
 
@@ -60,7 +60,7 @@ static const guid_t nouveau_op_dsm_muid =
 #define OPTIMUS_AUDIO_CAPS_MASK (3 << 27)
 #define OPTIMUS_HDA_CODEC_MASK (2 << 27) /* hda bios control */
 
-static int nouveau_optimus_dsm(acpi_handle handle, int func, int arg, uint32_t *result)
+static int nvkm_optimus_dsm(acpi_handle handle, int func, int arg, uint32_t *result)
 {
 	int i;
 	union acpi_object *obj;
@@ -76,7 +76,7 @@ static int nouveau_optimus_dsm(acpi_handle handle, int func, int arg, uint32_t *
 		args_buff[i] = (arg >> i * 8) & 0xFF;
 
 	*result = 0;
-	obj = acpi_evaluate_dsm_typed(handle, &nouveau_op_dsm_muid, 0x00000100,
+	obj = acpi_evaluate_dsm_typed(handle, &nvkm_op_dsm_muid, 0x00000100,
 				      func, &argv4, ACPI_TYPE_BUFFER);
 	if (!obj) {
 		acpi_handle_info(handle, "failed to evaluate _DSM\n");
@@ -98,24 +98,24 @@ static int nouveau_optimus_dsm(acpi_handle handle, int func, int arg, uint32_t *
 void nvkm_acpi_switcheroo_set_powerdown(void)
 {
 	u32 result = 0;
-	if (!nouveau_dsm_priv.optimus_detected || nouveau_dsm_priv.optimus_skip_dsm)
+	if (!nvkm_dsm_priv.optimus_detected || nvkm_dsm_priv.optimus_skip_dsm)
 		return;
 
-	if (nouveau_dsm_priv.optimus_flags_detected)
-		nouveau_optimus_dsm(nouveau_dsm_priv.dhandle, NOUVEAU_DSM_OPTIMUS_FLAGS,
-				    0x3, &result);
+	if (nvkm_dsm_priv.optimus_flags_detected)
+		nvkm_optimus_dsm(nvkm_dsm_priv.dhandle, NOUVEAU_DSM_OPTIMUS_FLAGS,
+				 0x3, &result);
 
-	nouveau_optimus_dsm(nouveau_dsm_priv.dhandle, NOUVEAU_DSM_OPTIMUS_CAPS,
-		NOUVEAU_DSM_OPTIMUS_SET_POWERDOWN, &result);
+	nvkm_optimus_dsm(nvkm_dsm_priv.dhandle, NOUVEAU_DSM_OPTIMUS_CAPS,
+			 NOUVEAU_DSM_OPTIMUS_SET_POWERDOWN, &result);
 
 }
 
 /*
- * On some platforms, _DSM(nouveau_op_dsm_muid, func0) has special
+ * On some platforms, _DSM(nvkm_op_dsm_muid, func0) has special
  * requirements on the fourth parameter, so a private implementation
  * instead of using acpi_check_dsm().
  */
-static int nouveau_dsm_get_optimus_functions(acpi_handle handle)
+static int nvkm_dsm_get_optimus_functions(acpi_handle handle)
 {
 	int result;
 
@@ -123,7 +123,7 @@ static int nouveau_dsm_get_optimus_functions(acpi_handle handle)
 	 * Function 0 returns a Buffer containing available functions.
 	 * The args parameter is ignored for function 0, so just put 0 in it
 	 */
-	if (nouveau_optimus_dsm(handle, 0, 0, &result))
+	if (nvkm_optimus_dsm(handle, 0, 0, &result))
 		return 0;
 
 	/*
@@ -135,7 +135,7 @@ static int nouveau_dsm_get_optimus_functions(acpi_handle handle)
 	return 0;
 }
 
-static const guid_t nouveau_dsm_muid =
+static const guid_t nvkm_dsm_muid =
 	GUID_INIT(0x9D95A0A0, 0x0060, 0x4D48,
 		  0xB3, 0x4D, 0x7E, 0x5F, 0xEA, 0x12, 0x9F, 0xD4);
 
@@ -150,7 +150,7 @@ static const guid_t nouveau_dsm_muid =
 #define NOUVEAU_DSM_POWER_SPEED 0x01
 #define NOUVEAU_DSM_POWER_STAMINA 0x02
 
-static int nouveau_dsm(acpi_handle handle, int func, int arg)
+static int nvkm_dsm(acpi_handle handle, int func, int arg)
 {
 	int ret = 0;
 	union acpi_object *obj;
@@ -159,7 +159,7 @@ static int nouveau_dsm(acpi_handle handle, int func, int arg)
 		.integer.value = arg,
 	};
 
-	obj = acpi_evaluate_dsm_typed(handle, &nouveau_dsm_muid, 0x00000102,
+	obj = acpi_evaluate_dsm_typed(handle, &nvkm_dsm_muid, 0x00000102,
 				      func, &argv4, ACPI_TYPE_INTEGER);
 	if (!obj) {
 		acpi_handle_info(handle, "failed to evaluate _DSM\n");
@@ -173,21 +173,21 @@ static int nouveau_dsm(acpi_handle handle, int func, int arg)
 	return ret;
 }
 
-static int nouveau_dsm_switch_mux(acpi_handle handle, int mux_id)
+static int nvkm_dsm_switch_mux(acpi_handle handle, int mux_id)
 {
 	mxm_wmi_call_mxmx(mux_id == NOUVEAU_DSM_LED_STAMINA ? MXM_MXDS_ADAPTER_IGD : MXM_MXDS_ADAPTER_0);
 	mxm_wmi_call_mxds(mux_id == NOUVEAU_DSM_LED_STAMINA ? MXM_MXDS_ADAPTER_IGD : MXM_MXDS_ADAPTER_0);
-	return nouveau_dsm(handle, NOUVEAU_DSM_LED, mux_id);
+	return nvkm_dsm(handle, NOUVEAU_DSM_LED, mux_id);
 }
 
-static int nouveau_dsm_set_discrete_state(acpi_handle handle, enum vga_switcheroo_state state)
+static int nvkm_dsm_set_discrete_state(acpi_handle handle, enum vga_switcheroo_state state)
 {
 	int arg;
 	if (state == VGA_SWITCHEROO_ON)
 		arg = NOUVEAU_DSM_POWER_SPEED;
 	else
 		arg = NOUVEAU_DSM_POWER_STAMINA;
-	nouveau_dsm(handle, NOUVEAU_DSM_POWER, arg);
+	nvkm_dsm(handle, NOUVEAU_DSM_POWER, arg);
 	return 0;
 }
 
@@ -206,7 +206,7 @@ nvkm_acpi_switcheroo_set_state(struct pci_dev *pdev,
 	struct nvkm_device *device = pci_get_drvdata(pdev);
 
 	if (state == VGA_SWITCHEROO_OFF) {
-		if (nouveau_dsm_priv.dsm_detected || nouveau_dsm_priv.optimus_detected)
+		if (nvkm_dsm_priv.dsm_detected || nvkm_dsm_priv.optimus_detected)
 			return;
 
 		nvkm_acpi_switcheroo_set_powerdown();
@@ -230,31 +230,31 @@ nvkm_acpi_switcheroo_ops = {
 	.reprobe = nvkm_acpi_switcheroo_reprobe,
 };
 
-static int nouveau_dsm_switchto(enum vga_switcheroo_client_id id)
+static int nvkm_dsm_switchto(enum vga_switcheroo_client_id id)
 {
-	if (!nouveau_dsm_priv.dsm_detected)
+	if (!nvkm_dsm_priv.dsm_detected)
 		return 0;
 	if (id == VGA_SWITCHEROO_IGD)
-		return nouveau_dsm_switch_mux(nouveau_dsm_priv.dhandle, NOUVEAU_DSM_LED_STAMINA);
+		return nvkm_dsm_switch_mux(nvkm_dsm_priv.dhandle, NOUVEAU_DSM_LED_STAMINA);
 	else
-		return nouveau_dsm_switch_mux(nouveau_dsm_priv.dhandle, NOUVEAU_DSM_LED_SPEED);
+		return nvkm_dsm_switch_mux(nvkm_dsm_priv.dhandle, NOUVEAU_DSM_LED_SPEED);
 }
 
-static int nouveau_dsm_power_state(enum vga_switcheroo_client_id id,
+static int nvkm_dsm_power_state(enum vga_switcheroo_client_id id,
 				   enum vga_switcheroo_state state)
 {
 	if (id == VGA_SWITCHEROO_IGD)
 		return 0;
 
 	/* Optimus laptops have the card already disabled in
-	 * nouveau_switcheroo_set_state */
-	if (!nouveau_dsm_priv.dsm_detected)
+	 * nvkm_switcheroo_set_state */
+	if (!nvkm_dsm_priv.dsm_detected)
 		return 0;
 
-	return nouveau_dsm_set_discrete_state(nouveau_dsm_priv.dhandle, state);
+	return nvkm_dsm_set_discrete_state(nvkm_dsm_priv.dhandle, state);
 }
 
-static enum vga_switcheroo_client_id nouveau_dsm_get_client_id(struct pci_dev *pdev)
+static enum vga_switcheroo_client_id nvkm_dsm_get_client_id(struct pci_dev *pdev)
 {
 	/* easy option one - intel vendor ID means Integrated */
 	if (pdev->vendor == PCI_VENDOR_ID_INTEL)
@@ -267,15 +267,15 @@ static enum vga_switcheroo_client_id nouveau_dsm_get_client_id(struct pci_dev *p
 	return VGA_SWITCHEROO_DIS;
 }
 
-static const struct vga_switcheroo_handler nouveau_dsm_handler = {
-	.switchto = nouveau_dsm_switchto,
-	.power_state = nouveau_dsm_power_state,
-	.get_client_id = nouveau_dsm_get_client_id,
+static const struct vga_switcheroo_handler nvkm_dsm_handler = {
+	.switchto = nvkm_dsm_switchto,
+	.power_state = nvkm_dsm_power_state,
+	.get_client_id = nvkm_dsm_get_client_id,
 };
 
-static void nouveau_dsm_pci_probe(struct pci_dev *pdev, acpi_handle *dhandle_out,
-				  bool *has_mux, bool *has_opt,
-				  bool *has_opt_flags, bool *has_pr3)
+static void nvkm_dsm_pci_probe(struct pci_dev *pdev, acpi_handle *dhandle_out,
+			       bool *has_mux, bool *has_opt,
+			       bool *has_opt_flags, bool *has_pr3)
 {
 	acpi_handle dhandle;
 	bool supports_mux;
@@ -301,9 +301,9 @@ static void nouveau_dsm_pci_probe(struct pci_dev *pdev, acpi_handle *dhandle_out
 	if (!acpi_has_method(dhandle, "_DSM"))
 		return;
 
-	supports_mux = acpi_check_dsm(dhandle, &nouveau_dsm_muid, 0x00000102,
+	supports_mux = acpi_check_dsm(dhandle, &nvkm_dsm_muid, 0x00000102,
 				      1 << NOUVEAU_DSM_POWER);
-	optimus_funcs = nouveau_dsm_get_optimus_functions(dhandle);
+	optimus_funcs = nvkm_dsm_get_optimus_functions(dhandle);
 
 	/* Does not look like a Nvidia device. */
 	if (!supports_mux && !optimus_funcs)
@@ -316,8 +316,7 @@ static void nouveau_dsm_pci_probe(struct pci_dev *pdev, acpi_handle *dhandle_out
 
 	if (optimus_funcs) {
 		uint32_t result;
-		nouveau_optimus_dsm(dhandle, NOUVEAU_DSM_OPTIMUS_CAPS, 0,
-				    &result);
+		nvkm_optimus_dsm(dhandle, NOUVEAU_DSM_OPTIMUS_CAPS, 0, &result);
 		dev_info(&pdev->dev, "optimus capabilities: %s, status %s%s\n",
 			 (result & OPTIMUS_ENABLED) ? "enabled" : "disabled",
 			 (result & OPTIMUS_DYNAMIC_PWR_CAP) ? "dynamic power, " : "",
@@ -325,7 +324,7 @@ static void nouveau_dsm_pci_probe(struct pci_dev *pdev, acpi_handle *dhandle_out
 	}
 }
 
-static bool nouveau_dsm_detect(void)
+static bool nvkm_dsm_detect(void)
 {
 	char acpi_method_name[255] = { 0 };
 	struct acpi_buffer buffer = {sizeof(acpi_method_name), acpi_method_name};
@@ -353,30 +352,28 @@ static bool nouveau_dsm_detect(void)
 
 		vga_count++;
 
-		nouveau_dsm_pci_probe(pdev, &dhandle, &has_mux, &has_optimus,
-				      &has_optimus_flags, &has_power_resources);
+		nvkm_dsm_pci_probe(pdev, &dhandle, &has_mux, &has_optimus,
+				   &has_optimus_flags, &has_power_resources);
 	}
 
 	/* find the optimus DSM or the old v1 DSM */
 	if (has_optimus) {
-		nouveau_dsm_priv.dhandle = dhandle;
-		acpi_get_name(nouveau_dsm_priv.dhandle, ACPI_FULL_PATHNAME,
-			&buffer);
+		nvkm_dsm_priv.dhandle = dhandle;
+		acpi_get_name(nvkm_dsm_priv.dhandle, ACPI_FULL_PATHNAME, &buffer);
 		pr_info("VGA switcheroo: detected Optimus DSM method %s handle\n",
 			acpi_method_name);
 		if (has_power_resources)
-			pr_info("nouveau: detected PR support, will not use DSM\n");
-		nouveau_dsm_priv.optimus_detected = true;
-		nouveau_dsm_priv.optimus_flags_detected = has_optimus_flags;
-		nouveau_dsm_priv.optimus_skip_dsm = has_power_resources;
+			pr_info("nvkm: detected PR support, will not use DSM\n");
+		nvkm_dsm_priv.optimus_detected = true;
+		nvkm_dsm_priv.optimus_flags_detected = has_optimus_flags;
+		nvkm_dsm_priv.optimus_skip_dsm = has_power_resources;
 		ret = true;
 	} else if (vga_count == 2 && has_mux && guid_valid) {
-		nouveau_dsm_priv.dhandle = dhandle;
-		acpi_get_name(nouveau_dsm_priv.dhandle, ACPI_FULL_PATHNAME,
-			&buffer);
+		nvkm_dsm_priv.dhandle = dhandle;
+		acpi_get_name(nvkm_dsm_priv.dhandle, ACPI_FULL_PATHNAME, &buffer);
 		pr_info("VGA switcheroo: detected DSM switching method %s handle\n",
 			acpi_method_name);
-		nouveau_dsm_priv.dsm_detected = true;
+		nvkm_dsm_priv.dsm_detected = true;
 		ret = true;
 	}
 
@@ -387,7 +384,7 @@ static bool nouveau_dsm_detect(void)
 void
 nvkm_acpi_switcheroo_fini(void)
 {
-	if (nouveau_dsm_priv.optimus_detected || nouveau_dsm_priv.dsm_detected)
+	if (nvkm_dsm_priv.optimus_detected || nvkm_dsm_priv.dsm_detected)
 		vga_switcheroo_unregister_handler();
 }
 
@@ -396,11 +393,11 @@ nvkm_acpi_switcheroo_init(void)
 {
 	bool r;
 
-	r = nouveau_dsm_detect();
+	r = nvkm_dsm_detect();
 	if (!r)
 		return;
 
-	vga_switcheroo_register_handler(&nouveau_dsm_handler, 0);
+	vga_switcheroo_register_handler(&nvkm_dsm_handler, 0);
 }
 #endif
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/device/acpi.h b/drivers/gpu/drm/nouveau/nvkm/device/acpi.h
index 34854d10026d..2dd8a3029b55 100644
--- a/drivers/gpu/drm/nouveau/nvkm/device/acpi.h
+++ b/drivers/gpu/drm/nouveau/nvkm/device/acpi.h
@@ -8,13 +8,13 @@ void nvkm_acpi_init(struct nvkm_device *);
 void nvkm_acpi_fini(struct nvkm_device *);
 
 #ifdef CONFIG_VGA_SWITCHEROO
-extern struct nouveau_dsm_priv {
+extern struct nvkm_dsm_priv {
 	bool dsm_detected;
 	bool optimus_detected;
 	bool optimus_flags_detected;
 	bool optimus_skip_dsm;
 	acpi_handle dhandle;
-} nouveau_dsm_priv;
+} nvkm_dsm_priv;
 
 void nvkm_acpi_switcheroo_init(void);
 void nvkm_acpi_switcheroo_fini(void);
diff --git a/drivers/gpu/drm/nouveau/nvkm/device/pci.c b/drivers/gpu/drm/nouveau/nvkm/device/pci.c
index 735bf0a9931d..8eb3a66f53d6 100644
--- a/drivers/gpu/drm/nouveau/nvkm/device/pci.c
+++ b/drivers/gpu/drm/nouveau/nvkm/device/pci.c
@@ -1720,8 +1720,8 @@ nvkm_device_pci_remove(struct pci_dev *dev)
  *    to handle well enough.
  *
  * In all cases dmesg will contain at least one line like this:
- * 'nouveau 0000:01:00.0: Refused to change power state, currently in D3'
- * followed by a lot of nouveau timeouts.
+ * 'nvkm 0000:01:00.0: Refused to change power state, currently in D3'
+ * followed by a lot of nvkm timeouts.
  *
  * In the \_SB.PCI0.PEG0.PG00._OFF code deeper down writes bit 0x80 to the not
  * documented PCI config space register 0x248 of the Intel PCIe bridge
@@ -1849,8 +1849,8 @@ nvkm_device_pci_probe(struct pci_dev *pci_dev, const struct pci_device_id *id)
 	pci_set_drvdata(pci_dev, &pdev->device);
 
 	if (nvkm_runpm) {
-		if (!nouveau_dsm_priv.optimus_detected) {
-			if (nouveau_dsm_priv.dsm_detected)
+		if (!nvkm_dsm_priv.optimus_detected) {
+			if (nvkm_dsm_priv.dsm_detected)
 				device->runpm = NVKM_DEVICE_RUNPM_V1;
 		} else {
 			device->runpm = NVKM_DEVICE_RUNPM_OPTIMUS;
diff --git a/drivers/gpu/drm/nouveau/nvkm/device/tegra.c b/drivers/gpu/drm/nouveau/nvkm/device/tegra.c
index 743a781586c0..75ce47f25e19 100644
--- a/drivers/gpu/drm/nouveau/nvkm/device/tegra.c
+++ b/drivers/gpu/drm/nouveau/nvkm/device/tegra.c
@@ -351,7 +351,7 @@ static const struct nvkm_device_tegra_func gp10b_platform_data = {
 	.require_vdd = false,
 };
 
-static const struct of_device_id nouveau_platform_match[] = {
+static const struct of_device_id nvkm_platform_match[] = {
 	{
 		.compatible = "nvidia,gk20a",
 		.data = &gk20a_platform_data,
@@ -371,13 +371,13 @@ struct platform_driver
 nvkm_device_tegra = {
 	.driver = {
 		.name = "nvkm",
-		.of_match_table = of_match_ptr(nouveau_platform_match),
+		.of_match_table = of_match_ptr(nvkm_platform_match),
 	},
 	.probe = nvkm_device_tegra_probe,
 	.remove_new = nvkm_device_tegra_remove,
 };
 
-MODULE_DEVICE_TABLE(of, nouveau_platform_match);
+MODULE_DEVICE_TABLE(of, nvkm_platform_match);
 #else
 struct platform_driver
 nvkm_device_tegra = {
-- 
2.44.0

