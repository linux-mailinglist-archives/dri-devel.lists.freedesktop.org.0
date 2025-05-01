Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B55AA634A
	for <lists+dri-devel@lfdr.de>; Thu,  1 May 2025 20:57:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4356C10E0F9;
	Thu,  1 May 2025 18:57:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="c1j3LG3Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2069.outbound.protection.outlook.com [40.107.243.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F12B210E098;
 Thu,  1 May 2025 18:57:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xqmEEP/KZfHNS2WKcBDEEj64f75TbUi7E0Cd/F/37L3TNHSdnrbhyr0qX9CvkeW+z5POAv4HGEy34LJpbfZJMKKh917IFiO84ckUQ7MAcMn3M1fAVqD7zwqMyAldoTee+OefiJsOnFqWgv+ZQBsrwvEjfzy8E+fLvDSP4kOnidPBTmkR2SfPDsKh1Y/OEM/4iy39wkl3Q8EWhig1gHshNrlSkQXkPtCwsPHxr8XFja8HfmPenuwtJkqwU/gPwLnkVClhtStVUPU1cRhc6nYNQqt+aE8NC6VsxS4KXsTOl5oRjxftjZ0V9hKGPr+q2CFARQEwOhhPdgGWWZG4aC/kow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XiwRAxfBk47h/8WQQ6ysBW8SG1CDORgeU6F8sL51U0c=;
 b=hbsdlC6VYHfoAgZ9NRzdMi7KYax3VPsty/hN8yDw0shW3YTYCpGbkiNrv7XTqUdNgbXKgeL/nJEHLYdX8L/bbiNuAxcK8lU7fBqaAuW5iMPFiVq4/mtVmPvYL5IHBUB7ZfY0zqYPUEN5GgNzqt+/85xPrqE3RIKAl34iVZd2goh+VoJwqt2gibXvz39KnnIksJKJZ005KwHX5b9hCjdEWICG86NKLVACdAWKK3eIJNl6gTbOZRm2Av9FmG69nC1qQ2Fq2cEtN7GnkvEGeIJn6kFGzDesRZ3X0vjLk++nWYWipF490HT+jZizuw5HDLqr0wt+w+V1Vp8W4kw6eZQvAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XiwRAxfBk47h/8WQQ6ysBW8SG1CDORgeU6F8sL51U0c=;
 b=c1j3LG3QEijNBBtxuSnXmF5pj4PTDd2gkiUEjGjSWeIDRtay3CMIxD5s9o9dIhPziT2TNFemZPsnFcwZUmVgmmZQ0pvOpy60dMh5lS0cGsg0t8F3+5ySJIo8TdKqOabh0hs6rCFuvQNqUv/nteLzASWQwPr+du1pU1UUkDLnueQ=
Received: from BY5PR04CA0020.namprd04.prod.outlook.com (2603:10b6:a03:1d0::30)
 by MW4PR12MB7190.namprd12.prod.outlook.com (2603:10b6:303:225::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Thu, 1 May
 2025 18:56:50 +0000
Received: from SJ5PEPF000001D7.namprd05.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::ae) by BY5PR04CA0020.outlook.office365.com
 (2603:10b6:a03:1d0::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.40 via Frontend Transport; Thu,
 1 May 2025 18:56:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001D7.mail.protection.outlook.com (10.167.242.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Thu, 1 May 2025 18:56:49 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 May
 2025 13:56:47 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu drm-fixes-6.15
Date: Thu, 1 May 2025 14:56:34 -0400
Message-ID: <20250501185634.4132187-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D7:EE_|MW4PR12MB7190:EE_
X-MS-Office365-Filtering-Correlation-Id: 04085376-d70d-4492-a711-08dd88e1edd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026|13003099007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?o8GkNcpZQcP2jKA0GfGaA+96q5cub2hRWw2H7vy+5FsC7Idh3L80PjQZyXOg?=
 =?us-ascii?Q?fodpUmy3H0KG1q3DxJ4kWAewN/lJM/rNuC9rZzaI0s9bLmhylf1zt/k9uCgp?=
 =?us-ascii?Q?i+DJTbMHL46OrjcZ2ezXZ0bWhn3vI9jWtVIIb2Yc/E3QhEaPJ3iWU5Y9X4AR?=
 =?us-ascii?Q?/+Aljd0GwYvFbJEaJ8eJYtefbZu4VUvZdXv5oqIlO7kUaTXtWBQygse18Kc0?=
 =?us-ascii?Q?oL7oHyWKX3jxN/H8v8lNqZ447HT4BhmO9N2zymStk0ZXvvyGsd+bBNvzykmd?=
 =?us-ascii?Q?cNg/v1OuUwsy9U9wGsTqNN+lZrIxO8d0l19M9KS/g3mvcK8GA8/cqnWzo+c1?=
 =?us-ascii?Q?E/UmO69BSTbly06dm8JGrfmwD777tLGKHKWBGpwQt+UgEu7aeyWL5GdoGfDJ?=
 =?us-ascii?Q?w2KXUmXfrYquzA0fuUX52ijrKQOyJW2ZRWxHV54b/kv0AdfSyhAS8wPH5g24?=
 =?us-ascii?Q?/0q1ZmJO0bqNGQN0wWTLIg732zKiNs2dBp3Eoe1FrW6UETtthKi1EI/n+/bR?=
 =?us-ascii?Q?aT9zZvRDHC+0c6Q6tPVedVSBpozkSrnMF8tKy3H1t8vpgUb+kI6pzD5JY+2t?=
 =?us-ascii?Q?l86hfp2SOShiSyXAm6PWop7LngrjHyX+yfFABF/0DnkHOTEq+2wn/EYGxCdr?=
 =?us-ascii?Q?D5o+g8l9xdEl57MebkUilWYjn+B85oQvM6tZEXtYbLmSMxqq2W1MBUhg7YKI?=
 =?us-ascii?Q?9w5147uatnpGUkxs70Wp2DUzrgtv8Pu2T4YArlYAEt8MfgI4Dtr45GFE/vMo?=
 =?us-ascii?Q?hPzudmNzH9211SjychXCDU7EY8X4XpDkvAdCTGUH39dq9OlI0rEHCBouMOAL?=
 =?us-ascii?Q?s5X1r0ddi++CCKCYvXgF/3dOEo2zYmSoEIjndvaTUdF7UGDVjkpgdTus3+8z?=
 =?us-ascii?Q?wP66+D8IHCzUqgiH4/i7QvUpYTrKVJy+aK3MF1LnbBr6X/Ef0AfVZt74SHBX?=
 =?us-ascii?Q?tpLtxtSq3JpL6akRmP1V/sZyyksDAlLlCeKxvkxWxaPsWTnXb+SBD7s/xhgJ?=
 =?us-ascii?Q?nuU3RyBanbdgLzbBt1JBZkLIqtq+xM67TTUctCp4C7zPq/sUJ8TOL36ujuJZ?=
 =?us-ascii?Q?MW5qIXzW3PJ4rWuzSylnSNTlp+AWs5aV17y29uC9FIYQ1u3t3PDZgPp1N46w?=
 =?us-ascii?Q?mpZHiXGEkXsb8dv9oFoPYbofUQlFE11qkSwyBrQA4QdrO1EfvAhJ0nSoaWYN?=
 =?us-ascii?Q?v/xcPQt52ywS27oIgY7u4CIsbqWUCLys/nd6LuLs1AHEjnEh/Kf0FSnjSiyZ?=
 =?us-ascii?Q?2YV5EQJKJATK36q95fsuvakz0UfS0VZsbxKR5jirGua9T1bhllOrhtf7Oz4y?=
 =?us-ascii?Q?ygwa8ig7WjCMOzMl/UF1DMfA8B27OlLCqWEjRQCbHmD6OGeLQ3ytq/6nNWpT?=
 =?us-ascii?Q?G5kBJr7upayjZrAj1yZq+Oy9Lpvox9ptH5vtnLOdqGYFHow248YDx92mFaKr?=
 =?us-ascii?Q?koNoTrv0aMbYc5fQIKVe1QvJFwGThgfgK2bFfmNw8VkSzpvqs5r/Lw=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 18:56:49.3681 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 04085376-d70d-4492-a711-08dd88e1edd1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7190
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

Hi Dave, Simona,

Fixes for 6.15.

The following changes since commit b4432656b36e5cc1d50a1f2dc15357543add530e:

  Linux 6.15-rc4 (2025-04-27 15:19:23 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.15-2025-05-01

for you to fetch changes up to 6718b10a5b98ad6629cd6b2004b0628fe68beac0:

  drm/amdgpu: Add DPG pause for VCN v5.0.1 (2025-05-01 11:02:00 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.15-2025-05-01:

amdgpu:
- Fix possible UAF in HDCP
- XGMI dma-buf fix
- NBIO 7.11 fix
- VCN 5.0.1 fix

----------------------------------------------------------------
Chris Bainbridge (1):
      drm/amd/display: Fix slab-use-after-free in hdcp

Felix Kuehling (1):
      drm/amdgpu: Fail DMABUF map of XGMI-accessible memory

Lijo Lazar (1):
      drm/amdgpu: Fix offset for HDP remap in nbio v7.11

Sonny Jiang (1):
      drm/amdgpu: Add DPG pause for VCN v5.0.1

 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c        |  5 ++
 drivers/gpu/drm/amd/amdgpu/nbio_v7_11.c            |  2 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c            | 54 ++++++++++++++++++++++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c | 19 ++++++--
 4 files changed, 76 insertions(+), 4 deletions(-)
