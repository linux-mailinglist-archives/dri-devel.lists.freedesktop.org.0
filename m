Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8D58682A8
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 22:13:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C47510F258;
	Mon, 26 Feb 2024 21:11:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ApAohdOM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2067.outbound.protection.outlook.com [40.107.237.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C3FC10F1E8;
 Mon, 26 Feb 2024 21:11:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BICtHrH5gAZ0gAt3ZF6qSgRP83PNGLan9kQauGBCJIh/GOTpF/R+jSYogrP1tltjyR/o1Z/QGjlp3lm37CbLtEZpYmHI+ySpHyYOLXSaQiHsh3ugBInDrwMNTm5RMcCxXrgyN8v9+VnoxvnoChtCG5FbFwmCBhX1jWjsP8+Qmg69nqFusbOov01JW7v3MW/e7w51Vo6gN07PXzomQ731NPlcHh82J+MkOOWKemsNBAUGa23YqthCYxmD02WJj/LcugqkBgvQ5QFkFGpel4hsZ4jJPT4xv+ldlmUekk28q7XZnCm7/5iKXV4aCKo6/fCuSK+VPJdzbumrMv2/KX4C7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oi1QDMfiQiyEh7kjGlctySq/gLvz9hNW8AMuw75wemE=;
 b=mtq2u2Xerlmk3jhjZXjhpjsM+L/s/GGGPvHN0aXRnVqMzYzs3SxIZlU7Dy9mxsxy4Eg9qyBak+69HeyxM8O3I3a7l3oI1I5Y+uuuKHCz49NGggadvLwcOeWvFlOeczcKWmyQyEhsAG4xYqTSn4ROgoPBfy7jufWaX0MZ2n2bKlAnFgFm0y7HviuNo250l3bke7COCR1UpoOX9fzWV+tujNsHynn/PsHsFrs/7AIyjkCSyfcoRZlQ9KyNY+7D94IDq5/uabFPe812CsFZge5i6MgCnebFrpPAUwSmoqcs/qNCs1ZlbHwqdF8MtdjovcvuDuCM6GPwcE/ZpipBI4M4FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oi1QDMfiQiyEh7kjGlctySq/gLvz9hNW8AMuw75wemE=;
 b=ApAohdOMJLtSu9uMfJUN9b8lSr1WGeBX5if91g+lJsemSJsAB1fWeKXA2WOCnMJDvkPl/h2IDBWb2zlQnlVCWTuGfVQzHOAYU4vltUFzdE2huM+iGuxzJMn5mjsa0Zptaiz0P8l6yEBWEIC1hy54C8dWxxgtZMVf/2Ov33+HFdw=
Received: from MN2PR16CA0035.namprd16.prod.outlook.com (2603:10b6:208:134::48)
 by MW4PR12MB6874.namprd12.prod.outlook.com (2603:10b6:303:20b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.34; Mon, 26 Feb
 2024 21:11:26 +0000
Received: from BL02EPF0001A105.namprd05.prod.outlook.com
 (2603:10b6:208:134:cafe::e1) by MN2PR16CA0035.outlook.office365.com
 (2603:10b6:208:134::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.49 via Frontend
 Transport; Mon, 26 Feb 2024 21:11:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A105.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Mon, 26 Feb 2024 21:11:25 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 15:11:25 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 13:11:24 -0800
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 26 Feb 2024 15:11:24 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Alex Hung <alex.hung@amd.com>
Subject: [RFC PATCH v4 30/42] drm/amd/display: Skip color pipeline
 initialization for cursor plane
Date: Mon, 26 Feb 2024 16:10:44 -0500
Message-ID: <20240226211100.100108-31-harry.wentland@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240226211100.100108-1-harry.wentland@amd.com>
References: <20240226211100.100108-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A105:EE_|MW4PR12MB6874:EE_
X-MS-Office365-Filtering-Correlation-Id: 564284c0-d18e-4f27-92ab-08dc370f7dc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RlKm4PwUXg9nuppIOMVJRXD6vLkgA3nfJMRPoSsNn+Z8sLTCziHEV9bBgehvE9ASmBtFhR0rGNZbsY4PIR9GfPuTmRp77A7woen3w0NMNHj79pfohltbLTWzwzqysDAk8maY6zoj6j2b0FQN+/wQE0X36XImKxJw/uEl2eW/BbAv1NqgCoZWZNrpYCHNFsfzJHpaxXpiAQvy+vwYKCcZ+h6tX8vseO8RyPiSIkUe1bQ8/XberayBkcHQScuS+UVvKcnnYlz9fdU6trkbZG+YBJ+IqLVetG0V0iXn5PoYmwi55dSdHdzrnWdC4jnYpDE0r26QW9QhwBqBXl5uegIcVpYkjZtZc8nG76e/dZk+qhsFDlK65RpYB19Dn5B7a4GnPU5VC64chOuQyioRvZPHsD8os2mo8xAwKyyy4ZBNKmqgg4ZDNdImJa2J2TvMO1J48Hw3HWv2ukMTYLNUUaiLn8NjFTu3cgeWfPn5pmlYlG5bmWCQDLN2xDmN/HiNJxB9P0VcDS2fZNRmktu/whBb5oSJVPRGi0/f8mRrhaoQoMellzpJprqvpawDZVcZ5jFLdYSDeIgprAy0Q/ZOUKu5O3hO5p1/Jzaxeh2R29daKGPQIMnYTaTm2IcnV4GOFRmFwC5KsppDE5eTAbKr38Qu9q7la5tmb46QZsb7N+AACo29eiaUYnI03HfDTlt3mZpgyqpAC+/7V9UwJm7E9Fg4cWOx4WRBS+yoQP8w/ZUmofy+9IBWHcsn9LRL4Uae1OyD
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 21:11:25.3305 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 564284c0-d18e-4f27-92ab-08dc370f7dc3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A105.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6874
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

From: Alex Hung <alex.hung@amd.com>

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index c5c07b4cd6c9..d3f64f586243 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -1659,6 +1659,9 @@ dm_plane_init_colorops(struct drm_plane *plane)
 	struct drm_prop_enum_list pipelines[MAX_COLOR_PIPELINES];
 	int len = 0;
 
+	if (plane->type == DRM_PLANE_TYPE_CURSOR)
+		return 0;
+
 	/* Create COLOR_PIPELINE property and attach */
 	drm_plane_create_color_pipeline_property(plane, pipelines, len);
 
-- 
2.44.0

