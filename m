Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBA7565BAD
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 18:21:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6D4910E21E;
	Mon,  4 Jul 2022 16:15:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2042.outbound.protection.outlook.com [40.107.237.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90FB010E14A;
 Mon,  4 Jul 2022 13:54:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S9KtvDWfCT+4hbFR93Oy+Pe/TJaXTnrLgdmbSaYtPttbSfq3RlP3gcufH3kokhcVm9KxK2//mbI4ZZocssPzp8nlO4ynLv7mNbKrI83BwxK2PXj7PPVE9UC33pZFP0Plo+P3o7h33aw/6vtLPVr9fwqF+l1subZ2Aw1OsZwMEi0BoGxEc5LnYdLMAyjTQQ/dJz8rtm8yViC0BEzFbBOPqPJbIhrMz/qrz93Wml5Use9DFQfAQ8hGJzbuUSrxEyG7j0PJ0A/U07vlIxfhcQS8qg6xKLdA2Mjp0EkUuTo0ZaQ5RtADSoDw6sos3nk6WGd9MHWQ2ESCVDhlMOAwVOOZig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sERD27XvKX9bYYyCBlogs1VSU4LAqG2RviDZvPXQSrc=;
 b=fp64NT/0AJ03qY8lpA6T6Dn6GTwfgnVZlCS+yHmH9ruVExadq6q1x2ORHTPpkRb2hSgMxilJr5S1GZ4JXVJpX9/kWq6g/rz7f2RuJSeAxZgXJArPe3dRMV/5BgUZGTpbqjJ/Qsl7NzY6QV7LB7zxruEgL4Kt2gbh7Dw3UbfZOQxy+H0vjYH8u4GuHQk+UtL/iZ8uriX3l4lciSX+3fpe2ggTtNkz4otVvExoWlRvhtb/vSfKPMQoMiq9U4B6SHg8J2O7Oj+Ti8le9xpRWzuDvPDhf63kwyUdCT5xHi/om4SXdFQfa7zXm4Z3ybMs49GTKQlDK9CW7YU17vRhNRUDXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sERD27XvKX9bYYyCBlogs1VSU4LAqG2RviDZvPXQSrc=;
 b=BqYamEAqN13Z7O7pvib68LXKq9YXTUsyFW8tm1ugPlZ4CkpjLVg/sDALKPBNMbRnKICKPgOnqAXJO+DVadNN2mxLtZpoCZC6W5WJfZrGHyaYGE+rhLaAvzAAdLABLi/mKMSvlqv23GSAJ3a31By7TmBijwGga2JgUfw2A5HIhlA=
Received: from BN9PR03CA0032.namprd03.prod.outlook.com (2603:10b6:408:fb::7)
 by CH0PR12MB5300.namprd12.prod.outlook.com (2603:10b6:610:d7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Mon, 4 Jul
 2022 13:54:53 +0000
Received: from BN8NAM11FT046.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fb:cafe::ea) by BN9PR03CA0032.outlook.office365.com
 (2603:10b6:408:fb::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14 via Frontend
 Transport; Mon, 4 Jul 2022 13:54:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT046.mail.protection.outlook.com (10.13.177.127) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5395.14 via Frontend Transport; Mon, 4 Jul 2022 13:54:52 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 4 Jul
 2022 08:54:52 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 4 Jul
 2022 06:54:52 -0700
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Mon, 4 Jul 2022 08:54:43 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH RESEND V2 2/3] drm/amdgpu: add dmi check for jadeite platform
Date: Mon, 4 Jul 2022 19:24:19 +0530
Message-ID: <20220704135421.1215140-2-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220704135421.1215140-1-Vijendar.Mukunda@amd.com>
References: <20220704135421.1215140-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f40505b9-6be3-4c92-396b-08da5dc4c534
X-MS-TrafficTypeDiagnostic: CH0PR12MB5300:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aswtqsb9tKayTYDnXN2akMCTqDcrLOWqZsOpEq93I2Xq+6+sTUUUJ95k5+Vp5dEQMKsBSEDK3Ug9ukxs20bAVQXMlgKtoHADtsx3QSEB5fr6koxbZ9E0BGiODHfQH7l8JbKY76LtABpkjqrFMRoM6e20aIcMr2JiXB5/BKNUvTuSaJ+7Mvh7IuZkRK4CDRtTOZmNyhflhtcFrLC+fivJdgd9LiJF/nZ+Kk7T5gbThe7QW0bsSlYXJqQESO8bEMT4sWNYAH8FUFJfy0m+Z0pq74TP2QPlKH1UAZ9FtuS3BYVSZvHfjKVvGcWSD9DWPGmcJdNZXkw2daz118LK6ETA6Invc3iXP7dL8QoKDCkvPnM0uXfdKTwbJWw/Ja3u+a59FwNPcfrekHV/zcNBj64+9W9Ke18YzJ8oeMB1abLSUVikXPTNmortMXxC1ZmBRcYJQP/a/UEuHf4AjEb9hmvXadOBHzLwJtYMGJvR+V6R6Boyz9lnO5OgQ4BGV99l8H/jlS1gCevvvwObFsmq3Gj8vkkRFt7JJBplkuXAuqTt+HoMgLxoesYjPl6/x9ReODkNhOCne4Dx0fO9Tb+LalDbSbmbNbxH8X4UsGTws/ZXbPN2JQgD14vk5NZS/DhRf8Symk2umqnjl+DiQJqwlNNUGDkD0zAsWC/Abn4K0YP11djg4Aydhtz9Q7LlMyeJJ/SDPrSCygv1pXnYnsLTgmRBv4ZHwKP46SDPkU7RXfoJ7B/js6WTSx1caTqbZKcwHqOBcICoXIH8R27dqVgQT+Wu9IFgVQBfASFoeegdLyF+o/bkU5moYce+2TVbO/6C2YgbSsBQlUleSA4K9tWXTZAMKBocwsIEf35kSxwFpr2KBmK4S1HqK6OzyVvt03S6feFe
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(136003)(396003)(376002)(346002)(36840700001)(46966006)(40470700004)(36756003)(356005)(40460700003)(478600001)(36860700001)(40480700001)(26005)(34020700004)(2906002)(6666004)(336012)(1076003)(47076005)(426003)(186003)(86362001)(70586007)(316002)(8676002)(70206006)(4326008)(2616005)(110136005)(41300700001)(81166007)(54906003)(83380400001)(82310400005)(82740400003)(5660300002)(8936002)(7696005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2022 13:54:52.9072 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f40505b9-6be3-4c92-396b-08da5dc4c534
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT046.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5300
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

Changes since v1:
    - Modified commit label as drm/amdgpu
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

