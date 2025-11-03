Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF613C2A693
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 08:54:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E06BA10E120;
	Mon,  3 Nov 2025 07:54:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="N/PbNfs9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010070.outbound.protection.outlook.com
 [40.93.198.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2949910E120;
 Mon,  3 Nov 2025 07:54:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o1iSYszPB7dyqeDK9gCJzWQwpv0l6vdATmYsxhKtFUggxz5nl5gPLUDzRzAlE+zsmePxRc+y1xZChUsxNPJdEYSGIWOAqW4qY8TiY6oWxSIkIBrbe6Ljn3ohtBVtmRWOWJmXHtyTas/05/oWLSJoO+IfcUtpKMunOh1f9Vhd/1lC955fSfiyHgXYwDgNdP1DLNYeRkUYyBRMJTxXOX+JDh2D+272P376AZyAu6M4+E4aHegOcPy+LdN6q/8cAmRsJErO6J0eMkJtBlnUVAb8AWfT6qGZmBADpnv6ayvLN7YysgwZXwB8m9XL+aOd44UAds7FN7JPeBGfgIXtGF8BYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=USOYUNbThRk2evQtdJ1ALyZNEU8L73+YE+LgRhUMAJ4=;
 b=ln49GJR+ge9hxZj5PjmNpovEs02Egl0yNKhGALNFkCoGoOAoLdbE8Pte2vbB38kqx1tJnyRTtSGReOFEkjZUQDddonNF2kMEYwC//HoHG8KPwgHxXm72PJmiVkyhCL2afdmXILHC6/rZlB3k7ZLqzEm04u4qb0TUl3+IH9GhrZnlmOQ/BVjjoGdDZg6DCF+FePDkQoGeNKqIqZuzUYbNB9kT5c+1z/XZ6adNVl8avyeW+XyynKMTN9qg2ouaizLqzJpuG3vfM2/o0Vjf/ESaT/hik3I1n2RllLqjs4TDlPBPBd7S2umtKF0iQMNp5SJJEsAVzZOG0/aDk4YLIQyBOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=USOYUNbThRk2evQtdJ1ALyZNEU8L73+YE+LgRhUMAJ4=;
 b=N/PbNfs9r4pbVfnE+33ABV5EdK/1F0TRRqRasrjIyIP/8CrZvgvGPQF11cqFQXZY184rcjTP4Eqh5zNLWeo2k48HL9mHAhBlYsfsW0CHD0fTgOdHzNxPHQOS0xWGe8+M0TZw/0z3IZF6beh7huEev/y43j3EEzza4WrefyMLNNw=
Received: from DM6PR10CA0024.namprd10.prod.outlook.com (2603:10b6:5:60::37) by
 DM4PR12MB6542.namprd12.prod.outlook.com (2603:10b6:8:89::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.16; Mon, 3 Nov 2025 07:53:58 +0000
Received: from DS1PEPF0001708E.namprd03.prod.outlook.com
 (2603:10b6:5:60:cafe::55) by DM6PR10CA0024.outlook.office365.com
 (2603:10b6:5:60::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.16 via Frontend Transport; Mon,
 3 Nov 2025 07:53:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS1PEPF0001708E.mail.protection.outlook.com (10.167.17.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Mon, 3 Nov 2025 07:53:57 +0000
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Sun, 2 Nov
 2025 23:53:53 -0800
From: "Yo-Jung Leo Lin (AMD)" <Leo.Lin@amd.com>
Subject: [PATCH 0/5] drm/amdgpu: add UMA carveout tuning interfaces
Date: Mon, 3 Nov 2025 15:51:03 +0800
Message-ID: <20251103-vram-carveout-tuning-for-upstream-v1-0-17e2a72639c5@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOdeCGkC/x2NywqDMBAAf0X27IKraKO/Ij0Es+oemsjmQUH89
 4Yeh4GZGyKrcISluUG5SJTgK1DbwHZafzCKqwx9149E3YBF7Qc3q4VDTpiyF3/gHhTzFZNyleR
 GMvNkjHsNUDuX8i7f/2N9P88PWJlL2XMAAAA=
To: Alex Deucher <alexander.deucher@amd.com>, =?utf-8?q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>
CC: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>, "Yo-Jung Leo Lin
 (AMD)" <Leo.Lin@amd.com>, <anson.tsao@amd.com>, <superm1@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2058; i=Leo.Lin@amd.com;
 h=from:subject:message-id; bh=CucJKitNXZoLkN4DEbz07ngypuyLw4ROnw9LV/3Pllo=;
 b=owEBbAKT/ZANAwAKAV8XsZZKKe6GAcsmYgBpCF8KOWehwmRkXY12gPyhha+kD/da4qcWBnxxj
 lF3qrvdQtWJAjIEAAEKAB0WIQQzqV4kW+yguuqHrw5fF7GWSinuhgUCaQhfCgAKCRBfF7GWSinu
 htTDD/ii8nm8tV9oLdmVPmUlKbH+Wr4F885CKPJmvEgoIes8nkGyZ1nlVn9MRpM25vCDlJF4nV3
 6XB37Zt/4Hug3sXWwGsmNPrO2l8aMBs265gJm8Fg7MyRS5Zynkn+UfKNR9D2GFmcIlPi+GZLlDC
 uwTV+7niGn7+fwxeapWxKfcP8XvrdgFU7fuC66OJE5WX15saUqa42d6lmKJwzfiknK1I3BMwPTE
 4UPOoqhFQrl1JmMwLMI6EJOU/c3prNEPphOK4EYza73pzbOJBQWmRUP4eL94mmxoNfSb/mvoevE
 cFI7D7ePCkYOkDBFc+J2WZT5nRthXSrTj9UNy0Ch4WrE0mMxKyDwPoCpqBamwRKpGdRMq53EuUF
 h8xd4+/HE3c7ZyYsIOpqCw8UVqg5Q2/HS/FQbL0F0JgPWePSxWENTgMVNBmXXF/IJ8RDy+uUbpJ
 KPIpq9NkzOL+M+cQ036tYaNraVXZ79cTqPIQUIpLPkjaKJQaAe6WNkQ7S6ayE3uS49CUGzgZMq8
 c0kGbpMZgavNfyj+iP57meiRVLxYsNoecNvQt46jBeFWVVHEqJZxWvJNYY2M3bngwcDKrf9vp/1
 hy51MIAWUFlxjqRwLJelBEpAPcdXLil9Y8nfcFrLcFS8uWnPXAKudiObktM+keTOLyACBSBZtDX
 O2NBLbaQufy8d
X-Developer-Key: i=Leo.Lin@amd.com; a=openpgp;
 fpr=33A95E245BECA0BAEA87AF0E5F17B1964A29EE86
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708E:EE_|DM4PR12MB6542:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a1ee43f-e0df-4974-3dea-08de1aae249e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UlJPd2lObDdKOXdlc05wZWxqSDVDYkczTUsyNllaTjRhdU9oR25QVWdtUHFt?=
 =?utf-8?B?QXRJRXpRRVlxVUM5bTZaRG43OXVpVEJWOEN5dThCb0lCZndKTWN5YVZWQzJY?=
 =?utf-8?B?RUk4TUErQ2x0RXhLc1htaStmU0tiUm1tak0wWTJYd0RLV2M3MVRpa2E0Ykhz?=
 =?utf-8?B?N3RYODErWFZ6T2RZelpHVlh6cDMxOGk0YkdZakYxNndrWnRHY0VDZzBPb3Zm?=
 =?utf-8?B?UkdoY0I2UHBHYVhCRlVMKzV3M3hDQ3h6RmRwcHpsUFUxVCtJZ1M3dEY0ZTJI?=
 =?utf-8?B?c0gzc1Vjek9hWjNXU3BNVncrN1c0c0sxUWM5RjNyS0NIby9sZW5Xa09tUDNN?=
 =?utf-8?B?L2FCdjZwMzFZU1NDdnJhclBUbkFuNURoKzZ5Y2FOM29tTGo3cUFIcXZBdjJN?=
 =?utf-8?B?Z2FtT2J4YVZMQU50Y2hHUFFETk44WGUwMEIxQU8wbmtLMmt6MkNza095V01s?=
 =?utf-8?B?UUZ3MnZRSzUvSjE5TU5rS0dDQXY1MkF3ZEluOEpRNnN3cjF0YU5xZjZ5NUFO?=
 =?utf-8?B?VnFzeHdHRzg3M1pRZjZ1ak9waUFMSTJXRVpNMkZ4cEVVeDV1cTNuaC9ySmo4?=
 =?utf-8?B?bVMwYlU0U2NjMTBpYWU3bFlpaEUyWHJyam9yclp1cmFoOGVjb25GWGh5b0kz?=
 =?utf-8?B?dUZsRnhVbEpSSEdHNGlVM09mY3VXaXltVkhvaW5HYW9ZSVdPaTRhYzF4OGF4?=
 =?utf-8?B?QzZBdDJ2RnJvWkVFaERVaHhHd1FuMFRoc0VJYnQzNGljTWhXVnNoeE85SkNp?=
 =?utf-8?B?dkRnYVh3KzA0NVRpS01ERWN4WXhGZE5ibVFpRHozWE5yMVV5V2JlaC9DNThu?=
 =?utf-8?B?cm5mWHBlbVc5MDE2Y01ybTcySFBubU5wUU42OE9nVDZ4Rml4Y1RsbXFYN2NN?=
 =?utf-8?B?QjRTUE9NWitudzV6L3ZJOHp2NEJNMVhzSEpIbzNFV0F3Uy9RZG1WdXJYVlAy?=
 =?utf-8?B?ajZyNTR6Y21MTGc3T3ZiREVtb0NKd0MrajEyeWw0MmVkeTlnczBOZGpScHNh?=
 =?utf-8?B?ZVAyK2VSOHdTOTBxeG1ROFBpY2J1dVNGZDkwTFRnSUg0Y0k4NjJCYllXc3Fr?=
 =?utf-8?B?Qzh1VVJVd2R2b0d0UnV2YWNDc1ppbFVIOWpPbk54ZnhjczdwYUEvM3hKa3dH?=
 =?utf-8?B?cUlPY0F4NFI0elZGbVc2bTF6ektyOHQxQmt6ZlZESlE2aDNGb1RnbHArM3ZZ?=
 =?utf-8?B?L3BuQ3dEbWczdS9PR2V6Ny9HOTdPRnRHYzlQbXJXYlVXTWZRWkpjaGVkeGZ4?=
 =?utf-8?B?QWlncnU3US9IZ09iWE92TmFrQXlndUtrMlpSTmgzcjg1OU1aenVObm4wK3Vj?=
 =?utf-8?B?UFd2SHRSK1VaYi9lNXVCT2JUa0dCdHBvcFZHc0EvblZjc3doVm9Ha3NlcTJm?=
 =?utf-8?B?ZFF3aEt2aW5oaSs2QUdmdVpCSVBxNHBqWEhNbUJ4dnV6T1IvRkprQTBjaHk2?=
 =?utf-8?B?eWVMb0h5NWM4NkZEQWdBUDVKbG5NR0JvNVBLaDJveWRYd2Z6amRjYzV3aDA2?=
 =?utf-8?B?RE8zV1JIMSt5VlVoY2o2VnpGQVJMdXZ5NXZIeitzNll6ZjJ6RFRFS1UrSHpa?=
 =?utf-8?B?TWQ5V1JtRlBkS29sUGxlVVk2b09ZNHdseFJ2SXRUZjIvM0JRL2FUdisrS2Y1?=
 =?utf-8?B?aXhEeEJaZnR4Y29jQ0JZUU0yZ3phc1VDT0pEelc4WGY2ZWI3R2dnZXpDSnJj?=
 =?utf-8?B?bE5YMzl0bEl4cTV6ZVNBV2I1ckJzdE1Yb3hOaExSY3llbExkcVNseElEU2JT?=
 =?utf-8?B?bk5vU3RnTENGLzM4eVRBenZ1S3NCOU92UEs3dDhuRk5vUldueTIvNjc4SjNt?=
 =?utf-8?B?aTlPZndDL0RwWFpzTzlDajk5dXU4amJPbURUempVMktxL2ZwZVNnZW5Fc2o1?=
 =?utf-8?B?MzBXQmlEeElDZDIzS1hFNWtqSCtWdFZ6R3lQSDVCZENWVXhJT2pIZzh0d3Zs?=
 =?utf-8?B?RmZZRWVnb2hzUUpjUzNFZjdkK2NXRHpCcTBQQk5QZmdMbGNQTU1zU1krQ3ZC?=
 =?utf-8?B?TWNXQVd0TEIrRDNzMG1ZTUhBd2ZzWEQzR2dQWkIzN05MRzZQQ0J0bWZPQ3g1?=
 =?utf-8?B?cEpOV283a0pSTTI3V1pkN1RUa2QzNFlJUzJ0WjJvdDkzYllzMWpYajFPOU5r?=
 =?utf-8?Q?nKoI=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 07:53:57.3380 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a1ee43f-e0df-4974-3dea-08de1aae249e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001708E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6542
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
Yo-Jung Leo Lin (AMD) (5):
      drm/amdgpu: parse UMA size-getting/setting bits in ATCS mask
      drm/amdgpu: add helper to read UMA carveout info
      drm/amdgpu: add UMA allocation setting helpers
      drm/amdgpu: add UMA allocation interfaces to sysfs
      Documentation/amdgpu: Add UMA carveout details

 Documentation/gpu/amdgpu/driver-misc.rst         |  26 ++++
 drivers/gpu/drm/amd/amdgpu/amdgpu.h              |   7 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c         |  47 ++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c     | 144 +++++++++++++++++++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c |  75 ++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.h |   1 +
 drivers/gpu/drm/amd/amdgpu/atom.h                |   4 +
 drivers/gpu/drm/amd/include/amd_acpi.h           |  34 +++++-
 8 files changed, 330 insertions(+), 8 deletions(-)
---
base-commit: ac9914fa72a5a917bb61c5e87bee6b8f9b751f33
change-id: 20251103-vram-carveout-tuning-for-upstream-1d5189688d73

Best regards,
-- 
Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>

