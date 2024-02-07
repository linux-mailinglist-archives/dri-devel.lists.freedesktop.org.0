Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C23D84D5EF
	for <lists+dri-devel@lfdr.de>; Wed,  7 Feb 2024 23:44:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F1EB10E90C;
	Wed,  7 Feb 2024 22:44:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="lqWxQ76t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2056.outbound.protection.outlook.com [40.107.220.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D348410E90C;
 Wed,  7 Feb 2024 22:44:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M/l80FXh8QG4XiFOioN7rc7iw3JWLlgCISBpQSY2ZCpWxNWEHT7GKV/F62F+KEfjf+U/gJpHGaWRVJWI4syZaf5GMqjIkbU5c9T2SFXjiAXjy22/HeraE9VAol6kJ2UFeJ7YR4cnsbdYzNXS6plBDG/sTfWnOo8pr/iBmNW3PH0oBcBM/ocMjz9CEeP4AAXMbUd2cIwOHSO4j5RzkRBDiGCcrJe4EAUgZt33ohednVqt1KrZEfLizo4YNryje1TB8q4rdxzy49AprvVBiAfo1sqbw9cnwgW8gFVC/dUhZ9+gl9nVHeJ/l/RIZuPdBPK0PWK+g/18OQlA0v01wMkS9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Rk8SpnvubJU1ZxcrWKo+tO2r9uyUMj+yF0yB/O/Eow=;
 b=BQnGEe5kuJkCPjo9l09Kchv4cWDON/oJ2OtAjsvK1TaQvxLUvBRuj75IWt/vqmoHJBNDfumLk7w1IlZYE4ZPwx2HGu+ff2b5sKIoyJFmzM0H7dGzWJDjhX40tGdGrtu2K4eg/ZltUIo1Icve9t/MZohRCDve1OtmY1RC3wAVOWLbcWKvdpfJT4T94PaQqQS80mseM6KvvfcdoDSi4DPqvMU8kF+41gT7R3tlSdH/OD+/wESJ0pDfctSyjLXrm3nsv5UaS7UeYCwKvHJK3bnxJPJCGNw8F4wYeJxVZgigNU94RWIJXQgFEIpWD//aQ9QOHPZl+ojGcoNUjpqfyh4//A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Rk8SpnvubJU1ZxcrWKo+tO2r9uyUMj+yF0yB/O/Eow=;
 b=lqWxQ76ta6hoDzRrEDp6JNkR/n49S5tFzK7C39HDPXC7gl+Ot7iK8Ljkqg5kPE0b7IAE13CLHSS9CQ9eqxqiBxpkWTf5cEopnC5y4SaVfJLRc9Tro0Qdc3ulWPHqqdDduNZtFlBiea36nWmN8kqwH4Qas5ttVtr8+qg1UL9fCWI=
Received: from CY5PR17CA0033.namprd17.prod.outlook.com (2603:10b6:930:12::8)
 by DM6PR12MB4927.namprd12.prod.outlook.com (2603:10b6:5:20a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.16; Wed, 7 Feb
 2024 22:44:41 +0000
Received: from CY4PEPF0000EE32.namprd05.prod.outlook.com
 (2603:10b6:930:12:cafe::16) by CY5PR17CA0033.outlook.office365.com
 (2603:10b6:930:12::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.38 via Frontend
 Transport; Wed, 7 Feb 2024 22:44:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE32.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Wed, 7 Feb 2024 22:44:41 +0000
Received: from AUS-P9-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 7 Feb
 2024 16:44:40 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: <amd-gfx@lists.freedesktop.org>, "open list:DRM DRIVERS"
 <dri-devel@lists.freedesktop.org>
CC: "open list:ACPI" <linux-acpi@vger.kernel.org>, open list
 <linux-kernel@vger.kernel.org>, Melissa Wen <mwen@igalia.com>, "Mario
 Limonciello" <mario.limonciello@amd.com>
Subject: [PATCH v4 0/3] Add drm_get_acpi_edid() helper
Date: Wed, 7 Feb 2024 16:44:26 -0600
Message-ID: <20240207224429.104625-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE32:EE_|DM6PR12MB4927:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b485a42-4545-45cd-977c-08dc282e5f66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kIq6evsDcLqRyvUeZoIPSb2PnNpA0O1taIQG0tZ0fL06kuIZp9PM86HFlGK+jk9pPs+AqFEItp43Vl0XsvpF0AOIJFOEYwPi+5CLzclSLOZ0HCXsHKdu1p6L0O31tgzSDzwxc1tw4DsmfWMwD3V99Wv69juZ5DsAPWo0ZyJso2nrLQ47v1p6vU5vDr6tPcDVi331yLPXHSoUwCD/mVaRhWslshQMGk0Nreu3PhqO/z8Pldb+Y48nGmFHzoANzhvXvzEuRXcr/go05rxR0JGiq3Lf7dKZBCv2lQv6E+ypPar53rVzRi/i9XyN8G3fkYYicBkamAzh1CrGjIlnBAyz5+Z2XlBXpdyl5QQUD2V9pZbKNcAziG7G/s2uPwS/DoBkJgWYeGK8z1/mrFCSs2VSP57MAdaNIdbx8UK9/qdISI3AfTd8Zwj3XSVv/Zc63PMJgFYnAp8J41RI+pUMjARndj6Iwe6eaaPdCnmppiySsmGKlDZal5oFAVjy8C/cyOk1z5VrxSjKK3+fc/4Nvjp8SQ7eL4BXhrQLuiGz1Xn3hV9jtmZzG6ra2HETCv9bRanSdrv40AuP4vt24WpVZl5MdA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(396003)(39860400002)(136003)(376002)(230922051799003)(451199024)(1800799012)(82310400011)(64100799003)(186009)(46966006)(36840700001)(40470700004)(1076003)(426003)(16526019)(336012)(26005)(2616005)(41300700001)(70586007)(44832011)(36756003)(54906003)(478600001)(6666004)(83380400001)(966005)(356005)(110136005)(82740400003)(81166007)(316002)(7696005)(2906002)(4326008)(70206006)(8676002)(86362001)(5660300002)(8936002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2024 22:44:41.2058 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b485a42-4545-45cd-977c-08dc282e5f66
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE32.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4927
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

The drm_get_acpi_edid() helper is for drivers that would prefer
to get the EDID from ACPI instead of from the panel.

Earlier versions of this series were aimed at using this in amdgpu
and nouveau.

This version does NOT update amdgpu as the change will require a
larger overhaul to use struct drm_edid. There will be a follow up
patch to amdgpu after Melissa Wen finishes that effort [2].

https://lore.kernel.org/dri-devel/20240201221119.42564-1-mario.limonciello@amd.com/ [1]
https://lore.kernel.org/amd-gfx/20240126163429.56714-1-mwen@igalia.com/ [2]
Mario Limonciello (3):
  drm: Add drm_get_acpi_edid() helper
  drm/nouveau: Use drm_get_acpi_edid() helper
  drm: Drop unneeded selects in DRM drivers

 drivers/gpu/drm/Kconfig                     |  5 ++
 drivers/gpu/drm/amd/amdgpu/Kconfig          |  7 --
 drivers/gpu/drm/drm_edid.c                  | 77 +++++++++++++++++++++
 drivers/gpu/drm/gma500/Kconfig              |  6 --
 drivers/gpu/drm/i915/Kconfig                |  7 --
 drivers/gpu/drm/nouveau/Kconfig             |  4 --
 drivers/gpu/drm/nouveau/nouveau_acpi.c      | 27 --------
 drivers/gpu/drm/nouveau/nouveau_acpi.h      |  2 -
 drivers/gpu/drm/nouveau/nouveau_connector.c | 20 +++---
 drivers/gpu/drm/radeon/Kconfig              |  7 --
 drivers/gpu/drm/xe/Kconfig                  |  6 --
 include/drm/drm_edid.h                      |  1 +
 12 files changed, 92 insertions(+), 77 deletions(-)

-- 
2.34.1

