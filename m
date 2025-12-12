Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ABB5CB82D9
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 08:59:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1575710E284;
	Fri, 12 Dec 2025 07:59:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="avW4MPRx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012049.outbound.protection.outlook.com [52.101.53.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C187110E560;
 Fri, 12 Dec 2025 07:59:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lmmK4saVMB7/lIVMrXXriyL8erwfxsa8PWQGqs7Z3UImfwIc2RE6p7VRf8Q39Z+t50BNCGKho4R7J0qNPMhvUDR9zXNPlfee6ZCcCmNmoH0ugmFatQV/Q85lPmTLkJe/TxDqzm+kwptMjoTquQGiHRoQOPQ3GCXVrylqxbC/VIQJAXt4DzCSC5Kxo+UcGspjruJOMvVHtjUNwe/btcmb8Fheo9+M1vp7uUwGE36Zv2YA+BhXuAFKGQpnjrQA4zvvIJuVdDmp3CGTqPFE4BRHQVX5JN/d0rpm2c1MQyEGGwHiRKhklEu/4T9lJaK9/hDZv9ZfWNeeJ87FnswakX+hog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sfiBcD0DNBwpslRHGADLVNLfJHjsMGt5rnJ8Tc3UAUs=;
 b=wBo56jOAOYdHpU/OkaqZGgeTgvtkwXib06G1E3S4haP47KfAWW39zy24wg+K597QmQlT/bnZz6q99iVi75rbb9dsKvdcqJeLhUFezQhVZ+3d7u+prANeKmOdn7e7TPzSCkc5EVuKFtjaPkHYJ1cPUnCxIXn/Itt/nErdFhPxm2nwdH1re721Tli/G9IIkrIR+/bDlB5hy293ySIAUo92Km241wYvgrDXOOjlWIt+qpBBYgKxHwKkoOhx0fp1eNt4F6UvgV14ge1Jas66lv8gYCtzvgH9IuUJ06s7KIkSC79dXLBu4cgHtqwklLAbLzaJM2G9yrJRAbZ2HAiI3DF6Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sfiBcD0DNBwpslRHGADLVNLfJHjsMGt5rnJ8Tc3UAUs=;
 b=avW4MPRxk2xanHq5Z51qLlxpviisPOxrly2NmmNtMKiNNXNly7MGPpA7DkP6SdaOFhftu/BJqq2/O2uwKp7nztbGKXp+bB2sJHtBEaBFHXP3PTEmU/y5t3O4e+kXI/mHCgpPitE9ovFQ1ko41C9cItS1rHYI2gQY4hYjzBtSWqU=
Received: from BL1PR13CA0378.namprd13.prod.outlook.com (2603:10b6:208:2c0::23)
 by SA1PR12MB7128.namprd12.prod.outlook.com (2603:10b6:806:29c::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Fri, 12 Dec
 2025 07:59:35 +0000
Received: from BL02EPF00021F6B.namprd02.prod.outlook.com
 (2603:10b6:208:2c0:cafe::a6) by BL1PR13CA0378.outlook.office365.com
 (2603:10b6:208:2c0::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.7 via Frontend Transport; Fri,
 12 Dec 2025 07:59:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF00021F6B.mail.protection.outlook.com (10.167.249.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Fri, 12 Dec 2025 07:59:34 +0000
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 12 Dec
 2025 01:59:31 -0600
From: "Yo-Jung Leo Lin (AMD)" <Leo.Lin@amd.com>
Subject: [PATCH v6 0/5] drm/amdgpu: add UMA carveout tuning interfaces
Date: Fri, 12 Dec 2025 15:59:12 +0800
Message-ID: <20251212-vram-carveout-tuning-for-upstream-v6-0-50c02fd180c9@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFDLO2kC/5XQPW7EIBAF4KusqEPE8O9UuUeUAsN4l8JmBTZKt
 PLdg7dZu3PK90b6njQPUjBHLOTj8iAZaywxTS3otwvxNzddkcbQMuGMKwAmaM1upN7limmZ6bx
 McbrSIWW63MucsR0hKLCdtjYYQZpzzzjEn+fG13fLt1jmlH+fkxW29j96BcooGOTOcC06rz7dG
 N59GslmV77zQJ7xePPkoPsQpGWChaMndh7XZzzRPD+A4Z2Xvhf+6MmXxxmc8WTzOgQFQoteuf7
 oqb2nznhq+x9a44fGmR5f3rquf8RG/78QAgAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3225; i=Leo.Lin@amd.com;
 h=from:subject:message-id; bh=yKE1hSi88bx9w0dBVQDCbEvCw6RpTHJmcVR3yun/xmU=;
 b=owEBbQKS/ZANAwAKAV8XsZZKKe6GAcsmYgBpO8tdt3IQgkrJg7Gl2s9ILEArZ+XMzmSgOEGRu
 6ike7tXIFSJAjMEAAEKAB0WIQQzqV4kW+yguuqHrw5fF7GWSinuhgUCaTvLXQAKCRBfF7GWSinu
 hhTeEACAQ6UW40g7QaWIKJJ50aLa+B0q/tGviYMOjmY2ER/uPn+mFPatpDOHc/xCqFCbtQ7wY9W
 I7vcyyJjMF8+j2BuXe1f6vZfiA3nISiFwjTcl3ay31QDZaZPweWZL5pOaI5dNH4LHD0ueU6lf6c
 C4mbCKM46GLLEjrU3nDu6gg6+P4UjnFr0wfJ0hdqlCPUonGthAW1JdM1gGzfpiL7XUXug9qRrzF
 p1OZ4UinH1petZ0kde5xibj/eyusszpMXzVU3U+O/lbZx0jZzwYZzSvBVM68rBIFNN20cOa7M4q
 Gt8vT1T7fluWECU7yiIgqxCm+Mmtgns/5Gwo+4Yutxrx5OKwlcWZsts6+pgtadLpqNso5y6VGlh
 S40kjYiEAGqpjYnElrR8/QFWfKdww6ZM5J1lNVK7iJ78eeL17Rc/Hd5HyLRJGzVW15PJVNrnsel
 jLlrQeOkf3N+IiTzzKN3upjzkKSgEN3fqkI1rthqT+yh7J62l/btgbU16CshGggCeXLsQlJ0dZe
 viEiS/yOGRnkfYmCuIbnaNBHi2kfDogqupHqgcz54ziQT+Ow/zEXUQr9gvwzGv5Wz1Q8BRfMMDR
 vO8ER4tEHpBm5malQs24KQu5h+vsttiKSftFu+1xIx379HnWX+NMexH1cOVNtGrUBZV0ju2Wiaf
 uY0/vlMOhTtvF3Q==
X-Developer-Key: i=Leo.Lin@amd.com; a=openpgp;
 fpr=33A95E245BECA0BAEA87AF0E5F17B1964A29EE86
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6B:EE_|SA1PR12MB7128:EE_
X-MS-Office365-Filtering-Correlation-Id: 78ddf5cd-2abc-43c3-9489-08de395463b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|7416014|1800799024|36860700013|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RXM0TlFoQ3dVVzdkWm1TUVRnWm9ySmErdHRLaEhkazVrSEFhNTlKRFpBdGcv?=
 =?utf-8?B?TFh2OTFrNDhPMCt6Y0pkRHFKUGJHVkdlb3I4TW1NcmhwSVIvYlM3RFNoUjJG?=
 =?utf-8?B?TjE0Syt3M2lMNkF4ZFIrK1B2MWV4Q2JJUmN4SFdReTFkSjFVaUVsNlZGdDF3?=
 =?utf-8?B?R2xKb1V5M2N1cit2SlEweHN5MnBYMWFhY2l3UjNLcCtoOXRLa2c4Y0F0a2Mw?=
 =?utf-8?B?TGo5WlB4MlkvQ2ptRi94VTVIUk8xWFBhSlpsR3J0NnU5ZUxiMXVpUkt3N3lD?=
 =?utf-8?B?L1VnVE1NSHVxaXdYYkxVM0JVY2E3aVJmdWRpY041QzZ2R056b24wU2dVSS9w?=
 =?utf-8?B?MllRaHE5NWYxN3BqVUV6RXRLMFpNc3psd1F5Y1grNUVlMWZhRVUxY3ppUDFo?=
 =?utf-8?B?eHdIbDRmZWVHWUEybDAyUExnbHdPZmV1S1A3NUxZd01TamZCRHBBcm9DN3VF?=
 =?utf-8?B?d0NJdldNVmQ5Tm9OZFZBUlZEVWlhazl0cWk2SExUdDZhWk11Z0pEZjhSY0c4?=
 =?utf-8?B?SjVOU2RtQ1BqZzVqTVFjZm5xMGJKZS9nK0FIbUZFQVFZalVNVVQ5MXk2NXo0?=
 =?utf-8?B?NGlqRG1BQ0NZbzJSallSS2taVzhrSElXckR6ZTFOWGhmdmUxbUVDODNMYzZt?=
 =?utf-8?B?Q0lHbm8vMDBrOHNrZDJGaU5VOHFqOWI3a2dYRjlLMUlTQXR5dnJPQ2pGTmNw?=
 =?utf-8?B?dVY2d0R1UDVvWUZwZ2F0dnZ0YlRyQ0NROVpJb2pzQmxYcnE2SEZBbzNTVXg4?=
 =?utf-8?B?aVRhZ3R2Mzg0WXdPby9RdUw4LytHV3g2VXpOV1NNN0V2NzVObzUxWWpHYy85?=
 =?utf-8?B?cE1xdU9xSWdVeXNZM1N0dlpaTlU5NFNMeUZsSmdKeG9XWWNvZTRqOVlwSFJT?=
 =?utf-8?B?VDR1YlVWM1ZzVE5kVUx5L1dpWTh1Y3diYTEyZWhDY2VTM0U2UElaYlBuV29R?=
 =?utf-8?B?QU5TZVdWb2N3R0h3aXczUHJTbzBjQnJRckQvUWlaMDFNeHBsYkh0c25kOW5U?=
 =?utf-8?B?aWlXUk5rakRadllLQlUyWTFjQXRZbGdhYUJrVGIyYjRlYS9QcHdVQkZ4blV6?=
 =?utf-8?B?MXBWRlQzeXNTZENGM3VQNkhrS1NNN084bTNqNlc0ZFZNOEJZUk1zT0tqaTlU?=
 =?utf-8?B?RmdVWE1UMEl2V3VEZTdBSU52UGVBZUErdm5Sbi9KcTY0bU9rUVVDd0dmTHoz?=
 =?utf-8?B?WGphQkhZSDIwQThRNnZRUXhRMGxqZkswQUFxcmRKbHU4SDNPZktUMVJmNW8z?=
 =?utf-8?B?SGd0NGcxUmJpYzlDaHJUQTlRd1M5R2RYZlFXMmZWUXpyeVRlZHV5SW5qejVT?=
 =?utf-8?B?dVZkbkpWKzB3d09wNnpleC93TXkxWjRCNktuRXlSYUhDVGVzVVArQ3Bnci9T?=
 =?utf-8?B?WExUOEkzR0Fzc29tN1lqTjg0b2hkNkEzak1DRGJXNnN5NFo3YlJoVFlsS0cw?=
 =?utf-8?B?SkhEMTA1UUxsSU43NXIxTmE3QTMvV1JMZmJwL3dlbDV5aE9BSTd3M1FJS0tl?=
 =?utf-8?B?UWEySmZ1Ykp4TXR3anpEaTdCR21iTU9FdEIwbE12dDZ4azZ4RXJDZ1k4NVZD?=
 =?utf-8?B?bVN5UjM0S1NVYXYyaUJsZitQdWxBQU9MbmkzT1dnV2o3UlozaVhNZDRQRXNu?=
 =?utf-8?B?UW0rbG1pQmdaWFNPcld4a1FBd2phd1FxcUpjUDFGZnB1WVlzeDhDZlMyYVV0?=
 =?utf-8?B?MzJ3U3loQWFIMWprcDI4b3A2cmpLaGprS210dklnZkk3ZkxkRERnOVFGNE4w?=
 =?utf-8?B?MXZhSmppZHE1d3hUQVJpV0lrRTFZd2JZU0JjR2dGYUVHcGRVdUVTRVNJZFQz?=
 =?utf-8?B?VWtQU3grSjk2M2ZabEFaMWxCazZha2FDN01VSmxNN2F3c01hdndaWThWNi9h?=
 =?utf-8?B?NW1vYTZJdGptSnY2c1ozV09RTm52blpDNk9jalp5cTNRZ3E5Zm5BclFtL29h?=
 =?utf-8?B?OFBpSjRFcERuamRwblN0VU9aOUxYcWxvUXNnS3hWMEJISlkvNnhoRmpnS1Y3?=
 =?utf-8?B?V2g0UTJVT0MyWXRJWWVWMWhWd1pRN1NhSVJKZVNhWXJYRjZud0FwSlpnOWti?=
 =?utf-8?B?SENTdlozSzJ4cE1Ma003cWFSWE5TSkorVUl2ZnFIcU1QMUJGc3I4aklXYkNG?=
 =?utf-8?Q?lZX3kHlko5ahlR1+1AHYrFBgN?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(7416014)(1800799024)(36860700013)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 07:59:34.5767 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78ddf5cd-2abc-43c3-9489-08de395463b7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00021F6B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7128
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

The integrated info v2.3 table in the Atom ROM exposes available
options for the VRAM carveout sizes. The carveout size can be changed
using the ATCS function code 0xA for BIOS that supports this.

Make these features available as sysfs files, so that users can set
the carveout size in a way similar to what a Windows user can do in
the "Tuning" tab in the AMD Adrenalin. The newly added sysfs files
are:

- uma/carveout_options: this a read-only file listing all available
  carveout options. They are fetched from the Atom ROM on driver
  initialization.

- uma/carveout: this shows the index of the currently selected option,
  as shown in the uma_carveout_options. Writing a valid option index
  to this file will change the carveout option on next boot.

Note that above files are created only if BIOS indicates support for
it, i.e. where the table shows non-zero UMACarveoutIndexMax.

Signed-off-by: Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>
---
Changes in v6:
- Rename sysfs init/fini function to amdgpu_uma_sysfs_init/fini.
- Initialize sysfs interface in amdgpu_device_sys_interface_init/fini
  in amdgpu_device.c, instead of amdgpu_acpi_init() in amdgpu_acpi.c
- Return early from amdgpu_uma_sysfs_init() if this is not an APU.
  This avoids the failure message show up in the debug log on dGPU.
  (Per talk offline with Lijo these checks combined may be sufficient.)
- Note: code changes are made only to patch 4 compared to last version.
- Rebase to latest asdn
- Link to v5: https://lore.kernel.org/r/20251205-vram-carveout-tuning-for-upstream-v5-0-1e87cf3b57be@amd.com

Changes in v5:
- Move uma_info from struct amdgpu_atcs to struct amdgpu_device.
- Move implementation of sysfs entry initialization functions from amdgpu_acpi.c
  to amdgpu_device.c
- Adjust function prototypes and how they access uma_info and amdgpu_atcs in accordance
  with the changes above
- Do clean up for uma_info in amdgpu_acpi_uma_option_fini() only if allocation size
  setting is supported, for uma_info is initialized only when this is supported
- Link to v4: https://lore.kernel.org/r/20251201-vram-carveout-tuning-for-upstream-v4-0-9e151363b5ab@amd.com

---
Yo-Jung Leo Lin (AMD) (5):
      drm/amdgpu: parse UMA size-getting/setting bits in ATCS mask
      drm/amdgpu: add helper to read UMA carveout info
      drm/amdgpu: add UMA allocation setting helpers
      drm/amdgpu: add UMA allocation interfaces to sysfs
      Documentation/amdgpu: Add UMA carveout details

 Documentation/gpu/amdgpu/driver-misc.rst         |  26 ++++
 drivers/gpu/drm/amd/amdgpu/amdgpu.h              |  41 ++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c         |  47 +++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c |  77 ++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.h |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c       | 172 +++++++++++++++++++++++
 drivers/gpu/drm/amd/include/amd_acpi.h           |  34 ++++-
 7 files changed, 398 insertions(+), 1 deletion(-)
---
base-commit: 3925683515e93844be204381d2d5a1df5de34f31
change-id: 20251103-vram-carveout-tuning-for-upstream-1d5189688d73

Best regards,
-- 
Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>

