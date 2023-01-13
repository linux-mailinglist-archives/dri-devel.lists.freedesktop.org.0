Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED334669DF3
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 17:27:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0FBA10EA6A;
	Fri, 13 Jan 2023 16:27:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2048.outbound.protection.outlook.com [40.107.244.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D99210EA2C;
 Fri, 13 Jan 2023 16:26:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZFSIHzkasEqUxxf5s3CjoCgYRfHEsTvX8tkejPkLqXz9XbtO8e2sYT1UihkrYQjQ65Z9BVCcDAUIBZx+eM4GNOQXmmh/E4eDdizB1V7kTqAqZSQzQvcGk/dljARY6whas0RxOt44xqgRpFuWrj4QKmOk/rtrngcNVZ1T/3DnuA6L8r6qF96z8n7lOU8drvm4VJt/poywmE1xXJV4M8uwZ1Dc5OyDRaRcQTV7Ba3/TMgFZTb0iTbI/rk061EdAiqDGL569II8aeUWOzjSiMq04e+n3v9yzHcLvWUbYr/L5cquVgOt4kaMLuR+xjVqmFgTSoLgeCfkb5qBUW68vawbHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YjGySziy0vDiOfhMYQsJE30n/7kjotnzQ3/U+lCmqw8=;
 b=F4DKSirxvEJf820b1uWl06paEDjPqwqGwHPi6aXOseaQae0DrhnMco59pqFTzsdCmtxYjt08HoVlC0cpSwunr/PkZr9PKB+OMESe3fQJ9flNdSMwbiw710x7aVz/0Bdn95NHcSwm8D+3m8NuipPEAlJAqxTbFiPc38qmdRPVayoupu5gj/F22zEziQJTIfJMqtk7kNuu5Pnyux7CmGtXddQfyJ7OzE+jD4oRz4vnnumA1VyhxrLKmeW1eIcxnrCCXzvh92ewCfgVZXXYQteXGL3dmq7MQbjwItmipQGsKy3e/8kSbFRSXg+pLYCFmLcgUMLClzBTjuQMeJUAugzs/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YjGySziy0vDiOfhMYQsJE30n/7kjotnzQ3/U+lCmqw8=;
 b=Mvqfk+b39nxCQVrxo0vVsxpKvxgvQxamtaQR+ah8URI89KQaYKT2VtWVusWObStEUpXHtV5EnsnU3LFrdGpJCJQT13RK49Hp9QrmZZ842q0im1wdtDas2zEMKgs7fcC8dejOZgnM1yom2zEEgeME/TXHqMMZoJKE09yz17R9EDI=
Received: from CY5PR15CA0014.namprd15.prod.outlook.com (2603:10b6:930:14::35)
 by CY8PR12MB8196.namprd12.prod.outlook.com (2603:10b6:930:78::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Fri, 13 Jan
 2023 16:26:42 +0000
Received: from CY4PEPF0000C96B.namprd02.prod.outlook.com
 (2603:10b6:930:14:cafe::32) by CY5PR15CA0014.outlook.office365.com
 (2603:10b6:930:14::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.16 via Frontend
 Transport; Fri, 13 Jan 2023 16:26:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000C96B.mail.protection.outlook.com (10.167.241.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6002.11 via Frontend Transport; Fri, 13 Jan 2023 16:26:42 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 13 Jan
 2023 10:24:56 -0600
Received: from hwentlanryzen.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 13 Jan 2023 10:24:56 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 07/21] drm/connector: Print connector colorspace in state
 debugfs
Date: Fri, 13 Jan 2023 11:24:14 -0500
Message-ID: <20230113162428.33874-8-harry.wentland@amd.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113162428.33874-1-harry.wentland@amd.com>
References: <20230113162428.33874-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C96B:EE_|CY8PR12MB8196:EE_
X-MS-Office365-Filtering-Correlation-Id: a298d7fb-ae35-4af3-63d1-08daf582f4a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jctQpH6gv0/uF3ia9HIfWRPWZPHUYXqANkeOw5YzxZ1i1v8As/MRBGIduxoBShFtuzBgsH2u+Y6biEi9DnN1ecvlXwLA/gYKJGIYXMFzNcXyKCS4EKpHITypQ+tqC/GBKrmFRR/qK4pYD60S4zm7zxRan22ucCjfpAMVg755ql1Ma8BEiE+Wln5Ztinidc8kkPU6zJKPbSpvie5m2b3hbW4zt/WvtHEZMxQ7NIOd5leRI4eLeVNew9b3IonpnmZO/g0eqQMcDKxhAYqDRPl+hd1pQNFV5fzXHD0aR3EwJUFuyUl3uNqCLD03nRyoZJMibiV/IFTRVaVQN4N5u9zGfTLpPfs0+9XJgcWkxF0VwG8Sz+EG/4oE8elde6WoRNs3zMZD+0dF2uejemL4JeQWpyV/TafnMitPmSv7Q9DUtn6L+NnmtUHwvixX7gf/HWBIaOWcpfDu4R7YP856MJWBnC4btRmTUb3guhhu0p2zc/lSUaXIHK6LeDhYusUPVARRHKe8nBrnzP4QPc0bQsh6FLHrUQOAVH3dgZmWWmWzoMVUClO4AKNdj1wO0bqCmq3wTADz/W1YaqZ6E+3jRyGtYz/7VAv27e43v+KBBqGmHRF9uhca+8JrnIBGjL46pIkTEaQQg0TEK6pqWJCF1jsCyNRiCMOjtsBYodJ3sPhqREif0X6xTqjSfpzR1r7pJGB7QGzEZvuFEKaxLwXfSaXnZEmHSpENi8Trk82NkjoArZk=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(396003)(39860400002)(346002)(376002)(451199015)(40470700004)(36840700001)(46966006)(86362001)(40480700001)(316002)(26005)(7696005)(186003)(44832011)(478600001)(5660300002)(1076003)(2616005)(41300700001)(426003)(47076005)(54906003)(70206006)(4326008)(110136005)(336012)(70586007)(82310400005)(8936002)(40460700003)(36756003)(8676002)(83380400001)(6666004)(36860700001)(82740400003)(356005)(2906002)(81166007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 16:26:42.4089 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a298d7fb-ae35-4af3-63d1-08daf582f4a2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000C96B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8196
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
index 8e81105fb2ab..913e50a8bb38 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -1031,6 +1031,21 @@ static const char * const colorspace_names[] = {
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
2.39.0

