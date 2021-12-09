Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7188846EF42
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 18:00:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 397A110E126;
	Thu,  9 Dec 2021 16:54:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2043.outbound.protection.outlook.com [40.107.223.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C87C10E121;
 Thu,  9 Dec 2021 14:21:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KSBtAWzf6TCcrATekqeooBeGtDr2uDAOoJLInIj6JoM4vI3loacF4nEdHxYWgdGiH/EXIRcin8s/Ufbx+E7QQfUYicRR3GwQtBVjC32mNNaHEh2WA5PEEc9wj9pTsrUCvPk1l8Qr+SPqYQvN28urI2+SXJ9ZcBsjmwfr/+LrsAanMLSe5r/xYFWE3y3CNogMul9ZYtZKTnML+IVbzlBECkmzgGkaOchGyb9zHS49ZTv5mO3HPnDhHSe0O9ejf5EGyK9WIa7Z+rlERe/xy8b9bHwnpZAquzPNLpeetSfMb5OAZRYbfh5r/jSeUxIReSQl2pEZNQkZqufsfcHd9X+/cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+mjlovj+UAEX9x+cMvz7GKL6/foenGzy2pc9MGyqZto=;
 b=AD+H29x++V3fdAl8Bsf6VFHEL4W3W3ijHzzYxDDppFPx5omuZyOaw8mJ/XdW8aGhtArqzHKPfxOdzr2qDQ6sCQWXEQOt4CxmPezGhnxSIroMEtvN8uqIyCV2Qtgy/INrA+lk2TCzuwwoGKinWsN/JuqSGMAvKCsHPmnamzwuMP8y8xrLW1RJesOJOzil7XbHQiJPh6dh3ibi3MFm1TqZNLnejf2cx+TFxuVEJW+4dY0UYT6RHSOBZceDFtZiAO6aKFbl6DP8vuH/wKTLzZX1Mhn/nyrWc68jWbnNARaTNNFy9ruTWClUHC/ntT9uRUNHImObosUrFBEI0UEBS+FGiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=emersion.fr smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+mjlovj+UAEX9x+cMvz7GKL6/foenGzy2pc9MGyqZto=;
 b=WHTMxGHYfJ44as6eKh7j11eTK+leWZVvmp1qDIpxH4+SVq73wpotJv4Sx9fd15nBsEsYBFWjj1MOFEEy6pWjZT0UngscMCr1wQO48oDa7MYglpg5W1GQAuthniNfTR1u0L6/j/9op8Y+CV8OfbaLjishQ2KI/orQmg5MLYIVBP8=
Received: from MWHPR1601CA0023.namprd16.prod.outlook.com
 (2603:10b6:300:da::33) by DM6PR12MB2620.namprd12.prod.outlook.com
 (2603:10b6:5:42::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Thu, 9 Dec
 2021 14:21:06 +0000
Received: from CO1NAM11FT012.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:da:cafe::c8) by MWHPR1601CA0023.outlook.office365.com
 (2603:10b6:300:da::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.17 via Frontend
 Transport; Thu, 9 Dec 2021 14:21:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT012.mail.protection.outlook.com (10.13.175.192) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4755.13 via Frontend Transport; Thu, 9 Dec 2021 14:21:06 +0000
Received: from atma2.hitronhub.home (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Thu, 9 Dec
 2021 08:21:02 -0600
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Simon Ser <contact@emersion.fr>, Michel Daenzer <michel@daenzer.net>, "Bas
 Nieuwenhuizen" <bas@basnieuwenhuizen.nl>, Marek Olsak <marek.olsak@amd.com>,
 Roman Gilg <subdiff@gmail.com>, Nicholas Kazlauskas
 <nicholas.kazlauskas@amd.com>, Harry Wentland <Harry.Wentland@amd.com>, "Mark
 Yacoub" <markyacoub@chromium.org>, Sean Paul <seanpaul@chromium.org>, "Pekka
 Paalanen" <ppaalanen@gmail.com>, Yann Dirson <ydirson@free.fr>, Daniel Vetter
 <daniel@ffwll.ch>
Subject: [PATCH v4 2/6] Documentation/gpu: Document amdgpu_dm_visual_confirm
 debugfs entry
Date: Thu, 9 Dec 2021 09:20:43 -0500
Message-ID: <20211209142047.728572-3-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211209142047.728572-1-Rodrigo.Siqueira@amd.com>
References: <20211209142047.728572-1-Rodrigo.Siqueira@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 59361b9c-4c3a-4fd9-ca3c-08d9bb1f2374
X-MS-TrafficTypeDiagnostic: DM6PR12MB2620:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB26203846AB4D45B781172EF998709@DM6PR12MB2620.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U9+ql8MemVJHQ1e6TzaCZUnliWsOsNMgq2uBjGc6ckEFKrdYjwguRZKCRb1F4x6ux2kEm1LpCN938bSdPVoG99ITi8Y5DQh+GTjU6XFQdfuZ8fFphi/kXO7uw+v3cv8qF6g5bWiPleKZv3MplV8QzOPJoHMLA61Yn3U7Iy99EwfVFwI8EJpGADNsdD2aorEORlmJjUszNtAj282Z6LOn3aRZyUmbBz+msAQ3MEAxB4qTsdHx7Qw+cctpaCl2lSqw6kXPTZpD0U2GUQwfD17VjwfFD/pZPdjKJ8f+lnrIISbHViL+fZSH0F1677inOpUmwRH9DazAuKUEmiv66yTQJdbfWtNVCYkrR55ofIjkJMZ56a20RMz9wsVXkE8iJvSur1ZaYv5FztZ5K231NKX2AYnkqCNybrPtJqIedNwUjR2j92qCkGswChZk3hi7WUrrFKje9zeP20/v0YWB3D4J5clGMnaYbAYDCIOcNzBysnVEQQ/RwWPxu+Jdy1/O+lDBPaZRTLbTkJRNsR2kn2Lv230pFwVcDYS/ykc0mlxvrPc4E6awQswOjsLXwzGbB0KMQGquOH6xLU96fHthcQJCbgQQNzKSB2K+PeggpHVDOVhA66++mbn4ZJXXlxTRiGEcC9o9IKt7Ppg9l4wqoNi6TpRZ5V/pMKh6eHqC1SWLcbt+aLuV1eLon0uZ0/0hdFRyFtlJIjIjNy00UWgEc/BSDI+xgK3/WqQ4GpBvYYdVah3LmwykzPCKQPZWwE2HgyX77hvOzJD+1mGGCql6QIJjtltP39TYRVIbuShXsjrOTFbwnqzB2J4abUFzLxy/Gmwd
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(40470700001)(356005)(5660300002)(83380400001)(7416002)(26005)(8676002)(81166007)(1076003)(316002)(54906003)(110136005)(36860700001)(70586007)(36756003)(336012)(70206006)(6666004)(8936002)(86362001)(508600001)(426003)(921005)(186003)(82310400004)(2906002)(16526019)(4326008)(2616005)(47076005)(40460700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2021 14:21:06.1330 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59361b9c-4c3a-4fd9-ca3c-08d9bb1f2374
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT012.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2620
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
Cc: linux-doc@vger.kernel.org, qingqing.zhuo@amd.com, roman.li@amd.com,
 amd-gfx@lists.freedesktop.org, aurabindo.pillai@amd.com, nicholas.choi@amd.com,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 bhawanpreet.lakha@amd.com, Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Display core provides a feature that makes it easy for users to debug
Multiple planes by enabling a visual notification at the bottom of each
plane. This commit introduces how to use such a feature.

Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
---
 Documentation/gpu/amdgpu/display/dc-debug.rst | 34 ++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/Documentation/gpu/amdgpu/display/dc-debug.rst b/Documentation/gpu/amdgpu/display/dc-debug.rst
index bbb8c3fc8eee..532cbbd64863 100644
--- a/Documentation/gpu/amdgpu/display/dc-debug.rst
+++ b/Documentation/gpu/amdgpu/display/dc-debug.rst
@@ -1,4 +1,36 @@
+========================
 Display Core Debug tools
 ========================
 
-TODO
+DC Debugfs
+==========
+
+Multiple Planes Debug
+---------------------
+
+If you want to enable or debug multiple planes in a specific user-space
+application, you can leverage a debug feature named visual confirm. For
+enabling it, you will need::
+
+  echo 1 > /sys/kernel/debug/dri/0/amdgpu_dm_visual_confirm
+
+You need to reload your GUI to see the visual confirmation. When the plane
+configuration changes or a full update occurs there will be a colored bar at
+the bottom of each hardware plane being drawn on the screen.
+
+* The color indicates the format - For example, red is AR24 and green is NV12
+* The height of the bar indicates the index of the plane
+* Pipe split can be observed if there are two bars with a difference in height
+  covering the same plane
+
+Consider the video playback case in which a video is played in a specific
+plane, and the desktop is drawn in another plane. The video plane should
+feature one or two green bars at the bottom of the video depending on pipe
+split configuration.
+
+* There should **not** be any visual corruption
+* There should **not** be any underflow or screen flashes
+* There should **not** be any black screens
+* There should **not** be any cursor corruption
+* Multiple plane **may** be briefly disabled during window transitions or
+  resizing but should come back after the action has finished
-- 
2.25.1

