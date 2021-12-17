Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A89747971E
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 23:28:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55C5910E65E;
	Fri, 17 Dec 2021 22:28:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2086.outbound.protection.outlook.com [40.107.244.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9785010E59F;
 Fri, 17 Dec 2021 22:28:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WGiATl5mHgUo2Za1GRGrM++mFBAaJIWZjIs4eQ/WOuNNagY1m/i3NGHAyVo+D8o6Wa3Fi7qxSQOH46s1m1JVY1L+8PuS9wQjhsjbhgL9saZzlYGH0RpW3UHjOsmJAWggHqfIoiTiqU09A3OPAxLUeNg60EvlCYqDxjOc7Za6dUgaACncpR5MOOpQXOPn+bv9+U2U9r+x9ZSuuqlN3OtBJxue8f39SHppz7LmsKGdjjQ9LsV1jK5s7g3ZKojzN+T2fLQsQWnSpuNrZuR5i4vs6tswAfn/rPjb2nPXPfAnds7g7EcorrcLUC+UgwwsQewFWXwpUiPLskscX149UpsZqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+4/2uRIx9zwn9X49l80cVOBWoM5CWkrEJhA6a+OVWwM=;
 b=RwWYd00BwliXD4ahVzaDUK2zXM69J8Vr+SGo6XnR59W8wR/8Lq90zLfsCBwBpgOm6HJ1eooeGQFG2ECFdDbAKN5SEGr7mAGR/qquroXp5xQKdtzWAOpZlhfj9P0kvABlPDRE1ZHIvvPIeiSF+qUzDUEO6HbcoYvPmf3bl1UEV1bWk+wvazTtF+SkkKqPdVLbDnf/y52nLeZvL0fhAqJX9c54T48ITeVOiHOcIbgVCkkqq+m/sjOzwQOV+SZVr1hyjw6IYxKeKw4kBh6betq+KuQ8mVVqKcy6zradAfg0nfiKowA5j6ehYdvthOmA11XhzVC0xTVJacYttBpo83AP2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+4/2uRIx9zwn9X49l80cVOBWoM5CWkrEJhA6a+OVWwM=;
 b=sPNXBtrLCVjb2pLq6YeNhDQjgCDyXOhXot84tFVbXJZKZMp4ccDcBAUduKR/OoUvWY0er4DEmUNgq/xvijk7AKyeODVnbHHFa9NBAkfmBQtNabmYiU54AfyLHBuQZ7PTmp59gcnOlyc0Z1sZPOfw/bxHJp7YHLoaCE0QeV0+heE=
Received: from BN8PR04CA0031.namprd04.prod.outlook.com (2603:10b6:408:70::44)
 by BYAPR12MB3349.namprd12.prod.outlook.com (2603:10b6:a03:ac::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Fri, 17 Dec
 2021 22:28:13 +0000
Received: from BN8NAM11FT051.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:70:cafe::5d) by BN8PR04CA0031.outlook.office365.com
 (2603:10b6:408:70::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.16 via Frontend
 Transport; Fri, 17 Dec 2021 22:28:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT051.mail.protection.outlook.com (10.13.177.66) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4801.14 via Frontend Transport; Fri, 17 Dec 2021 22:28:12 +0000
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 17 Dec 2021 16:28:11 -0600
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [RFC 3/6] drm/amdgpu: Fix crash on modprobe
Date: Fri, 17 Dec 2021 17:27:42 -0500
Message-ID: <20211217222745.881637-4-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211217222745.881637-1-andrey.grodzovsky@amd.com>
References: <20211217222745.881637-1-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aace3870-462e-4566-43b4-08d9c1ac8342
X-MS-TrafficTypeDiagnostic: BYAPR12MB3349:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB334940F1ABED3AED8D396387EA789@BYAPR12MB3349.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z1FC7QRN+dh9oW5hoPf1zMQQZQF0NcoZ8QEj3omKD0+D9CgaS2/Yfg2tC8ggvM4sOMyA9h1p7sQJ02BZJf2Pjka4bir8qrEt3a8hibXY0IDFg7iu12wNW4OPBmr01lVWQNCKrH/AYJ1c/fYZtErz3iZ1AJtDQVEQ7uK0YmMluWM0/lzfKqEd1RhUQr2uzlN1YbYZsXZY4U80RPMRDwO96FESmtFY/cn4jDT+Dds+fV4sPm0SyT4sq9Byc/PVS5Dpqw/y/NjOsLHTuzp4ri3EHADdW6zURPvm5MpxBJ76acR32nr1zhfWivHRHE4JX1H3u/oQf2obkXb77XOyVxkKrWLphltU8wMk4ONTnxdh232gvv+ePqjuIGp5G30AEysHjKwCx9DV7rc71ozg7zZeybN7hcavQdrcd+80ypVhM4WctalTlo49sYXMrM7G70rOQcjWYyPZbIHnblp39ts9BZHNO4+d6YtVCIlICm7pZxeI8653HfQPJtib2DRGFmetv/EugE0abVm2ztlenFDJkVb4n6ReUf/Xm3foQ9Z+wd0s5lyzm39uRxLmR/KGwFRFd1dpzn4rVWLhDw5+qoDsSCYdbaNNRt6oEq7YXkFMS2LzK7HxQtC2Sd2ZH0mG6m+/0z+dBvrQMBNKlnlHeYJFzLP4EiUiVZPeXTr8YlWU5H512WuSNS8xR41oCXFAdGLy8MgChcaweSdbZuEuPN9UE6pgFEcJlVQKUwIUsPBU7tYRsUDxAP5oN88X3XINUMKX1kvp6Dv/xKfxl6UXI1rOT2kN8foFK8rsRR1Z81jzWDA=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(40470700001)(36756003)(508600001)(44832011)(8676002)(426003)(54906003)(26005)(47076005)(7696005)(2616005)(36860700001)(336012)(110136005)(6666004)(1076003)(2906002)(4326008)(356005)(5660300002)(316002)(4744005)(8936002)(70586007)(83380400001)(16526019)(186003)(81166007)(40460700001)(70206006)(86362001)(82310400004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2021 22:28:12.9735 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aace3870-462e-4566-43b4-08d9c1ac8342
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT051.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3349
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
Cc: Monk.Liu@amd.com, horace.chen@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Restrict jobs resubmission to suspend case
only since schedulers not initialised yet on
probe.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
index 5527c68c51de..8ebd954e06c6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
@@ -582,7 +582,7 @@ void amdgpu_fence_driver_hw_init(struct amdgpu_device *adev)
 		if (!ring || !ring->fence_drv.initialized)
 			continue;
 
-		if (!ring->no_scheduler) {
+		if (adev->in_suspend && !ring->no_scheduler) {
 			drm_sched_resubmit_jobs(&ring->sched);
 			drm_sched_start(&ring->sched, true);
 		}
-- 
2.25.1

