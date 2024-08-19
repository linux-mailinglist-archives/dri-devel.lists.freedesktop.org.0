Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F849575F5
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 22:57:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7401610E385;
	Mon, 19 Aug 2024 20:57:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="d+fZ9lLn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2075.outbound.protection.outlook.com [40.107.95.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E715110E378;
 Mon, 19 Aug 2024 20:57:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vXg1tBqYuU1e21mLcaGYL/lyHlSc1+cm2jAinFATEQeANFeptWtKBqttejoZL0NZqhuEEJYbBEsgR2baEDCl7h+Z+1DsI39Kl93VGneutO4WndDPJq7O83yOpjqki6vTydPGRSjV7YG3jXOT+Tl0UM7tFSJFSXdUhA5zlDTRwACZJprqq7DrJBCmkiMI2HkARPlf1+RvBYHlJ0Xfll7iv2awHxQjtiPAXcoyTZcGVCqA5vRJypFqlB39c7A5l45CInK9OMIHT5PZm4tt5+Ee6avitjlBY1+/JHT8KtfL7RPLeXCYFtnLuF/p5Vj+d8gy5LRgfHsslnK6ztn1FsJ/Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7pcVXOXxdArn0g754GSkOsq+GKw8EcQVPDkKI54zy1o=;
 b=SXyf4TM7AKH4LsHVZMGlwuESH7igMt/tr7l726hVLGWi82d7e+d9f1UCvZp7rxhdqAwmuiL/gJRDzyjuC7gAR/2y9EJ0u9yXJalmLPJhQyoZr7VqYAZtUo1FbQD1RGzWq3b7d8jkCebmoBW7L9e7PyCw1Q3OMIKJYptnJclQBMnwVRBRN250Wdj6dkP8ovFoF2/KfF4dO3SY6OaF9K8TZhz/yZWiC7uq1m7QSL/W2P+HYwA1briY8sCjuwf075e1W92SLhN6FCdCpiC1Alc9SjfI/aE3hNqRkCb8iGPS+TSgGAUyc0zTGd/PACWCESCUoQ7BrGtP42C7sYU9Oy3M7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7pcVXOXxdArn0g754GSkOsq+GKw8EcQVPDkKI54zy1o=;
 b=d+fZ9lLna2oZaqk2R4y8VJJeCgX1dJ6vq6Mp04/2fb0lpuaKESTbMOusg767xYU3pJGoOW7vmN4goOrmzAjfXVWHuX4zVN+nC31LwiIJ3QheSJj3Enm6gCZ9gHlhzNoFhqnGj4PtiIQUwGv1Gv38qDaTmJ+4RwJXGGyPEVs2mSw=
Received: from BN9P221CA0024.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::23)
 by IA1PR12MB6161.namprd12.prod.outlook.com (2603:10b6:208:3eb::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 20:57:27 +0000
Received: from BN2PEPF00004FC1.namprd04.prod.outlook.com
 (2603:10b6:408:10a:cafe::47) by BN9P221CA0024.outlook.office365.com
 (2603:10b6:408:10a::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Mon, 19 Aug 2024 20:57:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FC1.mail.protection.outlook.com (10.167.243.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Mon, 19 Aug 2024 20:57:27 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:57:26 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:57:26 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 Aug 2024 15:57:26 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Harry Wentland
 <harry.wentland@amd.com>
Subject: [PATCH v5 13/44] drm/colorop: Add NEXT to colorop state print
Date: Mon, 19 Aug 2024 16:56:40 -0400
Message-ID: <20240819205714.316380-14-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819205714.316380-1-harry.wentland@amd.com>
References: <20240819205714.316380-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC1:EE_|IA1PR12MB6161:EE_
X-MS-Office365-Filtering-Correlation-Id: debee3fc-12bb-4dd2-db78-08dcc0918893
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QpJVX5Hw+XLYJ/RK4v35Ax/o/Yk0KpheMTCP91iC0ENNLXrbi2OvcjFJSZ8k?=
 =?us-ascii?Q?ZdpJCcuS+/2Yw1z2kRIzhji2c7LwLV3WUzZMGRIV1Fm7ccx0SBWzbscwllY8?=
 =?us-ascii?Q?YZdvfPJtaCdTwwiwiQM0kPW2LVCnGSO3UDjbfs+GqsTP+k6dTaGBFXd7ZrbZ?=
 =?us-ascii?Q?2BloChsXCvgP5fcEQ3ZTnF60seSVP1ITsFLuE3PIoYEXoOZU3gLbM95Nnqdm?=
 =?us-ascii?Q?gIFgvD39D3RX/CpFW/0tBqRo50ntqzyrfzAZpSnPncPjlNSF+jGovF4cW2V/?=
 =?us-ascii?Q?1Gb0nfGVDuySU+XpbNQLdKvf/CqCbhPVTiVGSBCC3Mv2pMCoxF1HXsGnjDhi?=
 =?us-ascii?Q?ZnO1Wl3ag1RPg5ARPFvuPAJXRSUAKNUDHyTkPaosscye95RpPBaYGrTp0sXp?=
 =?us-ascii?Q?fV7z0kbhhZmLVZrmlOm6Xtyra/xNoqLk4zxQTJrQFsLM3lLXe4zU4yBUMeM0?=
 =?us-ascii?Q?xRMTmnXOijTr6Du+VGo4uDsswCu7cduIBOAMM4aEdVUeblP87AsqelHpsJ9N?=
 =?us-ascii?Q?64VaE7DlznK0MkQNy9cLPulKnt7zdAthtr1FcCvblnNsPDOR0PANrKED56+a?=
 =?us-ascii?Q?zqK385dC1zmcsT082tCsl24dWD9PzgTm+Yt3AVcklRAZdZKPPeNBM3hkPvbQ?=
 =?us-ascii?Q?adW3yHnaUAwTGNhQHvT9b1NJlFV2XAbHQjy/gUQK3apDiniobYa47MiGBrFY?=
 =?us-ascii?Q?7+LM2cpgarQxn8uuPGwg0N/a752wmeVoTuVqWe02/uLf/yaEThhoPXdx0K/r?=
 =?us-ascii?Q?rtSo+8J9XGC5ILB1gG/NaPadygjh0zRzUPuwRJJPQMEUxCR71pPU2b8AglyS?=
 =?us-ascii?Q?dDHdwhX4DPIhVfXUCWcNQTUUhv8sXwJKchpRXSvofxZ3LcUdAl9ZRZQwX3pu?=
 =?us-ascii?Q?ZFuKV40q5e0V5A6Bk/Q9VZi2HfIAAyPKqsE3kW3i0z8awbCQEskwOf/6rurI?=
 =?us-ascii?Q?6h7yVYiPNQWyyCkaU6CA+WscRZpptcMsmWMv+ZnqU2nP7CJc5CW1iBW5I6Tb?=
 =?us-ascii?Q?1rDDpHBr9l9jzzjT2Bq845nq3i9OahEwSZZI7J3IYIjmPZ0v3xECtX9F0YRg?=
 =?us-ascii?Q?VQu+HAbj3WelkcyR2Q227CYzxhuf5erQNp704PEUhFaDaJw3hF/0Z6OQDRc9?=
 =?us-ascii?Q?f+TeHSOz/G05Pa/VfvHxhcn+mWzY260ZyBHzHe0K8N9VNVIHnZmeQqq6CWvG?=
 =?us-ascii?Q?fo3ZP+LPIr4IPepDNyooHqsGTzn3+ZTy9+Tsls6Q5dqFx2qjVj1OyohBH8CH?=
 =?us-ascii?Q?2s8ZZbRReDiXhOaqLXY13JucZnYaKyn4Dc6HCOLeZWwuJsLK9Pdo7j9kRGVv?=
 =?us-ascii?Q?frKsEK3LVLxEo2wI1i+T6Yjnu8642wS+bMugmY5GYmLMZbE3aP1M+3NTNDR8?=
 =?us-ascii?Q?iFmjSe/xs1TZXXqT7GoPliAbKTjzWTe6xNk3V8YQJqUCtuksrd+qgNm5LxOw?=
 =?us-ascii?Q?1XjY5sdoAE4=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 20:57:27.3325 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: debee3fc-12bb-4dd2-db78-08dcc0918893
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FC1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6161
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

v5:
 - Drop unused header definitions

v3:
 - Read NEXT ID from drm_colorop's next pointer

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 drivers/gpu/drm/drm_atomic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index d333433319f6..9919a6f1092f 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -791,6 +791,7 @@ static void drm_atomic_colorop_print_state(struct drm_printer *p,
 	drm_printf(p, "\ttype=%s\n", drm_get_colorop_type_name(colorop->type));
 	drm_printf(p, "\tbypass=%u\n", state->bypass);
 	drm_printf(p, "\tcurve_1d_type=%s\n", drm_get_colorop_curve_1d_type_name(state->curve_1d_type));
+	drm_printf(p, "\tnext=%d\n", colorop->next ? colorop->next->base.id : 0);
 }
 
 static void drm_atomic_plane_print_state(struct drm_printer *p,
-- 
2.46.0

