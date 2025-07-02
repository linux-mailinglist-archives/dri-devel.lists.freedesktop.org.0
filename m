Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 444EBAF5E2A
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 18:12:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF0A410E73C;
	Wed,  2 Jul 2025 16:12:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="tUZEuf2Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2043.outbound.protection.outlook.com [40.107.93.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58AC310E736;
 Wed,  2 Jul 2025 16:12:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WvazkHot/flBL5pnQEViDpVDlNAIllCW6kOdhkwuVdOgimkIZMNXXYSwVbd9jZzjxV8BgOzNoQJRRpis1gEsn+6XBzWYgT8qPF0AM9pgDOIVIMr6xq9R3lkyMSjJfwqX1/xy3smg7a+M/W7OPJT7FU+OkciMjxhgEyPHQMQB0DHSsqVErzKfI5knw04TLDhNtic7bvqNMaFc3q2H4z0ZSrBaZKjSL7mRkGbRpiiq8CpykAtdMiESuxfHHAHsgu39lQVSkHVa04k0BIKKlBUEGG+OPL9bxLb1N7R11+mMzsUjvZwiL8qdG9LwZkr6oW+nw6ov0MSGq4cFvVFnkibpQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CivhHbol/VKMBkmNWb+PbKIExEsue8oBu4ofQ6dMhTA=;
 b=pOre6VGeFXgEpkBADjzWYcth+0XEMSJGBhd5K3u3ODaEJiSk4S5zeEgOGXKliCHSALAgmFNcWRQ/0DNLbzOEMrtlnZ4ux7cIgVK+pLzYw5g4XYh3CW+P30dNBgPIrZrCEbejESoU235nmaN2Q8WZZhG3v9F88oh/F6cQk1XIKIx+/rZn9SdTtMBT5LDtjjEcxvpljhNiUPjG3LWK41svmLvpQhLS5VzEidbsI47fnUbdKdf74rXJcUzF827xcEKN9JrmTwjz+oncbuA2HmO5tU3mAJg0PGgT+ZSbnKova9wuBMQ/Sku4DSomDQJlKrAK7qVedKF9ct/qHJmqyKTe3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CivhHbol/VKMBkmNWb+PbKIExEsue8oBu4ofQ6dMhTA=;
 b=tUZEuf2YdFfY7+cNBZGrX1GC0JTZiUbm1TIqzWv5lyGUrMNjedm52uxq50U2BOmTXI5q7TEMC6OSCXw95l+297VTwpBhlBgRsaPgWw23gO6i1AMORBOTq/GZSPSpabR6Q8qV7HTDiEtjmOPIFtHGKj/BgF7rm0mXuwUaURjECEY=
Received: from PH8PR07CA0041.namprd07.prod.outlook.com (2603:10b6:510:2cf::29)
 by MW4PR12MB7031.namprd12.prod.outlook.com (2603:10b6:303:1ef::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Wed, 2 Jul
 2025 16:12:28 +0000
Received: from CY4PEPF0000FCC1.namprd03.prod.outlook.com
 (2603:10b6:510:2cf:cafe::29) by PH8PR07CA0041.outlook.office365.com
 (2603:10b6:510:2cf::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.21 via Frontend Transport; Wed,
 2 Jul 2025 16:12:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCC1.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Wed, 2 Jul 2025 16:12:28 +0000
Received: from FRAPPELLOUX01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Jul
 2025 11:12:25 -0500
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: 
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Arunpravin Paneer Selvam
 <Arunpravin.PaneerSelvam@amd.com>, David Airlie <airlied@gmail.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Matthew Auld
 <matthew.auld@intel.com>, Maxime Ripard <mripard@kernel.org>, Simona Vetter
 <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 0/3] drm_buddy regresion fix and minor improvements
Date: Wed, 2 Jul 2025 18:12:01 +0200
Message-ID: <20250702161208.25188-1-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC1:EE_|MW4PR12MB7031:EE_
X-MS-Office365-Filtering-Correlation-Id: 9899d6c1-b354-4d1d-be4f-08ddb9833d96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qLNWRJcM4/iqQuJx3RidcnEeU5oGKaQZo7wFVIdRvCK1bDrYJ+/vUO6WSQX+?=
 =?us-ascii?Q?E5G0klZ/TqsNJnUZsZM+JvKbbn/LX4kkqoYfwQVLe7f2dEZUxAeXWsMcu01s?=
 =?us-ascii?Q?pu3kSZlQCz82P/LG46rPyBfbHbf5pmmA0neBBk8l60tiM+iiJNoshbRQqp4x?=
 =?us-ascii?Q?pNgSRicKWPdjwJsSvFebHaxYJi2Rj7KZ5DpNgefRBcm0nGUhC+ZcvYrRI/4i?=
 =?us-ascii?Q?DtaLKvmjTUMMgoYd6bv6ck+OLZPABGVEiN9BQyNL5VbraYGp7SfaKTSlU0Ln?=
 =?us-ascii?Q?JuEigJnl2KOwgQ6gxN65bx/JAWVJAHEt/vGxMHsRx8kJdVpoMQAd6SjkcFc3?=
 =?us-ascii?Q?tpuQHj1+XBkFBe8n59jXaRz3ZWKy/FyS77YU264rvvGr4YhxhcLX72zgSe5T?=
 =?us-ascii?Q?WfFZhD/ONQ3mkAL2mM1kRSPKsYKe8tqr3BR3WVgLtMm7U3c2IjQ3XotYghIt?=
 =?us-ascii?Q?QGVXvDnwy3qh3tc3IcQeUEeQ5BDrwW0LomNVLuC+mQCthOgsGIYY0TIFoDnb?=
 =?us-ascii?Q?4FQEfwJAk13U+VjDYv9TvEf4s9Srzy2CgXPSxwo90sP1CbymhXULCxQ8BMBs?=
 =?us-ascii?Q?vEGkWqtNflJbRd/aEZLSEqXQxLkBszNDmBJQ8KEO3FkQtthJPZSLEJsisQAz?=
 =?us-ascii?Q?oYozMD4IP4suwztx7EhgdMKi/lfAILy+j8bQOa2PKSjE77d0EKfKy/CAh6e4?=
 =?us-ascii?Q?3ak3QRzZ+uC8uQhwBSiddGqleSz9ZKBzv2b+fvTnjzwUZEePVCQa4CXIF1Oh?=
 =?us-ascii?Q?SLRKTaEP1KGGzNaLEPeEOrrZE1SOZxasKIBS1gXxkSVzr3nVq7Xlmc4Ije3b?=
 =?us-ascii?Q?2yHn6iz3m0S9Uf+F40j6xvBNLpY/Rm8XdLKyRm8a0yoYdzqtuf8FQS1V+I0p?=
 =?us-ascii?Q?ZISDH9/t4373lukonJNIfLzfKlKy1osxKvrwkuOp9iAMWwSs1YluRUK66SLf?=
 =?us-ascii?Q?qjGFWSB+LpkkQpq75gfHR+tHCaigeA45fNMO2mciEZJ6cb2dtGIWJie/41MN?=
 =?us-ascii?Q?zvsM+nRA1uC/1Rd+AkuUwijPOo2rG1sqva8pHLkXzdGKxnnTSozlUZJjnrYz?=
 =?us-ascii?Q?c85NEUdyN1JCvG43ZrRIEWhvD9XIQ0dkPT9Goysdg01k5nRVJ3ByefOAulEz?=
 =?us-ascii?Q?kOtR66c3dHcqnuDQWIdaodPZ1Q8RcXWRJRov4+r2RcBs5xoOFdL+p96X949R?=
 =?us-ascii?Q?njTPvc1jjJ1biTik7zuOZVhNlNSaVXNI5f2Ty+oftxkKNybD1+q056/chaj+?=
 =?us-ascii?Q?D34Vkhi6Ccn9HM0XP0uaMC8btAUaX7b/jsRmPsRXDNHMUV4KyhYEcfhM8h1p?=
 =?us-ascii?Q?jlt3tonGaRVJbBZDNh2OTNkA/ayLmkkW0NhgY9GqeZNKJs4RXj0k8d0F6lmn?=
 =?us-ascii?Q?SkGjPcjpU79ExZQ05rmDIw9JoyAX3fDvMwKswdZluc3hx61ev1V4eBIBdHBQ?=
 =?us-ascii?Q?1iL+bmgbZ/mYFhLgKl880kakOrrtVkEXN2oDiPmljx1wfXR4vtMcoQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 16:12:28.0718 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9899d6c1-b354-4d1d-be4f-08ddb9833d96
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7031
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

Hi,

The first patch fixes a performance issue caused by a change in
drm_buddy ("drm/buddy: Implement tracking clear page feature").
It may be related to https://gitlab.freedesktop.org/drm/amd/-/issues/4260.

The other 2 patches are improvements based on my limited understanding
of the code and that seem to work as expected.


Pierre-Eric Pelloux-Prayer (3):
  drm/buddy: add a flag to disable trimming of non cleared blocks
  drm/buddy: use DRM_BUDDY_CLEAR_ALLOCATION as a hint, not a hard req
  drm/buddy: dont go over the higher orders multiple times

 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 10 ++-
 drivers/gpu/drm/drm_buddy.c                  | 61 ++++++++++------
 drivers/gpu/drm/tests/drm_buddy_test.c       | 75 +++-----------------
 include/drm/drm_buddy.h                      |  3 +-
 4 files changed, 57 insertions(+), 92 deletions(-)

-- 
2.43.0

