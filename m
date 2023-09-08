Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4328879897A
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 17:03:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D497910E8F7;
	Fri,  8 Sep 2023 15:03:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2075.outbound.protection.outlook.com [40.107.220.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5CB610E8FE;
 Fri,  8 Sep 2023 15:02:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A8IM+92HzmCsfVNdrR3CRlNWnp3hDH5vUq5SmDN6QpyRW/7Uo15qxKXAYAibQnrr08q5fgzc7i66FCTEBMrLZkaAnDPl1vVxCWFd1FOjN8tQ/RdVzV/GUvfxFAbN+5tUd9KRs5dYZBj5cyxZqU+30LVNruOZLYBGA6cSQTrEv93ng0altGfHxWDGqHdzMvSZnwER5E35ifJfUutnVYmV+0b/70wcK7jO2rlR+pNuQY7YHTq4pPfCXhNPu9I6husikSNG4QpJbm8AvRssBujzx++3SYQUYXzsl/fTzt9M6GY70mEucYtULTCanoRHr78hSrWDN3Mp9TJClxuVpUuupA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WcBeEZR24iop6aSPJ/uUkzZLABNZg8y7n2sE524BbH4=;
 b=bqShl9okSD+e+qx25qfFLalLCUR7Z9Y8lRvXh7qevJq0eDAhscghU1EaOSSdo21767bA3yVRy2BgVUT39cgRLuE3HJGwn5MJccHCT+ewe8B3d+dopIyw6sMrDt7s5SvWgRWWRmgVwEidaApQ/6ZrKWrcWJ0d4cKpbtHFCyKqW2Gk+MTXgDj2lz+VFKNalxeLDLx+3HUifKzH7aAZ4rRSUJudo8rbs5EOw908TZaKOXYOPrQQ5b9P2L9AbthuMxW5T58AQZXp5Xz80KEMvPGVB/8MRyVtJHfVRsqLrL3zU6NJkioEyIYRRU++5iEkmFRBADBJAuiUABr+435HBrcOFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WcBeEZR24iop6aSPJ/uUkzZLABNZg8y7n2sE524BbH4=;
 b=NzD46QfFytRY2lCWxn3MmDww9UHEmP+YVVKUt3JLx/Am1XpfosaUv0qVzt6WG+pM4bxvBSPsH2We/uBTv1+aaf16ob9T96P1HGu4ZW17xwg9kcvWCGTV2zyDbyDdNKFxanU6NdCveOQeJyblTOMP+a0mXIfHC1e399aFUgyNG4s=
Received: from MW4PR04CA0381.namprd04.prod.outlook.com (2603:10b6:303:81::26)
 by SJ0PR12MB6878.namprd12.prod.outlook.com (2603:10b6:a03:483::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Fri, 8 Sep
 2023 15:02:52 +0000
Received: from MWH0EPF000989E9.namprd02.prod.outlook.com
 (2603:10b6:303:81:cafe::c8) by MW4PR04CA0381.outlook.office365.com
 (2603:10b6:303:81::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.31 via Frontend
 Transport; Fri, 8 Sep 2023 15:02:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989E9.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.11 via Frontend Transport; Fri, 8 Sep 2023 15:02:51 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 8 Sep
 2023 10:02:50 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 8 Sep
 2023 10:02:50 -0500
Received: from hwentlanrmb.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 8 Sep 2023 10:02:49 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 07/10] drm/colorop: Add atomic state print for drm_colorop
Date: Fri, 8 Sep 2023 11:02:32 -0400
Message-ID: <20230908150235.75918-8-harry.wentland@amd.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230908150235.75918-1-harry.wentland@amd.com>
References: <20230908150235.75918-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E9:EE_|SJ0PR12MB6878:EE_
X-MS-Office365-Filtering-Correlation-Id: ef1bf953-3e93-403c-133e-08dbb07cac74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HgZTisgQU43NgA60IIlunKJeDZrjC/sqc+PbjC7SeGJsucaFX5ujZkf68O53I6hY1GC8yKTklSGlmTfRXsJJW+IlZ4BwQdOS1aJCa8rOvcC+fYiAEgSnGuBM+xcegbsHlmgNKd4kwZdZR+NYclqQcB1HUhT2YVmRCNpEn4Gm5nrab+v8VdV067X3ofXbCUxMzp07kvSuj7KPLrujDhLJ3+lIychPuza80vln66ztFOqiR1c0LF5FSuGJgczyvBcGY6ji8oc+OyfDd2pX6/GPx8SkWPcpB4lxLpea75giidpJfm7CB38jFK5sXzOVIZROMeE5KE45329Pwy/Y1MYOAwY5SGzhPqtEmYF0EWkGvtEsIOTs7aizfJQu8sVqRjgrxVGwMBohXHAxMzjnr7Tavt7/cLPHBiYzXdUxj/4JnEXNvssP6iIOMH5YXCWou/8uUQijR/8+9pkFJN60z/2jGQcMzXeg5yEUPB/6LecwBiM4UBXx8K8re5OdfmFHMiFXRlK7037P9O0E5ND4JEUQNTa9jRdB0HdqU47awf1Tk32Hds9E0orZinwTRJFzrpoi+PHFfem/LvSC+pmlOHewqVdpsMcjbaA4fh/fDz/NGGt2vlYPNlgWGAQtrNFM6Otwus/3ENKrOPKTsLVTMkBlUVIsm4XgTK0GsyTonLgDPAnaIe2hmm9vY8iG9PIh7owUVMp3S1Q3pnF/CkYncHLUlYH9GvBTzuGs4oXFAr0ec0dXSwtNZkc58QbBmtNyw87JZ9F/kWR1v4P/Dt2chyaEEg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(346002)(376002)(39860400002)(396003)(186009)(1800799009)(451199024)(82310400011)(40470700004)(46966006)(36840700001)(81166007)(356005)(7696005)(6666004)(40460700003)(86362001)(40480700001)(36756003)(36860700001)(82740400003)(47076005)(2616005)(66574015)(26005)(2906002)(336012)(426003)(478600001)(83380400001)(1076003)(8676002)(70206006)(4326008)(8936002)(5660300002)(70586007)(7416002)(44832011)(316002)(54906003)(6916009)(41300700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2023 15:02:51.7059 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef1bf953-3e93-403c-133e-08dbb07cac74
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989E9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6878
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Shashank Sharma <shashank.sharma@amd.com>, Xaver Hugl <xaver.hugl@gmail.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <mdaenzer@redhat.com>,
 wayland-devel@lists.freedesktop.org, Melissa Wen <mwen@igalia.com>,
 =?UTF-8?q?Jonas=20=C3=85dahl?= <jadahl@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>,
 Victoria Brekenfeld <victoria@system76.com>, Joshua Ashton <joshua@froggi.es>,
 Aleix Pol <aleixpol@kde.org>, Naseer Ahmed <quic_naseer@quicinc.com>,
 Christopher Braga <quic_cbraga@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

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
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Naseer Ahmed <quic_naseer@quicinc.com>
Cc: Christopher Braga <quic_cbraga@quicinc.com>
---
 drivers/gpu/drm/drm_atomic.c | 29 +++++++++++++++++++++++++++++
 include/drm/drm_colorop.h    |  5 +++++
 2 files changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 8a5f8cd22c8d..30308b8dec53 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -783,6 +783,19 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
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
@@ -803,6 +816,13 @@ static void drm_atomic_plane_print_state(struct drm_printer *p,
 		   drm_get_color_encoding_name(state->color_encoding));
 	drm_printf(p, "\tcolor-range=%s\n",
 		   drm_get_color_range_name(state->color_range));
+#if 0
+	drm_printf(p, "\tcolor-pipeline=%s\n",
+		   drm_get_color_pipeline_name(state->color_pipeline));
+#else
+	drm_printf(p, "\tcolor-pipeline=%d\n",
+		   state->color_pipeline ? state->color_pipeline->base.id : 0);
+#endif
 
 	if (plane->funcs->atomic_print_state)
 		plane->funcs->atomic_print_state(p, state);
@@ -1779,6 +1799,7 @@ static void __drm_state_dump(struct drm_device *dev, struct drm_printer *p,
 			     bool take_locks)
 {
 	struct drm_mode_config *config = &dev->mode_config;
+	struct drm_colorop *colorop;
 	struct drm_plane *plane;
 	struct drm_crtc *crtc;
 	struct drm_connector *connector;
@@ -1787,6 +1808,14 @@ static void __drm_state_dump(struct drm_device *dev, struct drm_printer *p,
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
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index 1ddd0e65fe36..622a671d2458 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -222,6 +222,11 @@ static inline unsigned int drm_colorop_index(const struct drm_colorop *colorop)
 #define drm_for_each_colorop(colorop, dev) \
 	list_for_each_entry(colorop, &(dev)->mode_config.colorop_list, head)
 
+const char *drm_get_color_pipeline_name(struct drm_colorop *colorop);
+
+const char *drm_get_colorop_type_name(enum drm_colorop_type type);
+const char *drm_get_colorop_curve_1d_type_name(enum drm_colorop_curve_1d_type type);
+
 void drm_colorop_set_next_property(struct drm_colorop *colorop, struct drm_colorop *next);
 
 
-- 
2.42.0

