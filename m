Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C52F7A997EC
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 20:31:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8339B10E22D;
	Wed, 23 Apr 2025 18:31:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="OOTPJAGB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2057.outbound.protection.outlook.com [40.107.92.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C658410E22D;
 Wed, 23 Apr 2025 18:31:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b299k3sKOcRK2QXYtY7m13SrmezmpZRMT02lgTuxov5n6UYNuxCRn6NuxGqNka+m92kQ1JNtxGqx+aKyAgCE2GRxsv4AfqiUyNYNxSRO8ts6KQLWUJ3qbydhFD6zkUg1aPYZj3HxDCEL19KDRZSlEZkvRgMa7YgwXdJDDpqa783NMVGY2cBfuV2nbFR876jr54dliZtfBtCDXjoCk+7w+X5dtmVQbEq0mRw6u3mIyRjWDzy2/nNZcn9hKsQbJiIhWaZe7BAl9XZzZdoJERv+pVQNr6f9zLlUsjuTKXkwVUTlf8xkNVAqvL/MfRuNUEDXZiE2tYzAgG0RK/y4Du9mUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R72WRw8oRG9TsOWLA5y9A4YT1fULf94LDbB0LZaCZWo=;
 b=FoSgKnqr3bHrKVvz9Iu2tAmAPbVEExVhmiPd+8S8/1HC4xbgMzvSBJT7RiqWeaDAHCEHKBbZuDKgY8E1JZNptZ6P64JnzWi2DmEF6SbdPEUdgsatN7svLJlEGAiFUiadsvgPn7+tfnfZswUYiVXG34Uwm9GC1EKQ+E+CIIUveRS0/o3D45DfjkmBRKRz87H+vZD3gL/9gs5qe6Rk78m03xPpErpVHDeJ7oVXgyGltD6oq/Y24vIce/QIAS+7IBMK3bYXZXoZSnIA8ccO2IwXbJZykAawacesBy2HwzAQep145ZDQgtBhOMKV5MJ/q6dDhH+lAJz96QLZBBhetGIK+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R72WRw8oRG9TsOWLA5y9A4YT1fULf94LDbB0LZaCZWo=;
 b=OOTPJAGBqt1E4X/TH/hPMx7y+yXG04NVKPo48bgBA8B1Y+AZfr1MVU7o4NMfd+pmL4RtD7djW8zDLf9p0Lmie8lDBF/PAlw088h5PcBRVZwgvxIrX43tCL4Zl8QnKQECyGZot+2jIMxsVC33u16Srd0tG24d8ppkV20bLL35aEg=
Received: from SJ0PR05CA0163.namprd05.prod.outlook.com (2603:10b6:a03:339::18)
 by CH3PR12MB8852.namprd12.prod.outlook.com (2603:10b6:610:17d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Wed, 23 Apr
 2025 18:31:05 +0000
Received: from SJ5PEPF000001F3.namprd05.prod.outlook.com
 (2603:10b6:a03:339:cafe::1e) by SJ0PR05CA0163.outlook.office365.com
 (2603:10b6:a03:339::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8678.13 via Frontend Transport; Wed,
 23 Apr 2025 18:31:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001F3.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Wed, 23 Apr 2025 18:31:05 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Apr
 2025 13:31:03 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu drm-fixes-6.15
Date: Wed, 23 Apr 2025 14:30:45 -0400
Message-ID: <20250423183045.2886753-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F3:EE_|CH3PR12MB8852:EE_
X-MS-Office365-Filtering-Correlation-Id: 567c8ee9-90e9-45d1-732f-08dd8295021e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|30052699003|82310400026|36860700013|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XYO/91r+cPCYW2OaLSe/DUTYY9sWR37eaGVXRpkLqojwAjGztNu7+EJ9Odzm?=
 =?us-ascii?Q?6UIHD63olAAvrap9F81Iv68Xwv0Cf1fR4nDG48gytIFyn7CyREY1y8lfv6Jn?=
 =?us-ascii?Q?mcZ5Xu43tofkohqQdI5DE8vR1BZtkmEck4Yx54eDBcLI4cntLbxn0rbR4Ah7?=
 =?us-ascii?Q?1sdj3M3Qzmq3qE1pon8+74VPa1kjTLq44CGq/1fL+h2b/eGToDP5nAtY4BIS?=
 =?us-ascii?Q?/zROXP9KjuGeDxWE6YxU0K9gOAV/SE3FqI5wpPziVkcgZyqiW7GCO9CSFL04?=
 =?us-ascii?Q?LJ/+hQ+oF0JIisahUyNYAkGEWJEeDJQ7L0q3Hv5guZO/32fVRb0gyg3UgVN8?=
 =?us-ascii?Q?87EghuTdm0yC7RnMpvZW0asMdT2iIrTdK7VlA0sFzP5eb6D68rK6YYNpiFob?=
 =?us-ascii?Q?AbY166q9XDKUo6x8q2B3QgQcbdRUmw47+XON41lmsEItT9sdpcWkVhm+3/wy?=
 =?us-ascii?Q?jDGK6WgC+EwSGidi2egAX9ZtrR4Ga23aAc0e6H0f07TkGxM7J+WMBM6izIta?=
 =?us-ascii?Q?N9E/KOyfjQHdhEL3k4zA4eNyTwQKzNiXap4Vr7wfdswDnZcirtulBIOu7TIb?=
 =?us-ascii?Q?+tJ/GzUpCzeYC+IqY3kdnMRCflVbYE5JOvE+rk4qnsoCBYRiHMl3Sw9lh553?=
 =?us-ascii?Q?iePjaPrMwmCOwp17JpZRr3gM9j4/myav58V+2/kR53ytPwsN+hY31MT80ABr?=
 =?us-ascii?Q?M1+kKP2a5P/l7bqCSCDA18Ul0o0xvELDbZkeXEbaMStKRsVdnihEGT6305iy?=
 =?us-ascii?Q?BeDyN8Nht0gspJJg0UOPmRUw3kg+TEVZKdDEq3niQtCsod5xTV1WwxdC07FV?=
 =?us-ascii?Q?xCgGE4deAOFAB8kT95cBMDtHX2WXZgIcK4xSZU0w+lOILoAd6PQtfkBRxBlQ?=
 =?us-ascii?Q?oahj98iod6XtTE1WMXhSdQeTqQEJ3hPLdXoAuRRtUm12ZNY5Gmuu/1Go4V4q?=
 =?us-ascii?Q?1thTyfbj5SDsRXtDthslmLz+gv48gMxmQ4M5eZkusStJfI/EcKMqgq7vQTGu?=
 =?us-ascii?Q?03V8GbDLc7icS2kUC5dUVxKZGmd8cTYKzcassrFtCwZNg59C0dQailp4ukYu?=
 =?us-ascii?Q?V6/il3tMv5Zkjuq76lyIinonH6krbb9YGlPZcdjhC/iUQNWok9UmawjBLa0U?=
 =?us-ascii?Q?VClhGdge2m3lW/Mk4MKg6zisopGwhAPjVG27zjvhfbZdOp33x9y50CMcDsKC?=
 =?us-ascii?Q?U8WJGYbIQg+62uUXLlFXu4KIfaOJgUJkAkMoFkP78OP75nACviMb4GQMwZcM?=
 =?us-ascii?Q?7yVc5HFhdW5NeK+LCxuFvWptmsMWLJjYBodHzXA3S04vtEEBVfCKkL3pIseR?=
 =?us-ascii?Q?E8o8XMuki/p4nTqCulbovTo6XKClXbEmtnnB9tjrFymcB10LeKbVMe/lA8YA?=
 =?us-ascii?Q?+oOuPAs1Icb9M/DP15bYylcZ1NN3HWBEaHZ4zJTSbssxAX1BJ81logKzfLte?=
 =?us-ascii?Q?yKtgxxOye1AHWjzPS8YWAe50GNmXDmLMrPMIdNNcMwRc510ZxSFV9w=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(30052699003)(82310400026)(36860700013)(1800799024)(376014)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 18:31:05.2360 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 567c8ee9-90e9-45d1-732f-08dd8295021e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001F3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8852
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

Fixes for 6.15.

The following changes since commit 0467145fab3b3a7a1efd221722310fe32329b3da:

  Merge tag 'drm-msm-fixes-2025-04-18' of https://gitlab.freedesktop.org/drm/msm into drm-fixes (2025-04-19 15:09:29 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.15-2025-04-23

for you to fetch changes up to b316727a27d0dac1e6b7ae51204df4d0f241fcc2:

  drm/amd/display: do not copy invalid CRTC timing info (2025-04-22 16:51:17 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.15-2025-04-23:

amdgpu:
- P2P DMA fixes
- Display reset fixes
- DCN 3.5 fixes
- ACPI EDID fix
- LTTPR fix
- mode_valid() fix

----------------------------------------------------------------
Felix Kuehling (3):
      drm/amdgpu: Use allowed_domains for pinning dmabufs
      drm/amdgpu: Don't pin VRAM without DMABUF_MOVE_NOTIFY
      drm/amdgpu: Allow P2P access through XGMI

George Shen (1):
      drm/amd/display: Use 16ms AUX read interval for LTTPR with old sinks

Gergo Koteles (1):
      drm/amd/display: do not copy invalid CRTC timing info

Leo Li (1):
      drm/amd/display: Default IPS to RCG_IN_ACTIVE_IPS2_IN_OFF

Mario Limonciello (1):
      drm/amd/display: Fix ACPI edid parsing on some Lenovo systems

Nicholas Susanto (1):
      drm/amd/display: Enable urgent latency adjustment on DCN35

Roman Li (2):
      drm/amd/display: Fix gpu reset in multidisplay config
      drm/amd/display: Force full update in gpu reset

 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c        | 52 ++++++++++++++++++---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 41 +++++-----------
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |  2 +-
 .../gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c   |  4 +-
 .../dc/link/protocols/link_dp_training_8b_10b.c    | 54 ++++++++++++++--------
 5 files changed, 96 insertions(+), 57 deletions(-)
