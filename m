Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95432466776
	for <lists+dri-devel@lfdr.de>; Thu,  2 Dec 2021 17:02:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 062586FA52;
	Thu,  2 Dec 2021 16:02:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2052.outbound.protection.outlook.com [40.107.220.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34EE56FA52;
 Thu,  2 Dec 2021 16:02:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K4vZnCYZ9GFryHtbADG4Id212ZPmbHu/vIvnFmPU5MjKtt0krk0zrl9plzcuRbkjx3MpWtVjXG/1pMFWX0QDdoq1jJe6nOPq1yImua7WgFytFM0QWPqmOpv9uQJiATZ53eIg545+ZS+qjVKF+EgRxxXXolNohaDzpSOaLfhjkW743+tdw+S7TPstPvg5zHNr6NmIX/Lb5m02lD4nTg1qvlX0M8nG84oKJG6Fz0huI4um7c1uEfjjFgaChXNfeK19U2PPdATXa2sRHh4f9ZzKVrm3cwg/Ba5afe2Jizj70giJZ7zdlwoli9BDTwdpGR+ZuG0lN1rG34yo6lVK1NlwZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+mjlovj+UAEX9x+cMvz7GKL6/foenGzy2pc9MGyqZto=;
 b=ADclaSXw1B7QNBsGhxOCZCsgb5ZsBMdtcKQipFUSTjPjEIxV95/FNkpa7TiMv5WfF0K+AH0i0afqM6hYa4EhCa96z0N+GPE9MntyZMTeJn1E3D9ZwZMouLxWvFE0ygW0UVm6KCIaaMSUeJhs6zkfvR4jjUTocjuHXR655ITyx4ApxpGoPsJS7Hz0SNlV3ZDiGJHuEwcVz+Wd534Yee6LwPIlnhorTKs9yhduevMMPi1VjArhR6fTuZj6aZIfwHk12B3qCGYDnVn9dhatc4lTO4nCzHgXKnBxktnGb3C3/L5cvw7f/GlZ9jh42FdX6USqyVBSm1dmy0DvmJWgblKx7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=emersion.fr smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+mjlovj+UAEX9x+cMvz7GKL6/foenGzy2pc9MGyqZto=;
 b=sydOTsCaWDXV7BZjKna5eysr/0eXjCuEUP/5JmaifjBVgIQ89q/c5PGJBeat+cchYVs4Yz1q48faSoH5OU7M7cgbB+4tG+bRXWkP47FFA+RHYUDH3xcCkVaHi7VPXOS3Ape6CxfzAX0d9mmJM+riv8tLYozXlMl0BJIGFIasv9Y=
Received: from BN9PR03CA0142.namprd03.prod.outlook.com (2603:10b6:408:fe::27)
 by CY4PR12MB1525.namprd12.prod.outlook.com (2603:10b6:910:11::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20; Thu, 2 Dec
 2021 16:02:03 +0000
Received: from BN8NAM11FT039.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fe:cafe::4) by BN9PR03CA0142.outlook.office365.com
 (2603:10b6:408:fe::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23 via Frontend
 Transport; Thu, 2 Dec 2021 16:02:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT039.mail.protection.outlook.com (10.13.177.169) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4755.13 via Frontend Transport; Thu, 2 Dec 2021 16:02:02 +0000
Received: from atma2.hitronhub.home (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Thu, 2 Dec
 2021 10:01:59 -0600
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Simon Ser <contact@emersion.fr>, Michel Daenzer <michel@daenzer.net>, "Bas
 Nieuwenhuizen" <bas@basnieuwenhuizen.nl>, Marek Olsak <marek.olsak@amd.com>,
 Roman Gilg <subdiff@gmail.com>, Nicholas Kazlauskas
 <nicholas.kazlauskas@amd.com>, Harry Wentland <Harry.Wentland@amd.com>, "Mark
 Yacoub" <markyacoub@chromium.org>, Sean Paul <seanpaul@chromium.org>, "Pekka
 Paalanen" <ppaalanen@gmail.com>, Yann Dirson <ydirson@free.fr>, Daniel Vetter
 <daniel@ffwll.ch>
Subject: [PATCH v2 2/6] Documentation/gpu: Document amdgpu_dm_visual_confirm
 debugfs entry
Date: Thu, 2 Dec 2021 11:01:28 -0500
Message-ID: <20211202160132.2263330-3-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211202160132.2263330-1-Rodrigo.Siqueira@amd.com>
References: <20211202160132.2263330-1-Rodrigo.Siqueira@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d5341d9a-d01e-4b6a-d45b-08d9b5ad149c
X-MS-TrafficTypeDiagnostic: CY4PR12MB1525:
X-Microsoft-Antispam-PRVS: <CY4PR12MB152570C50F610A29FC8E7D7F98699@CY4PR12MB1525.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Zvi5brsKPO1oaWnFBDhNTL+s65ZVC6BPc7RqN0gIXt3YCkYqVD0x4cxkIFLefsBzvbJPxwyXKdE3RLx2YafUl2zERbWqZX+EKUy192ysFemQi7N2K5R7Q1dmNb33I0Pc4KFaX00TUoU4zj7rRULfQYeW9OYxUcpPzptkwOqLU/OCnKnJoe4iNER+4CeA8MnCpiq5Jq4OwIBZ/P+VTW0AqfybQ32kcPu2MY3f5DDtRV8MZIKgcEfGZi6UzNGsrziIOmSWtYNboPVOuA10tPdlGB25v7PsfI3iZd/x6tov96CJYt/QkIEyOjXGNOQHMnPWzaG8YPsLn5BNIvr7mI/e0if/IJWjj2AWlWcSPeHDNc74q7vu6BsHuICPARORaNvAURsB6kEZ/sG+mwWj0kk5c1dL/36B48GYU6CVatu1hLMSTNss2KQo6V7zcDkilrsHHV3wQeYGw4/wktGUQwNNdj99gw9SGFzWtULvjEHOwR7wTkAlS+LM5m6SiJGWX9DCn33y6fxRqKzcyeyeZacQkMs7Yzs6TbgMLIZlfVFejveIGn/dnEbU9byqKqPQ8SA6NwxDsWEMD32Wbo4xEiLb/rQmqTcN4ODm1MGFcNPZPnlOkkEmIEso9+4VenNMSR9x2TTIqBnpqWjHesghgOOtiEci/rGFE2l+oAlGipvlcDFEOnjUVEc/oli4AGtTcb785OMq4oBEyzA8wLDaH9CFv/PJTglupWlDT7Irg88UlGW1Zo0+2lKcwAH+S82O0F978wizzIg/YNbXXWWNbllfE77dV1FbNkXp712KXTIxXTH60XM2wxnr4wBjrq2YNP6t
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(40470700001)(6666004)(86362001)(54906003)(36756003)(1076003)(70586007)(2616005)(336012)(110136005)(70206006)(82310400004)(7416002)(16526019)(356005)(81166007)(26005)(508600001)(426003)(83380400001)(2906002)(5660300002)(316002)(8676002)(36860700001)(8936002)(40460700001)(47076005)(921005)(186003)(4326008)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2021 16:02:02.8958 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5341d9a-d01e-4b6a-d45b-08d9b5ad149c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT039.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1525
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

