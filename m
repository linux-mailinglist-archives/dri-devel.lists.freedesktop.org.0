Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FF27F3D59
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 06:31:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EFDD10E5D2;
	Wed, 22 Nov 2023 05:31:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2083.outbound.protection.outlook.com [40.107.96.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 707E810E2EA
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Nov 2023 05:31:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YsRJW9tDxwQSwFc9w9nNYBvNj92ckrummSjd9NzgP0g8BNk9qbORBNL8FaAX5n4mXAw8BiVx/Vb/9os5ESLSxtB/KBeCvd+xrtBVSyXGVftnxZTLsyoR7Jww6/aJzKwesjnOl9drsrMBd73JCpEOKdu43fpz3Z1ET9PX8E0gznLNZ/dRfB2xxZxBfrggpkpm8l2P8haWDzjd9vMApW1cMGdcwfbMCHh1rJuUieY2xAsPCaDp0zdeai4ju4ynGt9ON+PdiEK8wk8mqKLqMZboV3M9FhmFobpECSoQv3kj7Fk1RJqQkfHOJadoWqnhEN/mnjYqACo6VMs4Ohd/uOdHzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vTw4SoSSLjZh8+v4JCagfM9/lx9KlKg4pAxKEQ2dA0A=;
 b=kLxZMRO/qR6xsFajevf5cUF0DWORBGOJeikwk7X/0/Em0VWoniaicoVSA0VBRjPJOZy5hJ+5vtP0jiyegL6V7X0lBWAzfKBnsFS1mFnx/wrNdVJgGVHwxK1V9z2tiFOK5J+LqmrmizGpQ2RnoSHfksBhKddM4Y1v99Byhgb7j/V89x9okEhdp322Hk5yMA3OluNp7v8/fc9YDkvINb6w48mVFIGqrnCxkjEM0D/RX8kV+eVyk+OofkZdYmaao6lCCs6z+DtNhmjTGaLbs+HT6gnw2sUV4SDQFBUTo1Kqd3FVSi8+q8ziClGfpJ7ie9aUgffgfQccChRax4KbgSvZEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vTw4SoSSLjZh8+v4JCagfM9/lx9KlKg4pAxKEQ2dA0A=;
 b=Om6VUEwTe/wjIzJgNhGasGVcZtU/Lx+UuXe515283eh5NNbkyByA8kfvVI5zLsGYGtvnj1D8oEE+5lmJA7eyYVAIswGc7tQDfg0wv29iSdTOYtqOez7oWYrUAe0nMYWOHMR0XA6Xyxn62RDTfcKcMyToTUDg/J7r4oep8wEDibo=
Received: from MN2PR05CA0060.namprd05.prod.outlook.com (2603:10b6:208:236::29)
 by SJ1PR12MB6121.namprd12.prod.outlook.com (2603:10b6:a03:45c::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Wed, 22 Nov
 2023 05:31:09 +0000
Received: from BL6PEPF0001AB4B.namprd04.prod.outlook.com
 (2603:10b6:208:236:cafe::e9) by MN2PR05CA0060.outlook.office365.com
 (2603:10b6:208:236::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18 via Frontend
 Transport; Wed, 22 Nov 2023 05:31:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB4B.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7025.12 via Frontend Transport; Wed, 22 Nov 2023 05:31:09 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 21 Nov
 2023 23:31:07 -0600
From: Nava kishore Manne <nava.kishore.manne@amd.com>
To: <mdf@kernel.org>, <hao.wu@intel.com>, <yilun.xu@intel.com>,
 <trix@redhat.com>, <sumit.semwal@linaro.org>, <christian.koenig@amd.com>,
 <linux-fpga@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>
Subject: [RFC 2/2] fpga: versal: Use the scatterlist interface
Date: Wed, 22 Nov 2023 11:00:35 +0530
Message-ID: <20231122053035.3758124-3-nava.kishore.manne@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231122053035.3758124-1-nava.kishore.manne@amd.com>
References: <20231122053035.3758124-1-nava.kishore.manne@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4B:EE_|SJ1PR12MB6121:EE_
X-MS-Office365-Filtering-Correlation-Id: c6e237e2-dc7b-424d-b4a5-08dbeb1c3b63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JwjNquiUm35KZMw693YQBgtiGD8W5B/2gXSBxriH2FTqDpp4Hvez2QjxAU81g4dOLrzk7UrNv4R1i7j+9t/ovpxDJwCxfyVA/Kfj7LvkShbfwiVsHM3xPD59IaecnrGpRdRumlewZzYenIFSx6usRY6mTPYwrzq87UVu8QhknrhTHAx7ne7RfrBtspw6J9dm6etP+EAWiYp0E3J6CIvfGvaNKVNa0KGf3zYv+qjYjM4C0lbjEDbV1Bru+z8DS9k1gY45tE38FLSRbcJ+clYB4WShPMqvmHJ9Mey6HgV0TgZn9kBeAXW4cSOHkL8sifsCTi4PZvJZfhNpBB/nilAWZc2obXAv6asnBvq1z3r6oi/B4wIbqy3yIDPV4PQUsF4nJvnbLxwVO6bao5clyWxOSKMV8FdEuaJQmDEatgNwzkaeByAqD305iJE/bgTeIxVbKkzPWcAbJBoC+rKnU1qL9uO/Q8ulzHefGcGYop3jsZShVFlxOr4ILfn0WNZoWOfMUB5iQfckX6uXedMPpiFDlHWcw3UUPiXE/C+gM45gdpyGa66wR+lpjX2IXmH8AKP8/tcMwbYfbag6/LCJfceErvwde7oSbAuy33ds/KWWXnKBpe0FkJXDa1HBHTAeUvwGWRMq52fT28H7aPo87P4PS1/CBCdShvsK3g2+bBVeAP3Jgbb5qWVxGx+yfQS7SgIiPS6YgMM9h8VnoiCkYsPx/8EiqeyZqdwhwmdnR3PYV1Y+kw2u+rxbkQOrF3d+YBevaL544ERzkE6PEQMJGihVrNzt+9o35spmsdOSaSCkyZk=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(39860400002)(376002)(346002)(396003)(230922051799003)(1800799012)(82310400011)(186009)(451199024)(64100799003)(40470700004)(36840700001)(46966006)(7416002)(5660300002)(2906002)(41300700001)(8936002)(70586007)(110136005)(316002)(8676002)(6666004)(40480700001)(478600001)(70206006)(2616005)(26005)(1076003)(83380400001)(16526019)(426003)(336012)(40460700003)(36860700001)(921008)(47076005)(81166007)(356005)(86362001)(103116003)(82740400003)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 05:31:09.0590 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6e237e2-dc7b-424d-b4a5-08dbeb1c3b63
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB4B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6121
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

Allows drivers to request the Configuration image
be loaded from dma-able continuous buffer to avoid
needless memory pressure and delays due to multiple
copies.

Signed-off-by: Nava kishore Manne <nava.kishore.manne@amd.com>
---
 drivers/fpga/versal-fpga.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/fpga/versal-fpga.c b/drivers/fpga/versal-fpga.c
index 3710e8f01be2..bf4fb4426417 100644
--- a/drivers/fpga/versal-fpga.c
+++ b/drivers/fpga/versal-fpga.c
@@ -19,6 +19,18 @@ static int versal_fpga_ops_write_init(struct fpga_manager *mgr,
 	return 0;
 }
 
+static int versal_fpga_ops_write_sg(struct fpga_manager *mgr,
+				    struct sg_table *sgt)
+{
+	dma_addr_t dma_addr;
+	int ret;
+
+	dma_addr = sg_dma_address(sgt->sgl);
+	ret = zynqmp_pm_load_pdi(PDI_SRC_DDR, dma_addr);
+
+	return ret;
+}
+
 static int versal_fpga_ops_write(struct fpga_manager *mgr,
 				 const char *buf, size_t size)
 {
@@ -40,6 +52,7 @@ static int versal_fpga_ops_write(struct fpga_manager *mgr,
 static const struct fpga_manager_ops versal_fpga_ops = {
 	.write_init = versal_fpga_ops_write_init,
 	.write = versal_fpga_ops_write,
+	.write_sg = versal_fpga_ops_write_sg,
 };
 
 static int versal_fpga_probe(struct platform_device *pdev)
-- 
2.25.1

