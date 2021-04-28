Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E01A36DB11
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 17:14:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DA446EB90;
	Wed, 28 Apr 2021 15:14:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2043.outbound.protection.outlook.com [40.107.220.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 103E16EB71;
 Wed, 28 Apr 2021 15:13:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KVceJBU1pJr0BWbj8II2dVPbpVEkJJNF3gDvSPUg6b2ZL6BMX+MBuzpxezeEz0OJXc520n/PMsKnbhi6eEZTxyFmJcUSZTZFvO6H/vuJzMXNaVFjCBgccDBf6mmu/fOl946ko9QyspaoOJmRul+FHJlaDGht7AHtRgrfHK3INYwuZEHe+fQIj9buugc1fXGhwPO8UKYcRb09Dv0P10EauZDh2Fmth+HoXhsvPo5HhHXB4a0q6dpwZT9WudFKnhc6c5Vrck2LZdIl/j32U6KdXI8g15E+tkLsVx8P96YW5+gsSkfJw0YH/li0yYfRVmP9I/b6122i1YfZqsuZ7EXVug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J0zppKyDwSYEFkbc1PJUglI0RjqZZnmm5vJgjM8KX04=;
 b=HFMd43HiEaV43zCb2783lAgfTvbhAT4jEvi9enrn0UyOViADcaicshy5jl7cyp1HV56f3iWrawWMCGrIVNVyHlXgfyNpCS7Fhx7nTTeP2XpWgIw9SVdNTJf+74UksoRjXlA+O2JvYFVDG1XViszK6EffLADgHnJLyFgcAyyhdYj0hcC+95WU3YXLfx55YT4mC37zYSe9tihh0AFL5rM0w9QCT2QIx2wapQ2EHLYpXfuWymAXWhgB58g6YnS+B2feUJuDf3NF4Ulzvtzyj77UbfTw1D1HNQPvpFYXgTPX46uyMx9SG8Uf4XLb7O4Qhja/wuaLlvSuqVN3GEJ0EJLbFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J0zppKyDwSYEFkbc1PJUglI0RjqZZnmm5vJgjM8KX04=;
 b=zIM56gocFvrRNYy/uxsodsyjVJTpKh3xa69ISL8aGXTmaAayPaBwFIaByzrj5iOMANnINRrBN3RpBFq5C6jyQbze+AKuezvqLV/DXYP4GLbXRpEvlVYsmiYFUYidvt6sA4gWMgf0BWwTXogvqAm7AMMFgVECk9NgfSFVf7rjdu0=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB2749.namprd12.prod.outlook.com (2603:10b6:805:6d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.22; Wed, 28 Apr
 2021 15:13:13 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4065.026; Wed, 28 Apr 2021
 15:13:13 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, ckoenig.leichtzumerken@gmail.com,
 daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
Subject: [PATCH v5 23/27] drm/amd/powerplay: Scope all PM queued work with
 drm_dev_enter/exit
Date: Wed, 28 Apr 2021 11:12:03 -0400
Message-Id: <20210428151207.1212258-24-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210428151207.1212258-1-andrey.grodzovsky@amd.com>
References: <20210428151207.1212258-1-andrey.grodzovsky@amd.com>
X-Originating-IP: [2607:fea8:3edf:49b0:7212:f93a:73b0:8f23]
X-ClientProxiedBy: YT1PR01CA0142.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::21) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from agrodzovsky-All-Series.hitronhub.home
 (2607:fea8:3edf:49b0:7212:f93a:73b0:8f23) by
 YT1PR01CA0142.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.25 via Frontend Transport; Wed, 28 Apr 2021 15:13:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 625ebaae-f470-477a-a437-08d90a582457
X-MS-TrafficTypeDiagnostic: SN6PR12MB2749:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB274964175B3BD1CE82E991AEEA409@SN6PR12MB2749.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1265;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h3OTczl7HeKmjtk3gdPLijTFYJGS7KM5qZovNp7hdgXvxYGECOi474/WNGbQidyhY3OWRqTxZK00REOtrcuDP8ccD6k9FK4rMS3FgrxU297zMAQ0huSKoNEL1oLoRCVE48ybe5n6SWyVMzBMF+Wsv1sdFGOwoYcptX+UFZxyIdYyRcjMG0ENFUkhR0UoZ24wYfGaTqhsJKg9NQpoMoD2P7uGd56zsh2aJcHAjoqFt+adNoiNNiqGgbgEDMwHNSUTo6jpynWyl3q4o4XKib1yi92r5U4oZ5mZc34KWHEvcGFBewju4Zpf0Qdf4gv5yzkvNyypPcq2SflKhxZT5SBtlGWsIcuKsXZaCa7i4lUajT0gKupIMu4tjvv/WKyPUXw/2zW9kznwBIJpX09nEx/PGHBldFlxdqasJ8l4EHBOCEC5w1edh7RfgxqinK/5KjX8xEbx4+8se6ea+dIY7PL0cIzABTL4LnK4zWDt2xb3/sFN+mkowJcAtiTBOWU3lMoaFUbA/+lNkaba4B3k4MEjfiaLzmSTcfUydwVbNbz9o5SmD1f6cXKV7EKxzFuQ6HTfABHLZ1vWoJtI7cm0CjGFblkIySdpPGk2S+lCcE+Lw2E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(39860400002)(136003)(396003)(366004)(16526019)(6666004)(6512007)(2616005)(1076003)(2906002)(6636002)(66556008)(186003)(86362001)(5660300002)(8936002)(83380400001)(6486002)(478600001)(44832011)(38100700002)(66946007)(52116002)(6506007)(66476007)(8676002)(4326008)(36756003)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?wxa3pv5Ogfbz29sWVuplnuwi88/2VCtgjXAD0evExDiDATlZDHYokxbewOKX?=
 =?us-ascii?Q?PYw8CVihWHUE+accSebIY8m89h0zKPdYo2JsQZnBz+vvb/LrwJuw3v8BUobG?=
 =?us-ascii?Q?LfGukKf5RzppRGAIMhNCKt6TJrmZks//+IdTkN3uN6pjpO2nuNB/qWC8i7t2?=
 =?us-ascii?Q?obGRg1Br7o6qVadbiAt0aX5rp4YJK7AIiMSaiHYLAV47iGdTHwdD94myJ7Pt?=
 =?us-ascii?Q?JxZpPnkwTJvzerKFiJrKEf/gm9MTfId8id9bnK8QRiMt1BMY2bxV5PVBYTBc?=
 =?us-ascii?Q?wtUjlADqrmZnDZ+NlEEn2MA0c9sq+0NeiJN/VnMTAV7kEzx4hg9ccxYf4nWM?=
 =?us-ascii?Q?/YPyOPZTjLulocG6CADTz1Nbs0HXPkioJiToDoAH71Ynw2ViaabRfEVIRdOv?=
 =?us-ascii?Q?C99RRqIW3c6I49cmwp08Rpmmk+xbwQlEDjgSHcKQzbEK8aBz8kM4FfkLnLZe?=
 =?us-ascii?Q?ZSWlofJB8VtqsqapQ/GY+pMv1dwQqNY8wbdr7f/0h5Z6hI9Y9kFtdycaheHl?=
 =?us-ascii?Q?GZFlXe+fqp6ompIIfOJwOby2+WpLz47hq7pSRV3ayrR/0tRhaGSpefBRnYqi?=
 =?us-ascii?Q?pssuHZRWlx7EY4Orb5K/32SRaa2laSDPx+uoPEzyL5/flSask6/XZTPXSO0q?=
 =?us-ascii?Q?o+sqaGXzd51QC5dsPKc2KPfRcJYnOinFBoavPzLni4FBZHXBMJYW26WNQR62?=
 =?us-ascii?Q?lpCfo42jVK3EMkBSLFYWUYyrLcQSGycBKe/cWxdcGqQyZ8IPP5zuK0UWpJ9A?=
 =?us-ascii?Q?sTjS3X/kDjrHKv2/TYeovzz2nUQl5hPiFOPHSHFnMNHAgf39njIvPK6l0uzU?=
 =?us-ascii?Q?Z9qMBFvhL5K0yjrn7VRngX4Nf29nCfQI3dYZLqtIqgiw1H1WWKkXhe35zJ5l?=
 =?us-ascii?Q?8tSVaaBUmmvpDujMDaAxqxzTYywkg4phC3bX3utpdyU2wd0psi5JTWudgrvZ?=
 =?us-ascii?Q?7BqleFpVxtFqaSZxXADd323X60A5TD2cB+YQafq8/FfdzFWegfvtMWznFVNe?=
 =?us-ascii?Q?H1tk3K7GnJYPRmA8cYkfRdvT9mej64vN4FDSJfcDkLpm3Wtcm8Kp1P8woASz?=
 =?us-ascii?Q?pfOiGIhTys2hYec5ICQ1YHAaYQ8UQydSqGpsjO9XB6BZzPIFJq3wBNYmZoLc?=
 =?us-ascii?Q?zCa7O2CRMrO1dVFycT1X8ME1dt3Yx5kEp1wzqHLr2stkycM6936572eiYHRm?=
 =?us-ascii?Q?UkGWVc72MbRluJNPI4i8SbOeaYZA+5Sc0A8P7kExlYvP2YcF9o2ywKPA13Lw?=
 =?us-ascii?Q?9wuIMMnWTyEaHWOFKWrWViaS4qpJ6q3Mbkxr7RM7C4JhF2g6On0jfQK15LQq?=
 =?us-ascii?Q?vkz060LvM6TsSLzsMA0jJMzTEK2XltCjxK57MPp9fP2UPAWkodVc2cBTRM4E?=
 =?us-ascii?Q?bY6gn73GQBUXLwfKughKSxwL53PM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 625ebaae-f470-477a-a437-08d90a582457
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 15:13:13.3778 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J52UHNr5QWR1FHoWO7zP32aInnUr17tBEDAUAItPgNWKsisIoWbJ5zoEBYc4xFFm1GnI7TMyrcYOLKl6Vh/uxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2749
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
Cc: gregkh@linuxfoundation.org, Felix.Kuehling@amd.com, helgaas@kernel.org,
 Alexander.Deucher@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To allow completion and further block of HW accesses post device PCI
remove.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c       | 44 +++++++++++++----------
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c | 26 +++++++++++---
 2 files changed, 47 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/amdgpu_dpm.c b/drivers/gpu/drm/amd/pm/amdgpu_dpm.c
index 8fb12afe3c96..649e10d52d17 100644
--- a/drivers/gpu/drm/amd/pm/amdgpu_dpm.c
+++ b/drivers/gpu/drm/amd/pm/amdgpu_dpm.c
@@ -31,6 +31,7 @@
 #include "amdgpu_display.h"
 #include "hwmgr.h"
 #include <linux/power_supply.h>
+#include <drm/drm_drv.h>
 
 #define WIDTH_4K 3840
 
@@ -1316,29 +1317,36 @@ void amdgpu_dpm_thermal_work_handler(struct work_struct *work)
 	/* switch to the thermal state */
 	enum amd_pm_state_type dpm_state = POWER_STATE_TYPE_INTERNAL_THERMAL;
 	int temp, size = sizeof(temp);
+	int idx;
 
 	if (!adev->pm.dpm_enabled)
 		return;
 
-	if (!amdgpu_dpm_read_sensor(adev, AMDGPU_PP_SENSOR_GPU_TEMP,
-				    (void *)&temp, &size)) {
-		if (temp < adev->pm.dpm.thermal.min_temp)
-			/* switch back the user state */
-			dpm_state = adev->pm.dpm.user_state;
-	} else {
-		if (adev->pm.dpm.thermal.high_to_low)
-			/* switch back the user state */
-			dpm_state = adev->pm.dpm.user_state;
-	}
-	mutex_lock(&adev->pm.mutex);
-	if (dpm_state == POWER_STATE_TYPE_INTERNAL_THERMAL)
-		adev->pm.dpm.thermal_active = true;
-	else
-		adev->pm.dpm.thermal_active = false;
-	adev->pm.dpm.state = dpm_state;
-	mutex_unlock(&adev->pm.mutex);
+	if (drm_dev_enter(&adev->ddev, &idx)) {
 
-	amdgpu_pm_compute_clocks(adev);
+		if (!amdgpu_dpm_read_sensor(adev, AMDGPU_PP_SENSOR_GPU_TEMP,
+					    (void *)&temp, &size)) {
+			if (temp < adev->pm.dpm.thermal.min_temp)
+				/* switch back the user state */
+				dpm_state = adev->pm.dpm.user_state;
+		} else {
+			if (adev->pm.dpm.thermal.high_to_low)
+				/* switch back the user state */
+				dpm_state = adev->pm.dpm.user_state;
+		}
+		mutex_lock(&adev->pm.mutex);
+		if (dpm_state == POWER_STATE_TYPE_INTERNAL_THERMAL)
+			adev->pm.dpm.thermal_active = true;
+		else
+			adev->pm.dpm.thermal_active = false;
+		adev->pm.dpm.state = dpm_state;
+		mutex_unlock(&adev->pm.mutex);
+
+		amdgpu_pm_compute_clocks(adev);
+
+		drm_dev_exit(idx);
+
+	}
 }
 
 static struct amdgpu_ps *amdgpu_dpm_pick_power_state(struct amdgpu_device *adev,
diff --git a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
index d143ef1b460b..f034c8a5eb44 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
@@ -25,6 +25,8 @@
 #include <linux/firmware.h>
 #include <linux/pci.h>
 
+#include <drm/drm_drv.h>
+
 #include "amdgpu.h"
 #include "amdgpu_smu.h"
 #include "smu_internal.h"
@@ -904,21 +906,35 @@ static void smu_throttling_logging_work_fn(struct work_struct *work)
 {
 	struct smu_context *smu = container_of(work, struct smu_context,
 					       throttling_logging_work);
+	int idx;
+
+
+	if (drm_dev_enter(&smu->adev->ddev, &idx)) {
+
+		smu_log_thermal_throttling(smu);
 
-	smu_log_thermal_throttling(smu);
+		drm_dev_exit(idx);
+	}
 }
 
 static void smu_interrupt_work_fn(struct work_struct *work)
 {
 	struct smu_context *smu = container_of(work, struct smu_context,
 					       interrupt_work);
+	int idx;
 
-	mutex_lock(&smu->mutex);
+	if (drm_dev_enter(&smu->adev->ddev, &idx)) {
 
-	if (smu->ppt_funcs && smu->ppt_funcs->interrupt_work)
-		smu->ppt_funcs->interrupt_work(smu);
+		mutex_lock(&smu->mutex);
 
-	mutex_unlock(&smu->mutex);
+		if (smu->ppt_funcs && smu->ppt_funcs->interrupt_work)
+			smu->ppt_funcs->interrupt_work(smu);
+
+		mutex_unlock(&smu->mutex);
+
+		drm_dev_exit(idx);
+
+	}
 }
 
 static int smu_sw_init(void *handle)
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
