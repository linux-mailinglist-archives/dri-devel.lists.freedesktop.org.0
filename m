Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4AD8FDC7C
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 04:04:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6841110E82B;
	Thu,  6 Jun 2024 02:04:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Mx6cVmTp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2057.outbound.protection.outlook.com [40.107.102.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE2D610E821;
 Thu,  6 Jun 2024 02:04:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dHmjPvNKreYIiPTJM0fE0CisEGKA6C+tQcl6Y483aqpVSImYWnyalizBRFWGPb5HcjHgYmIKtQcNrwwFrorstPJ5YytQG061sbEOvLcR1BlG0DOkXFEboSCbM6zAp2oXeqrr/05DAlbCEl1YhuU+rYSeZwWIiTJafGFnAvIBOp5jdYG/g2Nl1IRuKXwaz78i6I1AXalx03zjLjeeAQcmFmoQIVEufNJnJoZi1IYgI5HRadbB1t4o10Ng7IP4aptzhLjDcZ+U9/4dkoRg07Bp2HK+X/BwN5NOl8oTiNWA+rrf5o6RVMkoarR/prRfe9ddPT0E4qwUYy0DTHbgVzdDKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hPmz6MRKkgEuFFAc9WYgoC7G4V2wBtq517xblM30/qw=;
 b=Coipa2ruKO3UsW5iShHnjFmt70RVnLStaISCsAEJLUTCx+L9/3z8dckONS//7xTj86JZFOq9X/k5K2rBrpqoRfZsJH7HgXhEDeF4EsyMgfMMy3Jb6lJMvgZRpHCpxvpV4vpAFkVogfEHnag3+2l0om8WVKNKJEzAZmfxV/6c5apwUE/cr0dj6UACG6kfljAeMMR9FmHgFOrKM8jSidVlv3Mm5XxqvWK438KD43Pqqddr7S+Gtaf+LYsx36up85A3cOFS3AQuDUKob1/SB88Z010S5qOfH+0tXjXaPW2CwRSGJaRy5wPaHE8R0cmJn3IVOIWHCs2GxccSVDS2kEhYZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hPmz6MRKkgEuFFAc9WYgoC7G4V2wBtq517xblM30/qw=;
 b=Mx6cVmTpr+1e3rhzFKr8U3vkKPUnKrKjfnXfTxDHZ2I0cAy83rmUEdPhTM2JZYQBecrCSgiRV4V8djj7VFWnyRnR/e440qhpITb3IavTVI9fJ7ZnPxu6BkvVpxuy6wvutE5l8lZcfdksVB89gzwY+ORftH/FPV7+GYyzkc2bi9o=
Received: from CH0P221CA0011.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11c::28)
 by LV2PR12MB6014.namprd12.prod.outlook.com (2603:10b6:408:170::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.19; Thu, 6 Jun
 2024 02:04:28 +0000
Received: from CH1PEPF0000AD81.namprd04.prod.outlook.com
 (2603:10b6:610:11c:cafe::7e) by CH0P221CA0011.outlook.office365.com
 (2603:10b6:610:11c::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7656.18 via Frontend
 Transport; Thu, 6 Jun 2024 02:04:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD81.mail.protection.outlook.com (10.167.244.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Thu, 6 Jun 2024 02:04:28 +0000
Received: from SITE-L-T34-2.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 5 Jun
 2024 21:04:26 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: <amd-gfx@lists.freedesktop.org>, Simon Ser <contact@emersion.fr>
CC: Harry Wentland <Harry.Wentland@amd.com>, Xaver Hugl
 <xaver.hugl@gmail.com>, <dri-devel@lists.freedesktop.org>, Leo Li
 <sunpeng.li@amd.com>, Sean Paul <seanpaul@google.com>, Mario Limonciello
 <mario.limonciello@amd.com>
Subject: [PATCH v3 0/2] Add support for 'power saving policy' property
Date: Wed, 5 Jun 2024 21:04:02 -0500
Message-ID: <20240606020404.210989-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD81:EE_|LV2PR12MB6014:EE_
X-MS-Office365-Filtering-Correlation-Id: 83c24994-0754-4576-28bf-08dc85ccffab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|376005|82310400017|36860700004|1800799015; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4BncwDHLwLFjV0KFtGEVZ/Xrbz0Igo9/crgJQVhu1/CcOfsHw1nhuoaNDIJ7?=
 =?us-ascii?Q?hPGbj83LAfvy4H4DdrScSiyaMebO/BGDYGxn7na9dQtwPL28h1nJYMVXcfZW?=
 =?us-ascii?Q?+XXGWhHB1LLVhvklAN5EbEZYiNSDHti/A0V7FjeyXLzmCtRmCe01on1+ur7F?=
 =?us-ascii?Q?ecTpGUMa58Ilj1kcO34wM5W0QgKn9oGlLdZ/+roiiK0j7Puvjt0FL33TYD2U?=
 =?us-ascii?Q?iio3QS0/f+tneMdZntU2tsXeoWeJLs8YvJOQ2wb33yl0qLgMGrLAFutm+YUP?=
 =?us-ascii?Q?Q6qi8l3bWYhRWzOWZZuBxJdAgbFtRtKzrRFGIj3dCZ/CUyBj38CUhNv3BG8N?=
 =?us-ascii?Q?TLEXQ1Iiz4qrEJFe7hZpRw9gFydIzTmuHs9Hx01ziBgFYwbt389uFyxcbE1C?=
 =?us-ascii?Q?UlmA6JQJqcoZrtVR2rg3INvYtByBwBk9k1GAb4D1dlMGoFk94YTHGTgCIZAw?=
 =?us-ascii?Q?nfUFrY+g2EKZ93VoIGlge029w+4pyJF6tEbVjXxUzeGMfAqOe0uAYEAaVbTw?=
 =?us-ascii?Q?TRwHYTEZroNh6L+Ygaq7ex+DCFNDqibUvcNMFTyackzxKUyfEujyyLCZ8a6x?=
 =?us-ascii?Q?FdWd9ubvd6fyCFkWGK+aIzANBflfFHMHgBZZRYjXCLNXhDVUvOiUuM9Q3zgT?=
 =?us-ascii?Q?CTZyAM4hZ2NXE8QCD1D4G1Cm2ZEVovVLjlvHy5MbaMFkfJBTl1meSZAuuVH1?=
 =?us-ascii?Q?qukvTzt9TPMhGGK6RljR/AhEviydj43aZLQiVc2M7t+qgkyX2XE1xozU7j6S?=
 =?us-ascii?Q?jLRpCma0idUHm+qUaUrKqrrQi2xtmq0ZDX5jC3sGp9rsh7UbWN7a08Sfl+hH?=
 =?us-ascii?Q?POMJ0k1Xc0JEmOtjwzwW0TBGP22yJ2+BCR+qLM9xrn4R5zVbhkPsVo2Z6WEi?=
 =?us-ascii?Q?It6phhcT6nLgS0hTSzHzLIbmr55iqCN+zqHlxmrY+VHgGvbjy2dc9ahLteo4?=
 =?us-ascii?Q?uclCZvYla0Aw1GWd7lkRQAk/kfbofXU0xyecouw5ylemJlJYAmP63iNSddk+?=
 =?us-ascii?Q?Savr5b4hkSOeC61xksXyrCbCKoDWH/MZM9W71WIkO+W1x8gIw9zDivE28Xvf?=
 =?us-ascii?Q?XqXuuIGZluzE4clkS6Ft7VKhd+DBd/9ryuonEQzxBAHPEw8i+0yTnHg9XSso?=
 =?us-ascii?Q?f9rry72S+8M+WJijSrWNK5GC7w9L/kbZFhD33s6vcX+MrIIikPE8Ei9xRuci?=
 =?us-ascii?Q?Yf1AeAu3hWNrhWPDmmv2Wg45Rh0po7qAlrUai1VWYx9z4qgdFSLnYU/6UUvX?=
 =?us-ascii?Q?e0fTce0VPF5LwXTVNkfGDpHBzMCVaQiNuqT1tY8J5L6Q0GSK/mZbRjFNWc2H?=
 =?us-ascii?Q?wshGK3BGtSRs8DM0xRIk3kkTRyHFWx0RBoaoh/oyTHaY5gcTDc9R7XOA2vWq?=
 =?us-ascii?Q?DQPjsRH41YtU977+19NBZ4F7SnruqF7GkY+EyUqU5/NOzz3TOA=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(376005)(82310400017)(36860700004)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2024 02:04:28.8216 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83c24994-0754-4576-28bf-08dc85ccffab
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD81.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB6014
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

During the Display Next hackfest 2024 one of the topics discussed
was the need for compositor to be able to relay intention to drivers
that color fidelity is preferred over power savings.

To accomplish this a new optional DRM property is being introduced called
"power saving policy".  This property is a bit mask that can be configured
with requests of "Require color accuracy" or "Require low latency"
that can be configured by the compositor.

When a driver advertises support for this property and the compositor
sets it to "Require color accuracy" then the driver will disable any power
saving features that can compromise color fidelity.

In practice the main feature this currently applies to is the
"Adaptive Backlight Modulation" feature within AMD DCN on eDP panels.

When the compositor has marked the property  "Require color accuracy" then
this feature will be disabled and any userspace that tries to turn it on
will get an -EBUSY return code.

Compositors can also request that low latency is critical which in
practice should cause PSR and PSR2 to be disabled.

When the compositor has restored the value back to no requirements then
the previous value that would have been programmed will be restored.

v2->v3:
 * Updates from Leo's comments (see individual patches)

The matching changes for the igt are here:
https://lore.kernel.org/dri-devel/20240522220849.33343-1-mario.limonciello@amd.com/

Mario Limonciello (2):
  drm: Introduce 'power saving policy' drm property
  drm/amd: Add power_saving_policy drm property to eDP connectors

 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   |  4 ++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 50 +++++++++++++++++--
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  2 +
 drivers/gpu/drm/drm_connector.c               | 46 +++++++++++++++++
 include/drm/drm_connector.h                   |  2 +
 include/drm/drm_mode_config.h                 |  5 ++
 include/uapi/drm/drm_mode.h                   |  7 +++
 7 files changed, 111 insertions(+), 5 deletions(-)

-- 
2.43.0

