Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABCFDA5CBCC
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 18:12:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1215810E64B;
	Tue, 11 Mar 2025 17:12:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Eob1SebL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061.outbound.protection.outlook.com [40.107.237.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C2E110E649;
 Tue, 11 Mar 2025 17:12:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wInka1witmHDU+3dxFc678ze5n8fwgIRyFoS8mo4Z0AAGwsbg1vqiFK7jMXAKXVVUz7UGjTKiY7YXYI7c+0w0K/L1uac9aD+5Eeo2CKvaZvBIGpcXPXSZWu05Dsm1kBPwwOvavvU8DVkrNjxE9g0KB+/9w7/I7dvLPG7Z65ua5Uksc4PwW9Z/MbdIAHDjsUBI+rebXD0EQuz0CEJZTBAsw4QmlMUhaIfBULtWVXfQo709jyJ1BkuQwENv76pod/0qfvmCvDuEJmzh5AHAv7TSu6Z8AapbiD5KHZOSjc+xlzQzwgi2NqgYT75jOuNTnzmMITIk5D1yQYbceCAbEFE1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=biL5HQbjvlv7sRBYPC1aZ498oESvQy+181tT5ASQMTw=;
 b=sPCm0ylP7+Ei1UxyCq0eO4D6BFqjXLbllZ9paxTKn2y0qJ4zsc9usRtqOEto3FZyFi7H9qgOs3mnZPfCMcgt2zWFxNr+veB3gh+vfgEY7SN7wuffDAAUJHTlJSTUCqElJWZpXpyTGH7vjcReSYNaLej8Q09yB0+wx/WJYKFjJ7iuXhJ1Mf8XQWT4oFxj79/ftf+UI1DlHJ46XyEkakMquYQYVxsvNLpeLcq9Ocz9/W1XVsaP0KSxyfBWbe7xRAu2SSAkh5e88IUAHJX84TXikLMNzQZhn8iyEG6zEmLgrsFUVAv11GXv1hODruPePhiq9/I4oiJa2T6hLsxFsFL4Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=igalia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=biL5HQbjvlv7sRBYPC1aZ498oESvQy+181tT5ASQMTw=;
 b=Eob1SebLtqd3x3W/L34BQ/rv9qcfRjPLOrj+sSu5AchyJgy5Plk9yQeIPXD/Jrd0lTTEAhvZF7PbBPgJFhehWgqZdJaS10ASFGl2PUfn6ZTqb/58lhk51koKUwkGyT6C3k1jFpj6Bu1FOSOAQUWuEC/6eTXX7QzL7XZn1hf8A+4=
Received: from SJ0PR13CA0190.namprd13.prod.outlook.com (2603:10b6:a03:2c3::15)
 by DS4PR12MB9681.namprd12.prod.outlook.com (2603:10b6:8:281::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 17:12:07 +0000
Received: from CY4PEPF0000FCC1.namprd03.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::d1) by SJ0PR13CA0190.outlook.office365.com
 (2603:10b6:a03:2c3::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20 via Frontend Transport; Tue,
 11 Mar 2025 17:12:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCC1.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Tue, 11 Mar 2025 17:12:06 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 11 Mar
 2025 12:12:03 -0500
From: Alex Hung <alex.hung@amd.com>
To: <harry.wentland@amd.com>, <sunpeng.li@amd.com>, <siqueira@igalia.com>,
 <alexander.deucher@amd.com>, <jun.lei@amd.com>, <aurabindo.pillai@amd.com>,
 <christian.koenig@amd.com>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <Samson.Tam@amd.com>, <alex.hung@amd.com>, <Navid.Assadian@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/amd/display: Remove incorrect macro guard
Date: Tue, 11 Mar 2025 11:10:17 -0600
Message-ID: <20250311171017.3053891-1-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC1:EE_|DS4PR12MB9681:EE_
X-MS-Office365-Filtering-Correlation-Id: aaf7dcdd-657e-4482-1603-08dd60bfd9c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DcPl9fW5E5QI7x2GZ6yw3bsjTOeL2hfl77Z4vaZTpesf3Sw5RXHFcr/l2Kmt?=
 =?us-ascii?Q?DQxznmo4MpjbkQ92Ms7hHD4OiGJV3qq3te5ffeAOhQmOBLI8X7yZGbtLwsM/?=
 =?us-ascii?Q?MOkSoCPrbITm9lyC49xVdATKzk1DrnDSSUpneCKGGF5vpDB+wLdz6GvG8u4d?=
 =?us-ascii?Q?Boalq2Uqn+lX8K8jyp6ZMX0sWfjoQZz116rLig++8A1zcinpA0JLI9vB/lu7?=
 =?us-ascii?Q?pvLW9PGKTfia+g8nvq6kXRoubeiM830UCEbPj0yXoaVRozyliVQR7sltwuW5?=
 =?us-ascii?Q?uOt9E9JO/fFrM6R54Whh4O1v/tlj6EyCagqcp1qK7GTn7ai8wbW+uIxwwxnS?=
 =?us-ascii?Q?NqcEY7dwTpvKS5dcpIfbbLwumVGmrPbY2whP/gwfCkb+p4Ww5+gVrB9Z6PZc?=
 =?us-ascii?Q?Btzkupx07TGNOWMQt2Qir8QbaOpEAvyHFcPamK1lUJMSc5AVbQD8w0pcaxRo?=
 =?us-ascii?Q?cX0wvnh6TaQ17jTgvKqjlzstng2DHBdCn4sjZgB5Umr1ozfhwjo9Da8HSfgm?=
 =?us-ascii?Q?eh8triCL2nyAP5tL0pnpUd8VFVR23/a1yVoc2LJvElBmp3Ul1IebfpTO/nzz?=
 =?us-ascii?Q?FTNdMuIAY+ZgMduOJs/Z2VYFEBExScc5nj80ai0RSGQkV7du5X0DyZIGE+u9?=
 =?us-ascii?Q?rDRATdaTR8WCo2bfDOaKcBKvstvDEcxbkEoeFNKbLd8Thu+MK+cl9NcFCk0v?=
 =?us-ascii?Q?Bc2euhF1ZsTg/MVtZNxCY3XRBTcKIc5ceTgaxsvHG3XgXfN3MuZsSrkjcDkC?=
 =?us-ascii?Q?vykEpDRdakp09iNShb5yC/b0UOdbrH1uYQ838nxqMDhRZYPaLOCrXD0VvRoT?=
 =?us-ascii?Q?uzRUADPThQzts9E5OFd7t+mwuxy45XAtFzx/5aEcw8MdvTMVwW9wFs2AN3lA?=
 =?us-ascii?Q?faU481qQxDTf0D2yd7h8IjYdgli6kOo8aBE20kxEeuOT0ag3NneiI4TrYQoM?=
 =?us-ascii?Q?rljeQzT9cpvgxBfw1Nex1XA8b2YQd1ZRBY9jtczaFOoPcRQWF9UCJ7nyvauQ?=
 =?us-ascii?Q?uWFCj8vfoMHw2uXGPlH6o39IzqZNp+4wMFQZ/tNNzcY7quC8SiLuBQOZ9P3r?=
 =?us-ascii?Q?x7uWj6wL3WZrqKgD06BQhae7szBKOC813lScQxNq2GDAh00KLXBdJVPjDDn8?=
 =?us-ascii?Q?JtrkGDCfAah13Lqn+JffS10it/q5ARMCDB1rVR7N093iz0lhqE+HOwaSzjrP?=
 =?us-ascii?Q?4OCLuXyhkXRhHnbreDTRSxvI1TYzlKI70c+62+jyhKTEtC4jIFR2Tp5cUeuW?=
 =?us-ascii?Q?VIQHTTAo9uKfWJlE8ICEazBRduOU25XjweHLQHXp7bG9R6lp+JPOiuLP2UF9?=
 =?us-ascii?Q?uIrJJBYQmvvZcCQBLAV5D4dS8JFUpB0gVJMu6tI10FAkNnqPCEdCDvybp6HW?=
 =?us-ascii?Q?OqrjCxrIrPy6ClEP9CzkZGJd8aoGXn15BGj3nH/YJO6Oqbc9T5szBR/OF08v?=
 =?us-ascii?Q?GE4lkTuZZLLssH3EK/1nF4Cv8m/fHa3lVf0K2kVCz0kxB9c4JtplqoYSRJxG?=
 =?us-ascii?Q?7X9OMuKUG9d5v+irHzoqZOUUnjDc7osUHoGp?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(921020); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 17:12:06.3351 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aaf7dcdd-657e-4482-1603-08dd60bfd9c5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9681
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

This macro guard "__cplusplus" is unnecessary and should not be there.

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 drivers/gpu/drm/amd/display/dc/sspl/dc_spl.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/sspl/dc_spl.h b/drivers/gpu/drm/amd/display/dc/sspl/dc_spl.h
index 145961803a92..d621c42a237e 100644
--- a/drivers/gpu/drm/amd/display/dc/sspl/dc_spl.h
+++ b/drivers/gpu/drm/amd/display/dc/sspl/dc_spl.h
@@ -17,9 +17,6 @@
 #define SPL_EXPAND(a, b)          SPL_EXPAND2(a, b)
 #define SPL_NAMESPACE(symbol)     SPL_EXPAND(SPL_PFX_, symbol)
 
-#ifdef __cplusplus
-extern "C" {
-#endif
 
 /* SPL interfaces */
 
-- 
2.43.0

