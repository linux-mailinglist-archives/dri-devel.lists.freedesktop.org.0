Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 740927153E2
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 04:44:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A49B410E32F;
	Tue, 30 May 2023 02:44:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2083.outbound.protection.outlook.com [40.107.94.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EDB110E32B;
 Tue, 30 May 2023 02:44:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fTmwR1mzNCXnzeLfORj3QIctkO74sHVHmP+2tiYwiFBnUCiNXJ8z/jSLvNpURTsx4HMG3GnW/0y7YswX7kggBSdnXXt3/UywwfbQ7HXFa3oDkUpeciqjWyw9OVzlIOJmT6GI3l2Qpx8sdS2aBHQWEOwZ7IxIB9kooX3lqboucu4RoBtH8SU4ZbLPz2beEhIodJR1c1EJGVBT6QZwLXMqen9oWjxg9E1omSZKaUGwUi0BTUNQ26bjwI3KqTAoedPkcfi/IVVRu3fwA8niF92t3F4N/T56AsUCla0BpiVztQmCAawLbtuXDEPPbwI34jDACdjXORSIZupK04yUt63//Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D5BWoNQzZsM1yKgT8FJmEZMD/hQq9cCO7SKM+IQtK/0=;
 b=Mx+lo9OqXoFO/5Nzl7GqtBVxRCoA2qR0j6OViMv2Hj3V7pUyGsaDX6wNW3BbbfQSsrU06r4x1spRcmiUhnexNummcMwk7PRKLZ4pkaiIV/Skx4cnZfRGDZ4hWa79/EWv35HO1BT17jUgXvJ9GuBpDL8ldbHJyoRIdF0LVUojEVp34uwa/dJ6uTcmanW7XBW4LKLpsBSWs8RxBW5J01zVMokTQjg0NCSdWoVzW392yTKzjcToemCLfQhxapl1vYlHipK9pVrN4u+EgAHCKKjJzUqCDvVjZdvXMUgpcxCjavK4y7ubU2QNsug1WBkoNmMq16MbaVjrNxudW/OgU5/QXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D5BWoNQzZsM1yKgT8FJmEZMD/hQq9cCO7SKM+IQtK/0=;
 b=TVuHs5bfQcP9Fe3g5il25LnjLnlamxqG0WPhFnIA7GRsRndBZjPjoMqCRiX+FyE2xK1pwu6JOF28SUDRpSgOxXf+cPcegJWSvYwIkScp1+FSwL3vwr+vzNrac0wAIxIt99MamP67Q6N6zIKYodh6RoJ1FE6C+FmKbOuN4OcGxzc=
Received: from BN9PR03CA0513.namprd03.prod.outlook.com (2603:10b6:408:131::8)
 by CY8PR12MB7708.namprd12.prod.outlook.com (2603:10b6:930:87::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Tue, 30 May
 2023 02:44:00 +0000
Received: from BN8NAM11FT049.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:131:cafe::85) by BN9PR03CA0513.outlook.office365.com
 (2603:10b6:408:131::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23 via Frontend
 Transport; Tue, 30 May 2023 02:44:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT049.mail.protection.outlook.com (10.13.177.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.21 via Frontend Transport; Tue, 30 May 2023 02:44:00 +0000
Received: from equan-buildpc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 29 May
 2023 21:43:54 -0500
From: Evan Quan <evan.quan@amd.com>
To: <rafael@kernel.org>, <lenb@kernel.org>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <evan.quan@amd.com>, <kvalo@kernel.org>, <nbd@nbd.name>,
 <lorenzo@kernel.org>, <ryder.lee@mediatek.com>, <shayne.chen@mediatek.com>,
 <sean.wang@mediatek.com>, <matthias.bgg@gmail.com>,
 <angelogioacchino.delregno@collabora.com>, <Mario.Limonciello@amd.com>,
 <Lijo.Lazar@amd.com>
Subject: [PATCH 7/9] drm/amd/pm: add flood detection for wbrf events
Date: Tue, 30 May 2023 10:42:25 +0800
Message-ID: <20230530024227.2139632-8-evan.quan@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230530024227.2139632-1-evan.quan@amd.com>
References: <20230530024227.2139632-1-evan.quan@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT049:EE_|CY8PR12MB7708:EE_
X-MS-Office365-Filtering-Correlation-Id: ecda4d38-3830-4d04-87ac-08db60b7b92d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VpYjlDWmymBGMIhBzbbbaJ4EQbI2A5J3XeuwAdY1hRnRvA5DqCwP9CUFhzXR+OL+lrktw1JHz3ezyGHxhPX+vUI4ncLfTISxIvtVIutqmw+NKtRe2mk0z9hzbvQSwwjIX4zp6j6s5sDHrVDxpYJi+3sXYfRcKAZQE36ruy2dratNa+aB6iTOn+TT7lzzCcVf7Ux6cA+N0zFlkfadP4enwG4OPBNfHgGi4GG2K5i65U8Znu9lZCwFyw3oXX7kdgmYI0tosN1K7oCx8X2tBdLrvBiqjUeAf0mfRCJmsRE/uLo7IZnqfX9URXeg/HTCw7LufH+fIZZOQb6DWdnWwaDjT00/cAqcGafyTFOFZY4EhjWkwDlKzGdO2VdYMgYPonPPuaD76ipl5GvTPVtimp3I6/0aF0Lqn/WUCNRvgdzAUGQYubAXicfmDw4z/EjBV4M6g4SUUarFKzHTeH/njDfFWxCWGMiUbwUfTb/rUblvRzou0ImVG1+niq+3w0swMZqFsqq6Ad2bFLWcXXN7/I3NJJy+h4UdgTt6ihbP4BEnJ5hWyJ6mox1tnk5ajCLVj90eGtJzLhEP9LesTxusNI+3vNqSkS0/C9ncG5t7D0NWmPe5uSuQNuDue4kzHK2xKli+PSQxFnIaVI8lokua79qBab0wIud/tYZ4SMG00ioj22lAALjRnHgofU/hm+HXXtDLoEOGKkYzgYPUD/oyLx5zl0JRreyqkYV2xSElQ1vOxsn99KC+CKl5wzvic/d7Uk9Qtbmaz1+qk4ILRPOBuh6QZgiOFntVnAELyS0ydbjFuUw=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(136003)(346002)(39860400002)(376002)(451199021)(40470700004)(36840700001)(46966006)(336012)(426003)(16526019)(2616005)(41300700001)(83380400001)(26005)(1076003)(186003)(6666004)(7696005)(36860700001)(47076005)(478600001)(110136005)(40460700003)(54906003)(70206006)(82740400003)(6636002)(4326008)(82310400005)(40480700001)(356005)(921005)(316002)(81166007)(7416002)(8676002)(70586007)(44832011)(86362001)(36756003)(2906002)(8936002)(5660300002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 02:44:00.4170 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ecda4d38-3830-4d04-87ac-08db60b7b92d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT049.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7708
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
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-acpi@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 ath11k@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To protect PMFW from being overloaded.

Signed-off-by: Evan Quan <evan.quan@amd.com>
--
v1->v2:
  - utilize the delayed work(Lijo, Christian)
  - split the new module parameter changes out(Christian, Alex)
v2->v3:
  - simplify the flood detection further per latest design
v3->v4:
  - drop unneeded wbrf_mutex(Lijo, Christian)
  - use schedule_delayed_work() to avoid possible concurrent
    access(Chrisitan)
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

