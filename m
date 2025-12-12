Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A50CB82FC
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 09:00:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7CB310E566;
	Fri, 12 Dec 2025 08:00:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="asmmag3N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010061.outbound.protection.outlook.com [52.101.61.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A70D10E566;
 Fri, 12 Dec 2025 08:00:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sPa+nGShgYjpbBzwdg5geFMVkxdBNc6CpksZ2qpJ0jgeLgQ+2CEvmaswi0xKikaJKDAcFRpsSOq6YVTPlTj4bdnrQfWXfQaHY/dPpRt2KQ/uTWulnqXfIIxTGlSHtDKPHur3bVyhIuf9TvSWZvAo2jeUwJypVlALi9e8EWxp6E1bADZPJ1XZOJzauzO/4G1ScDUCZjbVR+vRc8M+wAnp9VMw+4fN+oC39XX71PGlzoR6f9D3MdSPbUCTmRwXm9nZKoTxhsI28eFrdPI3DUq9jWL+rsG5MjCGEQXVRH/40GwpVAof5Obwjb6MVyiMS6v4bgvBoGxfyGuYIAwxEOrB8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r5OPfoUj+YiSS+3TPGyEd8tQHaVeiHIwC0unXKKD6W4=;
 b=g/cOKuwqRnIwfn2gCjbmTe9OzLEiaD3LBnDtaYD/BSC5RB4aY2O8fANmSNA8M/2mr1fzdD/OHu8EEaNk3E4qiJlCgLH1Ed2x47tY9P31Erqi54ZJMAVacUUssWLkMbnw25Eg7+nFxNReGIbkgkok/yk3h7ckAlRF6i5HgRdokw+o/HCN6hnn/TWisdfmzc42X1goUjRnyAu0CmMTCH7gZ90YvK1i9TfAbkP8V4Fr7fCHc9obzghgFQg3D3TpidaKt5AaEbWEaY9BKdjHwZ0wJYYG+SbUn+2YVy7p2v+mVWgIDwu7RjYkKzUqdeva1oogR9gVChq04wjjcVGIkjsyUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r5OPfoUj+YiSS+3TPGyEd8tQHaVeiHIwC0unXKKD6W4=;
 b=asmmag3NFmRgZSShwGOxI8wnwNtR8YrM7jZhWPVJzlEPQLphimea1Bym/BJHe7wzAF6AZVsFjqcr/72CaDkgj0+zIs1mRvOt2QKwf9mFG4qhGVH0nbSbO7Q0WI6VwSFXMj08T4VICgz08Od44IdQDRD5RjoPMStM0yZW0FXI3ZI=
Received: from MN2PR16CA0052.namprd16.prod.outlook.com (2603:10b6:208:234::21)
 by BY5PR12MB4100.namprd12.prod.outlook.com (2603:10b6:a03:200::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.11; Fri, 12 Dec
 2025 07:59:54 +0000
Received: from BL02EPF00021F69.namprd02.prod.outlook.com
 (2603:10b6:208:234:cafe::2a) by MN2PR16CA0052.outlook.office365.com
 (2603:10b6:208:234::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.9 via Frontend Transport; Fri,
 12 Dec 2025 07:59:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF00021F69.mail.protection.outlook.com (10.167.249.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Fri, 12 Dec 2025 07:59:53 +0000
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 12 Dec
 2025 01:59:48 -0600
From: "Yo-Jung Leo Lin (AMD)" <Leo.Lin@amd.com>
Date: Fri, 12 Dec 2025 15:59:17 +0800
Subject: [PATCH v6 5/5] Documentation/amdgpu: Add UMA carveout details
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251212-vram-carveout-tuning-for-upstream-v6-5-50c02fd180c9@amd.com>
References: <20251212-vram-carveout-tuning-for-upstream-v6-0-50c02fd180c9@amd.com>
In-Reply-To: <20251212-vram-carveout-tuning-for-upstream-v6-0-50c02fd180c9@amd.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3210; i=Leo.Lin@amd.com;
 h=from:subject:message-id; bh=yQdDEMkJoZqecXdgHB1NDSmL8tHRPTgujFwa3VxSL38=;
 b=owEBbQKS/ZANAwAKAV8XsZZKKe6GAcsmYgBpO8ti9q4CTN0kX0vNrCLbiYaNlg97Myn22Y7WH
 wLCSCFu9HGJAjMEAAEKAB0WIQQzqV4kW+yguuqHrw5fF7GWSinuhgUCaTvLYgAKCRBfF7GWSinu
 hnB+D/96EyrG1hep6lgbYRPFtXJZmVjsjyqXJ39L2IAdr3/2SZ8Vsx5+EuobSEShAIQZCfOtFQD
 igwKu2Mpz2j8//CcZjRooRbraEu+B35/fThA+lXrLBi/wiN2LkY96eDqHw+utrSvxg3CsKdjHTQ
 It6yFCECyTVHCt+F4ymcFgIaqKbcer5QmD0+H2ihRC/Wl8Z+Og1V4tm7pf6r/6V+raM6eo3lvna
 pi2+Z1fxFlMzpNCBFYg7HuxzlPFu8uH3FbRzZhd6vkl/t+1RRvU3qD6NV00JZqMvM2va52UUMbg
 7XPQDPBGCYw4lw2X6l4Xiu6GCXwm39l1QRr6KkX7GTu3WMveWQyoiaToHGQoQlbhXtB0R9z6Vh4
 AhcUHSOIqikOQwZfw8am4VPOpP4DLdL9edndEwiAIqGNQ1PyECyD30b5HU8unqlYW2wnve9TJio
 yTF9FHKG390s6DtAvX8yKPNw9Xv3vzP9UuyVuFYgdl9jeON0ifMQuFs2R3ByBVNPfrYbCCbgL6o
 7wXrYdiuMFf3dmtF2oZu0qx9ZD04k5zEmzwSHafTdX586+p3DPVjkpyGjddO6vqPWUw8u/qtVqZ
 FPfYzqk0L56dhkempVywSdusNx8005EhNT6kuDfmGmWPhdEms8MgpikJh0Mz+8/V02Ixds1IXvj
 +5BCaopBvcwOgUg==
X-Developer-Key: i=Leo.Lin@amd.com; a=openpgp;
 fpr=33A95E245BECA0BAEA87AF0E5F17B1964A29EE86
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F69:EE_|BY5PR12MB4100:EE_
X-MS-Office365-Filtering-Correlation-Id: 723e1b6c-22ab-4f01-3e2c-08de39546f07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UW82Vmt4eUZUM3FUWXN0d3dzZklDbWVGWVpmRFByekxMZ1R5bG90Rm53bjF5?=
 =?utf-8?B?b25WNTkzczZWWS82M0FRYXFyOUhwbWRmQTVVQUZyeXZVQzlvRldMQWExQlQx?=
 =?utf-8?B?VTZySDZZRU1TZ3ZtazFQdVNEeDlacVZkRndzKzg4RzdFV2wxUHBpNmxzTzhr?=
 =?utf-8?B?SUdhVmd2dllRc2tVU0N3WWpGTVlYa2NIQmRyTHpISW9vN2NKeUMvUklSeW85?=
 =?utf-8?B?ZHQ5MUFETzZ5VEtDZ3did3dKYnpjWG9HL1dGelBGci83RHArb0cxOVd2dnhN?=
 =?utf-8?B?dE9vRXl0SVlhZHlHU0NYVTVJZGdBZ203bVQ0TWQ5NnV6Y0c5TFFYR2hISmxw?=
 =?utf-8?B?TmNkOEdWU3ArWFhvZGloYTFjdGlkVU4rNkZkNEE5Q00zZVA4dkFmNDYwL0JO?=
 =?utf-8?B?a1RoU3ZGc1hmVG5XMG5SbXJUVHk3WkRsRVYwMkI2ai9KT1dKd0ZlYUJNT0NF?=
 =?utf-8?B?d09Nek5SUG1GOXZXSG9wQnZ3U3NwczgrS2ZhSUl1cFBlTGhNcDl1bldobkd3?=
 =?utf-8?B?aFl1MFBHVEZRdjRhVU5FNkthQnJ6dHhLNHpoYllQRnpOQTJyVENmVmJVaU9n?=
 =?utf-8?B?alVDQlRiMXZleDRZRFk0ODBTWHBDdDc5K1dNKzM0dmh4aU1TODFHYTRuekdB?=
 =?utf-8?B?OEg2TTZaS3dFa1Bza2I5bE9kOTMvcE5sUWxKU0pPZis1TXRXcnFYaDVnZUpT?=
 =?utf-8?B?aXppVjZkZlhDc1M2SGRpc1ZHVk95aFBrTWNtR3ptWEpvUUhheEJhVU1vYXlj?=
 =?utf-8?B?VkZ5bk1qRUw4b2F4M1VLeWY0MVNqa0dlWS9xa0lOWVEwa3YxY24yUCt2WGVm?=
 =?utf-8?B?V1dESDlGN3QzQUErd2pFTTRmZHhaV1JaTnNyVDVNek1NZHQydW8yYk5VdXky?=
 =?utf-8?B?U3IrVGlYMnRpZHdlbjNpN3NONTY5TGNrRlJZVERLaGRNVm9lcFpORUtvQTQ1?=
 =?utf-8?B?blpWa1A2Vk1uQ2pCWjV4NkNXZ1lWRWZqLzVYZTFDVm9zZVpMWm5PUHp0cHdT?=
 =?utf-8?B?RUt5MVpqVU5zZ1kxcnNKd3BxYnBXMSt6L09zaWVNOEZNZGtOK1h4TDhidjhw?=
 =?utf-8?B?eVBXeW1EZm9tL21MSGQ1Z2p1UlVtMWE2RlByZFlZSTJmeFlIVSt4OTBCaU5j?=
 =?utf-8?B?U2hGd2hwWktPN01EWEJLQ1IwYWFRc2dwTjBvNEtubkE3dXBmUVlhS21SblVL?=
 =?utf-8?B?NVhpcjhxRk9mVjl5a3hjL0VJM2dZVDM3SEI4alJuMlN6Z0NHTG1ya1hkS2t5?=
 =?utf-8?B?UWwwbEFGdFd5Z296OFFRVzAxcHNpOXBuNXdwYUJuOWJ3NGFvWDZId0o1T21X?=
 =?utf-8?B?ZUZPY0NVNHRxVWtQL1FFSVFwR2x0ZUQzdGV1MHhOa2JDUGlOV1BMYzc5TWtz?=
 =?utf-8?B?aFR1ZkxVQ05zanNhV250NjJCRllkaWM2U0FHSFZTY01vUWNnK1VPREFIbjhi?=
 =?utf-8?B?YWZTa20vbzBRaUxWSVFHekZrNkpoTWRkWTZ3cVhRVEdPWVBvWmlMZ09sYkZ6?=
 =?utf-8?B?ZWFWNHpPOTdKcnhtaFNpZ3pETzZwc3ZoOUYvWGJaR3JXN21FRm5Denpmdk95?=
 =?utf-8?B?b2d2VXlFbEF3ZDFTNmsyMHJQL3pnSFAzenByam1lbm14WWU1N2dKTUJ5K2Fk?=
 =?utf-8?B?M3hhdGVxWGFhTGJDSFNuZS9weUhZNmRwUXBzSzU0KzhjRzJaL20rTjd3MFBm?=
 =?utf-8?B?ek9xakVsTURTcHFKUi9HR2IwTDZEcXpxYm5ML21tNi9JN0RCVy9xWTA1TUlo?=
 =?utf-8?B?Ry83ZEtTL2I3TU4wcGJPZ2x3VzZDVi81aDVTakkvekIyalRYN243UDdGRTFD?=
 =?utf-8?B?LzZVTW5FRlE1TVlkUGlYRDhCcTBEOFgzWjdlekhpNlJ3N1BQV2ZzdTN1Tlgz?=
 =?utf-8?B?TlQ3NVc1a1QrR1pyMm5rbjB0Q0w4Y2kray90eFdQVytiZU1PNzZDVVEwUDJI?=
 =?utf-8?B?dGVNRW5RaVN0VlMzZ2ZxQ3ppMDFYbGhtanVjNFBLVWhZT3l6bVBUUzl1M0xO?=
 =?utf-8?B?cERJaWVrZnpKNG1wTy9nNTNyRjg1eUhVQXkvcVBpTkczMEZjeFFVT0EzV1Ry?=
 =?utf-8?B?L291d1NzQk9LV09GSERyTHpZSWdpcjRkL3puMXhuSXhqNkpaMUFMZjI5Yk50?=
 =?utf-8?Q?BDD4=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 07:59:53.5542 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 723e1b6c-22ab-4f01-3e2c-08de39546f07
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00021F69.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4100
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
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>
---
 Documentation/gpu/amdgpu/driver-misc.rst   | 26 ++++++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 29 +++++++++++++++++++++++++++++
 2 files changed, 55 insertions(+)

diff --git a/Documentation/gpu/amdgpu/driver-misc.rst b/Documentation/gpu/amdgpu/driver-misc.rst
index 25b0c857816e..e1a964c3add2 100644
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
+.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+   :doc: uma/carveout_options
+
+uma/carveout
+--------------------
+
+.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+   :doc: uma/carveout
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index e78e6982312c..0271487e790c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -418,6 +418,24 @@ static const struct attribute_group amdgpu_board_attrs_group = {
 	.is_visible = amdgpu_board_attrs_is_visible
 };
 
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
@@ -450,6 +468,17 @@ static ssize_t carveout_options_show(struct device *dev,
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

