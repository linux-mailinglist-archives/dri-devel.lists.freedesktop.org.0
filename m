Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8DA55A086
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 20:10:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83E5310F1BE;
	Fri, 24 Jun 2022 18:10:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2086.outbound.protection.outlook.com [40.107.92.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AF4210F1B6;
 Fri, 24 Jun 2022 18:10:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yg/uCgltju1Z8AuPvVI8J5opoMMc+LcZqouYxSTAEC1LkbseFh4LGOlczgQdyXllwM5x+Slg3z4gTMcQA2X3FwQhZoKHY0mCDlrdXAkzr8O1NhJzQnAPj8T1uFGP+DxmPRrOKMnT2tzpgMCSd0zNq2EiM5TUVqOKYsMS4x4E7Dz5YGg9n0DCvJxN89unk1T3tZ3mc+d0s4BhcEP50IMx50v2x1d4KFA9RiC3VhgxPP4ukDiUhcE3wHbSZgHmmG/+pfXvzOMs0qvZQyyQqAUqjadDjw8pUgnmz3BUThBLekW/j0YSfL4I5BAes63o5ux/nqYoetgQgP+B8+1dwi3/rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IS7b7YFR3zO3PI1GI7F3S2dpIkhq4tGGv5U5R5IjGrc=;
 b=UglbZCihJoAk4H2ofEw0kSE1BwDBq775sqG7D1edMfSdYTPlDoYYoZBv8N9Wh7zSK1Gc6fxlLhOZvdiwNOeilib8Hyp7TuySY1eIUnryoiLgUL4vh9qUOnobpNKI/4DvzdZ92Q00vzAzoEKrilF7f1eyWpITP/qLaNgHDcydGCkpjLRz71tHP5+jRcYlUqRnq9Ua0nac6/8uFtc0W3XsSsrgJ0mOvu1zOsAyfFu/EIZNC3SXQVxj/MvaOa4GJstPcAkQGDjLxffjB16pP5vJWpHIKTSfiQ9MyjjmJ88H9BU3WBQuEL+4C9cWsyZ8uHoS7BVbasXzlLTA2U8FI65Y9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IS7b7YFR3zO3PI1GI7F3S2dpIkhq4tGGv5U5R5IjGrc=;
 b=5jRdTVLBfq0njeGHn/K+HA8QaF2D0Qz8bXvMLEbAFXWtNO/9PjFqXfd7M00Mbfxy/FKhevNGLm0IQgkYUdP2fWX7YX97fwHLxcwmzibSCKWjRrBHMF+Qf4kKF81HFwddv96RpGiY21FKu+WTveya6NmYtDzh3jktti1XF4iufRM=
Received: from MWHPR04CA0069.namprd04.prod.outlook.com (2603:10b6:300:6c::31)
 by BYAPR12MB3383.namprd12.prod.outlook.com (2603:10b6:a03:dc::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.17; Fri, 24 Jun
 2022 18:10:10 +0000
Received: from CO1NAM11FT058.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:6c:cafe::a1) by MWHPR04CA0069.outlook.office365.com
 (2603:10b6:300:6c::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.15 via Frontend
 Transport; Fri, 24 Jun 2022 18:10:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT058.mail.protection.outlook.com (10.13.174.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5373.15 via Frontend Transport; Fri, 24 Jun 2022 18:10:09 +0000
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Fri, 24 Jun 2022 13:10:08 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 1/4] drm/amdgpu: Add put fence in
 amdgpu_fence_driver_clear_job_fences
Date: Fri, 24 Jun 2022 14:09:52 -0400
Message-ID: <20220624180955.485440-2-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220624180955.485440-1-andrey.grodzovsky@amd.com>
References: <20220624180955.485440-1-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 315f1713-0614-4e32-8119-08da560cc6dd
X-MS-TrafficTypeDiagnostic: BYAPR12MB3383:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9Fw8SiB4ehhUNqUs7bsieCxYZYzrRn3E7TFIzNtmAm6+eymL/1FoipGUFlQ13GHXBSYymRGJPpoLmawHrb9dUJtk5zSkkVhtECGpOG3CSWPoULr+x+QZU1tMIu/uQeNQmLXOp29UE5KG12Te4HM6+S2c58JF4v0wGBcS/4t3BsUQduHcHwpnznwTJDyOHICi/FOUlCzgGCJQmIgIWLVK3D+SLeI7F0KW3Y94XujjGc5OAXpb0M4rUnbMVCyaiI03BM76yhNQsPE1OiNuMpYSCDfE67WfzMMr8w67ly46j8460ObsOPt7JgHbj9/299Svzn3GwbwIkSSjeUk0LNuMlMQAaoGMJzwoGm+TGqs/k2JxaXd7mtvv+KGOhMhoevgPB3Uhni6IeXbg6SB3j0tb4m4YMz9smxjBzRbtbSsXamIPKxtTR/3UisGchnxY9yF6PXtMEWSyYI78nDrlSNrEDbGfmYy3Zl+HFhUYbo+rat0MqCG3vGCBgTqKWpJ2BHzxj+HXo5ZWBG2lLq3IyzeW766+SXwG9sCNz6Qk3cB3f6PIWWzbqmH6b6ajVwYqFNyEg+pKItVWvh187HSSjuP5NZksVhyQiWFVHfFAIJQ908S9XVjwRB66WRzFR31w3s2sYbHDI91n/6OwK6hJPUPQyyj7klQ3RC7Owig3Dv+PXKGsdEG0DRuN9Ra0jtmYeqTAm5Blt/1Fciql81QCOKALP+/h6OJ4yernx6j3n27NwPN2eoD5Jww0CHnamOwUbmHGymVWoRL/iu0X4cCnEfeveopCngCKIuy87bn1GYuTtPKplZWQHO8toaVt0utOBnndEr2WZqs0vrPB1sRJehgcjw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(39860400002)(136003)(396003)(376002)(40470700004)(46966006)(36840700001)(40460700003)(5660300002)(4744005)(82310400005)(478600001)(356005)(336012)(66574015)(86362001)(44832011)(41300700001)(2906002)(7696005)(54906003)(81166007)(26005)(8676002)(40480700001)(82740400003)(1076003)(36860700001)(450100002)(8936002)(16526019)(426003)(186003)(2616005)(70586007)(70206006)(110136005)(83380400001)(6666004)(316002)(4326008)(36756003)(47076005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2022 18:10:09.9535 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 315f1713-0614-4e32-8119-08da560cc6dd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT058.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3383
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
Cc: jingwen.chen2@amd.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 monk.liu@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This function should drop the fence refcount when it extracts the
fence from the fence array, just as it's done in amdgpu_fence_process.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
index 957437a5558c..a9ae3beaa1d3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
@@ -595,8 +595,10 @@ void amdgpu_fence_driver_clear_job_fences(struct amdgpu_ring *ring)
 	for (i = 0; i <= ring->fence_drv.num_fences_mask; i++) {
 		ptr = &ring->fence_drv.fences[i];
 		old = rcu_dereference_protected(*ptr, 1);
-		if (old && old->ops == &amdgpu_job_fence_ops)
+		if (old && old->ops == &amdgpu_job_fence_ops) {
 			RCU_INIT_POINTER(*ptr, NULL);
+			dma_fence_put(old);
+		}
 	}
 }
 
-- 
2.25.1

