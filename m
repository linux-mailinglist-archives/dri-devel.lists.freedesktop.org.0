Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FDC868291
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 22:12:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5726210F23F;
	Mon, 26 Feb 2024 21:11:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="tUV9IDxa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2043.outbound.protection.outlook.com [40.107.243.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A78A810F0DD;
 Mon, 26 Feb 2024 21:11:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L8F8pTSbmNV85dKB9FZx17NxLn50jFVID+6iMJMNe3RXXqlBsEzjUSBQvdOoYUmq8ohyv5Ak1FtC10BJI35kHvBppvZJZe148X5BECoVxxFqMWqI58AVeZ23tKoTTEXBUJHIt79KudxtdAmWCctBZJia/1Vyvl2PoQqndkt7y3Z/QIAtnbIgN5i9BuzEdGr0gM1q7dH0g3Y4egO5dhEXq1DcEmM9rOZd7SMqHKg9QztKVy/vyMnVcgxiqVad8BkrDqNVJ+XGpehvN04Oixn+ri/Fet1h3F8qF8Jd06Kq94TVEBw2+CRLXSnyKTJU+41FGRMHu84DCenePAcW5XP0lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XEjCvnKblS7pG9ng4rFTfRMWqKUWgSXF9HbWlWewppI=;
 b=iw5kwn3QnCkx6omTVlHrpuiRq1C68MllP5Bgu044BHaGzHnLcwP7zdC86h0Pf+FWTjvvaCknihGIRoKNx/qDnccorZOoZh4ltlNmmoKUU1BaFR23ujYumjqlbwRxBsn3J8aWxMc1qAVBX9URyOhWPyn+DXfANf2pj40mYw6nooEg8EKwdUEPqOzdFHk5F5NZXh1iZ9VZfpr5HDL2Lv4ihvjjrw6Yiy4vv9Vpen+pm01881YEYdEu85ms3iAiZeycJCIX08j5X+/x0qzywR/zJyz7JbwmsUmFdHAiayWFW+TCGEGq/T9lxwUfC3UKGLD4Fww/+rhw/J8t0NyRz75P7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XEjCvnKblS7pG9ng4rFTfRMWqKUWgSXF9HbWlWewppI=;
 b=tUV9IDxaC/2/ccvlyi2JIkm/LNftVpUejzVQ4GAjEkoXwCYgnjRnqZT5Rc4czM4m2lFVTVf/526ar6VnuKF3vgRt9v3L2NAoyV4n/gJ8qLvev/hg98v/ypnvRHk3HXNQ2MJouHtheZuLjztRds083NlyJCj0XgYntSWKVvMBfB8=
Received: from SJ0PR13CA0078.namprd13.prod.outlook.com (2603:10b6:a03:2c4::23)
 by DS0PR12MB6439.namprd12.prod.outlook.com (2603:10b6:8:c9::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7316.34; Mon, 26 Feb 2024 21:11:25 +0000
Received: from DS2PEPF0000343A.namprd02.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::68) by SJ0PR13CA0078.outlook.office365.com
 (2603:10b6:a03:2c4::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.25 via Frontend
 Transport; Mon, 26 Feb 2024 21:11:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF0000343A.mail.protection.outlook.com (10.167.18.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Mon, 26 Feb 2024 21:11:25 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 15:11:23 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 13:11:23 -0800
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 26 Feb 2024 15:11:23 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Harry Wentland
 <harry.wentland@amd.com>
Subject: [RFC PATCH v4 28/42] drm/amd/display: Ignore deprecated props when
 plane_color_pipeline set
Date: Mon, 26 Feb 2024 16:10:42 -0500
Message-ID: <20240226211100.100108-29-harry.wentland@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240226211100.100108-1-harry.wentland@amd.com>
References: <20240226211100.100108-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343A:EE_|DS0PR12MB6439:EE_
X-MS-Office365-Filtering-Correlation-Id: afd01160-baeb-403e-4b9b-08dc370f7da0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RF7afCRLaHUPz1wkRsWF7siy6NlNw2827EOrsIjV2VxZkTUchymDKwpOPHSZ8qwO1o9axiJy5rc7UX5k8coYNUE/smTFYOmrIJMcuP/nZ+FBYKhUNkk5guIzPJfJRmACWwBsZcdZMg9MpvFmFG+BcVXkk1Y4dfLyPIgcDcPhb+3/X9xh8E0cHy79Muvobwsbxh2w1rRbvE0kxGQ/T8XzlnCmEP/12+GqgHfAjMaSU0oUA/jJX1fHEhUB1iSnYVEJoa5PZvqvQjSb2mF0YjS9rqS0C8cfAcU2nV24tsAQHXQDgsTNHsBNRswzRo/6qS34iPMaGwV/y9kSRnzT9Vj/p3aMMgKsdBwnjpocQWvyrcBkodukQIl3C5zmQoSoKml4fk+6gAQSiEbWes3fQpQwpdVPL84OBIvnz4eJY1uPlyACumMK4RNHPl5a8Pgs0m4n3h7bKbMyyBsNDjQJiECXEUv0KXGw4z7EVuEQrAH3LhpbhD8qx4f2FO9hkBNcFLieZArT4GyHAs4ZO2bviWEd2PCmToA0gd75zbjRnG3qXwrzd3wGBWaczrkqeQXNLUxpfrwHApC+yLinszlVXdkPVFnbL2O9f2i/WAZ7w+5Et3Rm6X1LvYaPEOLLZ0Vg4iuhnKKCsiwBmFktELNi0QLVQxVDx4hjvMFDfnYcRtqF8VOs6851P7j+D8mrXAa8XDUXKIF6UGVWCJYc8je0Wmu2sPtnjxQnfwWxaXvVZ7ULa8ieR66heiq/X6+NqW7vVcwK
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 21:11:25.0680 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: afd01160-baeb-403e-4b9b-08dc370f7da0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6439
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

When the plane_color_pipeline bit is set we should ignore
deprecated properties, such as COLOR_RANGE and COLOR_ENCODING.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index f6575d7dee97..47c6fd33fd60 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -4948,6 +4948,10 @@ fill_plane_color_attributes(const struct drm_plane_state *plane_state,
 
 	*color_space = COLOR_SPACE_SRGB;
 
+	/* Ignore properties when DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE is set */
+	if (plane_state->state && plane_state->state->plane_color_pipeline)
+		return 0;
+
 	/* DRM color properties only affect non-RGB formats. */
 	if (format < SURFACE_PIXEL_FORMAT_VIDEO_BEGIN)
 		return 0;
-- 
2.44.0

