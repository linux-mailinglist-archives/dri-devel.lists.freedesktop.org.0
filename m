Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9DE98C2920
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 19:11:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E23F10E85D;
	Fri, 10 May 2024 17:11:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="jkFeUnTs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2076.outbound.protection.outlook.com [40.107.243.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80B3D10E85D;
 Fri, 10 May 2024 17:11:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WLA4syltxHaCUTAqOmD/fZeMF9jPhRZXhjxwv8h8mvLFXgq7OfvaIYze5rj7ODYXiLGJrTaafrRhj+CsCCkkgqiAPKiSoKMbRVGVxI6ZKHyPzcm9uY/6E+K02Lnx8RChcW5dzTRmJWEQVbjoGbVNAQgw6LmmKaOh3B1Nf8YOqXvxvP9ybURTkYKapCHHEMEyXlcHpu0IUlfcs0An/XsWDct8a3x+HZ7NL7rs2siUum0UxfIFsKvBps61bp0As5sAeXXvL7kk0Y6q0dRtMyMzWehq/eKiUGtlw1lzWb3zs64zT08VOsQDJeLE91cg4O+bQ/8r/7ZH9U/v1pzhV3fwrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DtKTR49O88NrFp85TLxad1DKwTceZ7AhEiwxJXtYkeA=;
 b=DAPkGCRnEPEHnZm9WLSzWFBSA5lmO3OTox8So7LHWG7YtKMnVHYi53Yap+CzKe9cPRMvty96yR5ecm3UMV678UAigMLLAyPke6K5uklnSguSvF3oeIiSd4/XpIEx/cl8NQ7zT6hJveO1lFmOjqwhF3/Q1DhI4ljgQMN1IxvG6gl2Lc0VpznVK096ciN0PQWsrM26vx4+kXlrlyk3b4s7NGy+EWYiiK1AnimOaWIceTpT14lnHOZGJo3IdjITxDySnaraEnisdQAu+EiUDJ7vTIDXlAzKlzBxOkbA+zds6RWy6w/2jcT8ImQWmxAOdXSqGunqS6accvIo1NO2ULMjSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DtKTR49O88NrFp85TLxad1DKwTceZ7AhEiwxJXtYkeA=;
 b=jkFeUnTsTCIw++FczO6n0s9K/gAUQ380zWQK0o+6ggbodJ3+k42rqodNsNtPeXXebwMbYrmHSfZI+cOh5zkxJ1a4bZq3YmuvM9dc3t7o0wOU8aZv/WjTZHr7VOV+q/ZD5nNSKGSHyrD7hBEZx2u7ESOC+9dH9jvfg/1UMz4X2MU=
Received: from CH5P222CA0017.NAMP222.PROD.OUTLOOK.COM (2603:10b6:610:1ee::21)
 by SA1PR12MB7341.namprd12.prod.outlook.com (2603:10b6:806:2ba::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.47; Fri, 10 May
 2024 17:11:28 +0000
Received: from DS3PEPF000099D9.namprd04.prod.outlook.com
 (2603:10b6:610:1ee:cafe::21) by CH5P222CA0017.outlook.office365.com
 (2603:10b6:610:1ee::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.51 via Frontend
 Transport; Fri, 10 May 2024 17:11:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099D9.mail.protection.outlook.com (10.167.17.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7544.18 via Frontend Transport; Fri, 10 May 2024 17:11:27 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 10 May
 2024 12:11:26 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd drm-fixes-6.9
Date: Fri, 10 May 2024 13:11:10 -0400
Message-ID: <20240510171110.1394940-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D9:EE_|SA1PR12MB7341:EE_
X-MS-Office365-Filtering-Correlation-Id: 63d58e74-9c78-4bea-1c59-08dc71143a96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|36860700004|82310400017|376005|1800799015; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VFYyRWVDclA0bTJobzJmdXJkd3hTRkVUTVp2Z1dLbkRqQVYvY3phVVpkTXhq?=
 =?utf-8?B?WkdGWlJSLzNGck00WnlRZ1dBQmJiYm1IcWd1c01DbHhuYnpGM3h1V3RaNEh0?=
 =?utf-8?B?ZVlKeVZZZ2h0Zk9idUFydmMwcEQ1V21ETmRORVhCdjcvQndCRVhNVStxUXRF?=
 =?utf-8?B?RlU4dnlnUUFleDRjZ2lBV2p2NjdoZGw2Z0FMU0doSUJ2K3h5MjFSL25YS01W?=
 =?utf-8?B?VlNLOTk2WGxXQ3RuNlFHMitxYWo3UEljK2NEYnlKU0tSNURHVHJweEloeFEr?=
 =?utf-8?B?SWdJM284blp1L1Q0cHpXYzJNQzZIUUNYQnpBRU9hdXFYUzdhR3ZRRVgvTi8x?=
 =?utf-8?B?QXdodk5ORFEzWHZUaVlkbm15bkIrMnJoK2Y4SGExZ0ZCRVhZQldIR2g3YVJ4?=
 =?utf-8?B?dGxFYU1jU2NPVE5UL0xWTDVNN3JXM3Fua2o0ODlPTGcxNFl2ZEV6YjY4WkVN?=
 =?utf-8?B?Y0cyUzJySkhMUEVibkZKM2ljbXkvUE0yQkxDcm5Cdkx2RnRTSy8wT1JOTmRF?=
 =?utf-8?B?WTQ0MmFoT2VSVjdOOEtWaWtsZzhaVnluMU9IZjFqaUJmS09zakdLbEZGSmg3?=
 =?utf-8?B?WUU0L1dXSm9GQUFmYXlLNnFZNWtHUnpLTWlOUHV2RzFnb1JuRkVHU3c0bkNi?=
 =?utf-8?B?TWpnbE5hZmkyUGRQbzBZbXJkY2hzaU9PUDE3enM5OGxvSTVURk5TaVZqN1dy?=
 =?utf-8?B?TVlFRWlDUldtOUdoNndRakd6TFJIMFpRNSt5RGxCaWF1S2FFcXdJd3ZieVZk?=
 =?utf-8?B?SjR1Q0RydmJlait5ZU5LNXJZNGd0SHNJN0V6TDNPd2RoZHpBR2owcW1GU1c0?=
 =?utf-8?B?NzlIVjQ2MWFJYno1WXVucCtNUFRuVWgvNVhiRVBlb0I0SFBlcUhVYThtbjIr?=
 =?utf-8?B?OTNoOTRsSDJCM0xJYVg0SzA2ZE1kSzdlK2Q2cFlLYWlKN3Y4Z2N4Ylp4U1Bw?=
 =?utf-8?B?RFIwa3dHaVpmMHpUVmZ0QXZZV1ZTQWdmTktZb25IWGNYaXQrTVp1eDg2Y1Bn?=
 =?utf-8?B?TmZtbnIxUWsralNiRmx2UDcrVXJ2dHkxQ05OSnhPZ3llS2ZEcjUrNjQxalZN?=
 =?utf-8?B?U1lNdHZyd0E4MmE5T3JZNGd3bm9Wdm01SXNURm5SMUVyaTU2QTkxbE9VNlp3?=
 =?utf-8?B?U2k5R0R5VW1xYXQ1eHFCUUptQnRRQUlTWWR5VlMyVFl1TGYwOXNEWkE0QVh2?=
 =?utf-8?B?Y0o0U0o2Z1lzTGMydEhOSGlTanROS1B1THBueGtSMHhLMGVmY3lwemhoci9H?=
 =?utf-8?B?c0U4TTh5WVFFYk9relF4K3BRR0FwM0V0R0RkZ3o2QWZJb3VER1V1ZXN6akYy?=
 =?utf-8?B?M280U05MWHRHY1ZrTDkyV2p1MDhjMGZOQ29kTU1TRFF0VjlJdWxOUXdEWUdk?=
 =?utf-8?B?UzdZckFTdXgrY1ZrNCtrMWF2KzlueG40UFUxSTRuREVrNk5YZjRsOXZHZmdi?=
 =?utf-8?B?dDZ6eG16MmJkNnI1OVB2MVRiK2tvN1h6QjdlZ2tRaTJTcVVkbkx0Z05YVUdq?=
 =?utf-8?B?UWxFN3FZblhOWVJNK2gyYmNFR09lMVhOQ2lhci9IbGQyT0JPZS9PbUo4MHpn?=
 =?utf-8?B?Y3R4Z2VZdXR5OGd0S21zUUJiR0RMT3JwRmxxV0hCcktyRisyUDVNK1ROWWh3?=
 =?utf-8?B?RDR4Y20vWFFiZ1hBL3VTOFA5U0ZjNzBmWm5IY3MwMnJWTEFiYWpSSWp5UUlH?=
 =?utf-8?B?UGhRSXJWYmxzS3lnYmRRcGc1ZGp4QnFlTGlnbkx4MWdTbVBEV2QyZnpXYTVO?=
 =?utf-8?Q?cG4BKNSSpvx4dutMW973Yt/H3H6ZibyYRTfM8Fa?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004)(82310400017)(376005)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2024 17:11:27.5187 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63d58e74-9c78-4bea-1c59-08dc71143a96
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099D9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7341
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

Hi Dave, Sima,

Fixes for 6.9.  Same as Wednesday, but drop unncessary patch.

The following changes since commit dd5a440a31fae6e459c0d6271dddd62825505361:

  Linux 6.9-rc7 (2024-05-05 14:06:01 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.9-2024-05-10

for you to fetch changes up to 8d2c930735f850e5be6860aeb39b27ac73ca192f:

  drm/amdgpu: Fix comparison in amdgpu_res_cpu_visible (2024-05-10 13:05:13 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.9-2024-05-10:

amdgpu:
- DCN 3.5 fix
- MST DSC fixes
- S0i3 fix
- S4 fix
- HDP MMIO mapping fix
- Fix a regression in visible vram handling

amdkfd:
- Spatial partition fix

----------------------------------------------------------------
Agustin Gutierrez (2):
      drm/amd/display: Fix DSC-re-computing
      drm/amd/display: MST DSC check for older devices

Alex Deucher (1):
      drm/amdkfd: don't allow mapping the MMIO HDP page with large pages

Lijo Lazar (1):
      Revert "drm/amdkfd: Add partition id field to location_id"

Mario Limonciello (1):
      dm/amd/pm: Fix problems with reboot/shutdown for some SMU 13.0.4/13.0.11 users

Michel Dänzer (1):
      drm/amdgpu: Fix comparison in amdgpu_res_cpu_visible

Nicholas Kazlauskas (1):
      drm/amd/display: Fix idle optimization checks for multi-display and dual eDP

Nicholas Susanto (1):
      drm/amd/display: Enable urgent latency adjustments for DCN35

 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |  7 +++--
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |  5 ++--
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    | 16 +++++++++--
 .../gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c   |  4 +--
 .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c    | 33 ++++++++++++++++++----
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_4_ppt.c   |  2 +-
 7 files changed, 51 insertions(+), 18 deletions(-)
