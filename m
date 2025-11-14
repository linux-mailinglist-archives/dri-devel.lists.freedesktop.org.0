Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A26C5C0DE
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 09:43:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70FD710EA15;
	Fri, 14 Nov 2025 08:43:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0e5wfIWf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012052.outbound.protection.outlook.com [52.101.43.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CDA910EA0F;
 Fri, 14 Nov 2025 08:43:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TXKl/gm/kHg3P4oPTMJBxWKWYDnySjvV7dgHoLyqNt1ZoIUCzVQqePoO4rkB0h4zhGgiEkqAzernIxDYNqONm2FeBQ8pvdZfvENnUOqFFp/PKzVfVwlyQOD9U5DFINeDHsjnXj3x/XJ13/rLf4jE09gNTloI5xz9D+0Utc4w7OZIc/po73GG8cuAkIuLQx6WZYAJ8MddulOe3R5N/ZnEMONWI6OYLzGqHMOVi6HQU8tuXHggUSQG91xTXosu8zPwj5/Y34h16DZvFMXLRgpS9keARN/ygAusSOkRwTlMSQK6GxyhEvlVYVGN2dE+WT2mfxd5jGVLZX0SJ4UUc34Iyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4KqvLt06KCnk7EeJMP6HmTPmUVbExrMS5BhtmLvFyOI=;
 b=PKb+Pi6F+TlDO4OIiWifTHCu+ia/T5dF3thsA5EljW9AZ4HajJ3HpyE/KBAWB6K69l0cGXjWlJfVmEOMXX+jgh1UEpul+HgM1HdSrsmVyj2dItj544LBmuHmW6UoczrWUOQn/zR4ya087/5BNZaFZojRuWrSgp69m+ivp+sX4tDNgjovmIn6vHgPuxxtUnm5l2YTgDE5F6op8csvedtCQYpPRruOrYazHjHutsQFL/f+0WTb+jY0jHOroMunzWvL/+4nVFW98k2xWOh9OWzQaiOEDqBA1y4wcR/PWt2VxPFPCoUpm1DKdkS3n7lHS8nnDBZhNzmCiuevx+iWmu4XbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4KqvLt06KCnk7EeJMP6HmTPmUVbExrMS5BhtmLvFyOI=;
 b=0e5wfIWfa14sGyErN1dHEc+/P1qOjUWBA0W0l+BE5dJVQu2JuzJspbEZdwd5MrJnQNIYCo2x9DbXv6jTj7qjMwWbssOW6hgyRL2HlTNU4wFmsFrFu8I7dKbsJpXOT0zamlXOdPSEX8vCNsXSaU5cVuA3GEElSw7hejKMGrP4YiM=
Received: from SA9PR13CA0024.namprd13.prod.outlook.com (2603:10b6:806:21::29)
 by CH0PR12MB8530.namprd12.prod.outlook.com (2603:10b6:610:188::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Fri, 14 Nov
 2025 08:43:34 +0000
Received: from SN1PEPF0002BA51.namprd03.prod.outlook.com
 (2603:10b6:806:21:cafe::ab) by SA9PR13CA0024.outlook.office365.com
 (2603:10b6:806:21::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.6 via Frontend Transport; Fri,
 14 Nov 2025 08:43:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF0002BA51.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Fri, 14 Nov 2025 08:43:33 +0000
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 00:43:30 -0800
From: "Yo-Jung Leo Lin (AMD)" <Leo.Lin@amd.com>
Date: Fri, 14 Nov 2025 16:42:25 +0800
Subject: [PATCH v2 5/5] Documentation/amdgpu: Add UMA carveout details
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251114-vram-carveout-tuning-for-upstream-v2-5-4f6bdd48030d@amd.com>
References: <20251114-vram-carveout-tuning-for-upstream-v2-0-4f6bdd48030d@amd.com>
In-Reply-To: <20251114-vram-carveout-tuning-for-upstream-v2-0-4f6bdd48030d@amd.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3049; i=Leo.Lin@amd.com;
 h=from:subject:message-id; bh=1Gech4UZL+Rzo20DHFd1ooWDkRu1aVIs3OEnjhIY3kA=;
 b=owEBbQKS/ZANAwAKAV8XsZZKKe6GAcsmYgBpFuufIE+L3jZoYNmoqehcwRl87AJNLOXT4jcdx
 AVYItY2YM2JAjMEAAEKAB0WIQQzqV4kW+yguuqHrw5fF7GWSinuhgUCaRbrnwAKCRBfF7GWSinu
 hvWsD/0WKbA7Qw2KU31JZGwLrprEJMCAzIw3e/zq3Bv3szdMB4S4YPaPuocxNQjME/fuYxGMaHj
 6Jyn8PDlHjjtjd17NeRzQDjnTpnVrem9FRz5DE2bea2Ng/JHgx5xI6+817jBp86ghTgaik2MCVW
 dKdAvhh7P4BR35z7BZBUeaJDCB/xxMINB5oEJ+OG1kuVh8NTqcS8BEdyyCYgmXnCYSEfPz0fJCB
 uXWYj6S0BVoF6Jf9+TGy/C+U0tGlcOpsIwQmM+MaNBXX0VZMIANglvG+5pi3H0+YCJUIoTH5aix
 DdEydossq3SFu7R3Lc72BQKWEWeUUptWPk+xpZvZHVc6wdfTrKbL2JnHHTku4EWQnQpGk8iIjN3
 KQ7GFMM6s+LVGLU7pZrs71LKPkDoiIEbtv+lER7ML88UPkC2FX7GS6qqrzrSvVdlVGvWKBZEHJW
 c4WXxflN/cMkOrozvSU+G1gatpDrkb1UKfwC3pxFy2ZR5mrJAbHhwnhEm3SCrh2IxklBQ5gtRq4
 x0AA9+Hj1kM5mMSGzB/cUDQ5B9eG1Mu1tjl7USiZHryK89kwXnJEp799GeqKIWK+C2NGM7FNPcK
 2MblIrFcYzuqd+9/z9KNkOeCQY3IcVSEG+liMHcsaus7W2a0CXkuZvJhVg3mgNXq+LARuWhBYGe
 WmSIOAJ2fIxKqKQ==
X-Developer-Key: i=Leo.Lin@amd.com; a=openpgp;
 fpr=33A95E245BECA0BAEA87AF0E5F17B1964A29EE86
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA51:EE_|CH0PR12MB8530:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f87391a-8b68-4937-8fd6-08de2359e52a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|7416014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N0F5TkVjVjd2VEoyRWowbFdZTDExNnB6aW1HTzZjVVhHZkRySUl5YTllZStk?=
 =?utf-8?B?YTdXZHJ2Ti9NdXFzd3BNU2VhL1ZDRE9ZYW14dzNac1hNOSt6cUwzeVFSU1JS?=
 =?utf-8?B?bTYyYnF5aFRiK2RSS3VEY3dZOEI4eEo2ejJkQ1JUK1lUVDlSSkVQemxmdUxD?=
 =?utf-8?B?eHlLUWkzNTMwdVRSKzdLS3FjU1M0VzhxajM3eXVRYm9EVDQ5SjdUVWtZYWxr?=
 =?utf-8?B?aUFJaW5Dc1pNb2xJMjk0TnQvaHE0UENWTk5DUW5mUTBISHo0RUR0WVJNeDF3?=
 =?utf-8?B?YTRsOW1iRlBiL0pXQSs0QU5aRUN6N2R2SC96Z1Z2Z1dIZ3pjUzFBemFIczgv?=
 =?utf-8?B?T2dyQ2lkSWJzdnoybjVjdDkzRmYwR3lxanZhTU8wbWRLblN2UnhkaGRiV01n?=
 =?utf-8?B?TzZKVUkzN1dJUkx1R09xelp0K2JqN0xqNlFhZzFiSE1xdUsyMmR3WUtweTZF?=
 =?utf-8?B?UUtKUkY5UEJSWVJLOEZ0Q0lPQlVZMkJITm9HQ1BSM3ZzY3VvKzdnMm5pd2NU?=
 =?utf-8?B?dmRUdjZGVitCMjdqenFQTTZybisydjMzWkEzQXBPKzdEQUd0bVFoUlhsN2U2?=
 =?utf-8?B?VFNLbEJmN296QUFKTU42d2lMbmt5cnc0QnBMSlhJWWZVQjEvaGl3bVpCSFBE?=
 =?utf-8?B?dFJaZytnbGMrSklxWmJGTjBEWW1kR0xVWGRua09PZGRRVnM3SU9UVHNTQ1hs?=
 =?utf-8?B?Q3c1Nk12OS94V3J3T1hONnJHK2lNY2FyZiswT3dRbWNhM0t1d3lEYlFmUkNK?=
 =?utf-8?B?ekFDcEMyTmExSURrL085ekRqWHVKenA4Rmd1NnprUDZIOTUxazhndDUzUXha?=
 =?utf-8?B?Z0Z0T0N5WUQ1aWc0U0M1NDFBbzRVNTdwTzl0NlJWSE15eFZiWnIyVEh3OFBN?=
 =?utf-8?B?TWFGeWxzQVI0cDBDY1RYVE1jNENiUmJnck5mKzB2SGFqOHJEakNFaUxQYnU0?=
 =?utf-8?B?V29TWUJYUHVYTXE1U2x1N29iTFpyN1BOZHFFU3Joa3ZJQWNKd1dwZUVVd1Rk?=
 =?utf-8?B?WFAxMkFydzFlYVV6R1dvS0txdHFObzdyZVJGcEFBQ2pta3dPMGcrYUFOeFhR?=
 =?utf-8?B?Ym4rNUZoOXF5WERXSHNVbjNFRTNGQXhOYkdvU0pQVkw3by9YRUg2VmFMaXFz?=
 =?utf-8?B?R3JMc1pTaGNvRW1OamxxcWFWdElMM1BidWYvYUJjaU1HZytRVWpIV0RDNkQ1?=
 =?utf-8?B?a0txdkdGbzRIUkVSRXhPTEwxRHEzWkI0dUZtdUZDdG91VlJKM1k0SkFxWlBU?=
 =?utf-8?B?NTU5Yk5WTjEvSWljZC94YXZnVkU3QzJ3eUJjMnNMaXZyS1BrUEFFOHltNkhZ?=
 =?utf-8?B?T3FZcUtvUjhsVUNQV0kvcGxnbkkreGdENDR5cWRBOEl6YjhQTGpOUHVpeS9X?=
 =?utf-8?B?L0E1ZWRsTm9oUWp5aHZGejFCY09ENWFab3lSTEtVenFOM2ZCdjJGdzFDaDJy?=
 =?utf-8?B?aUtFTGFPbS8xbUJDS2hrTENpWGZWbFJ2L1NJRFU3cVRKTVNsbVVMTjlKQkpm?=
 =?utf-8?B?N1Y5ZE1LYzJFRWxsZ200MHYwYTlsQ3l1dk9vbVk3UlZ2WHI4OHA4NHVHVHVn?=
 =?utf-8?B?bGhRREZRSVZ3czFETTRpMkR0TXE2K2t0Q2IvUjlVSmFxKzRnSmgrTzhYM3FZ?=
 =?utf-8?B?ekUwU3lPWHZXNGNmOVhSOFBTZGhJQ3VqeFRBUndOTFlNaGZvTStQT0JaTG1T?=
 =?utf-8?B?R0dDT21hZnBBVFFUNUZpaXgyUWw5WHduVDNxWFYzZS84c2F0N2VzczVwZk9H?=
 =?utf-8?B?M0VNNWRXQVhjZXFteXowbC9LbjFBWnJUYzh3bVZZaElCQWVmdUY0NjI4KzA1?=
 =?utf-8?B?WXNacDZJa0xCMHgxaWZlODBIaURDei9wN3FEY2lYQ0lNeFVQK2E5LzlUNlBa?=
 =?utf-8?B?SmYvN0RWQ3lIMDdsTFpWVEM2MUhHUGhnZkNycExSaVFtc3R4eUJXam9tbmNL?=
 =?utf-8?B?UDIrLzZJSmQyS3JVVUlZWnJIOXBoTEtvYXZjc3dkMGtRb0MyMW4rRkRjMUN5?=
 =?utf-8?B?L3VvSGlqMVU3c2cvWDAveTJVcGNubnFrQnVjTmg4R0Y4b2hGc3J1a1FJa3JZ?=
 =?utf-8?B?VGNhOTJXOEVQL1U3VWpKUlQyamtpVG1pN2NjNzdYNVpBZ2dzQjZQRVMyY0l2?=
 =?utf-8?Q?U7Z0=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(7416014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 08:43:33.6402 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f87391a-8b68-4937-8fd6-08de2359e52a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA51.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8530
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

Add documentation for the uma_carveout_options and uma_carveout
attributes in sysfs

Signed-off-by: Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>
---
 Documentation/gpu/amdgpu/driver-misc.rst | 26 ++++++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c | 29 +++++++++++++++++++++++++++++
 2 files changed, 55 insertions(+)

diff --git a/Documentation/gpu/amdgpu/driver-misc.rst b/Documentation/gpu/amdgpu/driver-misc.rst
index 25b0c857816e..afefab4fa0ac 100644
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
+For those platforms, users can use the following file to set the carveout size,
+in a way similar to what Windows users can do in the "Tuning" tab in AMD
+Adrenalin.
+
+Note that for BIOS implementations that don't support this, these files will not
+be created at all.
+
+uma_carveout_options
+--------------------
+
+.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
+   :doc: uma_carveout_options
+
+uma_carveout
+--------------------
+
+.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
+   :doc: uma_carveout
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
index b9378f34eb79..10cc6bf28a0f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
@@ -1248,6 +1248,24 @@ int amdgpu_acpi_get_mem_info(struct amdgpu_device *adev, int xcc_id,
 	return -ENOENT;
 }
 
+/**
+ * DOC: uma_carveout_options
+ *
+ * This is a read-only file that lists all available UMA allocation
+ * options and their corresponding indices. Example output::
+ *
+ *     $ cat uma_carveout_options
+ *     0: Minimum (0 GB)
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
 static ssize_t uma_carveout_options_show(struct device *dev,
 					 struct device_attribute *attr,
 					 char *buf)
@@ -1269,6 +1287,17 @@ static ssize_t uma_carveout_options_show(struct device *dev,
 }
 static DEVICE_ATTR_RO(uma_carveout_options);
 
+/**
+ * DOC: uma_carveout
+ *
+ * This file is both readable and writable. When read, it shows the
+ * index of the current setting. Writing a valid index to this file
+ * allows users to change the UMA carveout size to the selected option
+ * on the next boot.
+ *
+ * The available options and their corresponding indices can be read
+ * from the uma_carveout_options file.
+ */
 static ssize_t uma_carveout_show(struct device *dev,
 				 struct device_attribute *attr,
 				 char *buf)

-- 
2.43.0

