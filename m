Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5AD5526D1
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 00:03:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA26010F71A;
	Mon, 20 Jun 2022 22:03:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2058.outbound.protection.outlook.com [40.107.95.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3E7410F71A;
 Mon, 20 Jun 2022 22:03:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JEuzgjaz8KA3PB/cliP8Mq2JdsyziLCDsIGtwwhU5KkIaI8JOQENtxGPSDmNYjtTHb8yk1G/xgl4fuvhvnVDMVq6B7cyZF73dqc4GUr2X8X4FE62jBJSBoPc59yIzCaBPk+tXnqaj26fQB/ssfBVKO9riAYF5+1+MAX3sSp+wZxIqhCGQpFwli+QGL6tQBdcOxjaG6S4M8W01i97JMCJc7eb0PP2c9LeggFL7M2aMz4E0Qp0gBaiina5iWgA3ia5tTeYhw1V2AruHUS8lBn78hTVILv/PsTphfwgaFdig0iB7bX7wIqO0w1pG79L6pKF+J7IwYJTbs08qpUyqylDcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YmLTyILqSTaiYP6vq93GrSun60ytp1vxkAWZyw7dfGE=;
 b=F6ASyq1BWqa/59GDNx6tDVEOxUqSfovtuNLYDaNy/s2vNYFSLK9pEQPCHSsfyqSWKxcsgrkPDxDYFB4cA6MtimW49coZ3L2LHsBsi+IFqSuN2QqK698564GSi+Ni4HI08ck2S/WxoAfYN4Nk2yoqwxMsyNWkH/Gofc7iViZDPcp6sJNxs8v4fIxEEWDnzt+Ao+BnZBOtSisOceY1nWebJtmpx6KtYjEYkmh3LYwnmctrj54NQ0m6irlhdSciqu7KaZEC/uo0kbMJyfRnONoB9Tmkxy5fvEMltlzoM9AhExnuI2owervFFiUTDAegeVL/qxdz5U9vwAzdmg8zShS2hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YmLTyILqSTaiYP6vq93GrSun60ytp1vxkAWZyw7dfGE=;
 b=41nYby4OeDC/D88z1yPrm6OSQPt2/1t9igcijorPrq+t7SjqelZB05GBe7pEDPiaOJPGNxFWEu2vEYQNuhzshHj9iFVSA6zoLlsYlutVuzy6dTNl+9GNi0V5Koqh1WT50HJMeQqtP1T7sjYxs1PYTMxgGfB8n/gwX9MYMomP0gI=
Received: from MWH0EPF00056D16.namprd21.prod.outlook.com
 (2603:10b6:30f:fff2:0:1:0:1d) by IA1PR12MB6330.namprd12.prod.outlook.com
 (2603:10b6:208:3e4::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Mon, 20 Jun
 2022 22:03:41 +0000
Received: from CO1NAM11FT054.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eab::206) by MWH0EPF00056D16.outlook.office365.com
 (2603:1036:d20::b) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.3 via Frontend
 Transport; Mon, 20 Jun 2022 22:03:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT054.mail.protection.outlook.com (10.13.174.70) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5353.14 via Frontend Transport; Mon, 20 Jun 2022 22:03:41 +0000
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 20 Jun 2022 17:03:38 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 3/5] drm/amdgpu: Prevent race between late signaled fences and
 GPU reset.
Date: Mon, 20 Jun 2022 18:03:00 -0400
Message-ID: <20220620220302.86389-4-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220620220302.86389-1-andrey.grodzovsky@amd.com>
References: <20220620220302.86389-1-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5af672e7-1f60-49d7-2232-08da5308bca8
X-MS-TrafficTypeDiagnostic: IA1PR12MB6330:EE_
X-Microsoft-Antispam-PRVS: <IA1PR12MB63305783B8AE15FE46D05C6CEAB09@IA1PR12MB6330.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G61UmUnbjHg66+W5EY/9NGr3eWFPAsH4HJndxT6Q/uWo2Gxr54yl6uhd28+84u3CERPgDn9U5YFqMxflxKUXc8o8rTWyb1OsDiVI5K38bJvzY5dwbZixj1AFI5vlKAlTKEknMuZVtBtkv8UtfekEGETISgqXGcAzApBUQ0Cq57/PbdGzz1O65vSG31opye3TOuwfjkZtcKTnwIFmqX/LAkBjZSQsgQyvuWKmK93u9fNLkjiGar3o9RwhiaC9gctQZGnFe3AP6STDPS2rV/wpSV9QSdT/1G+rtk4ZgHDR0URYIBX/x0batG3M3I9vsNuOk5SuycHSGEGZMWzR6lXHD/8lWT0iNzjeJb6Tx7rRnzLlwhy9m4Shu1TJPQ5xtktuOMH8RjAEufNpJVHDfQJWVCq5+rpwD97anlo088Xzc1qSyFkRekbXEgZh6BtFaGsCbfCy7LhZDH/M6Ig3saZYAcLJ2POj416kfEGiNlON7xQfosBk1S15XFKa8xTvnTEVYU+9B6Hr9aI/TTIzMNOmbs7jhuXl+bdxmHf7iCmWc4CX+11AIxNP/4YWcgCvA+AO9Qbase314RKOzUPuT/mAp/3Q8z6ICq6z+jFBGSfWImBqVQ8w9O9boU8sJp9k2MBRENaC08hw4apBgxvnJVRBKCN56tvsBDwLXLSyaKS7RQF1xesTzlv01gY9uZb7wyfs7evfwqT/x+TiH4Il5VEcX277XFvdCCz2mIGmBHON6BpJbJn21N0iRnxVR8fCAfU9
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(39860400002)(396003)(136003)(376002)(36840700001)(46966006)(40470700004)(336012)(6666004)(40480700001)(450100002)(47076005)(186003)(316002)(5660300002)(8936002)(478600001)(4326008)(82740400003)(26005)(1076003)(7696005)(83380400001)(54906003)(110136005)(36860700001)(41300700001)(81166007)(356005)(40460700003)(82310400005)(2906002)(70586007)(2616005)(16526019)(70206006)(36756003)(44832011)(86362001)(426003)(8676002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2022 22:03:41.4607 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5af672e7-1f60-49d7-2232-08da5308bca8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT054.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6330
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
Cc: jingwen.chen2@amd.com, Christian.Koenig@amd.com, monk.liu@amd.com,
 yiqing.yao@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Problem:
After we start handling timed out jobs we assume there fences won't be
signaled but we cannot be sure and sometimes they fire late. We need
to prevent concurrent accesses to fence array from
amdgpu_fence_driver_clear_job_fences during GPU reset and amdgpu_fence_process
from a late EOP interrupt.

Fix:
Before accessing fence array in GPU disable EOP interrupt and flush
all pending interrupt handlers for amdgpu device's interrupt line.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  4 ++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c  | 26 ++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h   |  1 +
 3 files changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 2b92281dd0c1..c99541685804 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -4605,6 +4605,8 @@ int amdgpu_device_pre_asic_reset(struct amdgpu_device *adev,
 		amdgpu_virt_fini_data_exchange(adev);
 	}
 
+	amdgpu_fence_driver_isr_toggle(adev, true);
+
 	/* block all schedulers and reset given job's ring */
 	for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
 		struct amdgpu_ring *ring = adev->rings[i];
@@ -4620,6 +4622,8 @@ int amdgpu_device_pre_asic_reset(struct amdgpu_device *adev,
 		amdgpu_fence_driver_force_completion(ring);
 	}
 
+	amdgpu_fence_driver_isr_toggle(adev, false);
+
 	if (job && job->vm)
 		drm_sched_increase_karma(&job->base);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
index a9ae3beaa1d3..d6d54ba4c185 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
@@ -532,6 +532,32 @@ void amdgpu_fence_driver_hw_fini(struct amdgpu_device *adev)
 	}
 }
 
+void amdgpu_fence_driver_isr_toggle(struct amdgpu_device *adev, bool stop)
+{
+	int i;
+
+	for (i = 0; i < AMDGPU_MAX_RINGS; i++) {
+		struct amdgpu_ring *ring = adev->rings[i];
+
+		if (!ring || !ring->fence_drv.initialized || !ring->fence_drv.irq_src)
+			continue;
+
+		if (stop)
+			amdgpu_irq_put(adev, ring->fence_drv.irq_src,
+					       ring->fence_drv.irq_type);
+		else
+			amdgpu_irq_get(adev, ring->fence_drv.irq_src,
+					ring->fence_drv.irq_type);
+	}
+
+	/* TODO Only waits for irq handlers on other CPUs, maybe local_irq_save
+	 * local_irq_local_irq_restore are needed here for local interrupts ?
+	 *
+	 */
+	if (stop)
+		synchronize_irq(adev->irq.irq);
+}
+
 void amdgpu_fence_driver_sw_fini(struct amdgpu_device *adev)
 {
 	unsigned int i, j;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
index 7d89a52091c0..82c178a9033a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
@@ -143,6 +143,7 @@ signed long amdgpu_fence_wait_polling(struct amdgpu_ring *ring,
 				      uint32_t wait_seq,
 				      signed long timeout);
 unsigned amdgpu_fence_count_emitted(struct amdgpu_ring *ring);
+void amdgpu_fence_driver_isr_toggle(struct amdgpu_device *adev, bool stop);
 
 /*
  * Rings.
-- 
2.25.1

