Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7290F4B5EA1
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 01:04:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15B7110E34C;
	Tue, 15 Feb 2022 00:04:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2041.outbound.protection.outlook.com [40.107.93.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 943BC10E346;
 Tue, 15 Feb 2022 00:04:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QzKnIpYVpHTmkG7mAYHg9IhJkx9SpPTyKdezHmkJj33oNkDvLmrq+hRhaN4pLNzEClP9UHbV19T0FQfUk3CI1LurOHbzDNz5OizvvMCUZ7YtZCnqkr7Si1WwEd7EqXrN5pEm66y0EaBY681nLkwU7RE+0Yrms4ilpu6KiriHpFqMARg7hYqOSzabXuV9Qy4AQXCyBASi8iEjYtm9aNlvm4STe73KjTdMxEuIuBKdaMC9BzGIzOzJ2SBx18rsZaZPAkevN7fri/vINt2dWVcPWYp7Ma5EoJKCntn/hJyss6U3v4WfDUocohkXNPTbFiEVa1mvoShI80kQy//YosdP5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0r2CnN15zVFpDkwJ73WqME1OerqdolvIkatytM1wABo=;
 b=HS13m9iZOd+5AFO1RVYiU9b2+FK/lFJX/utd4djlpwGFShnhR00KCtgoA8/KeQwoE1FWRbjtWpTukj+3zDauzajIcHR6OtKMF1EHYj8mNhHW7T83a4eP1GOB0XAfGYuA8IDD685jOD6KJ9l2G31mUs+Krh3nFsCi+w4XPQ4jE+HphA16qwcwybrwgnvYKad1XrItmfKxGlXuZrowvivJdCbS1V/viBGM0Syz8gFceS59MjJjaEkXc4ZAjLJ6IMTl+Q5z3c0cr/TLDeiwBjuED+De5g4plQXzXcWd3qGn5tJEWLZF8/Y4bscAawHfepRr4TxgFZANBCrp3k9dt5j4VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0r2CnN15zVFpDkwJ73WqME1OerqdolvIkatytM1wABo=;
 b=rznaQmaxzuqzcMKJGX5uS2GB1c4q9FuPanTgItUbnwl4PXd9j9l4O3AUR53PjpEpJME32+SG1oC3bVe8RNJUi2EQXnOAk22JEzoYh9TWrHABgpfkCCS4N6PlnttPftpJTDZ31uWYzm5qrs7Q8ySwzS96XZvEU+aCX88fPGWpF08=
Received: from MWHPR12CA0027.namprd12.prod.outlook.com (2603:10b6:301:2::13)
 by DM6PR12MB4402.namprd12.prod.outlook.com (2603:10b6:5:2a5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Tue, 15 Feb
 2022 00:04:13 +0000
Received: from CO1NAM11FT015.eop-nam11.prod.protection.outlook.com
 (2603:10b6:301:2:cafe::14) by MWHPR12CA0027.outlook.office365.com
 (2603:10b6:301:2::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11 via Frontend
 Transport; Tue, 15 Feb 2022 00:04:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT015.mail.protection.outlook.com (10.13.175.130) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Tue, 15 Feb 2022 00:04:13 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Mon, 14 Feb
 2022 18:04:11 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Mika Westerberg
 <mika.westerberg@linux.intel.com>, "open list:PCI SUBSYSTEM"
 <linux-pci@vger.kernel.org>, "open list:THUNDERBOLT DRIVER"
 <linux-usb@vger.kernel.org>, "open list:RADEON and AMDGPU DRM DRIVERS"
 <amd-gfx@lists.freedesktop.org>, "open list:DRM DRIVERS"
 <dri-devel@lists.freedesktop.org>, "open list:DRM DRIVER FOR NVIDIA
 GEFORCE/QUADRO GPUS" <nouveau@lists.freedesktop.org>
Subject: [PATCH v4 00/10] Overhaul `is_thunderbolt`
Date: Mon, 14 Feb 2022 18:01:50 -0600
Message-ID: <20220215000200.242799-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b4adcd3b-fc52-4f00-0f11-08d9f016b313
X-MS-TrafficTypeDiagnostic: DM6PR12MB4402:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB4402CD5AF54F7501EE06B570E2349@DM6PR12MB4402.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XuvFkHc9z2+2Nl7dokC9kjkVycMVwn5fvbECYcTNdAEuoPxZkOlTPZFPoJmIQ0d/K2n6eZCk4mWjvVOelR51FdtZR1u01BEqZsm5r33WpZESayh8BpfI+hB0T/NoMxuY8IrAyn9oIhJdOFxn/mfUWZEIGg6ZkAE3mCy9FarUmI5zPlQZhAPzjyOwP2N1C3oHbR7OpiOFqvxnmeDENT1mg5JJnHsblbjz5R898BKPtyfZ3dqaUS3F6WVSvvRyyYQhLc6R3NG5zWBt/3kUJ5sQwfnBs6jDgmgzj0p/Aicjk1K/2nZrsewvR3A71J0Wt3KwxygfVUaB84V6h7HvKGjfAlZE8xBRB9ov3P1G6j+NPZM9uu9nGpbQK+rqCgg1tgpS8qpvfjwh0xWlIB8bXKphc0mvidImOP6WEg3/miGzS+OifqWcjWugoBZbPMP6I2JwBTo9n9uGZL2nnDVhf3byJZjbj4bv06Uey40+dWlqe77HmYQJVcADWtu9zP2mCyNZxC/dbBduhJW6bsqk1lSMKWEgBQ1vvkq7hyqPnQyacNM8qEtgmCCSuXNkSxpQgMWg1BFMLtYsB+slFPRSKgSggsZLZpEvPrB+m9dP6tDbI9G+dLVOmzzYj5XyQPzSF/0LYvGNJZ8G7PJFw+ZWPNkQznhxn1wYSCSM9ODXW+WBARxFNzBzszU3nomYq42g3THOEOkPHwuRGr/PHRaqWm8tzwde6gDkGitHzceswEKNrSU=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(110136005)(82310400004)(6666004)(316002)(8676002)(70586007)(70206006)(4326008)(47076005)(508600001)(83380400001)(54906003)(44832011)(36756003)(2906002)(5660300002)(2616005)(7416002)(16526019)(26005)(36860700001)(186003)(1076003)(86362001)(356005)(40460700003)(8936002)(81166007)(336012)(426003)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 00:04:13.2390 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b4adcd3b-fc52-4f00-0f11-08d9f016b313
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT015.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4402
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

Changes from v3->v4:
- Add tags from last review where applicable
- Update titles of different patches
- Add more comments and commit messages to various patches to address
  comments raised in review
- Re-order the patch series, moving more contentious patches later
- Drop patch marking NHI removable
- Drop patch changing gmux on it's own, roll into patch to drop
  `is_thunderbolt`
- Modify patch to mark integrated USB4 tunnel PCIe root ports as
  "external" instead of removable.
- Modify patch to mark discrete USB4 tunnel root ports as "external"
  instead of removable.
- Fix bit mask error in discrete USB4 tunnel patch
- Fix USB IF vendor designation location in pci_ids.h

Changes from v2->v3:
- Add various tags for patches that haven't changed from v2->v3
- Add new patches for Mika's suggestions:
  * Moving Apple Thunderbolt D3 declaration into quirks
  * Detect PCIe root port used for PCIe tunneling on integrated
    controllers using `usb4-host-interface`
  * Detect PCIe root port used for PCIe tunneling on discrete
    controllers using the USB4 DVSEC specification

Changes from v1->v2:
- Add Alex's tag to first patch
- Move lack of command completion into a quirk (Lukas)
- Drop `is_thunderbolt` attribute and `pci_is_thunderbolt_attached` and
  use device core removable attribute instead
- Adjust all consumers of old attribute to use removable

Note: this spans USB/DRM/platform-x86/PCI trees.
As a majority of the changes are in PCI, it should probably come through
that tree if possible.

Mario Limonciello (10):
  PCI: Add USB4 class definition
  PCI: Move `is_thunderbolt` check for lack of command completed to a
    quirk
  PCI: Detect root port of internal USB4 controllers
  PCI: Detect PCIe root ports for discrete USB4 controllers
  PCI: Move check for old Apple Thunderbolt controllers into a quirk
  PCI: Drop the `is_thunderbolt` attribute from PCI core
  drm/amd: drop the use of `pci_is_thunderbolt_attached`
  drm/nouveau: drop the use of `pci_is_thunderbolt_attached`
  drm/radeon: drop the use of `pci_is_thunderbolt_attached`
  PCI: drop `pci_is_thunderbolt_attached`

 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c |  2 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c  |  2 +-
 drivers/gpu/drm/nouveau/nouveau_vga.c   |  4 +-
 drivers/gpu/drm/radeon/radeon_device.c  |  4 +-
 drivers/gpu/drm/radeon/radeon_kms.c     |  2 +-
 drivers/pci/hotplug/pciehp_hpc.c        |  6 +-
 drivers/pci/pci-acpi.c                  | 15 ++++-
 drivers/pci/pci.c                       | 17 +++--
 drivers/pci/probe.c                     | 52 ++++++++++++++-
 drivers/pci/quirks.c                    | 84 +++++++++++++++++++++++++
 drivers/platform/x86/apple-gmux.c       |  2 +-
 drivers/thunderbolt/nhi.h               |  2 -
 include/linux/pci.h                     | 25 +-------
 include/linux/pci_ids.h                 |  3 +
 14 files changed, 173 insertions(+), 47 deletions(-)

-- 
2.34.1

