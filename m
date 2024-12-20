Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D179F8B75
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 05:41:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B732610EEA9;
	Fri, 20 Dec 2024 04:41:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="pCU7M6jI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2085.outbound.protection.outlook.com [40.107.236.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52B8F10EEA9;
 Fri, 20 Dec 2024 04:40:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ec3GnQZFsmLk8uSNmw9t9UtgqIs6fSmUQXeZ+gohFpRih0iqctTt0JIsQWy1OUkHiYDt4ttiGVfkLs/CptI+akKyNOT5rvVMMDtn/6iskJqYhLB1botP+g63nV6WVVLuISn0h02QJi2pne9/mJ6vyiQIgYQbZ8HHAxGqATZxL7pzOWhOzj5xR+APcUtVf5joZzxV5pA6q2n/DhPQ537bPuDcq3KUJQ5z/YEDFv6Cw24161gsNTygrRLOJv4Q9kdbVlYC83Qcriri9JirnnkTdAWL1CKkYs922RoXElVr8RyXkhuzxwR/tvD7+AAd+iHLAGKO17bQZhPHqwAp6/DdKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qbwyPzcbQ/xK9Y5lfWawd054/2yDpk6adw8N9heLF7I=;
 b=Jlhr5gLiKJimmriVrGWa5J1TNl3XKuAtzQDI/Mvh0R2/SKVP0yuSn9RB6b/hff1t8Rh62dPqGuFEFCHjBI355wRBaQIQWsLezdrnXhXTttdnaBbkUxDyVn3FMpyEDfiELY2v3MhjRY+6OVTGCTb7+aPRLsazo6g8Khx4toOs8d9AAdw/v6KOaHgemF0/XDFOnTu+ftstztaq9XG8LgW0jU2znWh9hCBnvntifLqKphS4X+SfDmOIieQ/4Idbg3gbczDY2Eqk9mM+EQfyYF/R2qYK9Z30iyEI25UsaujakW11hZuYChHV1sRrTB/mqOZUUruIGyn+Bc3VLLQygt4IAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qbwyPzcbQ/xK9Y5lfWawd054/2yDpk6adw8N9heLF7I=;
 b=pCU7M6jIDqMZxOvZgYIFZBi5Gdv/J8VfxerlfpuzLzpqLtkcH9Tk8ke5qeb85r4Vp715QJqRKsHj10EN4B1xHNn4E5jzqk+BkB7uSSU5IOLSEVbI3NMuJTPPUs9uTK77lTNAB/IGZbDFqvwJx0+ePpTyDT4joQuaYuw24roRW5M=
Received: from SN6PR2101CA0027.namprd21.prod.outlook.com
 (2603:10b6:805:106::37) by DS7PR12MB5744.namprd12.prod.outlook.com
 (2603:10b6:8:73::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Fri, 20 Dec
 2024 04:40:56 +0000
Received: from SN1PEPF0002BA4C.namprd03.prod.outlook.com
 (2603:10b6:805:106:cafe::86) by SN6PR2101CA0027.outlook.office365.com
 (2603:10b6:805:106::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8293.8 via Frontend Transport; Fri,
 20 Dec 2024 04:40:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA4C.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Fri, 20 Dec 2024 04:40:56 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Dec
 2024 22:40:54 -0600
From: Alex Hung <alex.hung@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, <harry.wentland@amd.com>,
 <alex.hung@amd.com>
Subject: [V7 23/45] drm/amd/display: Ignore deprecated props when
 plane_color_pipeline set
Date: Thu, 19 Dec 2024 21:33:29 -0700
Message-ID: <20241220043410.416867-24-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241220043410.416867-1-alex.hung@amd.com>
References: <20241220043410.416867-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4C:EE_|DS7PR12MB5744:EE_
X-MS-Office365-Filtering-Correlation-Id: f54e0b27-49b3-448b-60af-08dd20b07e76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+7qMndtGuDHh2xZ80YT0BaAHm3dl1D0j2Z7BrxCaNbwaPXRJhjiH96kfRo8j?=
 =?us-ascii?Q?s2sG7aNVTJ1/XOODpnUcc+R8gEkzBcqpRrH1VXTNRCu6/nuE0q9w6B5iqLmt?=
 =?us-ascii?Q?qs44xdZeWsE/XNvQZpIMDKrW040RKFID5ZQYC+Je34QzfarsFNT0OS9lJixp?=
 =?us-ascii?Q?B8FO8U7iTff6etN1Lcb/EvpbK/XEpnpCjJrEsLsdzjBvpYE5Xsz+tvHq89dS?=
 =?us-ascii?Q?bgncDslxOt0r0UEzCxL7gL0ycYm9atgcqSD7wJYqpmJrwoFvEfsldA7QfGzI?=
 =?us-ascii?Q?pw3YhYAPtSaIKg6hnlOrfi6jHKvQkFCGg/TihmiEGQKmwoPXNOxmfomi2Ijw?=
 =?us-ascii?Q?mKE88jlsuX458AZmDQwrx386Iq4waAMFqzzjjk6UF+qDoSg3LopzoMQ73Hdg?=
 =?us-ascii?Q?cQFIPjUz1B2lSBegxwRVhPd71NRskiJ8EaS5YDJe5g58tJ5zbN9dNf6hN83x?=
 =?us-ascii?Q?HubCKPCunFsKdNhoLPf1ZaRwUo3cUYHOQo39GMPb4dWTYpBcbjSG/IFjXxRb?=
 =?us-ascii?Q?rJn+3Fpz2OLJkdrOevvrrO7QSCcMEOSgPgprckTNTT19wo/+kfmfklawEePT?=
 =?us-ascii?Q?rFOCeO5/f7oeFZkw4mASdDQb3OMK3ZGWeg3+82Y0C3I8SPOZ8KF0Wkj/8PQO?=
 =?us-ascii?Q?54Wei9tLu6TZgFYZGV/9J+YpD8uIDvBt59hXZVsBl6KocjwCyHv5eh2riVI/?=
 =?us-ascii?Q?HwFZFOfwIQ6HvAvR6xEGxOqm6m8fW0KBhaFgaBdFRWwih2D4F1FS6ITZLOGr?=
 =?us-ascii?Q?RoIB8e6pxFuGKHbW3JhPAYqnbvA6AEXDchnZGObaary/SXOFh6QU6RuW9CNF?=
 =?us-ascii?Q?9eebHYYcAg/i3sPpRZaIXI9cIUKkV6nW91va57hPL9xiRajuVLzpcJWgm8Al?=
 =?us-ascii?Q?nSsmYWLswtgbxeAL01oBPSH9T2fjnIrlvvdterfqn2dLyzy7CRqv02GA26HY?=
 =?us-ascii?Q?1SThYfBwhyW2EK8L571cCIfXd3IAX63UY2/piZBAD7uPhrcVWoT7E4fp+3dQ?=
 =?us-ascii?Q?JdhYKfe0OnaAHrszXMYdRdGGQnze2wyZsjuDXBflCnDqXyNb8Q7RnE0SLLOQ?=
 =?us-ascii?Q?Oy6zNH+1cFWMzCLG7Fcobg+gGreacSw+VFFP6KDIS3aDRVDJBprFdq1V7ZW/?=
 =?us-ascii?Q?iOweB/9EL21pWt9a1sDuwbJ3ZAXIYtSZoARVNPoVZl7Kud5Df3tvbSGb7qp1?=
 =?us-ascii?Q?5M+sdt0pttRGdX8hBm1vKAf8h2sXaBVrBHkxZNyTtPOeDVWsaZSRtu1ubaYL?=
 =?us-ascii?Q?A0eKBIW8fQj+D45FK2Dj22PaEKfaWnll1foLQTM26525fmI2FH7D7s0lx1M1?=
 =?us-ascii?Q?JxCeLKwucH+NR2Yo7KD5DNunKQWNA2Xi/qKxHMwIpSNEhEAYHp9X8JmuO48F?=
 =?us-ascii?Q?fYRWqCqVZCjVWw63Ily7zbkehQe5I+aGNXLvP38+Yxv8MNhaXwhpBSCKv/6N?=
 =?us-ascii?Q?z3mdTdwlduUbUuarEA7Qp5f99eAc6qj6Fo4dV0DdcaGoKMs9ZKEble5gj7Fw?=
 =?us-ascii?Q?K/6ngxhISfnew/Y=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 04:40:56.3561 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f54e0b27-49b3-448b-60af-08dd20b07e76
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA4C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5744
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

From: Harry Wentland <harry.wentland@amd.com>

When the plane_color_pipeline bit is set we should ignore
deprecated properties, such as COLOR_RANGE and COLOR_ENCODING.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 6e79028c5d78..575eacfc12e6 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -5420,6 +5420,10 @@ fill_plane_color_attributes(const struct drm_plane_state *plane_state,
 
 	*color_space = COLOR_SPACE_SRGB;
 
+	/* Ignore properties when DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE is set */
+	if (plane_state->state && plane_state->state->plane_color_pipeline)
+		return 0;
+
 	/* DRM color properties only affect non-RGB formats. */
 	if (format < SURFACE_PIXEL_FORMAT_VIDEO_BEGIN)
 		return 0;
-- 
2.43.0

