Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4315886827C
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 22:12:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAE6010F022;
	Mon, 26 Feb 2024 21:11:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="PXYAYhV/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2058.outbound.protection.outlook.com [40.107.244.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53BF510EF0A;
 Mon, 26 Feb 2024 21:11:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TmIorT8K/vpQx0KBcwmzxPt/+aJntf7ulIR+kht3Kb3VRHEliOGcwLGs14v5HiNj3aP82XA5KhyE0CrFNjBMrpw6/3K0nUHU7Ofs2//wfQWju4QWLn8NpS+TI0l7vlRltxzvZIpOLankXtz+Y799zacNO6Xvcdqli1iEUGLzIZGnwDBKq9V/3h4VcV5gIQ1mITfSZRMCcpMZF1fHv8M5GbwCp1IU9MT3uPIgQsa/+ZovjJmO6dp3eHfl4xKGaSlvw2PaUXPwD0pcaYlzWT2KwhUTxrbl8O3XpnoZbbfE/b6hEl1ZRgHLEL2ck0ZbjZcbbR9A6WJOQ4sZLTvJiZNgTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DCLXVaAxtlQaCyA/mVOFugg0Y6oAGUD6EGdp2mnh+sY=;
 b=MjAWO52AoPUACcNb3s+B/nhN8ENt64VYAugw/tjYxkr4IS83+QP6orn0pCEATjrjdZcSHAC7uSyEXVto8mMzj2cj7q6Sr71po/67VGemRrOfbf29Zk2t9J+wqXz9G1hFEos5mkCYgru7c4K9Zmbf9z2m1OlP4ARdJQTaPNelUjkFzceoh3O1BVCxFTaR5lsAqtLLikNAVfPr0AyBqFszdkY1XYk56YsuhU7xS6QlGrdRQwY9YuFZT47D57vbHc2BMKWnyC6wy8WF7TCd1biPnZEAv98zvuuSeuPYXwU3uqwtazViFwR3wGrqoJAG2gOyC66JCrpAIPg1WmnUF2ovmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DCLXVaAxtlQaCyA/mVOFugg0Y6oAGUD6EGdp2mnh+sY=;
 b=PXYAYhV/QLWMehrot047BMKflO7grxkksWcTuSIcK3nv52jc4U/egyxcgIyadzciasARa/d+EEnQorjD6bNe4tF5Y0orcPzzWvvrzYd/3cWT7JoOkrtmb9jEI4PJzQ2I/upMOmeni20yM4JX18v5BG+4dLvEKhaZVUqv9GPiuAo=
Received: from MN2PR16CA0010.namprd16.prod.outlook.com (2603:10b6:208:134::23)
 by CY5PR12MB6276.namprd12.prod.outlook.com (2603:10b6:930:f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.34; Mon, 26 Feb
 2024 21:11:15 +0000
Received: from BL02EPF0001A105.namprd05.prod.outlook.com
 (2603:10b6:208:134:cafe::7d) by MN2PR16CA0010.outlook.office365.com
 (2603:10b6:208:134::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.49 via Frontend
 Transport; Mon, 26 Feb 2024 21:11:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A105.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Mon, 26 Feb 2024 21:11:14 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 15:11:13 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 15:11:13 -0600
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 26 Feb 2024 15:11:12 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Harry Wentland
 <harry.wentland@amd.com>
Subject: [RFC PATCH v4 12/42] drm/colorop: Add BYPASS property
Date: Mon, 26 Feb 2024 16:10:26 -0500
Message-ID: <20240226211100.100108-13-harry.wentland@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240226211100.100108-1-harry.wentland@amd.com>
References: <20240226211100.100108-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A105:EE_|CY5PR12MB6276:EE_
X-MS-Office365-Filtering-Correlation-Id: 1badf323-3186-4066-dfe2-08dc370f7777
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J+hcTeIc3SvDaHw/Wy0UYYKDfZ5DS07+JmHN7TIWX6upOSVuD2B7vG4eKFyMnLqKDMlXT7uikajPP8FxhcAWJKJx2uGVPGIDhv9uJ3RWXQ+Uo6mG4/Erv3WY8/kSIMhE0HxiWPA/Sl6tlAnF3KiIBWtS59Rzmcp7/zLSZVk3yYFMidlj1R+6piYSFbYQttqWAxYjdxW/3Cx8ckypRCLbgfxhv36h1sI5Eu8iyqEg4wszPg1OgYiWT/opo5v3GUPPyIx3xBNePwMfUOQ8omsE/QqMbk3XdgmceSWFdI2pxnVuXHd0gxvpu7++j8npO+fWgRpUUhlmB31f5MCmtZ/FRjK006a3hQckIcVHgalRTJiXFJHk0fGHpuRRvrLKGgtI7UGlIISuRttt+WdSHVrZHy9nQG+Et6xvNwA8utC4EE04lsZ7dYf8SmUORxJ6srdlnLYcw/mOzkiao5L+nF6fAkNZq0LyueFSChU8T2RTgSF+AqeVSoMdOjuQUD/zVYWq4MYNM9GJ06PMMyii5aPJ/5wZgeeW6VzRneEu0jyIt4porxkjeAUqiHfNg9erCPEeDWizjGE4Xunr4V39VdufaJjdggrrjPgb1Wvbpkwf40j2asAZqrIfY3lGf/S+CYkjjZTDI/xb7+UmLIXi5FMqvbTvGJgnGWhjTYk/lCLOL6uu90RQzutE/YtKAXvIy3GbRzVlf1kH+ccHzFu49SLbPXH6lyyPA252vTd2e/k6kTI/68fL85NC05fFf4vHPqt/
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 21:11:14.6431 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1badf323-3186-4066-dfe2-08dc370f7777
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A105.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6276
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

We want to be able to bypass each colorop at all times.
Introduce a new BYPASS boolean property for this.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c |  6 +++++-
 drivers/gpu/drm/drm_colorop.c     | 16 ++++++++++++++++
 include/drm/drm_colorop.h         | 20 ++++++++++++++++++++
 3 files changed, 41 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index fdd540cfe24f..87f00131be11 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -648,7 +648,9 @@ static int drm_atomic_colorop_set_property(struct drm_colorop *colorop,
 		struct drm_colorop_state *state, struct drm_file *file_priv,
 		struct drm_property *property, uint64_t val)
 {
-	if (property == colorop->curve_1d_type_property) {
+	if (property == colorop->bypass_property) {
+		state->bypass = val;
+	} else if (property == colorop->curve_1d_type_property) {
 		state->curve_1d_type = val;
 	} else {
 		drm_dbg_atomic(colorop->dev,
@@ -668,6 +670,8 @@ drm_atomic_colorop_get_property(struct drm_colorop *colorop,
 {
 	if (property == colorop->type_property) {
 		*val = colorop->type;
+	} else if (property == colorop->bypass_property) {
+		*val = state->bypass;
 	} else if (property == colorop->curve_1d_type_property) {
 		*val = state->curve_1d_type;
 	} else {
diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index f4740b6115d1..29979816a2d1 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -80,6 +80,18 @@ int drm_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
 				   colorop->type_property,
 				   colorop->type);
 
+	/* bypass */
+	/* TODO can we reuse the mode_config->active_prop? */
+	prop = drm_property_create_bool(dev, DRM_MODE_PROP_ATOMIC,
+					"BYPASS");
+	if (!prop)
+		return -ENOMEM;
+
+	colorop->bypass_property = prop;
+	drm_object_attach_property(&colorop->base,
+				   colorop->bypass_property,
+				   1);
+
 	return ret;
 }
 EXPORT_SYMBOL(drm_colorop_init);
@@ -123,6 +135,7 @@ int drm_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *coloro
 	/* initialize 1D curve only attribute */
 	prop = drm_property_create_enum(dev, DRM_MODE_PROP_ATOMIC, "CURVE_1D_TYPE",
 					enum_list, len);
+
 	if (!prop)
 		return -ENOMEM;
 
@@ -138,6 +151,8 @@ static void __drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colo
 							struct drm_colorop_state *state)
 {
 	memcpy(state, colorop->state, sizeof(*state));
+
+	state->bypass = true;
 }
 
 struct drm_colorop_state *
@@ -189,6 +204,7 @@ static void __drm_colorop_state_reset(struct drm_colorop_state *colorop_state,
 				      struct drm_colorop *colorop)
 {
 	colorop_state->colorop = colorop;
+	colorop_state->bypass = true;
 }
 
 /**
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index 539db900f16f..28aa5c1c309e 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -45,6 +45,14 @@ struct drm_colorop_state {
 
 	/* colorop properties */
 
+	/**
+	 * @bypass:
+	 *
+	 * True if colorop shall be bypassed. False if colorop is
+	 * enabled.
+	 */
+	bool bypass;
+
 	/**
 	 * @curve_1d_type:
 	 *
@@ -132,6 +140,18 @@ struct drm_colorop {
 	 */
 	struct drm_property *type_property;
 
+	/**
+	 * @bypass_property:
+	 *
+	 * Boolean property to control enablement of the color
+	 * operation. Setting bypass to "true" shall always be supported
+	 * in order to allow compositors to quickly fall back to
+	 * alternate methods of color processing. This is important
+	 * since setting color operations can fail due to unique
+	 * HW constraints.
+	 */
+	struct drm_property *bypass_property;
+
 	/**
 	 * @curve_1d_type:
 	 *
-- 
2.44.0

