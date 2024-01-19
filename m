Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B23DF83246E
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 06:55:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16AA410E951;
	Fri, 19 Jan 2024 05:55:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2073.outbound.protection.outlook.com [40.107.93.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D5C610E951
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 05:55:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E9Z9zCLLFk1u9VDg8B9zLbDO0WVsT4a9KdGWQy816d2pS2z8tElCNdW1EiHOoLT6Fdt1FghiAwfx9qbLX6GfNz03RxS3QZQSZlDbYe0JM0vQsB+52uqzbv75/yzfWrzFIUwjL5BKLaL2NA/D/TLHYHZS2yR0wcXsjmpx+e7m1HGI69GVg92uNnDTF2M7VQQ09bkkjJjCIiD0COV0MNmhdo9gZk13tZ4nRHRRS2E4fNC9u1nRMfqsWEktk130BDIvlz4S3OlXGz8ArO2jKnOhAbmFdrBzK7EAAvTvvah8CH2dvG4bl5IpVK3qVkoRJEsN9+oo9mvfATEMKUDyOVvCfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sbYhtGPpxSXx/5jQiSZ/ohKOZc6mALk5xxnOCV2OPeg=;
 b=hWMeAjST6/faYMIJDlM01if1q6Lw5F5fqJ0IJamgBrXI4+txZ/CasWvyiUlmmTMZIIXldWBJgX/ZvsXeRLkvMA9a2DKv7+ZxtGcdSO2/PEAj7p9OtjLRE2zsXtc18EAU6fEJ3rFLnSBRF4IV62unxxBSYgDlG/bBhcfeCXda7kcSytTQWB5XULUuIrKSJ97Jxwz/U+S5B9+cxIOzpdpNPviYnuZh8IyyaRjiyXUc2KXqXtmHV3mqgdHd+xuvaRUihMFkBrEVfFj8u2rzDhvTquXAXUfhS8F6KPhBTfCelFtKzRy3KX5YnAFlxQT5weKJ/T2DY2siGqlJH1IewTbRyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sbYhtGPpxSXx/5jQiSZ/ohKOZc6mALk5xxnOCV2OPeg=;
 b=AIw4LVtPdxP60IPQCk3MPYsrXvlrZy4E0SEWbyLGsJH7PZKTfdJMYGyOx4Ewx+tHD5cq00YXBJ4y+hcdumawwQeMYlCubwjRkIr4hPg60ZZU7oADYEHbr6c0VH1vCOcM9jOTuS+fSwAh9W3Cq3yzizAQNi+agrNciJS9t6PxdUM=
Received: from DS7PR05CA0048.namprd05.prod.outlook.com (2603:10b6:8:2f::19) by
 CY8PR12MB7314.namprd12.prod.outlook.com (2603:10b6:930:52::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7202.24; Fri, 19 Jan 2024 05:54:50 +0000
Received: from DS3PEPF000099DC.namprd04.prod.outlook.com
 (2603:10b6:8:2f:cafe::3f) by DS7PR05CA0048.outlook.office365.com
 (2603:10b6:8:2f::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.9 via Frontend
 Transport; Fri, 19 Jan 2024 05:54:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099DC.mail.protection.outlook.com (10.167.17.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7202.16 via Frontend Transport; Fri, 19 Jan 2024 05:54:50 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Thu, 18 Jan
 2024 23:54:49 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Thu, 18 Jan
 2024 21:54:39 -0800
Received: from xsjanatoliy50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via
 Frontend Transport; Thu, 18 Jan 2024 23:54:39 -0600
From: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
To: <laurent.pinchart@ideasonboard.com>, <maarten.lankhorst@linux.intel.com>, 
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <michal.simek@amd.com>, <dri-devel@lists.freedesktop.org>, 
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 2/4] drm: xlnx: zynqmp_dpsub: Fix timing for live mode
Date: Thu, 18 Jan 2024 21:54:35 -0800
Message-ID: <20240119055437.2549149-3-anatoliy.klymenko@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240119055437.2549149-1-anatoliy.klymenko@amd.com>
References: <20240119055437.2549149-1-anatoliy.klymenko@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DC:EE_|CY8PR12MB7314:EE_
X-MS-Office365-Filtering-Correlation-Id: ae8f9f3a-38b4-42a4-b7fe-08dc18b326cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7HvAARaEqmz+Rn399qaiWlzaIxt2hXS70AtsNkDRdbGsvnviZO1E3TbxkM0mlEyUXmXWnUVfxkfQ9eCAAV+b0PN2iV4mVM8JevR2HlULS6g488NpeTqZXU+L31c23KHjivcqhxA+aqcy+c7HC1e/QKdS/hU9ShM3FguSvVRIdVTZYy2ID8xnSwK8+QQQCKcguv6gJDQc0KgnQ5KbzL768hHMKlUTwWJrI9v8BgOv6T8lue8YteFI6PM8JIIUsN9ZXdK+kwQeNv0VyLXE18AQDnvL7TflZx0UfwnBmKfE0I27eqW8TKY0hk/yXHXtJmyGEVpWq2N3T7SHzik0QGIqIAwXobr+DJk/YvQBl7oeKDa1g2ACy6NeocLDDQxcAKuV+uQogfnPZlNh/50Lc4AzxOvmKEGIyzeL39jzc99IVZM333Pyv1m4jZ4aeubWzZSMi/Ya7YT/VkjyMZe6r5y8LgUdXbyAuHRcOPH7bLCkikdLtN7ZP8w5w2FMWvtO2japrRpBPNOGkvgwH0cHWuxJY4LLvVjkQ8VJ2SDyHBNSUbtyCLS1S/WlubRPg7H4GPA06lYTtAF2x23sD4WUkdHtwAuS9nEp1n8qDGMeow82SOxueg0wnuwNTrNFcb/UrOy/M/3HV2vW6tg/il7hB0V7S5bDJcy4f+EJI7FkQXK0nwHw0UrBSTZ6XkXD61VMXiKVDqO8VuZfIZqRNiHdQRVwB0IiDWeGG+/DjhPBxv0nzvWdHidWRE+dlggxkU3RER1MktPlg68HbnKBKTRPq7KcFNm4dQ0v/b3UGhwqVL2rkVGLn96Ud2mueBE2PqQVaOULq7S4RkVMXDz5t+UN5T42+dJG4sJTLh6Xf4wzUK8Mc6ZeaeIRJhKmhbR3hk6i89aB
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(396003)(136003)(39860400002)(376002)(230922051799003)(230273577357003)(230173577357003)(64100799003)(1800799012)(451199024)(82310400011)(186009)(40470700004)(36840700001)(46966006)(81166007)(356005)(41300700001)(36756003)(336012)(8936002)(8676002)(83380400001)(426003)(70586007)(316002)(70206006)(110136005)(44832011)(478600001)(6666004)(921011)(26005)(1076003)(82740400003)(2616005)(4744005)(2906002)(5660300002)(47076005)(36860700001)(40460700003)(86362001)(40480700001)(36900700001)(2101003)(83996005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2024 05:54:50.8215 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae8f9f3a-38b4-42a4-b7fe-08dc18b326cd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099DC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7314
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

Expect external video timing in live video input mode, program
DPSUB acordingly.

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Signed-off-by: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index 407bc07cec69..8a39b3accce5 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -1166,7 +1166,7 @@ void zynqmp_disp_enable(struct zynqmp_disp *disp)
 	/* Choose clock source based on the DT clock handle. */
 	zynqmp_disp_avbuf_set_clocks_sources(disp, disp->dpsub->vid_clk_from_ps,
 					     disp->dpsub->aud_clk_from_ps,
-					     true);
+					     disp->dpsub->vid_clk_from_ps);
 	zynqmp_disp_avbuf_enable_channels(disp);
 	zynqmp_disp_avbuf_enable_audio(disp);
 
-- 
2.25.1

