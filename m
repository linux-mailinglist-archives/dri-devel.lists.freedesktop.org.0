Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 606A4BE3AC9
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 15:22:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0422610E9E2;
	Thu, 16 Oct 2025 13:22:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="2yArlZsA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010041.outbound.protection.outlook.com [52.101.85.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 092AF10E066;
 Thu, 16 Oct 2025 13:22:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rE2SY9RW/Z+oKL0ZEdzRIqu2r1E6smaRwttYCajqS7LAlv1qOccmxeDTI3T3xRVujs7h0lhW6dtejpwWbJAsDC/q5XywrKSxF4KmRAGtwr839T36io7U+Ddct/w5ff02xqFs3dF2WYtE1W95T5DTOC3BU2+R/18fHI7MQqTYq/+9m+xVBo+o4PB+SssnZiz+vedhGppbFSNJ+KO0NO/y3jso7x9gFo0A4Nin+tk1owkD0uMmYibNNu8zoXwgYWdH5eTOlkmQBC3cusdkU4SCNvMeA6AzTvCW8/no+RChwyDUP4HI9Iwcf5b4T5lMCw7VTyRX4pu8Dff4KVe5mKET6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jl0ETIPnenDHu++nXj6Pg0N9wxXFsBjCUqefFbWPv4E=;
 b=qjI9W5jPPXHt0KzMOGQkISHPP5sMrb8IPv7Yqg90GV2/zyjtSiozVgF+3m5cgAz6JRJqmFGBT2OdZ1gj/7lxvqeorCvQZAI/vhtyqgx+FOd9UqbVjME4PbeS8I2FstOKb29TLsf0/cjn4J/O9E94HYWONqi+kbDkM2KDQG+/Jq6L9Alf8M7MIqvkb5eSWnxli6/Zs9hFCprDwXRwBPrLXNTZI2vZdjtaLu/rWyMcr4UpanSgviiFDlAMB9+jsTkruUgtbiKMKhdMZubpHen+dzWapzmy7/08fGi05T7GlUndX4to84//tl7/g9n0G04JC3iypoy7ELURDZSOUFRDZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jl0ETIPnenDHu++nXj6Pg0N9wxXFsBjCUqefFbWPv4E=;
 b=2yArlZsAkBRxqzojkfwS55siDFHnsSxX7SY0yRIqZHM0zIeQg7lJnQS2+C5zxfeIYwLwYx/0Uvwjktx05oCijItexeZTXSktKTBUrtYn4u9WTlw7mknkJbh1qj8QhCu0cAXWolhodwsHEsjvIvdxhHxQM5e0MCbWfGOMLHSm6rk=
Received: from DS7PR03CA0046.namprd03.prod.outlook.com (2603:10b6:5:3b5::21)
 by CY5PR12MB6597.namprd12.prod.outlook.com (2603:10b6:930:43::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Thu, 16 Oct
 2025 13:22:43 +0000
Received: from DS3PEPF0000C37C.namprd04.prod.outlook.com
 (2603:10b6:5:3b5:cafe::26) by DS7PR03CA0046.outlook.office365.com
 (2603:10b6:5:3b5::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.10 via Frontend Transport; Thu,
 16 Oct 2025 13:22:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS3PEPF0000C37C.mail.protection.outlook.com (10.167.23.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Thu, 16 Oct 2025 13:22:43 +0000
Received: from tr4.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 16 Oct
 2025 06:22:42 -0700
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd drm-fixes-6.18
Date: Thu, 16 Oct 2025 09:22:23 -0400
Message-ID: <20251016132224.2534946-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37C:EE_|CY5PR12MB6597:EE_
X-MS-Office365-Filtering-Correlation-Id: 73874cef-193a-4dd7-e38c-08de0cb716a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OFFGby81WUd6aUlHNkdUR2MzMlg5bGloZ2UzSGNHVDFlVnFGTU8zTVNsMitX?=
 =?utf-8?B?eXV5aTBjeE9rOWNUMDY5N3hqbVBGam9BK09XK3ErSDM2UngzeWF1T2R5UE92?=
 =?utf-8?B?ZXBLWjRnbUllZFIwK2wxa0F3VFB0bVZHQTQ4Mi9hN2RkbUN5L3NRWjZzVmVD?=
 =?utf-8?B?dGtpL2ZXUFEwSldXa05EV1QxdURwOFp6U3pBR05xSU9PUWVTTjVyd05yd2VC?=
 =?utf-8?B?UEp3a3IrbU9pSERpaWtEWmxhQ2hOdEpHcEhBSjBJdldZdkxxdkV0UlZpbUNy?=
 =?utf-8?B?UitXWGtEOEFsbzF6TXhjVi9CdUtsai9FWVhNbTl0aFlVK0hJTmtjUjFKU2I0?=
 =?utf-8?B?UUxmN1Vqck10STNXb2R0STJTYUhVYVFCaC85eTU1VDZxYUNmN1VQanQvRmhw?=
 =?utf-8?B?MHU4Q2tnUEQ4aFNJUTU4c1FPT0drYWZ6Y28wQW02eTlQK21vdFRzNktyYnhl?=
 =?utf-8?B?TEtHMHlPYjVxZE4yK2lCbldFTHV0ZzJYblg3T3E5L1Ywek5GZDAzYkE3LzJz?=
 =?utf-8?B?UzNrOVlNTUl1UlJoVGpYY1VOLzNNcU5hTUg5WjhLQVY2YlltYWVzV3VUc29a?=
 =?utf-8?B?a1JuaDZNSlV1ZE4yQVBjOFR4bDdzSjlWKzJWRFZ4UTVWTktLNG1kMHVIV3J3?=
 =?utf-8?B?Y3lXaVNjdDM4YjZUc01FQllwcjluMUVtTWhGblgrVVIxUGpzbCswN2phdnpR?=
 =?utf-8?B?eUh6L2R0Ujd4THBRSHg1L3lsZ3Q1SGFZb05iM1N6SDB5S3VoM1NoSEQzTEl4?=
 =?utf-8?B?TWlwTWJtaUtCZ2lOeWlma3lkTXBGczB6amU3cmZVK1ptZmlTUGRtNUNua1kv?=
 =?utf-8?B?SXlUa05meDNJZkI5RWN3aUVXQjJxUkZmN2JhY1VlcmVaOUQrbTBMdHR1dVph?=
 =?utf-8?B?Ky8yNUt4L2RlejBXWkJnL2V0QUx1czFUNDRQaGZQVGo4bU9SQWhsSnhuY0Jx?=
 =?utf-8?B?blp6MjVxd08walNwc0lGdnBoYVcrcGxmWUpSSWpvRHo4c3VJOUJSc3pVZ2o2?=
 =?utf-8?B?T0tqSVFKdldtT09FMk5VSWd5cE9kODVxTDV1bmZGSzFqbXpFbUpQTUp2eEx1?=
 =?utf-8?B?UU1kbWNvZU1WTHNMMitvVEV6WWJwcmJxQ3p2a1pXMGVDTjNZcG1vOS9rNlJr?=
 =?utf-8?B?TWdjNUN6aVZFZ1dBTXhiTTNqVFlYajNtREM4YjRiUUhuTC9GdExvaXFTS0l2?=
 =?utf-8?B?eU5RN3FFcURRMVdiZUh3cDlSQ0ZJR2l6bzF0Snc3Y1MyNHZ2SVhKTGxnUEty?=
 =?utf-8?B?MW5Ua3FKTTh0T2lxekRrTVhwdXBnSmVWRTljTC9ERHJiTEJHcVdxNzRoNFdQ?=
 =?utf-8?B?MmZiMkd0U1JFOXo4eHZrOHFIaThuMEZxZVYyMDV5ZXl4M0FnQWwwM2xadktR?=
 =?utf-8?B?SEZUNVBzMnI4ZndyRHE5R1o0MGhFMStMdGVMdCs2b1ViNGl0NUl3ODNNZ04w?=
 =?utf-8?B?SldKSTJ4SGd4RFlZYVRCdE1lSXdSaHFqWGk3R3BIYWphYmRZdVB5SGJMVXN4?=
 =?utf-8?B?SjhCRnRaYy9FbTl5eUpuN0xReVJLbzA2bDFPMXVmZkJPMjlxMzFXSWdiUndn?=
 =?utf-8?B?T2syb0NRRTlwTEJzMHNMaUsyZG9YYVVTclF2QnlXRE96djlxc1AyNk1NQkRU?=
 =?utf-8?B?WWRGeVlYaG52Mk5OR3hLcWZlYVBQK1BwbzZ1TC93Q3UrdHJpMmtBWFpDYTVQ?=
 =?utf-8?B?b2Vid0ZSS29TaFRlZFZrSnRxYlZPdks2YzRHUDUzZUhKa3VRV0JMSHdBRURr?=
 =?utf-8?B?emhRNElxRlpDa3lXOFJEeFlNR3A2Qjk5OWt2RFQzclo3NXR0RjE5UXpwRUVa?=
 =?utf-8?B?cUtUTU5ReVpON1VFWGhGVjBZZFFCM2U3Q1dkb3VWc0h4MVFVTCtZdmpUMlZW?=
 =?utf-8?B?dkRyams3alQrYUE3dE40ZlRCSVNUK2RpbE5NQVRsV1Z3ZjUxQktxbEFmSUFC?=
 =?utf-8?B?VDJKTmZ5MmcrdnpocHhjTWF0SW1oZG44NU96V2lHNmthbzZjc2Y2SFUxVkZB?=
 =?utf-8?Q?IvWFFHTVuEB1OC2CFZr27idLYA6V14=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 13:22:43.0784 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73874cef-193a-4dd7-e38c-08de0cb716a3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF0000C37C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6597
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

Hi Dave, Simona,

Fixes for 6.18.

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.18-2025-10-16

for you to fetch changes up to 079ae5118e1f0dcf5b1ab68ffdb5760b06ed79a2:

  drm/amdkfd: fix suspend/resume all calls in mes based eviction path (2025-10-13 14:14:28 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.18-2025-10-16:

amdgpu:
- Backlight fix
- SI fixes
- CIK fix
- Make CE support debug only
- IP discovery fix
- Ring reset fixes
- GPUVM fault memory barrier fix
- Drop unused structures in amdgpu_drm.h
- JPEG debugfs fix
- VRAM handling fixes for GPUs without VRAM
- GC 12 MES fixes

amdkfd:
- MES fix

----------------------------------------------------------------
Alex Deucher (4):
      drm/amdgpu: fix handling of harvesting for ip_discovery firmware
      drm/amdgpu: handle wrap around in reemit handling
      drm/amdgpu: set an error on all fences from a bad context
      drm/amdgpu: drop unused structures in amdgpu_drm.h

Christian König (3):
      drm/amdgpu: remove two invalid BUG_ON()s
      drm/amdgpu: block CE CS if not explicitely allowed by module option
      drm/amdgpu: hide VRAM sysfs attributes on GPUs without VRAM

Gui-Dong Han (1):
      drm/amdgpu: use atomic functions with memory barriers for vm fault info

Jesse.Zhang (1):
      drm/amdgpu: Fix NULL pointer dereference in VRAM logic for APU devices

Jonathan Kim (5):
      drm/amdgpu: fix gfx12 mes packet status return check
      drm/amdgpu: fix initialization of doorbell array for detect and hang
      drm/amdgpu: fix hung reset queue array memory allocation
      drm/amdgpu: enable suspend/resume all for gfx 12
      drm/amdkfd: fix suspend/resume all calls in mes based eviction path

Matthew Schwartz (1):
      Revert "drm/amd/display: Only restore backlight after amdgpu_dm_init or dm_resume"

Sathishkumar S (1):
      drm/amdgpu: fix bit shift logic

Timur Kristóf (3):
      drm/amd/pm: Disable MCLK switching on SI at high pixel clocks
      drm/amd: Disable ASPM on SI
      drm/amd/powerplay: Fix CIK shutdown temperature

 drivers/gpu/drm/amd/amdgpu/amdgpu.h                |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |  5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |  8 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  7 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      | 18 +++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |  8 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c          | 54 +++++++++++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c           |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |  7 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c            | 20 +++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h            |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c           |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h           |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |  4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c       |  3 +
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |  2 -
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c             |  2 -
 drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c              |  7 +--
 drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c              |  7 +--
 drivers/gpu/drm/amd/amdgpu/mes_userqueue.c         |  6 +-
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |  8 ++-
 drivers/gpu/drm/amd/amdgpu/mes_v12_0.c             | 15 +++--
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  | 73 +++++++---------------
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 12 ++--
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |  7 ---
 drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c         |  5 ++
 .../gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c    |  3 +-
 include/uapi/drm/amdgpu_drm.h                      | 21 -------
 28 files changed, 166 insertions(+), 144 deletions(-)
