Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFDE6729109
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 09:30:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92DCF10E643;
	Fri,  9 Jun 2023 07:30:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2067.outbound.protection.outlook.com [40.107.243.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C4BB10E64C;
 Fri,  9 Jun 2023 07:29:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QDF2P/3wRZ/a2eTt7g3KFdxx+NTUvCiUjc9vpBJ2g/N7/49mbXolBP1TPQJgBXkWm+jfe3fJBEeHDc/RuYF1orW/B1A9QuPfHii5O6qvo0hN0SF2poAv3QKJDJJtKNIhRDl3gOkFc58CVqhXqW09ScUNSwsYzHiyinSYe3VJedpF6/dheMsL3LvjrOG0v5KDpaWQjkxVa82zYnnlO4TjT3I1G+ekp0iqMqVTRtHtrm9aLAbTjnOU9FTXPiQGk8EIDdAPu4eH9ROHlfF1ID4ycQIy/9ay+CUyqS0tj68vxGbqQNrI33setV5Z5mJgB45LFO5rBo2vO4Wsi2gGDQcMOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w2vAmDKr5lEouUGHRYcDaTacr7hNBq+6N/BBGVsYBsE=;
 b=UYSJtrLgwTwYwP4MPe2Z90u2gRiJ4t5IQHWo5JnG76KtZ4C2gpx4X8B+CHDI7rJCzycCohtE01yMmigPx12hO5eKncPupt/UCbB/n9kluxxj3KxB/yuvpWv5AI1XtLrTLENUv1Y+WDMm8zZ9ISWr33K/natLHAnW0NxGrUf4AnleHI1+uDIs30nHluzswaHMAlHi+sQte2FTE9hO0ESk+kwBp/XE8ALKNN6b9vNEudA0P1DeAciNGBF65QL2ct6kVRYneKhVPokQXdpueeRIX/VEIdCYYi2q6clx3I56FfwBnpwbA0N+F+YvK2Y2Pd+qSdfIKjhMRxmSUHHRcuguXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w2vAmDKr5lEouUGHRYcDaTacr7hNBq+6N/BBGVsYBsE=;
 b=nelv98gHG7t1rK7adMgSIgnCER5IWjPo8wsS6hhgJQC0V3u99+tLzhIkGxRbj0fIkC/176y+2kocsrEORIVeFm9V4I8pgcIR4a8YEKXR2PHH1FF3xEzOFHU16DT2G0KPJ+Msm/lmdoaCi+MOQofyjFvMcvYuzLizn0wgufeSrkQ=
Received: from DM6PR08CA0005.namprd08.prod.outlook.com (2603:10b6:5:80::18) by
 PH7PR12MB5950.namprd12.prod.outlook.com (2603:10b6:510:1d9::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6477.19; Fri, 9 Jun 2023 07:29:51 +0000
Received: from DM6NAM11FT039.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:80:cafe::61) by DM6PR08CA0005.outlook.office365.com
 (2603:10b6:5:80::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.27 via Frontend
 Transport; Fri, 9 Jun 2023 07:29:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT039.mail.protection.outlook.com (10.13.172.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6477.27 via Frontend Transport; Fri, 9 Jun 2023 07:29:50 +0000
Received: from equan-buildpc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 9 Jun
 2023 02:29:44 -0500
From: Evan Quan <evan.quan@amd.com>
To: <rafael@kernel.org>, <lenb@kernel.org>, <Alexander.Deucher@amd.com>,
 <Christian.Koenig@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <kvalo@kernel.org>, <nbd@nbd.name>, <lorenzo@kernel.org>,
 <ryder.lee@mediatek.com>, <shayne.chen@mediatek.com>,
 <sean.wang@mediatek.com>, <matthias.bgg@gmail.com>,
 <angelogioacchino.delregno@collabora.com>, <Mario.Limonciello@amd.com>,
 <Lijo.Lazar@amd.com>
Subject: [PATCH V2 5/7] drm/amd/pm: add flood detection for wbrf events
Date: Fri, 9 Jun 2023 15:28:44 +0800
Message-ID: <20230609072846.1552238-6-evan.quan@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230609072846.1552238-1-evan.quan@amd.com>
References: <20230609072846.1552238-1-evan.quan@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT039:EE_|PH7PR12MB5950:EE_
X-MS-Office365-Filtering-Correlation-Id: 66a400b8-8dba-43a0-9679-08db68bb4fb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WDY133QC64MqTbuDNoF38fOdgeEipzRxW+rrvjU7cyjPk+EAR4XzyFTl3bRjnLAgXnmaOBYt9DmtSKdAG3mqPQ4HCUmH6sSVsr0br2Wb01KnfDBEjdNkD4tWdkuXsY7c97fMnegrUuYzTOhr0hWgCNIrlNn4ZV1zD+OzaxDtvyxueQSTfI+k3Fa8zsOwCWifsUL0vZqmBc9BCZgp3y6C7HYpujbnhVoV5GAcDv3pP3boikGEpTwaQk/3erreCwLcHV70P8skuOop4YH9ofCcjL6Jata65iDJ9UkmworO/JcQ43P2gi6/4zy/t/5+JkS1WFYQpCDfNbgWJ79mqC1xb9JrFCouGvRG9MTG5yN/Vn8xlMBi9nQgA5MF8HVD/T0c8wkLAOg1HtzOBM3MO8JQyUUxynNw/2K90dtsaJ+WMoWn5kgyqMb9OLrm/hlU5bKRy7JwmqVih5uKTu8SeSWnCJ78z4rMtZAyuXOSse2sW/fANoP+4cN6gQBK1hH9q0S4r2Vgg7JdP3QOa94Qx80Qyf9ggy3R1fBFBDfl2MwuLJiJPGFYLv7BLJ3ku2JnyoPTRWRvN88jyEwHvtUh+yJMLco3bI+21RDMIcZ7XAhWKiXKfawzlxPikXSBaioph7m5kchhqg2mtpVTjghdtWn/IZ3fsR4v7LbP4VsKEZbLzXRVP1Ca44pV8Gpgx3iGFYtf0cXaDhP8/jY1MeqC7rPyEzdq0xDYK2U46qhmcMSHnwkLnJo+4I6qd1bqERvV2v6FwHqlP2reSISKa97Wq02f+eJw6PMyuaNxnTC4snbkqys=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(346002)(396003)(136003)(39860400002)(451199021)(40470700004)(46966006)(36840700001)(16526019)(478600001)(186003)(1076003)(26005)(36860700001)(83380400001)(426003)(336012)(47076005)(2616005)(40460700003)(40480700001)(7696005)(8936002)(316002)(8676002)(86362001)(82310400005)(41300700001)(82740400003)(70206006)(81166007)(36756003)(921005)(6636002)(356005)(70586007)(44832011)(7416002)(4326008)(2906002)(5660300002)(110136005)(54906003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 07:29:50.7749 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66a400b8-8dba-43a0-9679-08db68bb4fb5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT039.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5950
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

