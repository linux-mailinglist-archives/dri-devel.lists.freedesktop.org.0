Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB6F6FDF2C
	for <lists+dri-devel@lfdr.de>; Wed, 10 May 2023 15:51:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEECC10E497;
	Wed, 10 May 2023 13:51:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20611.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::611])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56BDD10E495;
 Wed, 10 May 2023 13:51:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k9OWUdlVTg+s6wMlaHTzgERo0GnWonT7ksie83Wua/xnDcH84s3YQOq8tXOquxddtBowPqwArB63RbUlsKNxLMtTOxTLtUU3o7oudicLDheGpdyfgXkstneftpUvfa9uNyTC84BX3RmilZ8QklUUgcTR49+TwvK1AgvWX2JpV8ASn76Gmr8T9Zvqec66Od1mFa1Xu8bsTO7ps8Mp8lUceL/9uyHehRhxOsFH+SUWUCghrAkqKuEfc+B83Wmfc7g2dG4qpxv3IpBLPrxE/cy8e7ePG6M1YfJBmv2TwNKW4uNsmusLU10MeIVgJoL3KoPFGU6IQ/uV62Rpux+tEv4nPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9eJhCYE9y+7+7RZai3bIi0/dC5uaBYttN3zrwFiDiRU=;
 b=dFobctY5A8jMFYd9FFtuT++eE18OvK1kfcSAAY6hLk+9DINzQzbX7Kv+oMDzB1zm1bjLox4JaO47aNRHw4hqu+BAzK4TEzWw2pqEtnfGedKXN4q7V+jZb2EAvdAVOSDxmClKRiAokZQ71kJhfKI9MlqA5zlw6QouNBVP54uzCBCy4NXxRCO48pwH70jo9oOQscws0QvbVw0trP7Q21rS60joxEc+jSpIeKFvPNcgpui+d9oT6l8dvhoRT3KNdj+hLEi1pribO+H10rDM0bFtV8aZRDQbpyh0Cisp2qSP9UxE+F4M3Kv1dSRMtdmVcemWxhxA4Fl6mwYoB+UzRXsh5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9eJhCYE9y+7+7RZai3bIi0/dC5uaBYttN3zrwFiDiRU=;
 b=LDHtTbTaFOW5S4vrMvaxOhQBFT9QTS6/xxRsTcaQLB8kQziRkGD9JwazG4U9mPab201+Kg+uk0F4km511fGn2m9EDej0eS6Gf+XNWQXhweglKw0nxreX6MfTMuQdLfN548Jxj64ljcA3MD9RGlODNHFusgTWMuqMkE1ptWSraHs=
Received: from BN9PR03CA0118.namprd03.prod.outlook.com (2603:10b6:408:fd::33)
 by SJ1PR12MB6243.namprd12.prod.outlook.com (2603:10b6:a03:456::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Wed, 10 May
 2023 13:51:25 +0000
Received: from BN8NAM11FT071.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fd:cafe::e2) by BN9PR03CA0118.outlook.office365.com
 (2603:10b6:408:fd::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.20 via Frontend
 Transport; Wed, 10 May 2023 13:51:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT071.mail.protection.outlook.com (10.13.177.92) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6387.20 via Frontend Transport; Wed, 10 May 2023 13:51:24 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 10 May
 2023 08:51:24 -0500
Received: from desktop-host.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 10 May 2023 08:51:18 -0500
From: <vitaly.prosyak@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <christian.koenig@amd.com>, <alexander.deucher@amd.com>,
 <Luben.Tuikov@amd.com>
Subject: [PATCH] drm/sched: Check scheduler work queue before calling timeout
 handling
Date: Wed, 10 May 2023 09:51:11 -0400
Message-ID: <20230510135111.58631-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT071:EE_|SJ1PR12MB6243:EE_
X-MS-Office365-Filtering-Correlation-Id: 959203cc-c306-4790-7b97-08db515da4ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OOxMXYiVmh960CsF+geQ7GyaeergiM9syZWIHu78cxdg/IIuHwHhlwgi/J5CrVWVDyVPaKKsLgLOe1yTg9hhWKKo1GxwmXCeoAhSvnaEvkcyFsiRk13yx2kVzdeELUyWNcVIPQKAC/LJyxk0aT022vSNNnYcVUhfJIP6MlJ+ULUoRQ7eOh2uXY/EsRwiMVQQO6hiMzDONnanGeKvhV9Pkx2QwGPi50W45BFHgdZKQEZdlqOL7Qxk0v2iuiO3TWcvLpbo8QjsxaOa9vwq0Ax3jg+Sc9mcT2h69Bna+fj3e63UDOZIRuxe2utAkLhE3xHEXHZDBDgJ4O11v2ErOwfuCn4JeynIue0n34RImel0U5mFWySkXcaPxA8fJI+dGaqZeHUt6sfaNvJqL1uqO/5Nt+BTVnihK/o1VtBMEpAOAEj5G8G/HPt/UQu4IJiuANCCo0StD8ast7/wIm0UzXuiUZ/rxDnVe/pOJbs6Zpc65iliwzkQKUcYCbOwc8k2N5qa2XzDERQuvzB1tVOpwUyw4rgs3WjHwkKGIwiEiH1mVgZF7T1DlHyDv5A6yl7G5jKgsLFygFJijZj+F7xxmnZh6Wwbhe0F68cFBQpBZsRU8S8/AwC9nrF6bQNeTk1lJRVdoJBvFeUpZGndAgbzHgBW2MsFaakiuI49bbigThrFhcCswVi81M01nYBykZku8swTRFwMgVsAMRWLW3aSQQxjL1nxP+LKq0U2f71yii9aP5c=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(396003)(376002)(136003)(39860400002)(451199021)(46966006)(36840700001)(40470700004)(36860700001)(36756003)(82310400005)(83380400001)(356005)(70586007)(2876002)(316002)(336012)(86362001)(8676002)(8936002)(2906002)(6636002)(41300700001)(81166007)(5660300002)(40480700001)(4326008)(70206006)(426003)(40460700003)(47076005)(450100002)(26005)(186003)(1076003)(110136005)(2616005)(6666004)(7696005)(82740400003)(478600001)(54906003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2023 13:51:24.3489 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 959203cc-c306-4790-7b97-08db515da4ee
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT071.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6243
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
Cc: Luben Tuikov <luben.tuikov@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
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
Reviewed-by: Luben Tuikov <luben.tuikov@amd.com>
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

