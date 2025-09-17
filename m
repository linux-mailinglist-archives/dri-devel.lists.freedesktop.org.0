Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBF3B81ABA
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 21:45:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F22610E58E;
	Wed, 17 Sep 2025 19:45:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="E3H4POld";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010069.outbound.protection.outlook.com [52.101.85.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91AD810E589
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 19:45:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qg7mMxuT+vwj8J0RQrVcsXhZg65FwHwIimelZutVl+A+Lru7r6jdRdqZx9JXbuXaY2jR7eYAWvgOwIsAKqrCHIqjiM1jKS8Ciwud06cdvvEqpzPSyI6hWOFHlcLAGCHxTscBiqJFVX4SRRyBZKzi4MgrMPHJDV7eSiZ04ZcsWWPXSe+1DCYkbvCdI2ZhvECzKLfz4VQcxJ5+UkiVhlBzJT6qX94tv77JwhpOCf0eG2P3j1a6S6Ryb22DMG6z50oXmg2GK/eYDbhQUjj6XZ9kKPIng3kUsHlJQ1XYBMSKrCQ4gs6i6oJCCxAdN5NmMLF82SzrJ4U80eG28HaIrrrcEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O0M7wv3j6hn1d+OfAxwYUgIGw1nfOLjpUvT/ZrDS53A=;
 b=MCux7aK77iuFFM5khDH0YZK7coUCzdc3W2CymnYSVw4Zdi2QMI0LhsSp0J/dnnTMd5t1YG96hujmsEOUdBS39fsPREn1glG+MjCf81xYxiFRDlIvP8cBy1/MDk20x5/3O7mLAKM+nBERCYoC/OdAediAWPipaGeo6W8+EkwbnVEUQrqxI2IQwYx483TSI3Hu+lbZ5tBQIKYsNKkPPRLpSFnC9AXf2of/3Cq6DfWuouVmH4gAyVcY+cirgz5Ui7IpgKxNQNfuJa2FOmn1MOeagnOj4VqQ11kE58hDomqyAbKdDieAXqkOEk8l0bkm59U8/zuShCX0SdanaJsYsx/uaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O0M7wv3j6hn1d+OfAxwYUgIGw1nfOLjpUvT/ZrDS53A=;
 b=E3H4POldkF8hFoUC1IlSbOwT1M+HwquqsiDxAfo4pVaM6roHinMuJOEvi3Zn0mkU9Toe+Ejn/lrhJiRJfcnLtp7F3aZuyCMfeDwkreWIPC5ykszD2jyClh0Kyis0cl+VcnF+8OjS8d35DKoBiNN9TTBxUlKUIoWxqQymdk/bRfjPoqgGQ0WECGvQ/8bMNc/1irf+0mGS9jwJujs/TTEgUz8n7mUJbOOG53MNrUYuitJX/2lPN7HGvrM2vA9uWnSNAKruJkhysY3vQmS5cCHaW2G1st+7MrERs6U3hOHR50Vsz0ouQcbK51pu9KN3X4+z4JHT9Zs1sEngCFMy2bMG5A==
Received: from BY5PR20CA0029.namprd20.prod.outlook.com (2603:10b6:a03:1f4::42)
 by BY5PR12MB4209.namprd12.prod.outlook.com (2603:10b6:a03:20d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Wed, 17 Sep
 2025 19:45:34 +0000
Received: from SJ1PEPF000023D8.namprd21.prod.outlook.com
 (2603:10b6:a03:1f4:cafe::26) by BY5PR20CA0029.outlook.office365.com
 (2603:10b6:a03:1f4::42) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.13 via Frontend Transport; Wed,
 17 Sep 2025 19:45:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ1PEPF000023D8.mail.protection.outlook.com (10.167.244.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.0 via Frontend Transport; Wed, 17 Sep 2025 19:45:33 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 17 Sep
 2025 12:45:15 -0700
Received: from 9491a72-lcedt.nvidia.com (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 17 Sep 2025 12:45:14 -0700
From: Nirmoy Das <nirmoyd@nvidia.com>
To: <dri-devel@lists.freedesktop.org>
CC: <tzimmermann@suse.de>, <jfalempe@redhat.com>, <mripard@kernel.org>,
 <nirmoyd@nvidia.com>
Subject: [RFC PATCH] drm/ast: Use msleep instead of mdelay for edid read
Date: Wed, 17 Sep 2025 12:43:46 -0700
Message-ID: <20250917194346.2905522-1-nirmoyd@nvidia.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D8:EE_|BY5PR12MB4209:EE_
X-MS-Office365-Filtering-Correlation-Id: 0056e272-cbe3-4e87-2b07-08ddf622c41e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?p8Io3UNtBfI3r2IRvPYKFNzmrusR87IRz1BDQtjnTUk7lMfGQz7xoYIqe924?=
 =?us-ascii?Q?6uuVya20VMkDluw32Q3MRrjNV4JB23d4K1QXNjxeOpOt5dVlP1bLSUbnwtSk?=
 =?us-ascii?Q?Sksvh1/QBy9mQ+5oasKZLN5yhCVvblhcr8S3i66oq2pUyF/s8EDIO6cGRyiA?=
 =?us-ascii?Q?95Xc+68yWaC+/Ee+WyPAGaoM1Ki5LJ6noOu/Ic0ZJxfUEfTsnZ4Sjqo/RSsF?=
 =?us-ascii?Q?e2nsEbhG73nJKi44nzIMnhO3hqqcFg7DQFNGTOxZDLl8zYjxkrPhajl4TaIL?=
 =?us-ascii?Q?q9E/ILlMI2/GMW3om2xlPgQW4fLTvPuwOANEyxiBcEP4NPoPHfxyqFLUicVI?=
 =?us-ascii?Q?tOMa1Wg7mV/d2cXzrRaarlE/XVnIhEBFtRFT2vD4tHSLDsxRBp1ZzU8/lPzV?=
 =?us-ascii?Q?x3J9WzCWD3f6K3PBoc3QI+8/BiXGgXUPVdK+PX5c3FFEsXjQiRGzy6ktzAjF?=
 =?us-ascii?Q?Ui9AXUEmdLTy1wEbdZuJ4sI8fmfAV3Re8J1NOhHknYtCvZbd++josRtU0ezx?=
 =?us-ascii?Q?HZuyQYkiAmohr5cnMvUANE8V2tmpcBZAkyqbHiFh26y2GXOn6z8ntWuFyZIp?=
 =?us-ascii?Q?0Ctim6F9ddjMSQcfjPNRmE0Cc6rC4qtnTFmc2pG36HZh+RL/wC2ywpTHYC9o?=
 =?us-ascii?Q?DmaNF9byxtzwDXEs5Cl7XtJWCvUM864NsE61LbNIPhVCfZmb2sGPLpmuL23D?=
 =?us-ascii?Q?l666NFgSWQianGyV81xBCzA/3MggO5IjiSwIr4Pay6IYAhrkZ/phovEwq5lC?=
 =?us-ascii?Q?a5enTUUcB9IOoVgM+NN8m3xYO0LLwsqSROvehLxdbcxhUlgnrA640bx9HjB0?=
 =?us-ascii?Q?ueY0Qno4Sya9WwN9BFw1z5wJxvn6lUtIqLR+zhEbx8wSutbfrb26m+e+Efc0?=
 =?us-ascii?Q?AWkpF92o7EmGzJB+RP6PYc4qzZA35vTBlys8mDBMxDRaBwUvZ3pAkKJsAn35?=
 =?us-ascii?Q?9DGkPcnaFimx14TN322Q2sj4fADTlozauzGBn3nyEK5xPxK/xwI5s15Gk+lP?=
 =?us-ascii?Q?KT5e9mzdMKAsJnrUtlTy76jiaV++rrfTh6oJBK0t33IDcYG1ci7QRwSwJLv9?=
 =?us-ascii?Q?bSN1LIcTciaI761ADKBAMwwyZ1OUL77a8ELQO3tqlcDPDi/nGAUX+oROafT/?=
 =?us-ascii?Q?N4qlfcoq+wISuY+6RE0JfOlxndiXnrbbzO9YXn8PQMlKR+nEGb+7bQyk6AHa?=
 =?us-ascii?Q?r48yS2wCGn+G6f2bEW67yQK8m8hCK2ox33y/fUSo44tQR+75KjtZu+9QFUyu?=
 =?us-ascii?Q?AK/pHSpu8JCyMsJYAw61O48H2LUO1YRRtQzjBcuzNJY2ijqlgMCdbBnkRqWt?=
 =?us-ascii?Q?StytIDFaHltshkjyybUISLSS9D1nHLkbWciSFHnRzRbketMRzhNClknHV86p?=
 =?us-ascii?Q?Ws3D49QA+Io40NBKBBkvmhl7RaPgeuZT+LKxiY6cOROUwyxVEvm5XRMsgoV2?=
 =?us-ascii?Q?/BIL6uR+g5AePE9NVBvQ80h1eZk8k5EWeR4s3+l4eVr13Ku+0PKu8zUKYEHI?=
 =?us-ascii?Q?QZx58Dba3dysTTKmzcc3A90dHAT8Qw12aWTe?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 19:45:33.4773 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0056e272-cbe3-4e87-2b07-08ddf622c41e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023D8.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4209
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

The busy-waiting in `mdelay()` can cause CPU stalls and kernel timeouts
during boot.

Signed-off-by: Nirmoy Das <nirmoyd@nvidia.com>

Sending this as RFC as I am familiar with the code and not sure
if this transition is safe.
---
 drivers/gpu/drm/ast/ast_dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
index 19c04687b0fe1..8e650a02c5287 100644
--- a/drivers/gpu/drm/ast/ast_dp.c
+++ b/drivers/gpu/drm/ast/ast_dp.c
@@ -134,7 +134,7 @@ static int ast_astdp_read_edid_block(void *data, u8 *buf, unsigned int block, si
 			 * 3. The Delays are often longer a lot when system resume from S3/S4.
 			 */
 			if (j)
-				mdelay(j + 1);
+				msleep(j + 1);

 			/* Wait for EDID offset to show up in mirror register */
 			vgacrd7 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd7);
--
2.43.0

