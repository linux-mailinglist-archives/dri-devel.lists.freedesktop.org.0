Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 943A5C5C0DA
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 09:43:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB31910EA17;
	Fri, 14 Nov 2025 08:43:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="hW2A79Xe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010022.outbound.protection.outlook.com [52.101.85.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21C6010EA15;
 Fri, 14 Nov 2025 08:43:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t4wAz16dRBujHwhHJ5p0l+UfAAey3BvR+CKZIQye2c/EMh1YLTb6HgNrGvPpn3Hxsr94SDsD7UbFnCaDsAkK0/y8Zy6GciQsLFA3NEMwJ7MMID/aXdFG3k8a6b2esoTSlpw278smPnVLf1RcU7QNrc9iNbLgthV0kqPSVmlSTsvmqvqte+ufwQgE7cMREy5MtGoAkxKTcriJBKzfbJq37fOliOn419SkdiUjPN77w5wUz73jnsBL5I8yfDa3ujZsjajS+6Ab8ka4vnUlVFBWvV4t+iwbHRQy36AMquHiJPRXsO58xbzMFsB55Gfe3LTyhWQOevu6bk1XBW8SKzD+ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eYuKGWQ2DBBBg/AZ8LdZ+6+OaopEE4Dt2ZirKgCKXRY=;
 b=Jkv1WULu1bAIhrlxXpaHpWLBRxoKgxlcz/tjYMFZdyZi9WJfFWeKtPxKGuHfkk5V8rzRnTGVBE+B+seX2froGVXUA8emomGeprk+bSnN1JoqZTLIAQ3uOKMFQiqANFTLuIzvdNq7+pxytgNnEg5BDiRlWZiDOinba54Nru7Va40DhVHeFv80LqWBOdXIL6471oVO9ytyoVL544fBAGqfTJlTou97RI+x93ELROy6CX43NAX8EKoD2UgburkLOAPvKRcP7JOyMQ7/p7shcp11z5Pr398rS+XJ193Aue9lyBLM9VA5Lw7acKC3Jd1Bk0thBiM2ryfM+wlC+WqQyMOJqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eYuKGWQ2DBBBg/AZ8LdZ+6+OaopEE4Dt2ZirKgCKXRY=;
 b=hW2A79XeEK7Zi6DdRAaXynZADxxJTF+kR3N9UCxm2beDTgk0FVRTgEMvjRxNZGixIqqQxRFEcord87wHgTEwQ2eHAw00lMda5yPany4aMH8v0RnKN+OPePOv/HjPhGorRFo0UePbZpQsXd5HZVWE2YZ7ukMS+QTPzkeuAPoG5kQ=
Received: from SA1P222CA0090.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:35e::22)
 by MW5PR12MB5623.namprd12.prod.outlook.com (2603:10b6:303:199::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Fri, 14 Nov
 2025 08:43:31 +0000
Received: from SN1PEPF0002BA4F.namprd03.prod.outlook.com
 (2603:10b6:806:35e:cafe::4b) by SA1P222CA0090.outlook.office365.com
 (2603:10b6:806:35e::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Fri,
 14 Nov 2025 08:43:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF0002BA4F.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Fri, 14 Nov 2025 08:43:30 +0000
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 00:43:26 -0800
From: "Yo-Jung Leo Lin (AMD)" <Leo.Lin@amd.com>
Date: Fri, 14 Nov 2025 16:42:24 +0800
Subject: [PATCH v2 4/5] drm/amdgpu: add UMA allocation interfaces to sysfs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251114-vram-carveout-tuning-for-upstream-v2-4-4f6bdd48030d@amd.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5146; i=Leo.Lin@amd.com;
 h=from:subject:message-id; bh=Iq4LzHnfVQOHklNmbaReZ7Dy8E52PvhZ5SttB0wRcAI=;
 b=owEBbQKS/ZANAwAKAV8XsZZKKe6GAcsmYgBpFuufc+mEG8mdnaZ9iCWeTs3+EM4IlUmbwl/hM
 bgSl6YMX0GJAjMEAAEKAB0WIQQzqV4kW+yguuqHrw5fF7GWSinuhgUCaRbrnwAKCRBfF7GWSinu
 hqqFD/41QFM1hG5KfbcAxzE6+RyDF+9z+uwC1KqjUoyAx3dOwSOSZW5gkUUHpeb8ZjBLJHi2gBF
 oasdhADWSGljBQoS/gKpy+hoWnH1gA4HXXgam+SIwcWX3xv+LQmfpoHxA2UawL7llYLj8D0IAs2
 aYB/QQlraRwRGPNnj19FcL42DqAPRgU2C7+FRRLgCn4uzQj9PjLinp9eSiatJFdiFkAc/Jb57Xz
 kgNju+Gu5XRdntuf3UX5+N9ebofiusAUGc29JjUsZRPlkQ58efQu7BwNN8RTismrMuYNzW2XyVz
 J9XPWyze687QngPvx/Dt1uHFaXMK28ASs0cfxi2yUFmycRFVKMS7mjr8SaRuNsZyscJRPgkonfX
 P4cAMawe9oMP2imqqcCMqtiMWePQ+M0MtF9IQBqQqwnP+TqcX2IpObWLnubPZGorzOGPHdceaj/
 iIb2i+1lixjJqxTgPEXQxkpUEs4R+zNy/Ku8pWkqVhaKDNp6/SK9kGWIWmwoeRdGLKJPHZL+IpV
 P5aMf30ok5FJkWQrw8fk1ye+CJgDEJ0HWDWHlc87uZMGt/VNs58+QgDJCSl9yrf6boWn+sMph6y
 5D3UvaI6Lwf3pWFbWNVOUpf1TULoPaXaREd8SFiGxo7IjPCf5KKJNq7aRJkLc7jnMnYZ9JciS2+
 PdzszZdl2Wmh6+w==
X-Developer-Key: i=Leo.Lin@amd.com; a=openpgp;
 fpr=33A95E245BECA0BAEA87AF0E5F17B1964A29EE86
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4F:EE_|MW5PR12MB5623:EE_
X-MS-Office365-Filtering-Correlation-Id: dfa96c94-79af-4176-4c3b-08de2359e315
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|7416014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bllDYUI0dHpWVWtZNmk1YXNQMGNLUytmd1ZvL29mWXNId0R5WW0wam5waVpx?=
 =?utf-8?B?VU5KVndqdlZCQjB0aDcvalp0eWZLQU5WdWJUYzFiN0w1UGE5V0xHYThxVDB6?=
 =?utf-8?B?b25EalJ2Q2pxNVhrUm9Vb3pPQ200dzhqVCs2ZUY3ZjR0MWhvNkg1ZGZjYVpG?=
 =?utf-8?B?cjhhOW9DRlN3Mm5McnRGU2xTd1BTYnV4Qkdydkh5czAxYmZVNkVYZ2tLTUta?=
 =?utf-8?B?TzNLNWVPTkpTcFdGMm5pSWNjenI5c1hsRXl6T29XT3VxQ0xDRGZBM3FkMzlL?=
 =?utf-8?B?ZWFzY3M2dldnWDZ3N2Z2N3hTcE1JSlY0a0dMaEJYMmUvMzhIVnpNTXd1eFBN?=
 =?utf-8?B?ZTc3U1dyTGdQQVoyQURIajJCNkJZZ2xYQ3M1R2VlalgrdXFNSkV2RFB3c2RM?=
 =?utf-8?B?b0tkRmFUcDFDVmhuSnlldFFmZ20zTE5GY2dnUHZtejhpUUFKWVFNb3E2UGFQ?=
 =?utf-8?B?TWk1SytFTUtOQyszaWJMVm1vMndjSmJHQ01nbFUwajhhcGZHaWpjZ2ZwY0RV?=
 =?utf-8?B?RU9UVDBUNVV0c1VsR3BTTStLRnBMZW5sNTJQMkxNRkgrY0NWQVJTVk12MDFi?=
 =?utf-8?B?cVRwYnU4WWNueTlRNURFdEFTMm91bjZDdWw1MWpKUGtrWjQ1RmlsMG5oek9Y?=
 =?utf-8?B?bGdvcytTWlJtRnJ1dkVqd0VRZEhpUFBFZ2pFNUN3TmtmbTl6Y1Jsd08vc3ds?=
 =?utf-8?B?Zk53TEEyZWtnRWFaL0tTckFOMEZCWkFQNzAwVXZDUm9jZ3Erd1hLUjdwdks1?=
 =?utf-8?B?V3JSQ1ZPT1kyS0NrUFlrMWs0L090Z29RUnRKSlY1K0pEeHd0MUd5MGZLd0Yv?=
 =?utf-8?B?M3h5SUdqK2NPandNQWNrMFpQOXF5cG4vT1Z4dWhoZVJDTE04cVc5VG9UeUZ3?=
 =?utf-8?B?Ujk0SEowK05qTVAwUFJlcFNEaWkyZm8zbHRrYlR2bTlEWitxN05mSHNhNGYy?=
 =?utf-8?B?TXBFdDIvRzh4NFhiR2xEQVNxdFh0NlJsUVQyNlNTUkhlME1XcmgrS3VLUUh2?=
 =?utf-8?B?UEVqMzgzRS9UcDk5cjgrVS90KzRtcC84cW90TFd3Y25oWU51d1RKZkZVY1FC?=
 =?utf-8?B?Z3pZV01MUVgxeUtHVy95TUVXMlY2N1BOK3BpdUsyWk43b3lFTTFkWTdKajl6?=
 =?utf-8?B?RXlNNkVld2ZSYnl0MFY3TWdIQ0MvSmIrZ0M1KzMycU9uQ2dpeUN0UG5OTWNW?=
 =?utf-8?B?dWdOc1BnaVdjd2haRHdURG5GcHRjRnlhcWF5SzdRQXEyY1l0UUxaWHUvMVY4?=
 =?utf-8?B?ME15VUpkcVF5T2xoTkZSS3pUQWhDWXZ0VlRMK1ZQeWtOV2pFK2FVTEJpQ2hR?=
 =?utf-8?B?RHVRazFjL0Fya016NTUxK0FKcm9aMHN4YWJ4L3E2MUVqQldoL292VkprL1BB?=
 =?utf-8?B?SXBGOHVkZ0dzcjJiTzJxTTNmZldFSUdnUGhYUGFJemNoaHB3WFhQaE1tK2c2?=
 =?utf-8?B?ZFYxVTJZd1NBMWZMUjdGSVdBYTNEVzIrVEFwRFFNOHg5L3VLd3FDakhOU2dV?=
 =?utf-8?B?SHRzLzVXQ05pYW9INW5HL2hwMGI4NDFVUE41ZkQvWm9FMjBoOG5odkpEUURy?=
 =?utf-8?B?bnovM2lZSG5tb0ZPbDVoMHU5cXRnbTVDdi9Rc0dWZUkzRzRHekZoVkl6S3Rx?=
 =?utf-8?B?WC9VUDE1RHZCdHVRem5yWDU4Ykcxb2FuUWpnYnZsS0xlelZDSVh0OXZGeFdM?=
 =?utf-8?B?Z2gyekxkem01cVRKYzU3UjBEUmVmUFJmZnplcnY5a3l0NFFwMFVTRWlYeUwv?=
 =?utf-8?B?M0pZNE5wVHAxUmJXNEtKRks5eVZLMmo0UXJlUXdVYVhReFFZLzFvdVk0NnUy?=
 =?utf-8?B?TXM1cW96M21UQkd5K3paQWttTVh3aFNwcThvR2ZIRm83OHNTN2NWR1lxeGc5?=
 =?utf-8?B?eVBBWnM5M3JKVXRhaDc1bFI2Y0c2YTFmblFWSVQ5RnFRRm0zZVBNWWhzc2hx?=
 =?utf-8?B?R0RXVVViWnViOGk1YVJ5aUpLb0xzeG1mYUcybkZ0RXdITTlXcGZIazA2bWR4?=
 =?utf-8?B?SU5wRHl0ZjF4TlFhbjFWMGt0V3lXZGVWbmVNNWNLNVhibnZnTjd4UlArTktS?=
 =?utf-8?B?M05yTmJ1a01yQW8wRlpuMlNoWGZidSttZmJNNzZONzFrUmJ6ZmRLaHFZS3Mw?=
 =?utf-8?Q?WDeY=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(7416014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 08:43:30.1413 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dfa96c94-79af-4176-4c3b-08de2359e315
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA4F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5623
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

Add two sysfs files as interfaces to inspect or change UMA carveout
size. These files are:

- uma_carveout_options: a read-only file listing all the available
  UMA allocation options and their index.

- uma_carveout: a file that is both readable and writable. On read,
  it shows the index of the current setting. Writing a valid index
  into this file allows users to change the UMA carveout size to that
  option on the next boot.

Co-developed-by: Mario Limonciello (AMD) <superm1@kernel.org>
Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
Signed-off-by: Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c | 127 +++++++++++++++++++++++++++++++
 1 file changed, 127 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
index 444ab4102168..b9378f34eb79 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
@@ -30,6 +30,7 @@
 #include <linux/power_supply.h>
 #include <linux/pm_runtime.h>
 #include <linux/suspend.h>
+#include <linux/device.h>
 #include <acpi/video.h>
 #include <acpi/actbl.h>
 
@@ -1247,6 +1248,125 @@ int amdgpu_acpi_get_mem_info(struct amdgpu_device *adev, int xcc_id,
 	return -ENOENT;
 }
 
+static ssize_t uma_carveout_options_show(struct device *dev,
+					 struct device_attribute *attr,
+					 char *buf)
+{
+	struct amdgpu_uma_carveout_info *uma_info = &amdgpu_acpi_priv.atcs.uma_info;
+	ssize_t size = 0;
+
+	if (!uma_info || !uma_info->num_entries)
+		return -ENODEV;
+
+	for (int i = 0; i < uma_info->num_entries; i++) {
+		size += sysfs_emit_at(buf, size, "%d: %s (%u GB)\n",
+				      i,
+				      uma_info->entries[i].name,
+				      uma_info->entries[i].memory_carved);
+	}
+
+	return size;
+}
+static DEVICE_ATTR_RO(uma_carveout_options);
+
+static ssize_t uma_carveout_show(struct device *dev,
+				 struct device_attribute *attr,
+				 char *buf)
+{
+	return sysfs_emit(buf, "%u\n", amdgpu_acpi_priv.atcs.uma_info.uma_option_index);
+}
+
+static ssize_t uma_carveout_store(struct device *dev,
+				  struct device_attribute *attr,
+				  const char *buf, size_t count)
+{
+	struct amdgpu_uma_carveout_info *uma_info = &amdgpu_acpi_priv.atcs.uma_info;
+	struct drm_device *ddev = dev_get_drvdata(dev);
+	struct amdgpu_device *adev = drm_to_adev(ddev);
+	struct amdgpu_uma_carveout_option *opt;
+	unsigned long val;
+	uint8_t flags;
+	int r;
+
+	r = kstrtoul(buf, 10, &val);
+	if (r)
+		return r;
+
+	if (val >= uma_info->num_entries)
+		return -EINVAL;
+
+	opt = &uma_info->entries[val];
+
+	if (!(opt->flags & AMDGPU_UMA_FLAG_AUTO) &&
+	    !(opt->flags & AMDGPU_UMA_FLAG_CUSTOM)) {
+		drm_err_once(ddev, "Option %ul not supported due to lack of Custom/Auto flag", r);
+		return -EINVAL;
+	}
+
+	flags = opt->flags;
+	flags &= ~((flags & AMDGPU_UMA_FLAG_AUTO) >> 1);
+
+	guard(mutex)(&uma_info->update_lock);
+
+	r = amdgpu_acpi_set_uma_allocation_size(adev, val, flags);
+	if (r)
+		return r;
+
+	uma_info->uma_option_index = val;
+
+	return count;
+}
+static DEVICE_ATTR_RW(uma_carveout);
+
+static struct attribute *amdgpu_uma_attrs[] = {
+	&dev_attr_uma_carveout.attr,
+	&dev_attr_uma_carveout_options.attr,
+	NULL
+};
+
+const struct attribute_group amdgpu_uma_attr_group = {
+	.attrs = amdgpu_uma_attrs
+};
+
+static int amdgpu_acpi_uma_option_init(struct amdgpu_device *adev)
+{
+	struct amdgpu_atcs *atcs = &amdgpu_acpi_priv.atcs;
+	int rc;
+
+	if (!atcs->functions.set_uma_allocation_size)
+		return -ENODEV;
+
+	rc = amdgpu_atomfirmware_get_uma_carveout_info(adev, &atcs->uma_info);
+	if (rc) {
+		drm_dbg(adev_to_drm(adev),
+			"Failed to parse UMA carveout info from VBIOS: %d\n", rc);
+		goto out_info;
+	}
+
+	mutex_init(&atcs->uma_info.update_lock);
+
+	rc = devm_device_add_group(adev->dev, &amdgpu_uma_attr_group);
+	if (rc) {
+		drm_dbg(adev_to_drm(adev), "Failed to add UMA carveout sysfs interfaces %d\n", rc);
+		goto out_attr;
+	}
+
+	return 0;
+
+out_attr:
+	mutex_destroy(&atcs->uma_info.update_lock);
+out_info:
+	return rc;
+}
+
+static void amdgpu_acpi_uma_option_fini(void)
+{
+	struct amdgpu_uma_carveout_info *uma_info = &amdgpu_acpi_priv.atcs.uma_info;
+
+	mutex_destroy(&uma_info->update_lock);
+	uma_info->num_entries = 0;
+}
+
 /**
  * amdgpu_acpi_event - handle notify events
  *
@@ -1291,6 +1411,12 @@ static int amdgpu_acpi_event(struct notifier_block *nb,
 int amdgpu_acpi_init(struct amdgpu_device *adev)
 {
 	struct amdgpu_atif *atif = &amdgpu_acpi_priv.atif;
+	int rc;
+
+	rc = amdgpu_acpi_uma_option_init(adev);
+
+	if (rc)
+		drm_dbg(adev_to_drm(adev), "Not creating uma carveout interfaces: %d", rc);
 
 	if (atif->notifications.brightness_change) {
 		if (adev->dc_enabled) {
@@ -1343,6 +1469,7 @@ void amdgpu_acpi_get_backlight_caps(struct amdgpu_dm_backlight_caps *caps)
 void amdgpu_acpi_fini(struct amdgpu_device *adev)
 {
 	unregister_acpi_notifier(&adev->acpi_nb);
+	amdgpu_acpi_uma_option_fini();
 }
 
 /**

-- 
2.43.0

