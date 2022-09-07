Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA6C5B0EB3
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 22:57:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B9AB10E88D;
	Wed,  7 Sep 2022 20:57:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2075.outbound.protection.outlook.com [40.107.92.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CFB010E885;
 Wed,  7 Sep 2022 20:57:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CLBA+VoFmpSIevPKR5rQ+A59D3DjOgSG7HmSNS3wQGL00teEJGs0z5s7rBXvCoI7eiNaL3NL4W0Ih/3vKOYUeRId96JjBfnZSdnIfVOgGWpIYX3Lbx+SNR39QM1Hk/l6Aoh3jwnDoiAmMWlfdhYabOfqk7t7XBQuJPRMqk92fXNcZsvIGyyChPqh1EzpWX4azHS9r6h/oM9AgwOtpf/mwhkNeQvzd/xVTMxCIprW0TJZa4vZYWSQngZKjLvg0c2PTIVsEN3WqxiLWWSemkpcabNXJilAQn+AOrGOfJWI3aLobHKK0K4QEXaBPVFD5kmi7nV/nbnx5wUw2ror371pJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q3gpTIwv0LDi33/i5+y9kR9HQgBXprM7D4lLGDF7dF8=;
 b=fYuQtQT5T6nImvBzy0BAyNztM2WZySr2wCND9jUQ0IiS9BsvAPZOTCFWqbNQCO5XauXi7l+wLffd4u0a5js+jY6kBYYRSLIi/YeGNFNSI+4I3zFXidHuTHPUslwltKc35WmUrZO9yKLx9HF7vO8ymtoVr/LMVO7cBeRdwUuizis/ZZ2SEfA5u8q16zpglKxUhaZHTZHTq1SUf7Ss2ruw6bYUm27pe16jkmCM1UO7TtjcWREhVWfsWg2hemYtA1frFuwWWEMl0I6IwlTY9v2sUC1Ym/CPGQfu042gNEuQLzMNpLANAt8vxFcJ45OmSSip1VF5qRdyJjuW5G797f66uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q3gpTIwv0LDi33/i5+y9kR9HQgBXprM7D4lLGDF7dF8=;
 b=B/0gnw9sYo4sD+niCgUC1fLcoUcpPghhSbbCtZvo5fCtdVw7fVDLyCc0L8VsSewmnY/JbFHHrC/jF/qEemwJAtHsJGuv6SgJ+ZBSZrK/3W+QQ1dnf+TqgID3evqxlT7VkUqolp1iW5TyZop70mqmDw5znaG00kOsRkFalRHNEb4=
Received: from BN7PR02CA0035.namprd02.prod.outlook.com (2603:10b6:408:20::48)
 by IA1PR12MB6529.namprd12.prod.outlook.com (2603:10b6:208:3a6::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Wed, 7 Sep
 2022 20:57:30 +0000
Received: from BN8NAM11FT049.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:20:cafe::71) by BN7PR02CA0035.outlook.office365.com
 (2603:10b6:408:20::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14 via Frontend
 Transport; Wed, 7 Sep 2022 20:57:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT049.mail.protection.outlook.com (10.13.177.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5612.13 via Frontend Transport; Wed, 7 Sep 2022 20:57:30 +0000
Received: from jz-tester.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 7 Sep
 2022 15:57:29 -0500
From: James Zhu <James.Zhu@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/4] drm/sched: returns struct drm_gpu_scheduler ** for
 drm_sched_pick_best
Date: Wed, 7 Sep 2022 16:57:02 -0400
Message-ID: <20220907205705.934688-1-James.Zhu@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT049:EE_|IA1PR12MB6529:EE_
X-MS-Office365-Filtering-Correlation-Id: df14cd3c-ed4f-4385-e9e9-08da91139460
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Qy8rRjtMd5byvuc0b8b5Gaqmtx9L0LPH0MV2pCKp3UDBZua6NTWen0Jll95Hi038b/V1PXBy9cY1rOkyrKsdofHt1jILfMGBTr545LeAzwnpHvYUdZZB4aiay4gJ4/zUUI3Z3xVq8i0qKMl86JjX5VBXUhb++NQ9i8HTsQMd7fIwzZsvSlasyKu4nJbEwbHWi2R3EFUQJav71ByJKyP5I0FXL/Oz5lGRf6IN8h2icTbrGaB8l2CmIf6HYO8rs6Zk0Jhp3jLicNssZd86JBWzZ1tm5BAhfIvKmp1zsxKv1CA03Y+6J8Kk9jC/YC3CfIrnb5WAYeRWqjagz81HeG6JGZrpQSey6pryHQSO2a7WAlYFsqUdLrrg7amDgwtOlNaItol4rq+eAFEfOkPxeXOn+LwN/TcWNPM6v4FXItvlHPVQbb7P5L3AtgLvCBzxsQ+GWlXaH64NupOeBdGgGMuFs9T87I/ctLtoYyL92t+rpUje7ahOIPushZ3Kee58KvHkK5p4ujuLrsfXDl4DyYTTZ0Vj6Eir8LHn9JmxZQws+EY1nl+DtdXDuxi3+myF32ZzqOUI38BqO/PicowzyA37s6F4tRjhZaoamPmgs0yuIGFkapVizrG9nn9qSysNWpLPSSooJjYaQq+Xfqyl4t97cRuBllPAsriURjwtyI7w6Dr+bXd6gzC4h2HbOSzz4Zn0aMS/XKYFW0nsKEyce6hSfRfreizTPhM7lmZ1r0nG6NWt1vg5X7NPj78+SPFWOdzWGOPPqMyPH7CgBGr2joTQJ8HMDA5xxDyEZOPcJD5pVv7LK0XNz7Gp2uCbrtbJQoMB
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(136003)(39860400002)(376002)(346002)(36840700001)(46966006)(40470700004)(426003)(40460700003)(110136005)(4326008)(316002)(54906003)(7696005)(41300700001)(6666004)(70206006)(70586007)(2906002)(4744005)(5660300002)(8676002)(450100002)(40480700001)(26005)(478600001)(82740400003)(81166007)(336012)(8936002)(82310400005)(356005)(86362001)(36756003)(83380400001)(2616005)(1076003)(16526019)(36860700001)(186003)(47076005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 20:57:30.5194 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df14cd3c-ed4f-4385-e9e9-08da91139460
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT049.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6529
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
Cc: alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_sched_pick_best returns struct drm_gpu_scheduler ** instead of
struct drm_gpu_scheduler *

Signed-off-by: James Zhu <James.Zhu@amd.com>
---
 include/drm/gpu_scheduler.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 0fca8f38bee4..011f70a43397 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -529,7 +529,7 @@ void drm_sched_fence_finished(struct drm_sched_fence *fence);
 unsigned long drm_sched_suspend_timeout(struct drm_gpu_scheduler *sched);
 void drm_sched_resume_timeout(struct drm_gpu_scheduler *sched,
 		                unsigned long remaining);
-struct drm_gpu_scheduler *
+struct drm_gpu_scheduler **
 drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
 		     unsigned int num_sched_list);
 
-- 
2.25.1

