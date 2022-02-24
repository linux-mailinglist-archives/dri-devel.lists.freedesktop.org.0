Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6974C3811
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 22:51:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65B3F10E751;
	Thu, 24 Feb 2022 21:51:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2059.outbound.protection.outlook.com [40.107.95.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A47F10E72A;
 Thu, 24 Feb 2022 21:51:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KGd4v1xA5cAtf4yHlT6yZf1jiKZOwrryHN9W27dWo1P+fQ8q/4gG8qUizvJePf2VA7NEYKDDGooCYsvs5sB2eOHK/nGxTQMS9JHNg+lo6YIXnkhQNtxX9s+ymXsDUYDmwDVwtGlRYcHA8tIIhTqxXmzRDKmxNdUocX/HbvoDHN4J1NknqRfCtNFtgAO1keYb6D2qQqo+nZ0mT02lKXC1ctk7DO1FlhR1cORkUOz5GqnAjhsHOWzXJNrsQljRmdh1DA2K0BYnexiFKU9qxaxZGVQyDQ5z2PcG+qupwXLfCaW6aiz30p+EmsWoclu0KacHMYzn3rkE9tL7GcqnKOa4cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nVPlYNG6piZmMsY8iC7zTDshd96rfyvJ89O18cYprFQ=;
 b=PnEDrF42gu8ss2u+jA8rIhgjhuyyGh0d7LcXBLseVf1Huju61Nb1l1DAJCTiIN4zAswXxpmZrCYi7VmToE+M5KWlW+EkW+7n2Bx5DTVif2Xb6M0SjTE5Spgugws7yUCqcpGN0NG9vlzpKN5F8yPLpk1dUAufSmk+C9hbt8EyPYg4ba2W80gxfhw8/SdW/GPCAtkwN8WXvHiznUL90EpgNTmisSe5jQv9e9w9mOq69a2ej1wt1OLgT8bBdl98wgEN4rHEha2TBouCe6B25/xwEidVnLZSgrAuLsOdSFxdd8CjO6IYxKPOZo4aFjX4KeKfaI0PV7j34y0DeIRek64gEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nVPlYNG6piZmMsY8iC7zTDshd96rfyvJ89O18cYprFQ=;
 b=DPLwvdB+UODrQBHVdNxQq5Ey8bIFnQXBiDWbk9HwSZzusgABqL85Xf2x8uqcqLNYVU8O4luplYMJv9GJxsNcUAGkxgJuDbI2WHqu9haJNrBS2wH00YpE+obfxo87xZSYbSmVlayp7ng9T/mYB2KURgyp7hOeBEsEs4a8Ko8SHUQ=
Received: from MW4PR04CA0179.namprd04.prod.outlook.com (2603:10b6:303:85::34)
 by MN2PR12MB4640.namprd12.prod.outlook.com (2603:10b6:208:38::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Thu, 24 Feb
 2022 21:51:24 +0000
Received: from CO1NAM11FT037.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:85:cafe::78) by MW4PR04CA0179.outlook.office365.com
 (2603:10b6:303:85::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.23 via Frontend
 Transport; Thu, 24 Feb 2022 21:51:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT037.mail.protection.outlook.com (10.13.174.91) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5017.22 via Frontend Transport; Thu, 24 Feb 2022 21:51:23 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 24 Feb
 2022 15:51:21 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Andreas Noever
 <andreas.noever@gmail.com>, Mika Westerberg
 <mika.westerberg@linux.intel.com>, "open list:PCI SUBSYSTEM"
 <linux-pci@vger.kernel.org>, "open list:THUNDERBOLT DRIVER"
 <linux-usb@vger.kernel.org>, "open list:RADEON and AMDGPU DRM DRIVERS"
 <amd-gfx@lists.freedesktop.org>, "open list:DRM DRIVERS"
 <dri-devel@lists.freedesktop.org>, "open list:DRM DRIVER FOR NVIDIA
 GEFORCE/QUADRO GPUS" <nouveau@lists.freedesktop.org>, "open list:X86 PLATFORM
 DRIVERS" <platform-driver-x86@vger.kernel.org>
Subject: [PATCH v5 0/7] Overhaul `is_thunderbolt`
Date: Thu, 24 Feb 2022 15:51:09 -0600
Message-ID: <20220224215116.7138-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 40131935-5b6e-44e3-d439-08d9f7dfcd27
X-MS-TrafficTypeDiagnostic: MN2PR12MB4640:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB4640C3711820F21147800908E23D9@MN2PR12MB4640.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 03bi4AqP/2PRhu4IpWctKwcN2LzStj11TEEVHsSSjgPOmIE/xutWdNKYOHOh8+gko1qVZeaaCXNZdk/a1R2TfubxomZML3ug7E9KmtVO6E054KCNhzUI1EQ3gZwaO8StNFzKg2x11PjSAa+zIRJLlDzRsxSpWpMYZrqb5xONuarQelM4z/sinJ0Mro+q9lDVDQpDPr1RSfX2N+YSS61newRw6cYH5f4TuFRAr0pvVSC50TRz6TLdKZE/aIUiFsHp8Oiz5A+9ce93XCgiakMECq0kxX8lOkztgl2jnz+ct8rx1cP0v8Rc3FCuWT44Wg6vp0PqN2vpcVbdfVAD6Vn7PbXve1BDob0zQxTyETIrozzcBsuftek/gMpPgQjGVW9Wteh3G0yFFgnXWyKYCJMA0CzGHGB9eCYW1wb+UQx6trwZ/xucm0dB4PrlBK3lWjdphD06O4Bt+fnHZDT7zTM1qMigfDM50M3WR9/MRKQ5MjMdcJhkwsf6+NJOxQyJwaewSgu9vD+yoLkMgtyB63AXTIKUqbpRpvbb9v7u885Jfpnrj2eoY7ATuFh/M0IdF91R0dCnT0JN95bl8Mrhtil8q4l+DJu3vxZ3mAs1yzBk3yD7bu8nHbNAKjUDzww68QF4+dxWL/eqVBBIuRRW4bs8xUjms3VJQuhI8wN9YXzUOVPn+LdlmU9X4WkAidqf3NIguFBujHt1Q00M9/p/Q9nNNr2+7bOqRUYxelea6T4Zquc=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(82310400004)(8936002)(86362001)(70586007)(7416002)(81166007)(2906002)(70206006)(508600001)(356005)(44832011)(40460700003)(36860700001)(4326008)(316002)(110136005)(5660300002)(54906003)(83380400001)(8676002)(47076005)(6666004)(7696005)(26005)(1076003)(2616005)(426003)(336012)(16526019)(36756003)(186003)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 21:51:23.9468 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40131935-5b6e-44e3-d439-08d9f7dfcd27
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT037.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4640
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
Cc: Michael Jamet <michael.jamet@intel.com>,
 Yehezkel Bernat <YehezkelShB@gmail.com>, Alexander.Deucher@amd.com,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Various drivers in the kernel use `is_thunderbolt` or
`pci_is_thunderbolt_attached` to designate behaving differently
from a device that is internally in the machine. This currently works
by an attribute in PCI core "is_thunderbolt" which makes those drivers
only apply differences when Intel Thunderbolt controllers are encountered.

In each of these drivers' cases the code should apply whether it's another
vendor's USB4 controller or an Intel USB4/TBT3 controller.

As such, overhaul the use of "is_thunderbolt" in the PCI core to instead rally
around the device core "external" attribute. This means dropping the extra PCI
core attribute and the extra function designation to indicate thunderbolt attached.

Changes from v4->v5:
- Drop USB4 related patches.  Thoes may come at a later time if they're proven to be needed.
  At least in the integrated case vendors should be setting the _DSD to indicate the port is
  externally facing.
  For the discrete case we may bring it back later.

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


Mario Limonciello (7):
  PCI: Move `is_thunderbolt` check for lack of command completed to a
    quirk
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
 drivers/pci/pci.c                       | 17 +++--
 drivers/pci/probe.c                     |  2 +-
 drivers/pci/quirks.c                    | 84 +++++++++++++++++++++++++
 drivers/platform/x86/apple-gmux.c       |  2 +-
 include/linux/pci.h                     | 25 +-------
 11 files changed, 108 insertions(+), 42 deletions(-)

-- 
2.34.1

