Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56EF4A080C4
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 20:48:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6984E10EF14;
	Thu,  9 Jan 2025 19:48:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ejc9PGq3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2046.outbound.protection.outlook.com [40.107.244.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC7B110EF14
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 19:48:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sunkYVuHaRpfdr49bcBli8tvBgiiu3InzQUX0ZB5+6ruZqUM/fZnNzLoUlWbB6FRZqrzLMLt35uEwsZuIZpUIGL8DucZfZnQ1BlOLT8xV1qK7DY8B4x09SaU7jmc2RA4ypjwk4S3RKugWTGa10HerR2H/v8V/srZHT32SFpz8JYs7/bdJJEpzTft5w9PyzL0BK2YnstkGH/p1XFdaxP9rpuQqTzRkIbvQwFFZqiCMSTdzcgZ/S21RGXsDhz13ugvtfPTXbi/IavoWFaL6qEjXqW0zTtnQkv+FFZGP9152zqBm6zMciho3n8KDQ9T1dZgYMnnEVtPMhdViFBo01aEfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w3DTsjV6suRAc1GSAuaUQvT6q4wk2jHjbDQqXpWlY0A=;
 b=f6a0n1OY0X96Igr3w6iY6Yp2a4Hiugt7m+SMevwH7MG2t/h6GKt2GEdKiEFCWsJ6TfRNue3UGeGgvXCIqiisog+pxwQDb/aelr1pQRMSEfleSOBPKcuyT8QfQ90qvMjjige4ItzwtYH567d3ML/yAXmFMT6CIB+wYU68AEU0WrgyHrpzcQ/G7Vgx4Fdh1Za1CVBDUhQI0MY7ymDIXQ/kwxJDcCCEbxUcLtkngwLNWzxbmXDjI9/YQEWr4rcMQUKnZUdjt0JdmBDPiYPgPbtWxKMQYAMt3F05O3Ntumqx3eCRtMaU1de6eMIlOoXD61wMblHbfDJI1uq3DRR5q8XZkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w3DTsjV6suRAc1GSAuaUQvT6q4wk2jHjbDQqXpWlY0A=;
 b=ejc9PGq3rhcwQIggUs4jQDytcj7XUnTRcuAl0KkK8eq95IAr8Eb/HMtnnCy5ENg4i0A91Ov7Ze6XvWANMHCV62+pXwMy8gqaMnxsRuxwXFgpiXhr00xUI6qR/jgIxzpbehTzrWlgjBZU8Cqurz6ZbmOlbNViBcSVjaTFKjHgCcc=
Received: from BLAPR03CA0135.namprd03.prod.outlook.com (2603:10b6:208:32e::20)
 by PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Thu, 9 Jan
 2025 19:48:27 +0000
Received: from MN1PEPF0000ECD9.namprd02.prod.outlook.com
 (2603:10b6:208:32e:cafe::31) by BLAPR03CA0135.outlook.office365.com
 (2603:10b6:208:32e::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.12 via Frontend Transport; Thu,
 9 Jan 2025 19:48:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000ECD9.mail.protection.outlook.com (10.167.242.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8335.7 via Frontend Transport; Thu, 9 Jan 2025 19:48:26 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 9 Jan
 2025 13:48:26 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 9 Jan
 2025 13:48:26 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 9 Jan 2025 13:48:25 -0600
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <min.ma@amd.com>, <max.zhen@amd.com>, <sonal.santan@amd.com>,
 <king.tam@amd.com>, <mario.limonciello@amd.com>, Dan Carpenter
 <dan.carpenter@linaro.org>
Subject: [PATCH v2] accel/amdxdna: Return error when setting clock failed for
 npu1
Date: Thu, 9 Jan 2025 11:48:11 -0800
Message-ID: <20250109194811.499505-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD9:EE_|PH7PR12MB5685:EE_
X-MS-Office365-Filtering-Correlation-Id: 1876f902-b86b-4a1b-2050-08dd30e695c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yAuK19Bwz3ML0VITrGy6cJav2CCFSUNfrbTq3iypdZbFjBUkGg7xn+fLOHVY?=
 =?us-ascii?Q?QSqzre5Rk6//SFi1amIN6o6OZiqGyUqPwjzEK5PS7FOsiw6oJN8BfyBEq2IE?=
 =?us-ascii?Q?AhQ5tgR7udRI8qLyg/lqlkjnQn2285DdtJ18qXTziChIa5SnsHRnXECSUshE?=
 =?us-ascii?Q?GtWYbmYgs/MP/5mYuye+mDz2yYxxxgWqFBGlbwvfW5/a2QN6mBa7NktLCAjB?=
 =?us-ascii?Q?IK/fPO1vYC/jTWchUA7yy8PmfmGj0cyJFz7vw/jAT39rTfdw0AZngK5GugL/?=
 =?us-ascii?Q?0iscM3iIcgwVX25DpjBDQAgDSMRS8HoHvu78lA9oy3ZgXvFen+CoiPEgQPHb?=
 =?us-ascii?Q?xKLRRCLU/VWBoTiKHzM7bfozP7oROYXTdFP2PVLObcbkX3KL6vz/DlfTdKer?=
 =?us-ascii?Q?6xbHNGSuuEitl6nSz0b2/USQ3fCGCbc1oxs0WvMy/Pvh3GV0X+W9mAnHgXUx?=
 =?us-ascii?Q?hgyY1IbORMagElGFt0AvXTs/UtGM8Uusn9h2TwCo1FGq895nhaOJpCl/RxtZ?=
 =?us-ascii?Q?qfsM1020ul1Fc/K42ZY/WC+glS3Afpk9Tg2gcO9xvPTQLROxOK4wyreycVAW?=
 =?us-ascii?Q?3QfHVCjLsBZbIpSLZdpqmlDz+w0btFNFqOuW1ZkC4XYR1D5ItCQLasznpH3f?=
 =?us-ascii?Q?g1qo/o6jEb7He64y9/m9SqNGH/7DqeDFoArS1W3OAeEpaxvfxqfxWZ0O4azM?=
 =?us-ascii?Q?nsSMpsAvjcD2LnqeTVN9EX9dKMOZB9W8wsEiL6j4/1WIRzbMU1SMBdGtifB7?=
 =?us-ascii?Q?nCwZrb2yZcpcPlBrGBU7gEzc5zYI+0hv5v6cHWwnhVP2+IUP7SL+e7ku/dSO?=
 =?us-ascii?Q?qWof5VoZ131buJ+jJ0P7l5Xaqt1/cx9WUUgDMoYxzBHhrEGrA59ll0hJnsWH?=
 =?us-ascii?Q?W0rtxm5De1OMOiYrwCCz/GwPOBJn77nzFY2vzvGxEjiu/+xsZMNz1BMn/sad?=
 =?us-ascii?Q?bcNrdtmhmkVWVAcU1vAzp/z5ZNxhLxTZL6DvkOk2Id3tJseLM+UTeeastpB3?=
 =?us-ascii?Q?wOd8pS0C/gv1eVj0iUFw3LH3+2SWiOREpTSE72jVnU7SF4r3KQAbEFJZjxR7?=
 =?us-ascii?Q?b5u4X2p5X3AzolwVSnmEGcpzkUs456utThtsb8/u9PVXSzHEPyUx8L43TOBU?=
 =?us-ascii?Q?PnIB2JTc4uW1dVzJR5AWCmdp9tNldsYo9tTI2MVADhxosTdLIFNYRf3fxKP+?=
 =?us-ascii?Q?fBq+nzrDvc5tf38oEWgjwDuaUlzhM/Kfv4Km6OXCX0O1Z9sEYY9uMlTGdo46?=
 =?us-ascii?Q?zTMS+sNWULQRzDps1mQjaZUxfuPoNNCYR1661K2GliFiQSz2TNl4smgNXKA7?=
 =?us-ascii?Q?+q+1C+8/VvbpS1R5M7aPCG0nV4R/cEvtMNJCzeAzslz6nEe02Aq3hGoxFqbd?=
 =?us-ascii?Q?/vYxno5L0ZaCMnv7oRJV85mHSipFSmF7WmGvqSvZ7C2abZUZJwmq+lC8pSIk?=
 =?us-ascii?Q?X+1PeYXwdXH19l/6D8/OtWwTyDYx3wUPrdT847nf8poQ7eU+9QY3YdMrcpsn?=
 =?us-ascii?Q?c5m5OVKvdFmLgZ8=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 19:48:26.8992 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1876f902-b86b-4a1b-2050-08dd30e695c2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5685
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

Due to miss returning error when setting clock, the smatch static
checker reports warning:
  drivers/accel/amdxdna/aie2_smu.c:68 npu1_set_dpm()
  error: uninitialized symbol 'freq'.

Fixes: f4d7b8a6bc8c ("accel/amdxdna: Enhance power management settings")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/dri-devel/202267d0-882e-4593-b58d-be9274592f9b@stanley.mountain/
Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/aie2_smu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/accel/amdxdna/aie2_smu.c b/drivers/accel/amdxdna/aie2_smu.c
index 73388443c676..d303701b0ded 100644
--- a/drivers/accel/amdxdna/aie2_smu.c
+++ b/drivers/accel/amdxdna/aie2_smu.c
@@ -64,6 +64,7 @@ int npu1_set_dpm(struct amdxdna_dev_hdl *ndev, u32 dpm_level)
 	if (ret) {
 		XDNA_ERR(ndev->xdna, "Set npu clock to %d failed, ret %d\n",
 			 ndev->priv->dpm_clk_tbl[dpm_level].npuclk, ret);
+		return ret;
 	}
 	ndev->npuclk_freq = freq;
 
@@ -72,6 +73,7 @@ int npu1_set_dpm(struct amdxdna_dev_hdl *ndev, u32 dpm_level)
 	if (ret) {
 		XDNA_ERR(ndev->xdna, "Set h clock to %d failed, ret %d\n",
 			 ndev->priv->dpm_clk_tbl[dpm_level].hclk, ret);
+		return ret;
 	}
 	ndev->hclk_freq = freq;
 	ndev->dpm_level = dpm_level;
-- 
2.34.1

