Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F8478E64D
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 08:21:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A56B210E5A7;
	Thu, 31 Aug 2023 06:21:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2061c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8b::61c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16CFF10E598;
 Thu, 31 Aug 2023 06:21:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eyy/wykofk77iC0lRTZSVcgt8YWq1Te4+oj0P/sZyUwiG1bNYfn+WiZ9gk7pSXNlMzlExoFXEZ9+LbVq952mYlE5DHEZ3OfN3Vat11woQvKKMRdnBZOvBY1Gz1O/K3YOAibJ3Vq41jJWc0Rf1F52uTiIx4tPzW0dmBB+byld4TdLUVbZnz9b684n8gLf7krgFGEvqxJLTqIPeDQDUNKNKmttXGD/z6X+2iN6W2n8PhCuusFUw3DLDw3Yd892HnMi7K2ApcJ/3AFZ3dHGj1iNEfKwoKI25T480klRomi5HFfyRrO9pBj8gsmyjxw7PbN9EjqjO4RCOrw/6SzixRAVIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WBRHfsfZe939lO6ulz/XCDvUc7IzpeK7VI4Vp/iPpAc=;
 b=cRIYzTJri50YSGDUb7d+ancS8C6VBaLFfaUwToEOGjD0nfB9q+cM2fHxWBAlujDzk1Z82bqHVcaosdV1YLg304RNPEMVqJsMLQiffzmpCg0drtEp41RVMLb8YEo8vtINkXNpvk4UtKRO2h2KAeH/TYut5ENYU0ZVLu3jcaOQxpcQplV3GsXTk4wumyB6rS0nWDLAjHP3KXc3bGbktmro0xa+tCPnc8/uiaok9vmY2Tdmqj1wxskUljtW4nZ2OA8ODPGEozrDlXmPl7ZdfGWtMsOTNGAjlsFEbxXiDEAvNvtYGVz2bdpNY1gRwQ722cIZZCG7tbPlSQIFAm3th784tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WBRHfsfZe939lO6ulz/XCDvUc7IzpeK7VI4Vp/iPpAc=;
 b=Xy8hCZXyJpZ7kF4+Nqk63SrNupJ/72nN/qFRJ2gzZptJNTYPJnKo/jvuJHBZHQrOyJIgPypeon3NmPIqw5qIgAuDmbTHnWFNk04PP0bs00G5IPPoOu5NOTuk3L1CiCJEsTNOw6/8pmLtxY6ELdgGw6S7OysBpljgpsaJLWKEvPA=
Received: from MW4PR04CA0336.namprd04.prod.outlook.com (2603:10b6:303:8a::11)
 by SN7PR12MB7346.namprd12.prod.outlook.com (2603:10b6:806:299::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20; Thu, 31 Aug
 2023 06:21:32 +0000
Received: from CO1PEPF000044FD.namprd21.prod.outlook.com
 (2603:10b6:303:8a:cafe::82) by MW4PR04CA0336.outlook.office365.com
 (2603:10b6:303:8a::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.18 via Frontend
 Transport; Thu, 31 Aug 2023 06:21:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044FD.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6768.2 via Frontend Transport; Thu, 31 Aug 2023 06:21:32 +0000
Received: from equan-buildpc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 31 Aug
 2023 01:21:27 -0500
From: Evan Quan <evan.quan@amd.com>
To: <lenb@kernel.org>, <johannes@sipsolutions.net>, <davem@davemloft.net>,
 <edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
 <alexander.deucher@amd.com>, <rafael@kernel.org>, <Lijo.Lazar@amd.com>,
 <mario.limonciello@amd.com>
Subject: [V11 6/8] drm/amd/pm: add flood detection for wbrf events
Date: Thu, 31 Aug 2023 14:20:29 +0800
Message-ID: <20230831062031.1014799-7-evan.quan@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230831062031.1014799-1-evan.quan@amd.com>
References: <20230831062031.1014799-1-evan.quan@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FD:EE_|SN7PR12MB7346:EE_
X-MS-Office365-Filtering-Correlation-Id: a9feca61-0733-46dd-e414-08dba9ea8513
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nUD/RyEWuhJujzdDkZnjPf1JDIv9vBOXHP+MldX2YJQdy+hQqhTBFs4GyOCjkiH+TjGt2y0NB52ZzH81Z9/3hW+Or/a2gt/Fl8mixu5/sFp7tGcoccN7q8Evo9Sozg1OH8EoHExVyEk6QZU7z4NYUN5Pp2jHSz+VlOndZMZ3YiUnf0kV6aRuVxwryTVxwT9XEzpVy0q6Egu1CGpDMvIyKjCZ5RK8GlCJFzyEVq54mqcOWmIynySF5H86bjhYE6QjXLI1U9hAhiKpRv3zcU3n9ATy382JgM26mGbn3ksdlssMqM3mm3iOzVBNzEnxo69kC7P8Zt/XFnb5voZ0aX15lcxh8EojgCHhmt4OjEZDNyZAPqJXaAru/fyKy7+Rm/0rUzIbOSlIlDgZm3R9SY5oxEwY07az/SebOc9HOi4fBjyJX4DKk3AZo4MfCec/9PxLry4VkzmPFitVaDofpc4tBJbVcjCjijQeA7GhRlNcR/+c26sXhoB+W+rGmotMTYvnNN1gGiZYxDA6ASAhcFdURLpGHqU5aESF8wlTr4UfabUS6mC1RDHsm5hyP4QEvyd5864GU4LfGk5OOwlqjql9+60TdzO1Ve3KOlXZJrZVxJg0k18Db/SF9wkEJrr7SEhnsT8hiSZo9NG3RE/v+Bb3s1trn1We1g2bsvrh7X/MgOOVWeM80gkK1S/G7ZA/b7XcARqunujGXDUwhw+imX/B7bEHIJ3UbFNv6XmlciVSmIZDYxBXgxjP7RsEPYYSd5kCvutGX0Usv95imyNYFCwnnnifSV2LC485shsp+f5kKac=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(376002)(396003)(136003)(39860400002)(186009)(82310400011)(451199024)(1800799009)(40470700004)(46966006)(36840700001)(36756003)(40460700003)(40480700001)(83380400001)(4326008)(44832011)(41300700001)(86362001)(8936002)(5660300002)(7416002)(8676002)(1076003)(26005)(336012)(7696005)(16526019)(426003)(2616005)(36860700001)(47076005)(82740400003)(356005)(110136005)(921005)(478600001)(81166007)(6636002)(2906002)(70206006)(70586007)(54906003)(316002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 06:21:32.1609 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a9feca61-0733-46dd-e414-08dba9ea8513
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044FD.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7346
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
 Evan Quan <evan.quan@amd.com>
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
index bac2a362a2fc..2dbdb4149428 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
@@ -1319,7 +1319,8 @@ static int smu_wbrf_event_handler(struct notifier_block *nb,
 
 	switch (action) {
 	case WBRF_CHANGED:
-		smu_wbrf_handle_exclusion_ranges(smu);
+		schedule_delayed_work(&smu->wbrf_delayed_work,
+				      msecs_to_jiffies(SMU_WBRF_EVENT_HANDLING_PACE));
 		break;
 	default:
 		return NOTIFY_DONE;
@@ -1328,6 +1329,21 @@ static int smu_wbrf_event_handler(struct notifier_block *nb,
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
@@ -1358,12 +1374,14 @@ static void smu_wbrf_support_check(struct smu_context *smu)
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
 	ret = acpi_amd_wbrf_register_notifier(&smu->wbrf_notifier);
 	if (ret)
@@ -1374,11 +1392,10 @@ static int smu_wbrf_init(struct smu_context *smu)
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
@@ -1394,6 +1411,8 @@ static void smu_wbrf_fini(struct smu_context *smu)
 		return;
 
 	acpi_amd_wbrf_unregister_notifier(&smu->wbrf_notifier);
+
+	cancel_delayed_work_sync(&smu->wbrf_delayed_work);
 }
 
 static int smu_smc_hw_setup(struct smu_context *smu)
diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h b/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
index 3eb1c72a76f1..60d595344c45 100644
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

