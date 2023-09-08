Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A01E579897B
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 17:03:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F260210E8F8;
	Fri,  8 Sep 2023 15:03:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20605.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::605])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78CB110E8F9;
 Fri,  8 Sep 2023 15:02:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jHsl4aWsG7LbxBhgRNxhH1qhpb+RixA2gxNEGaqe3no1S8SixoB/0wZUS0WBsFXjITN4EsonVPLFuR1g+DzxGwaiEwR57Aso8N+pimUkzCOjYGXCvle32PB+8cZFZ7vHOVpgQod2hNkdN2B8XMWqge7x36LJb9y3ySTf6uaiw3qYkeGKKOcDAtrkGGGuovQ6iCwDmGPMt7sOj4tCRc8MAXtLdrRdcU0I8YvBQZvWXoakZH8AGXILSYq0wkBEX4+Tkf2SEjj1LuHj0yVE7iXNl6YfwxaGbXMZs6EX1BH4FhZkmJ8PzgvoB9SmEEBGW1nRF9ZcGxbv5OFNlHIduiD3Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=66lS1MEI2rYlJj9vK3IEjboXjMxGBH8hwv9DGYahzDo=;
 b=EP3gWwZcimdWxisHbDHQcp+tYPSM3g8rq4/zyX/iBHJUjt6xrb+tBSjnYI6DstLKR+6xGsRryvKy7E1WGoC5/TBjzcN9Yj22Nn0+ZDGHmekkh3Bh1BOqZWX9HKj+qOLnMBelXkBtNG7UlhS00InDQtfH4cJOBC1+ixkp0RdahAbiYQkVmQDJ0+HRWZro/EW+v/MZBDu8SkA+1kcSNKBediBeIM/bbRfLkgO0g7SF9pT2SYutMn0htqW7vy37g9TcKvDcrpCrVi3Cg2CPldWhszvX3hOttaUNptDDHcDybK32dqDyHKiA//mO7M7406poZyyQAwOVzm/s/vQziFF1fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=66lS1MEI2rYlJj9vK3IEjboXjMxGBH8hwv9DGYahzDo=;
 b=EjAqIByPMwC0HLvNaulfGGRsGIkmugBqEniyeUQ/mJZ6bR6nhE5Om+PTApPaUaHUXfyuB0K8QuMq3fRauUJAt9kR6Fqwwz1CK+PwVFCApun2i4SByz1AEX3ompzbqBAXhEHYPw0TtxPKSHKXhhL4Q6nFIW7AxgTBivsFLoYVp2k=
Received: from DM6PR11CA0050.namprd11.prod.outlook.com (2603:10b6:5:14c::27)
 by SA1PR12MB7410.namprd12.prod.outlook.com (2603:10b6:806:2b4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.30; Fri, 8 Sep
 2023 15:02:49 +0000
Received: from DS3PEPF000099D5.namprd04.prod.outlook.com
 (2603:10b6:5:14c:cafe::48) by DM6PR11CA0050.outlook.office365.com
 (2603:10b6:5:14c::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.31 via Frontend
 Transport; Fri, 8 Sep 2023 15:02:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF000099D5.mail.protection.outlook.com (10.167.17.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.11 via Frontend Transport; Fri, 8 Sep 2023 15:02:49 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 8 Sep
 2023 10:02:48 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 8 Sep
 2023 10:02:48 -0500
Received: from hwentlanrmb.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 8 Sep 2023 10:02:47 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 05/10] drm/colorop: Add BYPASS property
Date: Fri, 8 Sep 2023 11:02:30 -0400
Message-ID: <20230908150235.75918-6-harry.wentland@amd.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230908150235.75918-1-harry.wentland@amd.com>
References: <20230908150235.75918-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D5:EE_|SA1PR12MB7410:EE_
X-MS-Office365-Filtering-Correlation-Id: de1e2a08-5660-498c-dab6-08dbb07caad9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XjYu3lFtp6rl9/LsuVPHBU/qIYLG684TwVSOxtaDWoZSVTRGryA2HaN3ao/Y8VimjmUxTSydHgS4nY7MEgWThyBdOJU03izzYoQFYcLKwzmIMkMJCRa3Ryv/ya8rjFoGQtzuVpferVCUP4h2rxPJnX63xtyx3W+3j+QKeBIc2LQQ7OUGXxUCvfZzDZlJs/j4ZWjnlZxJ/o07vYR9JOox1e6W+JRFOgkODLrLvm85k1EBCznk06WNfK7Si0kfB7OxiPbQXRJACew0Pli05LDwyp9zpI630Twg7oz+VL50yi6Xy/vC+sy7nOl86z1/8RxqUK+dWhNxqdKzUy/SEwU8aOcUi9Ru5OTSyqRa2jQVCnoGTabS56mz6NbR+avvracDxiTI8xx4IKa82bNo1+x9tshMIqbwS8I7p2J40k5qwRIaoDNmwVwXHdR9CNuz7f9G7cMXux7QF6V6lxl9y5vWsir1ISXupYF3WHi5Z2Vs4NluA9g7jWQTNZthi49K/qZRblfTWvdE081/7kJTIOGhbv1OlxucDLDD41vvXgSKS9Y5g2LreMNH6uNVmjnfKlrtVlMbG/en1Bp9YPPqxESGbeuZqfy/+pBrHy5FSABmKunXcVjU6XUGIOqBJJpQ7qlTd5Ld2P7NGuKy5UkWVCVz4zjDeRQFhKR8I4DwGHoXatasqyH6FrHgvNfaMbtc+XC/LTMYvryRbCwdr4UKDLBI7KPuhhxge2Mi9ErEN9f+JtcAe1ANiFC4xUUJgZd9C17qmL/CJxALix3mkboNDII0Og==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(346002)(376002)(396003)(136003)(186009)(1800799009)(451199024)(82310400011)(40470700004)(36840700001)(46966006)(36860700001)(40480700001)(83380400001)(81166007)(356005)(5660300002)(86362001)(7416002)(36756003)(44832011)(26005)(40460700003)(66574015)(47076005)(41300700001)(82740400003)(70206006)(6666004)(426003)(1076003)(70586007)(2616005)(478600001)(8936002)(4326008)(8676002)(54906003)(316002)(7696005)(6916009)(336012)(2906002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2023 15:02:49.1113 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de1e2a08-5660-498c-dab6-08dbb07caad9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099D5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7410
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
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Naseer Ahmed <quic_naseer@quicinc.com>
Cc: Christopher Braga <quic_cbraga@quicinc.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c |  6 +++++-
 drivers/gpu/drm/drm_colorop.c     | 15 +++++++++++++++
 include/drm/drm_colorop.h         | 20 ++++++++++++++++++++
 3 files changed, 40 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 9b01f234b04e..ca3512038d4c 100644
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
index f665a12a214e..409df022b256 100644
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

