Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A6FC69344
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 12:53:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D977910E487;
	Tue, 18 Nov 2025 11:53:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="HyHUdFbD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010024.outbound.protection.outlook.com [52.101.56.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AE5710E487
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 11:53:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MCdCHr/GsZ4PpZY8AcX+cVQMS+JewEThfl2VdTQu4wYv18ZwmBb4RF6a1AUuAg6c7uW1q4O78muPDPKz/YKUE/0Sd43/YrVERXeMLuXqMiTeHAAPAgGBInbf83TIEFMnTXUmLWOKAXu1VJZvfek0kE8KEZbrmsJyQpgbf+2Eh4/LA6HHU2ek6NFfhMUPL4vXilZARSjBV57X+iqil2jjXF2dKgn9cjPOxWqvMQySuZ0FeVHmBapcDvVp/LPQi93UIVu885EAGnJ1NWDDJsGpsXlNssazO+Z4QezQz/N/HizYZ602uun+JULrbN45tvwp6puyz7Oo0YAzYrCd3/MEmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WYrOKEyJZgGSZsq4z5k33QDiugQZAEm52MwiAkY3Gkk=;
 b=OSybC/UJX2nCqX0WreEGNl3HnWPLpAFEO+Z6+4lVcVSd/SuPfdOtbklx79jTfofna+EkWU/hur68LgbfRGR6X0mDxrceM/WnlX+bzLaJ39zlW900b+kSBtpr/U72/ZNZwTsusn2dyfR+ZMQYLCr7Z2AEypOjxR1Zav7s0HriyJ6XNawSbfSBO4n34Jh8SQAApX1eqS0Ftj43UCLV/tLdDlOEqNMUxjmv2+P49J5Qj51LTIa/OvQ5NKru4LS2/nz3w2ktKhfVmZphjN3LqsHl+YZ1XFYhL1A/udtWKkLThsu1niU85y8kijmBsabUICN6ecjzGfLyzPmDTrdjW+DuXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=suse.de smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WYrOKEyJZgGSZsq4z5k33QDiugQZAEm52MwiAkY3Gkk=;
 b=HyHUdFbDOR22SpwsjLVzXGw9Vu2hnL5/IShxynt1nF0ca+A/EhtHhgabTkdHJageEiVr3j7kIBzLnRmZsKPyTksGnE0lnXIszy5yt4Rb5M8g5VYqxyiQ+4fa3AAXc37NMBbPU92g0epoynmPcfytwkMEKOqy3CdtzJfCjnX5css=
Received: from SN6PR05CA0011.namprd05.prod.outlook.com (2603:10b6:805:de::24)
 by MW5PR10MB5737.namprd10.prod.outlook.com (2603:10b6:303:190::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Tue, 18 Nov
 2025 11:53:27 +0000
Received: from SA2PEPF000015CD.namprd03.prod.outlook.com
 (2603:10b6:805:de:cafe::2a) by SN6PR05CA0011.outlook.office365.com
 (2603:10b6:805:de::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Tue,
 18 Nov 2025 11:53:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SA2PEPF000015CD.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Tue, 18 Nov 2025 11:53:24 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 18 Nov
 2025 05:53:23 -0600
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 18 Nov
 2025 05:53:23 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 18 Nov 2025 05:53:23 -0600
Received: from hkshenoy.dhcp.ti.com (hkshenoy.dhcp.ti.com [172.24.235.208])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AIBqulQ006869;
 Tue, 18 Nov 2025 05:53:16 -0600
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
Subject: [PATCH v9 3/6] drm/bridge: cadence: cdns-mhdp8546-core: Handle HDCP
 state in bridge atomic check
Date: Tue, 18 Nov 2025 17:22:52 +0530
Message-ID: <20251118115255.108225-4-h-shenoy@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251118115255.108225-1-h-shenoy@ti.com>
References: <20251118115255.108225-1-h-shenoy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CD:EE_|MW5PR10MB5737:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ca6494f-b87d-41b9-2956-08de2699147b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Kcx3hpfT4d71NiC5zung5JKU5/CXEf7zoYbTqf1c0O/WBXmjKN9JzM+DfsKH?=
 =?us-ascii?Q?OyEtiIx+03l+DsWrMUNSSPx1YlOrA3fx2ERkkcNE/6sqYYZSB49r8idFZ9Xm?=
 =?us-ascii?Q?2QjBMkUWtqrxZ7frBRZJdTzolBltLZHYJofex/7ccNpWdy3bku0eUM/2oIRd?=
 =?us-ascii?Q?908sOpvuvem5bZ+aauPPrv7BBTIp3HezkcY3u0i/EAOxBSyVUNbB5drY5F58?=
 =?us-ascii?Q?qKpm1ERM3F/nnkLC+SlZmFUao2dsD5vCZtO316svp9o3osw6YrqLMdPOYJjD?=
 =?us-ascii?Q?Fnvw0M2nmo+EhKBdkNDChLeFkRrkRConBoQokpTCpRalU5p/kDxxFmgp3gK8?=
 =?us-ascii?Q?lbf2vDhqEExbp1h38k4eOjx0iMMHqdYqBrNOvQkbueKklFE3/8jGp55XRIjA?=
 =?us-ascii?Q?VgNd8Yz4KLjzibEgtx8HcDDYwdlgLjSprpCNAB6llz6arzLqhyMuhbBCBcxO?=
 =?us-ascii?Q?08DzGWLJoS5/qmXeeCGIh+SCyT0ai8/oLXt/3fTCwESalit9P1c1tguGodjX?=
 =?us-ascii?Q?GpsKveAQFexG/mnc37A9iaG83OQfUlXrnRlFNc2OpHp4iHPLIYgsvuqhbRup?=
 =?us-ascii?Q?tbCRSpH2SE4fxKiahbL8Ap3bMaFe/ZPKovtcqsrLFw5Jg9Fgyaftbac3ecrp?=
 =?us-ascii?Q?mJWRyp+bE5NuVaT8uefH7q3mY9SRHv7RU6UqFhcQ9uy0wg43Gk9r1ng+UcFX?=
 =?us-ascii?Q?27UvME0C7OVz4J+6ti+WBTOeMNvlsL/TG9zGMm5sr3+vnxLmqxod72XCkwyS?=
 =?us-ascii?Q?J2E06uzAXhffk2uMMUcFsn8RnCHPo/lrjxr+Z3HWBTOGVJGfZ8IzOD8xxfhx?=
 =?us-ascii?Q?gk+vC6vUVabPJ2QLZt+8Vwd3nZABowaAtr+srR3xhd3eEMFgQXf1qKap/UPG?=
 =?us-ascii?Q?IQWT19c3Dzw/NDXRoLCSU6guSKOQGImW2YT4XkbXhgWEwcQy43UfB3zNX1eF?=
 =?us-ascii?Q?bNibXJ0fFU8oeVw88rv5xmtq3W6s593Kk7Tv+QFYbLqDgaYc7fvRbLaI9VdD?=
 =?us-ascii?Q?1qe0FwsKOl8/e8gETfpJ+RX3LciJ9qcG1Z9B54Hsgdtt5WzmrriHZsk9nbj0?=
 =?us-ascii?Q?YVkX5nnkhFjA1fnyOgwu8Tbui0B1vqTNtxYehbG9Mtg47t+Ct1ILx0UuO7JS?=
 =?us-ascii?Q?+GWHlbVfYS6DXqZFL4vedigOZVwPLWd/3letq4GoeWjsJiQlZxd9pUszzaXK?=
 =?us-ascii?Q?2N1csBV1waNBRDkDbLnG9c8pzMDKMf1+aH1M7albOtTqPPCum7bZp1daw2Kr?=
 =?us-ascii?Q?8OXglvZ2AJtV7WtymGYSlIlzaGQVX6p232P+USccBK5rX98G+FKIuz2N+q5N?=
 =?us-ascii?Q?09v6hCBlhtx477hjyd6wGMUr8PQSRoX4siMpmFZpS09fVyRxWraTwc0TkFBs?=
 =?us-ascii?Q?UUO9is5fgkAW/hIkpIjIXeaC6U/3SB9WC6EbFj+RbmoJSkUQa/6Dq0cqZ9t3?=
 =?us-ascii?Q?rnQSHz8FBNVk2C0CCWZsIkwBCtPhSWw1bX4lj1McvGjgeevnN7fzBJ/8KKiN?=
 =?us-ascii?Q?INCQuf6i+2ycrQEL+Mq9pesh7MtgM4J0wGASAjqRHPKA0hSEPIp7+YFk4Jwt?=
 =?us-ascii?Q?lPkjBJEWvfeEicEiHHRvWSxSoV5kXbfIIKG7ZonS?=
X-Forefront-Antispam-Report: CIP:198.47.21.195; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:flwvzet201.ext.ti.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 11:53:24.7782 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ca6494f-b87d-41b9-2956-08de2699147b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.21.195];
 Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015CD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5737
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

Now that we have DBANC framework, handle the HDCP state change in 
bridge atomic check as well to enable correct functioning for HDCP in 
DBANC and !DBANC case.

Fixes: 6a3608eae6d33 ("drm: bridge: cdns-mhdp8546: Enable HDCP")
Signed-off-by: Harikrishna Shenoy <h-shenoy@ti.com>
---
 .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index 7178a01e4d4d8..d944095da4722 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -2123,6 +2123,10 @@ static int cdns_mhdp_atomic_check(struct drm_bridge *bridge,
 {
 	struct cdns_mhdp_device *mhdp = bridge_to_mhdp(bridge);
 	const struct drm_display_mode *mode = &crtc_state->adjusted_mode;
+	struct drm_connector_state *old_state, *new_state;
+	struct drm_atomic_state *state = crtc_state->state;
+	struct drm_connector *conn = mhdp->connector_ptr;
+	u64 old_cp, new_cp;
 
 	mutex_lock(&mhdp->link_mutex);
 
@@ -2142,6 +2146,25 @@ static int cdns_mhdp_atomic_check(struct drm_bridge *bridge,
 	if (mhdp->info)
 		bridge_state->input_bus_cfg.flags = *mhdp->info->input_bus_flags;
 
+	if (conn && mhdp->hdcp_supported) {
+		old_state = drm_atomic_get_old_connector_state(state, conn);
+		new_state = drm_atomic_get_new_connector_state(state, conn);
+		old_cp = old_state->content_protection;
+		new_cp = new_state->content_protection;
+
+		if (old_state->hdcp_content_type != new_state->hdcp_content_type &&
+		    new_cp != DRM_MODE_CONTENT_PROTECTION_UNDESIRED) {
+			new_state->content_protection = DRM_MODE_CONTENT_PROTECTION_DESIRED;
+			crtc_state = drm_atomic_get_new_crtc_state(state, new_state->crtc);
+			crtc_state->mode_changed = true;
+		}
+
+		if (!new_state->crtc) {
+			if (old_cp == DRM_MODE_CONTENT_PROTECTION_ENABLED)
+				new_state->content_protection = DRM_MODE_CONTENT_PROTECTION_DESIRED;
+		}
+	}
+
 	mutex_unlock(&mhdp->link_mutex);
 	return 0;
 }
-- 
2.34.1

