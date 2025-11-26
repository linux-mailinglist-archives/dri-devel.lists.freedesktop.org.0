Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 156F8C88D5E
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 10:05:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7834810E55C;
	Wed, 26 Nov 2025 09:05:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="cTS6tTVk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012013.outbound.protection.outlook.com [52.101.48.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 487A010E561;
 Wed, 26 Nov 2025 09:05:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KJG2Zgyt6Qq//v7qf2JJ2zCIWwlGV7pa/n+PnUhy1M9APz4OYNqLJz5wdU6gutpbvVXDOanhXb9+pBBPr0pAFJE7kKv2lYDmSJ1SkotkgO3YuQ1sBWbm4dPSshWPqC/D9FmDf+FDjki6lLNG+r/jQH6R11wv2X1GBHLFzf6FqJKSnYlwONuTc3Sx4/SnZNoMVf1PlM4rUkSzemQjavv6j8F9erJL2KFqNH8MiPLcmRLA1h6yxQ6HuirHhHPkVK/tZFnKOSC5c+xyR35+okLnmhiK+NLJKIPr83pjh0qd1JNulau9Qv0ElACZvHmKCqI7fC8Xhye1E5QYDGDawzdOvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vyIWtr2z8j8UuD8E45E2bJfKHtju77iqpFw2K2Xzfvc=;
 b=mTkCACpG31qhXojiQOTWbGlP8nKal6DH76kNB0iKwVWw3PMxtBlgbxiZjMZ9HV5z/Z1EoN98OO0uosczijkFIEOYqctEXBNQ0i3wKo98OMNFCsGeye3rL2WrJ2Uvwv/cQhEOgtC5euETnZHQWPlr0hIHWUxeJT6dQ7ntURPYSsUg7SxJlxXvmJbceb6RjZFYcr9z/813wtx0UQKzrqYjR8bc0Z0QPP6SCjeQUBqiRGajhDyjvFldppMyW2Pteuy1deLep9iuBSz7iEnpU92XPM0PkIcQJXKdTKcL2M9soCv8JT7j3SxdG0+sFdBXix1fchxF3Y18VNiAzCB8OKCY+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vyIWtr2z8j8UuD8E45E2bJfKHtju77iqpFw2K2Xzfvc=;
 b=cTS6tTVk9t5PwJxwg8Zc82a7l1gB4YVw2lPVFCONbQ1X2z4ouwOi9AvT3v3KqH2QphdNxPVQb4kHSIBuRqgrkYouKqNCB13Jev6J2tKrDCtsWEG7Mr1glgiFrKU1NbmAwhHrngr5nb/1HWWRjT0L4xtS9c5HWx6scT1vi1exkxo=
Received: from CH0PR13CA0059.namprd13.prod.outlook.com (2603:10b6:610:b2::34)
 by DS4PR12MB9562.namprd12.prod.outlook.com (2603:10b6:8:27e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 09:05:35 +0000
Received: from DS3PEPF000099D6.namprd04.prod.outlook.com
 (2603:10b6:610:b2:cafe::5a) by CH0PR13CA0059.outlook.office365.com
 (2603:10b6:610:b2::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.12 via Frontend Transport; Wed,
 26 Nov 2025 09:05:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS3PEPF000099D6.mail.protection.outlook.com (10.167.17.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Wed, 26 Nov 2025 09:05:34 +0000
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 26 Nov
 2025 03:05:30 -0600
From: "Yo-Jung Leo Lin (AMD)" <Leo.Lin@amd.com>
Date: Wed, 26 Nov 2025 17:05:12 +0800
Subject: [PATCH v3 1/5] drm/amdgpu: parse UMA size-getting/setting bits in
 ATCS mask
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251126-vram-carveout-tuning-for-upstream-v3-1-cf1729c4cb3c@amd.com>
References: <20251126-vram-carveout-tuning-for-upstream-v3-0-cf1729c4cb3c@amd.com>
In-Reply-To: <20251126-vram-carveout-tuning-for-upstream-v3-0-cf1729c4cb3c@amd.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2520; i=Leo.Lin@amd.com;
 h=from:subject:message-id; bh=WNO0Wy5K5wTMtZyFMxcPyYSImLbwFKtO7i9+gf4yqe8=;
 b=owEBbQKS/ZANAwAKAV8XsZZKKe6GAcsmYgBpJsLUVudE7xVsT8Rt5d+eUj6HkdtycaKhEwyRo
 9JMJt3TfrOJAjMEAAEKAB0WIQQzqV4kW+yguuqHrw5fF7GWSinuhgUCaSbC1AAKCRBfF7GWSinu
 hlxrD/9pKAQeN+X5pGtG+14gBPYA+Sz7gajUjxkKeZPQMrDSv6s4O5ZL750Mq28zoIGauFdaSDO
 fAzWW/hzrvFBNhCQLp2SJwe1d5aPNj+JWkVm5kpFGLKmpm/UVS9+FW+qdJIm+jIjOSqHWU+OlrR
 cWZGdqnSo4pvqDVMd6EF9WQ4pBLjY4VB9hlGuUIW5BwXexgmv5QuRIqbsPzw3pdqUqlGfLRCBmO
 0aQf6gmWC9dQeNY6D7lsMOfuIS0DMoT2+idSsyZ3f0YHjKSANZABNy8HjRNxHLOOXSUaQVhiQOV
 PMogWwqFdVebLreuNVDecVWCzC/lEWGSo4W84E42zBQG6s44olvXJtfJcvlTpKUtIF2Z3tXfvSe
 3pVX35stytcfLm4nAIevop7ry4OiF9q0WBmylLgobCdHU052zW7WFOlGk3gxsTzE/IGc5FqrMLe
 K+9fbOyr1R2QidAkiBjy2DZhLb1fikytrBt3VuypoLqbAEKueBOs8Af0G9PnMXgJVg6+GbwfSti
 PFuTEWiMsurgdn2k112nkVH1zpevw0f65MQw0VFsqB7tN+05a4FB94W0/t2rAeB8dZzJ7jggxtn
 ltuxr77oB915+w0YLvHMkDGB4NxHx7ieeow8xVO9UOhs6DYX6TQMhJum+bm/9qxGKK6mHpmfs1w
 hs/D1XycC9iv+bQ==
X-Developer-Key: i=Leo.Lin@amd.com; a=openpgp;
 fpr=33A95E245BECA0BAEA87AF0E5F17B1964A29EE86
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D6:EE_|DS4PR12MB9562:EE_
X-MS-Office365-Filtering-Correlation-Id: 878c366c-6b91-4cbc-1e82-08de2ccaf568
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|7416014|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SEFtdXRaTW9DNEtWdkpjYm1aOUlObHJNYzVYYS92UU1FMmVwUytXeVR1SHR2?=
 =?utf-8?B?OWdvamhoN2ptOXdEMUNPZm9MU1B3dVRqNU5IaTA0R0tTRk5QU1o0QjlhNzJ2?=
 =?utf-8?B?bUIxMUszVzcza2NBUityNzNUSk53Q3ZqYTEyanE1aWpFZ1d1N0Fpa1dVNzVa?=
 =?utf-8?B?cHBXQlhrNi8yRFlGR0RXbWsrT3BLZmZSdE4rRFkrTDFmMU5BaVNha05MdXZx?=
 =?utf-8?B?VWNwQTdORnhteDJ2NXpjdmExMlBiZ29mTTJ5YVorNUVtSVpPOTJzMVVyNXdB?=
 =?utf-8?B?cFVNQzNEOUZaakZPQXVSVjVpeFV2eGlrRno1WmRFR2diRmUrbUdsMjdDOGNj?=
 =?utf-8?B?dnprT0puQTZydTJNWXBnSm5hNVA1bHhwWnZmRTBncmFtellBdkYrTFhxUGdo?=
 =?utf-8?B?bUFHSXhSZnVyUEk0OVg0WExKNlJUaHFsa2NDNFJjcHorL1FKZityam52MzNS?=
 =?utf-8?B?RzZodGhaMzBzaXlnYjJlTHp1Q2IzQThiVG5YbE1Xd2R3Nm1JV3dLNGFGZnZy?=
 =?utf-8?B?bzdreGhUTnYvMlBKc0V5UTVtSVoxd0gxRVpZRS8vRk1mTFBYSmN2ZzVnUENj?=
 =?utf-8?B?Z2E4bUJxbnh2bXJodVh0ckVUWVZBUzFRZTUxVXl2UktmSGZ6bWtWNmg4M2pX?=
 =?utf-8?B?UjYySFZyMFNUZnFLblpQZEtaTnhLZElqSytJcm5tWXBsbmpOcmVma2VHWjM4?=
 =?utf-8?B?VTdyZlN5bjk2TkRWRmFhci9qcFJOZGtydXpYc2RtejR4MFN5b3dOY1FIRjVI?=
 =?utf-8?B?amtYZWJDLzUxeTFXZDEzYTRKVkpQWGJCWEhId0IvVW4xZ0Vic1BIR3l3dlpH?=
 =?utf-8?B?aXdCc2J1Rnp1QkdZTFJ0Y0lMdG81MEgwczR0dlYvV0pndlp2OEk2OENRbjg3?=
 =?utf-8?B?Sk9oYlYxeXhtbHFlajlFZU5HbGhkTk9RV09zUURIbVA2TlAyWTEvYTl0TUQ2?=
 =?utf-8?B?eTdjRHhyeDkweGU2NlZodHBvUU04bFk5RU4wUXZpZlVNcEpLNjZzRzU0Rlli?=
 =?utf-8?B?akpRTmFaZ21sdmdsNWhSaDlOWE5Nd0g5SGlKYUUydm5kVEQxTHNoMXBQM29D?=
 =?utf-8?B?Q3o1NHBCS3BNbWZoRzMxTFZGbDJnOFNzNlZwZlFnRDFOdmJLYVdwbk84VGpH?=
 =?utf-8?B?VjU5RnV0TkJheFduWUgvb1VYM3ozakVXRk92TUJPNmJsRU5odWJiY3lTYytr?=
 =?utf-8?B?SU0xQWl2VU1sRjZpUWZwWW1EcGJiR1RJK0FhMUM4SUxmOWNiTDQ0b3ZwTkRy?=
 =?utf-8?B?b0pxMkJ0ZXFLVmJKc2FPWFlBdndMZFNMVnVGUUNvZWt0b1pwK2d5eWNqUDJ4?=
 =?utf-8?B?dEJSZ0JmZ1QzRER0QlYxNFZHTURYS0RGdlh3MUI3cVhZYTZHbVhMR0ZCTmlI?=
 =?utf-8?B?eDI1aUFEOEgrNVptbEdVK3ZpVzVEdDVXSzRwUm04T0I4L3dUSi9wMkJrZXly?=
 =?utf-8?B?YWdiZ2JPME03Yjg5MTlodzFYVVpjeTZwOUZsZXlrNStOWWVJV0RpRFA1YVR5?=
 =?utf-8?B?c1RBWWNUNGwvS3hJbkN6N2ZoY01rQkhBcHpmUzNyb3Q0R1VBa0tGUzNMN1NS?=
 =?utf-8?B?TXJjT1dXNFlPZEExNE5pRXlPaytlWlFML1NSZ3JSZkhHSWhyeTVHTXJtenRL?=
 =?utf-8?B?cEhTZlFZczZMcXRaZHE4aFprNG5EWjYwak1xNkZpSjhqUlk4SHErbEM1UENS?=
 =?utf-8?B?UWJtNldsMWxaUVNxeVprejhmNFJjcUw0bmpxNTBuUEJ3dkZHczV1SnhjYWRB?=
 =?utf-8?B?UkJ3VFFZd0Q0MkF0eFdydlJRYjlMSmw2L0VXc0gvUkRRakFLbk9hNFVGdDNP?=
 =?utf-8?B?NFRoYm5LY3hGcHEyakFJRHE0RkQrS2duRFVncWZpckRlQXl2Sko4Y0QrdndD?=
 =?utf-8?B?ZWc5OFZ2c3VuVzJDOTVLeTJhZzIxUUJlTHZXbzBIMnJ6NUE3UGEwRnJ0Q3pK?=
 =?utf-8?B?Mkd6WitEYnJjcGt5UFlFbFVGZFZ2RGkvWU1FS29leWR6MGJVaDJqWHhwcHY4?=
 =?utf-8?B?bDF5MTZPSklmeThQRzY4OERJV0pLVTZRbVJxN1JDREcrZHZVYlZCMmRvVXFR?=
 =?utf-8?B?Z21CVEJOZlgrZFZMNG9WdFZFRVFDOFRPU0RhT2RtUExLRWNYam85ZXhoeTZV?=
 =?utf-8?Q?X9V8=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 09:05:34.4587 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 878c366c-6b91-4cbc-1e82-08de2ccaf568
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099D6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9562
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

The capabilities of getting and setting VRAM carveout size are exposed
in the ATCS mask. Parse and store these capabilities for future use.

Co-developed-by: Mario Limonciello (AMD) <superm1@kernel.org>
Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c | 4 ++++
 drivers/gpu/drm/amd/include/amd_acpi.h   | 4 +++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
index d31460a9e958..610449d73a6c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
@@ -116,7 +116,9 @@ struct amdgpu_atcs_functions {
 	bool pcie_perf_req;
 	bool pcie_dev_rdy;
 	bool pcie_bus_width;
+	bool get_uma_size;
 	bool power_shift_control;
+	bool set_uma_allocation_size;
 };
 
 struct amdgpu_atcs {
@@ -587,7 +589,9 @@ static void amdgpu_atcs_parse_functions(struct amdgpu_atcs_functions *f, u32 mas
 	f->pcie_perf_req = mask & ATCS_PCIE_PERFORMANCE_REQUEST_SUPPORTED;
 	f->pcie_dev_rdy = mask & ATCS_PCIE_DEVICE_READY_NOTIFICATION_SUPPORTED;
 	f->pcie_bus_width = mask & ATCS_SET_PCIE_BUS_WIDTH_SUPPORTED;
+	f->get_uma_size = mask & ACPI_ATCS_GET_UMA_SIZE_SUPPORTED;
 	f->power_shift_control = mask & ATCS_SET_POWER_SHIFT_CONTROL_SUPPORTED;
+	f->set_uma_allocation_size = mask & ACPI_ATCS_SET_UMA_ALLOCATION_SIZE_SUPPORTED;
 }
 
 /**
diff --git a/drivers/gpu/drm/amd/include/amd_acpi.h b/drivers/gpu/drm/amd/include/amd_acpi.h
index 06badbf0c5b9..e582339e8e8e 100644
--- a/drivers/gpu/drm/amd/include/amd_acpi.h
+++ b/drivers/gpu/drm/amd/include/amd_acpi.h
@@ -427,7 +427,9 @@ struct atcs_pwr_shift_input {
 #       define ATCS_PCIE_PERFORMANCE_REQUEST_SUPPORTED             (1 << 1)
 #       define ATCS_PCIE_DEVICE_READY_NOTIFICATION_SUPPORTED       (1 << 2)
 #       define ATCS_SET_PCIE_BUS_WIDTH_SUPPORTED                   (1 << 3)
-#       define ATCS_SET_POWER_SHIFT_CONTROL_SUPPORTED		   (1 << 7)
+#       define ACPI_ATCS_GET_UMA_SIZE_SUPPORTED                    (1 << 5)
+#       define ATCS_SET_POWER_SHIFT_CONTROL_SUPPORTED              (1 << 7)
+#       define ACPI_ATCS_SET_UMA_ALLOCATION_SIZE_SUPPORTED         (1 << 9)
 #define ATCS_FUNCTION_GET_EXTERNAL_STATE                           0x1
 /* ARG0: ATCS_FUNCTION_GET_EXTERNAL_STATE
  * ARG1: none

-- 
2.43.0

