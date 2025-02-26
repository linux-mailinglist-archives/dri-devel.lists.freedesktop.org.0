Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A137A46BC0
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 21:04:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C1EC10E9DB;
	Wed, 26 Feb 2025 20:04:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="dxKkNGtG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2064.outbound.protection.outlook.com [40.107.243.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D46710E9D6;
 Wed, 26 Feb 2025 20:04:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H6p6FW9r9slJagaHsaWZdVy1ijw2MgDB0ZqGm4KcQfDNgOBTjrdIZ0J+f4PXTHnED8NRI+NTfXqlVorx2NGnDY8IZZmH+P+C0Tg4fA7p0wFrQrgH/znVbDsTQegtFK6wLavIqwH+fo4mxyoxVuElSFmzioCc1XJpMXO0Pg0okfQEYaYrD8iHw2oP/bZi2KRh+JbO0JPwzSaHbEr7mYp8lznzmMu0SqgJPZbe4SWrzRQ1wj/Nw+JYuyfBOatrOui+LPCegVENZNwVzrA47xU28e1afUcEmEUYtgMvxi/OVzIcNFZJcAe5vp/Yj1Rjrm/VpDGQowTCF1wc2fFOt/kdJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UuyS4xhCW+ZevVdgnD1YOMVu84TondvQUwn88uramPk=;
 b=fOLBpXmZdyvKxZR8ubAG5VoouDqOpzV7bDTMgVmzCK6Q+Bcbny5bmE8FDdWy58HyvShof6T5YFHzNqSA6qVSAwP4YK1ooCrD3csjYsnjVJ0VJz+U3uy4CHvcGms6YB5Oia3HctFrLJPnXbWvxDII4LPka7cB8VKNI/Rr9HrXI6ePjtL6s7NroMQpe74hwWX0LK16H3aktVxIDip6dkmKyFo5NV0cyJTMQUpwDxp3le6U3CxV76EMTcUaKvArcxM7CIy2CJqfRzL/5ODXI1Kt+1xYomOn3n5XH8PQVL7e16yf6pBi6wISFJam3nYBfBLw1p/5o7hSt/pgQE1HorOP2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UuyS4xhCW+ZevVdgnD1YOMVu84TondvQUwn88uramPk=;
 b=dxKkNGtGCyzkNR0wxWagpyT7DvaT2thSLjcdSI2u2kCb+962W4Mek81GAwIkRcq7KDKp+svIfdSNXAZ/9h0R/M6sG2aOtgInZsZpAs3/I6Z//dqRVesv51Dx5SID/1ZCPxkl9at4giNlwazwJ8yJVEJB1ey6RAe5RNWVTr5BtAY=
Received: from DS7PR07CA0015.namprd07.prod.outlook.com (2603:10b6:5:3af::26)
 by DM4PR12MB5867.namprd12.prod.outlook.com (2603:10b6:8:66::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Wed, 26 Feb
 2025 20:04:00 +0000
Received: from DS3PEPF000099DD.namprd04.prod.outlook.com
 (2603:10b6:5:3af:cafe::56) by DS7PR07CA0015.outlook.office365.com
 (2603:10b6:5:3af::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.20 via Frontend Transport; Wed,
 26 Feb 2025 20:04:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099DD.mail.protection.outlook.com (10.167.17.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8489.16 via Frontend Transport; Wed, 26 Feb 2025 20:04:00 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Feb
 2025 14:03:59 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd drm-fixes-6.14
Date: Wed, 26 Feb 2025 15:03:42 -0500
Message-ID: <20250226200342.3685347-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DD:EE_|DM4PR12MB5867:EE_
X-MS-Office365-Filtering-Correlation-Id: 410b3c70-709b-4168-b87e-08dd56a0b5ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q0lzTm1yU0VSaFJqUS9TeGE2Z2ttOEpjdmVsL1ZsMFhmRi9GZ2ZMSjZINW8v?=
 =?utf-8?B?TGd4ZTJDV1FaSWVyZW81MUo4YTJRSUQ4c1BRclprSHhDZEc1VkVZb3J1cTNx?=
 =?utf-8?B?NitpUjUzQnpxb0liUk9mR0JjZ0xFWWdZTzZTSjQrU0lMclh3b3laQ0QyTFNI?=
 =?utf-8?B?cXBvOFA0YXdWTTRrS3F0WnRFN2ZaaTZ3MEZ2aEZjWW10UGxyM2ZYMXNWZlhU?=
 =?utf-8?B?SFlFajJVUXF4TGZSMk1MTk9OUnlUWWFHL0Q1V2ZCQ2pHdTJrQXJEMmx0VGRm?=
 =?utf-8?B?Y3ZhVjBsSmt3Z2ZFVC9JdHFxYnV4akxEK09wbXdPQVA1RjA0SE9vY3gzeHdz?=
 =?utf-8?B?YjN1VmhmYlFGWTdsTmJtUG1QVE95dXVaeFJSTlpzUktla1lSU2lUaEoweldo?=
 =?utf-8?B?dkVaYmR2clZDRHFRSWlTSUxzTnAwL2cvSXJKUEdidGRNM3dzWWY0Q3ljZWtN?=
 =?utf-8?B?VmcrVkRHTDlka3NDSHg0c1dnbjdkc2xWWExDa1ZKK3hLQUNpWVorUDNSVlNZ?=
 =?utf-8?B?ektWaVp4OGlNOG1GUkd4MmxLZWk1NmxrLzFYSDlSMnVHdXhoYncxVCswVzJ3?=
 =?utf-8?B?U0lmc08yNGVvOEp1bW0wTmxTdkhmb2xiWERkb1cwUjJWdUNhbjAyUHA4MGZh?=
 =?utf-8?B?OUE3TUp1VlRWaVZ2TERzTENaZHZwc3VRQndURjNZa3VSV3Vpek1PSzhUdkd2?=
 =?utf-8?B?QWhNTHlKcVRBSzBXRlVmODJDdWZ4STdBK1M3dEFOZFoxRzhXRFFkMkJBTmFl?=
 =?utf-8?B?ZExoUml5ZjNDNDk4WnpwenpXQUdmQjFRZDArNUdBM2FVWXR4eU5tT1ZUVVZF?=
 =?utf-8?B?SXRDNVJJcDIwdktnSi9wemg4a3ozWVQzdWdvdXRHd1BlTDFRb0FQRUliSEF0?=
 =?utf-8?B?R0NNSi9uMVQ1R0kvTTltTVZsTW05dkFiSFdic2xkRzlaMGFNbEpFTVV6elNy?=
 =?utf-8?B?a29yT1ZPbGJvczBscnZNbXI5MnhxcWFsSDY0cjBQZGZoYmlwc2dkeHJnc0lk?=
 =?utf-8?B?RExQQWM5ZEFVRWU5WGJ2bVUyN0R4dnhIOFFVajMrQVJ2UDZQWUs3MUlWeXdE?=
 =?utf-8?B?YmNGcGM3YVRWMlNQVWk1djdpeEFzdUlDbFgxNHpvdUFxWFQrM3Z3clZlckV4?=
 =?utf-8?B?Sjg4Mi9YMmhGbCtRaE1RQXhVdzV6eEFlY3Fpb2pXOXNXUTVQMFBWZUR2dG1l?=
 =?utf-8?B?YUhlTlpKSEx3RXN6WHMwbWpZY0ZkeUxzUHNwTGFsSjlMaCticzhLU2sxbkpo?=
 =?utf-8?B?S1hOR2ljRDR3bVFJRGtIUFdyenNyTXhiU214NCsxTUFtWnN1em9UT0NqRW9L?=
 =?utf-8?B?OG9ZK3krRmZFNEdteDdYYkhqSklaQzZwNlBvWjlIWlZnZUJIL3VOSHhjSFNv?=
 =?utf-8?B?Um9DMXc1SXB3VFF1THdrM2t4N2NVMnNwRFRTKzJFQmVCZEdDdkRuTE8rbGVV?=
 =?utf-8?B?L1BXMzBiWFd1MkUzWXQ0ZmpBdnRSQU81bWtmSnRZTnJmUjJHaURVQWFlU0JS?=
 =?utf-8?B?c0tQcmk1dWxrWGJqL25TQXZGVENNY3Bua25yVlNHVkl5NU5JZWlGY0pmTFQ3?=
 =?utf-8?B?NG1MUEpJNnpJSm9ZZDNURWVhTlVYSkNtekNxVHc5SGRaNlFMRVRtSHRiQUZw?=
 =?utf-8?B?YjZzaDRGN09NajdHdFBNTE9WdUNCNjM5Z0NQTk9remNiSDRQaUFrL2pVTnVK?=
 =?utf-8?B?Q2QwRE5rSFpuZXRQNDF2NWZWVjQ2S2crNVNkOWpHVlUzc0krRWFaK3J1M0FX?=
 =?utf-8?B?KytVZDI0MS9yWjNBZWw0SGNqOXFkSm9DS2I2R21FanJ6ZitGN3JhL0NRMkhw?=
 =?utf-8?B?WG1LK29rTXlEYUdtd2lMb1VUTGlaRmNNeVdCNWduWlZhRFVXVlptSUZqdDhD?=
 =?utf-8?B?a01BQWxWSkxlcXZlb3Z2aEJteWpsU3R1WEJwVDVkeE1lMW40MlJtTDUwYmFu?=
 =?utf-8?Q?ZJVO+PPB3lE=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 20:04:00.2552 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 410b3c70-709b-4168-b87e-08dd56a0b5ed
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099DD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5867
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

Fixes for 6.14.

The following changes since commit d082ecbc71e9e0bf49883ee4afd435a77a5101b6:

  Linux 6.14-rc4 (2025-02-23 12:32:57 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.14-2025-02-26

for you to fetch changes up to d3c7059b6a8600fc62cd863f1ea203b8675e63e1:

  drm/amdgpu: init return value in amdgpu_ttm_clear_buffer (2025-02-25 12:29:12 -0500)

----------------------------------------------------------------
amd-drm-fixes-6.14-2025-02-26:

amdgpu:
- Legacy dpm suspend/resume fix
- Runtime PM fix for DELL G5 SE
- MAINTAINERS updates
- Enforce Isolation fixes
- mailmap update
- EDID reading i2c fix
- PSR fix
- eDP fix
- HPD interrupt handling fix
- Clear memory fix

amdkfd:
- MQD handling fix

----------------------------------------------------------------
Alex Deucher (4):
      drm/amdgpu: disable BAR resize on Dell G5 SE
      MAINTAINERS: update amdgpu maintainers list
      drm/amdgpu/gfx: only call mes for enforce isolation if supported
      drm/amdgpu/mes: keep enforce isolation up to date

Aurabindo Pillai (1):
      MAINTAINERS: Update AMDGPU DML maintainers info

David Yat Sin (1):
      drm/amdkfd: Preserve cp_hqd_pq_control on update_mqd

Melissa Wen (1):
      drm/amd/display: restore edid reading from a given i2c adapter

Pierre-Eric Pelloux-Prayer (1):
      drm/amdgpu: init return value in amdgpu_ttm_clear_buffer

Rodrigo Siqueira (2):
      MAINTAINERS: Change my role from Maintainer to Reviewer
      mailmap: Add entry for Rodrigo Siqueira

Roman Li (1):
      drm/amd/display: Fix HPD after gpu reset

Tom Chung (1):
      drm/amd/display: Disable PSR-SU on eDP panels

Yilin Chen (1):
      drm/amd/display: add a quirk to enable eDP0 on DP1

chr[] (1):
      amdgpu/pm/legacy: fix suspend/resume issues

 .mailmap                                           |  2 +
 MAINTAINERS                                        |  5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  7 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            | 11 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c            | 20 ++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h            |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |  2 +-
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |  4 +
 drivers/gpu/drm/amd/amdgpu/mes_v12_0.c             |  4 +
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c   |  6 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c   |  5 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v12.c   |  5 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c    |  5 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 86 +++++++++++++++++++---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c  | 14 ++++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c  |  3 +-
 drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c         | 25 +++++--
 drivers/gpu/drm/amd/pm/legacy-dpm/legacy_dpm.c     |  8 +-
 drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c         | 26 +++++--
 19 files changed, 196 insertions(+), 44 deletions(-)
