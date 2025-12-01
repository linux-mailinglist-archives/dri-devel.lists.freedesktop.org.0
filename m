Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1754CC96D17
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 12:09:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55ADB10E3A4;
	Mon,  1 Dec 2025 11:09:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="11L+F3x7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012021.outbound.protection.outlook.com
 [40.107.200.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9092210E3A1;
 Mon,  1 Dec 2025 11:09:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MPVpZXtW9J6E0AJEYluFREWo+LvBo0Ipcnk685pMrKpDplTmiJxwMwewfhShSov5nucayhjLXSDXUp6yaV7OF3beJa9AwILQCqRruOV1rCf72mCBesKIL2VRP7zVuz02kduQt7avJw8GkgAZ/F/1BjUfowvaqDP32Lxof6Ud4QJ6ErSTbnFQXqihncaOB3SeYFk3xK50pLp+BhBFB9C6VbYjoIMnJVIaWKNF20KRzzGrI7+oCxvIdRpxDdtNN233YGciF5hYXyeVWvYXmtRyT56MvFClM/RyVsYfl91MtYz12tkS08xrQ/8iZNge/8f+6D//otwiXTkPee/BDRRctw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WDadZeeU4h+LZMTEfBRvDiiivfpW1BKrTwCdBulDkUM=;
 b=zAbasdNDHbqDG4nt+nzyVx2x5S4+NeMqOJqo12JI6RkIoSdsNxbQepDMX6KMmxsehC07wIRb4C+rHjGFwjx6xUzRV2YSopo9SrAjK5Zf5RCMS8dzI5fympBNWoqvuHvWUsNrV+6VFvnWzLNuW4EE1nAY8DaNZXwYkHlxCI2Nwf7GidlQWHqNm54pT1KCTjefn/V/Vc1p/oboz9tcyGZdBcA4rG1KcJfr+RjIwxGoJHliAd5MPHHLdC1Lyki0t+wJoQn/LYZ2UaYi95e47iLWT/qJ0rdXZAn9TWYGmnuyrTQJg3ubIg4XYnyvDywwmqDNDzhgxTWIyuw0uVPPYRpxaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WDadZeeU4h+LZMTEfBRvDiiivfpW1BKrTwCdBulDkUM=;
 b=11L+F3x7+MHfj3lvUm7Z/QRP/LX8PvFa7NtnzRxZOtaOCQb262kWFZ7YyiGSflZY0sNLQEQdaCw9F6/OyaKTTmEDh8OgwLS1nxBIWFHdWGh0GjrlQaDEK0JJmCMF1Y3rLUZwUP7r2KULqyi6rs+zycP/YbhrMW1qS4/f36YiDxo=
Received: from MN0P223CA0028.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:52b::17)
 by DM6PR12MB4105.namprd12.prod.outlook.com (2603:10b6:5:217::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 11:09:27 +0000
Received: from MN1PEPF0000F0DE.namprd04.prod.outlook.com
 (2603:10b6:208:52b:cafe::98) by MN0P223CA0028.outlook.office365.com
 (2603:10b6:208:52b::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Mon,
 1 Dec 2025 11:09:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000F0DE.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Mon, 1 Dec 2025 11:09:26 +0000
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 1 Dec
 2025 05:09:22 -0600
From: "Yo-Jung Leo Lin (AMD)" <Leo.Lin@amd.com>
Date: Mon, 1 Dec 2025 19:08:13 +0800
Subject: [PATCH v4 5/5] Documentation/amdgpu: Add UMA carveout details
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251201-vram-carveout-tuning-for-upstream-v4-5-9e151363b5ab@amd.com>
References: <20251201-vram-carveout-tuning-for-upstream-v4-0-9e151363b5ab@amd.com>
In-Reply-To: <20251201-vram-carveout-tuning-for-upstream-v4-0-9e151363b5ab@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, =?utf-8?q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>
CC: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>, "Tsao, Anson"
 <anson.tsao@amd.com>, "Mario Limonciello (AMD) (kernel.org)"
 <superm1@kernel.org>, "Yo-Jung Leo Lin (AMD)" <Leo.Lin@amd.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3118; i=Leo.Lin@amd.com;
 h=from:subject:message-id; bh=1dyknvfNRj7XyZ+MDBJj4gjpzT8eK3hT2AGYLwc2FYU=;
 b=owEBbQKS/ZANAwAKAV8XsZZKKe6GAcsmYgBpLXdQwx3XXOpsBNdpefW/jsfTPnOrUVF+kbFd1
 1RPH8EKW3qJAjMEAAEKAB0WIQQzqV4kW+yguuqHrw5fF7GWSinuhgUCaS13UAAKCRBfF7GWSinu
 hiAsD/9P39HyXZb8vEO7S5RFHX6hoYkyNGid3SLMZKr6u/6qQpRoN5OxeuqK4vDyDl/uvhWefQB
 Q9mF2Q/1pPo48o3LOeb9L0sq35kTpRilOhh4OS4szAMUBLi0oOG3pFaVN8aIj0J5o14bSrft2nt
 F9BF0Gk7DNFKtBnRPuumG+NJGiAP1c/eY/sdZ2omwuWMBOBpSpuAB1QcEEyUtKXQmBx9WpWwuZ/
 oPCMV4Whnecio3jklNwqQg3H7BhZWLxW9dGhjJ0R9Ab6BE1eVowR+N6BQuPC4PPSorjPYOnFR4W
 Ah8zuhWx4qiHWSw7Rb5q84vUKqvK6+UA8Da/mHQkmBr0GoGoZ1bbJPVkyKyFUKZo9h5uoBrbsZq
 ZVsCi4UwBUPrzpngJ80jEntGx5VfFejfrK47sIam6Bfk09D6YPi210fum+wzU7fl7IelfndIACP
 18epLsKS6HoQCUQJ0yNKpquzrEn37V1YZKlmkV/fHNi9z5XuDLGvqUb1TVAi9bbkatSoXrEzy4g
 PIof3MGojIhl9xEr6ochnfS9d/ycrEfor2ZnRa6uLCdVe4FjP0xSz63RD90e4ZF4S5Nxz0IvPZM
 FYjY04/1htGsJwFOdwfWXqMe9cv5c1CuabBeMQ5t8vnJQhqfZ+c+G8BFkYpDtd614Vg7eJOguIO
 yZc5FS7lj4ZN98w==
X-Developer-Key: i=Leo.Lin@amd.com; a=openpgp;
 fpr=33A95E245BECA0BAEA87AF0E5F17B1964A29EE86
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0DE:EE_|DM6PR12MB4105:EE_
X-MS-Office365-Filtering-Correlation-Id: 4827690d-8600-41ef-3ef8-08de30ca1772
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MWxlM3VxT2FaQTFIaTRibHJtV1U1ZGRRU3dmTjQ5eWRQellpVEFhN2ZoTUpN?=
 =?utf-8?B?K2Q2SWVPMUdEQkJIOWRNaE0vVTd2LzZBOTVnZ3RRemFJZFk2eDZsbDlHcmQy?=
 =?utf-8?B?eWp6RnVkWjlrdm4wNTMvamhMMjhXOUhWeFp5VGVYTnBwejJRdExxMDgzL2NB?=
 =?utf-8?B?cDhOOUcxYzVnWE1yWG9oOUxWaUxzKzc5L2ZLYVNzWGpHTVdvZXU2bk1BYlpN?=
 =?utf-8?B?VnVaUCs3emZjNDZmbkZGQlhvL1ZxcWg5dVEzbitLRnJzb3R2MEhIWmdJeUxL?=
 =?utf-8?B?TlVyQUE1QlBTT1B1MVNpRDdSdkpuRHAwMkxONnZrQTlJZllJUXdvQyttNllY?=
 =?utf-8?B?VmFMaTNmRGNrbm54MXhJOVdNeTE2aE51QUMyTEtpeTY3d0lWdUlxL3pLQVRh?=
 =?utf-8?B?cDN1K2kxK3pzTFJWRll3U3AxRVdKb1NHclp5aHpGZ1cyMS8xM1ZrUEovV2xT?=
 =?utf-8?B?NXgyU0NuYXJpUDllU0J1bWRpOGNDU1ZjSFhkSkgvbWowdmN1dWI4WkVyNkQ2?=
 =?utf-8?B?ZmlrZjhTVlVWNDRhSjU3dDFIN1Vub29GL0tkSFdQanlXdkI3V0xYOEV0Tm44?=
 =?utf-8?B?ZjY5dVRwZng3NC9tSitFY3Y1Vml5NWh0NGk5T1JybXV3NU9MQzBxZ1dUanI5?=
 =?utf-8?B?RE1KUml2RXZDWWkrUWFEOHFwcUVRVndHZFJMK2dXMUFQdTJmSWkvNzZBZlZt?=
 =?utf-8?B?NjZVaGJSQ1FCR2t5MDBKZCtISTJOWkxMTUVSRGdZYnZXeWlDQmRmbVRWMU1l?=
 =?utf-8?B?azdQVXJqVXo1YjZTNHRIRjFLdFJBTWlpRXRNUjM0N09aYkFBTVNpSEduQXFT?=
 =?utf-8?B?cERKRHdmWkF6eS9Kd3ZQVlh4cnVlR1JyYXVpckloaGF4alVINkZpaHd2bUp0?=
 =?utf-8?B?SklQam1aZGN5K25nZHNSRDZsSzJadVhCZ2dWUEUxQmEvUXlVSzZoQjE1R01V?=
 =?utf-8?B?Y2F2SmtWbVNXdlRxdUtla2tHVVJOY2JUUW4vU1FUNFB3TkJIaEpNa05zb2k5?=
 =?utf-8?B?STV0a1JLZC9Bci9oSTlGRTNuU2tjaWZmSEU1MmdaS0ZlNkxzOFZGSjBWTjAz?=
 =?utf-8?B?MXVQZDRtT1FlNy80ZVRHc0tNN0VMeW1wTjhMTnZjU0ZhRlFhS2JoS0tIbnRs?=
 =?utf-8?B?Z2Q0RURSWHhFUUlNVGk0V2xWaCsyMFVac29LbkJPUWU2dUM4VlVBU28ySWZs?=
 =?utf-8?B?RUZoTnd0TmM0MWR6QTMvTDJMeDV1WFdPUThLWUpZSEp0VVYxOW1EYThibjFi?=
 =?utf-8?B?SGxjQUYyUzNLbHM4R2dJSXJ3L2NhVDIzMGFlSVdKQVkwUUpLdjRtSkNFUjRn?=
 =?utf-8?B?NkdrYTZBZ0JPR2thMkd1Z2ZBMy9nQllsU3poRjl6SGMzeGpZVEFNS1FYMUZl?=
 =?utf-8?B?eDgxL1g2ZFdQSVFFZ2hzcGl5QzVoVGtRNldxUHVEV2N0V2VxMWQ1dWFjUGVJ?=
 =?utf-8?B?TlRKNDlJSGQ2ZG9yVURid01WTHRRUzg3N0lsVjFEd0lQL0ZmQ3RkR01UM0Fr?=
 =?utf-8?B?TXh3Zjl2S1Q2UUlQcktQbEd6VFFiN2JXRE5Ka1dDaVR3cHpreDdzMGhpSGRl?=
 =?utf-8?B?eE00UGU1WTV2VG1qOUVFUzQ5YzZrTlNwTnEzWHdURVk2QUlra3h3cWRiT2Y2?=
 =?utf-8?B?cmRWa05ybzdKVjhOV3F0dlhxaHBJT3o1STdWa3VCdWtPdlMzcUtVYXJFbFVt?=
 =?utf-8?B?MElXQTRvakRVbTM3TlFpbitkVU9xdk0vR2FrVDJadW5ZcVNBRnNyVTUzMFVq?=
 =?utf-8?B?RXV5QUVxZk1kdms4RzFXVmpEVDAxcTNxY1VEVG1DZVJ6dmw3VTFZRlhnMXYw?=
 =?utf-8?B?ZTB4ZjhiVVFLeG9COTMxZFBGYTVlWjFrYmZyb2RTSk9lVk5DVWxMTHlHaFlS?=
 =?utf-8?B?NTJ0c3o2dDhFaWtYTytTSTVwMTRGNVdNQkdKUVdyV1Z3bzI1b29ITSt1MDFx?=
 =?utf-8?B?STRteFRpNkFqMWdCallsWGpjQ2JXUDA0WXIzQ3JSdGc2Q2dkRy9BODV6aUg3?=
 =?utf-8?B?Q1BQMXBiZ083TFExOTlwcFV1WHZ0VlJrQXRuYzNkU09wRmtONHpRUUF3UHJG?=
 =?utf-8?B?VWlaRExSdXprNDlqOFRMK3BCZi9OcmFGSlpzaTdWcmJBS25QMDM2dWhKYmdv?=
 =?utf-8?Q?CBjY=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 11:09:26.4873 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4827690d-8600-41ef-3ef8-08de30ca1772
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0DE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4105
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add documentation for the uma/carveout_options and uma/carveout
attributes in sysfs

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
Signed-off-by: Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>
---
 Documentation/gpu/amdgpu/driver-misc.rst | 26 ++++++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c | 29 +++++++++++++++++++++++++++++
 2 files changed, 55 insertions(+)

diff --git a/Documentation/gpu/amdgpu/driver-misc.rst b/Documentation/gpu/amdgpu/driver-misc.rst
index 25b0c857816e..cd6f044bea85 100644
--- a/Documentation/gpu/amdgpu/driver-misc.rst
+++ b/Documentation/gpu/amdgpu/driver-misc.rst
@@ -128,3 +128,29 @@ smartshift_bias
 
 .. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
    :doc: smartshift_bias
+
+UMA Carveout
+============
+
+Some versions of Atom ROM expose available options for the VRAM carveout sizes,
+and allow changes to the carveout size via the ATCS function code 0xA on supported
+BIOS implementations.
+
+For those platforms, users can use the following files under uma/ to set the
+carveout size, in a way similar to what Windows users can do in the "Tuning"
+tab in AMD Adrenalin.
+
+Note that for BIOS implementations that don't support this, these files will not
+be created at all.
+
+uma/carveout_options
+--------------------
+
+.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
+   :doc: uma/carveout_options
+
+uma/carveout
+--------------------
+
+.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
+   :doc: uma/carveout
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
index 2c0405cdc436..58f6000f4e54 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
@@ -1248,6 +1248,24 @@ int amdgpu_acpi_get_mem_info(struct amdgpu_device *adev, int xcc_id,
 	return -ENOENT;
 }
 
+/**
+ * DOC: uma/carveout_options
+ *
+ * This is a read-only file that lists all available UMA allocation
+ * options and their corresponding indices. Example output::
+ *
+ *     $ cat uma/carveout_options
+ *     0: Minimum (512 MB)
+ *     1:  (1 GB)
+ *     2:  (2 GB)
+ *     3:  (4 GB)
+ *     4:  (6 GB)
+ *     5:  (8 GB)
+ *     6:  (12 GB)
+ *     7: Medium (16 GB)
+ *     8:  (24 GB)
+ *     9: High (32 GB)
+ */
 static ssize_t carveout_options_show(struct device *dev,
 				     struct device_attribute *attr,
 				     char *buf)
@@ -1278,6 +1296,17 @@ static ssize_t carveout_options_show(struct device *dev,
 }
 static DEVICE_ATTR_RO(carveout_options);
 
+/**
+ * DOC: uma/carveout
+ *
+ * This file is both readable and writable. When read, it shows the
+ * index of the current setting. Writing a valid index to this file
+ * allows users to change the UMA carveout size to the selected option
+ * on the next boot.
+ *
+ * The available options and their corresponding indices can be read
+ * from the uma/carveout_options file.
+ */
 static ssize_t carveout_show(struct device *dev,
 			     struct device_attribute *attr,
 			     char *buf)

-- 
2.43.0

