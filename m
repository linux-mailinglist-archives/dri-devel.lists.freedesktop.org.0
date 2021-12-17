Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97005479721
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 23:28:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC66010E6CE;
	Fri, 17 Dec 2021 22:28:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2080.outbound.protection.outlook.com [40.107.93.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BC8E10E5E5;
 Fri, 17 Dec 2021 22:28:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bG6EG0QLJk8uuJJuEcXiTFUUZ/CgKeWCGRa50qyZWdTuHvIWS19YBiMmcU2w/rY4u35qg+0ZItbENXKxz1+6y1Edq3amZT4K3BSEkcfPLdDK/ZQj5utMtAh4ZuB8ie7gD4c37DGfyivAFCzJVyWIfmsn79S5kyRXXjRWZnsvXJgdPhqbFUSV1SQBo3HfcuqI9lZ05MrFDrbfXeZKs8aEfzSF2s2vhoA4nFkmAg2KJkMQ/AVLLRsBVrcTcz7nr1llA6X/y0ZT1YVE0S5e4WiUVmgPXvso3TnZig3yG/lvSKykToGlTG/9gLm92LAq7OnlbDKyNElgPt9NBW8+QZie0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CDVya4Pi/qTI2Ews7LWPaxgX8eqLLIQ1cz9/VdY2Qy4=;
 b=oNdiDkGDRBOT3NSXhgtKljhyESeQcVjwiqDmrUyZ8WSx6vTaNNT7udxK9MGf6xnL61gaGOtCqvjtcVOeaJOYK8XzCvNrz8Vk2LdIsEOH36BC71khmeaEZT//G3ivE9QokkrXGyiua/0hw1M5QaA4wRr13jCpDG4k+E8CqOI8n3oStZ4fFhQ8RhG6kgsl+VdQgg/QX9pCfddbHrkksYNXk30eVOwVytlIpT9emGX9NcuG7EqGbd8DCTvACPp7BCGUFby7c3XIiKloR7DZ4BWCZ+h3rYFlKaIr6Exky3G8m3eyukSdXDV7YLOvJ2p5/71S+TLYVUwO0hjUZmdxYJQ3tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CDVya4Pi/qTI2Ews7LWPaxgX8eqLLIQ1cz9/VdY2Qy4=;
 b=hzA7F14IkLJSd+8PTF2TVKyth9u69bFv+pLl04mVulL5PT2Avn0z7Kz3F4BJxiITPO2P9JeAXEQ7ZnWigXC2qs/aAeHZNymlfMFAXwwfm+7kGh97V1PfuuISsGxxm3wkP2ACyDBSPEPdBTjcqBNZVgPmbDPvX/CRGypi+5tivuE=
Received: from BN9PR03CA0066.namprd03.prod.outlook.com (2603:10b6:408:fc::11)
 by MWHPR12MB1278.namprd12.prod.outlook.com (2603:10b6:300:10::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Fri, 17 Dec
 2021 22:28:15 +0000
Received: from BN8NAM11FT037.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fc:cafe::2e) by BN9PR03CA0066.outlook.office365.com
 (2603:10b6:408:fc::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.15 via Frontend
 Transport; Fri, 17 Dec 2021 22:28:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT037.mail.protection.outlook.com (10.13.177.182) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4801.14 via Frontend Transport; Fri, 17 Dec 2021 22:28:14 +0000
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 17 Dec 2021 16:28:14 -0600
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [RFC 5/6] drm/amdgpu: Drop hive->in_reset
Date: Fri, 17 Dec 2021 17:27:44 -0500
Message-ID: <20211217222745.881637-6-andrey.grodzovsky@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: aa8e4a8d-9fb0-4477-d706-08d9c1ac846c
X-MS-TrafficTypeDiagnostic: MWHPR12MB1278:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB12788A781BC5DAF73A8F7ED2EA789@MWHPR12MB1278.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:923;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /MowPwhv/aVdXkc+7lIqmZJQqPNopLQMCGtnSJtmZXaXCbAaAjO4diuytG8otLE/fVlUGfKj5ZmrBu0G6V9DKocV7F/QNHGwHrlQeA2ttTLLnxnjv2gsPHnmX7L8ZfCs2DPp1wbYETOrBC62NkWeD0qvv6Ni2vnf05XjrHeMMGF7WfigWb65IPJglR7gs8HIsHvIVF9Ho4aEOwynN0KggiaADSYEkj0ADCjFRT9ghILIQRSq+NeQjUKs52z7opfwRsyslWKR7g3PIzavd+tiV6w0mhEMm7TXGvrwG/wYKiS8vri4gjAc8MdrZqDyPEt7drhgwHobigjkDPnidAChzGHYkodBfH1P5Z/gUPo7xUQ3zh03lMvIbLl3rBc5u3iY3juuzx2Y3vrXFJjjcoMdoc9Xt3p3+iG92FjxoSydbcDkqaMxpNkjLEJ2T5VQFMlcL1hbAvKfqS5izBmURh7RY8Q1b+gnH1aldMRWJyfQOA6CJBiWmmuh8cntNwCZokdcEZlag6K060FW2Gd/5d1K2hix7U8QPIKxR8+Gh9Ty+se5HLMfLp+Lj+d59w1xZuARHPeJ+sV2GxgStcwouw76hUYFUab5M5/AgpIQNK3oEnHxfAuGsfc9661j4igvsbrUFTaq4+dB99UaA/BVbt7/oHvKJL9gIhOtlu3JuYS6LJuJyNkswNXRpjS+Mw6o6oTBxzAP38vFaHyMehS0V1xYbbDuguT6cbx9WtljxMao4wsLMZC7C/hv3prRhzMYx9PaA2axRYltcLd8zGnu24R+2/njamXzpdcYgvVtK8BgSJw=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(40470700001)(2906002)(8676002)(54906003)(2616005)(110136005)(44832011)(1076003)(316002)(336012)(36860700001)(8936002)(83380400001)(47076005)(40460700001)(5660300002)(6666004)(426003)(36756003)(81166007)(7696005)(508600001)(70206006)(356005)(86362001)(70586007)(26005)(4326008)(82310400004)(16526019)(186003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2021 22:28:14.9268 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa8e4a8d-9fb0-4477-d706-08d9c1ac846c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT037.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1278
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

Since we serialize all resets no need to protect from concurrent
resets.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 19 +------------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c   |  1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h   |  1 -
 3 files changed, 1 insertion(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 55cd67b9ede2..d2701e4d0622 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -5013,25 +5013,9 @@ int amdgpu_device_gpu_recover_imp(struct amdgpu_device *adev,
 	dev_info(adev->dev, "GPU %s begin!\n",
 		need_emergency_restart ? "jobs stop":"reset");
 
-	/*
-	 * Here we trylock to avoid chain of resets executing from
-	 * either trigger by jobs on different adevs in XGMI hive or jobs on
-	 * different schedulers for same device while this TO handler is running.
-	 * We always reset all schedulers for device and all devices for XGMI
-	 * hive so that should take care of them too.
-	 */
 	hive = amdgpu_get_xgmi_hive(adev);
-	if (hive) {
-		if (atomic_cmpxchg(&hive->in_reset, 0, 1) != 0) {
-			DRM_INFO("Bailing on TDR for s_job:%llx, hive: %llx as another already in progress",
-				job ? job->base.id : -1, hive->hive_id);
-			amdgpu_put_xgmi_hive(hive);
-			if (job && job->vm)
-				drm_sched_increase_karma(&job->base);
-			return 0;
-		}
+	if (hive)
 		mutex_lock(&hive->hive_lock);
-	}
 
 	reset_context.method = AMD_RESET_METHOD_NONE;
 	reset_context.reset_req_dev = adev;
@@ -5226,7 +5210,6 @@ int amdgpu_device_gpu_recover_imp(struct amdgpu_device *adev,
 
 skip_recovery:
 	if (hive) {
-		atomic_set(&hive->in_reset, 0);
 		mutex_unlock(&hive->hive_lock);
 		amdgpu_put_xgmi_hive(hive);
 	}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
index 8b116f398101..0d54bef5c494 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
@@ -403,7 +403,6 @@ struct amdgpu_hive_info *amdgpu_get_xgmi_hive(struct amdgpu_device *adev)
 	INIT_LIST_HEAD(&hive->device_list);
 	INIT_LIST_HEAD(&hive->node);
 	mutex_init(&hive->hive_lock);
-	atomic_set(&hive->in_reset, 0);
 	atomic_set(&hive->number_devices, 0);
 	task_barrier_init(&hive->tb);
 	hive->pstate = AMDGPU_XGMI_PSTATE_UNKNOWN;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h
index 6121aaa292cb..2f2ce53645a5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h
@@ -33,7 +33,6 @@ struct amdgpu_hive_info {
 	struct list_head node;
 	atomic_t number_devices;
 	struct mutex hive_lock;
-	atomic_t in_reset;
 	int hi_req_count;
 	struct amdgpu_device *hi_req_gpu;
 	struct task_barrier tb;
-- 
2.25.1

