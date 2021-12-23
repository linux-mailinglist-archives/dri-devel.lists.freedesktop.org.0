Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBEE647DC29
	for <lists+dri-devel@lfdr.de>; Thu, 23 Dec 2021 01:38:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2648810E173;
	Thu, 23 Dec 2021 00:37:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2049.outbound.protection.outlook.com [40.107.237.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C25B10E183;
 Thu, 23 Dec 2021 00:37:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ExrX0Hfh4giFsABMQ3Qd4moJ+lQTE7IjZqQxSIhxQqAghEMr2dgEb3jVeVJDy4oGfis2E6lIk0GPdlNZz8JkkHjXjj6SEug6auXSosXdxKR65HcFkZt/Q7//+q3KvyyU4hpktWKobg6K9jOSHxgIimA94z557GuD/auCTXGpmbBeLwbUqclzuuoeu+vohqWLZ8ZM1K8bc+rk7q1tuehyYPB9S7q5UlvGSsBxwIuVdlLMALrDLKgPZKJ84eh1oN8Qaqos83pL7Q1i7B1SEbBRDdCUFk2xhlToC9kLnykyCSKHFxjyJOmq1u+7465Lpl82okywg6AaUpUjwRU+AwgAfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=znzBp2LMFyE0dSUvltw/vBtubynJD6U8ViQTsrlGAjg=;
 b=jEXJkNIFSvEZzJ+U/q8gmoV+fg0bqGp5WjZ9hhO8VmUi6ax5K0Wf4LOcKzC6SxpVxXDqF5OtrFDR7dIKZBSP48qo4vT0ul+nGuDsXYGs1HWLWhpctF9rTMIA7m64/zn4QPaCt2M2yQbDz06yd8FD2J9IKa+oCGPNYr8ZO4VRC/p+ARvseH87mNHWj8G6S+dlCgI81KQIf8g3C8evjLP6NDNKx4YIll1LFuLEaMpD9aNNj7RqWn8TuzRh7Vi3rhu9E8XHivUwXiTMXp7XN+4ISIibzzJ4v0WfHKxf2XUcea9PwmYmw7m6SogVBFkTngYR/6lLeGkOduFLT8I04YU8lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=znzBp2LMFyE0dSUvltw/vBtubynJD6U8ViQTsrlGAjg=;
 b=Qos0EUqYM/i0SIAoHCOQNAhhu/QBdRzPwTSfkiPWW75vDsd0U5llVxLHDsSqmr2H5ibwN0J5eRzraTNfa40EQAqBFGBddJfnZe9LO3Mb7bRCkX2l6rpsB1Uummt9v18sHWGv0VjXhOiHslC1EOqxb6cFDXTQyN/5OFN1E9fWhQ0=
Received: from BN9PR03CA0514.namprd03.prod.outlook.com (2603:10b6:408:131::9)
 by MWHPR12MB1805.namprd12.prod.outlook.com (2603:10b6:300:106::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19; Thu, 23 Dec
 2021 00:37:36 +0000
Received: from BN8NAM11FT010.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:131:cafe::af) by BN9PR03CA0514.outlook.office365.com
 (2603:10b6:408:131::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.16 via Frontend
 Transport; Thu, 23 Dec 2021 00:37:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT010.mail.protection.outlook.com (10.13.177.53) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4823.18 via Frontend Transport; Thu, 23 Dec 2021 00:37:36 +0000
Received: from rajneesh-desk.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 22 Dec
 2021 18:37:35 -0600
From: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [Patch v4 20/24] drm/amdkfd: use user_gpu_id for svm ranges
Date: Wed, 22 Dec 2021 19:37:07 -0500
Message-ID: <20211223003711.13064-21-rajneesh.bhardwaj@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211223003711.13064-1-rajneesh.bhardwaj@amd.com>
References: <20211223003711.13064-1-rajneesh.bhardwaj@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2cdb39cf-9f6d-4f8a-4e42-08d9c5ac6ade
X-MS-TrafficTypeDiagnostic: MWHPR12MB1805:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB18051732827A5D095C5BFA39FE7E9@MWHPR12MB1805.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zykLHoRCovUjfgp2XvuxCOhERXFNhNBLd4LeySyDtlLpyukahQVPTPF8N1mB+jbiaE+aEPkFg5muuME0R9ze9spVfHySsXL5oN523fnCqiwWq894Smwmww+L/S8+MquNJb6XxGiWjsPoRKA06gk9V8qro1iYDw3ExnhiJ8bg3iKq0cWHUEmLQnTIisALgLqN7YYKCuMzg7Y3paqlzhex9DIX9Wjzbp6SWJXjbh93Mg5N7uHeU8dw5Kz9Ik3VvAlpXP8RiWU38wi6lRwbMmsArc6ci3uCUG3gDD2myxBAmZqyqDw/KvOS/P63HVKdRjRPfthdu3My+2axRtXmHssrC9/STy/IXd7SqanI2JgUAaZpx4FG5hCoeiI972GLRRPYnqAPk6neZfZ8mz322j0yVnJ/wCbKcLnGueHi+jOPFhcVH32l5KXjupLh6KiV1ycGf4jy1d03S0fH+PoIhhr9oMDgZjxYdpWEBB7qFnk6lY9JtALRypPhaLUMTyTHhnJ0wAyqvyeX/msmX/JVjfL+U3L8RgOCG5WsxgdXP4SfguLd8gqvSZE/r2BzFOiKQ+d3VBULQ07Gx+qth6PhmT7W/acrUNbpUI1L1xqCtw0ZMFvztRTIsHOzaFRENZeIt8DNy/g/epcn0m9n3X3eRZ3pheItJ1L3sOJ5eWnYXzQDazxSXjjMg1k+fIel7K8MsNlSkGDPZrN9LKlyevvFaIkazkxC8O0HJMp5+LG9TVFD3vBAx4K5o1gJ8kRqC+Wpo8/zB4exzKNkg/QVkdGQoJjgaozBix6RvL2iGXjkxUKvGsI=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(40470700002)(110136005)(186003)(426003)(83380400001)(44832011)(36756003)(1076003)(5660300002)(8676002)(36860700001)(81166007)(356005)(2616005)(40460700001)(4326008)(16526019)(7696005)(8936002)(47076005)(508600001)(82310400004)(54906003)(70586007)(336012)(26005)(86362001)(2906002)(70206006)(316002)(6666004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2021 00:37:36.7167 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cdb39cf-9f6d-4f8a-4e42-08d9c5ac6ade
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT010.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1805
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
Cc: daniel.vetter@ffwll.ch, felix.kuehling@amd.com,
 Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>, alexander.deucher@amd.com,
 airlied@redhat.com, christian.koenig@amd.com
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
index 67e2432098d1..0769dc655e15 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -1813,7 +1813,7 @@ int kfd_process_gpuidx_from_gpuid(struct kfd_process *p, uint32_t gpu_id)
 	int i;
 
 	for (i = 0; i < p->n_pdds; i++)
-		if (p->pdds[i] && gpu_id == p->pdds[i]->dev->id)
+		if (p->pdds[i] && gpu_id == p->pdds[i]->user_gpu_id)
 			return i;
 	return -EINVAL;
 }
@@ -1826,7 +1826,7 @@ kfd_process_gpuid_from_adev(struct kfd_process *p, struct amdgpu_device *adev,
 
 	for (i = 0; i < p->n_pdds; i++)
 		if (p->pdds[i] && p->pdds[i]->dev->adev == adev) {
-			*gpuid = p->pdds[i]->dev->id;
+			*gpuid = p->pdds[i]->user_gpu_id;
 			*gpuidx = i;
 			return 0;
 		}
-- 
2.17.1

