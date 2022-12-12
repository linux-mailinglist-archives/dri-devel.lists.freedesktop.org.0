Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0BAB64A6E4
	for <lists+dri-devel@lfdr.de>; Mon, 12 Dec 2022 19:23:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81B3210E24D;
	Mon, 12 Dec 2022 18:22:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2064.outbound.protection.outlook.com [40.107.101.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0372010E25D;
 Mon, 12 Dec 2022 18:22:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JRFd4IDEBdfAJBxysNf4TvL44uaFKZ8Xq9y48xw4YHSOC5cNB520QXlXtB11dKODEYhFmo4s4U8ozy/thqeIsa0EpyDPGPY9Psn8EkRaDI5vlL5XdVBJgZw17135EkJqkJE/UJpLqjsedgdIiA3yBIgZwQGtHqYyEsyC5F9Af8+PGE/y46o25jf6G1uP4zHon5f9DZkCLyQH20Oykb4sKwWLU7K2tOtldCrV2BMUzgXC71XFEC+Viz3dHeCj/3K4XvaPxurLQejvEDHQNwRkTkuaoi6SNUxkRzPTYuBL+aQ10vNCYSEpCBpaRUyWb7pGgQdUFTnmEe9eO/+Xxum9PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E8NcwNrqPrkWHyjqO7fXPtJjKjdY5P+ooK7ozCM6Ogs=;
 b=Dxp1xNI74yqTgAAAn/yG4+jTshV1zeyc68RPBl0gagcBbZrQUaE5od8T7+UF47n7nxMmkbpFnLyx3WmI/4NrjMr/GHkHuKLTyuQ20V4cnXj/7EjsWJnoaaVzQrSDNV7MLz3cQw2V8Dzq7oPZdnJfcmmBetkflrJ7PVVrVnkqRySJlsP0V3NRnZmFpBflcNQvS2aSJT7FVyDZx3r2rgUqOf0PCGSaJdqMzCQykDv8Ir1rDMr8U4HxxZq1TDfESocxUl8JUnteX1obv0rRp4lzaNWMaPih9smFCaYB0VpCuSEMk24+wjODDt7vNwIXtUlKu8j8ZE5V10uBw1zROvQ1/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E8NcwNrqPrkWHyjqO7fXPtJjKjdY5P+ooK7ozCM6Ogs=;
 b=21s2OR67q1U4FIArvdxeYMVv3awSOqEVBX2ynOgORrKj3+W6pkNbEUacZUmQCrEQxWyqe9knZMM781reVrePOiyK6Wq2HC4YxALbXKx2qDpPFS14r0pWzqMzebfY5b/taaF5S7V2sERm59DeEXkCdwAxmgZAxWZvsOE242yIVeU=
Received: from DM6PR02CA0166.namprd02.prod.outlook.com (2603:10b6:5:332::33)
 by IA0PR12MB8228.namprd12.prod.outlook.com (2603:10b6:208:402::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Mon, 12 Dec
 2022 18:22:12 +0000
Received: from DM6NAM11FT079.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:332:cafe::72) by DM6PR02CA0166.outlook.office365.com
 (2603:10b6:5:332::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19 via Frontend
 Transport; Mon, 12 Dec 2022 18:22:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT079.mail.protection.outlook.com (10.13.173.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5901.21 via Frontend Transport; Mon, 12 Dec 2022 18:22:12 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 12 Dec
 2022 12:22:11 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 12 Dec
 2022 12:22:11 -0600
Received: from hwentlanryzen.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 12 Dec 2022 12:22:10 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 07/16] drm/connector: Print connector colorspace in state
 debugfs
Date: Mon, 12 Dec 2022 13:21:28 -0500
Message-ID: <20221212182137.374625-8-harry.wentland@amd.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212182137.374625-1-harry.wentland@amd.com>
References: <20221212182137.374625-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT079:EE_|IA0PR12MB8228:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d2c8322-09b4-4bb7-e08b-08dadc6dc9f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6321+wXfFkj9+yGs8jl1jox4itW7FsuXWrfK9daiIX/wpEwbD77+cRWWYzMc5HggYZF249XFdAVVlTWzQhzMoDn51SM/JgKZLjHLrztVAKXEh18jU7IljGCQHbWnisEPXMRrhXZGxOXDZE8rxfih+VjGLSlGO3KNXJfktFX+V6CdnIXxwSIJ8F8MSaXDhZACjDkX1eCB60KBd4TKwZhV7J3Y4B+/6sdJBGFbU7bsiXN0pLJBXkxhhqldHuiWEu+nvKNno1lC4VOiloov1Hz9nVvM1t0UEOADPFgFKiyrGV4B/yBTGpptO8/7+bp2UCLfKu7NDIsJWkIio/DcfJRfXVClSl+jds/WMUxOYT5GSoUX9mHobdV5nNEMiJKy5sRcdOakeopBaTpU2pZLK30dpGZj1SFNNNSFwpeXGvxLaTjgieW5cnzU9OspXOle0yNzShe09LRfoTGdnqDK1EDzvRl22JxrwE8T6brOMVUJHOJTKJoeETbIoFDciFTIIHTdKiN/17msAkGQWkSMGcO9LFq78xYoEa9nFEppETR0O5DvKV8RbDsGCDmJTUYVh+Ere5DyW1EshX8wb22GKXKrONK6LDaU+ksSwnDdWKkdrMMEbA9B//wQvU2USaY5WAWaLwLCEYgMHks/O3HT4KA0c5vW7hDxijRFDsEPVLJequEAVLximz8Ly4JrK2jt7ZDGSqlkpu9krP74mOCg5Z2bci4sBb4heVuUgpIdrxlfOdI=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:CA; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(39860400002)(136003)(396003)(376002)(451199015)(36840700001)(40470700004)(46966006)(36756003)(81166007)(40480700001)(8936002)(478600001)(41300700001)(6666004)(82310400005)(356005)(82740400003)(86362001)(40460700003)(36860700001)(5660300002)(336012)(1076003)(44832011)(2616005)(316002)(70206006)(110136005)(4326008)(70586007)(8676002)(186003)(26005)(54906003)(426003)(83380400001)(47076005)(7696005)(2906002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2022 18:22:12.3732 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d2c8322-09b4-4bb7-e08b-08dadc6dc9f7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT079.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8228
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
 Pekka Paalanen <ppaalanen@gmail.com>, Uma Shankar <uma.shankar@intel.com>,
 Vitaly.Prosyak@amd.com, Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Vitaly.Prosyak@amd.com
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Joshua Ashton <joshua@froggi.es>
Cc: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
---
 drivers/gpu/drm/drm_atomic.c    |  1 +
 drivers/gpu/drm/drm_connector.c | 15 +++++++++++++++
 include/drm/drm_connector.h     |  1 +
 3 files changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index c0dc5858a723..d6d04c4ccfc0 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1071,6 +1071,7 @@ static void drm_atomic_connector_print_state(struct drm_printer *p,
 	drm_printf(p, "\tcrtc=%s\n", state->crtc ? state->crtc->name : "(null)");
 	drm_printf(p, "\tself_refresh_aware=%d\n", state->self_refresh_aware);
 	drm_printf(p, "\tmax_requested_bpc=%d\n", state->max_requested_bpc);
+	drm_printf(p, "\tcolorspace=%s\n", drm_get_colorspace_name(state->colorspace));
 
 	if (connector->connector_type == DRM_MODE_CONNECTOR_WRITEBACK)
 		if (state->writeback_job && state->writeback_job->fb)
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 0df5db3e4fec..2305eddcd0d4 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -1031,6 +1031,21 @@ static const char * const colorspace_names[] = {
 	[DRM_MODE_COLORIMETRY_BT601_YCC] = "BT601_YCC",
 };
 
+/**
+ * drm_get_color_encoding_name - return a string for color encoding
+ * @encoding: color encoding to compute name of
+ *
+ * In contrast to the other drm_get_*_name functions this one here returns a
+ * const pointer and hence is threadsafe.
+ */
+const char *drm_get_colorspace_name(enum drm_colorspace colorspace)
+{
+	if (WARN_ON(colorspace >= ARRAY_SIZE(colorspace_names)))
+		return "unknown";
+
+	return colorspace_names[colorspace];
+}
+
 static const u32 hdmi_colorspaces =
 	BIT(DRM_MODE_COLORIMETRY_SMPTE_170M_YCC) |
 	BIT(DRM_MODE_COLORIMETRY_BT709_YCC) |
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 5825c6ab969b..545eb6eb456a 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1906,6 +1906,7 @@ void drm_connector_list_iter_end(struct drm_connector_list_iter *iter);
 
 bool drm_connector_has_possible_encoder(struct drm_connector *connector,
 					struct drm_encoder *encoder);
+const char *drm_get_colorspace_name(enum drm_colorspace colorspace);
 
 /**
  * drm_for_each_connector_iter - connector_list iterator macro
-- 
2.38.1

