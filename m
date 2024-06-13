Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A4690790D
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 19:00:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE3C710EB08;
	Thu, 13 Jun 2024 17:00:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="EpOIzKYy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2049.outbound.protection.outlook.com [40.107.220.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DA2B10EB17;
 Thu, 13 Jun 2024 17:00:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iZGssb26XBz9NVx+AL7AfwaDeZllrLU9/ZyPWESNbmZiws1r337nHfCiB5InxG19vKpgqLUPiG4PVhBMzsG/IN0llJjYmRQFhnICubhvhOcQCVZYwHcPG6RdzloMckzA3Wqh7sD81Eiylpp+w13LCGPkxxrjBlYNPPTtFaEWKuH3tJwxsZKfJmxJDlZrGrm3xOzhOoGF7wUqtwn3SHSegRTCiinSo234sxTVVh+uEByd+9ZQTskqvftbwoNheWVNzQ/LPTqSYHKvDL6Z0tdl6bE7O2QMmrk+LAALHa5AOxUzZCBtouIQjJ+eEAaFVDosNU85YHXjAfeIXSkEI3Nm8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uO2K5JspyBKWOtx49f5u2rEjRjx3SGImVhiUXHix7KQ=;
 b=iI4UPJkFrFwaGFlMhE9H1vSLSgC9a/mjkfAYPZyGRUZw0rTkjBw2Tve2sI7Y/OG8krjx2+x8TWEdMRb/C99WX1C/GVFVygHasNIX0piDxyAmvFO3Sd3OolOgVQ7c/99cgb1jjFsS9XoyNT3GWZRKG3s6sI5/JfAyDxknM9c+vjpK5erK2CHYcX8ADWleCkBl+Kivz38ltgCp79c+h5Sy7FeEBATR6elRuWuNLSifKPVBpV7sJxtZmTd1/jJeGy2Anc7hHah0cubc4FTo0NevF0IrdAfoAjomNx+a6bxTXuv+rqHm9Dl/4kXoVcjos2fwxxk6a85LUsj/KwrF8NrRFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uO2K5JspyBKWOtx49f5u2rEjRjx3SGImVhiUXHix7KQ=;
 b=EpOIzKYyKWVPlxyM3rRrccnPCCTzN+Xd/KGU07T4E4+oMjU0CJiYL8/cmFOJXJ/91NLvveG8BAdZNJ6gTGplNFOM6Eg4fqoIlnDqt/VUSfw86i1bFN3bthzhvhkYOsq+CL+41lsPVt35wYdnXJBy/Mu3TAv1Qyp7gsMoyiUCxEoVRnK2YaeCCru6sNnnsljs39gauw9MISCwuKji/mBQ0yO3a97xBQ5DAHFoUW6gdQTnCrKLm0mdDzqHhIRDw6EI6FDodewTy2Dsd/iSvlO3EuACk6+0/R3659BhZaVcTpJ/kWTV21bO+/AfGgfS5uSsO65BuTDqRmRzKUIqqbvjug==
Received: from BYAPR05CA0062.namprd05.prod.outlook.com (2603:10b6:a03:74::39)
 by IA1PR12MB6580.namprd12.prod.outlook.com (2603:10b6:208:3a0::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.25; Thu, 13 Jun
 2024 17:00:03 +0000
Received: from SJ1PEPF00002326.namprd03.prod.outlook.com
 (2603:10b6:a03:74:cafe::58) by BYAPR05CA0062.outlook.office365.com
 (2603:10b6:a03:74::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.21 via Frontend
 Transport; Thu, 13 Jun 2024 17:00:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF00002326.mail.protection.outlook.com (10.167.242.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.15 via Frontend Transport; Thu, 13 Jun 2024 17:00:03 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 13 Jun
 2024 09:59:50 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 13 Jun
 2024 09:59:48 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 09/21] drm/nouveau/nvkm: move switcheroo init from drm
Date: Fri, 14 Jun 2024 03:00:01 +1000
Message-ID: <20240613170046.88687-10-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002326:EE_|IA1PR12MB6580:EE_
X-MS-Office365-Filtering-Correlation-Id: e3153333-9101-4ac1-f720-08dc8bca44b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230035|376009|1800799019|82310400021|36860700008; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mUtC5iaLhkaJ/ux4d2BsQKVKhajt6QyN/16HgK4AVuaVtBYvy77HpamG5Ot6?=
 =?us-ascii?Q?oelBoodejfl81sm/w6wywkPZVbYl5qhuVYn554XfmhZmRHZoIoViYzdYeoA6?=
 =?us-ascii?Q?GRpuX/LK7F7LwytnyjBLdgvr3+HGDquoA2R+3CisgXa0rKxLCzqWHgQvDn0I?=
 =?us-ascii?Q?ojUoew6sC45zCir3Z2L6d4LaN4twbTLKZe8NwH4igk4dHL118GpPcW6JHQJS?=
 =?us-ascii?Q?8cmXFetT05hLXSDfXFxephZqLm+HcEJQZels20HrnxPgbfjFwgUpzaPDnP+e?=
 =?us-ascii?Q?FPavm7urO5/yiJMPH02/sfezVK98G3NF1nauoE1TFAaarOYbNjoRpG8qcQoR?=
 =?us-ascii?Q?nskDhbbc95gAF8s1Mq4UhiiyjEtLNse0ma5eN5gar3ft8DZax3IDxC77Ru30?=
 =?us-ascii?Q?d72LN7Y5HMErealRtCVRoetHnMFEwu/Vhmmx600W0E34D1zz+ZK47gM1b9LF?=
 =?us-ascii?Q?wXA+KTjXwiJz/jf2wcFVU3HMedSrVDBtOJuOAJOhVd/z4QBnSO5kg0NTC2Z8?=
 =?us-ascii?Q?T6NwkCyaUJP9FymJ5qwiULQNqPtNWpxr08ZwII4x81AgsIrZEnGWo8BXm2ul?=
 =?us-ascii?Q?fhiRxU9HMuAm/tu2YIB8UX/VRrfpZipg4wTGkiJzE3ikvQF6lw5BGZi6hRfm?=
 =?us-ascii?Q?fYmW8+JFCyaIyFMobqUCJwLSdklA5D4q3qWNa0RArOKeWJVETETpee8Lk14l?=
 =?us-ascii?Q?Nv2auKmQisYKuWKG9qrqpvZDfeAnetnqLrC1yjfi/TgubaMwmVxnISoNne36?=
 =?us-ascii?Q?QgZiLMLZWTSXYg/grBEKGF1vRVPcOkRsNkVxjQTs7JiE66sRRQR4UFhgLbAB?=
 =?us-ascii?Q?ET86i4E5nfH4doU6079AdfduqPtmaFR3iqys7RZwvl/AjcgyziMoHGwRxeFZ?=
 =?us-ascii?Q?eQZiEX9N4b4RghH1/s0QQAB4w1hZngk/LeCgGvJJ/M2yEFKHt7F0CV7dUgoA?=
 =?us-ascii?Q?OuVanKLMKQOIdGS7bkvGndlgDXXJbl7RvkSmRP16WGiweNQFtARRI3U098kI?=
 =?us-ascii?Q?shxvJYUzXHJSZaa3nOlpO1oWAMTUuz1uza/vlbUNuWzsxfHQJwpsrNYno0RO?=
 =?us-ascii?Q?CWel/SMz/lpnMRCnWr0meKY4aL6cb/LGf1DhFzuk/xOpeFEovXq2Di8XPXBO?=
 =?us-ascii?Q?o/RtsrBr0e1FoYGHpDUMn01G4KynfqnV1XNE2XWPupSv6XBVLq569etrVo0u?=
 =?us-ascii?Q?A+7+Uqbp7C9Fyfu/ZNWcZEGtyEMDF9PR/Kkf3613s+kH8Vvyg8s7ul8lZ4Tt?=
 =?us-ascii?Q?/EMIpQsXoxy7zFCFQ7Kd4tOju5QzW7U3nTwgSQYCDSMg2zMQT5qcisla7hir?=
 =?us-ascii?Q?3dkxYOJDLQ3ONY8JH86gjiPKldPiO5uJ5XR/D4LR6dTEidvnNqz8j9Vao6S0?=
 =?us-ascii?Q?ZaQf//0mpLQO6nUgF3mNNRnNo72E2PlZusBX+SPlNEVcBsDgOQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230035)(376009)(1800799019)(82310400021)(36860700008); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2024 17:00:03.2082 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3153333-9101-4ac1-f720-08dc8bca44b8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002326.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6580
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

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_acpi.c     | 344 ---------------------
 drivers/gpu/drm/nouveau/nouveau_acpi.h     |   7 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c      |   2 -
 drivers/gpu/drm/nouveau/nvkm/device/acpi.c | 339 +++++++++++++++++++-
 drivers/gpu/drm/nouveau/nvkm/device/acpi.h |  19 ++
 drivers/gpu/drm/nouveau/nvkm/module.c      |   3 +
 6 files changed, 362 insertions(+), 352 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_acpi.c b/drivers/gpu/drm/nouveau/nouveau_acpi.c
index 8f0c69aad248..b9c43fe552c0 100644
--- a/drivers/gpu/drm/nouveau/nouveau_acpi.c
+++ b/drivers/gpu/drm/nouveau/nouveau_acpi.c
@@ -2,55 +2,12 @@
 #include <linux/pci.h>
 #include <linux/acpi.h>
 #include <linux/slab.h>
-#include <linux/mxm-wmi.h>
-#include <linux/vga_switcheroo.h>
 #include <drm/drm_edid.h>
 #include <acpi/video.h>
 
 #include "nouveau_drv.h"
 #include "nouveau_acpi.h"
 
-#define NOUVEAU_DSM_LED 0x02
-#define NOUVEAU_DSM_LED_STATE 0x00
-#define NOUVEAU_DSM_LED_OFF 0x10
-#define NOUVEAU_DSM_LED_STAMINA 0x11
-#define NOUVEAU_DSM_LED_SPEED 0x12
-
-#define NOUVEAU_DSM_POWER 0x03
-#define NOUVEAU_DSM_POWER_STATE 0x00
-#define NOUVEAU_DSM_POWER_SPEED 0x01
-#define NOUVEAU_DSM_POWER_STAMINA 0x02
-
-#define NOUVEAU_DSM_OPTIMUS_CAPS 0x1A
-#define NOUVEAU_DSM_OPTIMUS_FLAGS 0x1B
-
-#define NOUVEAU_DSM_OPTIMUS_POWERDOWN_PS3 (3 << 24)
-#define NOUVEAU_DSM_OPTIMUS_NO_POWERDOWN_PS3 (2 << 24)
-#define NOUVEAU_DSM_OPTIMUS_FLAGS_CHANGED (1)
-
-#define NOUVEAU_DSM_OPTIMUS_SET_POWERDOWN (NOUVEAU_DSM_OPTIMUS_POWERDOWN_PS3 | NOUVEAU_DSM_OPTIMUS_FLAGS_CHANGED)
-
-/* result of the optimus caps function */
-#define OPTIMUS_ENABLED (1 << 0)
-#define OPTIMUS_STATUS_MASK (3 << 3)
-#define OPTIMUS_STATUS_OFF  (0 << 3)
-#define OPTIMUS_STATUS_ON_ENABLED  (1 << 3)
-#define OPTIMUS_STATUS_PWR_STABLE  (3 << 3)
-#define OPTIMUS_DISPLAY_HOTPLUG (1 << 6)
-#define OPTIMUS_CAPS_MASK (7 << 24)
-#define OPTIMUS_DYNAMIC_PWR_CAP (1 << 24)
-
-#define OPTIMUS_AUDIO_CAPS_MASK (3 << 27)
-#define OPTIMUS_HDA_CODEC_MASK (2 << 27) /* hda bios control */
-
-static struct nouveau_dsm_priv {
-	bool dsm_detected;
-	bool optimus_detected;
-	bool optimus_flags_detected;
-	bool optimus_skip_dsm;
-	acpi_handle dhandle;
-} nouveau_dsm_priv;
-
 bool nouveau_is_optimus(void) {
 	return nouveau_dsm_priv.optimus_detected;
 }
@@ -59,307 +16,6 @@ bool nouveau_is_v1_dsm(void) {
 	return nouveau_dsm_priv.dsm_detected;
 }
 
-#ifdef CONFIG_VGA_SWITCHEROO
-static const guid_t nouveau_dsm_muid =
-	GUID_INIT(0x9D95A0A0, 0x0060, 0x4D48,
-		  0xB3, 0x4D, 0x7E, 0x5F, 0xEA, 0x12, 0x9F, 0xD4);
-
-static const guid_t nouveau_op_dsm_muid =
-	GUID_INIT(0xA486D8F8, 0x0BDA, 0x471B,
-		  0xA7, 0x2B, 0x60, 0x42, 0xA6, 0xB5, 0xBE, 0xE0);
-
-static int nouveau_optimus_dsm(acpi_handle handle, int func, int arg, uint32_t *result)
-{
-	int i;
-	union acpi_object *obj;
-	char args_buff[4];
-	union acpi_object argv4 = {
-		.buffer.type = ACPI_TYPE_BUFFER,
-		.buffer.length = 4,
-		.buffer.pointer = args_buff
-	};
-
-	/* ACPI is little endian, AABBCCDD becomes {DD,CC,BB,AA} */
-	for (i = 0; i < 4; i++)
-		args_buff[i] = (arg >> i * 8) & 0xFF;
-
-	*result = 0;
-	obj = acpi_evaluate_dsm_typed(handle, &nouveau_op_dsm_muid, 0x00000100,
-				      func, &argv4, ACPI_TYPE_BUFFER);
-	if (!obj) {
-		acpi_handle_info(handle, "failed to evaluate _DSM\n");
-		return AE_ERROR;
-	} else {
-		if (obj->buffer.length == 4) {
-			*result |= obj->buffer.pointer[0];
-			*result |= (obj->buffer.pointer[1] << 8);
-			*result |= (obj->buffer.pointer[2] << 16);
-			*result |= (obj->buffer.pointer[3] << 24);
-		}
-		ACPI_FREE(obj);
-	}
-
-	return 0;
-}
-
-/*
- * On some platforms, _DSM(nouveau_op_dsm_muid, func0) has special
- * requirements on the fourth parameter, so a private implementation
- * instead of using acpi_check_dsm().
- */
-static int nouveau_dsm_get_optimus_functions(acpi_handle handle)
-{
-	int result;
-
-	/*
-	 * Function 0 returns a Buffer containing available functions.
-	 * The args parameter is ignored for function 0, so just put 0 in it
-	 */
-	if (nouveau_optimus_dsm(handle, 0, 0, &result))
-		return 0;
-
-	/*
-	 * ACPI Spec v4 9.14.1: if bit 0 is zero, no function is supported.
-	 * If the n-th bit is enabled, function n is supported
-	 */
-	if (result & 1 && result & (1 << NOUVEAU_DSM_OPTIMUS_CAPS))
-		return result;
-	return 0;
-}
-
-static int nouveau_dsm(acpi_handle handle, int func, int arg)
-{
-	int ret = 0;
-	union acpi_object *obj;
-	union acpi_object argv4 = {
-		.integer.type = ACPI_TYPE_INTEGER,
-		.integer.value = arg,
-	};
-
-	obj = acpi_evaluate_dsm_typed(handle, &nouveau_dsm_muid, 0x00000102,
-				      func, &argv4, ACPI_TYPE_INTEGER);
-	if (!obj) {
-		acpi_handle_info(handle, "failed to evaluate _DSM\n");
-		return AE_ERROR;
-	} else {
-		if (obj->integer.value == 0x80000002)
-			ret = -ENODEV;
-		ACPI_FREE(obj);
-	}
-
-	return ret;
-}
-
-static int nouveau_dsm_switch_mux(acpi_handle handle, int mux_id)
-{
-	mxm_wmi_call_mxmx(mux_id == NOUVEAU_DSM_LED_STAMINA ? MXM_MXDS_ADAPTER_IGD : MXM_MXDS_ADAPTER_0);
-	mxm_wmi_call_mxds(mux_id == NOUVEAU_DSM_LED_STAMINA ? MXM_MXDS_ADAPTER_IGD : MXM_MXDS_ADAPTER_0);
-	return nouveau_dsm(handle, NOUVEAU_DSM_LED, mux_id);
-}
-
-static int nouveau_dsm_set_discrete_state(acpi_handle handle, enum vga_switcheroo_state state)
-{
-	int arg;
-	if (state == VGA_SWITCHEROO_ON)
-		arg = NOUVEAU_DSM_POWER_SPEED;
-	else
-		arg = NOUVEAU_DSM_POWER_STAMINA;
-	nouveau_dsm(handle, NOUVEAU_DSM_POWER, arg);
-	return 0;
-}
-
-static int nouveau_dsm_switchto(enum vga_switcheroo_client_id id)
-{
-	if (!nouveau_dsm_priv.dsm_detected)
-		return 0;
-	if (id == VGA_SWITCHEROO_IGD)
-		return nouveau_dsm_switch_mux(nouveau_dsm_priv.dhandle, NOUVEAU_DSM_LED_STAMINA);
-	else
-		return nouveau_dsm_switch_mux(nouveau_dsm_priv.dhandle, NOUVEAU_DSM_LED_SPEED);
-}
-
-static int nouveau_dsm_power_state(enum vga_switcheroo_client_id id,
-				   enum vga_switcheroo_state state)
-{
-	if (id == VGA_SWITCHEROO_IGD)
-		return 0;
-
-	/* Optimus laptops have the card already disabled in
-	 * nouveau_switcheroo_set_state */
-	if (!nouveau_dsm_priv.dsm_detected)
-		return 0;
-
-	return nouveau_dsm_set_discrete_state(nouveau_dsm_priv.dhandle, state);
-}
-
-static enum vga_switcheroo_client_id nouveau_dsm_get_client_id(struct pci_dev *pdev)
-{
-	/* easy option one - intel vendor ID means Integrated */
-	if (pdev->vendor == PCI_VENDOR_ID_INTEL)
-		return VGA_SWITCHEROO_IGD;
-
-	/* is this device on Bus 0? - this may need improving */
-	if (pdev->bus->number == 0)
-		return VGA_SWITCHEROO_IGD;
-
-	return VGA_SWITCHEROO_DIS;
-}
-
-static const struct vga_switcheroo_handler nouveau_dsm_handler = {
-	.switchto = nouveau_dsm_switchto,
-	.power_state = nouveau_dsm_power_state,
-	.get_client_id = nouveau_dsm_get_client_id,
-};
-
-static void nouveau_dsm_pci_probe(struct pci_dev *pdev, acpi_handle *dhandle_out,
-				  bool *has_mux, bool *has_opt,
-				  bool *has_opt_flags, bool *has_pr3)
-{
-	acpi_handle dhandle;
-	bool supports_mux;
-	int optimus_funcs;
-	struct pci_dev *parent_pdev;
-
-	if (pdev->vendor != PCI_VENDOR_ID_NVIDIA)
-		return;
-
-	*has_pr3 = false;
-	parent_pdev = pci_upstream_bridge(pdev);
-	if (parent_pdev) {
-		if (parent_pdev->bridge_d3)
-			*has_pr3 = pci_pr3_present(parent_pdev);
-		else
-			pci_d3cold_disable(pdev);
-	}
-
-	dhandle = ACPI_HANDLE(&pdev->dev);
-	if (!dhandle)
-		return;
-
-	if (!acpi_has_method(dhandle, "_DSM"))
-		return;
-
-	supports_mux = acpi_check_dsm(dhandle, &nouveau_dsm_muid, 0x00000102,
-				      1 << NOUVEAU_DSM_POWER);
-	optimus_funcs = nouveau_dsm_get_optimus_functions(dhandle);
-
-	/* Does not look like a Nvidia device. */
-	if (!supports_mux && !optimus_funcs)
-		return;
-
-	*dhandle_out = dhandle;
-	*has_mux = supports_mux;
-	*has_opt = !!optimus_funcs;
-	*has_opt_flags = optimus_funcs & (1 << NOUVEAU_DSM_OPTIMUS_FLAGS);
-
-	if (optimus_funcs) {
-		uint32_t result;
-		nouveau_optimus_dsm(dhandle, NOUVEAU_DSM_OPTIMUS_CAPS, 0,
-				    &result);
-		dev_info(&pdev->dev, "optimus capabilities: %s, status %s%s\n",
-			 (result & OPTIMUS_ENABLED) ? "enabled" : "disabled",
-			 (result & OPTIMUS_DYNAMIC_PWR_CAP) ? "dynamic power, " : "",
-			 (result & OPTIMUS_HDA_CODEC_MASK) ? "hda bios codec supported" : "");
-	}
-}
-
-static bool nouveau_dsm_detect(void)
-{
-	char acpi_method_name[255] = { 0 };
-	struct acpi_buffer buffer = {sizeof(acpi_method_name), acpi_method_name};
-	struct pci_dev *pdev = NULL;
-	acpi_handle dhandle = NULL;
-	bool has_mux = false;
-	bool has_optimus = false;
-	bool has_optimus_flags = false;
-	bool has_power_resources = false;
-	int vga_count = 0;
-	bool guid_valid;
-	bool ret = false;
-
-	/* lookup the MXM GUID */
-	guid_valid = mxm_wmi_supported();
-
-	if (guid_valid)
-		printk("MXM: GUID detected in BIOS\n");
-
-	/* now do DSM detection */
-	while ((pdev = pci_get_base_class(PCI_BASE_CLASS_DISPLAY, pdev))) {
-		if ((pdev->class != PCI_CLASS_DISPLAY_VGA << 8) &&
-		    (pdev->class != PCI_CLASS_DISPLAY_3D << 8))
-			continue;
-
-		vga_count++;
-
-		nouveau_dsm_pci_probe(pdev, &dhandle, &has_mux, &has_optimus,
-				      &has_optimus_flags, &has_power_resources);
-	}
-
-	/* find the optimus DSM or the old v1 DSM */
-	if (has_optimus) {
-		nouveau_dsm_priv.dhandle = dhandle;
-		acpi_get_name(nouveau_dsm_priv.dhandle, ACPI_FULL_PATHNAME,
-			&buffer);
-		pr_info("VGA switcheroo: detected Optimus DSM method %s handle\n",
-			acpi_method_name);
-		if (has_power_resources)
-			pr_info("nouveau: detected PR support, will not use DSM\n");
-		nouveau_dsm_priv.optimus_detected = true;
-		nouveau_dsm_priv.optimus_flags_detected = has_optimus_flags;
-		nouveau_dsm_priv.optimus_skip_dsm = has_power_resources;
-		ret = true;
-	} else if (vga_count == 2 && has_mux && guid_valid) {
-		nouveau_dsm_priv.dhandle = dhandle;
-		acpi_get_name(nouveau_dsm_priv.dhandle, ACPI_FULL_PATHNAME,
-			&buffer);
-		pr_info("VGA switcheroo: detected DSM switching method %s handle\n",
-			acpi_method_name);
-		nouveau_dsm_priv.dsm_detected = true;
-		ret = true;
-	}
-
-
-	return ret;
-}
-
-void nouveau_register_dsm_handler(void)
-{
-	bool r;
-
-	r = nouveau_dsm_detect();
-	if (!r)
-		return;
-
-	vga_switcheroo_register_handler(&nouveau_dsm_handler, 0);
-}
-
-/* Must be called for Optimus models before the card can be turned off */
-void nouveau_switcheroo_optimus_dsm(void)
-{
-	u32 result = 0;
-	if (!nouveau_dsm_priv.optimus_detected || nouveau_dsm_priv.optimus_skip_dsm)
-		return;
-
-	if (nouveau_dsm_priv.optimus_flags_detected)
-		nouveau_optimus_dsm(nouveau_dsm_priv.dhandle, NOUVEAU_DSM_OPTIMUS_FLAGS,
-				    0x3, &result);
-
-	nouveau_optimus_dsm(nouveau_dsm_priv.dhandle, NOUVEAU_DSM_OPTIMUS_CAPS,
-		NOUVEAU_DSM_OPTIMUS_SET_POWERDOWN, &result);
-
-}
-
-void nouveau_unregister_dsm_handler(void)
-{
-	if (nouveau_dsm_priv.optimus_detected || nouveau_dsm_priv.dsm_detected)
-		vga_switcheroo_unregister_handler();
-}
-#else
-void nouveau_register_dsm_handler(void) {}
-void nouveau_unregister_dsm_handler(void) {}
-void nouveau_switcheroo_optimus_dsm(void) {}
-#endif
-
 void *
 nouveau_acpi_edid(struct drm_device *dev, struct drm_connector *connector)
 {
diff --git a/drivers/gpu/drm/nouveau/nouveau_acpi.h b/drivers/gpu/drm/nouveau/nouveau_acpi.h
index e39dd8b94b8b..a7fac1f7a73d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_acpi.h
+++ b/drivers/gpu/drm/nouveau/nouveau_acpi.h
@@ -7,17 +7,14 @@
 #if defined(CONFIG_ACPI) && defined(CONFIG_X86)
 bool nouveau_is_optimus(void);
 bool nouveau_is_v1_dsm(void);
-void nouveau_register_dsm_handler(void);
-void nouveau_unregister_dsm_handler(void);
-void nouveau_switcheroo_optimus_dsm(void);
+#include <device/acpi.h>
+static inline void nouveau_switcheroo_optimus_dsm(void) { nvkm_acpi_switcheroo_set_powerdown(); }
 void *nouveau_acpi_edid(struct drm_device *, struct drm_connector *);
 bool nouveau_acpi_video_backlight_use_native(void);
 void nouveau_acpi_video_register_backlight(void);
 #else
 static inline bool nouveau_is_optimus(void) { return false; };
 static inline bool nouveau_is_v1_dsm(void) { return false; };
-static inline void nouveau_register_dsm_handler(void) {}
-static inline void nouveau_unregister_dsm_handler(void) {}
 static inline void nouveau_switcheroo_optimus_dsm(void) {}
 static inline void *nouveau_acpi_edid(struct drm_device *dev, struct drm_connector *connector) { return NULL; }
 static inline bool nouveau_acpi_video_backlight_use_native(void) { return true; }
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 6c1cfc38d8fa..0ac17da04819 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -1399,7 +1399,6 @@ nouveau_drm_init(void)
 	platform_driver_register(&nouveau_platform_driver);
 #endif
 
-	nouveau_register_dsm_handler();
 	nouveau_backlight_ctor();
 
 #ifdef CONFIG_PCI
@@ -1419,7 +1418,6 @@ nouveau_drm_exit(void)
 	pci_unregister_driver(&nouveau_drm_pci_driver);
 #endif
 	nouveau_backlight_dtor();
-	nouveau_unregister_dsm_handler();
 
 #ifdef CONFIG_NOUVEAU_PLATFORM_DRIVER
 	platform_driver_unregister(&nouveau_platform_driver);
diff --git a/drivers/gpu/drm/nouveau/nvkm/device/acpi.c b/drivers/gpu/drm/nouveau/nvkm/device/acpi.c
index c948a0dc9e62..2bead7e879a5 100644
--- a/drivers/gpu/drm/nouveau/nvkm/device/acpi.c
+++ b/drivers/gpu/drm/nouveau/nvkm/device/acpi.c
@@ -26,6 +26,343 @@
 #include <core/device.h>
 #include <subdev/clk.h>
 
+#include <linux/mxm-wmi.h>
+#include <linux/vga_switcheroo.h>
+
+#ifdef CONFIG_VGA_SWITCHEROO
+struct nouveau_dsm_priv nouveau_dsm_priv = {};
+
+static const guid_t nouveau_op_dsm_muid =
+	GUID_INIT(0xA486D8F8, 0x0BDA, 0x471B,
+		  0xA7, 0x2B, 0x60, 0x42, 0xA6, 0xB5, 0xBE, 0xE0);
+
+#define NOUVEAU_DSM_OPTIMUS_CAPS 0x1A
+#define NOUVEAU_DSM_OPTIMUS_FLAGS 0x1B
+
+#define NOUVEAU_DSM_OPTIMUS_POWERDOWN_PS3 (3 << 24)
+#define NOUVEAU_DSM_OPTIMUS_NO_POWERDOWN_PS3 (2 << 24)
+#define NOUVEAU_DSM_OPTIMUS_FLAGS_CHANGED (1)
+
+#define NOUVEAU_DSM_OPTIMUS_SET_POWERDOWN (NOUVEAU_DSM_OPTIMUS_POWERDOWN_PS3 | NOUVEAU_DSM_OPTIMUS_FLAGS_CHANGED)
+
+/* result of the optimus caps function */
+#define OPTIMUS_ENABLED (1 << 0)
+#define OPTIMUS_STATUS_MASK (3 << 3)
+#define OPTIMUS_STATUS_OFF  (0 << 3)
+#define OPTIMUS_STATUS_ON_ENABLED  (1 << 3)
+#define OPTIMUS_STATUS_PWR_STABLE  (3 << 3)
+#define OPTIMUS_DISPLAY_HOTPLUG (1 << 6)
+#define OPTIMUS_CAPS_MASK (7 << 24)
+#define OPTIMUS_DYNAMIC_PWR_CAP (1 << 24)
+
+#define OPTIMUS_AUDIO_CAPS_MASK (3 << 27)
+#define OPTIMUS_HDA_CODEC_MASK (2 << 27) /* hda bios control */
+
+static int nouveau_optimus_dsm(acpi_handle handle, int func, int arg, uint32_t *result)
+{
+	int i;
+	union acpi_object *obj;
+	char args_buff[4];
+	union acpi_object argv4 = {
+		.buffer.type = ACPI_TYPE_BUFFER,
+		.buffer.length = 4,
+		.buffer.pointer = args_buff
+	};
+
+	/* ACPI is little endian, AABBCCDD becomes {DD,CC,BB,AA} */
+	for (i = 0; i < 4; i++)
+		args_buff[i] = (arg >> i * 8) & 0xFF;
+
+	*result = 0;
+	obj = acpi_evaluate_dsm_typed(handle, &nouveau_op_dsm_muid, 0x00000100,
+				      func, &argv4, ACPI_TYPE_BUFFER);
+	if (!obj) {
+		acpi_handle_info(handle, "failed to evaluate _DSM\n");
+		return AE_ERROR;
+	} else {
+		if (obj->buffer.length == 4) {
+			*result |= obj->buffer.pointer[0];
+			*result |= (obj->buffer.pointer[1] << 8);
+			*result |= (obj->buffer.pointer[2] << 16);
+			*result |= (obj->buffer.pointer[3] << 24);
+		}
+		ACPI_FREE(obj);
+	}
+
+	return 0;
+}
+
+/* Must be called for Optimus models before the card can be turned off */
+void nvkm_acpi_switcheroo_set_powerdown(void)
+{
+	u32 result = 0;
+	if (!nouveau_dsm_priv.optimus_detected || nouveau_dsm_priv.optimus_skip_dsm)
+		return;
+
+	if (nouveau_dsm_priv.optimus_flags_detected)
+		nouveau_optimus_dsm(nouveau_dsm_priv.dhandle, NOUVEAU_DSM_OPTIMUS_FLAGS,
+				    0x3, &result);
+
+	nouveau_optimus_dsm(nouveau_dsm_priv.dhandle, NOUVEAU_DSM_OPTIMUS_CAPS,
+		NOUVEAU_DSM_OPTIMUS_SET_POWERDOWN, &result);
+
+}
+
+/*
+ * On some platforms, _DSM(nouveau_op_dsm_muid, func0) has special
+ * requirements on the fourth parameter, so a private implementation
+ * instead of using acpi_check_dsm().
+ */
+static int nouveau_dsm_get_optimus_functions(acpi_handle handle)
+{
+	int result;
+
+	/*
+	 * Function 0 returns a Buffer containing available functions.
+	 * The args parameter is ignored for function 0, so just put 0 in it
+	 */
+	if (nouveau_optimus_dsm(handle, 0, 0, &result))
+		return 0;
+
+	/*
+	 * ACPI Spec v4 9.14.1: if bit 0 is zero, no function is supported.
+	 * If the n-th bit is enabled, function n is supported
+	 */
+	if (result & 1 && result & (1 << NOUVEAU_DSM_OPTIMUS_CAPS))
+		return result;
+	return 0;
+}
+
+static const guid_t nouveau_dsm_muid =
+	GUID_INIT(0x9D95A0A0, 0x0060, 0x4D48,
+		  0xB3, 0x4D, 0x7E, 0x5F, 0xEA, 0x12, 0x9F, 0xD4);
+
+#define NOUVEAU_DSM_LED 0x02
+#define NOUVEAU_DSM_LED_STATE 0x00
+#define NOUVEAU_DSM_LED_OFF 0x10
+#define NOUVEAU_DSM_LED_STAMINA 0x11
+#define NOUVEAU_DSM_LED_SPEED 0x12
+
+#define NOUVEAU_DSM_POWER 0x03
+#define NOUVEAU_DSM_POWER_STATE 0x00
+#define NOUVEAU_DSM_POWER_SPEED 0x01
+#define NOUVEAU_DSM_POWER_STAMINA 0x02
+
+static int nouveau_dsm(acpi_handle handle, int func, int arg)
+{
+	int ret = 0;
+	union acpi_object *obj;
+	union acpi_object argv4 = {
+		.integer.type = ACPI_TYPE_INTEGER,
+		.integer.value = arg,
+	};
+
+	obj = acpi_evaluate_dsm_typed(handle, &nouveau_dsm_muid, 0x00000102,
+				      func, &argv4, ACPI_TYPE_INTEGER);
+	if (!obj) {
+		acpi_handle_info(handle, "failed to evaluate _DSM\n");
+		return AE_ERROR;
+	} else {
+		if (obj->integer.value == 0x80000002)
+			ret = -ENODEV;
+		ACPI_FREE(obj);
+	}
+
+	return ret;
+}
+
+static int nouveau_dsm_switch_mux(acpi_handle handle, int mux_id)
+{
+	mxm_wmi_call_mxmx(mux_id == NOUVEAU_DSM_LED_STAMINA ? MXM_MXDS_ADAPTER_IGD : MXM_MXDS_ADAPTER_0);
+	mxm_wmi_call_mxds(mux_id == NOUVEAU_DSM_LED_STAMINA ? MXM_MXDS_ADAPTER_IGD : MXM_MXDS_ADAPTER_0);
+	return nouveau_dsm(handle, NOUVEAU_DSM_LED, mux_id);
+}
+
+static int nouveau_dsm_set_discrete_state(acpi_handle handle, enum vga_switcheroo_state state)
+{
+	int arg;
+	if (state == VGA_SWITCHEROO_ON)
+		arg = NOUVEAU_DSM_POWER_SPEED;
+	else
+		arg = NOUVEAU_DSM_POWER_STAMINA;
+	nouveau_dsm(handle, NOUVEAU_DSM_POWER, arg);
+	return 0;
+}
+
+static int nouveau_dsm_switchto(enum vga_switcheroo_client_id id)
+{
+	if (!nouveau_dsm_priv.dsm_detected)
+		return 0;
+	if (id == VGA_SWITCHEROO_IGD)
+		return nouveau_dsm_switch_mux(nouveau_dsm_priv.dhandle, NOUVEAU_DSM_LED_STAMINA);
+	else
+		return nouveau_dsm_switch_mux(nouveau_dsm_priv.dhandle, NOUVEAU_DSM_LED_SPEED);
+}
+
+static int nouveau_dsm_power_state(enum vga_switcheroo_client_id id,
+				   enum vga_switcheroo_state state)
+{
+	if (id == VGA_SWITCHEROO_IGD)
+		return 0;
+
+	/* Optimus laptops have the card already disabled in
+	 * nouveau_switcheroo_set_state */
+	if (!nouveau_dsm_priv.dsm_detected)
+		return 0;
+
+	return nouveau_dsm_set_discrete_state(nouveau_dsm_priv.dhandle, state);
+}
+
+static enum vga_switcheroo_client_id nouveau_dsm_get_client_id(struct pci_dev *pdev)
+{
+	/* easy option one - intel vendor ID means Integrated */
+	if (pdev->vendor == PCI_VENDOR_ID_INTEL)
+		return VGA_SWITCHEROO_IGD;
+
+	/* is this device on Bus 0? - this may need improving */
+	if (pdev->bus->number == 0)
+		return VGA_SWITCHEROO_IGD;
+
+	return VGA_SWITCHEROO_DIS;
+}
+
+static const struct vga_switcheroo_handler nouveau_dsm_handler = {
+	.switchto = nouveau_dsm_switchto,
+	.power_state = nouveau_dsm_power_state,
+	.get_client_id = nouveau_dsm_get_client_id,
+};
+
+static void nouveau_dsm_pci_probe(struct pci_dev *pdev, acpi_handle *dhandle_out,
+				  bool *has_mux, bool *has_opt,
+				  bool *has_opt_flags, bool *has_pr3)
+{
+	acpi_handle dhandle;
+	bool supports_mux;
+	int optimus_funcs;
+	struct pci_dev *parent_pdev;
+
+	if (pdev->vendor != PCI_VENDOR_ID_NVIDIA)
+		return;
+
+	*has_pr3 = false;
+	parent_pdev = pci_upstream_bridge(pdev);
+	if (parent_pdev) {
+		if (parent_pdev->bridge_d3)
+			*has_pr3 = pci_pr3_present(parent_pdev);
+		else
+			pci_d3cold_disable(pdev);
+	}
+
+	dhandle = ACPI_HANDLE(&pdev->dev);
+	if (!dhandle)
+		return;
+
+	if (!acpi_has_method(dhandle, "_DSM"))
+		return;
+
+	supports_mux = acpi_check_dsm(dhandle, &nouveau_dsm_muid, 0x00000102,
+				      1 << NOUVEAU_DSM_POWER);
+	optimus_funcs = nouveau_dsm_get_optimus_functions(dhandle);
+
+	/* Does not look like a Nvidia device. */
+	if (!supports_mux && !optimus_funcs)
+		return;
+
+	*dhandle_out = dhandle;
+	*has_mux = supports_mux;
+	*has_opt = !!optimus_funcs;
+	*has_opt_flags = optimus_funcs & (1 << NOUVEAU_DSM_OPTIMUS_FLAGS);
+
+	if (optimus_funcs) {
+		uint32_t result;
+		nouveau_optimus_dsm(dhandle, NOUVEAU_DSM_OPTIMUS_CAPS, 0,
+				    &result);
+		dev_info(&pdev->dev, "optimus capabilities: %s, status %s%s\n",
+			 (result & OPTIMUS_ENABLED) ? "enabled" : "disabled",
+			 (result & OPTIMUS_DYNAMIC_PWR_CAP) ? "dynamic power, " : "",
+			 (result & OPTIMUS_HDA_CODEC_MASK) ? "hda bios codec supported" : "");
+	}
+}
+
+static bool nouveau_dsm_detect(void)
+{
+	char acpi_method_name[255] = { 0 };
+	struct acpi_buffer buffer = {sizeof(acpi_method_name), acpi_method_name};
+	struct pci_dev *pdev = NULL;
+	acpi_handle dhandle = NULL;
+	bool has_mux = false;
+	bool has_optimus = false;
+	bool has_optimus_flags = false;
+	bool has_power_resources = false;
+	int vga_count = 0;
+	bool guid_valid;
+	bool ret = false;
+
+	/* lookup the MXM GUID */
+	guid_valid = mxm_wmi_supported();
+
+	if (guid_valid)
+		printk("MXM: GUID detected in BIOS\n");
+
+	/* now do DSM detection */
+	while ((pdev = pci_get_base_class(PCI_BASE_CLASS_DISPLAY, pdev))) {
+		if ((pdev->class != PCI_CLASS_DISPLAY_VGA << 8) &&
+		    (pdev->class != PCI_CLASS_DISPLAY_3D << 8))
+			continue;
+
+		vga_count++;
+
+		nouveau_dsm_pci_probe(pdev, &dhandle, &has_mux, &has_optimus,
+				      &has_optimus_flags, &has_power_resources);
+	}
+
+	/* find the optimus DSM or the old v1 DSM */
+	if (has_optimus) {
+		nouveau_dsm_priv.dhandle = dhandle;
+		acpi_get_name(nouveau_dsm_priv.dhandle, ACPI_FULL_PATHNAME,
+			&buffer);
+		pr_info("VGA switcheroo: detected Optimus DSM method %s handle\n",
+			acpi_method_name);
+		if (has_power_resources)
+			pr_info("nouveau: detected PR support, will not use DSM\n");
+		nouveau_dsm_priv.optimus_detected = true;
+		nouveau_dsm_priv.optimus_flags_detected = has_optimus_flags;
+		nouveau_dsm_priv.optimus_skip_dsm = has_power_resources;
+		ret = true;
+	} else if (vga_count == 2 && has_mux && guid_valid) {
+		nouveau_dsm_priv.dhandle = dhandle;
+		acpi_get_name(nouveau_dsm_priv.dhandle, ACPI_FULL_PATHNAME,
+			&buffer);
+		pr_info("VGA switcheroo: detected DSM switching method %s handle\n",
+			acpi_method_name);
+		nouveau_dsm_priv.dsm_detected = true;
+		ret = true;
+	}
+
+
+	return ret;
+}
+
+void
+nvkm_acpi_switcheroo_fini(void)
+{
+	if (nouveau_dsm_priv.optimus_detected || nouveau_dsm_priv.dsm_detected)
+		vga_switcheroo_unregister_handler();
+}
+
+void
+nvkm_acpi_switcheroo_init(void)
+{
+	bool r;
+
+	r = nouveau_dsm_detect();
+	if (!r)
+		return;
+
+	vga_switcheroo_register_handler(&nouveau_dsm_handler, 0);
+}
+#endif
+
 #ifdef CONFIG_ACPI
 static int
 nvkm_acpi_ntfy(struct notifier_block *nb, unsigned long val, void *data)
@@ -38,7 +375,7 @@ nvkm_acpi_ntfy(struct notifier_block *nb, unsigned long val, void *data)
 
 	return NOTIFY_DONE;
 }
-#endif
+#endif /* CONFIG_ACPI */
 
 void
 nvkm_acpi_fini(struct nvkm_device *device)
diff --git a/drivers/gpu/drm/nouveau/nvkm/device/acpi.h b/drivers/gpu/drm/nouveau/nvkm/device/acpi.h
index 1d3c5cf7c3b4..34854d10026d 100644
--- a/drivers/gpu/drm/nouveau/nvkm/device/acpi.h
+++ b/drivers/gpu/drm/nouveau/nvkm/device/acpi.h
@@ -6,4 +6,23 @@ struct nvkm_device;
 
 void nvkm_acpi_init(struct nvkm_device *);
 void nvkm_acpi_fini(struct nvkm_device *);
+
+#ifdef CONFIG_VGA_SWITCHEROO
+extern struct nouveau_dsm_priv {
+	bool dsm_detected;
+	bool optimus_detected;
+	bool optimus_flags_detected;
+	bool optimus_skip_dsm;
+	acpi_handle dhandle;
+} nouveau_dsm_priv;
+
+void nvkm_acpi_switcheroo_init(void);
+void nvkm_acpi_switcheroo_fini(void);
+void nvkm_acpi_switcheroo_set_powerdown(void);
+#else
+static inline void nvkm_acpi_switcheroo_init(void) {};
+static inline void nvkm_acpi_switcheroo_fini(void) {};
+static inline void nvkm_acpi_switcheroo_set_powerdown(void) {};
+#endif
+
 #endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/module.c b/drivers/gpu/drm/nouveau/nvkm/module.c
index 66d28465514b..cf71c68af89a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/module.c
+++ b/drivers/gpu/drm/nouveau/nvkm/module.c
@@ -20,14 +20,17 @@
  * DEALINGS IN THE SOFTWARE.
  */
 #include <core/module.h>
+#include <device/acpi.h>
 
 void __exit
 nvkm_exit(void)
 {
+	nvkm_acpi_switcheroo_fini();
 }
 
 int __init
 nvkm_init(void)
 {
+	nvkm_acpi_switcheroo_init();
 	return 0;
 }
-- 
2.44.0

