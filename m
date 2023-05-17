Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD4B70767D
	for <lists+dri-devel@lfdr.de>; Thu, 18 May 2023 01:36:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31A8310E301;
	Wed, 17 May 2023 23:36:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2050.outbound.protection.outlook.com [40.107.94.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAC5C10E2FD
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 23:36:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EGZfv//Nk+GAWahfEG5FaxsBd+QsZ6dAohk0MqlBeZgqAul9gWCtsEPWuk/NZMdnROrm3tVuoEOl7ITNgQVQPunjJYijcD8zuJ184IYWwhkZk+IfkLVPC9QO1GgZ59Q0ytYJVMxa56zOzuOdvZLwcYtkJXqP89ESJeCEFZpb9U4nSpBNA+r8ZA4dOEVZFMXpfzfIrmOo/GAP9b2Du7ME3P7QKyUyrNMkuOtF4RKNajsAQBEu1IhZFI5vQMRX9Yqg8ZRUiuVb/b81Peg4SHYUHMAYjF3s84JpwIrZkXx0ECPISQpBkWHeu2z/3qqDBKRP7BNfd5kls7ifS797mlri7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nFNkwrMt7ra/7tYiO9KrCGVdNId0HHkIobJUXuJg/aU=;
 b=i/LbfjyN7s+0dHzuDO+Gq/cc3jixVt7XLLdkswBUTu9K2VToQCd1DXDIu3JF7HBlyy5YsxYdDitwZYnDXvdzEqRPl+mwsIPpLX6GjFT+IeldSt1pDgszeqr7vnWHvSIE4wT1uWgHbqIA3nG1HPV2HP0p7W4T1CWw/sExyWKxhlCkMkSlKv8yogu5GMhy5swWeiu48OF1+thlrXT0s8RuIvxa+pvCRZvTpEQ6hpoYzTu6b0bfp+ibb5AlOUGBGUqXvathCN9bE6+Ok7yakP5NlIa12MS+Ei0GlQCxuPa6lPNwqK3PxEb34eXG2JG+9tTgdtoUYX+WL9jcZXcdTs6yHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nFNkwrMt7ra/7tYiO9KrCGVdNId0HHkIobJUXuJg/aU=;
 b=ogxFXQEieoID2VYF0x5cwYd7afOo39V3dU8a+nydQO57sYRGowHEDC7rg9fZ4FbSHtfbhT1DCDFxSSbQV8CIa+CAVxGdfZE69eele5SueqFJqZBZndyUgPJ0KYWk3LD007V53wTN7UtKBI9eKZ4s8xCKAUZjVY/WwaHG5ZjzDGc=
Received: from DM6PR01CA0002.prod.exchangelabs.com (2603:10b6:5:296::7) by
 SJ2PR12MB8652.namprd12.prod.outlook.com (2603:10b6:a03:53a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.17; Wed, 17 May
 2023 23:36:19 +0000
Received: from DM6NAM11FT103.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:296:cafe::7e) by DM6PR01CA0002.outlook.office365.com
 (2603:10b6:5:296::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.17 via Frontend
 Transport; Wed, 17 May 2023 23:36:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT103.mail.protection.outlook.com (10.13.172.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6411.19 via Frontend Transport; Wed, 17 May 2023 23:36:19 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 17 May
 2023 18:36:18 -0500
From: Luben Tuikov <luben.tuikov@amd.com>
To: Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/sched: Rename to drm_sched_can_queue()
Date: Wed, 17 May 2023 19:35:49 -0400
Message-ID: <20230517233550.377847-1-luben.tuikov@amd.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-check-string-leak: v1.1
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT103:EE_|SJ2PR12MB8652:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cc1e4d8-eb0c-4047-521b-08db572f8414
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LgNNE3LpG4bFc1YQlt8sdz3DpCJomD0Ao8FG1LpZUEmMRoJbZ7l5nbibSo/peSUeKMM8OS3IO48gYFRv2aPlLHSSvO1+TJQ67hVamn2jJAe9CXMWFXAY41mggWY0ORLPfLhrKt5p2KSpsacr6xl+6Cap9BkMUDThOkhANCkROZ4gq6G4h/SWxFbWHWbzs9Dukc1Zar0wVCpRyWEZWam+xjGGY5OWF9ANYEcZR2G8rtxgRH+w7BkyhYa280lTfyqi50CyN+pwb5QYJ22qXM5rV3MHgmqHhY6JebUwg8u4YndlxzsCynjn8aHxT/VQJyvskKeyCfisS/zcPPIS8+jgM4gmvmfalIdrhkN6S8xoJ3ra4kJUqocAy6XmdjVVlZI3XIb8FesOEkveCIAa3HGyF3e3VYOn7aiSa4bKmaL7Nr6T9MHxDdCd3+sX9FkS3NmDPcDQ/Qx4VcWaGxnXFIbCtsnWl35x4hDRp3uIQ17iJLa1dqCNhOAxDDlw/fqugrTbIkT/1BW3FbGbrjEr2LRyUfWNe1xgD56POb92ZP1NqHjp2Xjc+k7GoOUC+yLw4rJowRtxu+PB09QEv7mVs4CD1kPoGk4lpUwwKuU5n9eyL749/rWhviJpa1OVzEU2XiwwULt/6L9QbvYyiQ/jaRqwvsIaHTwJ9iDl8DbNlimthlHcp93U2KMCa7giVCvCVYWvgb/rwHab65SGnMEJTRNk9hquoyB9hEUJcaK1rveS3fqV/Ta0Zxg8Y8l59FIvrqIHNsmZs94gb7sge9CDctdU9A==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(376002)(136003)(396003)(346002)(451199021)(36840700001)(46966006)(40470700004)(82310400005)(16526019)(186003)(2906002)(40460700003)(86362001)(1076003)(26005)(83380400001)(40480700001)(2616005)(336012)(426003)(36860700001)(36756003)(47076005)(81166007)(66574015)(356005)(82740400003)(6666004)(41300700001)(70206006)(4326008)(70586007)(316002)(6916009)(54906003)(478600001)(44832011)(5660300002)(8676002)(8936002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2023 23:36:19.3279 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cc1e4d8-eb0c-4047-521b-08db572f8414
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT103.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8652
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
Reviewed-by: Alex Deucher <Alexander.Deucher@amd.com>
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

