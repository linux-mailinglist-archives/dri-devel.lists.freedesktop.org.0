Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA536FDFBA
	for <lists+dri-devel@lfdr.de>; Wed, 10 May 2023 16:14:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 398E710E4A1;
	Wed, 10 May 2023 14:14:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2084.outbound.protection.outlook.com [40.107.92.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3656D10E49D;
 Wed, 10 May 2023 14:14:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FviK0Mo5Cy3XOjM2eKkHG8sUN9WLvqTrvV1ExFdT2n4bYMIJoOuG9NMvvGQZ8GLymDIp6TlJiF3vr3/mPHlcAqxi8j/cdZn2kDcKlvFXqgv7/YWZ8Y65mAlFj1Bv5CxIrVJ2/fFkxSzQsZtImJ3tRTRAkVyToa8Y+YSpXOki3fsn8djhxhSZ4NkBaQQ8Sc0/f7QAfFpbkE8XPEWO/Px4CIKVKiBsgnvS3MRi53IQrFkzw4FfsG3T84lMBHDsO+/gee5kdN1xKB/ot8QRchWojPreDptvKwrxxLglAkWJHigfl/PZKcwYQ97e93riPOJC/jgrYp9T+wHjG6isAZE83w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UGix8vX3McA0cf8I6qO4FkJP7si891v63HHV8q8xqEE=;
 b=QZ8FGtR573GiRPX0/7f+NxaYpemLgItZs0KIjYO6ujJiQGTj8QgzBs9lpxBhSuyYMpdVcV42AbPOZDgLEzYfB5Xu7/6KmkMgxSxf99gDvJAa4Pm5a5N5yRjBCZdxBPg2IHo4ZfQAEOOCP0pkILy9nUjaLGVFUQFCsG1v0EkvKO5E+vgK3J7gOXnCC6vjn1DAlP4CgKyFfgKL0ar5ZkKxmcfFbi1j5QS8Ki9J0JtJA49kKvhq1CG7FUhePpowEC9Qox/D6SBz0sbE94U75ovhBWMBSOCVrWYhGVDzY9IYNRGJGTTg5Oh8/AtL8BGT6WeataU6WwhrkcIrh0vGuosGjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UGix8vX3McA0cf8I6qO4FkJP7si891v63HHV8q8xqEE=;
 b=pHeCym9czwxi2TiRUwY0fv8FY48TInawY1WLocDnq9cvsUW7WrDamrnkvkayuFYvekgo9IhHgF0PmuDpqppNpprCgAQetC8SLgWc7fO7M2CFm4i5MSnMpJJBEZOBTJQJSuer4oG6a+3MeeAIY1MLntxFnUKpLsGuLrRd/Es6ZIM=
Received: from BN8PR15CA0026.namprd15.prod.outlook.com (2603:10b6:408:c0::39)
 by DM4PR12MB8522.namprd12.prod.outlook.com (2603:10b6:8:18f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.19; Wed, 10 May
 2023 14:14:24 +0000
Received: from BL02EPF0000EE3F.namprd05.prod.outlook.com
 (2603:10b6:408:c0:cafe::c) by BN8PR15CA0026.outlook.office365.com
 (2603:10b6:408:c0::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.20 via Frontend
 Transport; Wed, 10 May 2023 14:14:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0000EE3F.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6387.21 via Frontend Transport; Wed, 10 May 2023 14:14:24 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 10 May
 2023 09:14:23 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 10 May
 2023 07:14:23 -0700
Received: from desktop-host.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 10 May 2023 09:14:23 -0500
From: <vitaly.prosyak@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <christian.koenig@amd.com>, <alexander.deucher@amd.com>
Subject: [PATCH] drm/sched: Check scheduler work queue before calling timeout
 handling
Date: Wed, 10 May 2023 10:14:20 -0400
Message-ID: <20230510141420.69186-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0000EE3F:EE_|DM4PR12MB8522:EE_
X-MS-Office365-Filtering-Correlation-Id: f758f453-faa9-469b-270b-08db5160db68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZAcfNDAQVG4NO8NCDGc6eNBM3865BWKbxHAgySH9wZXEcpW1nyN33IzogWdWDzlBSUXqpWm61/RXLdn1jfrAl4fUHOT+P6PO2qd4tOxTABYEj2gkG4tUa3CoyAxnK95vFLg/VpOHdotUtYwQGHTStF4jjHurRdq3PDmYrIZcfzTmODZVYal2YgbPKs16eFPtjPWpd7ons0Dtou/1HeEAiQa9nEYKjrC72T195zTuxO0Pa4tBoMZreBb6B2qzhQzug/A2j1n8+eUUKg+V5w/4vyve2xCowz+e6/x28BaIxTTCmMF7+lBB+DutGmq8uxASa9r04jSe4Ki2bd6xMJrTh9mrrHJizUyVYIzyFdkOnb5UzBW5veolXq7kIQcRCbjDWoa7SzZahJEgtLUnB145tUzjonnafeJPaFhvN1MmHP+GIdfLBfUvsyhNBxQ/67IJKzvc6LVr+RCqMNIoG5WFpEQTxpZn+hIR+qYHQ2YZGpiVIshhY4q5BmtX/NIcdN7fU7RTDCjEuWZZFltr+6RQyFN03YmEpjWctuqCXNIFPOopyfjD6pSR8rORrE8xrXZJx0nGZY12I/+ecjxs45GCJ9llfK9jHpzDBX3hlsjFSbyHI7b2nf1x51z9N/LJCgMSMKyfqUVH9x15N5vv/HzrzhhXAfz5Xd5Cidw6Ydz2vScGOuFkvgVcM9mBYIhmOVd/X4twKDFC3IJWzJyTDR2PGlR3CGeDGLIqT8WisM8x+Tpn1InZQB1TCCevUl18KkoN1AHYgpwnwWStolyqVeow5w==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(39860400002)(396003)(376002)(136003)(451199021)(40470700004)(36840700001)(46966006)(82310400005)(81166007)(1076003)(186003)(26005)(426003)(2616005)(47076005)(83380400001)(36860700001)(40480700001)(336012)(36756003)(40460700003)(7696005)(356005)(70586007)(70206006)(450100002)(316002)(2876002)(2906002)(6636002)(4326008)(5660300002)(41300700001)(8936002)(8676002)(86362001)(82740400003)(110136005)(478600001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2023 14:14:24.2334 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f758f453-faa9-469b-270b-08db5160db68
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0000EE3F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8522
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
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

During an IGT GPU reset test we see again oops despite of
commit 0c8c901aaaebc9 (drm/sched: Check scheduler ready before calling
timeout handling).

It uses ready condition whether to call drm_sched_fault which unwind
the TDR leads to GPU reset.
However it looks the ready condition is overloaded with other meanings,
for example, for the following stack is related GPU reset :

0  gfx_v9_0_cp_gfx_start
1  gfx_v9_0_cp_gfx_resume
2  gfx_v9_0_cp_resume
3  gfx_v9_0_hw_init
4  gfx_v9_0_resume
5  amdgpu_device_ip_resume_phase2

does the following:
	/* start the ring */
	gfx_v9_0_cp_gfx_start(adev);
	ring->sched.ready = true;

The same approach is for other ASICs as well :
gfx_v8_0_cp_gfx_resume
gfx_v10_0_kiq_resume, etc...

As a result, our GPU reset test causes GPU fault which calls unconditionally gfx_v9_0_fault
and then drm_sched_fault. However now it depends on whether the interrupt service routine
drm_sched_fault is executed after gfx_v9_0_cp_gfx_start is completed which sets the ready
field of the scheduler to true even  for uninitialized schedulers and causes oops vs
no fault or when ISR  drm_sched_fault is completed prior  gfx_v9_0_cp_gfx_start and
NULL pointer dereference does not occur.

Use the field timeout_wq  to prevent oops for uninitialized schedulers.
The field could be initialized by the work queue of resetting the domain.

Fixes: 0c8c901aaaebc9 ("drm/sched: Check scheduler ready before calling timeout handling")

v1: Corrections to commit message (Luben)
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 649fac2e1ccb..670b7997f389 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -308,7 +308,7 @@ static void drm_sched_start_timeout(struct drm_gpu_scheduler *sched)
  */
 void drm_sched_fault(struct drm_gpu_scheduler *sched)
 {
-	if (sched->ready)
+	if (sched->timeout_wq)
 		mod_delayed_work(sched->timeout_wq, &sched->work_tdr, 0);
 }
 EXPORT_SYMBOL(drm_sched_fault);
-- 
2.25.1

