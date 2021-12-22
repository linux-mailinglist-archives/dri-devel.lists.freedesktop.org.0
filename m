Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DED47D91D
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 23:06:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAABC10E35C;
	Wed, 22 Dec 2021 22:05:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2071.outbound.protection.outlook.com [40.107.94.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74F2E10E348;
 Wed, 22 Dec 2021 22:05:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O0ZofkNCqw3ztKi+CaURjbpJZ7FhcLHHpsC9MECm4pREv/9g/3r7K4ZOMBsYM9e0vwq0/33f0ZGcCY/qzQC7DQqpa5CyYLXrwmAHkIK8g3gGQEj3XDNjC90Jl1BrDpdgCCVNJf/Szx/3TQi/QicGJ5Oqnyno2o5EkwLecUewVm7NPcQDOK3+JRPTPGMG45RNW9ntpzeI3MT1n579FCDLxWqRjkfI6Hdx+9sjzEn0owbzdnuY7lAZxVcxZOorO2M4uxSPc51JjLG/8Xvs1mI2841n2FIsXjfX0QkqNWyjaIP608XjzUjaBqG/Jo2vYJ6eGk3FSfVFm7IQ/wwiEGa4lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0jDyLVNTFQabu8nZ8kZWGIAPZD4i5irSpsyZpfcEzBU=;
 b=kwqk5xzAvFKc9sGj3A61asygoamnn0EOxzwQYs/d7NmZyQiKg6/+dWMVXhc+GxKZmQ5ebYranL9/BIaVHN8zdhfkVk54vBihY8DqybYXVBMOmvypf0BuDkKArA7WyCESjc0mUdXIXhSyoY7pdDZDFOK1v4vurCIWT3Lo8wesVJTNSX+ax1SnrFJveXQ4nTuivnnnjYt8KEQr6s3LsFdzPtU4OkSEuZqjCJS4NzNlw1E/9Ba0bWvcMQkPx/rdf0HSknXdhm1BgnRzImZeIkW1R9pcu9lqdU/NoHLhHQW+iEXHTVwtrFDX9wum9h2cLYZzqwNdtdyikk5e0ApbQfrmrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0jDyLVNTFQabu8nZ8kZWGIAPZD4i5irSpsyZpfcEzBU=;
 b=L33qKJjUkaViXsIO2oPXGiKV2q5wsj9FNQniSrO2FCv5MvVsssID/NSPyieF55DTlRbYOxvGkp5HGrT266GFyv09640lhw+8tvqCBBhrx4ALHVmjZer3iTO5FdiFI9W1YPn51ZTrhDEfcwQ0xgw67jNMtOpMvxP59Ej4zho0ip0=
Received: from CO2PR04CA0198.namprd04.prod.outlook.com (2603:10b6:104:5::28)
 by BN6PR1201MB0100.namprd12.prod.outlook.com (2603:10b6:405:59::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19; Wed, 22 Dec
 2021 22:05:55 +0000
Received: from CO1NAM11FT030.eop-nam11.prod.protection.outlook.com
 (2603:10b6:104:5:cafe::5f) by CO2PR04CA0198.outlook.office365.com
 (2603:10b6:104:5::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.17 via Frontend
 Transport; Wed, 22 Dec 2021 22:05:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT030.mail.protection.outlook.com (10.13.174.125) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4823.18 via Frontend Transport; Wed, 22 Dec 2021 22:05:54 +0000
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 22 Dec 2021 16:05:52 -0600
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [RFC v2 1/8] drm/amdgpu: Introduce reset domain
Date: Wed, 22 Dec 2021 17:04:59 -0500
Message-ID: <20211222220506.789133-2-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211222220506.789133-1-andrey.grodzovsky@amd.com>
References: <20211222220506.789133-1-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4ada8295-f72a-482b-9cb6-08d9c5973990
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0100:EE_
X-Microsoft-Antispam-PRVS: <BN6PR1201MB0100CE2E1CE68A830365FB7FEA7D9@BN6PR1201MB0100.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: annruevZrtsiZuclMMPikiK4xml3RdLIMcMiqBc6YAn6enhkBAolROQ8mtXAhNaAMAWdy4W2k6NJPhP79okDdJcwnc9PHRAYRjNFFKgBy2BAB5Be3vXS480YvE3BvDZdIXR4/fVe3kFB5mC49vmvihNE0wim7DN+QNomnrsfXDsrlvNO3d5zmdGZ0oSRzighAzwjuP4/jKmzdOAH9p4QNkhqkFCK6RADk9VkLehjDHEj/7Spxp2OLMZSoeA+juQKdDKaRIZpLFcyKaLNy95BAJYGbrSmeVlpmcte+bMxTQm+S6NKPcwFN3ckoDGUyOPDWxlnYa2VHLzFMlBiKglu+yA/bDBs8E2zbuIIfBKzRn5HdIO/goY22peN1OfmBUOx7Vp1T0CfHh3jhEMQxNTNrXLADeYEG4SOI1PmSX/iUbTgbhex+F3zdR1x9nDvJfLTPRfQ+6G556d3sp4yh0JMZVxMNE4a1aAGyhMnhMC1J6m5mdrQGU0RztLIe9LgbfW0pVHr45rqEXiiHEE2wX+REB88AXx1mOWyiNFyRtemJxaWOonKg5n9QGFVAByO86Xn7UrmYsfufg7fe6Txy6xUI7+Ifva8tr+S8zodMCAi9UVFUcUHRgzJjCOdInLCrkNnR1G6/R77hsiDG5BEPDYF9hdjggYdlRRlMTV04GmfjzDZ7qS5FMjvPjNx532XU7X+9uP+OSj6JE1jIEgXjbixSdZCWIcDuwpnzJDQlP1UPEQ6doZ/YN76QH3p9UHKUP36S9oyLtBUJTg6QEqRiSnKReusPoPA2Oo53ZbGqVrrvjE=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(40470700002)(46966006)(36840700001)(70586007)(44832011)(86362001)(70206006)(1076003)(8676002)(8936002)(40460700001)(4326008)(82310400004)(110136005)(356005)(36860700001)(508600001)(26005)(186003)(16526019)(54906003)(2906002)(7696005)(83380400001)(47076005)(426003)(2616005)(36756003)(66574015)(5660300002)(316002)(81166007)(336012)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 22:05:54.4585 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ada8295-f72a-482b-9cb6-08d9c5973990
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT030.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0100
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, horace.chen@amd.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 christian.koenig@amd.com, Monk.Liu@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Defined a reset_domain struct such that
all the entities that go through reset
together will be serialized one against
another. Do it for both single device and
XGMI hive cases.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Suggested-by: Christian König <ckoenig.leichtzumerken@gmail.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  7 +++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 20 +++++++++++++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c   |  9 +++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h   |  2 ++
 4 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 9f017663ac50..b5ff76aae7e0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -812,6 +812,11 @@ struct amd_powerplay {
 
 #define AMDGPU_RESET_MAGIC_NUM 64
 #define AMDGPU_MAX_DF_PERFMONS 4
+
+struct amdgpu_reset_domain {
+	struct workqueue_struct *wq;
+};
+
 struct amdgpu_device {
 	struct device			*dev;
 	struct pci_dev			*pdev;
@@ -1096,6 +1101,8 @@ struct amdgpu_device {
 
 	struct amdgpu_reset_control     *reset_cntl;
 	uint32_t                        ip_versions[HW_ID_MAX][HWIP_MAX_INSTANCE];
+
+	struct amdgpu_reset_domain	reset_domain;
 };
 
 static inline struct amdgpu_device *drm_to_adev(struct drm_device *ddev)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 90d22a376632..0f3e6c078f88 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -2391,9 +2391,27 @@ static int amdgpu_device_ip_init(struct amdgpu_device *adev)
 	if (r)
 		goto init_failed;
 
-	if (adev->gmc.xgmi.num_physical_nodes > 1)
+	if (adev->gmc.xgmi.num_physical_nodes > 1) {
+		struct amdgpu_hive_info *hive;
+
 		amdgpu_xgmi_add_device(adev);
 
+		hive = amdgpu_get_xgmi_hive(adev);
+		if (!hive || !hive->reset_domain.wq) {
+			DRM_ERROR("Failed to obtain reset domain info for XGMI hive:%llx", hive->hive_id);
+			r = -EINVAL;
+			goto init_failed;
+		}
+
+		adev->reset_domain.wq = hive->reset_domain.wq;
+	} else {
+		adev->reset_domain.wq = alloc_ordered_workqueue("amdgpu-reset-dev", 0);
+		if (!adev->reset_domain.wq) {
+			r = -ENOMEM;
+			goto init_failed;
+		}
+	}
+
 	/* Don't init kfd if whole hive need to be reset during init */
 	if (!adev->gmc.xgmi.pending_reset)
 		amdgpu_amdkfd_device_init(adev);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
index 567df2db23ac..a858e3457c5c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
@@ -392,6 +392,14 @@ struct amdgpu_hive_info *amdgpu_get_xgmi_hive(struct amdgpu_device *adev)
 		goto pro_end;
 	}
 
+	hive->reset_domain.wq = alloc_ordered_workqueue("amdgpu-reset-hive", 0);
+	if (!hive->reset_domain.wq) {
+		dev_err(adev->dev, "XGMI: failed allocating wq for reset domain!\n");
+		kfree(hive);
+		hive = NULL;
+		goto pro_end;
+	}
+
 	hive->hive_id = adev->gmc.xgmi.hive_id;
 	INIT_LIST_HEAD(&hive->device_list);
 	INIT_LIST_HEAD(&hive->node);
@@ -401,6 +409,7 @@ struct amdgpu_hive_info *amdgpu_get_xgmi_hive(struct amdgpu_device *adev)
 	task_barrier_init(&hive->tb);
 	hive->pstate = AMDGPU_XGMI_PSTATE_UNKNOWN;
 	hive->hi_req_gpu = NULL;
+
 	/*
 	 * hive pstate on boot is high in vega20 so we have to go to low
 	 * pstate on after boot.
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h
index d2189bf7d428..6121aaa292cb 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h
@@ -42,6 +42,8 @@ struct amdgpu_hive_info {
 		AMDGPU_XGMI_PSTATE_MAX_VEGA20,
 		AMDGPU_XGMI_PSTATE_UNKNOWN
 	} pstate;
+
+	struct amdgpu_reset_domain reset_domain;
 };
 
 struct amdgpu_pcs_ras_field {
-- 
2.25.1

