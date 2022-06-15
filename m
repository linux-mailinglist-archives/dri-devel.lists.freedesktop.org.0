Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDBE54D31F
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 22:56:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F5EB1130E2;
	Wed, 15 Jun 2022 20:56:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2059.outbound.protection.outlook.com [40.107.93.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FB0B1130D7;
 Wed, 15 Jun 2022 20:56:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eiR2s81ALXy6wX2EUaoRvpDgxn1wYglY8MCDlLI4s420+IHx+wL49SHg3uGqwgPUM/X1mN3TdObpxe1JEvnrZ7WlthZHvggS5rmH9ph7fesinLO88JHrgLPeidw//sAV4cHNI54IBTz6XE/jGe02nyl9qp/dOLdY2+F2yOvgeFhMFGB4f/d3X0l3bC5TZL938P/qs8mviF7Fz6z9we5hlzTumM5gWDxAJ7b4qrQtumBQbrcBGnKAZAZb2YX5MlNuKOYJN8DvSFm5t9cAwIAmp/zK4R4W/SmD8WCGZzmJzXyUsHYS//DPiNiBwQOLrZ8B7FmufLvTElkihBwDmh4N3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2F5E9xiXcrI3kjWeV/x6+K43Y039mVqtMFNbw/eZzzc=;
 b=SQjF90t63vCzzSbeD7EWckkvxaH9SRkf/gi3NJORiTV6RaePydNY5Lf+YBfx+AMZNgRV32jQn0QOnweqpB8rGh3VCNFi4JPIrxlbSrZQ3DvlqAiTX5Rf3Ild6qFMGR0zGtB+DntZy/KZfndbJ6t70x0DVU7CQazYssMmIR/DmqksGnFmbOPY5SVlIvxbqZPyEhvwavbcv5S113CCbTAcbGjmFQQPDhXuHF51AxVrjwSsMp0a0/Xtu9lBg7FDxLiGaKib5wV3PYyY0mKasc7ZSqPykxMzzT86NoUiXH1+/LUbtVDOCqoVyzCuDQDFSm3bC1jz9QlEy5Y4+r21SnYbaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2F5E9xiXcrI3kjWeV/x6+K43Y039mVqtMFNbw/eZzzc=;
 b=LJvweTpPUtsxpXXspxV32M6gXGw3Sq38WMo9l3wtBcREd86DOaYBnKJrlZkl81R1lCfAxOdUuY25+U/WqKCiLHZSUJbWq8jUfQ2tsn2WjFS/dG35XcfzEnaF0+CB93QgoOHByv2z0B58aECzqo/c1oAtyGvs39MlYD0mHqX5FQM=
Received: from BN9PR03CA0682.namprd03.prod.outlook.com (2603:10b6:408:10e::27)
 by PH7PR12MB5830.namprd12.prod.outlook.com (2603:10b6:510:1d5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.13; Wed, 15 Jun
 2022 20:56:24 +0000
Received: from BN8NAM11FT015.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10e:cafe::41) by BN9PR03CA0682.outlook.office365.com
 (2603:10b6:408:10e::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13 via Frontend
 Transport; Wed, 15 Jun 2022 20:56:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT015.mail.protection.outlook.com (10.13.176.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5332.12 via Frontend Transport; Wed, 15 Jun 2022 20:56:23 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 15 Jun
 2022 15:56:22 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu drm-fixes-5.19
Date: Wed, 15 Jun 2022 16:56:09 -0400
Message-ID: <20220615205609.28763-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f5447717-e087-46f4-1a60-08da4f1181e2
X-MS-TrafficTypeDiagnostic: PH7PR12MB5830:EE_
X-Microsoft-Antispam-PRVS: <PH7PR12MB58306BBBA43997A4452555D0F7AD9@PH7PR12MB5830.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3VVG9d/f5FioaD1FLS/8PhJaZgwNztetEid/yeDBB3m+PujgAKairI4QZjNzGOD3MZDrXgbCdnJTzkrTMy0Mbn78NCllTwbymdD9yMAaRev17AkKBjxWSlND+4hvmqcPwK0EB4RSFviS5xSMKvbxOxi3fjsptn/IoX322pq48kzD5bGddWDe/w9ag2yBjcsHKIwbmsZLChZb1SllDkcD6UOCmT4WmXURh5vsm0Cwk807SrbxWhs3cNH4dxPDFSEbR+OTp1JiWS2HUFaJ4dR6yDwCgvWXcKApLyNTD+81S9VEMk/qmFeQ0YXWaxygedxb/UynZjC4kPHL7aioWz5B959FZ24vs296qtDxYYgAyketlpGNdJo9WptdttRCRKMPomBXSOowqRfApGos7cow+ysuYSz4LGhLSZD1yufKaaJavteTgaRosMkjqUQNTWHR4OqduD1s6bTEwUzGsCCP/8Kj9SpJZ0c1uc6nvQ2YkM92rWiBTSSYyomcFj1qcym8WTwOdA/HrV/bQtRz0PmimDKk4El3c6jiUXUTn7ZeCG0L04brhZPLDqBWVAc5u2qkM1Iamm4vwPE4EIFKp/vw8qXCmIqXVBB/kVKk63BwfnnZoEZZ8zQbNrWI1krViR/+g8r+kF4SPadR2LoZ2oxI1HjocTffBfw6gKDAq5o+nG68DgNHIwfkVnDyv9bIAxMS5+bxGs8ioYksJfpNsx0lgg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(36840700001)(40470700004)(46966006)(316002)(16526019)(186003)(86362001)(110136005)(8936002)(8676002)(5660300002)(4326008)(966005)(70206006)(70586007)(2616005)(40460700003)(1076003)(83380400001)(26005)(47076005)(36860700001)(2906002)(81166007)(426003)(7696005)(36756003)(508600001)(6666004)(336012)(82310400005)(356005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2022 20:56:23.7682 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5447717-e087-46f4-1a60-08da4f1181e2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT015.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5830
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Daniel,

Fixes for 5.19.

The following changes since commit 1f192b9e8d8a5c619b33a868fb1af063af65ce5d:

  Merge tag 'drm-misc-fixes-2022-06-09' of git://anongit.freedesktop.org/drm/drm-misc into drm-fixes (2022-06-10 13:29:22 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-5.19-2022-06-15

for you to fetch changes up to 4fd17f2ac0aa4e48823ac2ede5b050fb70300bf4:

  drm/amd/display: Cap OLED brightness per max frame-average luminance (2022-06-14 13:11:11 -0400)

----------------------------------------------------------------
amd-drm-fixes-5.19-2022-06-15:

amdgpu:
- Fix regression in GTT size reporting
- OLED backlight fix

----------------------------------------------------------------
Michel Dänzer (1):
      drm/amdgpu: Fix GTT size reporting in amdgpu_ioctl

Roman Li (1):
      drm/amd/display: Cap OLED brightness per max frame-average luminance

 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c           | 2 --
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 8 ++++----
 2 files changed, 4 insertions(+), 6 deletions(-)
