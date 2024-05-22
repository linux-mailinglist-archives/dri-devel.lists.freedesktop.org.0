Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBEF8CC8C5
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 00:09:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ED1110E2B0;
	Wed, 22 May 2024 22:09:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="wRmXAQNV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2074.outbound.protection.outlook.com [40.107.223.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80C6610E028;
 Wed, 22 May 2024 22:09:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XqbXKoivBnCPhN7ny9NTG1g7WLaRB1UM+pJO3eqHiU3ON62gVzLQ5LAcsgE6eejXvy6dQ1Dmuk7uAbd/hSPU7aARUimkNP+CvnMh7HUJp2M+zwRj3k1saQQIOZusfmMSyy1okOPHNLp4uB0k4UC3OOmUBKOr9pLvBinP3NpJfANQJFqXIdz3rG56AjnasWhlezOxjUXbNiC1+hh+0oGdcb/aDqH8A8iKqpI+Zv+i+eAtUPiLMDcj5sAiyjpe11nWUdM7G5ITuDQhpers4Anas4d47Z4OkXYZ4BhVgZkhgWeEnQ3VwzqslSXiqQlAo8SEOtwKHZ1AiCc266Vs5JIdFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hJqA5w8+ZxQktXoYo1mGbf7lDowavN8wN0UBCDuGZBk=;
 b=l8amHIoYD6B7AvCoXMP459cfONhAvO1B9kW1aMZ+T5Ts0eBLXRe59L9iJmjJ1McPK/Og44BB697ygq+vpcMMx1pUj7ElENoyEiF7oMLHYhIDIe2PAq3R0GnjSWIbRCO+hu49+11d3QObhuqQ7eb4Ia3rNatA71OvcEzVmPaL3c6DrpgQ/wPk/Mdi6MIXZ314KqOIOmCg3UYUA3T1Xqv0diUMW17kvLwfcx7zi2ZZXp5eXA70KnXXZlCzLzLa+HEDPl/7/SfxLSZxfavhyHwEQ1k+FFmeS1sM5PijUwORmjNEx/kDYROHl+2shuAL7M7egAH59W/QiW8P3Yk7ptX70w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hJqA5w8+ZxQktXoYo1mGbf7lDowavN8wN0UBCDuGZBk=;
 b=wRmXAQNV19H16sqKsHPN8VS9rl1vMK9/mmxK4fgR174FOpEsBo09u4bXggEUQaz3iR/qdOR0ZwmpNMZPrRQBNgMWL3v/3zw/h3s+IdO611rzVlTKb1/6dTXJ73g+7erP5WwnK4rtNoCofkPYztYBIorv63zTINTnjHIxxjYrTlo=
Received: from MN2PR06CA0010.namprd06.prod.outlook.com (2603:10b6:208:23d::15)
 by DS7PR12MB6333.namprd12.prod.outlook.com (2603:10b6:8:96::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Wed, 22 May
 2024 22:09:07 +0000
Received: from BL6PEPF0001AB50.namprd04.prod.outlook.com
 (2603:10b6:208:23d:cafe::55) by MN2PR06CA0010.outlook.office365.com
 (2603:10b6:208:23d::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36 via Frontend
 Transport; Wed, 22 May 2024 22:09:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB50.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Wed, 22 May 2024 22:09:07 +0000
Received: from AUS-P9-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 22 May
 2024 17:09:06 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: <amd-gfx@lists.freedesktop.org>, Simon Ser <contact@emersion.fr>
CC: Harry Wentland <Harry.Wentland@amd.com>, Xaver Hugl
 <xaver.hugl@gmail.com>, <dri-devel@lists.freedesktop.org>, Leo Li
 <sunpeng.li@amd.com>, Sean Paul <seanpaul@google.com>, Mario Limonciello
 <mario.limonciello@amd.com>
Subject: [PATCH v2 0/4] Add support for testing power saving policy DRM
 property
Date: Wed, 22 May 2024 17:08:45 -0500
Message-ID: <20240522220849.33343-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB50:EE_|DS7PR12MB6333:EE_
X-MS-Office365-Filtering-Correlation-Id: 86b36186-046a-44f6-28da-08dc7aabccde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|1800799015|376005|36860700004|82310400017; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rWMkH2KIXWVEvYVcBbz0EuCK9UrnPVVMc51tVauG79x084NHyKetiPaWfWj4?=
 =?us-ascii?Q?LlfArgCo8KMSxdHWZxbNMP4BwamqrPSLFk6SMfi/eZAB+23CLHpJX2T2QhjQ?=
 =?us-ascii?Q?VMqwn+rLZImIB7LXFUmWKYFTiFX0KVhv2umRs4ln6c0DNxyvqRQUIE9WiHY6?=
 =?us-ascii?Q?KnyG/p4hjw4/F+lnotNlCednLslWDJxq1zHYftnrj7UzySIyfWy+yqxU0kJ5?=
 =?us-ascii?Q?f5KEf5zdg49qsI6TtUTEiAZleeex1cMImD1VxSiJq2E7PZDbzTGV3aMa05S8?=
 =?us-ascii?Q?fNyPwjmELiNCrIzznRnGJDtBB0pGyu+c93DZ0zKkl9YAp8C1PAH7j20QhQKe?=
 =?us-ascii?Q?UCa6k8avxAirAhdCv7rM04vxFbTYFSokWODaUVLR1wgHQsunlniwIzKCWITz?=
 =?us-ascii?Q?LbR4vCG+h2G+u0lV6eMVhsz9P1Yu30vSCb9tXJytt2V7wSafto3+HeNvvJLZ?=
 =?us-ascii?Q?0n+zFuNkMy98HdsmNxyi1qyBQZhn9o9sJzhKQPpuWY7zPyLwzbPaGeDMHVKr?=
 =?us-ascii?Q?iFsYoywIhMCuEUMYRUfcl0Xe8hDxF8hZ1zBSFPMgXiJA9UXl+SPY8tu9c3U2?=
 =?us-ascii?Q?hdLZqO89JCzLtF0laS6MXsPPYCocIpk5VJbkf7ppcC/ZY3aJ2kO3pHeS0TJ9?=
 =?us-ascii?Q?Vr8p5Mgu/H2WNdpf5SdI4ty0C+pSWrUfYnKJJxiyBaEKBAJXNstl/fwoJA4Y?=
 =?us-ascii?Q?GZ5d3K86CFiF0LlnA5TG85mvVKUbFyayaB6PvRzc+yGoxHqw5AFygLyKE3q6?=
 =?us-ascii?Q?4L+z5Ryz+gfuPG4hVnve5eTiDMFBkH95hD6cF3G099ffvPD6A98cpBjDZqjp?=
 =?us-ascii?Q?4ejDPWQa4Oe5Mhz9ocT/6DL4OQMsHChNHG6QlRY79uEONqb9xV3Oqc2TrdGd?=
 =?us-ascii?Q?8E+C4Szg/mM6B0jEsVQxjgFVFBQfnZ5bXDGpNAiayucFYWkPzLS0pYZr1chT?=
 =?us-ascii?Q?TKlyujfOqQV50Xk886CbqnC4NTh6LuCT1+y4ct1/EmrjZ4PGyB/6YsNtaxo7?=
 =?us-ascii?Q?6do4jlhlXcLt/4SbDBFsp1TkzJzRc9+5gbhdoOJFyqucS0GjBqMvwcGwUw2V?=
 =?us-ascii?Q?qk2MaFaTR6xydMp/OkUMFIHcr4un5yW2seLW7BCdI4yZ2amKmYI0FmdWXlh/?=
 =?us-ascii?Q?BS8I9P/vXLqOqzUmwXC4V2H7yvrj/yWzs/3CVF5AcJY0VtJQv1Hl0xFNFhvx?=
 =?us-ascii?Q?0l1/eBFzyCbXeQgK7uhFTZyh0pjSdQWzB8sj5vsTtsFh1s7vyO/xOfCRdyVr?=
 =?us-ascii?Q?5AIx9yzhHeQnQDcfMQp0r6FEW5uaylIq1hGSbenFMZaGvpiFjl2IlRZ8cckI?=
 =?us-ascii?Q?fJIvZZ4ZaN1ZC6o7H0hBBwsiBZGSfHplcIUi+tBFJ+Qas9n497avD0VtAAYn?=
 =?us-ascii?Q?dqnqwWRCKXp7xDivhz0dFgLtxAn+?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(36860700004)(82310400017); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 22:09:07.4406 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86b36186-046a-44f6-28da-08dc7aabccde
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB50.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6333
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
that color fidelity or low latency is preferred over power savings.

To accomplish this a new optional DRM property is being introduced called
"power saving policy".  This property is a bit mask that can be configured
by the compositor to for it's requirements.

When a driver advertises support for this property and the compositor
sets requirements then the driver will disable any appplicable power saving
features that can compromise the requirements.

This set of IGT changes introduces a new subtest that will cover the
expected kernel behavior when switching between requirements.

Mario Limonciello (4):
  Add support for API for drivers to set power saving policy
  tests/amdgpu/amd_abm: Make set_abm_level return type int
  tests/amdgpu/amd_abm: Add support for panel_power_saving property
  tests/amdgpu/amd_psr: Add support for `power saving policy` property

 lib/igt_kms.c          | 26 +++++++++++++++
 lib/igt_kms.h          |  6 ++++
 tests/amdgpu/amd_abm.c | 72 ++++++++++++++++++++++++++++++++++------
 tests/amdgpu/amd_psr.c | 74 ++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 168 insertions(+), 10 deletions(-)

-- 
2.43.0

