Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0461656858F
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 12:29:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD3971133E4;
	Wed,  6 Jul 2022 10:29:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2083.outbound.protection.outlook.com [40.107.94.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E1BD113373;
 Wed,  6 Jul 2022 10:29:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h6hwLcFMBEP3XJppwcdIAFd0v1f6NRDV4K3pR0sF+YyjeE65u5Y+34OszWGgHRZIONlCZj3H4JzFhnbFz5Tqs3QC3FVH6SZaQ3WEMbX/200O6Anc0ROfd9R5t8cIftbNoy1pMsUCI1Odx8cyVu/k5oYaNQxHMQhXDHU0QIzkHJeGZWPozIJYvriASBaBYTzD9lPPt8+WKvoj8TKA8e4T0+wf+cTcnM1Dq2CvkeniRTXDkNWsBM+/L7IxAUJZlBw/P+w+Fm9W76cv9Iq6M9wRMn/U3X+OdIj/OlenchamPMUaWeuKocxphgZMMPuUTiU4UXXM2NIErFlJ6sAXYN19Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GBQyBbAHzP6qx/ZFSuz8m3iqTFun3VYLyWco8tpHIek=;
 b=QCjO+QgMeih0jQG3IlygHsPHpSO1A8bhfGSEXeH3ybNmaqyqzadS+fIck7IExE/s10JnLVMAxbHkCbsPJKSgi5O5wHftkWlnoQoIPYYCWOz6sesDJC90wYKb1yehB/r8duFQfxf03harokKedRVgGvcSXX2VdnJIolgQio3DKEUjd4CH8f0Kspe6CdWXtoUiLz8HVgbryu2D3yN9vQp1FYi7cn8f5MevCx8aNuc1oVkho+GZjUEqY0RAwZlsRtlscbVgEdoVTPOmK4kWzMaSed1AQwF132SFmeV4G2EdowFQDHcHTCGBF5gLqbZDrAxtcfZssdFGMi+gtPOTrfdJ2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GBQyBbAHzP6qx/ZFSuz8m3iqTFun3VYLyWco8tpHIek=;
 b=vNQ7/+L/y5EDZzr+9p4SRC3qn4HwHvfTpC/up62KKN4Aexbq6u9K2ZsgNL0332eobkz8tIi2r8gYGg7TLcEkPlr1tCOxcC6C8LD049rtooLMup9DMB5s+O+zUYYXzAOo2tj/dXZt7J/tCBNQWLHeT1LVkyNnZ5DP/aBmvxAdxng=
Received: from DM6PR12CA0028.namprd12.prod.outlook.com (2603:10b6:5:1c0::41)
 by DM5PR12MB1259.namprd12.prod.outlook.com (2603:10b6:3:75::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.20; Wed, 6 Jul
 2022 10:29:24 +0000
Received: from DM6NAM11FT044.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1c0:cafe::cf) by DM6PR12CA0028.outlook.office365.com
 (2603:10b6:5:1c0::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.18 via Frontend
 Transport; Wed, 6 Jul 2022 10:29:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT044.mail.protection.outlook.com (10.13.173.185) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5417.15 via Frontend Transport; Wed, 6 Jul 2022 10:29:24 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 6 Jul
 2022 05:29:23 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 6 Jul
 2022 03:29:23 -0700
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Wed, 6 Jul 2022 05:29:14 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2 2/3] drm/amdgpu: add dmi check for jadeite platform
Date: Wed, 6 Jul 2022 15:58:49 +0530
Message-ID: <20220706102851.2451164-2-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220706102851.2451164-1-Vijendar.Mukunda@amd.com>
References: <20220706102851.2451164-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e6f66c38-5f96-4ff0-4ab7-08da5f3a659f
X-MS-TrafficTypeDiagnostic: DM5PR12MB1259:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QftVM/KKUTm+MaiU5Jx2n/b17yXK9oFTkYIB6erh5UrLqpZ2e3lCQLunWy/mdxYjgIJmoGa0PgvhK/B9G0p+oEuflAZTOJ5F+386J7fd8Zz4GDhbqGdcqy76+2amDTqleUNXGBE2Ba4COpQDxVw71rNBzg4TBc2Wekl4wu+/NBTmGPPQhLJMzawzpTi8T6ic4YYnaXLCBzG+OBhJGoDCQwK3ltTwlfxTrZKIZ+MSXA0o1TxrTGJEbYY6AMMxU0l13YQ3cfmRbqjol/qo36lrVLtLJMuajnpaUyPR9T0rm9ShKt2z+m0/OeLKWnEawhQL0vivrBNpPYvbsXVqQWOAT3buTXQA6tGqCc9nrUgiHbMHuDR1WnrudeBXSrdkDsto/GDv7KFU8W0or6LqtqVJ3G4sXvU6fGeCdxq5gzw0n4NMZNarhAxwrI2XZPRrW2UyePjAvR68RZ3vPklo5WdzhyMqtVbJBs5ix25Df8jiMHcjUYV3ujsy/NbjV6CdV5o8qLv+l5Jw/2wOLMM2bGAbGnhE6lrf0IM0wkWdJkJRjz+adP6LIGUcqngN+QvxNocebZRME3iA1IuZXaaNA0HUEtyYn8cemsO0l3wLrfyxxs9/UqSVE+dlL0MXxuiQpTT0zmhBuI8RVJdbK7sG7TBFuPMYzHaV3EQDiWM3qdHsh9auapOxXOa6w2QlPwVhydKFBw7aWHd44miVlqooJpqHnJkWzSNr1p750Ai9B+9jtzpFYUilnFAYxzVahWEbXoTIze2Xi6j0GlZyU/kiPewviDSqO5RxCGauKhKSBgUe48PET1JgmdHltQSsSyyHI0CgzP9ELgSCHHRH+LMbJSvk/udCxJCSKRod/7jjZ7WCh3cls6GERlIJ6Yzb3LNIMSEX
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(39860400002)(376002)(346002)(136003)(40470700004)(36840700001)(46966006)(336012)(26005)(1076003)(186003)(86362001)(83380400001)(2616005)(6666004)(36860700001)(2906002)(40480700001)(41300700001)(36756003)(34020700004)(82310400005)(8936002)(356005)(7696005)(110136005)(478600001)(81166007)(5660300002)(47076005)(4326008)(70586007)(70206006)(426003)(54906003)(40460700003)(8676002)(316002)(82740400003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 10:29:24.3089 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6f66c38-5f96-4ff0-4ab7-08da5f3a659f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT044.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1259
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
changes since v1:
    - Modified commit label as drm/amdgpu

 drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c | 36 +++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
index ceda19152c77..4c265ad198b8 100644
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
@@ -180,6 +185,37 @@ static int acp_genpd_remove_device(struct device *dev, void *data)
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

