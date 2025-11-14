Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 143A6C5C0B7
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 09:43:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AB9010EA02;
	Fri, 14 Nov 2025 08:43:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="IAwBmTrE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011052.outbound.protection.outlook.com [40.107.208.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 942D610EA09;
 Fri, 14 Nov 2025 08:43:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xiYrp2MLsM8mY/OZkGLNevtSHtUnbY200ISMGm+4Av1kh9UOMhW5B65f440jr3DFXOGr8F4zhaybFcrzFUevw1d9ylpuWTrzWbuWJX6pQspspr6NAIcFSCcHJQZzVJe4VLaH0IkuiNK5vA92da1etqk4lzykfxF/+S2KWGL64AMkKz7RSgxvkRzPTIoqQ2CJ18/foqkBrPlcGx9nsKC1fwc9hPCTmpJMVl7xpsPSL8WuQZmkGGpo9KZscj0yJjn0813K2YJqKlp1ftrpBciC2BwdDzvi25rw4nBuuXExHikTzJgS+J9WKzS3b8K6MczR7FIMcIIQEJpoxI08d0lUGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=grTCDEMMZUlj6YmroWbbY38fqkZyct6ONxhkriJjMGo=;
 b=U1LQtnUICk4sxMWEsctssqKeea9790llVmV2TXQvBH1hp7ioxynXrkl/zKJZIRnqMV8h12LiQ64V4rcCj5ayXC7CoVfFdOjVawniWoTAlxtsy+TnoAsBQ4EdpPX5GYELX7E1nIR8TaTWupg8EcSIe5KRI7KYIHZuuEAyHxS+oqAQpe+56Td+SpnbWxDY/6Cr7lyrCgnG8Yn9bl4nMJBVFHOR6L+U1fqbUKJ8OLSPjw3Fp/gM/hLLR5WwdC+hdOzNIa1LWpTc2WjUevDEvuBjL+RTBB7bzlQ9BWkSD9Tasoh1htDJ1XGDvrJ86T9tmsqQ8CWPwBreOaPncHGtuvN1Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=grTCDEMMZUlj6YmroWbbY38fqkZyct6ONxhkriJjMGo=;
 b=IAwBmTrE/5CRc2o4a7iT3cgzwnLe8Rl2Jh13f4hAjdWqdZIEUsr6cOgwBf3zDnFfW8B73Us+hlmYgeyskRmhlAmOcc2kcXOwddaXMyrauJxzGzay9wiyK0BQ/EsavPBklm2uLqgMkluQEYRg7AhiMOHQFWREvqUF4GgGFD9eOzM=
Received: from SN7PR18CA0011.namprd18.prod.outlook.com (2603:10b6:806:f3::19)
 by SJ2PR12MB7893.namprd12.prod.outlook.com (2603:10b6:a03:4cc::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 08:43:17 +0000
Received: from SN1PEPF0002BA4D.namprd03.prod.outlook.com
 (2603:10b6:806:f3:cafe::fd) by SN7PR18CA0011.outlook.office365.com
 (2603:10b6:806:f3::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Fri,
 14 Nov 2025 08:43:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF0002BA4D.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Fri, 14 Nov 2025 08:43:16 +0000
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 00:43:12 -0800
From: "Yo-Jung Leo Lin (AMD)" <Leo.Lin@amd.com>
Subject: [PATCH v2 0/5] drm/amdgpu: add UMA carveout tuning interfaces
Date: Fri, 14 Nov 2025 16:42:20 +0800
Message-ID: <20251114-vram-carveout-tuning-for-upstream-v2-0-4f6bdd48030d@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGzrFmkC/5WNOw6DMBAFr4JcZyNsxC9V7hFRWPYCW2Cj9UeJE
 HePww1SznvSzCECMmEQj+oQjJkCeVdA3SphVu0WBLKFhapVK2XdQGa9gdGc0acIMTlyC8yeIe0
 hMpZT2lYOYzcMtm9E8eyMM72vxmsqvFKInj9XMsvf+o89S6hB9qh0r7pmNO1Tb/Zu/Cam8zy/C
 kdsWdAAAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2381; i=Leo.Lin@amd.com;
 h=from:subject:message-id; bh=IDt0FWh+7o6PgxspriirFBt9KtXFIZQKo46zg2suxOA=;
 b=owEBbQKS/ZANAwAKAV8XsZZKKe6GAcsmYgBpFuue+Mc7hr7HC83hp4BpDaOLqd9D04HYStDRQ
 8OaCF8uh9yJAjMEAAEKAB0WIQQzqV4kW+yguuqHrw5fF7GWSinuhgUCaRbrngAKCRBfF7GWSinu
 hrwhEACRoU2sHsX4OWRETwYYpfkwpxtMkmBZeD4ijFrE/XYPCkvg2MxLjKC8NPaDLZxPAw9YmMJ
 xJAE4mbuvxR8ly7Ey+GIux+oxjID4YVQSytWIUe1fxW1/55JdTsP9lCrxBSnHZ4X63DL2YXK1SJ
 JjPk5w97sY8X/LnxxmF0CByK3bLooUH9+IWfOXai6mrHGS8SPnbFZX273f6n2TWBFdSdK0STC4m
 NTWUVmNsKcSyps9w6jS7YIoBU513hMGpQ6ATFJdexdUe6sPqENTLQBdj7mCgc2eETS0EfsOHx6A
 v4MH5PNO+mlHeS+mbi2m/DaG+YSy2kUsM3rqJxSwCrNdyWwXIrwVLlFzHtnfFlkDcD0yZy3yKYh
 TIKoUZrGFk6iAoEktsncH50b1hEyIJ6twhdH+zhS2liALZM1oBOKE7JmTT2NKkVmKLPNmgOu6UD
 GzecKDScztMHorwolJX6WUK1NoCMTnI23WT4W5yr6gafEUb16Cte+DxPGDsPX4XnkCgtL20qyE7
 zsmZZHp5DIbjq5B397ltB7XYW4cv09+tNdWpJS5gjLEGQVEMwIxT6BRY82ORoHqEyx5j4F8cFlr
 F7dzQeZyIX8knAJpBgTsjz9yHb3iRwRB7yXmM3eioochN38BsHdoWYUvcnIWiyuk85seiBuYCmk
 Wwx2AI8wvfYE/1Q==
X-Developer-Key: i=Leo.Lin@amd.com; a=openpgp;
 fpr=33A95E245BECA0BAEA87AF0E5F17B1964A29EE86
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4D:EE_|SJ2PR12MB7893:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fd6099e-8279-44f6-14ae-08de2359db35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|82310400026|36860700013|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RWZkbmt1NXNPT3ZlT1BhZHNJZGwybTQwdUVtQUxnNitybkd6bUprYTZRYS9X?=
 =?utf-8?B?SVNWVktVcmV4VmpjSStyaTJVTE04N2hST2hkUXo1bExJNnVzMngrSHdSSkR4?=
 =?utf-8?B?S1g2ZmRlOWNhM3lwUVdJLzBXZml0L0U0TkZOQzhrbDJ3ZDRBOUg4dnJZMFFN?=
 =?utf-8?B?YnlDeGM1Q3NKazM0MzB3R2RsOEczRWIzZG91U0JLN3gxU283NkFFZk1TVmww?=
 =?utf-8?B?QTJ2Y3M0WjlZNCt1ZUpsd2dHN2s4dFpDR1doaHZES1R3U0QzMTBTM2RUSHh1?=
 =?utf-8?B?NVpGOXFWdEhSdWdxeEpLM3JCVUpHNkJRbnAyeEg2MHN4VCsyaVhkQUh0VDVP?=
 =?utf-8?B?UHoxeDZxS3ZneWxyalFZdXRtOWtrRS9nd2Q3anBidHY0WG5xbm1qbnBWZVdq?=
 =?utf-8?B?Y25jQ05jRVh6ZXM2eGR0YkVHMDFqK0djQmZTS3BhR1h1d3YvcTlPZmZQOUhV?=
 =?utf-8?B?VHlMU1lQRG5ZblZCYVdZVDJjQ2svTVBpWmJMaFJ6MXhFanNOYVpyWW5yVGtn?=
 =?utf-8?B?MUZMNGdJL2UrZFQ0ZDFnOTExSkpsQ1lkMUhHYXRjb3lsa3ZwMVNXYU5PaFNh?=
 =?utf-8?B?VlIrSkdUZkEzRlpnakdDUFhMMWZRYitYZU1HS2VoNHBBaWNsbWtCeHF6Ykho?=
 =?utf-8?B?MEw1K05kTlAzTFQ4S05vVDluRHNHTVUvRU5qMDZsdnphc0xUQytwYkl1anh4?=
 =?utf-8?B?a3owZ2lwY3FzMzBtVEcreGtFSk45YmtnMm8wWXZVbFpNc3cyMFBldjVMZ3Aw?=
 =?utf-8?B?UnlNWXRYOTlFV3pvbUJWeHdHMEdGcjFoL09hNWticG5Xd0lkcVhsREJTSXM5?=
 =?utf-8?B?REJCeUxHcE9lOUtWc2lkRUNhZVYyMmFzeDFPdUNUWnBlU3FzZnBCR2xqS3BL?=
 =?utf-8?B?TEc4YTN6ak04RHM4NXRTMnFNMU5lQnVqN0xDL1BWKzFPS05pZDcwTTlUeGZJ?=
 =?utf-8?B?M29FTXdVbnpDazVad3BNZDNLYVROREVQQWRKcUovOGVINU5qODFuOW9RczdB?=
 =?utf-8?B?d3V5Z2lIRVgyRFNuZFVjakUrWVBxbExuZXNTR0hYbFNvK3cycDBZOGJNMWdM?=
 =?utf-8?B?aUxuaCtnQUVUUXRoamJZUVNaalhuUUI5SkF3eEkzNHVsT0NVcGh3R1ZXa2RY?=
 =?utf-8?B?NzRJcG5JeGcycWp1a045NzR1SGJZQUVycEhmdXBxY3ZMUXhucENSYk9EaWg0?=
 =?utf-8?B?cWxXRVI0dFJnazVhWGVTVG56aHpWdVlQYXhwNFlXcFFiYU1seHpFS3VFOGk1?=
 =?utf-8?B?OEpDMGI4eitIbGNaZUwzQmRrSTZXRlpKZ04rYlArQkQ1cmNmaFFlNmw0OW5w?=
 =?utf-8?B?cDJXbmNzQlFxb2VQN0IrYWFaK214SENFZ3ZRQ3diTnV6WmhQY3FvWmIvaXBh?=
 =?utf-8?B?Q2hpS0dVMUtLbTB3aVBjM3d1bjFJUHFncW9kUXo4VG40WWpXSWE0SGpnMDR1?=
 =?utf-8?B?VlRKZVRvV2d4cGl6MnBlK2o4VW16T0dJZnAvYTN0K1k1VDVaaTlyQW95NTJi?=
 =?utf-8?B?ZER1SUZ6RVBlUitPYjdUVkZSQ0lMM1FXazZTNlU5UThJVVVNaXE5NU1OMW14?=
 =?utf-8?B?YlZKZEJYZ0hsZzJlU3VWTUZSRkx3RjE1b1U4WGp6Q3kxd1ozUk9rRGZxMTk1?=
 =?utf-8?B?Wm9hMXJjKzRNUk1CdUNjcHhQWk45eWxOY2d2VmFNV0MrdEtNSnZMZUpQVnVU?=
 =?utf-8?B?S0ljMXFtSEw2cm9lWmVTajYwTWh3MG0wU2gxV2FwSVppN0Racm5TRldGWTgz?=
 =?utf-8?B?NkY2UDhKZk1vR1JaUERKRDlkZ003Wmk1MUJaZEs3U2I2dWpQMDhMdU84Z1BQ?=
 =?utf-8?B?Z0k3Y1JycGRoTVM5aTZUWi9jWkxQbmtyZWtkZnBWU25URHVNUlpCUi9UczYr?=
 =?utf-8?B?dU0xbWVMYWs1M3VmTm5JL0lORE9uOFBIZXpZelBkWm92K1E3bG9RaE1SQVkv?=
 =?utf-8?B?YmFKQU1INnd4WHdHODFMRzI3T0FLYlcyOGwreGdrQkxJUW5jQnZ3RnpSbUtM?=
 =?utf-8?B?SGFBbzlUdkJFVEFDano5OXdPd0pYbFAzY0JYVFFnejZCYUJJQ1lVditiN0RB?=
 =?utf-8?B?M09FWVFPVzRPUCtJcThKaHk1eENWK3A1OStrQ3QvNWlhNjdsSHcwQTBNbGlp?=
 =?utf-8?Q?GqCM=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(82310400026)(36860700013)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 08:43:16.9285 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fd6099e-8279-44f6-14ae-08de2359db35
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA4D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7893
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

- uma_carveout_options: this a read-only file listing all available
  carveout options. They are fetched from the Atom ROM on driver
  initialization.

- uma_carveout: this shows the index of the currently selected option,
  as shown in the uma_carveout_options. Writing a valid option index
  to this file will change the carveout option on next boot.

Note that above files are created only if BIOS indicates support for
it, i.e. where the table shows non-zero UMACarveoutIndexMax.

Signed-off-by: Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>
---
Changes in v2:
- Move VBIOS table parsing and sysfs interface creation from atomfirmware
  initialization code to amdgpu_acpi_init()
- Create structs that abstract the uma options
- Move the parsed carveout options from atom_context to the amdgpu_atcs
- Minor kdoc fixes, as well as adding example output for uma_carveout_options
- Link to v1: https://lore.kernel.org/r/20251103-vram-carveout-tuning-for-upstream-v1-0-17e2a72639c5@amd.com

---
Yo-Jung Leo Lin (AMD) (5):
      drm/amdgpu: parse UMA size-getting/setting bits in ATCS mask
      drm/amdgpu: add helper to read UMA carveout info
      drm/amdgpu: add UMA allocation setting helpers
      drm/amdgpu: add UMA allocation interfaces to sysfs
      Documentation/amdgpu: Add UMA carveout details

 Documentation/gpu/amdgpu/driver-misc.rst         |  26 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu.h              |  39 +++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c         | 205 +++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c |  73 ++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.h |   2 +
 drivers/gpu/drm/amd/include/amd_acpi.h           |  34 +++-
 6 files changed, 378 insertions(+), 1 deletion(-)
---
base-commit: ac9914fa72a5a917bb61c5e87bee6b8f9b751f33
change-id: 20251103-vram-carveout-tuning-for-upstream-1d5189688d73

Best regards,
-- 
Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>

