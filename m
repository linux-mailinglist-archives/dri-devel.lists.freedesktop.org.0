Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD1E732824
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 08:59:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5226D10E5B2;
	Fri, 16 Jun 2023 06:59:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20602.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e83::602])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6764810E5B2;
 Fri, 16 Jun 2023 06:59:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kM0ton+zF8dFNeDKRhZY6EU2ltMFCtYrpAN7/9K2fHgW7kbzhJ0Bi2HxvRQ7Lnyneoa3YWxJztoMwD0ZzOwaVl5qg7qtPv3SZiQFViHzHiv032bwmp25m1pRIhlf+z51mAaF+I6wdKQwi5yhIrHdMrxookinzFykK46GxARmqmEKTHFAPyoXDgARPjtjhD3L10DVo3npeOkJzup5sPhxTg6Ar2YTqdPsQB+IUkFPn2kJG0ZDbov6sFG5uPU1mue1D3NuMn+4c0cm+ssLMDGIWL4V2BxHDtyp58g2oN8pVKya8FNW4KTFK83gBNCydHwLBWA7vIPkEoJPPimrNCBahg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w2vAmDKr5lEouUGHRYcDaTacr7hNBq+6N/BBGVsYBsE=;
 b=Wa3YCEjeP0ag2CXeueV1N/zTVycSgHzotUPxbwW8dwTBwVg/Iu5VXYm8114zJoww8eXInFPwxMdUN74/o1HSEPhnlk7IoXi6yhDW33FnsPNtwCcpAMZdkTRAFKsI1vnlOeNYkTpNiSRGzeqYh1HogOQt2LmYlm+VcjEAx1LpsjD/KYhP/cXiQkXInb3ctS4SqhwmMA28y6fL+Zeb770qQ7slRMHJZGYFeKTSxwgG+QhhunUjJH9934M7g83CcgVwR33s6IzCuqoSOvKudcxnAHoNd9V9eFV5TfzKoZzCAbZNGw1ZKcYv3kFAfEYtbE/GOT9kCHQpJBqALMXDoNo7fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w2vAmDKr5lEouUGHRYcDaTacr7hNBq+6N/BBGVsYBsE=;
 b=NB0ExcSTxAnPmCqhfJPBrzhz6ncpCcNoheRhcFKillw417ikbCRbuBvCYqubvRfksC+T6DKqih7XebMGvsLc7k3OFVMgW0l4+fM3X1b53KdmggyCJZ4NlVWklL9KeoY7VJIGXZm+O3TpXBjYHCoXqdk746ohG3Hfw8ebVyD+aLo=
Received: from BN9P223CA0019.NAMP223.PROD.OUTLOOK.COM (2603:10b6:408:10b::24)
 by CY8PR12MB8361.namprd12.prod.outlook.com (2603:10b6:930:7b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.27; Fri, 16 Jun
 2023 06:59:23 +0000
Received: from BN8NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10b:cafe::88) by BN9P223CA0019.outlook.office365.com
 (2603:10b6:408:10b::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.27 via Frontend
 Transport; Fri, 16 Jun 2023 06:59:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT003.mail.protection.outlook.com (10.13.177.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6500.29 via Frontend Transport; Fri, 16 Jun 2023 06:59:22 +0000
Received: from equan-buildpc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Fri, 16 Jun
 2023 01:59:16 -0500
From: Evan Quan <evan.quan@amd.com>
To: <rafael@kernel.org>, <lenb@kernel.org>, <Alexander.Deucher@amd.com>,
 <Christian.Koenig@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <kvalo@kernel.org>, <nbd@nbd.name>, <lorenzo@kernel.org>,
 <ryder.lee@mediatek.com>, <shayne.chen@mediatek.com>,
 <sean.wang@mediatek.com>, <matthias.bgg@gmail.com>,
 <angelogioacchino.delregno@collabora.com>, <Mario.Limonciello@amd.com>,
 <Lijo.Lazar@amd.com>
Subject: [PATCH V3 5/7] drm/amd/pm: add flood detection for wbrf events
Date: Fri, 16 Jun 2023 14:57:55 +0800
Message-ID: <20230616065757.1054422-6-evan.quan@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230616065757.1054422-1-evan.quan@amd.com>
References: <20230616065757.1054422-1-evan.quan@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT003:EE_|CY8PR12MB8361:EE_
X-MS-Office365-Filtering-Correlation-Id: c4befece-993d-4af1-2633-08db6e3736ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ld13y2Xr9KvvTE0ZNHxyQtYyE1E6mEcd9zMXbNueFL5Iu3C+YUU/7EEZ4zPqp/LzCUvgnVzDfgruJ4z/ofZ/fqrGg3XDfjMo6sNnBljmsB02SMxQAiib/xeIBSGyqJrvpbFA21EkGJftyuPkYwsljEWRc8g3izerLRMXb2iwKwDFE65UIKDkPIofwJ/VHTnn1wKLy9/Skh1ffwLGzGms8EyoAhykHZihXfMHQse8aETIpK5Cl3GTBvhwE7JiNfOlQdBjFbEs4l8zO4fw70mnzAIATgqLPInpaDKyVRw6/rKyZM7IfO4CxIcal8GkW193x5f4DQ7TK+6SbCxSOkkQhnp6V/4yCjZABhsnzz5gm+wFzIJ9cZf5SSzxDzpnhRmIInTJtFbXy0VwS4WU8C9vNhSHMnb3eWKHOUpAvnqwO3SrdDR5TTFnCHNIDnMJtDd45kg5af0L100fwD/q1qkC6ui0tYsABDdKu7II0yl+vpbN/cyYTd89LdrjQVyNp5bHL9sngjFsfhBbCTHPKkZTWL1gl6eYFCDQUzRGWXNGTSTe1TZ6KzJy3kVh6snTm4rG+SVpYWpSca1sc+AROVgEDp7P1cRjUYiGNlNe6Rq0tuHNqGsAYAn8RfIF1x869niIq5WTTesSAzl8YwVdReBY0pvUG3mtwF88bxN5hkCWPzo4lRf4HNqoXCSNwB/4CxmXqS7rMXyRyNia6Nf7TbSeStAMSTu9KF9WamglKrd46UMtAGBABDE5lo5iI49dFwPxFLryF5at4268ThBy7KBYmy9qKm1p36UXCKbIZCq5E1A=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(136003)(396003)(39860400002)(376002)(451199021)(36840700001)(40470700004)(46966006)(5660300002)(478600001)(54906003)(8936002)(40480700001)(41300700001)(316002)(8676002)(7696005)(1076003)(110136005)(7416002)(16526019)(44832011)(186003)(4326008)(6636002)(70586007)(70206006)(6666004)(26005)(2616005)(47076005)(83380400001)(40460700003)(36860700001)(336012)(426003)(2906002)(81166007)(921005)(356005)(82740400003)(82310400005)(86362001)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 06:59:22.6487 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4befece-993d-4af1-2633-08db6e3736ef
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT003.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8361
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
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-acpi@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Evan Quan <evan.quan@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To protect PMFW from being overloaded.

Signed-off-by: Evan Quan <evan.quan@amd.com>
---
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c     | 28 ++++++++++++++++---
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h |  7 +++++
 2 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
index 89f876cc60e6..2619e310ef54 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
@@ -1272,6 +1272,22 @@ static void smu_wbrf_event_handler(struct amdgpu_device *adev)
 {
 	struct smu_context *smu = adev->powerplay.pp_handle;
 
+	schedule_delayed_work(&smu->wbrf_delayed_work,
+			      msecs_to_jiffies(SMU_WBRF_EVENT_HANDLING_PACE));
+}
+
+/**
+ * smu_wbrf_delayed_work_handler - callback on delayed work timer expired
+ *
+ * @work: struct work_struct pointer
+ *
+ * Flood is over and driver will consume the latest exclusion ranges.
+ */
+static void smu_wbrf_delayed_work_handler(struct work_struct *work)
+{
+	struct smu_context *smu =
+		container_of(work, struct smu_context, wbrf_delayed_work.work);
+
 	smu_wbrf_handle_exclusion_ranges(smu);
 }
 
@@ -1311,6 +1327,9 @@ static int smu_wbrf_init(struct smu_context *smu)
 	if (!smu->wbrf_supported)
 		return 0;
 
+	INIT_DELAYED_WORK(&smu->wbrf_delayed_work,
+			  smu_wbrf_delayed_work_handler);
+
 	ret = amdgpu_acpi_register_wbrf_notify_handler(adev,
 						       smu_wbrf_event_handler);
 	if (ret)
@@ -1321,11 +1340,10 @@ static int smu_wbrf_init(struct smu_context *smu)
 	 * before our driver loaded. To make sure our driver
 	 * is awared of those exclusion ranges.
 	 */
-	ret = smu_wbrf_handle_exclusion_ranges(smu);
-	if (ret)
-		dev_err(adev->dev, "Failed to handle wbrf exclusion ranges\n");
+	schedule_delayed_work(&smu->wbrf_delayed_work,
+			      msecs_to_jiffies(SMU_WBRF_EVENT_HANDLING_PACE));
 
-	return ret;
+	return 0;
 }
 
 /**
@@ -1343,6 +1361,8 @@ static void smu_wbrf_fini(struct smu_context *smu)
 		return;
 
 	amdgpu_acpi_unregister_wbrf_notify_handler(adev);
+
+	cancel_delayed_work_sync(&smu->wbrf_delayed_work);
 }
 
 static int smu_smc_hw_setup(struct smu_context *smu)
diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h b/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
index ff0af3da0be2..aa63cc43d41c 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
@@ -478,6 +478,12 @@ struct stb_context {
 
 #define WORKLOAD_POLICY_MAX 7
 
+/*
+ * Configure wbrf event handling pace as there can be only one
+ * event processed every SMU_WBRF_EVENT_HANDLING_PACE ms.
+ */
+#define SMU_WBRF_EVENT_HANDLING_PACE	10
+
 struct smu_context
 {
 	struct amdgpu_device            *adev;
@@ -576,6 +582,7 @@ struct smu_context
 
 	/* data structures for wbrf feature support */
 	bool				wbrf_supported;
+	struct delayed_work		wbrf_delayed_work;
 };
 
 struct i2c_adapter;
-- 
2.34.1

