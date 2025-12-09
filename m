Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF0BCAFDB0
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 13:04:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F1FB10E1A1;
	Tue,  9 Dec 2025 12:04:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="jgT9+vUA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013034.outbound.protection.outlook.com
 [40.93.201.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C8A010E1A1
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Dec 2025 12:04:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IomAcUwDTn/ncKNd1l8Wm6xRKrjWOp5/z+9b3igvwI6D8c7AfCm5mYxLNlsiC2ptbu1Y3cKV+8NkgyACawpvK/mmqWC8hZ7NYICTthQ6q7BvGrvAQqmJyi/1VZThfts5nOQYbOxosLS+8FD19+QH5QUDgM+Oj7tLtS82PRcDV0b6NZ1uHg7E6+wrlzpz0NtDRLZBJHQkzEc8+2bmPMYEOpJ4bb32u2AfytLCH/e7/HPHJPxwUKlk8fBTtQdrLQUkcDsPTwSikHh3ljQipgJm3GE0MNOiayHuaVzJfb681BQDTETfU6ov4N6FfLD6ONQ5mB3cKynbjlC6oCoUWnK5GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BwaA4U/fQpp5H7j5yXXYeazoV/bnMHMmh8BE2TIkylw=;
 b=JTgX3Chtzom37OPJ+894im5hgAD6b0EJ+Z+kbixrNdLjQK/Un27CH1AGjHPbQADdqxz8UjuiOpi15p7nzUAkg+N/YN6IE9h0JTzo3YIz3t9hO3CvuUk+gEO3YN9cFS6t8G2GmonlMIw74SoUh1AYzkd/uWI/GNGk0dVd7XIBQEDstdNcFTQQv6Bcby/ioIG9ukvsFtyv1u5LLayY9ECwcA+ing1XwPK19MVvn0DtYcysBaRWdh4HzWSyufdu+e+dkZq0tryrGKICVIQXXLAZugbRX8SrNJR3g05wflWRO/1ykMyJwu6kQbY57FdBUHQZxq+n3Aww5Imo7SJ34SWMOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=suse.de smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BwaA4U/fQpp5H7j5yXXYeazoV/bnMHMmh8BE2TIkylw=;
 b=jgT9+vUAcQntjmChYl7vV75OPApa6Di7rWGTSQdtWXU596UjXVocle/xh+6zI9QJTYg7QmyiUs4fPpgmfq/bCsHI7LZn90J8x16llTFAP1tE1dFDzPyLvw7e5mYdakFqhGFRV64Rvuh0f9Zqk8sCbG3jzz3Fs7l+tVqEraoEgoY=
Received: from SJ0PR03CA0023.namprd03.prod.outlook.com (2603:10b6:a03:33a::28)
 by SN7PR10MB6449.namprd10.prod.outlook.com (2603:10b6:806:2a0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 12:04:07 +0000
Received: from MWH0EPF000971E2.namprd02.prod.outlook.com
 (2603:10b6:a03:33a:cafe::de) by SJ0PR03CA0023.outlook.office365.com
 (2603:10b6:a03:33a::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.14 via Frontend Transport; Tue,
 9 Dec 2025 12:03:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 MWH0EPF000971E2.mail.protection.outlook.com (10.167.243.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Tue, 9 Dec 2025 12:04:05 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 9 Dec
 2025 06:03:59 -0600
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 9 Dec
 2025 06:03:59 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 9 Dec 2025 06:03:59 -0600
Received: from hkshenoy.dhcp.ti.com (hkshenoy.dhcp.ti.com [172.24.235.208])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B9C3XBO1165975;
 Tue, 9 Dec 2025 06:03:53 -0600
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
Subject: [PATCH v10 3/6] drm/bridge: cadence: cdns-mhdp8546-core: Handle HDCP
 state in bridge atomic check
Date: Tue, 9 Dec 2025 17:33:29 +0530
Message-ID: <20251209120332.3559893-4-h-shenoy@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251209120332.3559893-1-h-shenoy@ti.com>
References: <20251209120332.3559893-1-h-shenoy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E2:EE_|SN7PR10MB6449:EE_
X-MS-Office365-Filtering-Correlation-Id: cb5b0f52-ec1e-479f-e55b-08de371b0d46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|7416014|82310400026|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vNYZHoeYcUbKGPQlAqvfy7fUr/dQfue0rpeiNvxAKjjOo2RRnefl+ty2JYAb?=
 =?us-ascii?Q?hKb8BoGfpaBiwvzqZoqMKFn01N9jZne7IA4tIBeDJ9pStfEBiYI1PXMTEfA1?=
 =?us-ascii?Q?XHo3zxo2oOmk71m0w/CKmFBwi8mOdP9Vg+PcicD37k94sxHb9OKKovF6QlNL?=
 =?us-ascii?Q?eGomJmAPDfv1g5zGCwYyi+NK2zszBjo8ne+4CmGHVsgIFJAcHbOTSc4yRafk?=
 =?us-ascii?Q?k1j9tJNqyY2GuaHFq+FhiSUaUx2Huk+XvAlKIaYCpd2pliS3pjb2UMzEyonf?=
 =?us-ascii?Q?dgvTvOn+m6f0hESCszAqT/nIIusOcMepjAemzh8CSqJc6i4HC40dTEeQuUmY?=
 =?us-ascii?Q?CQGoJhuhG7nmN3doj+xOXx+94H+LBSiGw+z9zg4gAa73PB9o5QKktGconw/s?=
 =?us-ascii?Q?O0FyoK6bywZijbJFnq33YMO+1A8kN8fJy6VZ4scn3lB3nAcW00jp/3wg1WyW?=
 =?us-ascii?Q?SgbDqajWL9RS49DlvpcChMO9YTGi8ExqzmFvZu4fipVTJ+R03ODcxx9SFNtx?=
 =?us-ascii?Q?Ah5DlFhECwSbE037Ll3KtZ466gxDhJGvDlB1cAso5NWHl9stOQ9Kx8HmTIAO?=
 =?us-ascii?Q?oP9VlNs58UwSSOY1akN4rrgN0jAo3i9usEZKyVeVZWEOqyXOWAzF2MTFO004?=
 =?us-ascii?Q?YBbXNAXS2OXkkDNJHmaNDQgvpM4BgZb+MHd3hX1nGcN9iCjocW0B7gaPT4WK?=
 =?us-ascii?Q?st8FftJ3OFMMtcVgwh68jAj/gwlekddIqSOkpm2NKFuvHmSdYr6yjFd/Ttmv?=
 =?us-ascii?Q?SY3zT3oDFzY9y8SrHZMHTRdNAMABr4RUl10AC5bFYpEbGXIIU72kJInJw49H?=
 =?us-ascii?Q?WJzwGAQJZCYmIVdpCIwx5oHmi9fPxOv4RWQfDyAD9/2lhu/t2QosV/m3hGxO?=
 =?us-ascii?Q?KgKnCDxIkOCtD3431tSMLaSePJQ/tTXASmrj3McghV3LzyA0ellFuUxvDi/I?=
 =?us-ascii?Q?xnmEb3Ph7lDBMK1R67AFeJJ6Y4JtaX9ZrN+SI6JivNLnISkKi5MLu/AVGgpL?=
 =?us-ascii?Q?tbA75h4ZbZ0eDU31igVJ9EFxfpWU/A7ls4llG5w977CMBxkNKcCo4+5Hv3mZ?=
 =?us-ascii?Q?WP1SvfkhNv4bOFXMxFcDAlLDN/SnmXoLavnAF0hcrMVi2E5UvhDKxwc55lmA?=
 =?us-ascii?Q?s9OP9XEC6DhSKBdarL339YgHq08Ds+lTahfL7vfT1LMr3JX69pouExU+6OvF?=
 =?us-ascii?Q?tuZv8KXU1s2dkwxFpkKOw6oPnJR8wqlUUVyk2BWUfzgRsiS5wF8Y6NIWzHCe?=
 =?us-ascii?Q?xFf10Vi3ZfJF24I01XRS4GFvnYWCBpCno3W6iYEwslG/DUVBeEiHyLBdq6Fc?=
 =?us-ascii?Q?rxcgF9NVNGMIw6Jyiwk5tNZ31v7m3LOcKo6hcFsnwNQi/UzgLdT/I5VyW9NN?=
 =?us-ascii?Q?R3aaaRBFOI3SqxsN/hdj5y20+RXp6G/jn1Ub4bE9bw/F382cZPhIGCPshZyR?=
 =?us-ascii?Q?tIHpNoz8aAlJdpImt0F0xZuf4lgXTItCoi2+y7HA+gotV5zwvIv8wXvkfyY/?=
 =?us-ascii?Q?Xcuq6WTAqUXXIp91adcTk+HU6/2qwglI+97IbqXV+fudPm2wXcxUKyp3yIWM?=
 =?us-ascii?Q?GWkAxA9FORvMjwrsptmUn5CKusNMt6Q4Mu82KrMG?=
X-Forefront-Antispam-Report: CIP:198.47.21.194; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:flwvzet200.ext.ti.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(7416014)(82310400026)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 12:04:05.8366 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb5b0f52-ec1e-479f-e55b-08de371b0d46
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.21.194];
 Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000971E2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6449
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

Now that we have DRM_BRIDGE_ATTACH_NO_CONNECTOR framework, handle the
HDCP state change in bridge atomic check as well to enable correct
functioning for HDCP in both DRM_BRIDGE_ATTACH_NO_CONNECTOR and
!DRM_BRIDGE_ATTACH_NO_CONNECTOR case.

Without this patch, when using DRM_BRIDGE_ATTACH_NO_CONNECTOR flag, HDCP
state changes would not be properly handled during atomic commits,
potentially leading to HDCP authentication failures or incorrect
protection status for content requiring HDCP encryption.

Fixes: 6a3608eae6d33 ("drm: bridge: cdns-mhdp8546: Enable HDCP")
Signed-off-by: Harikrishna Shenoy <h-shenoy@ti.com>
---
 .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index 2fb8acd363b14..7ee19b7cc92fc 100644
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

