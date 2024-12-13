Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 212D69F19E0
	for <lists+dri-devel@lfdr.de>; Sat, 14 Dec 2024 00:29:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ACAA10F10B;
	Fri, 13 Dec 2024 23:29:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="gl6Ni8hP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2065.outbound.protection.outlook.com [40.107.237.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCD5710F10B
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 23:29:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S6wAsm4RFev+7Dbs1j284ynHASxybnKx2Wkk6n0jgR3GPV9LJe0Q9K1YGp/vNoEX00xwbzATsegDonx8tOGpkmg/eYyQnmKReu0BaUem8nsQE6weD1ZUjat8HuB3nax1JVEKsAwLsuyyq+pXulAtV7KVGNungi9wtbtTTG7944xuFtvkPVDu8k+BnJT0S3KYaOj2zzKcr4Jz+bVTs6ji10AE7WhEq7mh/j7r5HEMRM3PVrlfhfLFLJ7cCKNY0NGagtQTW98GQLxaGezdMo8BHwZXdhCRbpFX26JswPd43f3NZUg0MZbPIlY/Ytt11vGdl8bydA8e6FfuKddX/6vwuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HoP2739+eiH2GM9fxbTQoR5iYP+pGHUNwrI1sK6nLqQ=;
 b=IGrFcO42gG771/Jgv6yYtlhkuaXm+QGMoqUz04uBFUGyU9yVxqy7EW70cxxiWWRHxcBYek8Dr/n2hy4V9wf8td/qn1AOL+kLxxJn/WBlly3yQDmdWECp/GE+CGqmsV47b0sDYmSE2iJ9tmjkyndKKb3NX8EQ0yV8ZYC7Dcho4EFTZ3y8Ed9g7tg2ljMWwElJCQMhX7hxAeR6LMYvBU/c4ShLxNsGKe9xArU8S7P86TGgKRPbV7emqanPvVODtGQylp3iDjFmd0CxignhQx//vtd+bKA6CzQYsRGO9yIvs3/V0/UCkzUGdoi29LZANhURdSyHomCq/caE2OMGSxOY5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HoP2739+eiH2GM9fxbTQoR5iYP+pGHUNwrI1sK6nLqQ=;
 b=gl6Ni8hP7Ijg29MoY+ep3eRIXUe8xtzsxpJU8MhrFKNkPFd2pgytkRQp65Yci1PSCGdVvTgoww7YJ+t6435P2+BIb+n0ACe745bfMZZfg6kO0lPEejU3AQ1Ish7gpy0JN+iiisgn0QOSllcE9g/bVcz+kEJCcTUnLpeQnb9bsyc=
Received: from CH0P221CA0007.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11c::23)
 by IA0PR12MB7579.namprd12.prod.outlook.com (2603:10b6:208:43c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Fri, 13 Dec
 2024 23:29:50 +0000
Received: from CH2PEPF0000013B.namprd02.prod.outlook.com
 (2603:10b6:610:11c:cafe::a9) by CH0P221CA0007.outlook.office365.com
 (2603:10b6:610:11c::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.16 via Frontend Transport; Fri,
 13 Dec 2024 23:29:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF0000013B.mail.protection.outlook.com (10.167.244.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Fri, 13 Dec 2024 23:29:50 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Dec
 2024 17:29:49 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 13 Dec 2024 17:29:49 -0600
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <min.ma@amd.com>, <max.zhen@amd.com>, <sonal.santan@amd.com>,
 <king.tam@amd.com>, <mario.limonciello@amd.com>
Subject: [PATCH V3 0/5] AMD NPU driver improvements
Date: Fri, 13 Dec 2024 15:29:28 -0800
Message-ID: <20241213232933.1545388-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013B:EE_|IA0PR12MB7579:EE_
X-MS-Office365-Filtering-Correlation-Id: 61b34312-fd0b-451a-6318-08dd1bce0a3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KbpBvV+aLoqz2F6Wq3GlSOhkuSg0nopM1JzTQ7lWlt/dlz08MJakUtQ6w10y?=
 =?us-ascii?Q?k4wQlBSMlleXaxpUOb/U/2UAReYXLm8L/ujbYP+/z9Ptw58ot6fx3HF9Qp6K?=
 =?us-ascii?Q?RJ1qW21sa+NV+MTlWBbCThlc8/uN8ryn/8yiSAmBMfH6fYLNPhd+T55Ng2q+?=
 =?us-ascii?Q?7x1ppX+RGvG0OumaelQNbHoyH0fq/UTjZERFW6MWP0ECFM1sxtIxYWR4W3IQ?=
 =?us-ascii?Q?McMJbXOZ30zs1iii43iPuoPwrIzyxSwUVgzTJq3u6s+7OM4pq9rLHiTMWFdi?=
 =?us-ascii?Q?kzvkMnqc3nDl+pGcNh7D4EPSU+vbJ4+IcNWgjAemhulxvs/YFlEFCjOJjbO9?=
 =?us-ascii?Q?yfm2MsXSju5w1djydoTl8w+227C7lL/giPUG7hd+PTWN6ae+vlLsq+xhGNq3?=
 =?us-ascii?Q?xb5J6CcxHePYbtVNAFS9f8pi8yUXNrzIdNmfFnTrTfHypeZHwIZDmJq0CDKe?=
 =?us-ascii?Q?utXrc+OoHTi57q1gPbh8M/Wf/aOKf1SFztQAEKe91JRTIKW8duBpBSxJyI9m?=
 =?us-ascii?Q?+Zrxswh3HtNYu2DTWyzFHQrBOy2AyfepeXWOSbKCaRblLIWHQnU8w5tW0AOB?=
 =?us-ascii?Q?sArjBmW+GVYqe51tovaI+Cq0SDs0cEOP+Yu3fbZDPzJbKBAILIKtokeQhepT?=
 =?us-ascii?Q?gQYRhv4fxHUWUiOGEljmMduaTeK0CbBnCrLtM/rsApLZZVl95JzLt02qdGAM?=
 =?us-ascii?Q?5+9j2viXs/gx6grMIMelfQO5RvHQWkQiygvVPlGlfYMQLZ4mcDyQ2lNeduRP?=
 =?us-ascii?Q?VamQ/BNP9L8dY81ImoA3j64YMfR98bV0RooyHuf9Ttk/0fGxUcWxuQ5ECUq2?=
 =?us-ascii?Q?aSGl+e3tRseS1ygMMo+ww85isyEU7USFSmD8fwCdxr/4MNA9oEOPeFwwuKbm?=
 =?us-ascii?Q?BJzAmYEpo2nT8snsPnuRmBPYxx7SqDfTJyrKJI0Yt4RCLxHgNTdInHu972ky?=
 =?us-ascii?Q?A+/FHbSkz1122XtlsMDvyGPpZXpb8lxZrLdzwd+oNIeXRkJBEBp7sQVv4wai?=
 =?us-ascii?Q?ArMkr+b3IR2lTd6bNIxR13Kd3zMEhJ3CMgQ3q88q/uvBuzWnzSusdZXygyKp?=
 =?us-ascii?Q?98Cilc/WXRWTbRIH34InSwcjw4oHwtT4QJQ42fTnKnfs9f3JwEqhXGmHWM/N?=
 =?us-ascii?Q?kLYXB7OHVWfu7qK5m2LuwNmCfeJvKiW59MFZV28uFvvA5+VpWzNCQAQcSYce?=
 =?us-ascii?Q?cJLL+ICy0jXK4jV62+jSW3yZBpcupfDpDhBn2HjHcitWBn8zY+Q1meGYDCp9?=
 =?us-ascii?Q?us0ZQvPWva1UbK1NnVi0ASONUCP3UU8Iwja6pyCynD5B/u5Cit5rBPHvPjze?=
 =?us-ascii?Q?EeQPNChxQfpm94TAyCVW6ADphojkkfukrbERhll5gWMifbc+NfUYJMFqjAv9?=
 =?us-ascii?Q?8Gwv6eh4GB/8/QjF5Gkjzin27rI3ZZewtYTBkGDHGd5vlpOvDU41gIF4HmVl?=
 =?us-ascii?Q?cIWyFg5/qWoT0FvWzpkAeGvreN/r/rA2?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2024 23:29:50.4418 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61b34312-fd0b-451a-6318-08dd1bce0a3b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000013B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7579
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

Changes since v2:
- Remove merged patches from this set
- Add MBZ check for pad member of input ioctl structure
- Fix for code review comments

Changes since v1:
- Add one patch to fix possible compiling failure
- Minor fixes for code review comments

Lizhi Hou (5):
  accel/amdxdna: Add RyzenAI-npu6 support
  accel/amdxdna: Replace idr api with xarray
  accel/amdxdna: Enhance power management settings
  accel/amdxdna: Read firmware interface version from registers
  accel/amdxdna: Add zero check for pad in ioctl input structures

 drivers/accel/amdxdna/Makefile          |   4 +-
 drivers/accel/amdxdna/TODO              |   2 -
 drivers/accel/amdxdna/aie2_ctx.c        |  14 +-
 drivers/accel/amdxdna/aie2_message.c    |  41 ++---
 drivers/accel/amdxdna/aie2_pci.c        | 219 +++++++++++++++++++-----
 drivers/accel/amdxdna/aie2_pci.h        |  61 +++++--
 drivers/accel/amdxdna/aie2_pm.c         | 108 ++++++++++++
 drivers/accel/amdxdna/aie2_smu.c        |  85 +++++----
 drivers/accel/amdxdna/aie2_solver.c     |  59 ++++++-
 drivers/accel/amdxdna/aie2_solver.h     |   1 +
 drivers/accel/amdxdna/amdxdna_ctx.c     |  53 +++---
 drivers/accel/amdxdna/amdxdna_gem.c     |   2 +-
 drivers/accel/amdxdna/amdxdna_mailbox.c |  56 +++---
 drivers/accel/amdxdna/amdxdna_pci_drv.c |  24 ++-
 drivers/accel/amdxdna/amdxdna_pci_drv.h |  26 ++-
 drivers/accel/amdxdna/npu1_regs.c       |  31 +++-
 drivers/accel/amdxdna/npu2_regs.c       |  17 +-
 drivers/accel/amdxdna/npu4_regs.c       |  34 +++-
 drivers/accel/amdxdna/npu5_regs.c       |  17 +-
 drivers/accel/amdxdna/npu6_regs.c       | 114 ++++++++++++
 include/uapi/drm/amdxdna_accel.h        |  63 ++++++-
 21 files changed, 787 insertions(+), 244 deletions(-)
 create mode 100644 drivers/accel/amdxdna/aie2_pm.c
 create mode 100644 drivers/accel/amdxdna/npu6_regs.c

-- 
2.34.1

