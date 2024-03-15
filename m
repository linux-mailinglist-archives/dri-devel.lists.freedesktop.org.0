Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFA587D27E
	for <lists+dri-devel@lfdr.de>; Fri, 15 Mar 2024 18:11:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F8651123AE;
	Fri, 15 Mar 2024 17:11:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Qts1sw3x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2076.outbound.protection.outlook.com [40.107.223.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C6DE1123AE;
 Fri, 15 Mar 2024 17:11:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MQalvg1/KwKTWqQtmt/TYWBIGcrz7y/UfmMPxs63bNVEMupsXfaFFqkUt9yZqTjfsM3kivwyd4TDMb6Nnk3nVW6TPChrv81ucp5CuSpNGJ95rPukNh+FkoTpqqzlAqAEzB7E/KUnabnlohKJlX1+zj9vmGhDnTIi69BNiq9JDyO+D0VPST4W7vbsHUcryad85+/6kSi62bT8rITlzOpK8QUGbvim6bPyYLG+xGVM9kI3q2M/15DqfLcGfgmYPYqWpOqBYCC8XdF+BHCR02a5jmV1yyRqf9zvPbPGikBNdWYDcs+/N9kXHuTOL44KRIVHvVxOI3Ln7AF0bczJljPGCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mYsDASjighoGf97P1Te0CaT7ij+Q3ogtri7+S0ufsGw=;
 b=RRk6DhOQM8/1m6GOlYJoLx8j/4u7paneNu5idBMNUsOZp+Avkao6P4J8GBwQXK3T/LtI5VI5Q3YHunbc0h+thwxjXf2P5tSdn35umjioTwBlOSLytiuza3x8oO7x2dkxse9lQ/w8FgNGgRnioBZeC5DDvCEmvHtcZSVdriwthkK8dxJCEyzsi0z1fZHsxfqZzvWePANwj2Cri2pEQI8mSb76ZwkoNL+karajzc44BT1SEg9g9yUgQqM73mqckzmPWwZYUaF5u35iQ/Yb1JLRHqYQVGXuKNDsOqic13wvhGWAG0h8JADjc6OZ6m6mWDXsUiJSJ5/lc94Sm66/bNGLyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mYsDASjighoGf97P1Te0CaT7ij+Q3ogtri7+S0ufsGw=;
 b=Qts1sw3xGMIEsvKd6/HMgHqRuhzUWc/aGoWAqgkC0Rckue8EuipjwHlfkhAkB53C0ZMhBDh7xa72cExFZ31WBSkeR/lUkpOlkZLKKlk/qR4Q5PfOhRSZhvvlbfOT9fzzKm5FHe+Q4/L7LGLbWo/iBSrmyZ7J9hlU44jucEKehUk=
Received: from BN0PR07CA0017.namprd07.prod.outlook.com (2603:10b6:408:141::31)
 by BY5PR12MB4324.namprd12.prod.outlook.com (2603:10b6:a03:209::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.22; Fri, 15 Mar
 2024 17:11:22 +0000
Received: from BN2PEPF0000449F.namprd02.prod.outlook.com
 (2603:10b6:408:141:cafe::47) by BN0PR07CA0017.outlook.office365.com
 (2603:10b6:408:141::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.36 via Frontend
 Transport; Fri, 15 Mar 2024 17:11:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF0000449F.mail.protection.outlook.com (10.167.243.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7386.12 via Frontend Transport; Fri, 15 Mar 2024 17:11:21 +0000
Received: from thonkpad.localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 15 Mar
 2024 12:11:20 -0500
From: <sunpeng.li@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: Joshua Ashton <joshua@froggi.es>, =?UTF-8?q?Michel=20D=C3=A4nzer?=
 <mdaenzer@redhat.com>, Chao Guo <chao.guo@nxp.com>, Xaver Hugl
 <xaver.hugl@gmail.com>, Vikas Korjani <Vikas.Korjani@amd.com>, Robert Mader
 <robert.mader@posteo.de>, Pekka Paalanen <pekka.paalanen@collabora.com>,
 "Sean Paul" <sean@poorly.run>, Simon Ser <contact@emersion.fr>, Shashank
 Sharma <shashank.sharma@amd.com>, Harry Wentland <harry.wentland@amd.com>,
 "Sebastian Wick" <sebastian.wick@redhat.com>, Leo Li <sunpeng.li@amd.com>
Subject: [PATCH 0/2] drm/amdgpu/display: Make multi-plane configurations more
 flexible
Date: Fri, 15 Mar 2024 13:09:56 -0400
Message-ID: <20240315170959.165505-1-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449F:EE_|BY5PR12MB4324:EE_
X-MS-Office365-Filtering-Correlation-Id: b7ae4110-5b41-49ef-9867-08dc4512f018
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dAVzMBAvBkQdl7iWBsdJf7w/9HAlp0F7vTwarbd5TN9RfkC3SurdzNkxljKRdOuFpkUVykX9YllLEpoWhndPQIMGAJaNljVfK9G9wHF/INOUzROBt1HloX6zdsSXlPmZMHpSoEpabfqkWQUB3JyP7Wzc0zOPe/SxA4/D5sWmiRTO8yItuvp5rAldD5apHuw+fFcIvx5ehM2q5Bk75Sad034RYaOljzt8T+KTC6PMCS244kl/BL3bgvi11fIOK+XyRuNs1SeW6bKX4dqKwEQTR/tJUU5b2o2xq+Ni4iTSyQmXdtHt9MKyLPIe3gdepyfY/zjxNAkYF29D/6vI+p12vy7PnTB9fs8z5Vxl8GiycMYVyTK1hSHr0bSQKQzr1RaUyNjh259ozCvIW+i/HwWBP1UCav4fmWZnYFqDM4d2eZSh0W7G+hCk7lDMAQGiTdYVQZ0hMTderEGmbDhpyIdBBT7omJwgQ5749ku5wUAPCOId6aGqkWIHuOUJta2OpNU3fX8NgpI0y69aj+taSEyPA2LH7Tfv2f/JQXbhjYFNnhk8lJkmbAXiWy5PTI25ZzyO+ntM/5TmJWUGbOr5XnAgFbrV/jeicybxQWqLGauWJ1pPeWtLmGICP4qtXFfTHusYvLEgu9nMXpBxF0LWAqNJ0/SSrgN2WVt+zG4VShGyJTyH60Y+dUT8Vo3J+vAfG2XyMAAYdnSEoJeyGFrtqwuaPg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004)(82310400014)(376005)(1800799015)(7416005); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2024 17:11:21.9326 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b7ae4110-5b41-49ef-9867-08dc4512f018
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF0000449F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4324
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

From: Leo Li <sunpeng.li@amd.com>

These patches aim to make the amdgpgu KMS driver play nicer with compositors
when building multi-plane scanout configurations. They do so by:

1. Making cursor behavior more sensible.
2. Allowing placement of DRM OVERLAY planes underneath the PRIMARY plane for
   'underlay' configurations (perhaps more of a RFC, see below).

Please see the commit messages for details.


For #2, the simplest way to accomplish this was to increase the value of the
immutable zpos property for the PRIMARY plane. This allowed OVERLAY planes with
a mutable zpos range of (0-254) to be positioned underneath the PRIMARY for an
underlay scanout configuration.

Technically speaking, DCN hardware does not have a concept of primary or overlay
planes - there are simply 4 general purpose hardware pipes that can be maped in
any configuration. So the immutable zpos restriction on the PRIMARY plane is
kind of arbitrary; it can have a mutable range of (0-254) just like the
OVERLAYs. The distinction between PRIMARY and OVERLAY planes is also somewhat
arbitrary. We can interpret PRIMARY as the first plane that should be enabled on
a CRTC, but beyond that, it doesn't mean much for amdgpu.

Therefore, I'm curious about how compositors devs understand KMS planes and
their zpos properties, and how we would like to use them. It isn't clear to me
how compositors wish to interpret and use the DRM zpos property, or
differentiate between OVERLAY and PRIMARY planes, when it comes to setting up
multi-plane scanout.

Ultimately, what I'd like to answer is "What can we do on the KMS driver and DRM
plane API side, that can make building multi-plane scanout configurations easier
for compositors?" I'm hoping we can converge on something, whether that be
updating the existing documentation to better define the usage, or update the
API to provide support for something that is lacking.

Thanks,
Leo


Some links to provide context and details:
* What is underlay?: https://gitlab.freedesktop.org/emersion/libliftoff/-/issues/76
* Discussion on how to implement underlay on Weston: https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/1258#note_2325164

Cc: Joshua Ashton <joshua@froggi.es>
Cc: Michel Dänzer <mdaenzer@redhat.com>
Cc: Chao Guo <chao.guo@nxp.com>
Cc: Xaver Hugl <xaver.hugl@gmail.com>
Cc: Vikas Korjani <Vikas.Korjani@amd.com>
Cc: Robert Mader <robert.mader@posteo.de>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Simon Ser <contact@emersion.fr>
Cc: Shashank Sharma <shashank.sharma@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>

Leo Li (2):
  drm/amd/display: Introduce overlay cursor mode
  drm/amd/display: Move PRIMARY plane zpos higher

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 405 ++++++++++++++++--
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |   7 +
 .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    |   1 +
 .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   |  28 +-
 4 files changed, 391 insertions(+), 50 deletions(-)

-- 
2.44.0

