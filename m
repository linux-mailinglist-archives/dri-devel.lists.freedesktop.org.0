Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 916B47590FD
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 11:03:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A81F310E446;
	Wed, 19 Jul 2023 09:03:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20607.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::607])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DD0510E440;
 Wed, 19 Jul 2023 09:03:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BsNppSfUEXlBIDImnKLZPD2f7Qb1F3JLlBaqOs+Y5Y57VLcwnHbWrtsUBEUXzycZ9JqTBZ3HoJNfkP87qPVckQ9Wf0dg/pl0qphc3bSt2JPwl+L/yDB2Vnw8CaGAYcPmfMlmuEYM2yBxMNotnAteUi44A6P8k2/4I6WA7xvcNbvgfMl7206C/jQWXDYpmtxKLqMlYk2yK7Mbo+nn3DVYWDXRPD3EZq154OCAysYUaT9Gvn+VmgTrDnWGIk78CotEOEczMoMpwybPayhNbEWh3ZH6wpjltazKWu1cQb/Ko9JrxA/mdBhqMKZhNw4zkV50z4uk2VCINH2bdk5IGoENrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JOfMtK9uPCRjoqE44RI9oSOYI5o7ys3RsMEi8r5i9TA=;
 b=PFTkRkXPtt4lKeQsK49/ca2L+pw3sPP0o5p2nKp1/J0kV035eUISUL99ZiPlMVQbDzGnIxa65utM2zhCHesxUSPLlvRvGfX2T0SaT/Vn3MsQc5iDQEQeZyVJ5VG+rLeIXGvalQHUCoHoTX9BlARaCqeY3aIVxC+f1BAEX+pbSG7V/2GwS24DoOtyoqdjB9EpIdT0zk4ZOeXycSGM8ZHfPgxT1yOlqPe/85fBrq4/lRDggQiB4OsXZ144uBPXwy3y6n0vucF08Wtxqnz/zYYtaTKobjIvSl5yf7hx5I591u1OppM0tOkcxOfBvdh5qN2hqC6LOnXRWprsREP4me+fbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JOfMtK9uPCRjoqE44RI9oSOYI5o7ys3RsMEi8r5i9TA=;
 b=vHMVpagKWhKwRpmteHCH1UUvOEtfnazSGydeM9OgIOu7zC4rBukjaqYiH3dkcNWMppoR0ktj/GZA71JYJeQKAJoFxII+dtINCcAMnGPPoHtjeD8uKMIC4faPsNcdfayDdTulusokCLEAaUKTtlftDTLfiC00lQazjsacxJQtEic=
Received: from DS7PR03CA0119.namprd03.prod.outlook.com (2603:10b6:5:3b7::34)
 by SA3PR12MB7902.namprd12.prod.outlook.com (2603:10b6:806:305::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.23; Wed, 19 Jul
 2023 09:03:15 +0000
Received: from DM6NAM11FT070.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b7:cafe::78) by DS7PR03CA0119.outlook.office365.com
 (2603:10b6:5:3b7::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33 via Frontend
 Transport; Wed, 19 Jul 2023 09:03:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT070.mail.protection.outlook.com (10.13.173.51) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6588.34 via Frontend Transport; Wed, 19 Jul 2023 09:03:15 +0000
Received: from equan-buildpc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Wed, 19 Jul
 2023 04:02:46 -0500
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
Subject: [PATCH V7 7/9] drm/amd/pm: add flood detection for wbrf events
Date: Wed, 19 Jul 2023 17:00:18 +0800
Message-ID: <20230719090020.2716892-8-evan.quan@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230719090020.2716892-1-evan.quan@amd.com>
References: <20230719090020.2716892-1-evan.quan@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT070:EE_|SA3PR12MB7902:EE_
X-MS-Office365-Filtering-Correlation-Id: e8ebafaf-e0f6-4641-1e22-08db8836fd02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sbnSgiCSceM9TOu5GnroUfcVyI/jKspmP7ZTuUChA9gNfOrJlopg/abXB+C9QajbNtH5cM9h6Yl3ZWSOhN/mit9vE7I0RQpjob+t5pBJSxO6mXRo0n/elEziEidliT3AT3klnrN04jpbtQLUe+bUkPnF8UG3SStyD8Vzaql6Dq29Ghbn8nQWQ9gHEVJul14ktGKEWPELrLOZ1rK8UoTKJ7FY0oHC2uWVUTsVx65WlE8HU4KlDmlR9pB8evL/djfEy/c8D4zpB1fHleo1ScznR7rUN7cwY5V3HO8vacExVLneMxova0mcjp+JcweQm6WrHkFmqzCJ8Ls686cVcll9n7ZrXfKPX967NQa4S43OrktcHzZhdwMfA8BE6mv8wM5tOGeAxRJzzLEkrpHig9wksVP+F6FVyan8ufXm5MyKZfUxb3KfuXs4tmrM+ud1AqrwhevJ1xFQ/RYX1drdh5XRWKHjVI2FdzQOFPyCLIFqpGcGIwp6+2fvCa1/2qiazwjj7wC0tigwt/MYDUEHHyglF+jqxdKNQT9T80fj6Hg9dG8fnJTGCySbakV7K8Sb2quqBzBzFyWOZ58sZt/dILEOpzK2INsH3aRIM0FP73IooxpZ/qxTMuO/OaKpTjVadgRrtxOZFSC3zax8qngf62nx3KMvyBsaRFeNQIheFbmAxSjyJW2XyPFUixj2ZIyYmJTLOXtj8KnYG3Gxwd2gd98yd91+XKrmuxdJ7U0zcaaTEqTPgcq4urQ/6qdWFGSiD9/hlTvIK8RoLFtkAdKFU8wzJfq6p7T37WHaw1VO7ZwLbQPKJtrsUJc30pgYdh9AU5/sV9gAmvPNLHDCXJfMPfAXag==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(39860400002)(396003)(136003)(346002)(82310400008)(451199021)(40470700004)(36840700001)(46966006)(2906002)(44832011)(7416002)(8936002)(8676002)(4326008)(316002)(41300700001)(5660300002)(26005)(336012)(1076003)(36756003)(7696005)(186003)(70586007)(70206006)(478600001)(6666004)(110136005)(16526019)(40460700003)(54906003)(47076005)(83380400001)(2616005)(426003)(36860700001)(81166007)(356005)(40480700001)(921005)(86362001)(82740400003)(36900700001)(2101003)(83996005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 09:03:15.6661 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8ebafaf-e0f6-4641-1e22-08db8836fd02
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT070.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7902
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
index 83d428e890df..aa7faeafc86b 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
@@ -1278,7 +1278,8 @@ static int smu_wbrf_event_handler(struct notifier_block *nb,
 
 	switch (action) {
 	case WBRF_CHANGED:
-		smu_wbrf_handle_exclusion_ranges(smu);
+		schedule_delayed_work(&smu->wbrf_delayed_work,
+				      msecs_to_jiffies(SMU_WBRF_EVENT_HANDLING_PACE));
 		break;
 	default:
 		return NOTIFY_DONE;
@@ -1287,6 +1288,21 @@ static int smu_wbrf_event_handler(struct notifier_block *nb,
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
@@ -1317,12 +1333,14 @@ static void smu_wbrf_support_check(struct smu_context *smu)
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
@@ -1333,11 +1351,10 @@ static int smu_wbrf_init(struct smu_context *smu)
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
@@ -1353,6 +1370,8 @@ static void smu_wbrf_fini(struct smu_context *smu)
 		return;
 
 	wbrf_unregister_notifier(&smu->wbrf_notifier);
+
+	cancel_delayed_work_sync(&smu->wbrf_delayed_work);
 }
 
 static int smu_smc_hw_setup(struct smu_context *smu)
diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h b/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
index 5b2343cfc69b..5df28d4a8c30 100644
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
@@ -579,6 +585,7 @@ struct smu_context
 	/* data structures for wbrf feature support */
 	bool				wbrf_supported;
 	struct notifier_block		wbrf_notifier;
+	struct delayed_work		wbrf_delayed_work;
 };
 
 struct i2c_adapter;
-- 
2.34.1

