Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WEOHGeDqjGmtvAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 21:47:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD59212785B
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 21:47:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5BBF10E0E6;
	Wed, 11 Feb 2026 20:47:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="hJpOGPx6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011041.outbound.protection.outlook.com [40.107.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7D9410E0E6
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 20:47:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zFS2Co126SqIsN0rx9atkRFO7/p8mGL27wVrUJKyOz8/RPp5S3pl/FdHWqThMzz9Mhpp1+U9Nz/va1jgVtL1RIijAO5jenX4m5w7d0DUu8lnKNkVO/K8cY/MQ0+/hwaZxftMy0FyVswdq3FlDcimKF/KMlqO022I+Ul9uEffolYij52+I3GaRnJf/UWmrGg/xYBAeoNc8Hnmkiy8FnxdP/P0i9pylpgtfha+Ne08VAysxBX+8mfTeU3Y7A6aYsYeDHwgQpJ/OBaXVp/H83dHJFAadLn6Qigsmsh6NYgZrHj3y6i1kH4a9naic1voY9YVNukJxBuj1rHC5NDMQ43Mdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3h1ksjXsuxCQn+Yyucd425bTgfgnLeT/RY8pXuVawFY=;
 b=b1HefddM/wCrRmIKA4CVuKS2Fhu1HvyIgqLTJ/ehaZmt9ILjNtOzP5g7TPhPcz4CqAPAOsnRSrbMLd2IvX9CjX0eHATdJwYoU7hQNC2EmabnGPLJVCAU991/1QK3NMpj3d8Ttx5XDBoqfGMYE03eNwga9Dn0j4yum6jQRJDgK1CGkCY6znH1dW1b8+O1HMX01M6S8JT4UMSpyqYSt6TxvFYWezp9M87znQNXRUx6m5ARSY2ivDhaUIYURixXr23PcDkXFfiwVIpLpVADMQrwNb6FI7rI1RM0SmcbAnpI6RMiq1fSrHoEsNyiV35RDkGCAa67quXkDPRmXmk3ONGHhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3h1ksjXsuxCQn+Yyucd425bTgfgnLeT/RY8pXuVawFY=;
 b=hJpOGPx6phR1iSz9TbpT1aUhUVa4Cg7RM6fYSdhdUnoJQtNbst5xV07FatUbZLgGDlLuQrt8FfDl3dO92vNRd+IZlZo25NjvOCrJUMZtTLTGFe/MT61jDRCJMaJuUUFt02W+XAf/9/lMSXEKIJTwyiZY5lO6jJMEyNpS5vLDCRQ=
Received: from MW4PR03CA0018.namprd03.prod.outlook.com (2603:10b6:303:8f::23)
 by SJ2PR12MB8884.namprd12.prod.outlook.com (2603:10b6:a03:547::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Wed, 11 Feb
 2026 20:47:18 +0000
Received: from MWH0EPF000A672F.namprd04.prod.outlook.com
 (2603:10b6:303:8f:cafe::13) by MW4PR03CA0018.outlook.office365.com
 (2603:10b6:303:8f::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8 via Frontend Transport; Wed,
 11 Feb 2026 20:47:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 MWH0EPF000A672F.mail.protection.outlook.com (10.167.249.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Wed, 11 Feb 2026 20:47:18 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 11 Feb
 2026 14:47:18 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Feb
 2026 14:47:17 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 11 Feb 2026 14:47:17 -0600
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <maciej.falkowski@linux.intel.com>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <max.zhen@amd.com>, <sonal.santan@amd.com>, <mario.limonciello@amd.com>
Subject: [PATCH V2] accel/amdxdna: Fix suspend failure after enabling turbo
 mode
Date: Wed, 11 Feb 2026 12:47:16 -0800
Message-ID: <20260211204716.722788-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A672F:EE_|SJ2PR12MB8884:EE_
X-MS-Office365-Filtering-Correlation-Id: e79e9790-ebc2-4883-990f-08de69aebf3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?N54KosH1S0rSwsHSHjHc3seZtNfMN6cJudEmz8HhSP61Z3PV+Oelv7+uWbmC?=
 =?us-ascii?Q?U0hyOFl5oRS8vMYFjPQ9M5xt5LzPg3KRVEFqOS1dCNJG0QK6syeMRj2nKITz?=
 =?us-ascii?Q?iUdOAAFbW9mG+cHquWx13pNVLPbXpHtP4rT3rLztnXa7bKqks/fQguI/8k9r?=
 =?us-ascii?Q?Bm3R75kDG+KpE3+S+3IRz2jvKl2E0TiWJbwR2gIsdkbZNGPoomkC0WTIWsgF?=
 =?us-ascii?Q?I7r2zHoZPfG1Fmd0X8jrzojzy1ynx/cecX229DmzFxmbmxle8Pi1/yQm35mX?=
 =?us-ascii?Q?uwiz4xWTX3t7A3dVzq5117jbMTUF627znSvG7gpW6Tn5o44mCBBwF39VqHOh?=
 =?us-ascii?Q?UkezRckJ5dPCHVfFczjDwipLWHtcJ9dZPFb9hikaAHwl47n3Y1YnshTYD0SP?=
 =?us-ascii?Q?48m0+OZTcWSQgDjOvvyM8FMA+Lt2uMdbkwSfL/OsgViDDUlbd92CvZ+fHOCp?=
 =?us-ascii?Q?wJ6fQK08lw0bhwflZNwwpEs6YtqdSCNQzUx8G0B7jL205aTUeE+vu/ClvVvh?=
 =?us-ascii?Q?aNJLyiFHkSONsJhvOvNmq1Fjb5uCgvJvsGOA1TTC9aWpblbAQ4UcRIHiWYJi?=
 =?us-ascii?Q?o525jlZHWiVf4VITnS9fKf8TlAc2E4+Ndmv1pxZ5mVCXf1QQq71XoL6vcJhG?=
 =?us-ascii?Q?tRFZKxdHHShju6BLohIGIx/LJ76iZKab5MnjPZCcCM8vDt9nq+vHXr5j3t+t?=
 =?us-ascii?Q?CemMyK22t4e3thc/2qtE9k/6bYAaxQZaZ86WQnkXFBZuxOXU4ZK6DA995FZm?=
 =?us-ascii?Q?dgEiA6MirfWj6Jptdmgdx51ha7loxZRS9BwRL769nd8lRbmiYlCoCXLPhNnU?=
 =?us-ascii?Q?2GvBc1CFAfaGiWdUaFv+ohrinYOEVWA+aAfkW+CLOp8TZChmJ+mjwJrl1v2t?=
 =?us-ascii?Q?Bva+Bv/cDqX5Aa6yIynnYOklaD0lQISZNhfob7vRb6fdlNm0YklZoFEMoJNp?=
 =?us-ascii?Q?mBWD+AKp4z7KQBstyx9MQMIlPGqCr6OkKSVLPKxyNqFMzRxCgZxtyzteDDD8?=
 =?us-ascii?Q?7wLsonPHwW2EAiTG+1kxcG6svmyWCVw7vaR5lw14HrgrjyeX28zEkfXWtxfr?=
 =?us-ascii?Q?9lWLNoyfVdpX/PttTkRR3gJU0rVfN3bD7w+321HYKdB6H19n9iuPX4N2uIbf?=
 =?us-ascii?Q?2huJbHa1yke1osb9XNrDB5b6dlyuLf08I+Pokl34msFeEyRWmZJ4Z8A7Bfi6?=
 =?us-ascii?Q?4QyfkFGQlTVPca0mg3AErR9Gah1EBXoYaAVEE6PYKk34o9kFgBnWRVYOU3U1?=
 =?us-ascii?Q?sEwt7oBMtREpac9S3ZdkL9jUSZGkLKqYqxOzMxkbHeMehF2n3r1jCROp4gHN?=
 =?us-ascii?Q?t9wagGHZ0ew1kFLuubqTmomHLWlyj05b8E9lJCmL512zkeGlDhXt+RkwqdO1?=
 =?us-ascii?Q?1cgkbIJMikeagpe+/uGEw1aTwtfekKofk5ssr0Gbh4PYChn6ehcVVUO3ZmVj?=
 =?us-ascii?Q?PJT2UvV7BL+/NwqMhokmx96uDK571r7EcoGhl+krxhgSzsNRl39ulS2WqnNX?=
 =?us-ascii?Q?R3dEH+P3KFPt7J1wVJ3aHXln2f0tAaPJsKxhrGcziKSrcUoVSTSw8ulnOu3V?=
 =?us-ascii?Q?t7wpZabXLchUOfK3qUq0L89vViy7KK1+2x+p9EkhJuaEZrtJfvIY+elh9k93?=
 =?us-ascii?Q?aoFoJx8swnyA2OY04NUYN/UWO3AH3IxhtV2MpXk4HngE/3DWBdMvOodnba2c?=
 =?us-ascii?Q?D3L0XA=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 9z6dVH5tNrcoa+z3436pCQ9E0ajyAO6Zb191ydWRV2w1uiXw2OQ/fxdZhrAIOAxpTT93/gEk5GWwKnmep/sQgAslz+ZXeXDrJL75BimTka9oJ2rj/EZx4k2M/4W+fLn20VGkbBSrO+kE+uQz3paj+uJAcg3PQgDhK17W67EXJMWhjVVifuv0rAVBJWjbp7tHpTZ8dlta8ndkN0lwcbR5PPla0UfuEYqpWVtlz6jaAWBq0ftKpG7+wTLONuQScqgdwz/p0EVkf7q98PP3/JPJJbs9RklnpMhXLpZxziq0c/GUEDfdh6mDitn7S9Qzah4LhaLy5dUVliGEv3U4KwHxCzRACtSrFv0LPepngGYnSbX1o2TsgmOfpihC0fDrJoFUi84vcC8918H4fOI6D58NaYJ41N+JB8i2bv2dA2M04SPH7+YQj1PtXhzPOzKGroWi
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 20:47:18.6108 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e79e9790-ebc2-4883-990f-08de69aebf3d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A672F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8884
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ogabbay@kernel.org,m:quic_jhugo@quicinc.com,m:maciej.falkowski@linux.intel.com,m:lizhi.hou@amd.com,m:linux-kernel@vger.kernel.org,m:max.zhen@amd.com,m:sonal.santan@amd.com,m:mario.limonciello@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[lizhi.hou@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lizhi.hou@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,amd.com:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: BD59212785B
X-Rspamd-Action: no action

Enabling turbo mode disables hardware clock gating. Suspend requires
hardware clock gating to be re-enabled, otherwise suspend will fail.
Fix this by calling aie2_runtime_cfg() from aie2_hw_stop() to
re-enable clock gating during suspend. Also ensure that firmware is
initialized in aie2_hw_start() before modifying clock-gating
settings during resume.

Fixes: f4d7b8a6bc8c ("accel/amdxdna: Enhance power management settings")
Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/aie2_pci.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
index 5b326e4610e6..0d41a6764892 100644
--- a/drivers/accel/amdxdna/aie2_pci.c
+++ b/drivers/accel/amdxdna/aie2_pci.c
@@ -323,6 +323,7 @@ static void aie2_hw_stop(struct amdxdna_dev *xdna)
 		return;
 	}
 
+	aie2_runtime_cfg(ndev, AIE2_RT_CFG_CLK_GATING, NULL);
 	aie2_mgmt_fw_fini(ndev);
 	xdna_mailbox_stop_channel(ndev->mgmt_chann);
 	xdna_mailbox_destroy_channel(ndev->mgmt_chann);
@@ -406,15 +407,15 @@ static int aie2_hw_start(struct amdxdna_dev *xdna)
 		goto stop_psp;
 	}
 
-	ret = aie2_pm_init(ndev);
+	ret = aie2_mgmt_fw_init(ndev);
 	if (ret) {
-		XDNA_ERR(xdna, "failed to init pm, ret %d", ret);
+		XDNA_ERR(xdna, "initial mgmt firmware failed, ret %d", ret);
 		goto destroy_mgmt_chann;
 	}
 
-	ret = aie2_mgmt_fw_init(ndev);
+	ret = aie2_pm_init(ndev);
 	if (ret) {
-		XDNA_ERR(xdna, "initial mgmt firmware failed, ret %d", ret);
+		XDNA_ERR(xdna, "failed to init pm, ret %d", ret);
 		goto destroy_mgmt_chann;
 	}
 
-- 
2.34.1

