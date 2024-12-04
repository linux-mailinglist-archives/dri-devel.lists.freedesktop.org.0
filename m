Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DEE9E46F1
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 22:38:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 329E710E593;
	Wed,  4 Dec 2024 21:38:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="NqGXDwtd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2053.outbound.protection.outlook.com [40.107.220.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E377B10ED57
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 21:38:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wq2tdM5lZjPyPviiXwYGHDSZZO7fA9iSoxO1cvKDkuKf6WPvDgHCpLARrqWivd/fbxNSzOZhYVIOFZwtk77LoeZQghCB02jxiZmznDTmJZ/vVlgRb9YvDe4w9SkeoB422YRAp0Wat1P9D0f1BTsDyG94fCqIFaTjXrc0lwnUF8pezyAhk6zgHOywLSTL/ThA3dpBkr/TODXyv2sdMLgYINgJouz4CwDhB7va0UX/jp2EChZRlvphPd46UgJfeSbuXDawQeenVkIYP03I6pl3VU+F3HZXrfOAHJWUZxymOP2VrpQL8WnuA7uWP39ztBW/uqZUHEbfjYZhrqtWd5P05w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XQ8IElNrgwbwMsqwEJZEe6YDJjq3BASUrbM5iRKhpUk=;
 b=klacXsj9sU1NxkU4Iui77oPPqH80rbmJWQkeUTMylHlTb1SO4u6jmNX6vZ6DtEbfAG6WG2DsGhnaEeJ+9mbTxKF4gwin3zvSYaXZS+7F3x7yDgmLXw/jzNum97T/Gf9UJQCQ1kjcxEE0mth7kx8NXMhTC0G8dO2H0M2VANR6m8oi0vnRzqj7whhzq40MNjcAttXbm955TbicFVytmbXl7oPLEiPHZDRQ3jVov9lEUoTPVq/FHY1zteQ35qv5oM5jxytPVUvscVA8LA6QTVSIdqofXqBXmuVwPvUGW7qJkcq/DaWa+DYwfhXvrKIoYXs3FR7e4b4Iw0jVNZyqUpgvEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XQ8IElNrgwbwMsqwEJZEe6YDJjq3BASUrbM5iRKhpUk=;
 b=NqGXDwtdbZAzc75//oADm11lc3wCLQv/idAYsFaZgxvlSaKa7FU9ACwomVInVEgifS2Au8qRHuL3hGFdcaNLRtvAVFzLeBTbsifeFKbx+fB0dCA3Qd4DG9GZvx4+/RfQvt2+3Q+CQiS5AHPQE6e899RLg2tRSNduwlezu8HHJHs=
Received: from CH0PR03CA0267.namprd03.prod.outlook.com (2603:10b6:610:e5::32)
 by MW5PR12MB5651.namprd12.prod.outlook.com (2603:10b6:303:19f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Wed, 4 Dec
 2024 21:38:39 +0000
Received: from CH1PEPF0000AD81.namprd04.prod.outlook.com
 (2603:10b6:610:e5:cafe::69) by CH0PR03CA0267.outlook.office365.com
 (2603:10b6:610:e5::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.19 via Frontend Transport; Wed,
 4 Dec 2024 21:38:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000AD81.mail.protection.outlook.com (10.167.244.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.7 via Frontend Transport; Wed, 4 Dec 2024 21:38:38 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 4 Dec
 2024 15:38:38 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 4 Dec
 2024 15:38:37 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 4 Dec 2024 15:38:37 -0600
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <min.ma@amd.com>, <max.zhen@amd.com>, <sonal.santan@amd.com>,
 <king.tam@amd.com>, <mario.limonciello@amd.com>
Subject: [PATCH V1 0/7] AMD NPU driver improvements
Date: Wed, 4 Dec 2024 13:37:22 -0800
Message-ID: <20241204213729.3113941-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD81:EE_|MW5PR12MB5651:EE_
X-MS-Office365-Filtering-Correlation-Id: e6dbfb2e-8cc5-481c-68c8-08dd14ac03c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IjQNmBHD7RllID5pNkwvsZ3Vc+g3O5GaceHxtehVCcaiN9WiZVcav3Is9scP?=
 =?us-ascii?Q?eyIl6ciVR3y2BgXrymHOCgJ5Xfzlze8mm+fNq8tAcaNuMYYo6LvmJqIUQLUM?=
 =?us-ascii?Q?U8fpUs8V0c4gytosAmTflEJ8JhyCezkVq+vnnoRxbkDA1SlS2uXd0khs5Znz?=
 =?us-ascii?Q?pOajVgLRtcXhUTIz5JkYw6DH4GHfG0cN80C6V6+GvQ7idCcECpzl30x7hLvZ?=
 =?us-ascii?Q?Vcw017QydtyS/rgccd2y5fjErfM87Xqhj2wS48+B9TMlwVwPy2XOk+k68OZT?=
 =?us-ascii?Q?EjKbmy6txbjdNBJ1W+QCVqpesi9yWiRpV1RxBrC+CK64gJYwspUCmhUFHrnh?=
 =?us-ascii?Q?vuEIbcXiNhD539S1ksXoTW0vVlz9qm7V8+C27w3ITY+XeLwlIctK4jAQR+sL?=
 =?us-ascii?Q?j7ozItD1W+2xKx6NaQIHXUO8LQ/ixXdZUTcI9FHnXHFU8DiCeTKbxGKcm6Cl?=
 =?us-ascii?Q?iXKZ65f7+Gfde08VwGWmJp+yTBnxkNtgR/+PE+b2w3iNnBhNkY3gpOuBf/uZ?=
 =?us-ascii?Q?aKVxWcSCE5ysEKzBVBufD7PYysAixgPMwVogY1rl6lACzHOqHgGguZZweeKY?=
 =?us-ascii?Q?1NoEbf37j8ZEhYBJS3KAFS5O6iffavFdaNE8CCj8z6Rj9GF28mkfA14E/r4O?=
 =?us-ascii?Q?7kn3ewcG0WbSfeWJ93zYsUPssEcD2yOGlDevlAtxHmbypycLIcSwF2vH3rXs?=
 =?us-ascii?Q?HafXv0NVhm6+Owt9iF1x6PttawI9YgYYJWCoZKBpJuLsVX7GWOkaNTUBa3AJ?=
 =?us-ascii?Q?PtEN6YtCJkmJaucm+oVP4Q3TDKaY14ZFzmWXay7uwuXa7ADY7xzCf6zb1z9b?=
 =?us-ascii?Q?HNiy5ngww2wvOd/NNUiLStk0QpQnC7J+5gf8OP5JY7s9uddqlnbD6zMli+45?=
 =?us-ascii?Q?A5Y0GbxPANnkAme0R/TTO4N5COulFlwmC7gxjgYbeI3elHg9JeM5iXNqqb6v?=
 =?us-ascii?Q?0/87xfVeMAZ3sDwXfdvOW3rS55A8LzyFy2ogj3WQm8sx5z0UE5as1pWyOW6l?=
 =?us-ascii?Q?rvNgtox5DpNy0JItojcy1y0uu97Uvt4ryqGLqflY2i81xp0l0pE4GZz3IgjE?=
 =?us-ascii?Q?3WQHPLoVeXEo69bHy3yw0RBoTCmZJ52chQm5K3eWWOQwdDQSnpne35zKllRZ?=
 =?us-ascii?Q?iPe+/myUP+7bNLyCF4ddxJmKO73uhZlJ8/NSomhvVKOU5LwnvFPT/m3cGofe?=
 =?us-ascii?Q?/8KZnS0oy5ZZggE7eUxMgE7r1tD1EPeMz98F1Pu0UMgzi7EYcMh3yfQu3EKr?=
 =?us-ascii?Q?+/WJNW3uCSA9FKuhwoKBfjQ3ls0UCZrKIeTIcO/ppq7+oK6hmjaGBE2OCj0D?=
 =?us-ascii?Q?Ili4wazHrpDytRTD0CXW7xYs2zPIxHiYl4sSiR9836ZmSoTncJND7uyjl6bA?=
 =?us-ascii?Q?nQEyI5LFCabk9BjusCEAM3qmgZiXwGJYvo4FmJQS4fyXnB4PWm8ulLHv2bDv?=
 =?us-ascii?Q?XcLejh7dbBAPJgD/x2kGOBv5e+ILsP36?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2024 21:38:38.6249 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6dbfb2e-8cc5-481c-68c8-08dd14ac03c8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD81.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5651
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

Add recent improvements and bug fixes for amdxdna driver (depends on [1])
1. Support recent hardware and firmware.
2. Replace idr APIs with xarray.
3. Fix the bugs been found.

[1]: https://lore.kernel.org/all/20241118172942.2014541-1-lizhi.hou@amd.com/

Lizhi Hou (7):
  accel/amdxdna: Add device status for aie2 devices
  accel/amdxdna: Replace mmput with mmput_async to avoid dead lock
  accel/amdxdna: Add RyzenAI-npu6 support
  accel/amdxdna: Replace idr api with xarray
  accel/amdxdna: Add query firmware version
  accel/amdxdna: Enhance power management settings
  accel/amdxdna: Read firmware interface version from registers

 drivers/accel/amdxdna/Makefile          |   4 +-
 drivers/accel/amdxdna/TODO              |   2 -
 drivers/accel/amdxdna/aie2_ctx.c        |  12 +-
 drivers/accel/amdxdna/aie2_message.c    |  37 +---
 drivers/accel/amdxdna/aie2_pci.c        | 252 +++++++++++++++++++-----
 drivers/accel/amdxdna/aie2_pci.h        |  68 +++++--
 drivers/accel/amdxdna/aie2_pm.c         | 108 ++++++++++
 drivers/accel/amdxdna/aie2_smu.c        |  85 ++++----
 drivers/accel/amdxdna/aie2_solver.c     |  59 +++++-
 drivers/accel/amdxdna/aie2_solver.h     |   1 +
 drivers/accel/amdxdna/amdxdna_ctx.c     |  46 ++---
 drivers/accel/amdxdna/amdxdna_mailbox.c |  59 ++----
 drivers/accel/amdxdna/amdxdna_pci_drv.c |  23 ++-
 drivers/accel/amdxdna/amdxdna_pci_drv.h |   8 +-
 drivers/accel/amdxdna/npu1_regs.c       |  31 ++-
 drivers/accel/amdxdna/npu2_regs.c       |  17 +-
 drivers/accel/amdxdna/npu4_regs.c       |  34 +++-
 drivers/accel/amdxdna/npu5_regs.c       |  17 +-
 drivers/accel/amdxdna/npu6_regs.c       | 114 +++++++++++
 include/uapi/drm/amdxdna_accel.h        |  70 +++++++
 20 files changed, 804 insertions(+), 243 deletions(-)
 create mode 100644 drivers/accel/amdxdna/aie2_pm.c
 create mode 100644 drivers/accel/amdxdna/npu6_regs.c

-- 
2.34.1

