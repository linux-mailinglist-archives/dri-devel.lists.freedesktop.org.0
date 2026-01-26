Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8KAQJ1Zud2m8gAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 14:38:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EAB688F1F
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 14:38:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8473A10E436;
	Mon, 26 Jan 2026 13:38:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="BqUWTZCe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010050.outbound.protection.outlook.com [52.101.56.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC73C10E435;
 Mon, 26 Jan 2026 13:38:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QfaBfUn77dEvqZw2WFiGD513RX+VQOHZOMZcuTMRRyS5iZtP5lFpmPNi3y2NZEKmbYflCETbhi7AT00Av5Lmg2u2mmmtZ/KsDAxgguDROX5UOVMaL91kJGcaRX5a0vh9rWaXhHPk55LpnRu2k5dDOXmP7zN6UTvzSuopdRP4PPo5FITLdVF3r0jHZ43EteK06sVRn/0vHqkIpC+Uf2iPnmDa60ElyPHJPNw3MAZ9M0CpLgsjytSmoK3DHAw87lpWfieDz+nZpOFrl7GEWdrZ2pQVnetDwlTnrxmxNfL+oRLUGrYGZ5qnWOPuNxhCGv7wo5PnIGW0wazUwhU+DkvEDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JJhPCq0HgsbP+RbGaH1uNcbG8WlyqjSHHhhlaDkVrfc=;
 b=cVo58yNLvYkDxKZuW/wfucdV2M48o50Phb2ce6adDoLN8Gw/z0SAgy4FgW9ng/rzhqt2zM3nWvx7+AwI7TlfZkpeK+mDA7mMbdxdNF2qHmAP5aKgBBFAk4aJ9/ZAFOOeGETWyvAdSN7xI4BKy0sLWf/ZREzKu8h5liIpcyLMfaVa+716GJ/24cseW9UYACk7Q6PrprPGet0zYY3oI234f/o2S4zaZ1heE7eoo7mJiEdgNPniPWEJ5N+pwQFm5gTa0pLxLSo8DenE1xnwhitDjfLnBkyFnNIoZcj0s7kYvMB1KONjv04H+u+7UouUaRi6wblbOVLVNqE7BCyOEUnxgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JJhPCq0HgsbP+RbGaH1uNcbG8WlyqjSHHhhlaDkVrfc=;
 b=BqUWTZCelHgGZJa15sgeYhvM+OCE1oBIiVw2O7IN9JS3Ft5jysn4p0kgJBwS/pKLGl+hw2VSmgdPOsm9rHHsmKVi3paCGAL7/Ly08VDQpCrdXiC/A6+NARDLr7hxm12fr0/X1n6ycdkhhbOPd+LtJNm8Uie1/0TFwyg45o4Zamg=
Received: from SJ2PR07CA0007.namprd07.prod.outlook.com (2603:10b6:a03:505::12)
 by MN2PR12MB4456.namprd12.prod.outlook.com (2603:10b6:208:266::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Mon, 26 Jan
 2026 13:38:22 +0000
Received: from SJ1PEPF000023CC.namprd02.prod.outlook.com
 (2603:10b6:a03:505:cafe::c6) by SJ2PR07CA0007.outlook.office365.com
 (2603:10b6:a03:505::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.16 via Frontend Transport; Mon,
 26 Jan 2026 13:38:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF000023CC.mail.protection.outlook.com (10.167.244.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Mon, 26 Jan 2026 13:38:21 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 26 Jan
 2026 07:38:16 -0600
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb09.amd.com (10.181.42.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 26 Jan 2026 05:37:35 -0800
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 11/11] drm/amdgpu: move sched status check inside
 amdgpu_ttm_set_buffer_funcs_status
Date: Mon, 26 Jan 2026 14:35:06 +0100
Message-ID: <20260126133518.2486-12-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260126133518.2486-1-pierre-eric.pelloux-prayer@amd.com>
References: <20260126133518.2486-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb09.amd.com
 (10.181.42.218)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CC:EE_|MN2PR12MB4456:EE_
X-MS-Office365-Filtering-Correlation-Id: 169f9f08-f309-48e5-fb0c-08de5ce02c46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NTClL9fz1cF7Md+u5XYVi3n82ergfEkFL3IY12GdGdPsZqr13rmxPn2NNoJo?=
 =?us-ascii?Q?i+2ze0/X6ICTjGMw0iVPL1Ci+9ZFuSooFqtc03me80M652ZWLHKg+1vJAuxU?=
 =?us-ascii?Q?29EGlbe8RKCvK8w05sdqL1/lbzB5cmhRNqB7qM/SBFY7DxlH2NNmEfDMfFQ5?=
 =?us-ascii?Q?Zfn+Pe9UR4y+TagNe/TCcjEhgIZOKXyCnnpb2FyFzcxeH7yvZn2ZeJL/LvPI?=
 =?us-ascii?Q?ce74mV1xArxpfmTBTrlZMDWNmHX2B7M2ALWjuctw7p34NLBXmFHgLyRGKyp8?=
 =?us-ascii?Q?TngJC5VRAW5dlJZ0SWFZ8osiYTfKRCObc+4sjRrD/OrsYtVhEvcHpvGDs9TS?=
 =?us-ascii?Q?hCZrr/CyHcgiZ/WYm3c9mufmw52zphnV/NLM069aSC657MbFOkOkkl7+XL/2?=
 =?us-ascii?Q?eAJpnmefPEC4Vxgmx5dtMn9mivcNNYEKWoNGHTliyKck3WyndBctSJf6D9HW?=
 =?us-ascii?Q?D56y2BZqdijj4sCTjCilKpiB/pHWf1WMNumLhYCeF94sFvMWzcQ+e+ePhe2a?=
 =?us-ascii?Q?amFNWoxMrPU4+SL1yjdmF+FY9GmtcRXBnngJEsCZMPR5XMlZBKKXQVF1bE0/?=
 =?us-ascii?Q?2N3MFQ0bM2LSZKKN/Bwau4qriS0dAIgf/uQZeSdVX0RxO/imo9u7Qxr2pkeO?=
 =?us-ascii?Q?9rvHf+RvIvSOpMVZvPeK5YZJBEfkt0Rge3w1iQtp1TZJLTIdDINjw4TC9i9E?=
 =?us-ascii?Q?q6VNHNrRJhvjTma46z/yaoPU0taA/LQVHQLnnnlTb/GfOfRiRz/REB+cEcpI?=
 =?us-ascii?Q?oqwuLzol3EGRkVbioEutkzlaLXWOoWYuRUi6A5S9qHlTav8k97aFNbfCfgI5?=
 =?us-ascii?Q?eDi8hbhUAquGIjrPbDhhMq2hM6VCCet4/A203ohPDsMhh6foYwLMBdUMescb?=
 =?us-ascii?Q?Fqb68sscGEg7fybi7OJqTURuv1+Y4maV1xeGHpLPhMPCG+3qfN3RKBHIeI/M?=
 =?us-ascii?Q?cio7uIRqL0iqxLL1lPzdSpxG8tK2yvuZjrNhro1vxcCULOA8fpct2pvC0ptw?=
 =?us-ascii?Q?N6PN5+G3lxp7gQro48B7KkqyJwpIYPTwaB82Y597nECeLRkpb8OadTkIpxz9?=
 =?us-ascii?Q?s0mSQkepmgmN/iDgxfNfvS8qY88N+6Oo3Fx6bZbdZGCDFTYVs8RBNGFku6CJ?=
 =?us-ascii?Q?OoUsTDUl8xtBNInrdTupMhmJVTI2BxIUug6kJ+5qjVqwDotnsOz3dMQmLiXA?=
 =?us-ascii?Q?Yv34ww2Gsuk4Uo+03bfp/So+jHPpdeggSTTUdORNdPF8gaHPX0CGwwVByLRa?=
 =?us-ascii?Q?lqdmheiPY+FUxYjSxYSIcWnBciFTre73yWP11DF69XZdVEtD/Cw4RfXL8RDY?=
 =?us-ascii?Q?RphM7eVBdOi5zQatu0K2BTWlkAz7eb9yKc61Zv/UToAwIwU6hX6YiILXdDb/?=
 =?us-ascii?Q?Cao4XrOxjbs/EyKiHaptDYnzwdC985Kg3h6+YRR0xxMxTJYX1nlEg2nQX6Sx?=
 =?us-ascii?Q?tujGQrn7/qoi5+mr+/hgNv6taBY1PDAD0RPVx8k2uKmGIaUfmuKaRyXdA9pw?=
 =?us-ascii?Q?CXxablkEPBQo5l+oQ9ruPJywsm3NzoO2XcOmQAEclkBvnYwVmt+1xGFinCh3?=
 =?us-ascii?Q?ikwHQoCNBCboX1GEHq84CuliiNWv2MEAiXbHhyiYkOLzKktwBRD3Q5Do7kt5?=
 =?us-ascii?Q?04V0lOkihW7aHyH4EplzqUu+k8m3VEOOBhUeqglity4nAlio33bMrlbEbruS?=
 =?us-ascii?Q?oLz9ag=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 13:38:21.7733 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 169f9f08-f309-48e5-fb0c-08de5ce02c46
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023CC.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4456
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email,amd.com:dkim,amd.com:mid];
	FROM_NEQ_ENVFROM(0.00)[pierre-eric.pelloux-prayer@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4EAB688F1F
X-Rspamd-Action: no action

It avoids duplicated code and allows to output a warning.

---
v4: move check inside the existing if (enable) test
---

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 13 ++++---------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    |  5 +++++
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 362ab2b34498..98aead91b98b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -3158,9 +3158,7 @@ static int amdgpu_device_ip_init(struct amdgpu_device *adev)
 	if (r)
 		goto init_failed;
 
-	if (adev->mman.buffer_funcs_ring &&
-	    adev->mman.buffer_funcs_ring->sched.ready)
-		amdgpu_ttm_set_buffer_funcs_status(adev, true);
+	amdgpu_ttm_set_buffer_funcs_status(adev, true);
 
 	/* Don't init kfd if whole hive need to be reset during init */
 	if (adev->init_lvl->level != AMDGPU_INIT_LEVEL_MINIMAL_XGMI) {
@@ -4052,8 +4050,7 @@ static int amdgpu_device_ip_resume(struct amdgpu_device *adev)
 
 	r = amdgpu_device_ip_resume_phase2(adev);
 
-	if (adev->mman.buffer_funcs_ring->sched.ready)
-		amdgpu_ttm_set_buffer_funcs_status(adev, true);
+	amdgpu_ttm_set_buffer_funcs_status(adev, true);
 
 	if (r)
 		return r;
@@ -5199,8 +5196,7 @@ int amdgpu_device_suspend(struct drm_device *dev, bool notify_clients)
 	return 0;
 
 unwind_evict:
-	if (adev->mman.buffer_funcs_ring->sched.ready)
-		amdgpu_ttm_set_buffer_funcs_status(adev, true);
+	amdgpu_ttm_set_buffer_funcs_status(adev, true);
 	amdgpu_fence_driver_hw_init(adev);
 
 unwind_userq:
@@ -5931,8 +5927,7 @@ int amdgpu_device_reinit_after_reset(struct amdgpu_reset_context *reset_context)
 				if (r)
 					goto out;
 
-				if (tmp_adev->mman.buffer_funcs_ring->sched.ready)
-					amdgpu_ttm_set_buffer_funcs_status(tmp_adev, true);
+				amdgpu_ttm_set_buffer_funcs_status(tmp_adev, true);
 
 				r = amdgpu_device_ip_resume_phase3(tmp_adev);
 				if (r)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index e149092da8f1..1929a03daf18 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -2354,6 +2354,11 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 		struct amdgpu_ring *ring;
 		struct drm_gpu_scheduler *sched;
 
+		if (!adev->mman.buffer_funcs_ring || !adev->mman.buffer_funcs_ring->sched.ready) {
+			dev_warn(adev->dev, "Not enabling DMA transfers for in kernel use");
+			return;
+		}
+
 		ring = adev->mman.buffer_funcs_ring;
 		sched = &ring->sched;
 		r = amdgpu_ttm_buffer_entity_init(&adev->mman.gtt_mgr,
-- 
2.43.0

