Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FEB28A75A0
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 22:32:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94BF8112E51;
	Tue, 16 Apr 2024 20:32:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="wRGwMJP+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2073.outbound.protection.outlook.com [40.107.95.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA7A0112E51
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 20:31:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UMAAXgqh4+Exe5Edoq20AInJs201KV9sFUIrUMBuDcksjX5JyVJLVizlWtGdQQN7cE9ihtQMtg+87JA3foyOeS7pqUxNywaLpCd/UThDt4n3azyGC97zXsK3rumONjiaX+2+R3Vm22mUaoB+PGPk9ATTubRAMfkPGYbxgxQw/c1TspTQRQyHFHx3KZEIsEHFyZR0ISZTKllDl2boUJ++aT7H76Y1A2gITziHnF52W4m922vrRDkdJ+N5120yAFQQ4UmNKSwsirGseNiuyPoIFOAbT1BXNbRafeUNBZau3FtzIMx19kIsp+m8uGdNBy4Ihsm3FsrBN8auBaGWZOKL/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ezgf++gTebiTqq0LcG5nwdJH5DgzHmAaTj2kRbBCgkI=;
 b=j8QLa+ztMxQjVI86452UAZPqNT0ZJwtdM07BDymkcMd/4um27BoXx6Ba6pBam5w1MdlGa6r0PeoXcxkYYdXaP/SEPdnYUgLwH7e7wDHeQ748B550TzPyZm6Y/qPFAEJ3aIRZskmhtZcbnKh0fMV7cPMcHPDRyykBDh5BLDouUTLZGxhL3IgceBXY/EaogmPZn/EnRrwBOP2ymD/Gq6xNY2q5hsuAH/zh67eUAunr7giXKFFsho3R0LqaKkiM4xCDRrcKhVcbBZN7lbzp2MMrvx+uxhHhc8HjtCl4hJ4u6anbCubnRUM52GQGoX1NI1Oad2ZUdq7NEVfy/DwVBLYzmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ezgf++gTebiTqq0LcG5nwdJH5DgzHmAaTj2kRbBCgkI=;
 b=wRGwMJP+iWNW3SQazxU6aJfBOYj9XkP0Jr8e/1zpo5PKcu5Sy7zEhcUyZMQFs9Y1EUV1z+VNIS+w6IIvLqemtYlxLkmqD6ZK3mt6SAP7SMQaH5fdNYYs9PFsBJ3pyfDWPMVfrsXpHcVQHDXWRN0Si/90VVQ9plC/dqRjvwZm5sU=
Received: from CH2PR10CA0004.namprd10.prod.outlook.com (2603:10b6:610:4c::14)
 by DS0PR12MB7511.namprd12.prod.outlook.com (2603:10b6:8:139::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 20:31:55 +0000
Received: from CH2PEPF0000009A.namprd02.prod.outlook.com
 (2603:10b6:610:4c:cafe::fa) by CH2PR10CA0004.outlook.office365.com
 (2603:10b6:610:4c::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.34 via Frontend
 Transport; Tue, 16 Apr 2024 20:31:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF0000009A.mail.protection.outlook.com (10.167.244.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 20:31:54 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 16 Apr
 2024 15:31:54 -0500
Received: from xsjanatoliy50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via
 Frontend Transport; Tue, 16 Apr 2024 15:31:52 -0500
From: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
Date: Tue, 16 Apr 2024 13:31:37 -0700
Subject: [PATCH v4 2/7] drm: xlnx: zynqmp_dpsub: Update live format defines
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240416-dp-live-fmt-v4-2-c7f379b7168e@amd.com>
References: <20240416-dp-live-fmt-v4-0-c7f379b7168e@amd.com>
In-Reply-To: <20240416-dp-live-fmt-v4-0-c7f379b7168e@amd.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Michal Simek <michal.simek@amd.com>,
 "Andrzej Hajda" <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Jonas Karlman
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
CC: <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, <devicetree@vger.kernel.org>,
 <linux-media@vger.kernel.org>, Anatoliy Klymenko <anatoliy.klymenko@amd.com>
X-Mailer: b4 0.13.0
Received-SPF: None (SATLEXMB04.amd.com: anatoliy.klymenko@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009A:EE_|DS0PR12MB7511:EE_
X-MS-Office365-Filtering-Correlation-Id: f4a0f8f5-2d52-4089-e0f3-08dc5e544194
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hhX4sRdsoS3j1n7PZdAFmDQ6MByKcK5wdJz4e7N+aeWdSHcPdBX416SYwi/mY3rIH6l7YjCCwA30i8zDEIIk3kFDtrwp7bpDa1m/7plmYM38zG6i9+cYcTbZQ7nxGlxVaXAe42TmkiurkKq1sEqVjFRJrgvXMph62vGrA/9f2uBOvlPlvzAkpRis5cE7t51e8P9XS+npTqRaWLH7FjKyBLkWUVDioirL+ZzSnUR2MmCsub1tnSoK8lGbZP9od3JWLXWZVQmmtVFVAnwIBz08NKrao4v3Z9eqAaUk0DJt2rJxapjAer3h9UMIUq7tqHd86zioH0kKTqtcFIhBVKLuWg8YASlocn7+AvtDjTEIaFIV7iCtYgCggQHS58U118sQLzmbLfy17yxfLMFyv/BFWIl24b+CymbqwIutHQTfIF0g/kYpTKIcY5b0E+Ijt0VCxQCEHa6UMLJx3UVyY+DqkO0B/FJxPdU6GaYMHKgOFJW+LO6nShs/xIsp39X03kA40qxhbR6PNEE+JZRPAOONMVkS9BZJANMHtNoAfKWuEl98cAYqU0Uj/K2LEyrgFpGyDdy2d71etirxfpMrUv8KV9kai2X1YnBsCi/4fBYQTP9CV5l+aYc7WIcLtbqXFF5afTMIfeLLLsHA6yRlRK2Ep7Ix/hL9wv0g2weZR09yVGeDTKoDx/r/9CL9xQr6AlWwvx5O7ySkj76hUL9aZARv1y0dpIk5EM5yUAMCd2ihopFETmQ6r58LnmUWpZClI4nFndwhA2p9P9d82ghmt6W+UQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004)(376005)(7416005)(82310400014)(1800799015)(921011);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 20:31:54.9682 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f4a0f8f5-2d52-4089-e0f3-08dc5e544194
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000009A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7511
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

Update live format defines to match DPSUB AV_BUF_LIVE_VID_CONFIG register
layout. These defines were never referenced before, so no other changes
required.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp_regs.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp_regs.h b/drivers/gpu/drm/xlnx/zynqmp_disp_regs.h
index f92a006d5070..fa3935384834 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp_regs.h
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp_regs.h
@@ -165,10 +165,10 @@
 #define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_BPC_10		0x2
 #define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_BPC_12		0x3
 #define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_BPC_MASK		GENMASK(2, 0)
-#define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_RGB		0x0
-#define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_YUV444	0x1
-#define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_YUV422	0x2
-#define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_YONLY	0x3
+#define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_RGB		(0x0 << 4)
+#define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_YUV444	(0x1 << 4)
+#define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_YUV422	(0x2 << 4)
+#define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_YONLY	(0x3 << 4)
 #define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_FMT_MASK		GENMASK(5, 4)
 #define ZYNQMP_DISP_AV_BUF_LIVE_CONFIG_CB_FIRST		BIT(8)
 #define ZYNQMP_DISP_AV_BUF_PALETTE_MEMORY		0x400

-- 
2.25.1

