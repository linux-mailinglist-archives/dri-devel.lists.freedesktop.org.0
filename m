Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 391C665C98B
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jan 2023 23:21:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA41410E3F3;
	Tue,  3 Jan 2023 22:20:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2058.outbound.protection.outlook.com [40.107.93.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A504C10E514;
 Tue,  3 Jan 2023 22:20:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FXUf0C/GTKTWAlq8rr5PcpAzQDVZaovfHg4l6TNuCPY2tc0CnmsU6Zwj2H0FDB6ZVvlg4slWYiFARCOQR9MXSyzayz03QvebLlBSGboQ/39i5/l6OlHyl3Z3R8MofLLxKx3HJZYmXF4YpXUvsanbIXR5IVRmSyEuuUxqB7tavD+DazShg/6Wz2/bIgBTuxd1eNzISIjKsB4DIdMcFAF61fRHL/rZOqNq+4ia31v2NhJn9jnH3Lm6PvDO7U34gR+kiR57zeMIr7E1eT+EuQXaQ1gg2I+yAGP8eRI5YOHLLWrmZrjM/teVldh7tPsqGakG8GcLI5cWgDJA0YOrsuvUcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x/O7RPD2JYQo30CJswIa/YhQEv3VyX1NY4yMwHxewTA=;
 b=LJcY/vGvJAMb3myDT1EteEvFeSb+yG1fBgG4W1jkD7IwLLRV4PIhu48yGHznWmVFcxLCjVgjstolwcAaOCViRCabK0ge2jvZNaxX/KPBP9zTs6EUv8ttivbejSGtTf4agjYFymLvE9Mnt00pEhnAVggHXqL7w2M3slhjMioQb/LtORYyRgLc6uCxFzeETwIU9HtzTrAq+9zANabqSA55vOSMf/3xeE78IXfLHCcYMOxQg8LBEejnDuZuIplTDcct6Nb09kFrrvq7Q+5Rns1f6sl8kF519MdCcNYU5v3TDBNCu8o6BZAsw5QmKreRonL4ezG/6KhbS6CywR40MRpkJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x/O7RPD2JYQo30CJswIa/YhQEv3VyX1NY4yMwHxewTA=;
 b=G05ZIgu63G1/CKKHXSZa0MTZVpf+3cceu5kS2R7pa9CdZ1gbX/OhfaUkoJh13OTYdVH3miPakwZSHQUS5C4UI7S4H2KIJ7FUEsrBN6a/4EGObigNCdBXob05NybsSYo0QletVBIIPNsIRE+aernnZfsld68GAlQGKRGqO88pUCE=
Received: from DS7PR03CA0129.namprd03.prod.outlook.com (2603:10b6:5:3b4::14)
 by MN2PR12MB4317.namprd12.prod.outlook.com (2603:10b6:208:1d0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.18; Tue, 3 Jan
 2023 22:20:00 +0000
Received: from DS1PEPF0000E655.namprd02.prod.outlook.com
 (2603:10b6:5:3b4:cafe::62) by DS7PR03CA0129.outlook.office365.com
 (2603:10b6:5:3b4::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5966.19 via Frontend
 Transport; Tue, 3 Jan 2023 22:20:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E655.mail.protection.outlook.com (10.167.18.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.8 via Frontend Transport; Tue, 3 Jan 2023 22:19:59 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 3 Jan
 2023 16:19:59 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 27/27] drm/amd: Optimize SRIOV switch/case for PSP
 microcode load
Date: Tue, 3 Jan 2023 16:18:46 -0600
Message-ID: <20230103221852.22813-28-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230103221852.22813-1-mario.limonciello@amd.com>
References: <20230103221852.22813-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E655:EE_|MN2PR12MB4317:EE_
X-MS-Office365-Filtering-Correlation-Id: a5ae0a10-7d05-4fa2-9537-08daedd8a73d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mquZa3m/B09Q1KOxGlbhKXRewyWcrLZ/z0D8U6BnoJH+hNaQX8iFr/SnZy1iIshsGqz5oiKjQttXduofen7KFyUB1QNTvE0SFLM4kclc2hD70ZMPmXppm5H+B8Fk7KARwcrtpCozOFqOYORnZ74rwWANUFpBmbKAd5RXtd8ROrW93bpW3r1acys4n6d00W0Zm3DKKEYGh3XNSk1/74X1yJHFWsj5zFMLh/vW+4Es+kzwi4f5jzJRqTwoyKpuAas8D6IeKMWDnVCjot65R/jQTbXE/z2ivj0zPopSbzrM/YFm1KKc7uqeARY2DP7P/XaRTSTi6AYBHzmK/v4zYlhNBsV3fjJ9VKXNSHfda5NzQZQdpZwo8wpwQ3fFmgkipIy2IgCIliFLskYAWnttCayYpsTWo1+SzELyOCf5yHvotM+dztYmptiaKapViZMumbe/NqT26KBzgJ6cDTszWW/W+FTfRKbuK0TgRNZuR7+dO5qbrlZszMXayTX/2AjipZn4/DMqBQIKpAw5vxtIOE2qqF9SY9usQ70KjFEGko/OkNZ7WYn/w24nw6bP7H8/pFI+KDVKfvfTIa3SOJOgpkNZtv11BsLNEFzIFJXNltUBSTdEnNopEgq+aDPabQtJwdAisJHhrU/smXnyrDfCNYKb9hPbNmECX7aqbZ78hpRkZTgsvLzhRYh1sszFJ+ixNcQiooW9+wuns/1TacPDeBGSbDWmr5q0UKIHthDc6yAR2cTKAlYvdDV2utKT2EHnrFTxbKrejFFK6Mb3DMjWpn0H7w==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(396003)(376002)(136003)(346002)(451199015)(36840700001)(40470700004)(46966006)(36756003)(70586007)(54906003)(70206006)(4326008)(86362001)(110136005)(41300700001)(8676002)(356005)(81166007)(82740400003)(36860700001)(186003)(7696005)(26005)(478600001)(6666004)(426003)(5660300002)(8936002)(40460700003)(2906002)(47076005)(316002)(40480700001)(82310400005)(1076003)(2616005)(83380400001)(16526019)(44832011)(336012)(22166009)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2023 22:19:59.9958 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5ae0a10-7d05-4fa2-9537-08daedd8a73d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E655.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4317
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, Lazar Lijo <Lijo.Lazar@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Carlos Soriano Sanchez <csoriano@redhat.com>,
 christian.koenig@amd.com, Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that IP version decoding is used, a number of case statements
can be combined.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v3->v4:
 * New patch

 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
index f45362dd8228..83e253b5d928 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
@@ -132,14 +132,8 @@ static int psp_init_sriov_microcode(struct psp_context *psp)
 
 	switch (adev->ip_versions[MP0_HWIP][0]) {
 	case IP_VERSION(9, 0, 0):
-		adev->virt.autoload_ucode_id = AMDGPU_UCODE_ID_CP_MEC2;
-		ret = psp_init_cap_microcode(psp, ucode_prefix);
-		break;
-	case IP_VERSION(11, 0, 9):
-		adev->virt.autoload_ucode_id = AMDGPU_UCODE_ID_CP_MEC2;
-		ret = psp_init_cap_microcode(psp, ucode_prefix);
-		break;
 	case IP_VERSION(11, 0, 7):
+	case IP_VERSION(11, 0, 9):
 		adev->virt.autoload_ucode_id = AMDGPU_UCODE_ID_CP_MEC2;
 		ret = psp_init_cap_microcode(psp, ucode_prefix);
 		break;
-- 
2.34.1

