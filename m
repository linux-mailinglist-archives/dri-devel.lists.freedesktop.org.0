Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B73F4B2D90
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 20:35:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A79E10E1A7;
	Fri, 11 Feb 2022 19:35:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2075.outbound.protection.outlook.com [40.107.237.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1671E10E1A7;
 Fri, 11 Feb 2022 19:35:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X5ZhyrkJF2yW4FvReDvtD0B+wQiyf+ZyCcUJtVSrMxjlD6AJfEvI3xBOYrKVMBN76Sbq+Vm2twx2DjJd579yAi163OX2SSh/+oK5wHHRfqETnS3dVzXx+XNm7UGmj+JJIbLmLddlCWHz9wwXjD8TMQl9OSBNorDWt29bpXe4Sb/o/Sf7/8285X4NMr1+upm+umRUYk21pzwMkm3dAk28wrejTML58PatLci9yZKr3qmaQT5pSnlOQzHey4qSqKBfgTjcPoUu3GDtQXLjYdlGZWbVXg8coaKAbzlqmUZgc0g5F/SOfowxOST/+KYeBePoM7awptFXKw+ibJZ27fS/VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uJ6IrB2ORQe2nxPYRz7qyMCdQUrvEwbuu9iMuxKosSE=;
 b=NfNsft/U9ImOQq1Qp867No9IuJGAseaTkVcEs8g9UQhTUnNV87iQGn/KdDHlUhm40dbBz7T3lT4ak4C07IsUESChlvUX18oyCNCvTykSjtS4TuzU9551mGnJWNoA61BGnGwD4VM5AHb8v2hT1EqNztQLs5JweSDsni2AkdaO4lOwfXc991VQpu/5ttBiuS+a7vBKdzH0A993XcFd8Ap4o/5Cdxmx14EAzeqYyLdo97hsV2Iqkv07jPJlpae8hxav6Ort6vL6Rl+/rnzZBZsJy4L8th/3y9rNK9c4Zqphbf+jrnGT8U20tnqeZTsla/dmYwqNfT4/sqAM6BTO5DOX0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uJ6IrB2ORQe2nxPYRz7qyMCdQUrvEwbuu9iMuxKosSE=;
 b=u7/W9REHEtdLl+zgRD4RutFcT73qIgQP8om+GSB2Z3ciwtkBgE8tyew6GGlNFU9gwEXkwUs+mV+WuzY0meTWSA5ORpZm+fWZzMraTWjn3/PZ3F1xlflZjVqMVUitGo2Kv8x3VbUK8TCvirqyYsC2aQly2cZMBHYNK2mroXGLT80=
Received: from DS7PR03CA0237.namprd03.prod.outlook.com (2603:10b6:5:3ba::32)
 by BN9PR12MB5148.namprd12.prod.outlook.com (2603:10b6:408:119::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Fri, 11 Feb
 2022 19:35:06 +0000
Received: from DM6NAM11FT027.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3ba:cafe::e8) by DS7PR03CA0237.outlook.office365.com
 (2603:10b6:5:3ba::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11 via Frontend
 Transport; Fri, 11 Feb 2022 19:35:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT027.mail.protection.outlook.com (10.13.172.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Fri, 11 Feb 2022 19:35:06 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 11 Feb
 2022 13:35:05 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Mika Westerberg
 <mika.westerberg@linux.intel.com>, "open list:PCI SUBSYSTEM"
 <linux-pci@vger.kernel.org>, "open list:THUNDERBOLT DRIVER"
 <linux-usb@vger.kernel.org>, "open list:RADEON and AMDGPU DRM DRIVERS"
 <amd-gfx@lists.freedesktop.org>, "open list:DRM DRIVERS"
 <dri-devel@lists.freedesktop.org>, "open list:DRM DRIVER FOR NVIDIA
 GEFORCE/QUADRO GPUS" <nouveau@lists.freedesktop.org>
Subject: [PATCH v3 00/12] Overhaul `is_thunderbolt`
Date: Fri, 11 Feb 2022 13:32:38 -0600
Message-ID: <20220211193250.1904843-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 975a67b0-121d-4efc-6eb1-08d9ed959b6e
X-MS-TrafficTypeDiagnostic: BN9PR12MB5148:EE_
X-Microsoft-Antispam-PRVS: <BN9PR12MB5148677497D5619531AB1A3BE2309@BN9PR12MB5148.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Sz9UVeGsqg67N4LX4cS/N4lj9FXNxVQhKDd+8XAw+8dnU/V3h6KaVwwRwdFLQ3zUgzKFU8ip+/HamXn+j3laTfsiCJRkZ6kVLcqc/gRGLUbOsodRqkXvmResqP+l9ABukS8fvxCSEwZGYbHbzJTbiWEV7n6CyLlP654wvImGJxsJtoYiDmCwGjVqqVXUzaQXsNTBvqBm/l8MDuoRXQCH49ycOglDKTiDUqM66gg5h0OAS5fk+heoFMfU469ISr3R7qGkavmtNxF1omL1dWbDvraXDtRxRF45eS6GHPYJmOzvB7lBXqKt78Z14ad5uNOIfYUetkDBpfrhdSw19Kn+wFrzo9MbWyU8mQQwDE1PM8KVR7WBD83UF7t8EPbbc8Qmy186lQTADFAScJboGltZwbdbu8s/662oQ/m3xUoc3OQ1D3Grtsr6G/qXZmK+izPwnLy1qKqtPkibYp21s0b2M6BXz7luW7NuegBUuDYdRoBT4huQIN+LVWH6rWDDjnA5zxY6zlqIGho+7lvupFedSuAZvpU8/TrgY8oW8UptLR3yY4iFWp84WkXQcPZnIt6Ld8rDzu94CIUCfbd25SPwy4KBUKdxK+FkCznSm/5R1EXS7snrjhWwOAqI/hdZUsqcXsx+up9e/FWGS27vZcmOW9t34upJfMScw5WUegHef5AZxhkhlVDktRL5VJ8hujxoG3Q3mCmW5vgLeBYlIdFL77ayijhFSwV1SEVmSiYT/Wk=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(16526019)(186003)(2616005)(5660300002)(26005)(356005)(81166007)(36860700001)(2906002)(6666004)(1076003)(7416002)(36756003)(508600001)(47076005)(426003)(336012)(110136005)(70206006)(4326008)(86362001)(44832011)(40460700003)(316002)(70586007)(8676002)(82310400004)(8936002)(54906003)(83380400001)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 19:35:06.2157 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 975a67b0-121d-4efc-6eb1-08d9ed959b6e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT027.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5148
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
Cc: Hans de Goede <hdegoede@redhat.com>,
 Michael Jamet <michael.jamet@intel.com>,
 Yehezkel Bernat <YehezkelShB@gmail.com>, Alexander.Deucher@amd.com,
 Mario Limonciello <mario.limonciello@amd.com>,
 Andreas Noever <andreas.noever@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Various drivers in the kernel use `is_thunderbolt` or
`pci_is_thunderbolt_attached` to designate behaving differently
from a device that is internally in the machine. This relies upon checks
for a specific capability only set on Intel controllers.

Non-Intel USB4 designs should also match this designation so that they
can be treated the same regardless of the host they're connected to.

As part of adding the generic USB4 controller code, it was realized that
`is_thunderbolt` and `pcie_is_thunderbolt_attached` have been overloaded.

Instead migrate to using removable attribute from device core.

Changes from v2->v3:
- Add various tags for patches that haven't changed from v2->v3
- Add new patches for Mika's suggestions:
  * Moving Apple Thunderbolt D3 declaration into quirks
  * Detect PCIe root port used for PCIe tunneling on integrated controllers
    using `usb4-host-interface`
  * Detect PCIe root port used for PCIe tunneling on discrete controllers
    using the USB4 DVSEC specification

Changes from v1->v2:
 - Add Alex's tag to first patch
 - Move lack of command completion into a quirk (Lukas)
 - Drop `is_thunderbolt` attribute and `pci_is_thunderbolt_attached` and
   use device core removable attribute instead
 - Adjust all consumers of old attribute to use removable

Note: this spans USB/DRM/platform-x86/PCI trees.
As a majority of the changes are in PCI, it should probably come through
that tree if possible.

Mario Limonciello (12):
  thunderbolt: move definition of PCI_CLASS_SERIAL_USB_USB4
  PCI: Move `is_thunderbolt` check for lack of command completed to a
    quirk
  PCI: Move check for old Apple Thunderbolt controllers into a quirk
  PCI: Drop the `is_thunderbolt` attribute from PCI core
  PCI: Detect root port of internal USB4 devices by
    `usb4-host-interface`
  PCI: Explicitly mark USB4 NHI devices as removable
  PCI: Set ports for discrete USB4 controllers appropriately
  drm/amd: drop the use of `pci_is_thunderbolt_attached`
  drm/nouveau: drop the use of `pci_is_thunderbolt_attached`
  drm/radeon: drop the use of `pci_is_thunderbolt_attached`
  platform/x86: amd-gmux: drop the use of `pci_is_thunderbolt_attached`
  PCI: drop `pci_is_thunderbolt_attached`

 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c |  2 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c  |  2 +-
 drivers/gpu/drm/nouveau/nouveau_vga.c   |  4 +-
 drivers/gpu/drm/radeon/radeon_device.c  |  4 +-
 drivers/gpu/drm/radeon/radeon_kms.c     |  2 +-
 drivers/pci/hotplug/pciehp_hpc.c        |  6 +--
 drivers/pci/pci-acpi.c                  | 10 ++++
 drivers/pci/pci.c                       | 12 +++--
 drivers/pci/pci.h                       |  5 ++
 drivers/pci/probe.c                     | 55 ++++++++++++++-----
 drivers/pci/quirks.c                    | 70 +++++++++++++++++++++++++
 drivers/platform/x86/apple-gmux.c       |  2 +-
 drivers/thunderbolt/nhi.h               |  2 -
 include/linux/pci.h                     | 25 +--------
 include/linux/pci_ids.h                 |  3 ++
 15 files changed, 148 insertions(+), 56 deletions(-)

-- 
2.34.1

