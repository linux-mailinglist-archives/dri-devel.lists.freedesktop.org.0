Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF449078FF
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 19:00:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7511F10EAFC;
	Thu, 13 Jun 2024 16:59:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="LZF7yGZS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2077.outbound.protection.outlook.com [40.107.95.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0618710EAEE;
 Thu, 13 Jun 2024 16:59:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E9abx6LsHPmliFWsxgQUNtQjbSHqzOoNd8NSFzyJ4G0Ttu/afcwroUvA8BN+QZ6scnsbFWzvkClin/FYvtt0lqj5+XTn1bWAKfSdDjUhhXtvrf/rX0db/LAYKHUGdlM/S0Q70Vb9exJD5gTDH7oV4h+6xmCcby43BlHRwpOV4HD3Bqkz8ThLBZcI2Op2qzvozsnhC8R/Mnk3xT7vpX2lPNIACx/wNrkNmz+Z7q9o4h5jiaXseB9GwJ5K6TlW+z0SdKkG7Ks8ppJkK8ChMRIclAYxwHwt3IvyirZ6EvIonY3KFTBH6TtZfaHyhAdrUCWIkmNp/o7qwM5DLWzct5lA/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qhRRETUsrGILJ8ktSWb7QReVhA4nFPM6G+37w60jLwc=;
 b=oFg3MS1ffKVYAaHOH6eZwAeYG50LfROP+mx0ByA86O41w+8ZX7KsFEKYi0+qKcaKSk0wSazVDOH//Y411HUJRa+2/Cju8AzKBTo3dMzvhFr2lLKSOZ7u+B7CV5ZNvjKi+rLU/pRTZGcDDaOFf3lTQaApXOdAJNgo7LfCS6OvibLZaODwEfH5NZlNCQTwf3+GYD5ifZyxniFaqgTU5lB7f4JZ033tCZ3uIIXkVQuc/C1gVuwd9lJCAY4iDnHwo6ujbsRt+MMfcCPJ501PR7QY22j0mZq+YMTs5uh+0etfpgdK0BaMrkOOnqy6/eJdTtQMIcgJKNEy1flplkq4pqMAvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qhRRETUsrGILJ8ktSWb7QReVhA4nFPM6G+37w60jLwc=;
 b=LZF7yGZSQO2Br7G9q8Q9SbE6CUBqdH4aezXUxqoKkHsWbAQHPtESPkLbtnNGXUYT4ZDePHMey0QwRNcpTuEuZf3fk8/jT71UH52SJZbaKhWLn+MiPyHyhFg7Xu4pjtG29qNvwPe8jCar4wDSKXV/vfQL042mfHJyENFgQAo9GyuQ5HAH1UmoRJRPM7zjQIPJaZXb5pIcl8JzG+xxq29jQJ+uAB3RgwMcrVDrQ+Ik6BpoofV+SL5gDZ/PNDMdySBS0WKaOJn17zzMwnzDTNfzcyj4GJ/EuVgv+gdRnqHaRCSrCWqlt2SJljOqHwTtRo7Ru5Xbs5Wuu+uyWO/g6iFPgg==
Received: from SN7PR04CA0089.namprd04.prod.outlook.com (2603:10b6:806:121::34)
 by SJ2PR12MB8158.namprd12.prod.outlook.com (2603:10b6:a03:4f7::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.20; Thu, 13 Jun
 2024 16:59:50 +0000
Received: from SA2PEPF00003F66.namprd04.prod.outlook.com
 (2603:10b6:806:121:cafe::c2) by SN7PR04CA0089.outlook.office365.com
 (2603:10b6:806:121::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.24 via Frontend
 Transport; Thu, 13 Jun 2024 16:59:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SA2PEPF00003F66.mail.protection.outlook.com (10.167.248.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.15 via Frontend Transport; Thu, 13 Jun 2024 16:59:49 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 13 Jun
 2024 09:59:36 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 13 Jun
 2024 09:59:34 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 00/21] drm/nouveau: insert auxiliary device between nvkm and
 drm
Date: Fri, 14 Jun 2024 02:59:52 +1000
Message-ID: <20240613170046.88687-1-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F66:EE_|SJ2PR12MB8158:EE_
X-MS-Office365-Filtering-Correlation-Id: c3d81e23-3131-4006-4c8f-08dc8bca3cc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230035|376009|1800799019|82310400021|36860700008; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0nOzyh7KkO57DldteSBGKmLljqeSrjT65U8yUwtJln5tLcw3axWtE4ODsmg2?=
 =?us-ascii?Q?vI7n1imaXvYPjkErDZq5u6bZK7Ew6SbJIEYyS4j7UFKH7/ObYWJzrzwb5Byx?=
 =?us-ascii?Q?iYPM5BsebYsIQt+FI5XE6Q3BKnyUtHHnF7Je6MU/Z71TDbKxSQu5bEW8exCb?=
 =?us-ascii?Q?Lq78qWgOsVpbbZlRp9G4ZpRWTwym5GaNLJpV6phEbOg764IZuYDnxuCSE8sR?=
 =?us-ascii?Q?YVRusMVjHwUeP8Cnsavmm3M1JP0YQuaSbNB5XH16hefCSCjbS5DIFqw0Z/PY?=
 =?us-ascii?Q?6pfjvj4skN7oL8J/y4hrZhpz8usDJ7kIskemZV9WY5KjpPgGn+wQeldxI0Ou?=
 =?us-ascii?Q?Zut8cbOSyqSYmGFIh4n4uJDrqwK8Xvmq5z9wluq28abx1LbHxlyoAPrVTKuE?=
 =?us-ascii?Q?2HSUvy/GVmT/892blTf0RFAJUVFG7lvZmh81ced+ifdYZoF92EYpFajFLimv?=
 =?us-ascii?Q?ck4MhRuF0CAtZlpxCRHsMn+z+hmbU6AkH63ZaxiWRlAOtazoWkhFezAO1p5H?=
 =?us-ascii?Q?lJwuUX4APpaM2UO1X7MSs60j8mwL7apZvCT/MPeyFC1PghsllesxUz+UVifM?=
 =?us-ascii?Q?YY5tFrkLs7EwlHqoaNTYYRMmEHanLfJN8ZIKzK6i3+XM1cvDaom4yv8Z9ECu?=
 =?us-ascii?Q?sjHoSOCTPTitSRfkQ6H0m8dD5am4U5YdArV+w4e5//tumry6LXwglUr+O+Sr?=
 =?us-ascii?Q?Fz1A4LhhoRvCl6p/FuDUD2Tl/2skcPj6JC8/eIAzbMfgZ6S22v0L8QgOAW4e?=
 =?us-ascii?Q?fGntYSptyeEDk0dtozUvxedmuJVCaS46qlNHGzxsYNTmvH9Oz7F8fKIzrHvr?=
 =?us-ascii?Q?WD5re2pZspcAh0MhruTbY5f/Hag2stJ0CwKTf22PjBNfzxTjMOf3Oc4liqYn?=
 =?us-ascii?Q?9I63lCBcqWa/21kFZylu3xuLSaqN3cgCLCTamwG1GUoYjer9NNVN1kkjmXhY?=
 =?us-ascii?Q?XreeclBlf7DCPEKaoVozO9hPvRvU2Ub6UnoeSzY72LBpTrkFszjnfemwNK73?=
 =?us-ascii?Q?zuq+fb2sQuxa6KrYVcR6TVINEywg4DhQzDfqEl7yfYM2Yz7Odoi1JVFPcRzw?=
 =?us-ascii?Q?PbPIYW8dUOZYEnaiXAhBRG7lXA+HCiRkevp18NlYprErG2yRfo5eAxJ57BPA?=
 =?us-ascii?Q?KZGH1NXqer5PiIe7YC9nVKgi4NZRFrq5tXFh2t09pB2Plk4PD8jis4uR8MUx?=
 =?us-ascii?Q?fPMmdqlFhgy+Z+Ow9BW22NX0TUQAkq2gpqzQaxRZx6YI2dMAl40aMga4UHT2?=
 =?us-ascii?Q?tF+VpteOqUWlUR3mWCx6ukLaIpVwU0EMdR625LgADazdKyfswkTQHH//M3/V?=
 =?us-ascii?Q?84d0nh67FEPcgf/9ZH5fDA7HKYaiNsYk0+yg6Db7ZG4KVwlYg94L008MMyXg?=
 =?us-ascii?Q?g+wSAB1FsZhOukkklnwZeUkhUGwgHpsuXwl497mdyT3imJaSEw=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230035)(376009)(1800799019)(82310400021)(36860700008); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2024 16:59:49.7735 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3d81e23-3131-4006-4c8f-08dc8bca3cc5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003F66.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8158
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

This series was originally part of an RFC demonstrating NVKM and the DRM
driver split into separate kernel modules, but it became apparent whilst
working on this series that there's some benefit to making these changes
regardless of a module split, so I'm sending them out separately.

The bulk of the series moves the remaining bus-specific handling (PCI/
platform driver registation, power management, ACPI, etc) out of the DRM
driver and into NVKM.

As NVKM finishes probe() for a PCI or Tegra device, it will now register
a device on the auxiliary bus, which the DRM driver will probe() against
instead of devices from the PCI and platform buses directly.

The result of this is a cleaner integration of support for Tegra GPUs in
a codebase that originally assumed a PCI device everywhere.  As the DRM
driver mostly just operates on objects allocated from NVKM, support for
Tegra wasn't *too* bad to integrate, but with NVKM handling some pieces,
and the DRM driver handling others, the driver init paths were somewhat
convoluted.

With the bus-level device handling now entirely living within NVKM, the
DRM driver's init paths for PCI and Tegra GPUs has been unified, which
cleans up the remaining messy bits there.

One unanticipated benefit that comes from utilising the auxiliary bus is
that, on Optimus systems, it's no longer necessary to fully reinitialise
the entire GPU (including time-consuming steps such as booting firmware,
or restoring page tables to VRAM) in order to respond to simple queries
of the underlying PCI device (ie. running lspci).

Now, NVKM will only wake the PCI device itself when asked by the kernel,
and because the remainder of GPU (re)initialisation is tied to clients'
object trees, *and* the DRM device is still asleep, no other steps need
to be taken, greatly reducing resume latency.

A link to a tree containing the patches is below.

[1] https://gitlab.freedesktop.org/bskeggs/nouveau/-/tree/00.02-auxdev

Ben Skeggs (21):
  drm/nouveau: fix a couple of KBuild comments
  drm/nouveau/nvkm: delay calling subdev ctor()'s until device oneinit()
  drm/nouveau/nvkm: add nvkm_client_event()
  drm/nouveau/nvif: add nvif_event_stat
  drm/nouveau/nvif: add nvif_driver_func for nvkm->drm callbacks
  drm/nouveau/nvkm: add init()/exit()
  drm/nouveau/nvkm: cleanup in nvkm_device_{pci,tegra}_new() on failure
  drm/nouveau/nvkm: move vgaarb code from drm
  drm/nouveau/nvkm: move switcheroo init from drm
  drm/nouveau/nvif: add runpm supported flag to device impl
  drm/nouveau/nvkm: move switcheroo from drm
  drm/nouveau/nvkm: prepare pci/tegra probe()/remove() functions
  drm/nouveau/nvkm: move pci probe() defer from drm
  drm/nouveau/nvkm: move pci probe() fb handoff from drm
  drm/nouveau/nvkm: move pci probe() enable/disable handling from drm
  drm/nouveau/nvkm: move pci probe() runpm quirk from drm
  drm/nouveau/nvkm: move pci pm ops from drm
  drm/nouveau/nvkm: add device to auxiliary bus for each nvkm_device
  drm/nouveau: wrap pm_runtime_* calls with nouveau_runpm
  drm/nouveau: probe() against nvkm-provided auxiliary devices
  drm/nouveau/nvkm: s/nouveau/nvkm/ over code moved from drm

 drivers/gpu/drm/nouveau/Kbuild                |  11 +-
 drivers/gpu/drm/nouveau/Kconfig               |   1 +
 drivers/gpu/drm/nouveau/dispnv04/crtc.c       |   4 +-
 drivers/gpu/drm/nouveau/dispnv04/disp.h       |   2 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c       |  40 +-
 drivers/gpu/drm/nouveau/dispnv50/head.c       |   2 +-
 .../gpu/drm/nouveau/include/nvif/driverif.h   |  18 +
 drivers/gpu/drm/nouveau/include/nvif/event.h  |   7 +-
 .../drm/nouveau/include/nvkm/core/client.h    |   4 +-
 .../drm/nouveau/include/nvkm/core/device.h    |  12 +
 .../drm/nouveau/include/nvkm/core/module.h    |  10 +
 .../gpu/drm/nouveau/include/nvkm/core/pci.h   |   8 +-
 .../gpu/drm/nouveau/include/nvkm/core/tegra.h |   5 +-
 drivers/gpu/drm/nouveau/nouveau_acpi.c        | 352 ---------------
 drivers/gpu/drm/nouveau/nouveau_acpi.h        |  10 -
 drivers/gpu/drm/nouveau/nouveau_chan.c        |   2 +-
 drivers/gpu/drm/nouveau/nouveau_connector.c   |  16 +-
 drivers/gpu/drm/nouveau/nouveau_connector.h   |   1 +
 drivers/gpu/drm/nouveau/nouveau_debugfs.c     |  24 +-
 drivers/gpu/drm/nouveau/nouveau_display.c     |  19 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c         | 347 ++++-----------
 drivers/gpu/drm/nouveau/nouveau_drv.h         |  24 +-
 drivers/gpu/drm/nouveau/nouveau_fence.c       |   2 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c         |  30 +-
 drivers/gpu/drm/nouveau/nouveau_platform.c    |  91 ----
 drivers/gpu/drm/nouveau/nouveau_runpm.h       |  89 ++++
 drivers/gpu/drm/nouveau/nouveau_svm.c         |   2 +-
 drivers/gpu/drm/nouveau/nouveau_vga.c         |  98 +----
 drivers/gpu/drm/nouveau/nouveau_vga.h         |   3 +-
 drivers/gpu/drm/nouveau/nvif/event.c          |   9 +
 drivers/gpu/drm/nouveau/nvkm/Kbuild           |   3 +
 drivers/gpu/drm/nouveau/nvkm/core/Kbuild      |   2 +-
 drivers/gpu/drm/nouveau/nvkm/core/client.c    |  17 +-
 drivers/gpu/drm/nouveau/nvkm/core/driver.c    |  14 +-
 drivers/gpu/drm/nouveau/nvkm/core/uevent.c    |   2 +-
 drivers/gpu/drm/nouveau/nvkm/device/acpi.c    | 416 +++++++++++++++++-
 drivers/gpu/drm/nouveau/nvkm/device/acpi.h    |  19 +
 drivers/gpu/drm/nouveau/nvkm/device/base.c    | 151 +++++--
 drivers/gpu/drm/nouveau/nvkm/device/pci.c     | 258 +++++++++--
 drivers/gpu/drm/nouveau/nvkm/device/priv.h    |   3 +-
 drivers/gpu/drm/nouveau/nvkm/device/tegra.c   |  87 +++-
 drivers/gpu/drm/nouveau/nvkm/device/user.c    |   2 +
 .../gpu/drm/nouveau/nvkm/engine/disp/uconn.c  |   6 +-
 .../{nouveau_platform.h => nvkm/module.c}     |  45 +-
 .../gpu/drm/nouveau/nvkm/subdev/pci/base.c    |  30 ++
 45 files changed, 1246 insertions(+), 1052 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/include/nvkm/core/module.h
 delete mode 100644 drivers/gpu/drm/nouveau/nouveau_platform.c
 create mode 100644 drivers/gpu/drm/nouveau/nouveau_runpm.h
 rename drivers/gpu/drm/nouveau/{nouveau_platform.h => nvkm/module.c} (60%)

-- 
2.44.0

