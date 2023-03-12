Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3678F6B65A9
	for <lists+dri-devel@lfdr.de>; Sun, 12 Mar 2023 13:02:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CFD910E10C;
	Sun, 12 Mar 2023 12:02:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7ea9::601])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2F9310E10C;
 Sun, 12 Mar 2023 12:02:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WqJo/vhAdUYUhyS0zEYT68gRnDM0UMfAF6rnSOtvl3QdN+l7Mj5NZvSV5h67eDYADq2wFpPf+ETurHX2tV/eamOuUiiOsAwWsmrY75AzhGUmw5gjRLfsgcsX8xKaStfoLAiwPMOsB+rOoOhlUGsd1kj4Qm8Sw2FX7P3oGxRIaUBV6QH28sg2n8KuyXO7lggWXVikbArG3yt+0nS0coOHK6FfxxuD9KZMZOUuPev5uCGvP5g+2BRqOY6YN62pQ/06ah0s0dPb2Sw8EZrXjYNn831yLhI6EiCX0XHk81M0nVJgr0FKRlSBt3em89xrRaxdhDsoWZz499N7NFRPCa8pKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VjmyypcRxDR0P5LaAKNpKqX/6LGTTRc03kykh31DjR8=;
 b=kQ69Lw+UfSV0ES3Sj5kurwWpYwh2R/GdequeXPEGnPY1CfRk4ld6yo3mMZIoRmkNu6jq2x9Rw5hJPm45oFYKOlmweiwjjmI2IuhmK6qy7NtVGsX9QCW8av3Nn2DtmkiIgocwIu33lVNEqPyiBkkQqz4gyqxaq5pDw0SdkyP+bT4O0T2rQFzO1T/6ZRAru0DVuGXB23FsskYlTQnXCh1QlbeuaQUcqnJKYfJFt1mNvfaCRqXqciwgIqGazcpJFPPsr1uymjpcQ6xDP3tbBxweSWWe/TAXzFf0nX/P8u14tDElSO6M0dby70wfJNP5w5AikaJWSAm4ptLce1l5Sq8few==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VjmyypcRxDR0P5LaAKNpKqX/6LGTTRc03kykh31DjR8=;
 b=o2RJEjz+f6FgQ2MrIdC+S0inOZspupXPwGkKg06RalTHE+i5Svhm75/EqFIMObSJu9U86ffyGHCgVQj9IKZ2gV/0MD4rU57kzlnOjxR8QuzaaQRHJ7tfFNcQ6OcBSugRPG65+r9+pKil+JP5AVS8BJ4f5nVO1BwnIzydV1/G1uo=
Received: from MW4PR03CA0177.namprd03.prod.outlook.com (2603:10b6:303:8d::32)
 by MW4PR12MB7239.namprd12.prod.outlook.com (2603:10b6:303:228::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Sun, 12 Mar
 2023 12:02:20 +0000
Received: from CO1NAM11FT089.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8d:cafe::95) by MW4PR03CA0177.outlook.office365.com
 (2603:10b6:303:8d::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.25 via Frontend
 Transport; Sun, 12 Mar 2023 12:02:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT089.mail.protection.outlook.com (10.13.175.179) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.24 via Frontend Transport; Sun, 12 Mar 2023 12:02:20 +0000
Received: from hr-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Sun, 12 Mar
 2023 07:02:15 -0500
From: Huang Rui <ray.huang@amd.com>
To: Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Oleksandr Tyshchenko
 <oleksandr_tyshchenko@epam.com>, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
 <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
Subject: [RFC PATCH 0/5] Add Xen PVH dom0 support for GPU
Date: Sun, 12 Mar 2023 20:01:52 +0800
Message-ID: <20230312120157.452859-1-ray.huang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT089:EE_|MW4PR12MB7239:EE_
X-MS-Office365-Filtering-Correlation-Id: 23fac0cb-7791-4f2b-179d-08db22f1a221
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HtyjX7Payq7uC5vApjUpNbNBOrhWO+u2KI0rWVaD5Q5VOm5uvnDKLq1gdMNaqwI2+T3zMQHwKuGSUAp5twS3i3URPHLdk5I8UL5iapUv9TA0wggEpVuPnckp0HJX5G2dNDOHDp2OTzzAhyWRZmSRg6kJIYP5eHL7agVwNuqv9/1kepFnsXyGFKHscQJPjpg3qs2sNyJzr/jBebNVgVtAcjdGamZPr2Dua19/f4Gt/2OozqOo6axhQDRi3je9mVQ9Vo5vwmOWcQ9EX1y5jG1fpAXPMTuqZNIS4O59R2F6VzLY/pXDBW8xLlE8EnGC2/0zvXQCXkxcJAfxaWkh6rZa2pHc9GUEEPL4j0VxXFupxhefxhTsCqvV2RCq6t9Z/TqCm3DvF1wXu6apAYxNVTH4eLkScaZ+KIwODX3dAdtPksYI6z1XWfTRyzRCm7r4YzB/w+vWJ3aZm+wFZd+A2N0Njd7rc4CbuVIBS6kYH8aWOql/niiF9zbZv6C51R8rR15WmqLaH86+BzSPA5yQ/4qTpo7e3U8Glb/n9Nkl7hhfNAKYuEc5l2C8cOva6zumtWwX7TkU9CmxX04tJOGRbtws9oSP/H0BhqcqGkKgT31nk6zBviyY0kIEcnEUWwfKoQapsU7SICOIcWvZ8zOS5/+WzGRCD9i+fkqqltC+d8YLjzP2vshNmRfr7SeOzImcltQFYyRZ01SL/zZdrAa4gjCQOCs4PLtUPOQGAIG4SNEjwctrNn9dt6FOhnz7L33NDFdIaZ9OYkSomRFEGSsek6X0uX/f53QwQDWZrYfJdrQCrk0=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(39860400002)(376002)(346002)(136003)(451199018)(46966006)(40470700004)(36840700001)(356005)(86362001)(82310400005)(36756003)(36860700001)(82740400003)(81166007)(40480700001)(40460700003)(4326008)(70586007)(70206006)(8676002)(8936002)(41300700001)(110136005)(54906003)(478600001)(316002)(5660300002)(7416002)(2906002)(336012)(66574015)(426003)(47076005)(2616005)(83380400001)(7696005)(966005)(186003)(16526019)(6666004)(1076003)(26005)(5930299012)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2023 12:02:20.3410 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 23fac0cb-7791-4f2b-179d-08db22f1a221
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT089.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7239
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
Cc: Honglei Huang <honglei1.huang@amd.com>, Stewart
 Hildebrand <Stewart.Hildebrand@amd.com>, Huang Rui <ray.huang@amd.com>,
 Chen Jiqian <Jiqian.Chen@amd.com>, Xenia Ragiadakou <burzalodowa@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>, Julia Zhang <julia.zhang@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

Currently, we are working to add VirtIO GPU and Passthrough GPU support on
Xen. We expected to use HVM on domU and PVH on dom0. The x86 PVH dom0
support needs a few modifications on our APU platform. These functions
requires multiple software components support including kernel, xen, qemu,
mesa, and virglrenderer. Please see the patch series on Xen and QEMU bleow.

Xen: https://lists.xenproject.org/archives/html/xen-devel/2023-03/msg00714.html
QEMU: https://lists.nongnu.org/archive/html/qemu-devel/2023-03/msg03972.html

Kernel part mainly adds the PVH dom0 support:

1) Enable Xen PVH dom0 for AMDGPU

Please check patch 1 to 3, that enable Xen PVH dom0 on amdgpu. Because we
would like to use hardware IOMMU instead of swiotlb for buffer copy, PV
dom0 only supported swiotlb.

There still some workarounds in the kernel need to dig it out like below
https://git.kernel.org/pub/scm/linux/kernel/git/rui/linux.git/commit/?h=upstream-fox-xen&id=9bee65dd3498dfc6aad283d22ff641198b5c91ed

2) Add PCIe Passthrough (GPU) on Xen PVH dom0

Please check patch 4 to 5, this implements acpi_register_gsi_xen_pvh API to
register GSI for guest domU, amd make a new privcmd to handle the GSI from
the IRQ.

Below are the screenshot of these functions, please take a look.

Passthrough GPU: https://drive.google.com/file/d/17onr5gvDK8KM_LniHTSQEI2hGJZlI09L/view?usp=share_link
Venus: https://drive.google.com/file/d/1_lPq6DMwHu1JQv7LUUVRx31dBj0HJYcL/view?usp=share_link
Zink: https://drive.google.com/file/d/1FxLmKu6X7uJOxx1ZzwOm1yA6IL5WMGzd/view?usp=share_link

Repositories
Kernel: https://git.kernel.org/pub/scm/linux/kernel/git/rui/linux.git/log/?h=upstream-fox-xen
Xen: https://gitlab.com/huangrui123/xen/-/commits/upstream-for-xen
QEMU: https://gitlab.com/huangrui123/qemu/-/commits/upstream-for-xen
Mesa: https://gitlab.freedesktop.org/rui/mesa/-/commits/upstream-for-xen
Virglrenderer: https://gitlab.freedesktop.org/rui/virglrenderer/-/commits/upstream-for-xen

We are writting the documentation on xen wiki page, and will update it in
feature version.

Thanks,
Ray

Chen Jiqian (2):
  x86/xen: acpi registers gsi for xen pvh
  xen/privcmd: add IOCTL_PRIVCMD_GSI_FROM_IRQ

Huang Rui (3):
  x86/xen: disable swiotlb for xen pvh
  xen/grants: update initialization order of xen grant table
  drm/amdgpu: set passthrough mode for xen pvh/hvm

 arch/x86/include/asm/apic.h              |  7 ++++
 arch/x86/include/asm/xen/pci.h           |  5 +++
 arch/x86/kernel/acpi/boot.c              |  2 +-
 arch/x86/kernel/pci-dma.c                |  8 ++++-
 arch/x86/pci/xen.c                       | 43 ++++++++++++++++++++++++
 arch/x86/xen/grant-table.c               |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c |  3 +-
 drivers/xen/events/events_base.c         | 39 +++++++++++++++++++++
 drivers/xen/grant-table.c                |  2 +-
 drivers/xen/privcmd.c                    | 20 +++++++++++
 include/uapi/xen/privcmd.h               |  7 ++++
 include/xen/events.h                     |  5 +++
 12 files changed, 138 insertions(+), 5 deletions(-)

-- 
2.25.1

