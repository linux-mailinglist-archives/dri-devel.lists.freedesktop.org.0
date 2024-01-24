Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19202839F97
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 03:54:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C9A510F144;
	Wed, 24 Jan 2024 02:54:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2089.outbound.protection.outlook.com [40.107.93.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC79B10F144
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jan 2024 02:54:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hyz0iFS7y2JSRV3QTsSHYUjW5CZKXDyMB7bOOpPJT36Yq2kcqvSZTCf3HYgrtnWB+NZS0i2ytDiotiH7ZJMQUXgHlGTwVcGFkHp3ZmvCG4ho31/4TcDwt8b/edmBW7zb6mz0MVNECVLUTJtaXym46hweXEfUI6n2cdmJSxYPdtesDEyRLlt9DYEFqQaTqYn1n52o3czVPgl0oXETBuu87v6+ljlgOwRyYEA2Rnjhh9c5QPf9h998M6JuouEKggCAj6qk0QaRbqX8GvwQG6z0nIZMMXsNVtuaib0Tw8bqkFj/CaNSa6LJHd625xhHRO3Q2Eo3j0hL9QfSnWyangyWBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A078BbaAGY/zU6JL5BJwe7eSaF1X+L8idnxCjUVxvc0=;
 b=boYcr/A5dH7+lSOnUrYs3xfTis10xyz/7l79V4wfq2RsJVBWbqkU8s2qoR+BoeqfR33/9Q98hJeOMN0OSGCBQYvs2UnR2jugmW0jbZQrryOy27ZPzEPKJ7CbPmymIvquCeRx3c96crg22Yj5UxVcvp1+Pt2rxsdk4jq0+rjn80yfy/KWqllQxaYn19O7UQLCJ06MM8pZd4xCG3xoj/ndwIbBU+15wycsOblMMWE2kajCzUfxMKTE98Z+5pc6P4hQeltrmDgHJp4jvp15XaPPO+SsUeFWSA5I4iE+96NblrSrMLuLN11AFGJr7WvJ/Ld6m5cCdfAhNCTASPRpC924Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A078BbaAGY/zU6JL5BJwe7eSaF1X+L8idnxCjUVxvc0=;
 b=kCgZ5qjjNuqma8svSnKn7rCMmU31W4k+4FkFovItRy7BltmQE2agAYg6XANeHdpCl06KuxxwL3lCXhQnRHDe+2EhCdAOJy06PZmmjmC9q9B8jK9B/zQtBJeQHmuji4oCUOaYiLyi5yoMxU1y1BXENkDwSA8jxBqUcACFENBuux0=
Received: from SN7PR04CA0110.namprd04.prod.outlook.com (2603:10b6:806:122::25)
 by CH2PR12MB4938.namprd12.prod.outlook.com (2603:10b6:610:34::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.37; Wed, 24 Jan
 2024 02:54:06 +0000
Received: from SN1PEPF0002636C.namprd02.prod.outlook.com
 (2603:10b6:806:122:cafe::98) by SN7PR04CA0110.outlook.office365.com
 (2603:10b6:806:122::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22 via Frontend
 Transport; Wed, 24 Jan 2024 02:54:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF0002636C.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7202.16 via Frontend Transport; Wed, 24 Jan 2024 02:54:05 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 23 Jan
 2024 20:54:04 -0600
Received: from xsjanatoliy50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via
 Frontend Transport; Tue, 23 Jan 2024 20:54:04 -0600
From: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
To: <laurent.pinchart@ideasonboard.com>, <maarten.lankhorst@linux.intel.com>, 
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <michal.simek@amd.com>, <dri-devel@lists.freedesktop.org>, 
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 1/5] drm: xlnx: zynqmp_dpsub: Make drm bridge discoverable
Date: Tue, 23 Jan 2024 18:53:58 -0800
Message-ID: <20240124025402.373620-2-anatoliy.klymenko@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240124025402.373620-1-anatoliy.klymenko@amd.com>
References: <20240124025402.373620-1-anatoliy.klymenko@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636C:EE_|CH2PR12MB4938:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e32c268-01e2-4c48-a3c6-08dc1c87bac1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MSWJ4t/kOnLJPwzzEwsglrVEjJ/C7vV5PRKZviuj0eZrJArZf5k2nDipz8TTenkXoN8ddr3HqRkkJFSzJWfkh6tpcFxte3HlQ+/DWMGktRW4yWgg81lEAeID6C+3xN36Q7TYuC/ofKGNJFXUrC5HEpMsLEbJ8uv9taTFx73VCYHC4LXB2uCjfpmxzOP2IuqQDaW6gO9xyEDkHBmCYoo0hGG/vsyQAjYHcqRPZ8vwTtCCYb6mPhsGs25FE6XAIWD8LN/xposJ7lSdiA5AhGbrZYDOqzN0eWICd/7Ei/OJgWcDEAPoJoTc3/9209ApJdQTvkm0AnQnBxOHBMzis82HlhXZbiKdhx0hQtd+tg5GvSiSeXfa+PjwJNINC9vYkawf6gX+CvR00RBZ9HN/ZO2rlJIzbNwGUW+0ZQKPK9E7+we5azIW3Vdaf2rKrAq8N81wVW/cEE0o4x4cVkiuQwTRc4X5e5t5xpEURa26fVqJ9YuxcAfgMY3twOo5oNfn57cs0/jePuX+t2lfD4YMPk9Okd+nRGKPbhb5EQhcm7JQRoY8XLrlI8+8yFoOwKMYSo5gNL7i1jFW5pDALoQADT1/TJFcevk02hVuZ2b8MVE24uRkGxautbeWsKqHalasw1YIjg5eQiZBjEOKhjwBOCAfCo9Q6VlvWZNMfa6N8+SHYPxw13ty7/8S18EBQwmqj7ujWYlbIupRUOVo07hX4ZD+PmizAcndAGB0B9uYPJkaEAsaCeOwqpm4dR4UzwkYLA5/NNst1glp5wHX41UUCJQSwE33NBFgyDAXy2cbbPdB+VkArlzOXu9j+H8697Nftv6LEpqw6PIRmFQ27AYWUDXUjJGQ0yUCdWk+7zVJugUYGsbaxw7CXNTpWW3aCwwizeZ+
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(396003)(39860400002)(376002)(136003)(230173577357003)(230273577357003)(230922051799003)(82310400011)(186009)(64100799003)(451199024)(1800799012)(40470700004)(46966006)(36840700001)(70206006)(110136005)(41300700001)(316002)(70586007)(82740400003)(478600001)(6666004)(356005)(86362001)(40460700003)(81166007)(40480700001)(36756003)(2616005)(336012)(1076003)(26005)(426003)(44832011)(2906002)(36860700001)(5660300002)(921011)(47076005)(8676002)(8936002)(83380400001)(83996005)(36900700001)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2024 02:54:05.8558 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e32c268-01e2-4c48-a3c6-08dc1c87bac1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002636C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4938
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

ZynqMP DPSUB supports 2 input modes: DMA based and live video.

In the first mode, the driver implements CRTC and DP encoder DRM bridge
to model the complete display pipeline. In this case, DRM bridge is
being directly instantiated within the driver, not using any bridge
discovery mechanisms.

In the live video input mode video signal is generated by FPGA fabric
and passed into DPSUB over the connected bus. In this mode driver
exposes the DP encoder as a DRM bridge, expecting external CRTC to
discover it via drm_of_find_panel_or_bridge() or a similar call. This
discovery relies on drm_bridge.of_node being properly set.

Assign device OF node to the bridge prior to registering it. This will
make said bridge discoverable by an external CRTC driver.

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Signed-off-by: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
---
 drivers/gpu/drm/xlnx/zynqmp_dp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index a0606fab0e22..d60b7431603f 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -1721,6 +1721,7 @@ int zynqmp_dp_probe(struct zynqmp_dpsub *dpsub)
 	bridge->ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID
 		    | DRM_BRIDGE_OP_HPD;
 	bridge->type = DRM_MODE_CONNECTOR_DisplayPort;
+	bridge->of_node = dp->dev->of_node;
 	dpsub->bridge = bridge;
 
 	/*
-- 
2.25.1

