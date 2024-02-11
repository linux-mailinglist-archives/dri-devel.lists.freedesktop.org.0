Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A12DE8509B0
	for <lists+dri-devel@lfdr.de>; Sun, 11 Feb 2024 15:55:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DA5810E8FB;
	Sun, 11 Feb 2024 14:55:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="WRorG8xv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38F1B10E8FB;
 Sun, 11 Feb 2024 14:55:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b/mVyjsiy0W8opZhzpDutzvIUTq5Q20hDGAZSonveSixAGsdVPtBIk703ZsgqMvMKpgH0uE8CucHNppTcmOyJ0XEEKAkN2PGJsPUdbasfXa4V2jhHF4SokLKhR6GQxmrQ6fRnVVet4VUsCDkXKrLkThu8Pve/YmYzMBBYNhzU0IOxO7IrEgJYd9S583zy6kyOHUQIMVLuGxq2qcWHgRvVqCgwQImK3fY8SuTyxypIu03XPGG6hCxhV6LtfyPdZp2dhyoIyRenijHYNTiD8BPSCZjKBELg3/ysnKgAEtb2SlbEHhAY2POb1pinhIk/ktAUpsy8gn7xoa55ygqMtQ2CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KYCgkMIdCjW/msvM1ArOUBr59ZQ7J7LpM9CsGxAJhFY=;
 b=KeB8Xri9vrw4LW01j8/u7iSk8XZRYSzTOJeR/MeIXRsz7bpHIQ8GX9WvKARxVM4joxLwn/341vJKF3lxT/t1uT8+KIwSMRMIr51rmkcT9ZyJGFzrxQuAAcAAfdDIiZnanebuwYUZ4F8JuRxj7Vpm193O8AT7JR8i3K0czpGhqgjil13elYAX8kG7gMRBctKVX2+tXAk45QbfazAtmLbiU6IKygQnhkUCGak1RwqmLwZ62gr53GWgij3ki3hXaD/Tl22z8FK6WzAz/D3QWkxqlBoo9O5vb1cU4jHywARAB5J5oOZ69EqlVpOFB/EThSMVm8UpcnI2uuKuAn7uJbR4xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KYCgkMIdCjW/msvM1ArOUBr59ZQ7J7LpM9CsGxAJhFY=;
 b=WRorG8xvrstjU10mCKdBNPjDe9oMFbKBY6p5mpLv6dOzdjyPdJtKA8fxsqlVrv6c2CZnlTFKtBSTLqM0pT/kIA3jtKjxWvTwIbw+gBHobc5DIT2D+ZU2nG+VdmLmCZmrhMS/xeBjnA5rEg9h6b2HKAzvRFfwN35FKE3JS74vVMM=
Received: from BL1PR13CA0252.namprd13.prod.outlook.com (2603:10b6:208:2ba::17)
 by LV3PR12MB9354.namprd12.prod.outlook.com (2603:10b6:408:211::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.11; Sun, 11 Feb
 2024 14:54:57 +0000
Received: from BL02EPF0001A0FB.namprd03.prod.outlook.com
 (2603:10b6:208:2ba:cafe::39) by BL1PR13CA0252.outlook.office365.com
 (2603:10b6:208:2ba::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.32 via Frontend
 Transport; Sun, 11 Feb 2024 14:54:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A0FB.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Sun, 11 Feb 2024 14:54:57 +0000
Received: from AUS-P9-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Sun, 11 Feb
 2024 08:54:56 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: <amd-gfx@lists.freedesktop.org>, "open list:DRM DRIVERS"
 <dri-devel@lists.freedesktop.org>
CC: "open list:ACPI" <linux-acpi@vger.kernel.org>, open list
 <linux-kernel@vger.kernel.org>, Melissa Wen <mwen@igalia.com>, Mark Pearson
 <mpearson-lenovo@squebb.ca>, Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH v5 0/3] Add support for getting EDID over ACPI to DRM
Date: Sat, 10 Feb 2024 23:50:08 -0600
Message-ID: <20240211055011.3583-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FB:EE_|LV3PR12MB9354:EE_
X-MS-Office365-Filtering-Correlation-Id: abd9fdcb-b39f-4d18-b06b-08dc2b1169fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZawKwSG0y8Ql/P9KP4raWMuRhHV4ssrOvV/FsfYeR93+hWMip8PUNhfEQmfIo3LKHCtYqnunQs/wWSM+8itjCNFCJycAoiQcE3ciG1JAIw3OVObdhhKuhElS+Yn+YGAMUrdWKVd3UyYSiJ0rrkKoQhhyXogj/hLdphXWQBe9CQua6DOkzsCeWV0QobxCLSHy+Etcvc1eZtg5oEFQJqd+PgLpmezp2pGSQQ9PUcXidEXij+SSjBr1RRP2SXeEM1isS73VTvo/AQi07uKFKcAdwo2sG+AJp/zrUqO4ln/nAYrd7wTARoGj/tv0b3mOaWiyGKphmG52S6eaV4dp8baF8UFxyXZgLDYSmV+W+JCnUnUM6qjllNETYgMherQJVCuKNyKnOapN/r4kjn01SQ0DvXsZnqowa3Z5JCqNxWD1VhLP/AFvXmQ+321vdZjjFHpXAEnQwSCkn2W61P/dAMe/CI83pQC9k9iMZeiDJbHhG6zF9GFDpyZz4OH4lRohoTtgWTAN1clAVSRoU0PN93FT+bYgGHen0HNdp1O5PsOtjTERFkKk/wnWp1/ZXXNC8IMTRIDjAyWmk1/sbT2fFw/i1juYcLugDqKXwzeCpkSyCUs=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(376002)(136003)(396003)(39860400002)(230922051799003)(64100799003)(451199024)(1800799012)(82310400011)(186009)(36840700001)(46966006)(40470700004)(41300700001)(356005)(86362001)(82740400003)(5660300002)(4744005)(2906002)(81166007)(44832011)(70206006)(336012)(26005)(36756003)(16526019)(70586007)(426003)(8676002)(478600001)(1076003)(54906003)(110136005)(316002)(4326008)(2616005)(6666004)(8936002)(7696005)(83380400001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2024 14:54:57.1970 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: abd9fdcb-b39f-4d18-b06b-08dc2b1169fd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0FB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9354
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

This series adds the ability to fetch the EDID through ACPI for laptop
panels. Drivers need to opt into the behavior.

In this series it's enabled by default for all eDP or LVDS panels with
AMDGPU and certain panels for Nouveau.

Mario Limonciello (3):
  drm: Add support to get EDID from ACPI
  drm/amd: Fetch the EDID from _DDC if available for eDP
  drm/nouveau: Use drm_edid_read_acpi() helper

 drivers/gpu/drm/Kconfig                       |   7 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |   1 +
 .../gpu/drm/amd/amdgpu/amdgpu_connectors.c    |   3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |   8 ++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   2 +
 .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c |   2 +
 drivers/gpu/drm/drm_edid.c                    | 113 ++++++++++++++++--
 drivers/gpu/drm/nouveau/nouveau_acpi.c        |  27 -----
 drivers/gpu/drm/nouveau/nouveau_acpi.h        |   2 -
 drivers/gpu/drm/nouveau/nouveau_connector.c   |  35 +++---
 include/drm/drm_connector.h                   |   6 +
 include/drm/drm_edid.h                        |   1 +
 12 files changed, 149 insertions(+), 58 deletions(-)

-- 
2.34.1

