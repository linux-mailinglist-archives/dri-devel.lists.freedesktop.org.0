Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97ECD98F78E
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 22:02:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BF4D10E934;
	Thu,  3 Oct 2024 20:01:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="hS03tD4h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2041.outbound.protection.outlook.com [40.107.223.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 745D110E918;
 Thu,  3 Oct 2024 20:01:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GK5jmqgSTQXsbgm8y8DTuc32ApayDwjoM7WpQTHr8XFsOxSBcoSlZ7c+F1pGbqfjD6JyQs2R3Voh5vrXd01k6vTfz1hVDDQhXd69E/r20EdHHua0zJfYVbD4wA43VaRb1lkED9RnMz7jvcf04my3uFIgQRmtLsMwHz74AEXsWThhY2kkFLzGFAsQoaQjZs2r5nc0ef/icwvpnnwRoKom52jiPmnn9YIJa/2wq4ORSmY8LWDRB+Zsn0geLGy0EatuxQQzuIVtk6nguYZ5qDwPJpW6sCFbkMRxUKQ7S9Z8Jk+JBs+We/m1KDV4/PUJyHaZLCHATTh1syu5Kw1leymEGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OfW+DWDjvJ5NIIvE6pESJKLxqM5weRPBkUhMxDmq2s8=;
 b=AYlwUP55anV5Sn9RFp3HrQ7traeoZC3WddCge1ju3WYLfuZvllRWJ3bPcPvxZC+lVFq0SKcyAvG67CmdAmakQFljsTn+H0Gs1JIsyPGi8valFJBwYZl8PnD6mZgIpbYP2YhvFNl6DkaRHQ9GvKqRpsQ6pJ+bTr56leXkFUZMWu7+bgGMdoGLmT1PQbBomc8l7sXKo4sRaFUGAvtcP1iYq4pmt8IfzqFgiS6PadfwjHNkFlUCOTJIFqQfhSy9BfF/dUVTzboU64uMTNFMqJDPP89ZS3xxqzlUpukJEFgBQHloK0ZHDKRU/ojT4AfM8xXtD0RaxZruN9R+8FpxLnPuEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OfW+DWDjvJ5NIIvE6pESJKLxqM5weRPBkUhMxDmq2s8=;
 b=hS03tD4hP2IOdOUc6fZ8tR59HU/dzcFfpyS9VsqxhK8BPEAwCva6enw8r4TV8wDCaSXH2ooh8xI7oQKx+aqhf3GzbbvHs2vucOgYLD4+U7cT9CoUFejr05oMxXDdD0Pe0tg4JxoucwGA4/EYpJs///QnvSgTEu+pmXDkovAEzrg=
Received: from CH0PR03CA0254.namprd03.prod.outlook.com (2603:10b6:610:e5::19)
 by SN7PR12MB6929.namprd12.prod.outlook.com (2603:10b6:806:263::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.15; Thu, 3 Oct
 2024 20:01:43 +0000
Received: from CH2PEPF00000142.namprd02.prod.outlook.com
 (2603:10b6:610:e5:cafe::2e) by CH0PR03CA0254.outlook.office365.com
 (2603:10b6:610:e5::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18 via Frontend
 Transport; Thu, 3 Oct 2024 20:01:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF00000142.mail.protection.outlook.com (10.167.244.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8026.11 via Frontend Transport; Thu, 3 Oct 2024 20:01:42 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Oct
 2024 15:01:39 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 3 Oct 2024 15:01:38 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Harry Wentland
 <harry.wentland@amd.com>
Subject: [PATCH v6 11/44] drm/colorop: Add atomic state print for drm_colorop
Date: Thu, 3 Oct 2024 16:00:53 -0400
Message-ID: <20241003200129.1732122-12-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241003200129.1732122-1-harry.wentland@amd.com>
References: <20241003200129.1732122-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000142:EE_|SN7PR12MB6929:EE_
X-MS-Office365-Filtering-Correlation-Id: 037efddf-73e4-4ef1-9283-08dce3e63386
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4iG650huSE5oMtJYHtgylidDa/tJtVRkXp6MNywiBljm3d4eJMWTFfSX02vN?=
 =?us-ascii?Q?WmbK21Kt1tRjWJmIoihju1YvnyTAaaqBLfXQcXnQBCTVzQr4rbeZkxaX4r5k?=
 =?us-ascii?Q?d2BGdh0Z4QENoSOiEznkQWLzNky3o/jq0/43nteKYS7qQMdJgJ6HnPuZYcE+?=
 =?us-ascii?Q?nHe9MeruwqzQ57gqAhpYsCyHxO4dQ4ZOTaAl05VKJbOt08PWl8wE6iXbFNBQ?=
 =?us-ascii?Q?Po6y2pAsy6N0j9YNGWXmg0JqgZLRkDDydEAMynl/kpyC52JSqGEF46ARoWLL?=
 =?us-ascii?Q?3mhot5qTw5FFgVI6aFXFpunSxJokG1zJ24m2DfJrtQs/XTGTsyU43SU0/2Z5?=
 =?us-ascii?Q?+iPGhkdABBA0IjRXVK7N13G9Y07k2Yrk/x0Fvt6wKVuVfKxxJWvUQX9qzMrq?=
 =?us-ascii?Q?wCKs4wzDzozG0ge1EhJuVAf8o5DQy3v94X+XyQetrlpvxDYYAIuTC+HI4pcL?=
 =?us-ascii?Q?/YeWS1GVMLdicqQHTRR3/C1EotQI9iRONtN4qpaDwcTP2DxTwk8k0osJ5bv7?=
 =?us-ascii?Q?gQMNt4+Uxf81t9dM2kTiw36L04GSEejS5Ar1IXPwm+TI1qL9bfg4WMkuzvDD?=
 =?us-ascii?Q?dKq29S8tcDUhCyJCAtRSn7ULL2/P+KDUIdwnrUjB+NDZDfLnO4H2j5R/61Gf?=
 =?us-ascii?Q?esGdG0l47R21suKgkUzpnWmK5N7ItaycAV0+eQqljiakHewKFaMbt1EhdPIW?=
 =?us-ascii?Q?PxbgE3/0WgZjd0dUBURizheeW6A1TQgGIjtFppLrYbhhZn8V8GhdJW6IlgPL?=
 =?us-ascii?Q?oDot4bD5vCvxAWb54oLZOmEH+iFCfBachgLEeHQNAoGAAGLkyQL3pu8cHX8S?=
 =?us-ascii?Q?yAiJHxjtlYJiztQtAOKy8N1WcEuI+ht4Pm9QlX9jA1UsK1wjveHbTJjf18kr?=
 =?us-ascii?Q?usZuthbcNrIuYU9DlJoG5O9FRFuF2UsTZlCqfl1BatAekb+DTjY+bqEgyNHy?=
 =?us-ascii?Q?tnI7OqAhMQe3MIvZ49Ms0t2r7ZR2ek1lwokI37Q8jv/4lV+2pvlBzgn6xl1e?=
 =?us-ascii?Q?U12XaDvdOCJFt/gLvtHWfyHsY+zI3MjLhOGsuVF4mCrWfg+HDCMc3I4tnf4V?=
 =?us-ascii?Q?f3D8PtOyMjp6Udig5wKKiqm8l28Lt81J7yYozXawyE1okn/o7GM/SdYUURQI?=
 =?us-ascii?Q?EObU2Em+b/u0vkpLK8YhuT08nQzadcwOgrE0nYcOH4CrKagDyjkSEcG5WaCg?=
 =?us-ascii?Q?E0xFQSOX1m4abaDaeM81SXu04sWLPJnVlvVZmdZVG8U3DFG09OfOPpyBuA3p?=
 =?us-ascii?Q?t0/fjHaHYLecfyq8nPFI9amYnewUu0YPGfS/sAQlOEmCj0yyph+aOeAPMygj?=
 =?us-ascii?Q?oF7HwpysPE7/GLPyZmdjdakiPm+PI1R4rAfEkWTpN8is0Lc9Ya3TDpIAtN7b?=
 =?us-ascii?Q?ZGv5bus=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 20:01:42.5270 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 037efddf-73e4-4ef1-9283-08dce3e63386
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000142.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6929
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

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 drivers/gpu/drm/drm_atomic.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 44c5b5dd8b33..0f4eba51ee4b 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -777,6 +777,19 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
 	return 0;
 }
 
+
+
+static void drm_atomic_colorop_print_state(struct drm_printer *p,
+		const struct drm_colorop_state *state)
+{
+	struct drm_colorop *colorop = state->colorop;
+
+	drm_printf(p, "colorop[%u]:\n", colorop->base.id);
+	drm_printf(p, "\ttype=%s\n", drm_get_colorop_type_name(colorop->type));
+	drm_printf(p, "\tbypass=%u\n", state->bypass);
+	drm_printf(p, "\tcurve_1d_type=%s\n", drm_get_colorop_curve_1d_type_name(state->curve_1d_type));
+}
+
 static void drm_atomic_plane_print_state(struct drm_printer *p,
 		const struct drm_plane_state *state)
 {
@@ -798,7 +811,8 @@ static void drm_atomic_plane_print_state(struct drm_printer *p,
 	drm_printf(p, "\tcolor-range=%s\n",
 		   drm_get_color_range_name(state->color_range));
 	drm_printf(p, "\tcolor_mgmt_changed=%d\n", state->color_mgmt_changed);
-
+	drm_printf(p, "\tcolor-pipeline=%d\n",
+		   state->color_pipeline ? state->color_pipeline->base.id : 0);
 	if (plane->funcs->atomic_print_state)
 		plane->funcs->atomic_print_state(p, state);
 }
@@ -1842,6 +1856,7 @@ static void __drm_state_dump(struct drm_device *dev, struct drm_printer *p,
 			     bool take_locks)
 {
 	struct drm_mode_config *config = &dev->mode_config;
+	struct drm_colorop *colorop;
 	struct drm_plane *plane;
 	struct drm_crtc *crtc;
 	struct drm_connector *connector;
@@ -1851,6 +1866,14 @@ static void __drm_state_dump(struct drm_device *dev, struct drm_printer *p,
 	if (!drm_drv_uses_atomic_modeset(dev))
 		return;
 
+	list_for_each_entry(colorop, &config->colorop_list, head) {
+		if (take_locks)
+			drm_modeset_lock(&colorop->plane->mutex, NULL);
+		drm_atomic_colorop_print_state(p, colorop->state);
+		if (take_locks)
+			drm_modeset_unlock(&colorop->plane->mutex);
+	}
+
 	list_for_each_entry(plane, &config->plane_list, head) {
 		if (take_locks)
 			drm_modeset_lock(&plane->mutex, NULL);
-- 
2.46.2

