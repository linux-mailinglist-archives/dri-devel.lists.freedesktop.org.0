Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98581707172
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 21:04:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 933EC10E14C;
	Wed, 17 May 2023 19:04:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::61e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5AE410E09D
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 19:04:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CAPsY7gaEzd2w6y63yke8zB1ZGEgiJ43Af0DSIpjtpOtmrqVIKaqxfx4sq/9jAhSSwQCbd/e7ov0Mjsql0S3dNNGEdLlYhTWwflS5ywX6G2n3TjO0Hh7eTwpzcRLHo/IerYmwIGteV6QiuOHI+43GSpLoLu6xijJ2E7iKJ8CpAPmXACuDhu/n/P1NowbslusVj0h3RYHmJ85lz1ZCDS+RCziD9I1lv3Rv5HHsL1Nd6R74lNxLUWQf5rlhu5aW+s9rpZFDL6KtVXic74SQm1DxdTYvp/Yt+hh7n0A0iTfoxyGYsrZGQ/zHvABjLhYfctmwmMiHAejWRu1Aq5zwV4Prw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=diF4LgW/8LodauYslvxmdT6GWQJRKB7EZL5fEhOKNnU=;
 b=nR+HWMBoBainY1rWXnwgiBXJcAwIPbDAIkUs2AGD/fCGwQD1jRdTjSUP/tPuN92jUyuqe2qqqwHzDNtNQQzifrOKRZxl/k4X3OipPvqqPFaveYUCpn7IYOXHX9gVgi6IFn6oVn0Wpw+Bg8vtEKEGa3a812yQefCbivTPqtXADkuWIqFO+HGzVXzuejZ0DJN29pEGf8APMNajtcaP/yzPm9+7lpaAoNs4pHHzawD7XxyQ+wyzmlp7GzICpfGuTFOngqHdtBkV9FziTtGXhrZUZsSJlnyt8oQwIA0BEdv+Sg2SslEAayVNeewKv60lBWWsd4Np+5kI+Z4Y2kvGfR1kLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=diF4LgW/8LodauYslvxmdT6GWQJRKB7EZL5fEhOKNnU=;
 b=oGzg00LRr9qLjvAXU61y4jdWVLgWok+50agoipiWLTC/ZOkkq+TZh2SaS5tY7odZrdq9w1fnvoykIu5/gmniBhPfMlt19Y/j+rmETXXCHt21egTY7JCBMxqWRYYARkbF+8tFkqt3oOyXwId9wgwll7/UKEMDPN64P/naVRrS8Y0=
Received: from MW4P221CA0007.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::12)
 by DM4PR12MB5328.namprd12.prod.outlook.com (2603:10b6:5:39f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33; Wed, 17 May
 2023 19:04:38 +0000
Received: from CO1NAM11FT025.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8b:cafe::c0) by MW4P221CA0007.outlook.office365.com
 (2603:10b6:303:8b::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.18 via Frontend
 Transport; Wed, 17 May 2023 19:04:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT025.mail.protection.outlook.com (10.13.175.232) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6411.18 via Frontend Transport; Wed, 17 May 2023 19:04:37 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 17 May
 2023 14:04:34 -0500
From: Luben Tuikov <luben.tuikov@amd.com>
To: Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/sched: Rename to drm_sched_can_queue()
Date: Wed, 17 May 2023 15:03:54 -0400
Message-ID: <20230517190356.349044-1-luben.tuikov@amd.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-check-string-leak: v1.1
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT025:EE_|DM4PR12MB5328:EE_
X-MS-Office365-Filtering-Correlation-Id: a16aeb07-8793-41c6-34fc-08db57098fb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gurYYU8nmsspqoyRMRDv23sxhQOvVTOHcXIuDzuhl6EysrLG77MwCMf8lK4rj3OKptmiFKt8Kf7zP+FlomqCvbHw9YXTjnuOdOnqUDs5pwrK/DD22OXkIZyWFD9BhdJE37AVFrvF9PQh0Ejy4sNtagROGbiJf7prXUJEj2/7NUAvTlW9Ln+wzUy44KFOiWnrGp/d/kjj74crPdySE50cG/QcIOYxI6/LmcJb0mFvIHELDaTuxiRIBeAr3suKvVDGfAq12bzCpN/zQWunuSw013HelpZJZ5CUpe4eBH+KrAFvzCqJj2pOX7Vl+yioF6W7JO+4grFeLwSc+U2yU6MWkpKscjytaVCsL8m9W5zY1MjukWouY7JIZzcnyJzB3AXl2CCUKzxGLKO9ybCRTVCSvqW3wMqOI+YlDoSq/zimKLCKiN+8ViKV8mhLtVn1X532iGuVCJ4A8ggHYu3ijSjeZbhFcrAzzmuGbrvPVoJYdpYm6jGwMBUB7P4Tf/1myz6Icv0jfKNQGKWLuFPIxiTBdh8HiBV/ZZE/jCFJtd2yg8nzF81DLE0GCYqCgEXIrdTgh+oIDRyDMqIbZHLayKr1Sz8rFENqxT9QQyUkNH+mB2DVY1kDQ+tHHxNwhZci/P2MIEXl7lQgY3aJk18U8W3NMA0+jVnxd7AhPEWGccXViwIF10NtblJnQ0bETPNpqTdmqG7zGoCWInhj62T4CU/JwvY9/5GHbrzzI11ckRKKzE6J9ZXyDlLRRZK1GoIchmsWY993LnOqpqRY2Uy70EOXrw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(346002)(39860400002)(136003)(396003)(451199021)(36840700001)(46966006)(40470700004)(5660300002)(40460700003)(44832011)(41300700001)(36756003)(83380400001)(66574015)(36860700001)(336012)(2906002)(426003)(2616005)(47076005)(86362001)(81166007)(82310400005)(82740400003)(356005)(186003)(26005)(1076003)(8936002)(8676002)(40480700001)(6666004)(16526019)(70586007)(478600001)(70206006)(54906003)(4326008)(316002)(6916009)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2023 19:04:37.8506 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a16aeb07-8793-41c6-34fc-08db57098fb0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT025.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5328
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
Cc: Alex Deucher <Alexander.Deucher@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rename drm_sched_ready() to drm_sched_can_queue(). "ready" can mean many
things and is thus meaningless in this context. Instead, rename to a name
which precisely conveys what is being checked.

Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <Alexander.Deucher@amd.com>
Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 172e63c87bfcf3..8739322c30321b 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -848,13 +848,12 @@ void drm_sched_job_cleanup(struct drm_sched_job *job)
 EXPORT_SYMBOL(drm_sched_job_cleanup);
 
 /**
- * drm_sched_ready - is the scheduler ready
- *
+ * drm_sched_can_queue -- Can we queue more to the hardware?
  * @sched: scheduler instance
  *
  * Return true if we can push more jobs to the hw, otherwise false.
  */
-static bool drm_sched_ready(struct drm_gpu_scheduler *sched)
+static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
 {
 	return atomic_read(&sched->hw_rq_count) <
 		sched->hw_submission_limit;
@@ -868,7 +867,7 @@ static bool drm_sched_ready(struct drm_gpu_scheduler *sched)
  */
 void drm_sched_wakeup(struct drm_gpu_scheduler *sched)
 {
-	if (drm_sched_ready(sched))
+	if (drm_sched_can_queue(sched))
 		wake_up_interruptible(&sched->wake_up_worker);
 }
 
@@ -885,7 +884,7 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
 	struct drm_sched_entity *entity;
 	int i;
 
-	if (!drm_sched_ready(sched))
+	if (!drm_sched_can_queue(sched))
 		return NULL;
 
 	/* Kernel run queue has higher priority than normal run queue*/

base-commit: f47d6140b7a4c858d82d263e7577ff6fb5279a9c
-- 
2.40.1

