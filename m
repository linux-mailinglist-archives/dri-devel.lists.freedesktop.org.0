Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9EFC4A8126
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 10:10:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC58610EB3E;
	Thu,  3 Feb 2022 09:09:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2064.outbound.protection.outlook.com [40.107.100.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 461DD10EAAB;
 Thu,  3 Feb 2022 09:09:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D7WE88qrgq7Mmz/Xt2g6PsJiVi7ax6SEgRARznMhX1bxiuau5+tsqht2tg5euqi7yUa5H6oWLIntnZ47VoH0iNGfymWk091srDCMZ0MBGWsHnVjTjYdXSvmwKJ/pX07837DEKcMxLcA4v5lcrbgm4SkpZ5ArvXqgB6pQ8+WiBKzaYhCPhPaDlmJRsrukK+CXXS878tusiIH5vS7aqG0v1VfDZSCR3pPdMz/h6Xf3DzdcmBjRP8jrhp0sI+ICqtM1PB3AF6hN92PcRvlgenoph7WKnT4ve7/aH+QCNdbfTRVnt1jhhxMRbCvyf6S+ajO3R9q/9BTCneTal5TlJiTC1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jb1KQdHq022fCoLL6gDsyemzmr/cEpZtzx5J3/PHebY=;
 b=YrVo2tw1OM1iR5+lLjt3GHWngVK2rRL0LqS409j/jKATXiXw4VmkpnFOWuB/1Z8v6jq/dlJq45mTgV69OaHGumx5boPH76Rwget1a69yqMjAjRFlmxL5CHKS2lC7Wj4wdC3M7pOGFCm+rnUf2cysUTQ4635IUKHr6lH3MNQ5ZgzxsRPPL6wVkMrY/N6cNAU4PetnHGDOYpl1tVGKHXqpjDghHmts92xESPXILi1knMilLPflfx9trZCqPYGBLUXd/uX545Ya+89IaaK+R7g1VfuGwxNILy0En7pch7Yd0u0jOfClMisx4D9EcwsU2U7VXEGY+kYoleq1VQ+sEDCvlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jb1KQdHq022fCoLL6gDsyemzmr/cEpZtzx5J3/PHebY=;
 b=l8zlOY4M07rJSQaaSnodT3x7Y/cWnnM7fL+MlZ0l3oqoHiAcNXf1GfYJeU9Yc+F8fROITeRj5zTRfiAN6EWDjQspRixvV4l9USiNMf7P8pdUzq2sydTnOt5raBBtzP5KHP3ebXx5xdqtgSxyqpwuRY3p1W62dv/v9LZ3EE2UPs8=
Received: from BN9PR03CA0361.namprd03.prod.outlook.com (2603:10b6:408:f7::6)
 by DM5PR12MB1132.namprd12.prod.outlook.com (2603:10b6:3:79::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.20; Thu, 3 Feb
 2022 09:09:45 +0000
Received: from BN8NAM11FT037.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f7:cafe::1b) by BN9PR03CA0361.outlook.office365.com
 (2603:10b6:408:f7::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17 via Frontend
 Transport; Thu, 3 Feb 2022 09:09:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT037.mail.protection.outlook.com (10.13.177.182) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4951.12 via Frontend Transport; Thu, 3 Feb 2022 09:09:44 +0000
Received: from rajneesh-desk.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 3 Feb
 2022 03:09:42 -0600
From: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [Patch v5 19/24] drm/amdkfd: use user_gpu_id for svm ranges
Date: Thu, 3 Feb 2022 04:09:13 -0500
Message-ID: <20220203090918.11520-20-rajneesh.bhardwaj@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220203090918.11520-1-rajneesh.bhardwaj@amd.com>
References: <20220203090918.11520-1-rajneesh.bhardwaj@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 330f35ba-99ec-4613-dffa-08d9e6f4eb8c
X-MS-TrafficTypeDiagnostic: DM5PR12MB1132:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB113270CC28D91C711C00C453FE289@DM5PR12MB1132.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ARF1/wsT91DUP70RBWeED5N7OqYi8WlypTfwVAjGTizRaN7YfHYWHsgosdqmPfaMxuTNRxxb09u5zdMFglenZfQiS+/GxQ8f4S9VDE9ZPLqe4phh6Ci0hBlv3sSmrwyf8OM1PcOJzXpSmxe9yr2gbDNryu5Bd7xJbiprCMIzDQweGKvdGguC2j04pXM7zzzyyA4PGgmr4ayZvU03sofd3yO0sMeSWcyXtMscqHLMG+1Dj9MnXl2WLosxS9eqp6KdX/SggwrlN5FEisH7F8gMbMu2kcM0tCxelKiuUn+wyLVzRQHw7K6L6vC8tGbE4OZV8gQjPfqYH/5XTRi7aU+jRfhbdBc4WRMF8NQDrY/ngeHuE4qbjD6dEhvRc4ESrMPyohPoLWCBd1Gf95y7+YcLA72VGjHQ06QkFLWfSczO/biv9+MaBpomaI6ONwKwNX5YkQpk7dGT9AJZikhZvGf+ToFUMzRszmOCqgtBeNv+jAOOyUQEdhukyybPyItoQxUFa/stAGJ/flxncQUbwQjtjmBRGNeEYWzUgveMVBj1D0C5Aw4clCV/0uqFUcMrX2r72/zzJ8oJIQblocFFj6MHpirIfAYbBW7MHIcwcbq/3PeCd7HnKVhkYMX2TzJ1al3otYBuSCPvpDuhogjRZ2/gWeKr2STqt/50cloZqZ9r/sOT+xb7WWKji3c6cDtpupPV2n+TT6bVkcIFB7WMGUtrpw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(508600001)(47076005)(36860700001)(316002)(2616005)(2906002)(54906003)(426003)(336012)(6916009)(26005)(186003)(16526019)(1076003)(4326008)(82310400004)(356005)(6666004)(86362001)(5660300002)(8676002)(36756003)(450100002)(83380400001)(81166007)(40460700003)(7696005)(70206006)(8936002)(70586007)(44832011)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2022 09:09:44.7297 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 330f35ba-99ec-4613-dffa-08d9e6f4eb8c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT037.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1132
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
Cc: alexander.deucher@amd.com, felix.kuehling@amd.com, david.yatsin@amd.com,
 Rajneesh
 Bhardwaj <rajneesh.bhardwaj@amd.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently the SVM ranges use actual_gpu_id but with Checkpoint Restore
support its possible that the SVM ranges can be resumed on another node
where the actual_gpu_id may not be same as the original (user_gpu_id)
gpu id. So modify svm code to use user_gpu_id.

Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_process.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index 06e6e9180fbc..8e2780d2f735 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -1797,7 +1797,7 @@ int kfd_process_gpuidx_from_gpuid(struct kfd_process *p, uint32_t gpu_id)
 	int i;
 
 	for (i = 0; i < p->n_pdds; i++)
-		if (p->pdds[i] && gpu_id == p->pdds[i]->dev->id)
+		if (p->pdds[i] && gpu_id == p->pdds[i]->user_gpu_id)
 			return i;
 	return -EINVAL;
 }
@@ -1810,7 +1810,7 @@ kfd_process_gpuid_from_adev(struct kfd_process *p, struct amdgpu_device *adev,
 
 	for (i = 0; i < p->n_pdds; i++)
 		if (p->pdds[i] && p->pdds[i]->dev->adev == adev) {
-			*gpuid = p->pdds[i]->dev->id;
+			*gpuid = p->pdds[i]->user_gpu_id;
 			*gpuidx = i;
 			return 0;
 		}
-- 
2.17.1

