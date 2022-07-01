Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC4E5632AB
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 13:41:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0043F11BA9F;
	Fri,  1 Jul 2022 11:41:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2048.outbound.protection.outlook.com [40.107.93.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A73B11BA8F;
 Fri,  1 Jul 2022 11:41:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hI7HdpW3zfzTVWyfv9ZEOjGjabBgdH2n9k5VO9eF8ig5oub/nP/R6k9BTEJXh++FHUN9KIt46ENHEOoyTRth19826pBdnmck/CRR8Lh12ix1z2hnfaJ7APg5JNmeVJz+g2gttF6/cRNubyuGex73bp7M4nnzZdsb+X0Y9Z6Y0a252VuH5ddigoB82K7pq/M/hgqMspUGDO8K41p8UH2lRmF0gSdTx4MFpQioB1qwXzx5Mq00H6TMgzvd5UkN3IxShf8SwXEgdurZrLKIGkLXywliiIQofuz2Sfhf6lJe3gzWb1xROLrI4KuxMvEgvGTkUXTRwzSx0WnqYyHj3jO4gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yDWay7Sj9Pa2Pe+w6/x8ULZbYx0ciSj9DA01e1E9MnM=;
 b=crfRtvfG4QHRLkdojv08qh+sDCewjJcofMrpMkl9WZyJJIeVW6LkROfsTADK9Hf5b2/Ww0i7isTo2tG1u5o17AheJ8fSbXAbWAbCloIlVtbgaa+tvz3Gs6UqjIUQ+99eKtDKNTyFq/zfEqN8Lvo3fOup1TolUXIIG1nTHItfkXpV2Klzr4KImvWcN8G0yjgmOiGDMSNuS5YF72waCWlAINw9SfukK3ad7YP1JR7XAsJ+F+rtUX3anyd0OmwdvCRuY4Sl4cZAle9nRvPH73MTEtioM3jUDY0+CzzzwWtKzM4Xbq91k88mjGKAIuPEPJf0YzgOAILgGFSI/9dHjHTEZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yDWay7Sj9Pa2Pe+w6/x8ULZbYx0ciSj9DA01e1E9MnM=;
 b=SEKyj3aRZfxGCpGgCGvbhyQxQXPAsJKHz+rN/KjzARC8RxxuVasP0igm9apMJ27hQ4ALafNo6NZSxq3tX4IEwGKDWO81erZrShtcXNSf4p58kLg24LUFv+oRYKxAu7fJccfoFPLmgkGl34Kz+pYV3Efs9JKBIuh3bfXugJVqDl8=
Received: from DM6PR06CA0096.namprd06.prod.outlook.com (2603:10b6:5:336::29)
 by BN6PR1201MB0242.namprd12.prod.outlook.com (2603:10b6:405:57::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Fri, 1 Jul
 2022 11:41:31 +0000
Received: from DM6NAM11FT041.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:336:cafe::bf) by DM6PR06CA0096.outlook.office365.com
 (2603:10b6:5:336::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14 via Frontend
 Transport; Fri, 1 Jul 2022 11:41:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT041.mail.protection.outlook.com (10.13.172.98) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5395.14 via Frontend Transport; Fri, 1 Jul 2022 11:41:30 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 1 Jul
 2022 06:41:30 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 1 Jul
 2022 06:41:29 -0500
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Fri, 1 Jul 2022 06:41:20 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>,
 <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH V2 1/5] drm/amdgpu: add dmi check for jadeite platform
Date: Fri, 1 Jul 2022 17:11:03 +0530
Message-ID: <20220701114107.1105948-2-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220701114107.1105948-1-Vijendar.Mukunda@amd.com>
References: <20220701114107.1105948-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d42f8eb-f666-4f6e-5d71-08da5b56a451
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0242:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bi2Idy+coIwmuZrBlkTGEjLmau7z3+gAS+nJYfXYhzChEOb4sHMhkgnoBx5DQGeTTq7VWyVNZUYxliEDDfydBCaeFERYWQokCSJGwt6UCOR+hvTsuJb7pj7DZT/QKK0A4zOID6YGzkEGZMBJ8dj5tW8QuXHRJC6QNSdrAAW6duNM5UIMGwhTB2mIRuRshP3fV+UolIXMZscC2YzpXIl3Y65dVon4hJ1fyb92ksh5ijlAkLy7XTvtKKU3b3zVrAI0Khk/SCLz83aVb9aLJ8FI17+DOXAVuDfmObSAnV7HvMcUH7Y0i3q02uN9vtb0W/vMoS7pjI1VjrZt0COfBzIpfs9q1V1qVdcyeveOtY4mdN8zFSbNuiopaYAag4d+2TrS4Zn8pyK1jml7dSNf723DPnbdQEH82ce2aWTms/SFQ2bFI8Ruz4czyE/cwXciXJGe/pEMZZAEHsLjKvi1ikr6ukCbX/1EDyIqyWHtxQH6apVWaZp7EezxsGTlMCMRxjEV8eM9N9A6XK4LFD+K3uAjSxSjqXSlzYs7miFodDrjHZdNh3v8ZSCfwRo5i+zx2qbVef4a4d+NFKL3g1BbqBk/q2U7z/We6yuPI0zcoNBLd/Clrt8As8u0FjTfGLzX2bVMco2RZMvrVSdRVabTqDFgRpqIU8RYjwUSbbdmRHEX1dmyJohOEePCi0P+9LGKWaIIHi6i87Ej6MeC1zTo1yilpAQfL3dUs11BmkKNPGFgVmbUSk2cqerpYKUcTNqOoAaJHj8PLF+T6C/GJZDYhZ2RCsy0YDJ4PkdNLR9JFX6WFmjpDMzNbw9lPU3jYuOcol+b8Oz2MmO+TygggGSH0OBBLNjswc2dS/yv6gVI3bVIuQQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(376002)(39860400002)(346002)(136003)(36840700001)(40470700004)(46966006)(186003)(110136005)(6666004)(47076005)(426003)(478600001)(336012)(41300700001)(2906002)(81166007)(82740400003)(40480700001)(316002)(36756003)(26005)(86362001)(2616005)(54906003)(1076003)(8936002)(82310400005)(70586007)(8676002)(4326008)(40460700003)(83380400001)(356005)(5660300002)(70206006)(7696005)(36860700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2022 11:41:30.7519 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d42f8eb-f666-4f6e-5d71-08da5b56a451
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT041.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0242
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
Cc: Sunil-kumar.Dommati@amd.com, David Airlie <airlied@linux.ie>,
 Basavaraj.Hiregoudar@amd.com, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 open list <linux-kernel@vger.kernel.org>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, zhuning@everest-semi.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DMI check is required to distinguish Jadeite platform from
Stoney base variant.
Add DMI check logic for Jadeite platform.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c | 36 +++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
index ba1605ff521f..af7b42056a89 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
@@ -29,6 +29,8 @@
 #include <linux/platform_device.h>
 #include <sound/designware_i2s.h>
 #include <sound/pcm.h>
+#include <linux/acpi.h>
+#include <linux/dmi.h>
 
 #include "amdgpu.h"
 #include "atom.h"
@@ -36,6 +38,7 @@
 
 #include "acp_gfx_if.h"
 
+#define ST_JADEITE 1
 #define ACP_TILE_ON_MASK			0x03
 #define ACP_TILE_OFF_MASK			0x02
 #define ACP_TILE_ON_RETAIN_REG_MASK		0x1f
@@ -85,6 +88,8 @@
 #define ACP_DEVS				4
 #define ACP_SRC_ID				162
 
+static unsigned long acp_machine_id;
+
 enum {
 	ACP_TILE_P1 = 0,
 	ACP_TILE_P2,
@@ -184,6 +189,37 @@ static int acp_genpd_remove_device(struct device *dev, void *data)
 	return 0;
 }
 
+static int acp_quirk_cb(const struct dmi_system_id *id)
+{
+	acp_machine_id = ST_JADEITE;
+	return 1;
+}
+
+static const struct dmi_system_id acp_quirk_table[] = {
+	{
+		.callback = acp_quirk_cb,
+		.matches = {
+			DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "AMD"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Jadeite"),
+		}
+	},
+	{
+		.callback = acp_quirk_cb,
+		.matches = {
+			DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "IP3 Technology CO.,Ltd."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ASN1D"),
+		},
+	},
+	{
+		.callback = acp_quirk_cb,
+		.matches = {
+			DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "Standard"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ASN10"),
+		},
+	},
+	{}
+};
+
 /**
  * acp_hw_init - start and test ACP block
  *
-- 
2.25.1

