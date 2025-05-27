Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F01AC5510
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 19:06:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACD1210E518;
	Tue, 27 May 2025 17:06:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="VwSmDiFE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2045.outbound.protection.outlook.com [40.107.236.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23DF310E2A3;
 Tue, 27 May 2025 17:06:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E0cprirjwPQK8Jk1rg+0XYoClfEY/mpaODjHkFyZN+DNfEZAMTmCLRNkWgDydGzNZjwWviR8HCGHQOZvv+zAtvPKzc1wrB4BEavBiRHaYoIpfe2qKY6wmuVa2B7kiaOI2o8j8jCffACyXLkNuyhd+aUtWRG22QwjcMVbfepa910WFwmuFOwPRZWfHuSi9PKFRzGvgXLL71gpeWD1mZqIjMdZwWvaU+wk5FvjivB4XdBuwa/IXGUgrbtB4sprTYwsaTtdIctDzOgAfWFrT3pdF6SdtgqmPeB87srpdJ1cAh2D4a6oQx/vzp2Hd8XdD+LyM1Xy/3TivgP5BpCPoq6QUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AN4daAlqpyba5VCOdCPSzgu4ZqdGnBEhzDcK5I3M7Io=;
 b=BI5APjfCB1feioS+cHdhFBeoAiyApLW4OFs8JNMMdMH87soFZKhcoLX/H+QH4opGOA9BtO0VcHHyh9mGccTZIJWN28+3Lb34975bVj90afrVaPYmfSB5c+HQA842qW5ONFjwvNXNUbf/Wv5pOTZ5rncvIPFX6QnSg57sc9kwTUFG3yz4fMhiJwgXluMc7Sqc2Z0FqPLUUq7NrfvA1iSLkzCb20J+YJ+dRcWeTW6nYuV6FYNnsMpGaAalG81NuohSNrwwkXiYo5WI9eD37gp3taxMlcnHgHjkmVRo+JG0f07tnczCQdpmPrhVmThoUpsSorRNakwSanyobAxa/pkoVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AN4daAlqpyba5VCOdCPSzgu4ZqdGnBEhzDcK5I3M7Io=;
 b=VwSmDiFEaJSNePA0UqQl0ZddVwJtTMxNOSYgPoqiuPGIaoyUqHt1q6Wyqig31m3rGcRomapwy6YWDzLeFZwVvQAhTbaxmPUyDORX/f8WVzfSW/X4rbqhsuPVZqbklDsHL75M38AKYvV0MNNSQbngSOaMbETWBKJHZfnRlqF2kRk=
Received: from SA0PR13CA0005.namprd13.prod.outlook.com (2603:10b6:806:130::10)
 by BY5PR12MB4177.namprd12.prod.outlook.com (2603:10b6:a03:201::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Tue, 27 May
 2025 17:06:46 +0000
Received: from SN1PEPF000252A2.namprd05.prod.outlook.com
 (2603:10b6:806:130:cafe::db) by SA0PR13CA0005.outlook.office365.com
 (2603:10b6:806:130::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Tue,
 27 May 2025 17:06:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000252A2.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Tue, 27 May 2025 17:06:45 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 27 May
 2025 12:06:43 -0500
From: Alex Hung <alex.hung@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <mwen@igalia.com>, <harry.wentland@amd.com>, <sunpeng.li@amd.com>,
 <siqueira@igalia.com>, <christian.koenig@amd.com>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <aurabindo.pillai@amd.com>
CC: <alex.hung@amd.com>
Subject: [PATCH] Revert "drm/amd/display: no 3D and blnd LUT as DPP color caps
 for DCN401"
Date: Tue, 27 May 2025 11:06:05 -0600
Message-ID: <20250527170605.1979462-1-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A2:EE_|BY5PR12MB4177:EE_
X-MS-Office365-Filtering-Correlation-Id: e925ea6d-e131-44cc-c43b-08dd9d40dc10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?p4aBl0j7YN/+SAE/VTVXFF7Zvb/rCrT1iGrXJ6m3zDdWhxzMGBFNF9oKwP4r?=
 =?us-ascii?Q?WKZRBkgCuMFEbUE3tHcotDqZtXS4keR3V1kCCpW9g5heEDGmTEdS+fkcvtk5?=
 =?us-ascii?Q?5dgqGSPH3iAbumNbvxH2MlHUQmVweGDVuGvPA/GxZ/Q0Pd6/GfrN9nmqiUQU?=
 =?us-ascii?Q?mvE3IWAfyIg74Qd0nyeNCLJmwXqAfADqm1YswpSYjRUlDtBe1JN23lENtsL4?=
 =?us-ascii?Q?qSc5c/iWflEEY6owhmpSLY0HV1iudKJhQVaoJ6aWnciZdjBkLAKJji2YFC9e?=
 =?us-ascii?Q?IHroJq6sm1HhKNfDZtgmZfewtqigtNIu81NEBBa02r7I1LSGNcaxnSw9Lxjb?=
 =?us-ascii?Q?cokO7bfp+vUOM2uxrSjXJAecZrHqcoOPA3+DiHyZeswte4w5t3E/aIibY7p7?=
 =?us-ascii?Q?E8JP/78482vCtpl95myZo2bA+mRlZIX/C+ObOpbNfk9nZa0/Z21RLkr+a/Rp?=
 =?us-ascii?Q?5txPOvyx5K8eM7m3jvPfyKPw4dRSGcGL8Kjf+3HOsMgXneJXEOxKWs43jMrm?=
 =?us-ascii?Q?VYZpN+ZC0nTlrFBdZSe07AEtaCS8LR2Va8eJuUdBUBg3n3GjxlVQDsYNNcWG?=
 =?us-ascii?Q?JeyZjZF2I7DCfjzA9kHDtX9Rno54IKzle1RGLu1y70ka6BDNQos4bxnHJTZt?=
 =?us-ascii?Q?+OCtF9XjNrnJVnkANruC3zS+y/Rpv1blfUv1HzoWyUQKivc7dtnvcAJHhyS+?=
 =?us-ascii?Q?GUwq8fOiHMQjMQMcFCQ199VXQbf3ylTjGLyuKEf4A8lg8AVDETOjkKFtol3z?=
 =?us-ascii?Q?VFnaf+8bpMi5lyMY2vi70bWtYfuTVKkXUXtBW53oH48/nmSMIR+dcylmzss6?=
 =?us-ascii?Q?9ekavLothbGZaHd01m4lBL6A9gfkaPkw82ovbLFncpyuMlwsNL1xDJ2JIfeN?=
 =?us-ascii?Q?uiRTqSnUCTNzq9w6swRk54ZPIN2svWJK5F1udLSnvf98tC7j8/8+SyFcvguG?=
 =?us-ascii?Q?OlKDuQAgDfpfcTfWeIUtzm5aeqDucEClqWKAv9M/xv+PCNCADn9aYf0s4i2P?=
 =?us-ascii?Q?4t50VBxvRu+8p4ZfRspblPseVN53TtnYPiRxcZLCsVPdiQT5XpAq7ZFM4VXh?=
 =?us-ascii?Q?V2Dx362PvpE2URXBq0JMhmPKCGTssBvWtArGI4buv7uqCSrtCQtalsmYgBbK?=
 =?us-ascii?Q?FtJqo8Kqe63rKQLG33LxXZk7WHM2fKjL90XzHrdoQpm2/QnFPJMSdcLyVd2/?=
 =?us-ascii?Q?Slam1KwNmmZsnlsqPKhIXRTiSMjF1tFjrGYL0ZBGaljhQH6N0ZT0Z8dfMydl?=
 =?us-ascii?Q?j7EN3ZNHnuSNt3UJAyt9hk0B3t/cs5QS2jDIqcEYQpm3iCFSh0CFqSVvkXgV?=
 =?us-ascii?Q?bu85ZR0NdnRbT7Hfr94gaQ7JpC19dFIfaU3hvyVjhQ9BcmVmO6d16XLrut6Q?=
 =?us-ascii?Q?PVna4KvQI4RmT84eHZdpbu9DreMQa//feetvTsO9p3Bxs+hfsyfptBGMyiti?=
 =?us-ascii?Q?geVwMaPmSJ/Ov1wvfw5Koll9oanh9OCK/zZet4WH0n9ihw7jU4Yq6a2WRyos?=
 =?us-ascii?Q?9hwGUGgO9y6VM5wScdEB/Lf6HPU+AUxjuw3ndpVEpgbdmN31qF8OSdC1Zg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026)(921020); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 17:06:45.1304 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e925ea6d-e131-44cc-c43b-08dd9d40dc10
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4177
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

This reverts commit 46e68dd5066c9831e9695c1756db017bb9c3762c since it
breaks color enhancement in another OS, indicating these two fields are
still used by color management in dcn401.

Fixes: 46e68dd5066c ("drm/amd/display: no 3D and blnd LUT as DPP color caps for DCN401")
Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 .../gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c
index f420c4dafa03..e0e32975ca34 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c
@@ -1938,8 +1938,8 @@ static bool dcn401_resource_construct(
 	dc->caps.color.dpp.gamma_corr = 1;
 	dc->caps.color.dpp.dgam_rom_for_yuv = 0;
 
-	dc->caps.color.dpp.hw_3d_lut = 0;
-	dc->caps.color.dpp.ogam_ram = 0;
+	dc->caps.color.dpp.hw_3d_lut = 1;
+	dc->caps.color.dpp.ogam_ram = 1;
 	// no OGAM ROM on DCN2 and later ASICs
 	dc->caps.color.dpp.ogam_rom_caps.srgb = 0;
 	dc->caps.color.dpp.ogam_rom_caps.bt2020 = 0;
-- 
2.43.0

