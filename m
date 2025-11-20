Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2871AC73EAE
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 13:14:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A69AB10E73E;
	Thu, 20 Nov 2025 12:14:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="Y2cDCWug";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012046.outbound.protection.outlook.com
 [40.107.200.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3EC210E2A8
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 12:14:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NRgtswEj3Zk/Unt9jhXj2fDOEjKeopOBYeFe//R69H9rTOG2U2HUe+fJ2L9QKo9EwBa7l++FP58Y3i4ReSn7JNDAoo0bv2ofiQIiiE8kWnmB7SQh+6+f0JECoKv/1S7oYO4OzfhXqyLKzT7V/0Ad/hP0KlrS60IgCnweFyFjDg/Zz/PgKgm76rZyMj7+Tj1KBhj9MwyVAWXNBF83UhIhdzu9NtUEML5oTCKJDLz6oj9rED6x7w1OIYcj9FKF8J03tG8CxdKFvxZJW6lIVp2OSlBYLL1EryUe85nnPRE5qnx1zuqpwXoUo2gtWE6hG0+ch+8YahFJoRmfaWnmNUWqyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/w7uSbPkb3gfr4l2WgN5S8ZDOsgdsLVoLIIrA1/OHfE=;
 b=kDvlO5TI35I/oV7PTAjnZ0kRwThikGRkqsip77eUixTvUTksYCmKONAAC7z7//erfPlxscr+4Y1KkWc4P36XfDDwBeswKTd4q1QYYZ4Oh+P6LJ6jI67kNnpEZJ5KNZXb4Wy6cMGH4WrSZU6GwCeOUsQefBWIIjccXmaXYomwpdXkBksiDhi6APFG+uJRjQM5w5+12j2K3taX6heOhH5MUEdHmSA5lzMzncaph0QxqMWm7BL/m5G+bkWvmHhU72yLj42M8Ev1awYAW4pL7/La92bhs3nY75dEaY6uZCF2Vv9+uQ2g9Me2bAyXsvMOe90yM0c+VniCTV0E9Fpo5PMIBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=suse.de smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/w7uSbPkb3gfr4l2WgN5S8ZDOsgdsLVoLIIrA1/OHfE=;
 b=Y2cDCWug6RfxBDBcC5R5xY9zrXJDPT9/Rpp5G2QQLoyS7WZutdsEpIuvIuXkx+HWEBZMLUPtKRV4xEYwl8VW5P3M5CWfBf4ejO4vP3AcOoP7G3UaEoPhV1lgK2sHpS7Oe1wKmytdjdJn9l/GnLUp4CQmuNY+3uV3vYk0IaWEkj0=
Received: from BL0PR0102CA0041.prod.exchangelabs.com (2603:10b6:208:25::18) by
 PH7PR10MB6311.namprd10.prod.outlook.com (2603:10b6:510:1b2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 12:14:41 +0000
Received: from BL02EPF0002992D.namprd02.prod.outlook.com
 (2603:10b6:208:25:cafe::63) by BL0PR0102CA0041.outlook.office365.com
 (2603:10b6:208:25::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.11 via Frontend Transport; Thu,
 20 Nov 2025 12:17:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL02EPF0002992D.mail.protection.outlook.com (10.167.249.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Thu, 20 Nov 2025 12:14:39 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 20 Nov
 2025 06:14:37 -0600
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 20 Nov
 2025 06:14:37 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 20 Nov 2025 06:14:37 -0600
Received: from hkshenoy.dhcp.ti.com (hkshenoy.dhcp.ti.com [172.24.235.208])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AKCEHDv3636470;
 Thu, 20 Nov 2025 06:14:30 -0600
From: Harikrishna Shenoy <h-shenoy@ti.com>
To: <Laurent.pinchart@ideasonboard.com>, <airlied@gmail.com>,
 <andrzej.hajda@intel.com>, <andy.yan@rock-chips.com>,
 <aradhya.bhatia@linux.dev>, <devarsht@ti.com>, <dianders@chromium.org>,
 <dri-devel@lists.freedesktop.org>, <javierm@redhat.com>,
 <jernej.skrabec@gmail.com>, <jonas@kwiboo.se>,
 <linux-kernel@vger.kernel.org>, <linux@treblig.org>,
 <luca.ceresoli@bootlin.com>, <lumag@kernel.org>, <lyude@redhat.com>,
 <maarten.lankhorst@linux.intel.com>, <mordan@ispras.ru>,
 <mripard@kernel.org>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <s-jain1@ti.com>, <simona@ffwll.ch>, <tomi.valkeinen@ideasonboard.com>,
 <tzimmermann@suse.de>, <u-kumar1@ti.com>
Subject: [PATCH RESEND v9 2/6] drm/bridge: cadence: cdns-mhdp8546-core: Add
 mode_valid hook to drm_bridge_funcs
Date: Thu, 20 Nov 2025 17:44:12 +0530
Message-ID: <20251120121416.660781-3-h-shenoy@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251120121416.660781-1-h-shenoy@ti.com>
References: <20251120121416.660781-1-h-shenoy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992D:EE_|PH7PR10MB6311:EE_
X-MS-Office365-Filtering-Correlation-Id: 3db14eca-c474-40c2-1659-08de282e6137
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|1800799024|376014|36860700013|82310400026|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4v3API5N0kIorB8kTmNnSoZ8ModQ+1ritEzwkbSI0AtvE1hML3LeXKX0lq0W?=
 =?us-ascii?Q?9ANQpLS4uDiMU7aZ9N8jIvzpBySSxwJ68UOjlSmhA1raWDp8I+JyunafUalT?=
 =?us-ascii?Q?X9ExXdofD9id9Y4O/0Z6zXCFssU5bSj6cLRh5FhZrRJflRXLHUV7L/jdKbPz?=
 =?us-ascii?Q?y8RKmvgy0ZqSYuUYmdqg4x+pXW7P0Np1cmzeRH9uJH7tQWPU2vFSIq+N7xfS?=
 =?us-ascii?Q?sFziXD8SJ5fRwwCE+JcgJV3dSbKJcBhuZ00MQZdb+n614171W3qXyNlnPEKa?=
 =?us-ascii?Q?9PEwYbgtKsflewq3nGQTMUIXcK3dF42FMaj3gRoq4eaCeRqMrfhKWYL9qRCR?=
 =?us-ascii?Q?z54p0v5I1oFYDtJyj+EI9bYluQt3kiFXBmjvd6Vx64H2na8cBaUP/4YolFoD?=
 =?us-ascii?Q?8KVlMpNn2MBLzqVQS7IlotWCshdtYGqsX0Mk62faTe9BQLkNqWZgrwopGnYE?=
 =?us-ascii?Q?iP3nA3hIGA9/mfXgG2j05jx3551rGcqWBZOxYVuVqz30etsokIaflk6FPGE9?=
 =?us-ascii?Q?xzoqvRfFVMSDZGViioER1U/Q1B2sMXha8221YeUszsHaRd3dEdamXSq+UeGz?=
 =?us-ascii?Q?FndBjB3Zpnoozy/AOw3knQgrw1Po6uXzEaBXnIFCFv4rBY9A2f214LwwXpV8?=
 =?us-ascii?Q?cKi/xQCAQ+zYQXZxRqVzr/4yYcQqjNw6OLI5R5TlLjRtttQlQaRBVhDPf3+f?=
 =?us-ascii?Q?F1fUSl0edResjxDOAFe/d8J2iBATtsouMWl3hrJYlBLTrZ46dHlD+5eqkTl6?=
 =?us-ascii?Q?DCqDOkjv6fninby8LM+Eo2tIhaRuMwjJ+swNhBoCdDHpN1S+7/kPTxJtRMvM?=
 =?us-ascii?Q?ybph/0N0WdAyoZNf57uRE2hFsRtyXY5h9LI/LgPZewjv8iJPUs/HL+RasrZD?=
 =?us-ascii?Q?hTKwDm+yPcmg/Po/P8T4gWYk4QrAgZN5pteLw3vbB3DgQLGWuVg7Bq3Tx1bW?=
 =?us-ascii?Q?gn8wDtvmTiS3QiuPfNwLMqGAuUu6yEIV7ZaYJeXzONHq14kViWWsXj8aRTeO?=
 =?us-ascii?Q?An4GCaNPs4CLRUnzgtzV62oBIaESp46Vir4+uwmscMYUvBmL0o+axjbMatEF?=
 =?us-ascii?Q?IUfuQNQlOL8ofuRNcaMfdZiduAMOgtwqhq70zfmtI32b1dG4lrCiJB7XhPse?=
 =?us-ascii?Q?BxI/3CDikRvovA/uaORV8nW0jBqJufFw4hOIZQKPwqAAZ5nlVlWJBxye62+0?=
 =?us-ascii?Q?wwIquOa4gLxnkXLYyEOExwZpgNMHRT4833FLPxnMhomYXLzhZ7K1kJJJ6m3+?=
 =?us-ascii?Q?0ECEwqqM4zqy6vhBvvyo0ioaz9BAIlTKSbYEHkYKtToSmtAhCyKcAJ9bTfwq?=
 =?us-ascii?Q?1ymlCqTxBA2IvCFfK3DPtYviBxblb0b6YJa7aJTH6huSIcF/ppD29HtSGmqU?=
 =?us-ascii?Q?yYTSKNF7SK5SFjQlrKBees976slj0Co2O4K4bf7fsdCA+TgA9PnIpCoe6zTz?=
 =?us-ascii?Q?2BeI2w2Tf3COztaWgp+HSAssFavkduiSESR43CzqALmnNxZsfdINgj9g1O5c?=
 =?us-ascii?Q?dWcT2Utkb+JfdvIhh5keVdwTTanUa4QJLTIDLUKbxsD47DPjRu3ZjoOuDVVw?=
 =?us-ascii?Q?epsu7GTbKAainZZOlz690vK5mrcKPXCQRH6OjQ9j?=
X-Forefront-Antispam-Report: CIP:198.47.23.195; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:lewvzet201.ext.ti.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(36860700013)(82310400026)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 12:14:39.6625 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3db14eca-c474-40c2-1659-08de282e6137
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.23.195];
 Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0002992D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6311
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

From: Jayesh Choudhary <j-choudhary@ti.com>

Add cdns_mhdp_bridge_mode_valid() to check if specific mode is valid for
this bridge or not. In the legacy usecase with
!DRM_BRIDGE_ATTACH_NO_CONNECTOR we were using the hook from
drm_connector_helper_funcs but with DRM_BRIDGE_ATTACH_NO_CONNECTOR
we need to have mode_valid() in drm_bridge_funcs.

Fixes: c932ced6b585 ("drm/tidss: Update encoder/bridge chain connect model")
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
Signed-off-by: Harikrishna Shenoy <h-shenoy@ti.com>
---
 .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index f3076e9cdabbe..7178a01e4d4d8 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -2162,6 +2162,25 @@ static const struct drm_edid *cdns_mhdp_bridge_edid_read(struct drm_bridge *brid
 	return cdns_mhdp_edid_read(mhdp, connector);
 }
 
+static enum drm_mode_status
+cdns_mhdp_bridge_mode_valid(struct drm_bridge *bridge,
+			    const struct drm_display_info *info,
+			    const struct drm_display_mode *mode)
+{
+	struct cdns_mhdp_device *mhdp = bridge_to_mhdp(bridge);
+
+	mutex_lock(&mhdp->link_mutex);
+
+	if (!cdns_mhdp_bandwidth_ok(mhdp, mode, mhdp->link.num_lanes,
+				    mhdp->link.rate)) {
+		mutex_unlock(&mhdp->link_mutex);
+		return MODE_CLOCK_HIGH;
+	}
+
+	mutex_unlock(&mhdp->link_mutex);
+	return MODE_OK;
+}
+
 static const struct drm_bridge_funcs cdns_mhdp_bridge_funcs = {
 	.atomic_enable = cdns_mhdp_atomic_enable,
 	.atomic_disable = cdns_mhdp_atomic_disable,
@@ -2176,6 +2195,7 @@ static const struct drm_bridge_funcs cdns_mhdp_bridge_funcs = {
 	.edid_read = cdns_mhdp_bridge_edid_read,
 	.hpd_enable = cdns_mhdp_bridge_hpd_enable,
 	.hpd_disable = cdns_mhdp_bridge_hpd_disable,
+	.mode_valid = cdns_mhdp_bridge_mode_valid,
 };
 
 static bool cdns_mhdp_detect_hpd(struct cdns_mhdp_device *mhdp, bool *hpd_pulse)
-- 
2.34.1

