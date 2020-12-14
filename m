Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E71A92DA33D
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 23:21:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F252D89F5F;
	Mon, 14 Dec 2020 22:20:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2074.outbound.protection.outlook.com [40.107.243.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D42F989CAC;
 Mon, 14 Dec 2020 22:20:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BURbpw211fqt/YjfcXmQZl4DiOO8yETPcw7NwxqXAJkN0XEFr70fO+QOcwiaIy6vyrzGEn9QTXjssg9Nk2jn1w+qo4Fl5wqrtCSGEx/Pe4UVrokd7St0ZgjixamcToHf23+r2NUuGm5URI/F3whjwwg1vuRHt45Pl7p4qcWKnOZXS64MVuIXxY1DyUMDdL11/vs7Sxyi4mHrtDy4kyGjUrrsdEkrHoAsjcSREFp0Z1nNQmowwqWTMPXzKtzkRamUq5jBSW26oc4lMPYFvIDxKaZt6xuPCofy3Ma+6Op19UNukY5QhXhiUKO5U0vQoZ3WzpAbrKu7syWqVGfPHM8ZGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i4SustXXPQOtmln6VbugOEhRGKmgUV+SGIBAd2NtM+g=;
 b=a68MSm2GrOYXUIoO32WWov78CisNKCRkn2h6ERb+93FqasZCaUJ5yvC7pGr7J+u12GLFTOnYi1DBnmqAFnNagOmpjUEn14mnQdYeb3znp8yga36x4tANfNU/3M6BG338VnjRy3/5KLCItNyAWJbZYM/IN9Tv89IGnwPDHzLQcZTlOkHufW9qzhjxRLEeEQvUd22pROn1wYi5sF59ZD8MDAqUizLKjWa/PVD7Mbhf8p4TQN1HDsh2weX3gbgK6zBsZeGU1GgcTm2Dj4ci19jr0L6LINXPC3SHfBXg4cHuJNO5YIxvuyeE/0Lcknt2rdeIzQJOFM4IUvmYNIsCrbTnCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i4SustXXPQOtmln6VbugOEhRGKmgUV+SGIBAd2NtM+g=;
 b=JQ6LIPPoTDbLGayMPHojdiAyi3ceDcCBQ62G4RrjmZLCPQv+ozZRElVSbSxxiVXjnSvGi3ph/eNNz5FxUU4UbH9iZEQePRcUMjiPI4lAZn+Dn9uRy02duXTGQAm0h27JYGBfUxLAXGZHiXPFT9MKAbNCwp8ST+fSwp03aF8QmVg=
Received: from BN3PR03CA0055.namprd03.prod.outlook.com
 (2a01:111:e400:7a4d::15) by BL0PR12MB2548.namprd12.prod.outlook.com
 (2603:10b6:207:41::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.20; Mon, 14 Dec
 2020 22:20:56 +0000
Received: from BN8NAM11FT005.eop-nam11.prod.protection.outlook.com
 (2a01:111:e400:7a4d:cafe::8d) by BN3PR03CA0055.outlook.office365.com
 (2a01:111:e400:7a4d::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Mon, 14 Dec 2020 22:20:55 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 165.204.84.17) smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none
 (message not signed) header.d=none;lists.freedesktop.org; dmarc=fail
 action=none header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 165.204.84.17 as permitted sender)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 BN8NAM11FT005.mail.protection.outlook.com (10.13.176.69) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3654.20 via Frontend Transport; Mon, 14 Dec 2020 22:20:54 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Mon, 14 Dec
 2020 16:20:37 -0600
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Mon, 14 Dec
 2020 16:20:37 -0600
Received: from elite-desk-aura.amd.com (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.1979.3 via
 Frontend Transport; Mon, 14 Dec 2020 16:20:37 -0600
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 0/3] Experimental freesync video mode optimization
Date: Mon, 14 Dec 2020 17:20:33 -0500
Message-ID: <20201214222036.561352-1-aurabindo.pillai@amd.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ebfc44ad-a4c3-4795-f30f-08d8a07e85dd
X-MS-TrafficTypeDiagnostic: BL0PR12MB2548:
X-Microsoft-Antispam-PRVS: <BL0PR12MB254866129345F976A40C083F8BC70@BL0PR12MB2548.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XRqzORKt/z6PADjrmfvF0pHW3xMJ/Bxp5AemfK9Qm8pzGWds4/KwPuPsd495d1ow2gWnbK15Yp0/O+FnFBs2JOFKPfRisNCRXzdYRL8SdpXL6CgwMdz2N6kp2713lViCa48GQiiXwZwI/qNUar1eRg99pz0BZUoexEnqgsaKZECaGevCym3nvWibTGNJOsQZFvL2nSVYJszYs7/Bdy0AVxMmiyb9KgfRKitlFKjdm8phA3GLPhiT/OmJir2iMvzmPFHxZUwcd0ntUT8ncULs0ZuPJFlqsnnGEGu68HZe2MTZ0HpbIts2WMp26s9L6CFleGH44fenVPXcf3D0JtwBWbnDVix7q1nQzUPq5Yvjy3R4w2YKRSHyc8LiUf2VVWFnkgjv05lsNUL7KH02ULFK6A==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB01.amd.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(4636009)(346002)(376002)(136003)(46966005)(8936002)(186003)(4326008)(450100002)(336012)(86362001)(47076004)(6666004)(426003)(81166007)(110136005)(36756003)(356005)(26005)(83380400001)(7696005)(2616005)(70586007)(82310400003)(2906002)(54906003)(5660300002)(508600001)(1076003)(8676002)(44832011)(70206006);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2020 22:20:54.4714 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ebfc44ad-a4c3-4795-f30f-08d8a07e85dd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT005.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2548
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
Cc: alexander.deucher@amd.com, aurabindo.pillai@amd.com,
 nicholas.kazlauskas@amd.com, shashank.sharma@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Changes in V3
=============

1) Add freesync video modes based on preferred modes:

* Cache base freesync video mode during the first iteration to avoid
  iterating over modelist again later.
* Add mode for 60 fps videos

2) Skip modeset for front porch change

* Fixes for bug exposed by caching of modes.

Changes in V2
=============

1) Add freesync video modes based on preferred modes:

* Remove check for connector type before adding freesync compatible
  modes as VRR support is being checked, and there is no reason to block
  freesync video support on eDP.
* use drm_mode_equal() instead of creating same functionality.
* Additional null pointer deference check
* Removed unnecessary variables.
* Cosmetic fixes.

2) Skip modeset for front porch change

* Remove _FSV string being appended to freesync video modes so as to not
  define new policies or break existing application that might use the
  mode name to figure out mode resolution.
* Remove unnecessary variables
* Cosmetic fixes.

--

This patchset enables freesync video mode usecase where the userspace
can request a freesync compatible video mode such that switching to this
mode does not trigger blanking.

This feature is guarded by a module parameter which is disabled by
default. Enabling this paramters adds additional modes to the driver
modelist, and also enables the optimization to skip modeset when using
one of these modes.

--

Aurabindo Pillai (3):
  drm/amd/display: Add module parameter for freesync video mode
  drm/amd/display: Add freesync video modes based on preferred modes
  drm/amd/display: Skip modeset for front porch change

 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  12 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 377 ++++++++++++++++--
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |   3 +
 4 files changed, 361 insertions(+), 32 deletions(-)

-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
