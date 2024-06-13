Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1700B907937
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 19:01:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8668510EB44;
	Thu, 13 Jun 2024 17:01:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="C2f5OIvx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2075.outbound.protection.outlook.com [40.107.223.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FF3F10EB30;
 Thu, 13 Jun 2024 17:01:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gKwg7gRo9CRe971QV+fXnX7Sh7tYrb03jAE0RGZ9M5i2NnmYemmT1IwRsagT2eEDsFXa4g8FhohucPDkDhEb2QYXq1AnXLcOfXnaoaj4CEDG1czDLi1Aji9GOMd8WSx+gaGhJM8pCh/7dMCAPJNUiMvdkm2gRnXupKt0I9wAv9IrMloD9XYQ0iqt15s03v6Av2hoofByvlEKpW3JtyAQrhtkoVm/8/fFEtVm2lowCE6lYcKSKKu8KCtG5UNGrzH0Yvl4+QWYXYc31rw5VM8a/5EpyhKaqRG+Ww+qIfKXbr/Jda/ywvKXY0HZX1x4G+/Vdk+gZhUqJ/6WNy6+PwMAbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R2Y3qxzthUuLY2wmiqsY/7JAhMTjGQqat/NV/tj4vlw=;
 b=UItRVLfrt2ZT1Yq/UIq74yROnHcb7gxqoDzTQEB+ntThVY3Ds4ehqb23BT2Rayfz1kEj/lnVhnHbP7jgix7p5+lvouRzCjE0i073MEibH1sp/LqyvE/fWIuW/IsRfy8ohbwJy0Q1BaLDQQqd/cdBGy3sdalMx8suqfd0zG0mT2uctfrY+orQwL5PqtYHECu9P/OsELX2rrtIM1OBKDi6xk4sYCmBwGjdQ1oGM3YUwJtGfS8rom1idatCbvgu5ufAJfoQ7jp8PUxENUWRjtlJxXx9IOmD7Ck4N5WauD7vBU4tf1PI1Mz6y/FfgHvv/Pte3yN8yGtHGeUMU7rrIoj+ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R2Y3qxzthUuLY2wmiqsY/7JAhMTjGQqat/NV/tj4vlw=;
 b=C2f5OIvxJj9w/l996o8JTgaiY/VRjfHJhbubQPbCgVzHUI3+liZW04w9b0WSI2+mhDDAScqpofCapxWs4uSYyuNRsF+vCoCEGoVYGIOT5Vn+NSUk92YrgQsBKkQi2n5wjogcT5i7YwCz2QrPw+/WIBQVYJtv11DVEVTm6OqtlvLSZTRuLz4hnfZ2KMOHaFqR88UpPSg8cXVxaf9mvutOz7CJrn5eqQesK40PVspyRZxpociVxxwLVVLa39x9AwYfq6oLnIsWT8J55AHNl7eRhx0zwRBdtQYJq2KSi8fMXMIJlAA3bAizcQdkdLY7PEBi1uAnZhnC+GcsXeYJDioWtw==
Received: from SA1P222CA0175.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c4::21)
 by PH7PR12MB8427.namprd12.prod.outlook.com (2603:10b6:510:242::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Thu, 13 Jun
 2024 17:01:35 +0000
Received: from SA2PEPF0000150A.namprd04.prod.outlook.com
 (2603:10b6:806:3c4:cafe::a0) by SA1P222CA0175.outlook.office365.com
 (2603:10b6:806:3c4::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.25 via Frontend
 Transport; Thu, 13 Jun 2024 17:01:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SA2PEPF0000150A.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.15 via Frontend Transport; Thu, 13 Jun 2024 17:01:34 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 13 Jun
 2024 10:01:03 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 13 Jun
 2024 10:01:02 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [RFC] GPU driver with separate "core" and "DRM" modules
Date: Fri, 14 Jun 2024 03:02:09 +1000
Message-ID: <20240613170211.88779-1-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF0000150A:EE_|PH7PR12MB8427:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a3bdedc-073f-4182-8527-08dc8bca7b7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230035|376009|1800799019|82310400021|36860700008; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UoC1Vqgxj2m2POW9j5u/6lPQnXp02vM11fk01gBGpwyIP0Bn9HulGUkTEgg+?=
 =?us-ascii?Q?YT1bNWDhDhmgjNr519o6ivdZTQsbb2XvLxZu0hRCtMnYE7zCWzv2MGw6Tusi?=
 =?us-ascii?Q?2c1N7sI3IR7S5Suzf923qSEFhT4O2VJOgmNlaSbm1VevZAMmbC02Ot8xbLO6?=
 =?us-ascii?Q?RfIV3yzLVyJelKSL7f2fcpuimYsjges/9mt6teZW+ZDJJjo7FmKpRa8BjiYW?=
 =?us-ascii?Q?4vieKjoiENLHOmuJN15rgavENIIRTiTSShc9MvMSMmdLJGbXTWgqAah7zQvC?=
 =?us-ascii?Q?48aAlHoC5Qf3IZq6Mg5pLWFxRNOqZWRMTWFyZWB+q6cfbbhnFg4By74322UA?=
 =?us-ascii?Q?naqM2tpqvJaJef3c1URw7eGxfYl18ObO5FWZuw0redSY5r8bkQ/ljUBYV8bu?=
 =?us-ascii?Q?IT1ZOtRcy6NG2wSGclPOwHHX8VYUraP0MQtWuUjUPp9ZitnfW5ZqEYsK1Fmk?=
 =?us-ascii?Q?v16i9gjVPCuwnB42nYdi4fdX9cPUDGi8CB/4WvfJwGepti7AjkNkjK6+ynFl?=
 =?us-ascii?Q?0of14oyBDsQdTaqvvOniZ8X3ktxe8CkYFyBJK3E4tsXcBytLAAcAImqUOOTR?=
 =?us-ascii?Q?HQrkeFw0aZOmSVidEZSQMRyhrb0aqZaByLnyi87WQf5vVg13tvu6dYxnQgCI?=
 =?us-ascii?Q?IviKhIHUvCn7YislYIKIUq4lNJajeyTDHA0iHnwyf3vRWHsdDlEMlTi3K9uO?=
 =?us-ascii?Q?KIPLWRKdugSYk08lfriDAnCVke97SnplO5rMOwxB7YHfrlem2+pjFkwVoe3a?=
 =?us-ascii?Q?nEWcU8FR/bFPmQxjgL4snni1yt990stJIMMsqvPKiCXEwAfid+IGRcgN34vB?=
 =?us-ascii?Q?OdLNAWJWLw2XPfRbOnwiW1jCgSJAbU05k8uv6K9Bh+rPfJLfbpVTGm0x9ClS?=
 =?us-ascii?Q?N0C3BwsYMGsRibYuZWefxB8gIkQYWl0X94SegjMUCINIPmsmfR5ISS375No1?=
 =?us-ascii?Q?eMA/Cxv+fms500PqbmITVu0kQH7MD9OtQoboisGnJT9NYLyT3UhXy13MhNgD?=
 =?us-ascii?Q?1x9n81wsbiP2kEqCQBNLHtRh/X5yjvQhesqIKk0KkBG0snjdAwqKWMseIYx4?=
 =?us-ascii?Q?/TcTYxXUyNEBgDgtReNpRk7Yo142Dy4Ha770ek9T3npAUbvd5ex/+IqaQADN?=
 =?us-ascii?Q?HpP1GrrHRCq1L+GmRGWHe/qZaA8lApGok12Qi1dzRDgBe+L5/FW32ftee2UO?=
 =?us-ascii?Q?bDYUDXd7pHFJ0EMysA0Htyiq4iRRSTepmjadIJx0mLdxWtK5sbkQ3/aohc71?=
 =?us-ascii?Q?COkg+ajYIq5zi/oUyiQ8K8M+lhK/fyUXOS6FGwXPRIx0CvdRa/JuqwCafeKh?=
 =?us-ascii?Q?wVxCPnkyQDUvpyvgPVFnVazvJsL3cQZqmploN7RdmwwJCIM1MF1x0f7XcyCN?=
 =?us-ascii?Q?OZPZbhL4y6KnOs2uaImYc87iTpihlfyodflb9LUZ8/JUfOsdJA=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230035)(376009)(1800799019)(82310400021)(36860700008); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2024 17:01:34.9149 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a3bdedc-073f-4182-8527-08dc8bca7b7c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF0000150A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8427
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

NVIDIA has been exploring ways to better support the effort for an
upstream kernel mode driver for GPUs that are capable of running GSP-RM
firmware, since the introduction[1] to Nova.

Use cases have been identified for which separating the core GPU
programming out of the full DRM driver stack is a strong requirement
from our key customers.

An upstreamed NVIDIA GPU driver should be able to support current and
emerging customer use cases for vGPU hosts.  NVIDIA's vGPU deployments
to date do not support compute or graphics functionality within the
hypervisor host, and have no dependency on the Linux graphics subsystem,
instead implementing the minimal functionality required to run vGPU
guest VMs.

For security-sensitive environments such as cloud infrastructure, it's
important to continue support for running a minimal footprint vGPU host
driver in a stripped-down / barebones kernel environment.

This can be achieved by supporting both VFIO and DRM drivers as clients
of a core driver, without requiring a full-fledged DRM driver (or the
DRM subsystem itself) to be built into the host kernel.

A core driver would be responsible for booting and communicating with
GSP-RM, enumeration of HW configuration, shared/partitioned resource
management, exception handling, and event dispatch.

The DRM driver would do all the standard things a DRM driver does, and
implement GPU memory management (TTM/HMM), KMS, command submission etc,
as well as providing UAPI for userspace clients.  These features would
be implemented using HW resources allocated from a core driver, rather
than the DRM driver being directly responsible for HW programming.

As Nouveau's KMD is already split (in the logical sense) along similar
lines, we're using it here for the purposes of this RFC to demonstrate
the feasibility of such an architecture, and open it up for discussion.

A link[2] to a tree containing the patches is below.

[1] https://lore.kernel.org/all/3ed356488c9b0ca93845501425d427309f4cf616.camel@redhat.com/
[2] https://gitlab.freedesktop.org/bskeggs/nouveau/-/tree/00.03-module

*** BLURB HERE ***

Ben Skeggs (2):
  drm/nouveau/nvkm: export symbols needed by the drm driver
  drm/nouveau/nvkm: separate out into nvkm.ko

 drivers/gpu/drm/nouveau/Kbuild                      |  4 ++--
 drivers/gpu/drm/nouveau/include/nvkm/core/module.h  |  3 ---
 drivers/gpu/drm/nouveau/nouveau_drm.c               | 10 +---------
 drivers/gpu/drm/nouveau/nvkm/core/driver.c          |  1 +
 drivers/gpu/drm/nouveau/nvkm/core/gpuobj.c          |  2 ++
 drivers/gpu/drm/nouveau/nvkm/core/mm.c              |  4 ++++
 drivers/gpu/drm/nouveau/nvkm/device/acpi.c          |  1 +
 drivers/gpu/drm/nouveau/nvkm/engine/gr/base.c       |  1 +
 drivers/gpu/drm/nouveau/nvkm/module.c               |  8 ++++++--
 drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c     |  1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/bios/pll.c      |  1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/base.c       |  3 +++
 drivers/gpu/drm/nouveau/nvkm/subdev/gpio/base.c     |  3 +++
 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c      |  2 ++
 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/bus.c       |  1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c |  1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/therm/base.c    |  1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/therm/fan.c     |  1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/volt/base.c     |  1 +
 19 files changed, 33 insertions(+), 16 deletions(-)

-- 
2.44.0

