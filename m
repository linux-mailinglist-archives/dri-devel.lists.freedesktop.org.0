Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 669D57E5B5B
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 17:37:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F0DD10E7B4;
	Wed,  8 Nov 2023 16:37:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2078.outbound.protection.outlook.com [40.107.220.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65A4010E7BA;
 Wed,  8 Nov 2023 16:37:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ASn5jyMkGqsg/bWxO/PvSUAa1WgqbI+teUSXHXZkD43hmdWg/KYnIIemimz8qPH15glheV1D/NWXuYLLAD7mIofnoWr9UkuLBB9+RE0Io6TSUHklqP1XQYPuRJmsvLHme7BYkMP3TiBtFTvBy4+wgG5PNWKhYNy5D9k9mpDRB7Jr/tlQIlf+ZN6HCjISihdazz7FZden3ECBaFvuA5GaUUVih5QRo4fXXcLa15afWMfgWfiYLuJ1jVs1/4/SV4XuVH+HdAI7YJuSQWvIgs8HL9DYkE1V3/7pt0lLZe0/eFZjPgmWXTe5GdGbBJh5u6mVZEXWttn3DDqyaq26Efiebg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aktAoZ2n7+qsXdm8HvMyH/i4ENHneOlBceDZgNYBE3o=;
 b=hCKI0OGiNPBZk1AuuVv4RZMkI49X3M5bT4iTGy+zXuA90G1Z+yJ5mUsIzMe9COC0eofTzsL5xqdyNZR1Jl3eixZzUFoCXVfEUlySKP/QadsXP0qpnFpuebO5MfRn3p/FaoSdjUZVuBpFLGOIVE+7+EPbuQYo6WwyNXMZ0L8tscjRneJKHZwnvfghJSCtAHRRWEy7WgJl76CyYNgViEKjCyOYXCf0m9dWfEylK4vzcTQuStuQtpij7h3wPAD7a+Ff/vY7l3zXolPRRSoBt9Ud21I8udOLFIgeMutUl8OI+RclWL6vo/YbjOJPH7U8h2HqWTldeiEs7IuCkqzOnjSMKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aktAoZ2n7+qsXdm8HvMyH/i4ENHneOlBceDZgNYBE3o=;
 b=3rzVXKL8trURavvd+1+IdaFHMWOXLbhKgVb2HwROc0GM4gw2CvwZzRkfCkLrVvyJWC3Usst/HWRPSTG2bOu70sIcIn8AofuytrcVR2eeFHK1+Eaxi22Wu1AmrncAXZz/AxNDfw8Df4t03CNr6byHRdAM9ukZn8Tr8psQSGd1j1Y=
Received: from BL0PR05CA0001.namprd05.prod.outlook.com (2603:10b6:208:91::11)
 by PH8PR12MB7229.namprd12.prod.outlook.com (2603:10b6:510:227::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.18; Wed, 8 Nov
 2023 16:37:16 +0000
Received: from BL6PEPF0001AB51.namprd04.prod.outlook.com
 (2603:10b6:208:91:cafe::25) by BL0PR05CA0001.outlook.office365.com
 (2603:10b6:208:91::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.18 via Frontend
 Transport; Wed, 8 Nov 2023 16:37:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB51.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6977.16 via Frontend Transport; Wed, 8 Nov 2023 16:37:16 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Wed, 8 Nov
 2023 10:37:15 -0600
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Wed, 8 Nov 2023 10:37:15 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH v3 10/23] drm/colorop: Add BYPASS property
Date: Wed, 8 Nov 2023 11:36:29 -0500
Message-ID: <20231108163647.106853-11-harry.wentland@amd.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231108163647.106853-1-harry.wentland@amd.com>
References: <20231108163647.106853-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB51:EE_|PH8PR12MB7229:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f14a297-8396-4422-2204-08dbe078f7ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zqngwp9s0oQuQYPBCgtTFBnjVOVJbX2aQvXwB5PgotwQOK+zjnNSAEVXnS4/9SwrFmOsekEQ8IO/ToKhW8PYKUlLvPXpc0YxInR2hc7aqi3XA2zHuOxfFudukDDIrN8mqEZJn0VzdxC7hibcGEfGMwWraN/D57O+ddmJAVDlS4xwpdw8+ATLSqYvrVnak3pIV4cjmpPzYn7Emjz2mtiDYMVIVRulxd9EHBYmIctEx+B7GT3wiU3E0rlOe7c9JI0ntMyud6YizN5cVyyp75WC33EF8Qly+gdc+ezF8C7gBnOEzFEo+Pjr7CxDiMTore7N8qJlpRirmEaQH2B4lhwosWzDUp4dw/8yTwPqGdmGEm2U/a8/049lR2xdoKNCE4xOYbBveJhbxCVQ7BxaX63OApw8HYNyjSoHO0eQpJdKuuDuMZMNMi8sROdeg8kZ7QtE47xEOptAvB9NUJlq4XvygxK/9bHemZrTGZHGe+YChd5HfxnmXIZlW21dJR5EZ6tcpoIGuFCrZJw/GjtM8jUbr8aCsjX7sM7bUGhZey4HMwh4nPErhFO0I2I1LakptcATCfLgvxQeMk3Oq9P8t+wpXoLMgNsjVFeTyba/hm9st9rtW2qQxuI26LMV/102FvsTNvxfs0luOMga7P9Eu3B56dK/818A/oiRXbvwDao8iLKdg+4uLwAG/93lh3NN66xcHwerau0LzV71LeGgSjSEkJZaSNZBdgCRKs8VbaMLIGQXjuj2F+xvA+u9DeIq947Dxe3v7a8UVtkdZ49iatjSPg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(396003)(346002)(376002)(39860400002)(136003)(230922051799003)(64100799003)(82310400011)(186009)(1800799009)(451199024)(46966006)(40470700004)(36840700001)(2906002)(44832011)(40480700001)(5660300002)(36756003)(40460700003)(6666004)(36860700001)(41300700001)(450100002)(478600001)(8936002)(4326008)(8676002)(316002)(86362001)(81166007)(82740400003)(426003)(336012)(83380400001)(356005)(2616005)(70206006)(47076005)(54906003)(6916009)(70586007)(1076003)(26005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 16:37:16.3086 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f14a297-8396-4422-2204-08dbe078f7ef
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB51.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7229
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
Cc: wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We want to be able to bypass each colorop at all times.
Introduce a new BYPASS boolean property for this.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c |  6 +++++-
 drivers/gpu/drm/drm_colorop.c     | 15 +++++++++++++++
 include/drm/drm_colorop.h         | 20 ++++++++++++++++++++
 3 files changed, 40 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 52b9b48e5757..a8f7a8a6639a 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -670,7 +670,9 @@ static int drm_atomic_colorop_set_property(struct drm_colorop *colorop,
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
@@ -690,6 +692,8 @@ drm_atomic_colorop_get_property(struct drm_colorop *colorop,
 {
 	if (property == colorop->type_property) {
 		*val = colorop->type;
+	} else if (property == colorop->bypass_property) {
+		*val = state->bypass;
 	} else if (property == colorop->curve_1d_type_property) {
 		*val = state->curve_1d_type;
 	} else {
diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index b1c271f90a16..17ba11ae205b 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -78,6 +78,18 @@ int drm_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
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
 	/* curve_1d_type */
 	/* TODO move to mode_config? */
 	prop = drm_property_create_enum(dev, DRM_MODE_PROP_ATOMIC,
@@ -100,6 +112,8 @@ static void __drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colo
 							struct drm_colorop_state *state)
 {
 	memcpy(state, colorop->state, sizeof(*state));
+
+	state->bypass = true;
 }
 
 struct drm_colorop_state *
@@ -151,6 +165,7 @@ static void __drm_colorop_state_reset(struct drm_colorop_state *colorop_state,
 				      struct drm_colorop *colorop)
 {
 	colorop_state->colorop = colorop;
+	colorop_state->bypass = true;
 }
 
 /**
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index 965db7ec488f..053d1aa72e1b 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -44,6 +44,14 @@ struct drm_colorop_state {
 
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
@@ -131,6 +139,18 @@ struct drm_colorop {
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
2.42.1

