Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 204F59E7B41
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 23:00:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B828710E633;
	Fri,  6 Dec 2024 22:00:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="XXZt716i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2089.outbound.protection.outlook.com [40.107.223.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F42310E1B1
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 22:00:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hrU1xNPxd9uubFn3VpZi0W/7wra6pHFaSltbhmbIxCUeC5kHAy9F/tkVMM/SU4Y1LMOA2cEvUcrn9epEjalouWaUU/yglq/pdjmzYmekxr4/+GnV94dWS1SQ6DxiRbdPzY5IpiixurSWwRDGTZP1vPy8d7cJ3SZajiZ8/WLbSdhCzWlkM1euRkHnNNr+c3BgUt7NqGBfgr+4LK/fH91zrwhONH14HsWGoR4dAUxqABDK40FzUoreDvTUid/tVYHuKRsn8tVOBlhLY3Q4LEUXwTbU3N1+M/tWzPbbi+kXcMLhmgjiQHV7B5CtKtOtyztCGwtO3pbh9JiueZ6qFQBFAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NycmyPDZjL1ON/x/u/vjLjczBdWA6Ejzff0w1cM4l2Q=;
 b=qFpWy8vvk2THNH147dXJdieNPCcA76wMO7CZsbZX1MnrT/ckCj4B7V8YRMalj9QDufUm+eGI9VHXshJnAh1VW6Hj0xJA6c73qD19jBLk7/sXkYHv8JLcl0xfJc2MrC4fQLICNc+x159kkWLnSotjFzFe7usdwnouCRF7rSQrOv5gbFL7GYqbjrQIUZH0IRWen+k82QhXQmjOt24gNw6wn6X2Wo9FuNDMryy8NvjosUGEgeB0tXFJThppznHIkY3yz0X0eb7JNwPCL6AfH5Aj0FORmRZfIMEigUwc14c0343NvYAaDphVpVCLlGqhtW+wO4Q4eZn3vLAsl4ubaCoyFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NycmyPDZjL1ON/x/u/vjLjczBdWA6Ejzff0w1cM4l2Q=;
 b=XXZt716iRrIQYAm0fFdqlGd9qp+3cmeky94vpLwXWcNzqKK58WOVeTaZf8hCEq6AOrumZw8JLJfYcil0DL4sqCQfSV4iFF1Tnsao/lOUbZ8ZGvGCpyw2n1RqVn6+RAnvlt5qlA+jaYKC3xpkWiZjGh6I38Tq8oqk2pdT7sfC9Hs=
Received: from SJ0PR03CA0051.namprd03.prod.outlook.com (2603:10b6:a03:33e::26)
 by CH3PR12MB8188.namprd12.prod.outlook.com (2603:10b6:610:120::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.12; Fri, 6 Dec
 2024 22:00:16 +0000
Received: from SJ5PEPF000001C8.namprd05.prod.outlook.com
 (2603:10b6:a03:33e:cafe::a) by SJ0PR03CA0051.outlook.office365.com
 (2603:10b6:a03:33e::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.11 via Frontend Transport; Fri,
 6 Dec 2024 22:00:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001C8.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.7 via Frontend Transport; Fri, 6 Dec 2024 22:00:15 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 6 Dec
 2024 16:00:13 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 6 Dec
 2024 16:00:13 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 6 Dec 2024 16:00:12 -0600
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <min.ma@amd.com>, <max.zhen@amd.com>, <sonal.santan@amd.com>,
 <king.tam@amd.com>, <mario.limonciello@amd.com>
Subject: [PATCH V2 0/8] AMD NPU driver improvements
Date: Fri, 6 Dec 2024 13:59:53 -0800
Message-ID: <20241206220001.164049-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001C8:EE_|CH3PR12MB8188:EE_
X-MS-Office365-Filtering-Correlation-Id: b72388e8-6747-4735-d937-08dd16415dd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7SjJ4wFBTszmCAh6Ov7mz1YyE4EFqGLQI3E45UuRLroJf5yut5H9JqpNPsr6?=
 =?us-ascii?Q?GF+Ro/Brt2m+UNoxhZ0+Qqsc3lJepnXsXSgoPow80ayvx7EHW337BckDpL4T?=
 =?us-ascii?Q?NMhv1iLoD63mlcalTbITBQVrxFpVAmmttiXiBYCCh71X1UIDIFCwQuRUfJwT?=
 =?us-ascii?Q?KSITP7GKahQgsBxn8GgwJJbOMVrN2aEcHobq6BLiv8N0e3abvLmdl6LjjLRM?=
 =?us-ascii?Q?funhZ3EXJwWybXq+0bY7o1yYEJAhTAYbwqnTTNJrjyC0jZtBM6KT+1+DiwEf?=
 =?us-ascii?Q?xLDqsYLai/8DAYUdvI4WGEGZd+b5+KVA8nqZTQqch0bgEq7uifQw1smq/bc3?=
 =?us-ascii?Q?aSL+UD3gi/oEwzFo0o5EVPAuRdbcBNdYrERTf+r+AiWJwGmw3aeplvuJrqDh?=
 =?us-ascii?Q?Va+1CGQBx7YljYg2mk4K3Q6sQ3fgDlES/kj31NjHkPiG0PI/+RMGwvwM30u7?=
 =?us-ascii?Q?ruilJiS171nY7lLsa0OkIY7mHV7dOH/rnOKi8AEIwIK/ArotzVb6lcgCV1tc?=
 =?us-ascii?Q?dtrPoBELUeLDkE6UdveDTOeyprKtWdqlg2WC4WNoZK/N0qVwcKa5VeJYgyxP?=
 =?us-ascii?Q?+dG0xp7wqO9z0+vYddoeHj5HrJK6gf3FrhoYdb8Mge+UgOmu6nNk4/QjkDpe?=
 =?us-ascii?Q?WHlS1qYoMeLAL+e8t0kG8KxfsLTP9yMcaVOntzR0lAktmSWTW0i3lSFg5tOO?=
 =?us-ascii?Q?EneV+rQW8VSXbLLhXJ+xdyY32hglW6303KfbEgYCLMLl0Ju68CB8ralqdvf8?=
 =?us-ascii?Q?EknYXY9Cv4MxupVK3UNWyvUa7QKeJvjdSofsHbjpV8joeVjdfL1vv/E5J1se?=
 =?us-ascii?Q?ZC4MGJgzLN56bGt7Uup/WU0IEn2vAAn823f7wxCTAbiCvU41RyK6K5M6Dp5n?=
 =?us-ascii?Q?xiDDhu9WUkJrBNkd9uhVK77nrNAbbB/HyiuFr4kdgoIeW5kpszQmRmP4dHOA?=
 =?us-ascii?Q?xefSKBeb+9pr5NaHzcLvifQN2MUOFQu68nvVMDyb10hwf0IKZjBcnYYqENrQ?=
 =?us-ascii?Q?RoDZOMBPc57CvlKq5Dh0e3GnqIhEOIUnA1N9ny7QUkIzUnJyvN/RJTUMoYs0?=
 =?us-ascii?Q?nRWPVTNgmL845WZ9EaTM6bMwtQk4sNjmJGhijv74Ii1K4aXvl82jRwIjoHWC?=
 =?us-ascii?Q?TiaexxzOibxdF/v6BhKeZKzJBNlcRRLQ6J4wSVcYvSIo3hNG1P9IfzVyfyB3?=
 =?us-ascii?Q?jbVoCDyteuTy/duteyYuek/6ZfXT3kVpp8lqYrmbH137LKMevURTsF0XjBIQ?=
 =?us-ascii?Q?3mLstTp2JFoVZ0mNVMMUlKXmXHOrSlHhLUyTCuJtuXEjEkBHkya4/lGpIgsV?=
 =?us-ascii?Q?YVOU8bRi9LGNhVGYyf0/anRil2t/ApSeYLl5S3MAOD3mvt7cVkPu/s1nvWGt?=
 =?us-ascii?Q?St9kFlCtmeNM02Bt5ti89bhU7+By5vUwtHwymcnJlEeeq5aAuF91/i8ND8X6?=
 =?us-ascii?Q?hsixh3wKzx8YgFSwK/k0M5iC44d3eVA0?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2024 22:00:15.8159 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b72388e8-6747-4735-d937-08dd16415dd9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001C8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8188
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

Changes since v1:
- Add one patch to fix possible compiling failure
- Minor fixes for code review comments

Lizhi Hou (8):
  accel/amdxdna: Add device status for aie2 devices
  accel/amdxdna: Replace mmput with mmput_async to avoid dead lock
  accel/amdxdna: Add RyzenAI-npu6 support
  accel/amdxdna: Replace idr api with xarray
  accel/amdxdna: Add query firmware version
  accel/amdxdna: Enhance power management settings
  accel/amdxdna: Read firmware interface version from registers
  accel/amdxdna: Add include interrupt.h to amdxdna_mailbox.c

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
 drivers/accel/amdxdna/amdxdna_mailbox.c |  60 +++---
 drivers/accel/amdxdna/amdxdna_pci_drv.c |  23 ++-
 drivers/accel/amdxdna/amdxdna_pci_drv.h |   8 +-
 drivers/accel/amdxdna/npu1_regs.c       |  31 ++-
 drivers/accel/amdxdna/npu2_regs.c       |  17 +-
 drivers/accel/amdxdna/npu4_regs.c       |  34 +++-
 drivers/accel/amdxdna/npu5_regs.c       |  17 +-
 drivers/accel/amdxdna/npu6_regs.c       | 114 +++++++++++
 include/uapi/drm/amdxdna_accel.h        |  68 ++++++-
 20 files changed, 802 insertions(+), 244 deletions(-)
 create mode 100644 drivers/accel/amdxdna/aie2_pm.c
 create mode 100644 drivers/accel/amdxdna/npu6_regs.c

-- 
2.34.1

