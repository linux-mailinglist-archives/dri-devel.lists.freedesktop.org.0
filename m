Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BA47771A4
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 09:41:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 947CE10E4F2;
	Thu, 10 Aug 2023 07:41:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062.outbound.protection.outlook.com [40.107.223.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02BC810E4F1;
 Thu, 10 Aug 2023 07:41:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FwRBai9A/XZwSRmHBqCfMW2bHShikRgs0/aMcRwPQ5AFBHzxknh/6D6HQ50Zey9gmaCZ9+D09EHTeoAna9iFIg6TZjb6extzxKGWr8vncQ1IAT9zqTBczXv4Lq4yMKvfAQ7ANf5b7YYdj9sgOvVMGX0sn0ps2WPZQJblkKzdG9OwB3RuYmU5GBzzfIiDRoyAyFgm4jaiR8DtbivbJxQiD3zv77lrdJJRn92EA3C58cmHAZSLIM6QS+uAi9/Juir1hV/69pMNWG3xDLjKBfisCbpPlK7nze/+qbXmsv7vnAJlxLPkM5PHYPu1GTw7Ycp5p1wZ8l2bIp36SHKawTB2+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XSR6QCoMxbBXa8p/1+youpYsXRQcxwhwWUT8fxMX9yU=;
 b=IDY25WF/Z1j3AfplSTioXe/AkW7FbHkIt4egpBOpPurSyGpi02kHVatetr+2IJnO5QKIOKlUvH9GyXprwjSy1sEeZFFbChQNrCEAeDZzHsk0tUCzEKR1mr0KCMHgrzr+OOi5oibAGBmEMKC+l68tndKiNi7Z4b7RkMvw0sCPfKahms1H2617FTfdWJrxoOThOMZzPKjzTsGKEhC/GBi6yLJMhmV5uGc6aWj/FvGNketDF+zOnxo64feskQj/1mZWJ0cthud46iWMDx42BkCwRf30sjixNjelFnlozWBAkhV7AuNOS7CxXRVv7KLPogJzVC6wBk/790rm3oQLnLZtxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XSR6QCoMxbBXa8p/1+youpYsXRQcxwhwWUT8fxMX9yU=;
 b=xu8akgUysbGFd+H5V3Z/SPINgLXt1WZURETe63ZEDAbkJ5cBvfIZELiR9FAxYdEvJvebAuMsGM/BkckvdpY4VnpBGE7cnLClZ1p18s7QBzrOXw5Y4Z75wfm5Hx147RG+qUwc6jXjtD3CRvpB5KjCjbuNNj3ffaz6OADtUxOTuVM=
Received: from CY5PR15CA0217.namprd15.prod.outlook.com (2603:10b6:930:88::6)
 by MW3PR12MB4444.namprd12.prod.outlook.com (2603:10b6:303:5c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Thu, 10 Aug
 2023 07:41:43 +0000
Received: from CY4PEPF0000E9D3.namprd03.prod.outlook.com
 (2603:10b6:930:88:cafe::a1) by CY5PR15CA0217.outlook.office365.com
 (2603:10b6:930:88::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30 via Frontend
 Transport; Thu, 10 Aug 2023 07:41:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D3.mail.protection.outlook.com (10.167.241.146) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6652.19 via Frontend Transport; Thu, 10 Aug 2023 07:41:42 +0000
Received: from equan-buildpc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 10 Aug
 2023 02:41:17 -0500
From: Evan Quan <evan.quan@amd.com>
To: <rafael@kernel.org>, <lenb@kernel.org>, <Alexander.Deucher@amd.com>,
 <Christian.Koenig@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <johannes@sipsolutions.net>, <davem@davemloft.net>,
 <edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
 <Mario.Limonciello@amd.com>, <mdaenzer@redhat.com>,
 <maarten.lankhorst@linux.intel.com>, <tzimmermann@suse.de>,
 <hdegoede@redhat.com>, <jingyuwang_vip@163.com>, <Lijo.Lazar@amd.com>,
 <jim.cromie@gmail.com>, <bellosilicio@gmail.com>, <andrealmeid@igalia.com>,
 <trix@redhat.com>, <jsg@jsg.id.au>, <arnd@arndb.de>, <andrew@lunn.ch>
Subject: [PATCH V8 7/9] drm/amd/pm: add flood detection for wbrf events
Date: Thu, 10 Aug 2023 15:38:01 +0800
Message-ID: <20230810073803.1643451-8-evan.quan@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230810073803.1643451-1-evan.quan@amd.com>
References: <20230810073803.1643451-1-evan.quan@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D3:EE_|MW3PR12MB4444:EE_
X-MS-Office365-Filtering-Correlation-Id: c79b746d-3434-4faa-b682-08db99753dd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3Zh5QNK2bGGP23L9wenkueGOJDPQBUQ0Qmkbv6ouTKUKQsxqSSa95q7SOViGO8yOEb6VZWJV3Z/F5Ay1/KfhOeHczewvcrEPmXMSvA39vQ8J1w+sdJElN3aJ8qn0GSigqHZPdoQ81haPP1iZmYt/HCzmy4Z5jx0wCH24F2bWwqKv+PrG3p2tufJv2OxPn95nXXKuyh5JWwy4uQzjdBKxj+2pImbT3shUTSuNWrq/pcbSiD0HmJamAOL40oOrSFoQ7Odq8Bt9l+8RYmGolGydyU77u3ffv1wlbx3M51IA0ycUoKLGKkq3Dtlo/Kl9drViox+cjNK6ed6qpR7koAaE779SAHLhBNGJyeyVZ8Fsv6vxMIsN3/7fFhf1WAqEMarbipmY3POxgEGY+t5NJQ+q7qccyiC2s984EyeSflFnon4oHaPIYubsjvFsCOpEHEpZVe/jFAzavjw2xaow8ljLU1VLPyCVevPtp8JSmXW+nNxpess5uu64Gem2XgTP0JNz2r/ttNZQVEbGGORhni4BqAWV1QwNe+WTDKynrzyMwxUGev8shlh7fGlUDy5wiYVP+RLtWnho+tzWP6F5D1u4KxZIvXYkhA0gdPhmJsQSpgUXVpRMgjtwL0fycAW/Cor+HhpuZh9B8Xx7ORFPgzPy4pWzs1DW8tchIFridKzTyK993p+p59khIh2VN7fJcktxutOZXWxcEN+n3GgrpdvrngNXaWaws8Swjw0zF7x18RwDlQJ1IWVZdLM30IFUxYR5kH1kA08PVb4xY/Sy+Vd3wembZ0pJy7oBp4+I8TXvjA2VfbCfkSf1uHSU3TLii4gQR81mcwv/LROwX+916RneRg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(136003)(376002)(39860400002)(346002)(186006)(82310400008)(451199021)(1800799006)(46966006)(40470700004)(36840700001)(6666004)(83380400001)(356005)(2616005)(40480700001)(81166007)(47076005)(40460700003)(2906002)(82740400003)(426003)(921005)(478600001)(41300700001)(26005)(1076003)(316002)(16526019)(336012)(36756003)(70206006)(70586007)(36860700001)(4326008)(110136005)(54906003)(44832011)(7416002)(7696005)(86362001)(8936002)(5660300002)(8676002)(36900700001)(2101003)(83996005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2023 07:41:42.9275 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c79b746d-3434-4faa-b682-08db99753dd0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4444
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
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-acpi@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Evan Quan <evan.quan@amd.com>, Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To protect PMFW from being overloaded.

Signed-off-by: Evan Quan <evan.quan@amd.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c     | 31 +++++++++++++++----
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h |  7 +++++
 2 files changed, 32 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
index 163037bd6d16..aa5e1123ac0a 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
@@ -1318,7 +1318,8 @@ static int smu_wbrf_event_handler(struct notifier_block *nb,
 
 	switch (action) {
 	case WBRF_CHANGED:
-		smu_wbrf_handle_exclusion_ranges(smu);
+		schedule_delayed_work(&smu->wbrf_delayed_work,
+				      msecs_to_jiffies(SMU_WBRF_EVENT_HANDLING_PACE));
 		break;
 	default:
 		return NOTIFY_DONE;
@@ -1327,6 +1328,21 @@ static int smu_wbrf_event_handler(struct notifier_block *nb,
 	return NOTIFY_OK;
 }
 
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
+	smu_wbrf_handle_exclusion_ranges(smu);
+}
+
 /**
  * smu_wbrf_support_check - check wbrf support
  *
@@ -1357,12 +1373,14 @@ static void smu_wbrf_support_check(struct smu_context *smu)
  */
 static int smu_wbrf_init(struct smu_context *smu)
 {
-	struct amdgpu_device *adev = smu->adev;
 	int ret;
 
 	if (!smu->wbrf_supported)
 		return 0;
 
+	INIT_DELAYED_WORK(&smu->wbrf_delayed_work,
+			  smu_wbrf_delayed_work_handler);
+
 	smu->wbrf_notifier.notifier_call = smu_wbrf_event_handler;
 	ret = wbrf_register_notifier(&smu->wbrf_notifier);
 	if (ret)
@@ -1373,11 +1391,10 @@ static int smu_wbrf_init(struct smu_context *smu)
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
@@ -1393,6 +1410,8 @@ static void smu_wbrf_fini(struct smu_context *smu)
 		return;
 
 	wbrf_unregister_notifier(&smu->wbrf_notifier);
+
+	cancel_delayed_work_sync(&smu->wbrf_delayed_work);
 }
 
 static int smu_smc_hw_setup(struct smu_context *smu)
diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h b/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
index 244297979f92..4d5cb1b511e5 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
@@ -480,6 +480,12 @@ struct stb_context {
 
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
@@ -581,6 +587,7 @@ struct smu_context
 	/* data structures for wbrf feature support */
 	bool				wbrf_supported;
 	struct notifier_block		wbrf_notifier;
+	struct delayed_work		wbrf_delayed_work;
 };
 
 struct i2c_adapter;
-- 
2.34.1

