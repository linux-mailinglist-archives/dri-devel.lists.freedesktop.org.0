Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E62B0C07682
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 18:55:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AF9810EB1F;
	Fri, 24 Oct 2025 16:55:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xwH/okcf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011044.outbound.protection.outlook.com [52.101.62.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCD8610E21A
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 16:55:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bW+WovvTg/rGhmVnixdaD/CaEKFdwNYt8OjJdpbqGA8m8aDYUTgrL+waY+eqzGHHbrwjkRocfniP6bqb9xfO056RAd+bdVd4WuKxfGS/Vzn45DGd/rTf4n6ZVvmE02a/6GWXQF5Xki9zr/mB0FbVpFy6ODyxcayfynwHcQME0ZZ6LarXxk8GHwOxXNh0PKYqhnYhLClTwPc/e33FeReP/6BSwZ3V/F2AaT6RDWd2PGIwzKRNUXGF18GDdDin1BWqLTJ5/d2sFr64zwv/ORIYx4I3++IpWN4X2Ea26HAvPEiZrY+gMHy1/uZmwkgiFnLmkKQuy96kJtDRcEJD4WR+5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OnXaOJO3BLR8eVeFTPuHDjSeik4IxqG0cUqPEqc+Mtw=;
 b=AUO76nIOESbDW09QwBX7v0lNPactiuSUha7JflZKJKVVDIu3vFboHVfCG9AM1zQlpGZpnx/IaSoWP7Ox2YTuIB0v2L3kNY2QxvoSrPlKEEA/C1gpBusAdzmMXF9k1P2z7W2LMCt8HrNfUUujQV6DxbxbEihFXYK2AcEqCV/9KS87RwIxUMLd737ntyAeU2jZNLGayte/ikv5SOn2SZ45Z7uzLiwkdcZ5KQVc4RjW/c5sVr8hmyJGK7GKj4fHp18PmyVc/XD8RS/1YAzRh8LFuV3WiXrodNUrvE/Vy8j4fy4Xqcjs8kTdgbXrZQb+Tb5w7LhcWpMpe/MqX88jhyQk0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OnXaOJO3BLR8eVeFTPuHDjSeik4IxqG0cUqPEqc+Mtw=;
 b=xwH/okcfMpbTlDYaA4aefeJeejKq3ThjoTLWMSH8qcw//9Xp885/qX+4oYFEgiw2tSBIgYaZ266cNod/IVyEqtoyH4zS/U0db46GccLPUSTwkwPfav3Euy+/QOsPrU/QOfny2eQ4qP2Sbz8PoD72t1rvCiDXs3VcpNjQ587bLQ4=
Received: from CH2PR14CA0050.namprd14.prod.outlook.com (2603:10b6:610:56::30)
 by CH3PR12MB7548.namprd12.prod.outlook.com (2603:10b6:610:144::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 16:55:07 +0000
Received: from CH3PEPF0000000B.namprd04.prod.outlook.com
 (2603:10b6:610:56:cafe::dd) by CH2PR14CA0050.outlook.office365.com
 (2603:10b6:610:56::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.13 via Frontend Transport; Fri,
 24 Oct 2025 16:55:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH3PEPF0000000B.mail.protection.outlook.com (10.167.244.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Fri, 24 Oct 2025 16:55:06 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 24 Oct
 2025 09:55:06 -0700
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 24 Oct
 2025 09:55:05 -0700
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 24 Oct 2025 09:55:05 -0700
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <maciej.falkowski@linux.intel.com>, <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <max.zhen@amd.com>, <sonal.santan@amd.com>, <mario.limonciello@amd.com>
Subject: [PATCH] accel/amdxdna: Fix uninitialized return value
Date: Fri, 24 Oct 2025 09:55:03 -0700
Message-ID: <20251024165503.1548131-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000B:EE_|CH3PR12MB7548:EE_
X-MS-Office365-Filtering-Correlation-Id: 39ccb59b-6be4-4af1-4c51-08de131e15e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7Oe2Asxu3ZQVCfNNPhBa7rEyDcTC+tF+iv2kFV4t9PI/SAsNrAJU3wP4K7/q?=
 =?us-ascii?Q?/0wcqZLobfaZTLSJZEfVygMy04Mfg47JP+mLB1HVBtImWSvAn2UdCWHvtsin?=
 =?us-ascii?Q?B1sA2YbT2h8KpMkTmnY6P40OKRuhV9Enh9iz1i3yEr6XGaALZfc3m/jHF9jQ?=
 =?us-ascii?Q?kvphndnef/xS3zjj0Z3K8SixJsi1HqFb8pU5rVqSGAQFj7vV1sVGaxd13JCP?=
 =?us-ascii?Q?Zb7eYUAtFS0UEZ8cHyOk5fVI1t8Xlr5aFoo+snrKBuOKx2NptnfDvf1Rb9P1?=
 =?us-ascii?Q?ORdhjjffgKGn7BxgjKbPcYyeTEfn6pmCMlLkgUXkjjOBbz1BJXLg0+qzpq8s?=
 =?us-ascii?Q?9i4lscRcf0BJniZ5WodOVb/s8ksQQmZytZeXQv+Vm8n51DcgS9dhUMpDwJA/?=
 =?us-ascii?Q?QYfK4G7/tyQjh9Dt7l2RLaZ/GkW6Il066Z/n6u5u/do6/2ov5qZ7VX2c96LD?=
 =?us-ascii?Q?S2Mf4qYOQFOSoPoLswxO2xS+w69FfIrc6053LJNuCf2E/5o8vG8mEzaS5jV/?=
 =?us-ascii?Q?1tYexlLTl1kiBFp/fb7t4SZT0UuNRPh0QKPXaRMMsaJpozLgE1xjbeU10Ani?=
 =?us-ascii?Q?joG7OM/7euGElluOCQAxc7QOBNGEFcTdg5q3yz0Yvji2H8uFSfIZJxYSFpiv?=
 =?us-ascii?Q?Q+VLwxCct4rVaUdCzmy+a4FxTsnIVBDBBvmIO651+hH9b/qUx3XswlaG+Ab0?=
 =?us-ascii?Q?qO1gPQlTTd8WbdN3ga2E1OTvfWyevu4InfYPO9tFEDhutfzqyjzePCGgMeCM?=
 =?us-ascii?Q?n+k91Px6RMlbsaLBfKgBly+cQThsod1EIXQsNg1oEg1EM8v2nG7Dc4e3iR9I?=
 =?us-ascii?Q?rBECo6zOl3w4U48fT2PmrDPquxuJKs2aeGb2FmwzRNVKcEQF5YKTSS2uTreT?=
 =?us-ascii?Q?UhDgSLOEbLibFSS4NlxDd93cQUeV0zsjEhR7xD8ZaiROjOJaZAe899vIFvYC?=
 =?us-ascii?Q?Xnp7pQXCpFS2qUJ+mP2QsR65MKzFDgxkBMkF1UmRREQi797WiLtnYJQx6Qjy?=
 =?us-ascii?Q?ggylL+MNFdJPJeNouKYSo0Bpo0Vp1mkxjv2+6Zf8LXWnFsbriM1jeIilPksH?=
 =?us-ascii?Q?4gj4028OSy1HUelrH++Z3sysRwvVf2gD0D1hdFvjnNZp/E/14zmRgVxSzNNb?=
 =?us-ascii?Q?7/X2tg8vtT88LNlo/A4/wh830VmvJaMp+nCGjtf+1qLtK34S5f1Xxf3MkCCb?=
 =?us-ascii?Q?OAjKktXJfVsqU7X2yQNemDvd33e5hsVN25CXaZYDnloFrliHXcGcNrKXqXL1?=
 =?us-ascii?Q?zaHx7O3BZpW0c+HC8Wjd9lCM2ZytKG9o8eMJp0VoCjoklskmtEiEcxA4eWE3?=
 =?us-ascii?Q?K2XlCS4+LYIn7nsKKtWIqZV8wAAPageWEp8f6k8YCDpqBlpQoRBIYgQf6VNW?=
 =?us-ascii?Q?iXPemNizi2v3KXgmPAj+pU7s1uCysxA2INVs6kpZkW55rUMnK/yV8hhQrEsf?=
 =?us-ascii?Q?J5q8rP6UFm4GVPLepvVU1r9FTBkwc1O6A/CqF5Xe/seWtR4CnIvCKV4hoyxC?=
 =?us-ascii?Q?yNWlr5ozyOGMtTo6q+9Rbc2IBaJJKBoCMGH2dclcRPuKsgSQ1vMC8oVd/YGK?=
 =?us-ascii?Q?JRb+Lt2xHd4NiP5L7Ns=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 16:55:06.9689 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39ccb59b-6be4-4af1-4c51-08de131e15e1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF0000000B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7548
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

In aie2_get_hwctx_status() and aie2_query_ctx_status_array(), the
functions could return an uninitialized value in some cases. Update them
to always return 0. The amount of valid results is indicated by the
returned buffer_size, element_size, and num_element fields.

Fixes: 2f509fe6a42c ("accel/amdxdna: Add ioctl DRM_IOCTL_AMDXDNA_GET_ARRAY")
Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/aie2_pci.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
index f48045318dc0..f1a8112b080f 100644
--- a/drivers/accel/amdxdna/aie2_pci.c
+++ b/drivers/accel/amdxdna/aie2_pci.c
@@ -822,7 +822,7 @@ static int aie2_get_hwctx_status(struct amdxdna_client *client,
 	}
 
 	args->buffer_size -= (u32)(array_args.buffer - args->buffer);
-	return ret;
+	return 0;
 }
 
 static int aie2_get_info(struct amdxdna_client *client, struct amdxdna_drm_get_info *args)
@@ -904,7 +904,7 @@ static int aie2_query_ctx_status_array(struct amdxdna_client *client,
 	args->num_element = (u32)((array_args.buffer - args->buffer) /
 				  args->element_size);
 
-	return ret;
+	return 0;
 }
 
 static int aie2_get_array(struct amdxdna_client *client,
-- 
2.34.1

