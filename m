Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 767539B0F3B
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 21:38:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23E0A10EB7B;
	Fri, 25 Oct 2024 19:37:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="AcS59Lk4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2065.outbound.protection.outlook.com [40.107.237.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD53110EB7A;
 Fri, 25 Oct 2024 19:37:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gDm0jHFJUuq+wmyueyjGDY0u3wlD3db9Bf0s26J7eVNlYmRM/egmWkqEPsi65CgiRV7JYy5Z2wDNTpUsktmJjj85AByYDsfolba213X4eSttgbe2IAyYKzpvV8Sb6CFsLfvqzxuoyjK2/hWuNnEuRW9IOuFAhao23JX4/eMUgPhxLYWzPF3UG/G0UO861LntoY38xvayyOIETmFo9TZapj34b6lUPlABx/zOb3rwjIBGYB6SnhIKTdR+wlEEuf7UPk79NH8YPX5ziQ9tzT1ZfYItaIOAZMPpaz/23MgfC6idUkzXO21smVQhdQf2H3sbnbOC8Sa6q2Sr7fbferCr0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sx8/kHFn1c+gllquBK/L0BMNN6ewxAnRYoWu30K+8q4=;
 b=xjAFWzeqW+M92Ipygr0epHhwwbzb0nail4ER1tm/5CzfIjXyzDFXl7jUBoFbzLeihEYAxMEzoi+afepegpl7/pB30yCQb2wNSBwdmFV/quIRpZOiydgxulwJInYPnXWIE4zR2nITq+upVIuf5cEE7YwQ11m8RO8XiaOHVOuTV2w+jjcvM6UHr3JZjUe9MNvL89ikgDbSasikAM8zAc+2+XleS9Wj9HtIj4Dfq9Hzi4vm93OfK4WrpTZiYTu5S9tYDP7dvcBJWMTOQNsQeXRs17vk0h/27+V/g4ti5Uk6ywjiYeQZBj3ULwH8Ce26R9qKtnNyfX83ysLEpOcSRSo5sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sx8/kHFn1c+gllquBK/L0BMNN6ewxAnRYoWu30K+8q4=;
 b=AcS59Lk4KGTCuB2lITDIdTe4ElYBANyZ72oNWfD7WkbJ8DrDur4SjJiO9KYnsEqEtIx+IPn3zGIdZFWzcr7jIUMTgrHH8QnfB2sRXSO/0OrjlNlNbRdmLjv6FUisL+CunYl7iEhK+DsIcF9x4m8sWyMc1KC8kLd1oD899ur3TEE=
Received: from SJ0PR03CA0234.namprd03.prod.outlook.com (2603:10b6:a03:39f::29)
 by SN7PR12MB7420.namprd12.prod.outlook.com (2603:10b6:806:2a7::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Fri, 25 Oct
 2024 19:37:52 +0000
Received: from CO1PEPF000066E6.namprd05.prod.outlook.com
 (2603:10b6:a03:39f:cafe::b1) by SJ0PR03CA0234.outlook.office365.com
 (2603:10b6:a03:39f::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20 via Frontend
 Transport; Fri, 25 Oct 2024 19:37:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000066E6.mail.protection.outlook.com (10.167.249.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8093.14 via Frontend Transport; Fri, 25 Oct 2024 19:37:51 +0000
Received: from mkmmarleung05.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Oct
 2024 14:37:49 -0500
From: Zaeem Mohamed <zaeem.mohamed@amd.com>
To: <airlied@gmail.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <daniel@ffwll.ch>, <harry.wentland@amd.com>,
 <Rodrigo.Siqueira@amd.com>, <sunpeng.li@amd.com>, <Xinhui.Pan@amd.com>
CC: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, "Zaeem
 Mohamed" <zaeem.mohamed@amd.com>, Melissa Wen <mwen@igalia.com>
Subject: [RFC 1/1] SWDEV476969 - dm: Fail dm_atomic_check if cursor overlay is
 required at MAX_SURFACES
Date: Fri, 25 Oct 2024 15:37:27 -0400
Message-ID: <20241025193727.765195-2-zaeem.mohamed@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241025193727.765195-1-zaeem.mohamed@amd.com>
References: <20241025193727.765195-1-zaeem.mohamed@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E6:EE_|SN7PR12MB7420:EE_
X-MS-Office365-Filtering-Correlation-Id: b8312823-4165-41ed-b7d8-08dcf52c83d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rUxGjDe2CQhIk0m0Oobu+oTuIo9hG5d3hxco+shcJ8B0QrA7fvCIKsyJHy16?=
 =?us-ascii?Q?eG8fu+2DVdFLQidhUZSFHvkAs45qvaR6un3MMX6d1eo+TOyWb8H6FwecaP6z?=
 =?us-ascii?Q?64kZW3pZ0iwS3pXnBgwI1d8c6BanrxijKOLZ/vk+XtXsH/phv8EAHDNbJdNb?=
 =?us-ascii?Q?jE4NPk+dRSSiiMQV5VgtEytpsBmzCcqE4qkXLpMgfKIsqiAI7CywRVxxNWNP?=
 =?us-ascii?Q?SEw2ZuWUitjWq3YA3RCcvKRnqDRTkN9Zy7VMcD7JhAZUSKuExh7FSs/F4kF0?=
 =?us-ascii?Q?dn23Qt0uymkf5Y7G3gLn32UNILo8fHoLGTTGa6A9PziSFVyrLuPHPJDc5N7+?=
 =?us-ascii?Q?9Fd6PzyqSRAyegMJt+spBm+MYTYP6nFb83bj/K2NnZBpIno8eDVxza8d8+eT?=
 =?us-ascii?Q?zhxzdXLQcZ2Kbha/PAC8Gw/tmr1rCga0gOoEg9hUbxo1FRC082ALXIKOgAq2?=
 =?us-ascii?Q?577DtkySjE7Q2NpZeS2JIi0qwdWBzzClRVWuaRZjoj7EKa7bir8wX8hCVtoq?=
 =?us-ascii?Q?a8XVHU/Xn2WbMp8Y0/VPoIeKsfTi/5TlFUGQQnnxN0fNe3mIlIfkh/gf6Ktx?=
 =?us-ascii?Q?qAGrG8WtapNZTmLOHE2WNVPfs69raEczTxS06oJj8w+bzh8GAejPuZeQEMZj?=
 =?us-ascii?Q?y17BJX8fh+3EFJAxFtMijK7ODYMfDqx0bMwVLj7z5uzh8pBVmwjxgoBMV51l?=
 =?us-ascii?Q?3OEovn6T2hOAl0CSaHgCGNMvEnLb2t9eP84vhYxsXYAf04KprGmjCKLT2E6J?=
 =?us-ascii?Q?8wODPEu675JtbzVY1vAUnpjkMsurSE0zh3YQfC6+zhJJGHeSCsgQZjOPfzbZ?=
 =?us-ascii?Q?OeptAQRb3F9lnNP+fP1ftqi/PoicYOUZRruzbBY1e6kyK5re/271FmZPMS4Q?=
 =?us-ascii?Q?n/JQAgj006BN9YtS62513RTBRz/AFgSWgrzW2nXr22k80uwEmJqxuqHUkxpx?=
 =?us-ascii?Q?uWsRCzGf1IRdts4dDAGV8yyoh+h96zW3GN9IdDu2mv37gQx+hgk/TuBVSyRZ?=
 =?us-ascii?Q?DeJ/QvRIHY8dVZJQHqJIWsHVMA2nLGhSauhW2YpU27kOfEFdaL6IHY0SIB32?=
 =?us-ascii?Q?1R5Wd37Di5yRYqoag3jF9OkqS4wxDZM+2VqqmKg7DZmiL5UU5Ut0Gknn9/YU?=
 =?us-ascii?Q?Roj8J011nlcamgf50KUexDlIPafyH+ssr12eSjArcMas1W2JwL1BCICIdGb1?=
 =?us-ascii?Q?19i84v2AcDXF9yPI4oMJM5nlYb/Vg1cusWw8WQ5q8HBJRSyFcHZ2Y4tv+edN?=
 =?us-ascii?Q?sw1eCHTKhVCWs3l895Qq0eViZAWPPkqj1KkYLEQhS8T+Tc0mFiYu5ml6qh/C?=
 =?us-ascii?Q?GA/bmyE7X9brEPCc3J2slcLw03yECRHMDkxy/H7PJWBbVHOo3lmjEYxNepBX?=
 =?us-ascii?Q?hb2AiV9hyOs0KB9FsnpvYpXxLxRfGKnlLO7a3a4m7NQFRneRpg=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 19:37:51.6949 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8312823-4165-41ed-b7d8-08dcf52c83d3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000066E6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7420
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

[why]
Prevent index-out-of-bounds due to requiring cursor overlay when
plane_count is MAX_SURFACES.

[how]
Bounds check on plane_count when requiring overlay cursor.

Co-developed-by: Melissa Wen <mwen@igalia.com>
Signed-off-by: Zaeem Mohamed <zaeem.mohamed@amd.com>
---
 amdgpu_dm/amdgpu_dm.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/amdgpu_dm/amdgpu_dm.c b/amdgpu_dm/amdgpu_dm.c
index df83e7b42b..c2595efb74 100644
--- a/amdgpu_dm/amdgpu_dm.c
+++ b/amdgpu_dm/amdgpu_dm.c
@@ -11676,6 +11676,12 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
 		 * need to be added for DC to not disable a plane by mistake
 		 */
 		if (dm_new_crtc_state->cursor_mode == DM_CURSOR_OVERLAY_MODE) {
+			if(dc->current_state->stream_status->plane_count >= MAX_SURFACES){
+				drm_dbg_driver(crtc->dev,
+				       "Can't enable cursor plane with %d planes\n", MAX_SURFACES);
+				ret = -EINVAL;
+				goto fail;
+			}
 			ret = drm_atomic_add_affected_planes(state, crtc);
 			if (ret)
 				goto fail;
@@ -11769,8 +11775,16 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
 
 		/* Overlay cusor not subject to native cursor restrictions */
 		dm_new_crtc_state = to_dm_crtc_state(new_crtc_state);
-		if (dm_new_crtc_state->cursor_mode == DM_CURSOR_OVERLAY_MODE)
+		if (dm_new_crtc_state->cursor_mode == DM_CURSOR_OVERLAY_MODE){
+			if(dc->current_state->stream_status->plane_count > MAX_SURFACES){
+				drm_dbg_driver(crtc->dev,
+				       "Can't enable cursor plane with %d planes\n", MAX_SURFACES);
+				ret = -EINVAL;
+				goto fail;
+			}
+			
 			continue;
+		}
 
 		/* Check if rotation or scaling is enabled on DCN401 */
 		if ((drm_plane_mask(crtc->cursor) & new_crtc_state->plane_mask) &&
-- 
2.34.1

