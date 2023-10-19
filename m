Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9AD7D03CB
	for <lists+dri-devel@lfdr.de>; Thu, 19 Oct 2023 23:22:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAF0A10E54F;
	Thu, 19 Oct 2023 21:22:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2088.outbound.protection.outlook.com [40.107.220.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5327410E54E;
 Thu, 19 Oct 2023 21:22:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IT6KBqZSBbmOjBR5AIRfPy1uIU0W/4CgWUvO+gpnsKbopHIvv+HUil2/PUOkNUSMq2ZGGrK0Q/NP9RZWCMRzmdTOQAolUoNQEbuYj8sjIJOXqf7oAwXasLrnZwhTNnL+1U/dRctf/Iose6TvvATlm1L3Xvsq+wo7iQt4YoRiFddSDfNLYdrMcJJuZds5VAUqU2E60fuMn3TYnZG+B1N0ksyBZb0LMB1cSq1wDP7p4thjquY7/bbI/TnYxotpyxhwLNywt7O21MNKsl60/PfHQ1YW9T0VHYv1RaUrIvDv7vZus+0DdtTJTacetuVs270+CuW25WL+xShIQaNhHA2X9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PvqBuDZKsZAMSJwz8uK2Ce4ZPJm1dhfFntbefpf4QyY=;
 b=GxRdNq35p9tEFa27UhJ9EroSP3ENPcQewcKK9a3nNgiiMWx4gJ3CkewlB+y2ECjhRGveKI+3UTPgWp6uQRehiUEe4eo2/hsOuT7KHs8CDblzdrFDecMJJ5y/wgfGhNm6KRBZH/llAHosRPl+f5U1skL3BVAdZTuMQ/d9RxgOw19kvnP7eRzyY0XX+KBNeDDU+NuWTb6RXTGyJ40+chCgM1Iuo7F2tDkMCf6fjAkurA5zmlhY+XaFb1I1b8qrOIkiFLGDedqHzHrRpwWvOZFq7zWmfC0WLC6KaJQV2qOLteUvWYNsP9FphFDHj9CzvIduu/ufEArCcYLALyDvpE1UUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PvqBuDZKsZAMSJwz8uK2Ce4ZPJm1dhfFntbefpf4QyY=;
 b=weXdXNIaebtF8mIVW2PHaIap4HOsUd3an+bpNpilaMe+t9yF1T4AAt1ocAxKUe5N21BJ5KSXj7S7by59B14j4qJ8ksozSdRBuUBg1wWxO2QBtO6/3C5HFpC+IClJaiu1lAUwKknAT9Wr6YLioo9cyDPfrextHGNwcDukbhgHcpA=
Received: from MN2PR16CA0037.namprd16.prod.outlook.com (2603:10b6:208:234::6)
 by MW4PR12MB7240.namprd12.prod.outlook.com (2603:10b6:303:226::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.25; Thu, 19 Oct
 2023 21:22:43 +0000
Received: from BL02EPF0001A108.namprd05.prod.outlook.com
 (2603:10b6:208:234:cafe::55) by MN2PR16CA0037.outlook.office365.com
 (2603:10b6:208:234::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36 via Frontend
 Transport; Thu, 19 Oct 2023 21:22:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A108.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6907.20 via Frontend Transport; Thu, 19 Oct 2023 21:22:42 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 19 Oct
 2023 16:22:38 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 19 Oct
 2023 14:22:02 -0700
Received: from hwentlanrmb.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Thu, 19 Oct 2023 16:22:01 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH v2 10/17] drm/colorop: Add BYPASS property
Date: Thu, 19 Oct 2023 17:21:26 -0400
Message-ID: <20231019212133.245155-11-harry.wentland@amd.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231019212133.245155-1-harry.wentland@amd.com>
References: <20231019212133.245155-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A108:EE_|MW4PR12MB7240:EE_
X-MS-Office365-Filtering-Correlation-Id: cafdb6cf-e631-4647-0141-08dbd0e987bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KLCknX/HB+8bUOX7U44oyqxI2adXqFXesfn72fMHFvxpRF/qQjyhkTYsgOCxrLq3JqE9XOZjEy3lv4FwSBbgxqvPcUeFfFZugLhLaxshsMnOhWPkcKiwNoYaxHl2849TdeADwE/4jEjLGP7EncS5P1uWe78nUQgnlLsauwm1kG8JD/3veY/zWgS4iKqXazPrlRr2/ByVxPx/yq1pBItDoBLytmboO5TbETe3to/KZ+x2/Nx0gGF0B+EnRV31/faOebvkp2zE3ADqsewiPoTwaA2PD71WbnwQZO4R6T7gFxRym+PHLNvXD8r10M89RBP6mI9ariUmm+TVdlMsgSbZupbqA5UYgStygIcTLot0/gAIQafnPStacp9o4aJAdn//9aLouzvBokH0R+cu1zHIR6KXscZQTV57I4xu+VdhIb0UthYUTECqQg4g50kfa5a91JKtuxhgkBx+RarPgL8EmqKHCnDrNpVhF0auZGv6clnRFHOxWAqFPu1lRVinkW6mxEtmgUPJRMDxGoWF4BRp72I3bbAL9uzUepPJeaiK+v3SNsEuAM+eWuNoriwd2xFPd2PvK9BmELvR1gtQA0zJobIlXp+aVNb4583zICd+VsqOgMzsusvdxoZiGhP6B95jOowH9gS5tG9/VTT77I9UX27hiIfPkZFOsFhpg4JWw0BTGhOoJssSykuVFWQ9yrIeN64iFFi6/L5F/aintwT+dNZZTqVnRM44r3iHI8wW5kHwMBXzbnASKLUGyB2nM48OR3N5mO1MBjU+DPQ1ntGvhQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(136003)(376002)(346002)(396003)(230922051799003)(82310400011)(451199024)(1800799009)(64100799003)(186009)(46966006)(40470700004)(36840700001)(40460700003)(36756003)(36860700001)(66574015)(8676002)(5660300002)(8936002)(44832011)(7416002)(426003)(336012)(83380400001)(26005)(1076003)(47076005)(2616005)(7696005)(6666004)(40480700001)(70206006)(70586007)(82740400003)(2906002)(4326008)(86362001)(41300700001)(81166007)(356005)(478600001)(54906003)(6916009)(316002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 21:22:42.5725 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cafdb6cf-e631-4647-0141-08dbd0e987bb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A108.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7240
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
Cc: Sasha McIntosh <sashamcintosh@google.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>, Victoria Brekenfeld <victoria@system76.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Arthur Grillo <arthurgrillo@riseup.net>,
 Sebastian Wick <sebastian.wick@redhat.com>,
 Shashank Sharma <shashank.sharma@amd.com>, wayland-devel@lists.freedesktop.org,
 =?UTF-8?q?Jonas=20=C3=85dahl?= <jadahl@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Naseer Ahmed <quic_naseer@quicinc.com>, Melissa Wen <mwen@igalia.com>,
 Aleix Pol <aleixpol@kde.org>, Christopher
 Braga <quic_cbraga@quicinc.com>, Pekka Paalanen <pekka.paalanen@collabora.com>,
 Hector Martin <marcan@marcan.st>, Xaver Hugl <xaver.hugl@gmail.com>,
 Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We want to be able to bypass each colorop at all times.
Introduce a new BYPASS boolean property for this.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: Simon Ser <contact@emersion.fr>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Melissa Wen <mwen@igalia.com>
Cc: Jonas Ådahl <jadahl@redhat.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Shashank Sharma <shashank.sharma@amd.com>
Cc: Alexander Goins <agoins@nvidia.com>
Cc: Joshua Ashton <joshua@froggi.es>
Cc: Michel Dänzer <mdaenzer@redhat.com>
Cc: Aleix Pol <aleixpol@kde.org>
Cc: Xaver Hugl <xaver.hugl@gmail.com>
Cc: Victoria Brekenfeld <victoria@system76.com>
Cc: Sima <daniel@ffwll.ch>
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Naseer Ahmed <quic_naseer@quicinc.com>
Cc: Christopher Braga <quic_cbraga@quicinc.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Arthur Grillo <arthurgrillo@riseup.net>
Cc: Hector Martin <marcan@marcan.st>
Cc: Liviu Dudau <Liviu.Dudau@arm.com>
Cc: Sasha McIntosh <sashamcintosh@google.com>
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
index 8d8f9461950f..ff6331fe5d5e 100644
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
@@ -100,6 +112,8 @@ void __drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop,
 						 struct drm_colorop_state *state)
 {
 	memcpy(state, colorop->state, sizeof(*state));
+
+	state->bypass = true;
 }
 
 struct drm_colorop_state *
@@ -164,6 +178,7 @@ void __drm_colorop_state_reset(struct drm_colorop_state *colorop_state,
 					   struct drm_colorop *colorop)
 {
 	colorop_state->colorop = colorop;
+	colorop_state->bypass = true;
 }
 EXPORT_SYMBOL(__drm_colorop_state_reset);
 
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index 7701b61ff7e9..69636f6752a0 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -48,6 +48,14 @@ struct drm_colorop_state {
 
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
@@ -135,6 +143,18 @@ struct drm_colorop {
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
2.42.0

