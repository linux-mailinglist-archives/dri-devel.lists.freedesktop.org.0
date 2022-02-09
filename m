Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FF04AE5E3
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 01:24:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00F2310E475;
	Wed,  9 Feb 2022 00:23:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2084.outbound.protection.outlook.com [40.107.94.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14D4910E2ED;
 Wed,  9 Feb 2022 00:23:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C/QogOE0ZnMFzlWn4K0FKspFfO64Ik1zFVtUFzmjnikO6C+Q07fNEj1YhXrNDePdEgWgSSk81R0zen7UxxBRvnGa15q6/5w6rYRqDaNTD3StUYpbOSjJLxlreLiSOU9OoTqr3TImpd/CNPf6o7G6nLik3Ss6mS5IpLBl6rcFtlhi1d6muHST+/x5MUYMeRtoDTgfWAW7XW+I2GGs5gPL7yo/A/G56xmxvSH+Xwp0ug9pEoIz3WmdOcDt3qVg2Lk4ajE8CGnov6Jo2qierbBQk+QW59CzuCO2Du8GvJKebn5Vb4iS5iMMaOC9CcZ/h+kUAmFwFspq4pC82u7Ewj35VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5b1lC8EYhbo0pzI7yLmrIlRM4RXnj0UFXsrHR10fMqQ=;
 b=fJHgdDGaqYG0kwVQa1WTmFWxUXUFofNUxpRghkya14Z5JEYkHTjAfVVS7qRF8a/zrdQxc1ipPe7Vu8yF6GuSr1YSljzmoKUm+oCd/aAo0S3w34h0jV388LdKLkbecJDfcnscNi5siJXTwSqFEOuR+pB/Fi9LRim5N2AdG4TQGDVtbNcuVKobUjH8PbmFYM48XfB5v58U/iugNIcebv4uRsWZXPeQmqY/0A3WDJPo8YGw/VUkqtT6Att0kFRiQETZpog2Ejji+iKcaBIgVYl1pB0DaR7jNE3AeVAFQjIKodfVPCUpgjJyYd8YaqgQY7Hw08kLs/95BQSjDL+KzD3p8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5b1lC8EYhbo0pzI7yLmrIlRM4RXnj0UFXsrHR10fMqQ=;
 b=g5eCbUVyBOE+do6HP6Ep0eVabbFXOCnEl+Ymu/flfZsTnCYQ8bz48gLKAKtGtl4su42TPqv+atMYzXwXng7X1jjEgWiJujETC1UTrpFCXgY41hSssIg9jyo/ymft+bPunUfthqSg0/YtFVaZV5Ta9AaMahBi1+mj2m2X74eZG78=
Received: from CO2PR05CA0095.namprd05.prod.outlook.com (2603:10b6:104:1::21)
 by BN9PR12MB5368.namprd12.prod.outlook.com (2603:10b6:408:105::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Wed, 9 Feb
 2022 00:23:45 +0000
Received: from CO1NAM11FT061.eop-nam11.prod.protection.outlook.com
 (2603:10b6:104:1:cafe::4) by CO2PR05CA0095.outlook.office365.com
 (2603:10b6:104:1::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.10 via Frontend
 Transport; Wed, 9 Feb 2022 00:23:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT061.mail.protection.outlook.com (10.13.175.200) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Wed, 9 Feb 2022 00:23:44 +0000
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.18; Tue, 8 Feb 2022 18:23:42 -0600
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [RFC v4 01/11] drm/amdgpu: Introduce reset domain
Date: Tue, 8 Feb 2022 19:23:10 -0500
Message-ID: <20220209002320.6077-2-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220209002320.6077-1-andrey.grodzovsky@amd.com>
References: <20220209002320.6077-1-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8baa2b75-ec88-40db-b785-08d9eb626ed8
X-MS-TrafficTypeDiagnostic: BN9PR12MB5368:EE_
X-Microsoft-Antispam-PRVS: <BN9PR12MB5368ADD143B6AD6B212915A0EA2E9@BN9PR12MB5368.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zs+/4l31p2M33m82ltLOczSS+jpnKNd3yHOufB0+I8s9C7lkZXRBOBpbaqLVh+c/n28od/zgfBf76jrAwNc77N+5rsItrE8WXiRirzhQKv0nYCPHOaOKT2kuOyw3dmKxRjovNsvT69e4pH3p8IK983HBFrRgiTM/yfjUdAYJXvfnPwHf/AyHGJFiRYkGf/kj8zW5B+OTlb5C9saCab5/MCm6vuMbYmlQ1C7bnfVF+cfb0ZvGOKmhOCERJlaWNtDdqAlWhZdWKvj51zrh6FbPtHjQ3OqINozXk1fNBnCDo0NDi1+qmN0Gp9/joaENHZJWt93gmoFSi05hrI+y9yYxUMsRoI3SL71EclGQqPK4ncnmIfFkR3LtIrPm4GrCRZ8xtugne40zF9lLxsKtSjzl05UMcZKBwJjL6v2aCKmPWgkTmLYH37XabsGMkfmDcymkyMlpbQBgXL39OqYt/uF14iVuQBaDIAPPVOPZReHtvzzBzFCuxgNWjCJyYMfszIQkVzZ2K3QIr3zO9UKIFbDhGzaq3SdTkxyVz4ey9SHIGlhNwrriOhk9Q1o7mEaNHttqWdJCGxCWf6QOQ9Ld9RhEUPFVKiLAJ10ODFeTTSO2DBhJ1SB0nM7oiin/aHWJWYvvaDxxWTGK6x+UCQf8y40muxM2gbNU1VH4wkbPjQYcMgHJolMLYh/K4JvoCqrahk5Wom3p7PUm74eWSsA6DDqGHA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(5660300002)(44832011)(70586007)(8936002)(2906002)(81166007)(26005)(16526019)(83380400001)(8676002)(54906003)(186003)(336012)(70206006)(4326008)(36860700001)(110136005)(86362001)(316002)(82310400004)(508600001)(2616005)(356005)(6666004)(1076003)(66574015)(36756003)(47076005)(426003)(7696005)(40460700003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 00:23:44.6779 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8baa2b75-ec88-40db-b785-08d9eb626ed8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT061.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5368
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
 lijo.lazar@amd.com, jingwech@amd.com,
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
 drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  5 +++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 20 +++++++++++++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c   |  9 +++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h   |  2 ++
 4 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index d8b854fcbffa..b76c1cfad7f1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -813,6 +813,10 @@ struct amd_powerplay {
 #define AMDGPU_RESET_MAGIC_NUM 64
 #define AMDGPU_MAX_DF_PERFMONS 4
 #define AMDGPU_PRODUCT_NAME_LEN 64
+struct amdgpu_reset_domain {
+	struct workqueue_struct *wq;
+};
+
 struct amdgpu_device {
 	struct device			*dev;
 	struct pci_dev			*pdev;
@@ -1100,6 +1104,7 @@ struct amdgpu_device {
 	uint32_t                        ip_versions[MAX_HWIP][HWIP_MAX_INSTANCE];
 
 	bool				ram_is_direct_mapped;
+	struct amdgpu_reset_domain	reset_domain;
 };
 
 static inline struct amdgpu_device *drm_to_adev(struct drm_device *ddev)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index ed077de426d9..9704b0e1fd82 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -2398,9 +2398,27 @@ static int amdgpu_device_ip_init(struct amdgpu_device *adev)
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
index e8b8f28c2f72..d406897346d6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
@@ -398,6 +398,14 @@ struct amdgpu_hive_info *amdgpu_get_xgmi_hive(struct amdgpu_device *adev)
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
@@ -407,6 +415,7 @@ struct amdgpu_hive_info *amdgpu_get_xgmi_hive(struct amdgpu_device *adev)
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

