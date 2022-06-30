Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF65560F77
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 05:18:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D66A10E469;
	Thu, 30 Jun 2022 03:18:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2064.outbound.protection.outlook.com [40.107.92.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2F2810E469;
 Thu, 30 Jun 2022 03:18:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ASHV2L2pGU+IOTxMkvyWlH7hX+YzI1Mds7b+CFQ7sXHeuzPz8vts86QOpb4CEfA5whqLwfGEAbUjJGWfQdelRAEHspB6Ml2oj3B2xStZwZ5Fis/c4e5F3l0mCi1aTrHhHDELtM6Hgo7Enalr5eJeplDv5Ksf4gVOj2OPRiSABfHlDgcgVeCkG3d4xBHMZfLyW62FWgzJNSEIAmSlr0BUip1D1SI+TPGmtPdtL870QdHqARPL/yVpFoeP2Orq2FVcMnpEsC1tkZEFp6IdvVRRryc4Y/D78s3mIJgU845NcRiqCRl497kc+2+giAdaxl659HKOsBqba13REeFUuuCtug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yDWay7Sj9Pa2Pe+w6/x8ULZbYx0ciSj9DA01e1E9MnM=;
 b=b5rk3bSJvZYfY8824xgDz1WPrtAxExs3E+EOlNhg3tV/lTmSTbZqDcQXJxHoCOqmJsFB2aWYGKwmxuDgcISzmYVJKiAt7+YWJ9NeR6mQ/D3lL53NlqvBdrIpI/vw6eVJosvKPbeWQ0C7rOxMn1ANnKrnaIga6rrvc6lCB9jYPC8iaPfxY24P9+ADbvumUOMZnf1aSOxTbc633Ag6fXka19sC1RoDgmkmXi20RXEYPsy5zIVx7vR+AQwYmHu4Dqi4UEazCntP/AWkmKqmctC2XgWKTxk7h+WKeNUpCI6masrubCmM/bcH1/zvTLwvk7Y+bga3OgR5WP6ESsmgpdr8gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yDWay7Sj9Pa2Pe+w6/x8ULZbYx0ciSj9DA01e1E9MnM=;
 b=N1Qw/3at8JEN7wDxhoftWyePcEEIp9kzy0utVLTHQDc5t01thg3+QhvzGAnwCl9cblQcv4KhqVvyQSKpxd0OyLcnrrIMvfYzJ/YksmL56QGnyz5aW6gIBHFDWqz3+D3tnv4OMmmD4svij52leFUyTUYy21ui8BW2P1A03qQMyh4=
Received: from DS7PR03CA0357.namprd03.prod.outlook.com (2603:10b6:8:55::10) by
 BL0PR12MB2820.namprd12.prod.outlook.com (2603:10b6:208:80::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.18; Thu, 30 Jun 2022 03:18:12 +0000
Received: from DM6NAM11FT028.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:55:cafe::d) by DS7PR03CA0357.outlook.office365.com
 (2603:10b6:8:55::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14 via Frontend
 Transport; Thu, 30 Jun 2022 03:18:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT028.mail.protection.outlook.com (10.13.173.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5373.15 via Frontend Transport; Thu, 30 Jun 2022 03:18:12 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 29 Jun
 2022 22:18:11 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 29 Jun
 2022 20:18:11 -0700
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Wed, 29 Jun 2022 22:18:01 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>,
 <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/5] drm/amdgpu: add dmi check for jadeite platform
Date: Thu, 30 Jun 2022 08:47:51 +0530
Message-ID: <20220630031755.1055413-2-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220630031755.1055413-1-Vijendar.Mukunda@amd.com>
References: <20220630031755.1055413-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3905070b-4cad-403c-7e34-08da5a472a24
X-MS-TrafficTypeDiagnostic: BL0PR12MB2820:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dDBNfS5C+B4d2wPbGEUFpv4DugqfSEK8BBKmpRuGYDPugJopau8cZOVHITLOP7uEdnSZam8wUydwMBJ9dXgjj7KyBVqkttEe9FaVps6X3wGggVA6AtGIhniPQAeHaN58Kzon5EcnZJ1iuHWsI2mMBfJEvkEgK+ehUeQ9+1zIdFw6UtTBvb0VCHtE+kSmKJQmA1fModX5cMe6kFuSBG1ADnoewwKAvOiMI40iBGcABMASAH3W3CYNVbRS5RVhhmglBpQNxb/ngo2cS17O37x8QDAeZn4w4lW/RazGuTELGcDsTYwt3OmgpaZAgn8lf5tqxWKHQe40NGA1Ey7Zumrg20dNPliepBKARrdpiG9pJTkWoaTe7xklcRI0QG0niHaRDMaGYNBe/owfjhkcUNKTncjqLtlyNO6nzoG+HBlRsJsOCl9m2b56wiP9s+xPMwbBdxHAhaoPfZ63eaypAM0ITJ42mkoeaUEknRXokCHAnOGbfTFvBS3OcHH0niy2kTnCFGNglyLgNQp8EgOCFpYnRusjv0FvR8TMg8/yJskSsVbGdJit1S4DndD5Mh0sJQA1CQFs4PedD3zJPGhQINqrR6QHPc58xuBEHm/x1Wn/oauVqyL9fyZ30d4mbCWvr9og4RbNY3YiIp3iNUJ10uBrZ3HZik0pkdSh4Pz9kOGqMyZoYa1Q6LNvSjjoNtXYGxcFi9BuyHz9KHPIAOvHQ2sPYjx8XoEUBOtBpvv2FikE5YWWzAl/ecMkyNT6GyslgJSvDF4EothDf3FvJ+7yvn3EDORO/pCI5IXGUBDVuVfKDMYS5FOl0QIyp6kQkfN/YUQPtKbHrDjOZ04QJT5fiLkM9NKltW+2a6i7uesVneNt/QE=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(396003)(136003)(376002)(39860400002)(40470700004)(36840700001)(46966006)(5660300002)(36756003)(41300700001)(2616005)(8936002)(86362001)(54906003)(1076003)(83380400001)(316002)(40480700001)(40460700003)(36860700001)(356005)(478600001)(82740400003)(47076005)(426003)(6666004)(186003)(7696005)(336012)(2906002)(8676002)(70206006)(110136005)(4326008)(70586007)(81166007)(26005)(82310400005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2022 03:18:12.1621 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3905070b-4cad-403c-7e34-08da5a472a24
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT028.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2820
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

