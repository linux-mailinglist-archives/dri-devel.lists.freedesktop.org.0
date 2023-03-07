Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF876AE411
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 16:11:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AB6110E4F1;
	Tue,  7 Mar 2023 15:11:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20616.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::616])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E27310E4EA;
 Tue,  7 Mar 2023 15:11:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jHXMkTaXhFcG2tcBo8MAKPfGRyhTpWISyNKCx8ptH74oIE3tZ/4F964kD+9vy53/rHY5vmBAJEwu4YfXkkkyS96QZNXBy+doinQDkGKApqrOdd9jMa8UBqjUpMgb3ejNYxXCnVvR3Xib+nVcFcNwpw9W7xEOIKYiQypF4LrA0f5CksxwEAuuovpEvFEBghZy0MNuH4xKCA4TGVG0/MUg0ew7axJ5QBZ263w2edLam6UCNcUtiqRvAMBBQ/FNX+c3nI/XgfC3mhS7x6KGqiotNqTCjlQPpu3Y6bz5kEWab9S5GiB9bYYMo8aeEotQI+u4GwagM/IcWIIARWn+n0cltA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6hqkM3UJ0lNVVhSYBUzRXI8xDkrz77a3byQZmDeT9vM=;
 b=bXnsQMrBV7QPDVRswgJUEVYLPXdT+LB14ZsaFZb8f/Xo1zO5U78ykF7v0wqDcuP/DU8W0IsqHbeZvdzSdMqZt3hATcZdxYfv/cPDu8bundBwLE2T9BaRKNqcHMyj3Qyeqm/t9KDeK0UmzrJ5i+PtDSMOZ/3kcnQxC6qoZJ7iJbv17UNbZYmz7SswNDexRvQGs10Fdi3YD69nyl6QQyeBRJCJrjZYe4d9hozi6OY/00Eu+Ih7eKDFvuTOqQKUG67XGW8b+HRnJNwgsqkMUat3rm/3l8+GQy6h9gKznZnKChVg4Fmga59zStWsBaCvVAXH5n7kbo4C7ADeVm4Ws6o+Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6hqkM3UJ0lNVVhSYBUzRXI8xDkrz77a3byQZmDeT9vM=;
 b=F39KEvamVKT0Auj1rizDyKLV1+hVj0pkXSb3E3OG0P7wnKIvBNg96Ielu8NKqCuFkCu/tQ2uGzhcygx/x6nZfO/VLRWRIDZ0kyy+ob5DzGvEMrXwJSNkzErthKKBkvm6xmMx6e8UNnKyFMRLAfytB3UV1XEAe0hIY+Et1JV/9tE=
Received: from DM5PR07CA0081.namprd07.prod.outlook.com (2603:10b6:4:ad::46) by
 DS7PR12MB5720.namprd12.prod.outlook.com (2603:10b6:8:73::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6156.29; Tue, 7 Mar 2023 15:11:21 +0000
Received: from DS1PEPF0000E631.namprd02.prod.outlook.com
 (2603:10b6:4:ad:cafe::58) by DM5PR07CA0081.outlook.office365.com
 (2603:10b6:4:ad::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29 via Frontend
 Transport; Tue, 7 Mar 2023 15:11:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E631.mail.protection.outlook.com (10.167.17.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.13 via Frontend Transport; Tue, 7 Mar 2023 15:11:21 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 7 Mar
 2023 09:11:20 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 7 Mar
 2023 07:11:20 -0800
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 7 Mar 2023 09:11:19 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 06/17] drm/connector: Print connector colorspace in state
 debugfs
Date: Tue, 7 Mar 2023 10:10:56 -0500
Message-ID: <20230307151107.49649-7-harry.wentland@amd.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307151107.49649-1-harry.wentland@amd.com>
References: <20230307151107.49649-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E631:EE_|DS7PR12MB5720:EE_
X-MS-Office365-Filtering-Correlation-Id: f11044b5-a68f-423a-d4d8-08db1f1e360a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2+b+pjb1av++Q9V5eTqC0eA2/twpoIx90LpS7r3Fjf2MXrMZ4W2fYbCpRpbbUbkfPu4T2uw4Va44QkPfqbVcnzZ3B9jYy9GMI5vgWI55Pg7bAYYPbH+C9WxIsnV0iA61OItwuLl8HO4VtfExxrfjEbCX8BzcRgUZlVPpTm4AkXnRZnVKnE7gD5hEq55864l6NfNQwPpLZ96OnFOI3wQamByLtnAEz+JmgedjXYIma83k3xtTP4Zmq5RtsehCFqx/vcVmYfYJ6lWyGqawaAEhM2MmiIs2leYbDFjW0LjuSPR66fESfrtNyaKzOiOCMZzfs84P/gYnjpR8ML6lJfHPNRD52Kavkfrf1+shUXjqw/MtMpALcoOS4vkcL8pAAORyWYn/qmgJdClu2dnrVjx9AFrqObD5tIGm+8uhMHdy0qcEjkrNvdeJVVOQFcSn/SmDH9xgsoX6qigCw9V9og8W90jeV80rJuKBumY1kgCsxTzGn3/0+AeHn4Wb+d1Y5/GXS0lidDVWQmi8MSxhgAToTDG2S19JM1NsGG8E2QCKZaeTnZ+FnAjKhIGcUQqPc5sVQ34xOANOPJat2kxSjaAYA3v2depHr2TwMjiN1g2GGg/zz6YjTGUaBJIIyER45R+T1U+KTxqmPTqW5h7+cw6Ohc9mbKuur/fVbwySsCA+3cFH6d4QkCrRMZ1gTTdq7ChMBOVVWPIrrHkB9MU/yaKF8iIbGbEw2txGXX9QFhl1wKM=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(39860400002)(396003)(376002)(136003)(451199018)(46966006)(40470700004)(36840700001)(2906002)(44832011)(8936002)(5660300002)(336012)(41300700001)(70206006)(8676002)(40460700003)(4326008)(70586007)(36756003)(316002)(54906003)(478600001)(40480700001)(86362001)(6666004)(81166007)(36860700001)(26005)(186003)(356005)(426003)(2616005)(47076005)(83380400001)(1076003)(110136005)(82310400005)(82740400003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 15:11:21.8435 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f11044b5-a68f-423a-d4d8-08db1f1e360a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E631.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5720
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

v3: Fix kerneldocs (kernel test robot)

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Vitaly.Prosyak@amd.com
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Joshua Ashton <joshua@froggi.es>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
Reviewed-By: Joshua Ashton <joshua@froggi.es>
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
index 7649f0ac454f..7ed48f9cbb20 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -1044,6 +1044,21 @@ static const char * const colorspace_names[] = {
 	[DRM_MODE_COLORIMETRY_BT601_YCC] = "BT601_YCC",
 };
 
+/**
+ * drm_get_colorspace_name - return a string for color encoding
+ * @colorspace: color space to compute name of
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
index 46c064d9ffef..c77e42408522 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1970,6 +1970,7 @@ void drm_connector_list_iter_end(struct drm_connector_list_iter *iter);
 
 bool drm_connector_has_possible_encoder(struct drm_connector *connector,
 					struct drm_encoder *encoder);
+const char *drm_get_colorspace_name(enum drm_colorspace colorspace);
 
 /**
  * drm_for_each_connector_iter - connector_list iterator macro
-- 
2.39.2

