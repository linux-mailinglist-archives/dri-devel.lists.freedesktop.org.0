Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 711C84B1873
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 23:43:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21CB710E46B;
	Thu, 10 Feb 2022 22:43:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2060.outbound.protection.outlook.com [40.107.101.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B6BF10E46B;
 Thu, 10 Feb 2022 22:43:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H8tftsAX7RCRig3ds0dRfvi9HSJC2Aofns3z1yoZ7uFEMStGa2tOf4u8bE8odf7f3SICyguK19WPEzAOGFSblz/p0Ray7JO6vY2nzqo/qjmIOKUBGEmt3ZJpLvSYpcVWC4yd+uoj4Mp5SWj7HrtPRKocqNViukFtNVn8ebpF8nFNOIK5v7ECh3Fx4i7wDKleweqtEqzEiFOLrc03qnT73j9ceFFSfm+uoLOQhUxSEXMo5xMkCC2OK9MTxUl0Hnyz1xdhPCxbptJjQI1BzEuH0hCwCvTywa6b9KQ6IFO+FqHSVIRNtDVCcmfdPgS0JkweoTU3aHMnGAg9uoWvIpRZBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VWX3ISDPiM6868FdK5DtMoWIXW71JCwa9cyoal4jc9o=;
 b=S+McCp4EE29Hw3IVGeOX/+bXMFFMDkwkRY3rFtyRWxhcm/SiNN1mZsRrrAJyXYB98JbsbUDWaXscczwaj7OahAZWH4qiP9NgLW4J0QPAegZFjjbjhrLGBXZPvAgxV5l9jEoMLAeVrnF6kyyp3iGtyk8SsVjvrtg38mO2afx90ugwObJKQOM54UFOLoL1ddDqQVCQHC/PA7H4yzyeurXM3/6ENcU84AxnDvtou74rdqFc5Wjh2HH30mOd99KGgtc+jOoNLWMGCK6tMZFneFbEfgIvBg31+Eq362o5JVDU4cFQPlMaoAA1eDW8P6kcRw7NgxAcjJzIOPNzWt/Nuedkbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VWX3ISDPiM6868FdK5DtMoWIXW71JCwa9cyoal4jc9o=;
 b=10rIcBlLM8jOlOOmM/MZyF4wcBJABzRE+tmGUj2pHomR1iONVCODnY83OZLv18JjNdaeH1gaTTLHk5rEya1l78nvINTdKdVzJZMk1yozr91O8tsB4859ncTu4BNvURTTnCGYt+Fp5WVPw3HmNG+pdr0G3SkygzEM2gI8rSCLgvs=
Received: from BN6PR22CA0043.namprd22.prod.outlook.com (2603:10b6:404:37::29)
 by MN2PR12MB4176.namprd12.prod.outlook.com (2603:10b6:208:1d5::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Thu, 10 Feb
 2022 22:43:42 +0000
Received: from BN8NAM11FT008.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:37:cafe::ad) by BN6PR22CA0043.outlook.office365.com
 (2603:10b6:404:37::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19 via Frontend
 Transport; Thu, 10 Feb 2022 22:43:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT008.mail.protection.outlook.com (10.13.177.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Thu, 10 Feb 2022 22:43:41 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 10 Feb
 2022 16:43:40 -0600
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
Subject: [PATCH v2 0/9] Overhaul is_thunderbolt
Date: Thu, 10 Feb 2022 16:43:20 -0600
Message-ID: <20220210224329.2793-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a5adb2f7-ab27-4e5d-7e5c-08d9ece6c9b5
X-MS-TrafficTypeDiagnostic: MN2PR12MB4176:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB41767150782C86FEB6D9D6B6E22F9@MN2PR12MB4176.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s9dHo5/twKyepoNcyBvLExR11pw3Mg5zWlurUi7CWpuAd+SxJXxJFaRFL6q7r+yR/JXMFJbiZii+9cRT6AXpLgvCFDoej436LJFEdbLQaZiuT7Si2+MlaQj+lexMe9VIkq8UeCFDmxcjEWM3f2YBRHoIyDzFldfmDOoqVA+WNkCmpWgoQ8zgAba06q5bUnOE230WBA3t4i1hjPTZvjEL3kflBlHB07aUZ99cPUd+OB6m7JMyquRqMkMISuyqcb1EYQOzz3PPfQhYEk83gpTkzjtEqp4M2ph0R0Xzxz1ghHoimW8ohOd5sScO10zYQZ3mo+9VYt7ip7fpjbJcY5c8i8AI+sXxxTQlbR93Fp0B1RhWp24JRyCDnqd+4XQPcA1DZ2OHefY+zN4ESO/054hiUHlEwXdlKX4CR3UEdQ0yCgWtqLZou4f83mRA57V7YqXpwtwcz3fH3Q2r0/eRnKF3LdumP6pASmWkv/ZPfQVXzDRwENhpJJsEFIA1DQ8GW77l3htHenlkbe/bafVk6Mubm366HeTGtE9UrkH9E+ViTrjkscaXAcdl8ROa1cvRqCc/L/9XI0ZQq3tFaabIG7ZsqXcI4OH+Ao7llGZDOwa8JuvcHajYXPYM0U0p1wD0OLQbZSXfPOfXtsmPnoRvVT1MxLCYfwa+NyIzYth5LwxCp0jU4yeQFxsnUmP5VAXQxVAvFCssep+mQpDP0qOfbTp4HA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(81166007)(16526019)(110136005)(26005)(186003)(54906003)(8936002)(86362001)(356005)(44832011)(7416002)(5660300002)(82310400004)(4326008)(8676002)(2906002)(316002)(70206006)(70586007)(47076005)(36860700001)(83380400001)(1076003)(2616005)(508600001)(40460700003)(426003)(336012)(6666004)(7696005)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2022 22:43:41.9602 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5adb2f7-ab27-4e5d-7e5c-08d9ece6c9b5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT008.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4176
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
from a device that is internally in the machine. This relies upon checks
for a specific capability only set on Intel controllers.

Non-Intel USB4 designs should also match this designation so that they
can be treated the same regardless of the host they're connected to.

As part of adding the generic USB4 controller code, it was realized that
`is_thunderbolt` and `pcie_is_thunderbolt_attached` have been overloaded.

Instead migrate to using removable attribute from device core.

Changes from v1->v2:
 - Add Alex's tag to first patch
 - Move lack of command completion into a quirk (Lukas)
 - Drop `is_thunderbolt` attribute and `pci_is_thunderbolt_attached` and
   use device core removable attribute instead
 - Adjust all consumers of old attribute to use removable

Mario Limonciello (9):
  thunderbolt: move definition of PCI_CLASS_SERIAL_USB_USB4
  PCI: Move `is_thunderbolt` check for lack of command completed to a
    quirk
  PCI: drop `is_thunderbolt` attribute
  PCI: mark USB4 devices as removable
  drm/amd: drop the use of `pci_is_thunderbolt_attached`
  drm/nouveau: drop the use of `pci_is_thunderbolt_attached`
  drm/radeon: drop the use of `pci_is_thunderbolt_attached`
  platform/x86: amd-gmux: drop the use of `pci_is_thunderbolt_attached`
  PCI: drop `pci_is_thunderbolt_attached`

 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c |  2 +-
 drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c  |  2 +-
 drivers/gpu/drm/nouveau/nouveau_vga.c   |  4 ++--
 drivers/gpu/drm/radeon/radeon_device.c  |  4 ++--
 drivers/gpu/drm/radeon/radeon_kms.c     |  2 +-
 drivers/pci/hotplug/pciehp_hpc.c        |  6 +-----
 drivers/pci/pci.c                       |  2 +-
 drivers/pci/probe.c                     | 21 ++++++++-------------
 drivers/pci/quirks.c                    | 17 +++++++++++++++++
 drivers/platform/x86/apple-gmux.c       |  2 +-
 drivers/thunderbolt/nhi.h               |  2 --
 include/linux/pci.h                     | 25 ++-----------------------
 include/linux/pci_ids.h                 |  1 +
 13 files changed, 38 insertions(+), 52 deletions(-)

-- 
2.34.1

