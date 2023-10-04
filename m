Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C3C7B84C2
	for <lists+dri-devel@lfdr.de>; Wed,  4 Oct 2023 18:17:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D40410E18F;
	Wed,  4 Oct 2023 16:17:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2061e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eb2::61e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0704710E17B;
 Wed,  4 Oct 2023 16:17:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Joys1rGl8BZmyW+xKNLhCExnqS6U5zA5JclnD7nvbHZVF6oj9SiPDHpYtGJp83sgdmswhGUudsHsmgoqzAIoIrBnx8CFwjTXqP2Y7FHbvSHx6qFeM/sU3g/acCQ/ovniO97buZ8CshYrYgvHDOcJBE/++tWBktxiQJDtpHrzRy3BmUFTLENCg2JhwO3yUzvGTW1xeZ4vMlg13DqZ/92Yu0p2adB+1+BLnJE0m5lHoi9WZHPWHDM3jKJXIcwj4QEF3NYngF9bMcqu9uDnvFiizQrT9s8SjFCjzI5rOaN0jW6XmnblD2wKkEwexIl/lECF1ETr60rhXdStr/pSdUmPqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rX1EN9nNYf/4oQMY5d601+RqZkkxVjliIB5bgOAX/Cs=;
 b=FDO8IyYp+9WT3zg0kwHoS8zgOFPZBzQkzqypYhQCNvnWsla7OI3/Xf+UJmwlEiw2r55QKt0QPOzThkkdy0r3I/0waTVmVqyp8Um6a5sijjX+BQs3uaxJTSKmNIM4EOG1CPNE4xZGx5JKpF291IWq8EqMr8KKosuEDD0raZRcmvmBDg7QPsqrMCqcyXUBJNu5Y09R9SySO6OQ4lS9P9FRZrrEM9+QokPXrPyb0UgvKK2Lp1FHziwHWic1kYh6tq+zDry/ByI8UXXDt5el6PRyLQ5YEGOGFcjcBfSeF+0rlyQJ8xNdJHqkHH5HOwjaLzeEju0irqNsQ9eEffj969M0gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rX1EN9nNYf/4oQMY5d601+RqZkkxVjliIB5bgOAX/Cs=;
 b=0SmI/SYUF1H0Oab+spKVBYatx6wIOONTe85lb7xStBZS8TOS+hjLsgsYYTRr/Icr2PoNDBSnQFjaWrfYEx+DCqrGmyVoQPMGyBKzmfM9ZrSIx8fxYeCVVN0M5ZuwoGWxZxR9oenbLztR0vIzJsQ5KNXCmMzjCi6xhoZjgUHKRBE=
Received: from PA7P264CA0531.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:3db::12)
 by CH3PR12MB9218.namprd12.prod.outlook.com (2603:10b6:610:19f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.31; Wed, 4 Oct
 2023 16:17:33 +0000
Received: from SA2PEPF00001509.namprd04.prod.outlook.com
 (2603:10a6:102:3db:cafe::76) by PA7P264CA0531.outlook.office365.com
 (2603:10a6:102:3db::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.27 via Frontend
 Transport; Wed, 4 Oct 2023 16:17:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00001509.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Wed, 4 Oct 2023 16:17:31 +0000
Received: from rtg-Artic.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 4 Oct
 2023 11:17:27 -0500
From: Arvind Yadav <Arvind.Yadav@amd.com>
To: <Christian.Koenig@amd.com>, <alexander.deucher@amd.com>,
 <shashank.sharma@amd.com>, <Felix.Kuehling@amd.com>, <Mukul.Joshi@amd.com>,
 <Xinhui.Pan@amd.com>, <airlied@gmail.com>, <daniel@ffwll.ch>
Subject: [PATCH v3 1/2] drm/amdgpu: Adding db_size to get doorbell absolute
 offset
Date: Wed, 4 Oct 2023 21:46:51 +0530
Message-ID: <20231004161652.3082-2-Arvind.Yadav@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231004161652.3082-1-Arvind.Yadav@amd.com>
References: <20231004161652.3082-1-Arvind.Yadav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001509:EE_|CH3PR12MB9218:EE_
X-MS-Office365-Filtering-Correlation-Id: 1950236f-51ed-4962-3b50-08dbc4f56970
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yNgef7cRXNypLxyfTN9onIO9MF8BIOjOYqgFyzHD8jajtRYSVy+lrbCWG4Cu+lEBhE3QHFbe9WPZWfk3CAYFZffv6vJl5MbkD+JxiscB2hoO53D9XqJUSC2sq4DX95xsCfGxWqtLJOtShEO66I4z8uce2VOWWDdXvKyYTGpfaFWmSMo4WNDRxHmPEYqANRyza4J7btsCJhuYGSAg0nLF27o+KYyy2WrkSXGHtvYNNJS9S3Mu2K6tQ/eRdbBgo0608CguiXktZKYYVSsyGUMKFLjo6tL2ULiOmqiV4RqUvtJDBwS51P/jWzF/FaZsAWDO1H0U0lOvB36VX2auC0SD0R+CtIafgxRguwwYvOuC4q80TOKWpTOWfBbMbxb4Sxfb705D+gYy/wriW5B2R6w6UV+5mViG1sXGHeH3gY21cJI84IniZr7TyhAlyzqo/TpwH5NgUpYON9QBV3jS3cA0GInZFk5vMaqpqhGI2fPnj0qzzGMJK+Tt+v2cY0/DjZaSmUjvwGDVhPjW7/e3IVOEJzaBhbzyzMAmLdLSQLsNSmIGcSaDrKKcpq4PGRbegQM6lcxJYjIZwpsHDRUGQ3g7go4H2m48431IVo2QMupAX92ly4ylvYdNqLUtyO1GWvFuolWvTSZi6crgMLopdcVGtJHK2El+44fr7aA9hzUaMWrxYwmUM1FEY/a/1ZNUDeb9IcBBXl+ChHUi5DXs7A0Ll1xaoBtWcPZQRZ2WtAmy4jVR8Dwu4BV9HgRqEw6636DF0Janl/Ucrg+nHdIoGWKdhQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(376002)(396003)(39860400002)(346002)(230922051799003)(64100799003)(82310400011)(186009)(1800799009)(451199024)(46966006)(40470700004)(36840700001)(16526019)(83380400001)(110136005)(316002)(70206006)(54906003)(70586007)(26005)(1076003)(336012)(40480700001)(6666004)(81166007)(36756003)(7696005)(82740400003)(2616005)(86362001)(356005)(47076005)(36860700001)(478600001)(40460700003)(2906002)(426003)(8936002)(8676002)(41300700001)(4326008)(5660300002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 16:17:31.7426 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1950236f-51ed-4962-3b50-08dbc4f56970
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00001509.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9218
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
Cc: Arvind Yadav <Arvind.Yadav@amd.com>,
 Christian Koenig <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Here, passing db_size in byte to find the doorbell's
absolute offset for both 32-bit and 64-bit doorbell sizes.
So that doorbell offset will be aligned based on the doorbell
size.

v3:
- Adding db_size as parameter to get db absolute offset.

Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Shashank Sharma <shashank.sharma@amd.com>
Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell.h     |  5 +++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell_mgr.c | 13 +++++++++----
 2 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell.h
index 09f6727e7c73..4a8b33f55f6b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell.h
@@ -357,8 +357,9 @@ int amdgpu_doorbell_init(struct amdgpu_device *adev);
 void amdgpu_doorbell_fini(struct amdgpu_device *adev);
 int amdgpu_doorbell_create_kernel_doorbells(struct amdgpu_device *adev);
 uint32_t amdgpu_doorbell_index_on_bar(struct amdgpu_device *adev,
-				       struct amdgpu_bo *db_bo,
-				       uint32_t doorbell_index);
+				      struct amdgpu_bo *db_bo,
+				      uint32_t doorbell_index,
+				      uint32_t db_size);
 
 #define RDOORBELL32(index) amdgpu_mm_rdoorbell(adev, (index))
 #define WDOORBELL32(index, v) amdgpu_mm_wdoorbell(adev, (index), (v))
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell_mgr.c
index da4be0bbb446..6690f5a72f4d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell_mgr.c
@@ -114,19 +114,24 @@ void amdgpu_mm_wdoorbell64(struct amdgpu_device *adev, u32 index, u64 v)
  * @adev: amdgpu_device pointer
  * @db_bo: doorbell object's bo
  * @db_index: doorbell relative index in this doorbell object
+ * @db_size: doorbell size is in byte
  *
  * returns doorbell's absolute index in BAR
  */
 uint32_t amdgpu_doorbell_index_on_bar(struct amdgpu_device *adev,
-				       struct amdgpu_bo *db_bo,
-				       uint32_t doorbell_index)
+				      struct amdgpu_bo *db_bo,
+				      uint32_t doorbell_index,
+				      uint32_t db_size)
 {
 	int db_bo_offset;
 
 	db_bo_offset = amdgpu_bo_gpu_offset_no_check(db_bo);
 
-	/* doorbell index is 32 bit but doorbell's size is 64-bit, so *2 */
-	return db_bo_offset / sizeof(u32) + doorbell_index * 2;
+	/* doorbell index is 32 bit but doorbell's size can be 32 bit
+	 * or 64 bit, so *db_size(in byte)/4 for alignment.
+	 */
+	return db_bo_offset / sizeof(u32) + doorbell_index *
+	       DIV_ROUND_UP(db_size, 4);
 }
 
 /**
-- 
2.34.1

