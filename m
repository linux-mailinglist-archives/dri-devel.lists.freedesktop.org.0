Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA74857CDA
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 13:40:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4E1610E9E2;
	Fri, 16 Feb 2024 12:40:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="tMec/5ws";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2061.outbound.protection.outlook.com [40.107.243.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9175C10E9E2
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 12:40:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MCyOK5XiJudObf76hXXNobrsGrwgntO0RPqhyq1hcl0Bh18/HBZgQ55WuoUu3A7SBvo6ChrU830pG3zgQ3Kh0ZUSEskYqVqh0BggiXCkGpTdmqKvDGE/cB0KoQFlGAGIUZfyHV3mxK+tkKdQhpE0jCxk37u4M+jq6XFZalJOZ6GdVbyS7xh7EzmkfMwkuialaw83IroRL0lBgPbAb0w1BO0fwRzGwCBDMiD0ffwTzKZSgdKYrazgj3+pHAhgkIdmLKX6Y6FMrTIB/6ou9SyA93aNuuCfjhbNOd1O/vgD+w4sJq9UsKH007nwldAvuo1a5ftEYZm+bBj2SZtFuzP2Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vy5cMRZRanb0NbhtgpX7d0z1D4Qth75YYY3PnDr4D3g=;
 b=fy1qv9sRdu0m4C3V0NwptYUN00Y8lKx5kRrk37JoMrjtHev++L14xs6hv2OpaNGNyEcfv9tgjeHwrPCBTh8BDPEVfHj/3hDvVVhZvrNYiTg0guLZivKb5ixO8WsKABwWxQNSb+H+ueM4dpig/1OunczrN5x114HxLIF64yWs7MKSzfPq/N+6fMqgaFN2O9iL8AXPd8agWNbq4dvoR2M1S8hF7qF9olDPJNlpLwlACX+MPQc3omNe80MOepXIBTzgOo07lgq9vEkBtxPZlU3kqGEY4MIQ77yZvKbHcb/Y/LTTmsqRf3nf4UbdmRFLJYaDL4DXiyzN+VB4VFrsPgu3MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vy5cMRZRanb0NbhtgpX7d0z1D4Qth75YYY3PnDr4D3g=;
 b=tMec/5wsXUS2iiEZkCOQKkUTpB/AuOxkDns4fLok3oi7/Qhd9+wvyfJ1SwLk8v3jvSg0dt7Vvykv0cluBSu2SNjhG5oyLGQICbUi8RWTu1d8pyquH44dcWGn2ZMJKKf02m/bUMCSxA55IFq0LCiuz+qxjjIS4rENHoAaXUyDjdA=
Received: from BYAPR01CA0033.prod.exchangelabs.com (2603:10b6:a02:80::46) by
 PH8PR12MB6987.namprd12.prod.outlook.com (2603:10b6:510:1be::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.14; Fri, 16 Feb
 2024 12:40:46 +0000
Received: from SJ1PEPF00001CEA.namprd03.prod.outlook.com
 (2603:10b6:a02:80:cafe::21) by BYAPR01CA0033.outlook.office365.com
 (2603:10b6:a02:80::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39 via Frontend
 Transport; Fri, 16 Feb 2024 12:40:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CEA.mail.protection.outlook.com (10.167.242.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Fri, 16 Feb 2024 12:40:45 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 16 Feb
 2024 06:40:44 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 16 Feb
 2024 06:40:44 -0600
Received: from xsjssw-mmedia4.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35
 via Frontend Transport; Fri, 16 Feb 2024 06:40:43 -0600
From: Rohit Visavalia <rohit.visavalia@amd.com>
To: <gregkh@linuxfoundation.org>, <laurent.pinchart@ideasonboard.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <michal.simek@amd.com>, <dri-devel@lists.freedesktop.org>,
 <linux-arm-kernel@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm: xlnx: dp: Reset DisplayPort IP
Date: Fri, 16 Feb 2024 04:40:43 -0800
Message-ID: <20240216124043.1226713-1-rohit.visavalia@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CEA:EE_|PH8PR12MB6987:EE_
X-MS-Office365-Filtering-Correlation-Id: b0e26fbb-2eb2-4325-ec51-08dc2eec7f00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mKNu5LbkKaNBUuYYJ/5bLGKPSn8R7DW1Qmh4rig+n+kOG+hoK57nNPNJslXa2RpViCHLYxAAsqympEza5G0ZVG6kc+REUVk4kpZQzvKowCIKKC9N/GesqqXLiTp02qmO3599sXyxcuYhU5wMbqf3Bc/TB+ZWmYFcLYgYwyZBcEc7ZFvAzPfMgbDrdCCVucgnW6KCXRNfh1w89XkCCAifZChK7PHPhV7evVA/C/AFUM+sxYHHUV7zbZn2qDxb7xSOtr02OqK5eWB8tL3UOZgN87Yq6D4Njgmkf4o+rLaCEY/pcph2pyrj79NyxZ0eUdInmdb8YXDUGTdeKVKzwfHNulRlvUJBmuCENupyiBgbJl879OURXh0E+mCmnWQHL/4VwDf7VHLs9TbT5UwAQcY88008ofmXs+c/2QZxvw/tJ2kF9/X282ZGpmugjr+W86BsK38f0aAlSDDhec9GyXQVJLQSESEILinODyFsqPCWufvIho8sQrIcGIbqpxTHhLf4mlw93Z+yF2bq7/EATZF0C36atKhowMYfKjBV+YmujvjrYwxucLdfp/87ATzSldXen8pRla3UnjLuYODKxymWL/ShvLU5NKkejtSyhRnU6cbetCCdzrjKHz7Vs8dBjQxx2EbEsOJbCpC0W310LhaL1SzPS/vylP5ovhzhKYU523U=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(376002)(396003)(136003)(346002)(230922051799003)(36860700004)(451199024)(82310400011)(186009)(1800799012)(64100799003)(46966006)(40470700004)(336012)(426003)(81166007)(356005)(82740400003)(70586007)(7416002)(5660300002)(4744005)(70206006)(8936002)(8676002)(4326008)(44832011)(2906002)(26005)(110136005)(2616005)(316002)(478600001)(1076003)(921011)(86362001)(36756003)(41300700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2024 12:40:45.6444 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0e26fbb-2eb2-4325-ec51-08dc2eec7f00
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CEA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6987
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

Assert DisplayPort reset signal before deasserting,
it is to clear out any registers programmed before booting kernel.

Signed-off-by: Rohit Visavalia <rohit.visavalia@amd.com>
---
 drivers/gpu/drm/xlnx/zynqmp_dp.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index 1846c4971fd8..5a40aa1d4283 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -1714,6 +1714,10 @@ int zynqmp_dp_probe(struct zynqmp_dpsub *dpsub)
 		goto err_free;
 	}
 
+	ret = zynqmp_dp_reset(dp, true);
+	if (ret < 0)
+		return ret;
+
 	ret = zynqmp_dp_reset(dp, false);
 	if (ret < 0)
 		goto err_free;
-- 
2.25.1

