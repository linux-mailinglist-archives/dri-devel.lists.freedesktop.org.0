Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E611A479717
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 23:28:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C64C510E5C3;
	Fri, 17 Dec 2021 22:28:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2043.outbound.protection.outlook.com [40.107.96.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DA3010E476;
 Fri, 17 Dec 2021 22:28:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FMsN7LeZwk/5sBzPD5tB9GnlDC2ryO0MK0iw1uQgT4HCAinspaCx7HBxoZpOFhv7DRRy88iUiwPhFCBR/2yvbJtiq/IsEJpYFcWvP9wOQKmNWpurPu1omLqPTugZp5m1VmZ0dhwYVrTtnFGzkRPjB8Qv+PuZBVb4zBOBu7X5L5LqTD9DIIOBUPhOGiGaQ0jE294y1pTb7cR0LX6WFC8fav59/BaglqNwMzIsk/WroRNy6vvLFtNlPXczGqwUPscjOJJZ8Zr27xJimWFW8dHj8352s7kVXRhkuPEQwt0bX4uT63lWnT1Nbj2iwoi17NlHuegZt33h62Zpp4xLVimOGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rmZbxkfCHleGgNGqebSUvlC/FyR0ZtN5noYhW+prBvU=;
 b=ZFcYskDF9QyP1kpAsw5Tu6Bm8KaXcJHljmlBaB0hcD4wqfG9sKWvy2bYKEUmbAvJ0UqBAdA2dhYgJK7ZY1U+0YZKAPoEycHWamWGGeIIBHL4OSG8iWPzU2xA1C8xdfEixn0tX4YEizTNIXXbkVrjHIxVC66j6WatSQKCHWGHDsdhGDjOtsJu3xbAtjnlN9MejFRemcGXut4Vj+61sLDKsVjHOUsMLbcobi24x+qaFDI3NUTdKlzAwIgOIku+LbjqWBs0nDjVyd9YPbFSpIAAXLrEeDe43qmo81lqpG2gdiaRMVit3P04Wv4pUOnvmAa9lbCiEpyKfw+YwEB43kmkaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rmZbxkfCHleGgNGqebSUvlC/FyR0ZtN5noYhW+prBvU=;
 b=jeQVflBHdLYuUbxrmRT/mb27NIMaMNPFyB5aZngDVd6WllaoEG1swAUwGYvNcENXnHD4cXJWOtdpbESvhUTC9KD7sgHVUf4fFwClIKFC/c9Tp0ngd4Ac1gFoNvFLalQ/1Xiu3+3jHXdPaVURupb7wjAWKzuxLUYj4r6GUZgW7AQ=
Received: from BN8PR04CA0013.namprd04.prod.outlook.com (2603:10b6:408:70::26)
 by CH2PR12MB4277.namprd12.prod.outlook.com (2603:10b6:610:ae::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Fri, 17 Dec
 2021 22:28:12 +0000
Received: from BN8NAM11FT051.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:70:cafe::4b) by BN8PR04CA0013.outlook.office365.com
 (2603:10b6:408:70::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.15 via Frontend
 Transport; Fri, 17 Dec 2021 22:28:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT051.mail.protection.outlook.com (10.13.177.66) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4801.14 via Frontend Transport; Fri, 17 Dec 2021 22:28:11 +0000
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 17 Dec 2021 16:28:10 -0600
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [RFC 2/6] drm/amdgpu: Move scheduler init to after XGMI is ready
Date: Fri, 17 Dec 2021 17:27:41 -0500
Message-ID: <20211217222745.881637-3-andrey.grodzovsky@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: b64f631c-9ab7-470b-b065-08d9c1ac829e
X-MS-TrafficTypeDiagnostic: CH2PR12MB4277:EE_
X-Microsoft-Antispam-PRVS: <CH2PR12MB4277DAB100F1A9922AE81230EA789@CH2PR12MB4277.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:510;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tYmn9JpHhZFLZZBv8DX9O0ww1TYMBfzcoD4LyIm4UyAsFTUyQ0XNwegEb6fTlrxWKM9RoRxPl9Jea6oSYiLdMM8W3MF2xqvudiA4g9oswpp1WHBxzl0b+mDrGHHkIKxGAeAM28VkysaZwAAdCSQJZc1adySMj52fwS5AhJGpgrxEjZyMcj4koguQrv+aGYtMjuO2ccZNbvtAXuv2eEnZ0nV5SzCmqRsRSteKrpt0eOM1om+1PZ+eX8GQnbjRIYvu21iJfzAS18JuNnQ7fExc6iD9QTzXzSM35do7NkeifCgke0/kXFHc/bOaQpgXlTgUywLVc8B4TFOsa4l0s0L8rZxiwnuSrbxiuvU3W+FotCzwdnRo4dzGWxlkNwbTXVQUBMoM7Jc4rWXJNvQkxd/YUmgFUyewKWuBS4nKfkat/cqa/SAFHQJ4IC6PBN0kC8l3dqEFvK5EdrYerJAwzvZMAYB3C/pgDIDSA+UmuXt7WLNiXpTat5uo4bzUHZ4rdqi0Rep7dFxGOc+fE+dm9xoAcAeDQQlyj7/u8lmdbefgdzfWYifSIa8ZCy5zifutERjSAu9AlZXPyeKoqWdEUCzXxc+XrFjL25fX5d0XJA5t99TJZr+qSyCFwJPSYwr/PE5KguZv1/5quu9PF+oE3F+BMX/x3nSH0+AItz0lOP8FgdyRWTURHVsIpkQT922van1nSLcwMmKqD4es73HkHLsjTG5zT61ZlhYek/0F36htqFQNEVkdtgSVaX7vw1NH7zStz3l8AtYgmkZCGOgz3xSY1khAR2jH8yAPENhcbbBMly0=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(40470700001)(356005)(47076005)(2906002)(110136005)(8936002)(83380400001)(6666004)(40460700001)(8676002)(44832011)(26005)(508600001)(426003)(7696005)(4326008)(86362001)(70586007)(70206006)(82310400004)(186003)(36860700001)(5660300002)(36756003)(316002)(16526019)(2616005)(336012)(54906003)(1076003)(81166007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2021 22:28:11.9185 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b64f631c-9ab7-470b-b065-08d9c1ac829e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT051.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4277
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

Before we initialize schedulers we must know which reset
domain are we in - for single device there iis a single
domain per device and so single wq per device. For XGMI
the reset domain spans the entire XGMI hive and so the
reset wq is per hive.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 45 ++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c  | 34 ++--------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h   |  2 +
 3 files changed, 51 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 5f13195d23d1..b595e6d699b5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -2284,6 +2284,47 @@ static int amdgpu_device_fw_loading(struct amdgpu_device *adev)
 	return r;
 }
 
+static int amdgpu_device_init_schedulers(struct amdgpu_device *adev)
+{
+	long timeout;
+	int r, i;
+
+	for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
+		struct amdgpu_ring *ring = adev->rings[i];
+
+		/* No need to setup the GPU scheduler for rings that don't need it */
+		if (!ring || ring->no_scheduler)
+			continue;
+
+		switch (ring->funcs->type) {
+		case AMDGPU_RING_TYPE_GFX:
+			timeout = adev->gfx_timeout;
+			break;
+		case AMDGPU_RING_TYPE_COMPUTE:
+			timeout = adev->compute_timeout;
+			break;
+		case AMDGPU_RING_TYPE_SDMA:
+			timeout = adev->sdma_timeout;
+			break;
+		default:
+			timeout = adev->video_timeout;
+			break;
+		}
+
+		r = drm_sched_init(&ring->sched, &amdgpu_sched_ops,
+				   ring->num_hw_submission, amdgpu_job_hang_limit,
+				   timeout, adev->reset_domain.wq, ring->sched_score, ring->name);
+		if (r) {
+			DRM_ERROR("Failed to create scheduler on ring %s.\n",
+				  ring->name);
+			return r;
+		}
+	}
+
+	return 0;
+}
+
+
 /**
  * amdgpu_device_ip_init - run init for hardware IPs
  *
@@ -2412,6 +2453,10 @@ static int amdgpu_device_ip_init(struct amdgpu_device *adev)
 		}
 	}
 
+	r = amdgpu_device_init_schedulers(adev);
+	if (r)
+		goto init_failed;
+
 	/* Don't init kfd if whole hive need to be reset during init */
 	if (!adev->gmc.xgmi.pending_reset)
 		amdgpu_amdkfd_device_init(adev);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
index 3b7e86ea7167..5527c68c51de 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
@@ -456,8 +456,6 @@ int amdgpu_fence_driver_init_ring(struct amdgpu_ring *ring,
 				  atomic_t *sched_score)
 {
 	struct amdgpu_device *adev = ring->adev;
-	long timeout;
-	int r;
 
 	if (!adev)
 		return -EINVAL;
@@ -477,36 +475,12 @@ int amdgpu_fence_driver_init_ring(struct amdgpu_ring *ring,
 	spin_lock_init(&ring->fence_drv.lock);
 	ring->fence_drv.fences = kcalloc(num_hw_submission * 2, sizeof(void *),
 					 GFP_KERNEL);
-	if (!ring->fence_drv.fences)
-		return -ENOMEM;
 
-	/* No need to setup the GPU scheduler for rings that don't need it */
-	if (ring->no_scheduler)
-		return 0;
+	ring->num_hw_submission = num_hw_submission;
+	ring->sched_score = sched_score;
 
-	switch (ring->funcs->type) {
-	case AMDGPU_RING_TYPE_GFX:
-		timeout = adev->gfx_timeout;
-		break;
-	case AMDGPU_RING_TYPE_COMPUTE:
-		timeout = adev->compute_timeout;
-		break;
-	case AMDGPU_RING_TYPE_SDMA:
-		timeout = adev->sdma_timeout;
-		break;
-	default:
-		timeout = adev->video_timeout;
-		break;
-	}
-
-	r = drm_sched_init(&ring->sched, &amdgpu_sched_ops,
-			   num_hw_submission, amdgpu_job_hang_limit,
-			   timeout, NULL, sched_score, ring->name);
-	if (r) {
-		DRM_ERROR("Failed to create scheduler on ring %s.\n",
-			  ring->name);
-		return r;
-	}
+	if (!ring->fence_drv.fences)
+		return -ENOMEM;
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
index 4d380e79752c..a4b8279e3011 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
@@ -253,6 +253,8 @@ struct amdgpu_ring {
 	bool			has_compute_vm_bug;
 	bool			no_scheduler;
 	int			hw_prio;
+	unsigned 		num_hw_submission;
+	atomic_t		*sched_score;
 };
 
 #define amdgpu_ring_parse_cs(r, p, ib) ((r)->funcs->parse_cs((p), (ib)))
-- 
2.25.1

