Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E99FC55A08C
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 20:10:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC0AF10F1DF;
	Fri, 24 Jun 2022 18:10:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2052.outbound.protection.outlook.com [40.107.101.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A4EA10F1C5;
 Fri, 24 Jun 2022 18:10:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kl6qEE8Juu4uoKN+/QqIjDIjqsO6JblmR1UWFsV06bcc7dUTnZumztjYp9DIDEPJXUfKuRDtfHScgBRjPL/qXd27SgurQYqhaDJQVZxwVSO43gImj0TQnsQQod2ZzAKc5zanNRneMu/CFW9SJaQyDuj/7qbuc39s2vgU355ZLBCudwq4mlkZgaPjtdDpDD0IXOuKXN3pNJ0bqXB+0+pMnNdK0WFNfEcmgnap3fEtIdJuvqaXlEHNGwg/onj0/HfONaqyVMKwxhkYz9JskkteMVhjpyeYDcx5d2kM5a4sI5kHJPCfChDa0VficyUgzKs4D+m4FFkUrHWPf+9s6TL/lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hOmwoxrmSazF7TALVwdwUJWo4cQwrXZ8jstH/9P+L1g=;
 b=jQBtyxFcfYpmSHgu4F6b73rahDDxiSrAsSdpQy0P5q+y3+gKiOZV9Hq1NA6mk28lLKJnJIZvQEA+RB3h8mtcqdN78xaBcfEZntVqatiB7zfew5D4lXpdA164yAri5QLAD25PjM9otFAPjBmcFtpO53fGs1vxfAalOHPjc8gj+vo5gsg0aZ2hsYRdvjYmpnHy3XoP1Db7kTtvF45Ppd5EQjzYXu4bSUc0DiEXCvrKvv7nPBhRarvwiTByRn/gsG7sXnTL0xpV6jzUHQgMKZ8N8VlKf4W+LsawQZ0joFDA3YufpJE+0EJIxvz6on2LWe+JRC8IycQMTDPeQHCqY2HokA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hOmwoxrmSazF7TALVwdwUJWo4cQwrXZ8jstH/9P+L1g=;
 b=DMo0jnhYvJdrM+ghWadNf6LxFcShNOxGzv84d0pSOiYGOjLCD5fIYQpMzsLv+jjVGAXxThVBSIYCde4bT/tnaRW3Ckt40TDx/+VgeGqviw5dUlL7e6ErlGKJIHHDdFXn6Z8GtqKRsjo2Hdg3KVUujPMluzyODGZCwTl8giMBntY=
Received: from MWHPR04CA0051.namprd04.prod.outlook.com (2603:10b6:300:6c::13)
 by MN2PR12MB3807.namprd12.prod.outlook.com (2603:10b6:208:16c::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Fri, 24 Jun
 2022 18:10:12 +0000
Received: from CO1NAM11FT058.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:6c:cafe::ed) by MWHPR04CA0051.outlook.office365.com
 (2603:10b6:300:6c::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.15 via Frontend
 Transport; Fri, 24 Jun 2022 18:10:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT058.mail.protection.outlook.com (10.13.174.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5373.15 via Frontend Transport; Fri, 24 Jun 2022 18:10:11 +0000
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Fri, 24 Jun 2022 13:10:09 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 2/4] drm/amdgpu: Prevent race between late signaled fences
 and GPU reset.
Date: Fri, 24 Jun 2022 14:09:53 -0400
Message-ID: <20220624180955.485440-3-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220624180955.485440-1-andrey.grodzovsky@amd.com>
References: <20220624180955.485440-1-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3bd8a036-fc2a-495e-6cbe-08da560cc813
X-MS-TrafficTypeDiagnostic: MN2PR12MB3807:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 08DyLgu7K6aU9jMSq8t423qbRdeKGrezBpbO8c0rWfLWHUnbFPQbnpZVf3o1Cp9lLUNhgvlkeROe2qv7/JROJCPArYwP6W8JtFjokWhVpkdF8qirc6otxK/O92kD+kH38wc1eD9wY3n8mnKEvSaIGijtGvUXzlLLcXoyq9rsd5YzHD/oFICXaYPIn4YA8Xl6lhx/doMID8Fembt62vjFct/rMO6AkDOOzMt1ThynXKdEBVzufqXLO4nRz500pks44kMNpk3aPHJ2dEl6M28ZbNX0GFEAgfHziK5KG5flRcHnj/Zy75JPRwITZis2HQ6A1rp8fX0wo8OaxbHnOEY2wwHtioA9IQ4XvcPnVBd4w5cHUOItWYI902yNRP429MPLSovpZAhmjJX3qHYwxc16G8hcJZEm8xUDrzQTW4yaeB7zyUEXjG9aOUFIqV+K7qLz1eaLdNQiHMccNarGtjiwQJMEd8DBidiPiqIcNqo2ZKOHjSo9+SQziDs13G3DHW3nmFPyC1w4cu+Eetk/96ayCQnS5cf3g4nK5nkYJoIDXCS/eEvnkyGCXfakxqwiM6pS7XOxOXjKG8Ls1MOIqIpobUe25OFM6nz5PnF+sd4p8DvydDDU06nISSVYq+FMpkPTXu2GkU59A8NcR9rMD1HPakVpHf04cYz+kBzG9wL3MNJfD9Lvqpdwhak1BJ62T6Catm7ZPJ5uh88j0Y+ijNlqRJM3kAFg7QhV+Vpkj83iCrBl0jEbXwhli0Pk2UX1uMFHa/vDFfdV8xVcJktSS+kY972hchG4o4T+/Z5o9/svREALZcrdAmD8cTZ6MmHZ8R54I3F8rRjEVIOrgg5HsK8LeA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(39860400002)(396003)(136003)(346002)(40470700004)(46966006)(36840700001)(70206006)(36860700001)(81166007)(70586007)(450100002)(7696005)(4326008)(8676002)(2616005)(44832011)(110136005)(40480700001)(54906003)(1076003)(82740400003)(5660300002)(16526019)(8936002)(356005)(186003)(86362001)(336012)(83380400001)(36756003)(47076005)(41300700001)(6666004)(26005)(426003)(40460700003)(316002)(82310400005)(2906002)(478600001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2022 18:10:11.9690 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bd8a036-fc2a-495e-6cbe-08da560cc813
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT058.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3807
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
Cc: jingwen.chen2@amd.com, Christian.Koenig@amd.com, monk.liu@amd.com
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

v2: Switch from irq_get/put to full enable/disable_irq for amdgpu

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  4 ++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c  | 18 ++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h   |  1 +
 3 files changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index eacecc672a4d..03519d58e630 100644
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
index a9ae3beaa1d3..c1d04ea3c67f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
@@ -532,6 +532,24 @@ void amdgpu_fence_driver_hw_fini(struct amdgpu_device *adev)
 	}
 }
 
+/* Will either stop and flush handlers for amdgpu interrupt or reanble it */
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
+			disable_irq(adev->irq.irq);
+		else
+			enable_irq(adev->irq.irq);
+	}
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

