Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 107E07D03D5
	for <lists+dri-devel@lfdr.de>; Thu, 19 Oct 2023 23:23:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8185A10E566;
	Thu, 19 Oct 2023 21:23:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2044.outbound.protection.outlook.com [40.107.237.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B0D410E553;
 Thu, 19 Oct 2023 21:22:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=boz7Kf4bUfRRtzNhUOXVJyWXwFgkRLiBj2I4rj4oe42hzXd4jFelDw28sw82vWO0UmS9padzBumPs7ZnR6pt0ccPBvZbHQ1DdqIdjt/2NNggeRMuuUXcOYMe+0kVz/flgC9sAC2rg54uhdLj09iZkzvZ6GfWwPIP+ZwfDgZUnpu+rywODWo1jgSLE/LFmrUmgBity0yMK8Y0Yov9csf3Lazb2W6mqJndLKEjuuNUlLyFmAqrJy7QGKejnMbrI+HklZg63d03NQ2n5oGyAWvQpQ7uD4mdNUtO8r/YPbQl/jGr2WT2GDlpWuoZ0KLeIvdBrExn1Q1DPgIKK+G/WhBk3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4nn206DqeQRJWvwv8qf4IkdJ/1RSZZqxhIGsL/7deFo=;
 b=QSi7h7U77+QUuOlSGZVV5Z2PZuEHZoHCwUAlz9pVVxmFdPVIK87uJIVG4PA1GwtPk0o4MsfXN0W8GE8kwx/+yxYHrJpUTPJZfNLzjIEU6L/2m85t03BCZCeoYpIiOY6VuLV9mzDUVrzTjTJioBWXPR2Uoy48khMwwuiTWA9NvBefA/hcw7aEJkmMI3j8klUDz7Oyjp0Rbh1dTgrposdFWuxr9iXi2XY9cMb2cLz5YWogqVVQJ6dl3lnm7T0nsKEIcwR1YOLeF0yA+UVMiAxNZgfhPy+5DqRdw3zIh7aOIKTHX9iiDMXJ3s3Qxhxr8TYIa5HdGsONGdfieOU3r9kxpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4nn206DqeQRJWvwv8qf4IkdJ/1RSZZqxhIGsL/7deFo=;
 b=WOjY0jN416I0VpxNAlBal/IuxT4XI3q33IMSWia5gu7bXlaK3ceoxe+WMfPm1WxP7u7PahviavmmUbAVEiW5jo12njwmj4KNH0bzgs5wv61uHx85mv9O9DyGDEgLSDHj/++KXGkOAWjZBqc/JSm0jSEeSa0hKVVEz0rzOOgwiZ4=
Received: from MN2PR07CA0017.namprd07.prod.outlook.com (2603:10b6:208:1a0::27)
 by DM4PR12MB7504.namprd12.prod.outlook.com (2603:10b6:8:110::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Thu, 19 Oct
 2023 21:22:42 +0000
Received: from BL6PEPF0001AB77.namprd02.prod.outlook.com
 (2603:10b6:208:1a0:cafe::c5) by MN2PR07CA0017.outlook.office365.com
 (2603:10b6:208:1a0::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26 via Frontend
 Transport; Thu, 19 Oct 2023 21:22:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB77.mail.protection.outlook.com (10.167.242.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6907.20 via Frontend Transport; Thu, 19 Oct 2023 21:22:42 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 19 Oct
 2023 16:22:41 -0500
Received: from hwentlanrmb.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Thu, 19 Oct 2023 16:22:39 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH v2 12/17] drm/colorop: Add atomic state print for
 drm_colorop
Date: Thu, 19 Oct 2023 17:21:28 -0400
Message-ID: <20231019212133.245155-13-harry.wentland@amd.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231019212133.245155-1-harry.wentland@amd.com>
References: <20231019212133.245155-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB77:EE_|DM4PR12MB7504:EE_
X-MS-Office365-Filtering-Correlation-Id: 9775a0c0-28ff-4cf8-5203-08dbd0e9878a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MS4UQebQ0HNMzz1KN9vfpnvvkDMuVjyEG3TAhpom6KV80Yt8Sv2Sh31OngOic2SDPKJ9xjTk0bKysaMTKtmtWtypGluFB1g9clfxVMGyBWjvZiPjfAo56o3sf4u9cDnEsw6v8b4Q063E1YSVHBB9rNmrd5H67IGsGaNrePmQs9XfzVnYZyHqSa4eaJ84CuOI6L2oBYnItVUuUTWGiQk60eU8lcvUqHFip46BuI6eSxN+5cjXOc5Y67YbHvU9k9Y6Jorctuij8lDLVc4lYxqEGUeoIMe/psjpXgccIybnvKNAQIIV3giBXQiEjjm1eL4Mjyn1Db/Dfc8QtT/ZQhIKwLEHiPOirDTMuyjfKZI8zmwz+P7CbFAISgJNc9jzrQVmmq6gWR6hWoFxO4tLNGAqiKOrBINakyCcNVvhgfFWUDxutyf9zSCWLGxFF4j/12vEqHB8zT9GmwZyGe/pb5ds9t74g+75Vcxi2/afXXcIaz3kjr5NicoKChUwDKvYSnI4pGG9rs1nE285LtMgvh4zRvikijs/zr5jUSwyGZjDd9pUfkogO6+njGa0gkFfiL+YBwrpBWltwGyJ3k95hSJ/p+z5JrBDyQSKOmYtB8po1sl7YPHeM1cvbmrUcVgFbnxa4q5NViaAmTWzySIM8ridicrh60uZhzHtxv8aUl64RRyNgLRU6UTubGX2lhmnDFfmY6W7bR5fkb8ITQo8dgNg+7v8K/3opHciJ8H6oGB4iZq9DwWodB/r2S+CsG0X7D5gkhWNH4WsolMiOOLWJoyI7w==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(396003)(376002)(39860400002)(136003)(346002)(230922051799003)(186009)(1800799009)(451199024)(82310400011)(64100799003)(46966006)(40470700004)(36840700001)(6916009)(2906002)(40460700003)(7416002)(5660300002)(44832011)(8676002)(36756003)(8936002)(4326008)(40480700001)(41300700001)(316002)(66574015)(70206006)(54906003)(86362001)(478600001)(6666004)(70586007)(2616005)(7696005)(1076003)(26005)(426003)(81166007)(356005)(336012)(36860700001)(82740400003)(83380400001)(47076005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 21:22:42.2534 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9775a0c0-28ff-4cf8-5203-08dbd0e9878a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB77.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7504
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
 drivers/gpu/drm/drm_atomic.c | 29 +++++++++++++++++++++++++++++
 include/drm/drm_colorop.h    |  5 +++++
 2 files changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 524bec520287..15bd18c9e2be 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -792,6 +792,19 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
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
@@ -812,6 +825,13 @@ static void drm_atomic_plane_print_state(struct drm_printer *p,
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
@@ -1848,6 +1868,7 @@ static void __drm_state_dump(struct drm_device *dev, struct drm_printer *p,
 			     bool take_locks)
 {
 	struct drm_mode_config *config = &dev->mode_config;
+	struct drm_colorop *colorop;
 	struct drm_plane *plane;
 	struct drm_crtc *crtc;
 	struct drm_connector *connector;
@@ -1856,6 +1877,14 @@ static void __drm_state_dump(struct drm_device *dev, struct drm_printer *p,
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

