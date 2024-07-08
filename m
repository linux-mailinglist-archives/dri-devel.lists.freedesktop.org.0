Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DEB92AB75
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2024 23:47:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFF8D10E42D;
	Mon,  8 Jul 2024 21:47:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="HYdPNGuj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2063.outbound.protection.outlook.com [40.107.237.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C5E410E42F
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2024 21:47:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=COXn5FvtDmgoRFVFWPLZpyHgBJrjfYPzswoHIZAL1G2gcB0oUD1PwLjorG/a9aNq1XRJLbPWeZmxhVGKNhgtEsTtdGXam5b761b27/RVmT3zogeqQYaIlZuKHrGMvVXejQqxToTvSQOBrC8TmJNIrZYd0U8yd5smEIAvvdcHoo+nYdZ7CXxMub/8N6xIqP4foL2A2dgcWqHv07l+DmSLc6YpqGoKLGhbzd/60xs5qO2aOqmRyaY1c9060NtbM0edRLFLrnDYq7AKzt9lyTOMWrw86JO/1Pd6WMyrLWW+tz9UCsvSV3BgqDQuJ3Bq01qmv6qH6btlk8/LNN9XhTSLEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OXdiJvLiOfy8bH3v7JnIC7YPid5NxFMs5jccm3ffUSY=;
 b=Phd3UlEXqQXGIIWg5ToE5uxljnFDKtRq5ql246YzXZZzjsYLePnTV3lNppH7zqgRDdEV7o1iOJzc/pjHAYWRJRS+s8KeJ8gl+T9LYVkkIKDBvJMnCMF/1tNxwrkgizXTYVl0Gvl8UHcvvm5yC2b+yKoSOudQ920a1FRu8dflRIPBnSYiITTYTcIpBu5z6/AncPjJMm63VbkspfWKxYEC+6XJX8fAR4wfc2NMj/TRN6mM8t9ixI3bmdNR9ExnAitSiOLdNcTvheJWMkwqqc8TS2Fl5zRd76NMRn31wX2Z+gc8D51Wpjab0DpZvQX3SQ+YMtpFWy/KG4Ipp0EWVqphPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OXdiJvLiOfy8bH3v7JnIC7YPid5NxFMs5jccm3ffUSY=;
 b=HYdPNGujRsQMeYTxa32GojFDIQpitQRoJAWhmrdnJV3mL1a05V3IV932xju/XVcCi12tY2WhGs8xjfJlXuqTpP9pIwk9vZvBlk0hP6sv+GaLAcPlB94ub2O6ZgdJace8tpGk280VhYTArr3nTqbEcxEEFR00fyKnLksT9bxojYE=
Received: from MW4PR04CA0237.namprd04.prod.outlook.com (2603:10b6:303:87::32)
 by PH8PR12MB6820.namprd12.prod.outlook.com (2603:10b6:510:1cb::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.34; Mon, 8 Jul
 2024 21:47:09 +0000
Received: from MWH0EPF000A6734.namprd04.prod.outlook.com
 (2603:10b6:303:87:cafe::1d) by MW4PR04CA0237.outlook.office365.com
 (2603:10b6:303:87::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35 via Frontend
 Transport; Mon, 8 Jul 2024 21:47:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000A6734.mail.protection.outlook.com (10.167.249.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7762.17 via Frontend Transport; Mon, 8 Jul 2024 21:47:08 +0000
Received: from ethanolx7e2ehost.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 8 Jul
 2024 16:47:06 -0500
From: Ashish Kalra <Ashish.Kalra@amd.com>
To: <pstanner@redhat.com>
CC: <airlied@gmail.com>, <bhelgaas@google.com>, <dakr@redhat.com>,
 <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>, <hdegoede@redhat.com>,
 <linux-kernel@vger.kernel.org>, <linux-pci@vger.kernel.org>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <sam@ravnborg.org>, <tzimmermann@suse.de>, <thomas.lendacky@amd.com>,
 <mario.limonciello@amd.com>
Subject: Re: [PATCH v9 10/13] PCI: Give pci_intx() its own devres callback
Date: Mon, 8 Jul 2024 21:46:56 +0000
Message-ID: <20240708214656.4721-1-Ashish.Kalra@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240613115032.29098-11-pstanner@redhat.com>
References: <20240613115032.29098-11-pstanner@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6734:EE_|PH8PR12MB6820:EE_
X-MS-Office365-Filtering-Correlation-Id: b8ed2d98-6cb0-4642-fe59-08dc9f978451
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|7416014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Y83mq33wIyUuuvco3rh/YszKgkEMQoFzIOllQ1IHAOXA3JpdPujc+4afHXiX?=
 =?us-ascii?Q?YQ1KU3VBO7hMUUTPD59onOCJRK96+g0rKm02fujw3eD6OXpVaeoXpqmFBVby?=
 =?us-ascii?Q?gl4B/ar4LqMcmNl+rT5aHZwAnRfI+gYqABFv2f6BVwBd8yxZXjWBDHCPU+/Z?=
 =?us-ascii?Q?vQecLRWURXqBqMNYnxVCcoKzVRTeEx4+Z86sLpu1bIp1z4E2JyQYTzOUDUwT?=
 =?us-ascii?Q?cKGKIFH/sgjn94stM5L56j0g3ZAOVK+dFM3vzLzqbdDMNJhva823XKiWqXUD?=
 =?us-ascii?Q?s+vBiehe0L+5ubUZ3J+uYmdI6srl2Ie034KF4g+k6TsKIhnTTAQ6FMr18YsO?=
 =?us-ascii?Q?brEEROLwxZ3Ip+3mmal59OMsK/V4z+mHcw9vvcAC0qQx3ymT0SAGvFgduXHO?=
 =?us-ascii?Q?iS3se1sIrsiDsFO19uHo1BHLcZ/Z5uwOVsJ/JEkn+WGFw1S18G9t51w513pg?=
 =?us-ascii?Q?MBxuIQFYJ3g45eP+1e3oE7mWU0KRKnZlKSrZefqBPVtgaj32E7XBw5uMPc0H?=
 =?us-ascii?Q?H4DoV/2FTJztdD3ut9VVnKo8SjnqU0/4qBD8d8IhnuLRqvLsju0eDZ975mI4?=
 =?us-ascii?Q?dKA4OceoVvq3StFAbmLipNfVyMxO4zENX+toLEOxjzVfmrR/yopGWyE8kB07?=
 =?us-ascii?Q?IZ5AU8WFXSMkPSSjdpyUeDojahGZKVY3lX9+NmmR7PpwhFWqXY7LsmElQLjP?=
 =?us-ascii?Q?Zzt323jeVEClrCf/9A5nrkuQocGydrZkYSc/qor+HcOkMWDMOjW5jK0poh7u?=
 =?us-ascii?Q?HtbIACBa1Xn6Fh5q7+96AHbskhqKJ+e5b5+B3JrVylL41iFuw0n130u2qhjP?=
 =?us-ascii?Q?W2SYrghLVgV7G/0KwTRjKK56g0OiKpdgrjfzRhTjZcmco0nkRKkCDanPn5u4?=
 =?us-ascii?Q?TvtEwxnPxGG9vSq6y3HsFC1E28A55huRifks+BVgtzLbPniO2JDhJMV7Tyw9?=
 =?us-ascii?Q?b2DHd40uFzRe0y2jd+wsDxTAsHg0Xgt4/3dT3HMPGkO32VrIUYIQDpLs4ZQA?=
 =?us-ascii?Q?3cxfKyqAlYzLsjNhZXMGHpLmCsUK0JKiacnBLsyFFUeV+vuAmjj/L/SzWSB1?=
 =?us-ascii?Q?3gxdnWSmgk8I7hNS151b69FmlDyVqslTtTKMa0o11lI+x4HyspzEDmmoLg6a?=
 =?us-ascii?Q?lpSyz3CylfwbNUxdiXwMRsHUoVoAmmBqtBOmm9lEVad4YaeeBN3wX1CsH61d?=
 =?us-ascii?Q?VWq7ctVcM4okedwQGnch9irTwtrnCje+ndsjtRyOdmbwnCw2+GV5foDFkuhx?=
 =?us-ascii?Q?vA0Q98bIO6QRBrI4yPHh5vouLpR4wlejc/owKkGUfjlAcMVK1cb3UMhqxCcO?=
 =?us-ascii?Q?fSKVntATpdYREamF9T+9ig5iV15Iq6OY8sDRM5yTQPrd0QAJJ+aWDPfRVbfU?=
 =?us-ascii?Q?/Ow0itLn6d2iGcAEXTDUO105jw665IZA3vJSFFY/qwP3kiXiOg2PnNMDsbCr?=
 =?us-ascii?Q?uq4bCPL92IewU3bA8dbzg47yzUxvnL1X?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(7416014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2024 21:47:08.6893 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8ed2d98-6cb0-4642-fe59-08dc9f978451
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A6734.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6820
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

With this patch applied, we are observing unloading and then reloading issues with the AMD Crypto (CCP) driver:

with DEVRES logging enabled, we observe the following logs:

[  218.093588] ccp 0000:a2:00.1: DEVRES REL 00000000c18c52fb 0xffff8d09dc1972c0 devm_kzalloc_release (152 bytes)
[  218.105527] ccp 0000:a2:00.1: DEVRES REL 000000003091fb95 0xffff8d09d3aad000 devm_kzalloc_release (3072 bytes)
[  218.117500] ccp 0000:a2:00.1: DEVRES REL 0000000049e4adfe 0xffff8d09d588f000 pcim_intx_restore (4 bytes)
[  218.129519] ccp 0000:a2:00.1: DEVRES ADD 000000001a2ac6ad 0xffff8cfa867b7cc0 pcim_intx_restore (4 bytes)
[  218.140434] ccp 0000:a2:00.1: DEVRES REL 00000000627ecaf7 0xffff8d09d588f680 pcim_msi_release (16 bytes)
[  218.151665] ccp 0000:a2:00.1: DEVRES REL 0000000058b2252a 0xffff8d09dc199680 msi_device_data_release (80 bytes)
[  218.163625] ccp 0000:a2:00.1: DEVRES REL 00000000435cc85e 0xffff8d09d588ff80 devm_attr_group_remove (8 bytes)
[  218.175224] ccp 0000:a2:00.1: DEVRES REL 00000000cb6fcd9b 0xffff8d09eb583660 pcim_addr_resource_release (40 bytes)
[  218.187319] ccp 0000:a2:00.1: DEVRES REL 00000000d64a8b84 0xffff8d09eb583180 pcim_iomap_release (48 bytes)
[  218.198615] ccp 0000:a2:00.1: DEVRES REL 0000000099ac6b28 0xffff8d09eb5830c0 pcim_addr_resource_release (40 bytes)
[  218.210730] ccp 0000:a2:00.1: DEVRES REL 00000000bdd27f88 0xffff8d09d3ac2700 pcim_release (0 bytes)
[  218.221489] ccp 0000:a2:00.1: DEVRES REL 00000000e763315c 0xffff8d09d3ac2240 devm_kzalloc_release (20 bytes)
[  218.233008] ccp 0000:a2:00.1: DEVRES REL 00000000ae90f983 0xffff8d09dc25a800 devm_kzalloc_release (184 bytes)
[  218.245251] ccp 0000:23:00.1: DEVRES REL 00000000a2ec0085 0xffff8cfa86bee700 fw_name_devm_release (16 bytes)
[  218.256748] ccp 0000:23:00.1: DEVRES REL 0000000021bccd98 0xffff8cfaa528d5c0 devm_pages_release (16 bytes)
[  218.268044] ccp 0000:23:00.1: DEVRES REL 000000003ef7cbc7 0xffff8cfaa1b5ec00 devm_kzalloc_release (104 bytes)
[  218.279631] ccp 0000:23:00.1: DEVRES REL 00000000619322e1 0xffff8cfaa1b5e480 devm_kzalloc_release (152 bytes)
[  218.300438] ccp 0000:23:00.1: DEVRES REL 00000000c261523b 0xffff8cfaad88b000 devm_kzalloc_release (3072 bytes)
[  218.331000] ccp 0000:23:00.1: DEVRES REL 00000000fbd19618 0xffff8cfaa528d140 pcim_intx_restore (4 bytes)
[  218.361330] ccp 0000:23:00.1: DEVRES ADD 0000000057f8e767 0xffff8cfa867b7740 pcim_intx_restore (4 bytes)
[  218.391226] ccp 0000:23:00.1: DEVRES REL 0000000058c9dce1 0xffff8cfaa528d880 pcim_msi_release (16 bytes)
[  218.421340] ccp 0000:23:00.1: DEVRES REL 00000000c8ab08a7 0xffff8cfa9e617300 msi_device_data_release (80 bytes)
[  218.452357] ccp 0000:23:00.1: DEVRES REL 00000000cf5baccb 0xffff8cfaa528d8c0 devm_attr_group_remove (8 bytes)
[  218.483011] ccp 0000:23:00.1: DEVRES REL 00000000b8cbbadd 0xffff8cfa9c596060 pcim_addr_resource_release (40 bytes)
[  218.514343] ccp 0000:23:00.1: DEVRES REL 00000000920f9607 0xffff8cfa9c596c60 pcim_iomap_release (48 bytes)
[  218.544659] ccp 0000:23:00.1: DEVRES REL 00000000d401a708 0xffff8cfa9c596840 pcim_addr_resource_release (40 bytes)
[  218.575774] ccp 0000:23:00.1: DEVRES REL 00000000865d2fa2 0xffff8cfaa528d940 pcim_release (0 bytes)
[  218.605758] ccp 0000:23:00.1: DEVRES REL 00000000f5b79222 0xffff8cfaa528d080 devm_kzalloc_release (20 bytes)
[  218.636260] ccp 0000:23:00.1: DEVRES REL 0000000037ef240a 0xffff8cfa9eeb3f00 devm_kzalloc_release (184 bytes)

and the CCP driver reload issue during driver probe:

[  226.552684] pci 0000:23:00.1: Resources present before probing
[  226.568846] pci 0000:a2:00.1: Resources present before probing

From the above DEVRES logging, it looks like pcim_intx_restore associated resource is being released but then
being re-added during detach/unload, which causes really_probe() to fail at probe time, as dev->devres_head is
not empty due to this added resource:
...
[  218.331000] ccp 0000:23:00.1: DEVRES REL 00000000fbd19618 0xffff8cfaa528d140 pcim_intx_restore (4 bytes)
[  218.361330] ccp 0000:23:00.1: DEVRES ADD 0000000057f8e767 0xffff8cfa867b7740 pcim_intx_restore (4 bytes)
...

Going more deep into this: 

This is the initial pcim_intx_resoure associated resource being added during first (CCP) driver load:

[   40.418933]  pcim_intx+0x3a/0x120
[   40.418936]  pci_intx+0x8b/0xa0
[   40.418939]  __pci_enable_msix_range+0x369/0x530
[   40.418943]  pci_enable_msix_range+0x18/0x20
[   40.418946]  sp_pci_probe+0x106/0x310 [ccp]
[   40.418965] ipmi device interface
[   40.418960]  ? srso_alias_return_thunk+0x5/0xfbef5
[   40.418969]  local_pci_probe+0x4f/0xb0
[   40.418973]  work_for_cpu_fn+0x1e/0x30
[   40.418976]  process_one_work+0x183/0x350
[   40.418980]  worker_thread+0x2df/0x3f0
[   40.418982]  ? __pfx_worker_thread+0x10/0x10
[   40.418985]  kthread+0xd0/0x100
[   40.418987]  ? __pfx_kthread+0x10/0x10
[   40.418990]  ret_from_fork+0x40/0x60
[   40.418993]  ? __pfx_kthread+0x10/0x10
[   40.418996]  ret_from_fork_asm+0x1a/0x30
[   40.419001]  </TASK>
..
..
[   40.419012] ccp 0000:23:00.1: DEVRES ADD 00000000fbd19618 0xffff8cfaa528d140 pcim_intx_restore (4 bytes)

Now, at driver unload: 
devres_release_all() -> remove_nodes() -> release_nodes() ...

remove_nodes() moves normal devres entries to the todo list, as can be seen with the following log:
...
[  218.245241] moving node 00000000fbd19618 0xffff8cfaa528d140 from devres to todo list
...

So, now this pcim_intx_resource associated resource is no longer part of dev->devres_head list and has been
moved to the todo list.

Later, when release_nodes() is invoked, it calls the associated release() callback associated with this devres:
...
[  218.331000] ccp 0000:23:00.1: DEVRES REL 00000000fbd19618 0xffff8cfaa528d140 pcim_intx_restore (4 bytes)
...

The call flow for that is:
pcim_intx_restore() -> pci_intx() -> pcim_intx() ...

Now, pcim_intx() calls get_or_create_intx_devres() which tries to find it's associated devres using devres_find(), but 
that fails to find the devres, as the devres is no longer on dev->devres_head and has been moved to todo list.

Therefore, get_or_create_intx_devres() adds a new devres at driver unload/detach time:
...
[  218.361330] ccp 0000:23:00.1: DEVRES ADD 0000000057f8e767 0xffff8cfa867b7740 pcim_intx_restore (4 bytes)
...

But, then this is an issue as pcim_intx() is supposed to restore the original PCI INTx state on driver detach, but it now
operating on a newly added devres and not the original devres (added at driver probe) which contains the original PCI INTx
state, so it will be restoring an incorrect PCI INTx state ?

Additionally, this newly added devres causes driver reload/probe failure as really_probe() now finds resources present
before probing.

Not sure, if this issue has been observed with other PCI device drivers.

Thanks,
Ashish
