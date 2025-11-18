Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F194C69338
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 12:53:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 870DF10E0F8;
	Tue, 18 Nov 2025 11:53:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="Ngiy8omG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010056.outbound.protection.outlook.com
 [40.93.198.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F00B10E0F8
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 11:53:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j3nEYgqU1GpQecXWufYlPFWvBl878NCPUsRpt4EFXB39F/3vAjGN7Mg0RpRr2kLr7ZN2kWgqvFPW6emcVzu/UvrLVc6Zgtnmu7flqOcXaSeCeGEIFp3efcHhWD73WOsrk/a/SHPeJLslDwpV0H7u1d1vaHmKWH/WRPDQxZ2P7j6E4SKWH5TkWoIGsbVSsy5STtEeC8fJ3fQ3ge0Iw7Y0clJqMkAILDX47OZ8gsKdQ3jhEm/UndoTCxb46SkqV44oonRxVb/YxwaHNTA6Dho2cl255eV8RP1+ITDhna22DSVTTqbliy3APM/ULdCZlrBM1lTSoV3Z1OKWPP3JS4Os6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eZyBKdcRoj+kzXv7fM5tYkF5MUN9Hy8a62I0Q0eL/QI=;
 b=Cft+EoNq3t+42JZB7SGiLVEbOzFVoAgAanVsEoxGgpb+8YNN9mwdqx2ZnGH7wiTuIozFXYB+MGeKICuZJ+LZFYsYotIZv5G+A4jxg3uWOh1wHitJpfGl+cFCdKjkM4VE5bIlcvq2PhLQ69uGxY5nDaRbrDO3RUUKVam5/C7tSqRpIr7iqX/PWN2MMzgOseRpA0WyIyMXnm+DiD1J7a9Xq0RCmEpliR2UvMC5sqktm2lpRLVI6Vyi9IIsYhY9BN7ln4kHFgwImci/VO80EyL8SYTBXWZXUIvGU6QtGVqiAV9PzwgN5ASl0NyZUh9/7IuIQbKiVd06rOuSDkALmIWinQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=suse.de smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eZyBKdcRoj+kzXv7fM5tYkF5MUN9Hy8a62I0Q0eL/QI=;
 b=Ngiy8omGQYDYzYK4beK5TUz2Uzm9ub6Q8Eu1qQ68BdCRbOfiXImgLpjl6oyBou6NnzQ3ptzGNG60pIDOcH86J7TP2M1K9yYuifLJ2kOoLT2jFwaHtBTIBmFUSEnmglY+YGYVx2aQPwFQUwBZM6bw2H2ugDsy16KO2fMf5/tmN2k=
Received: from SN6PR05CA0032.namprd05.prod.outlook.com (2603:10b6:805:de::45)
 by SA2PR10MB4731.namprd10.prod.outlook.com (2603:10b6:806:11e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Tue, 18 Nov
 2025 11:53:17 +0000
Received: from SA2PEPF000015CD.namprd03.prod.outlook.com
 (2603:10b6:805:de:cafe::ed) by SN6PR05CA0032.outlook.office365.com
 (2603:10b6:805:de::45) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Tue,
 18 Nov 2025 11:53:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SA2PEPF000015CD.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Tue, 18 Nov 2025 11:53:17 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 18 Nov
 2025 05:53:16 -0600
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 18 Nov
 2025 05:53:16 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 18 Nov 2025 05:53:16 -0600
Received: from hkshenoy.dhcp.ti.com (hkshenoy.dhcp.ti.com [172.24.235.208])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AIBqulP006869;
 Tue, 18 Nov 2025 05:53:10 -0600
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
Subject: [PATCH v9 2/6] drm/bridge: cadence: cdns-mhdp8546-core: Add
 mode_valid hook to drm_bridge_funcs
Date: Tue, 18 Nov 2025 17:22:51 +0530
Message-ID: <20251118115255.108225-3-h-shenoy@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251118115255.108225-1-h-shenoy@ti.com>
References: <20251118115255.108225-1-h-shenoy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CD:EE_|SA2PR10MB4731:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e1c342d-26b5-46bf-feef-08de26990fed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9t9CveTJQsct2x9k1Z3nFbQd0tl7ONH0M+2SW3KXFLPkThkDvJ3M3m9+0AAc?=
 =?us-ascii?Q?CWW6w7GXl9wQSfCMQV0XwlR4IcNNKQQBpeKLsYFsbOLz+xUWzqgP9NDRCdg8?=
 =?us-ascii?Q?WlrSADvDE9UL9eeG37df1Pzvbb2FyF8saS7QRbfNxMg+bxqccokdSWU85Gdo?=
 =?us-ascii?Q?0vIEKiXnc36IBiThIsxf7TrWebq1diJYP5fgppvNesHfEf0JLscCp12ZMPcS?=
 =?us-ascii?Q?GoBv+eXt6Tsrej0NgtukR0StgGhY2ydOAQW0ZvspTUqq5JedjLrVQtyfPMjF?=
 =?us-ascii?Q?setCFFVvp5UCHVNve6ZZXMofQ22tuusK9TlvrCjECtNuZKOaetCHiO01wXuT?=
 =?us-ascii?Q?mtPjvptsOMiYOAlZdq2FIdUqQsMZIzvlpdp1llW4PwFLtdUMJ+1P6AJOzKld?=
 =?us-ascii?Q?GGipdWZoru8gT+A5QnQtBh8BxXbGW0fpux9kP7n2t0NCU035AQWudvsmkIxG?=
 =?us-ascii?Q?5cMrZOIFtrCWVYeCRLLKYRmkNG3wO6R8bfMK6toeFVzrfZ9OUzcVqwcKWO2K?=
 =?us-ascii?Q?zqsomSX87SkNLcJn8vNdeAZTfF7UiZidGp3X/ekmpAEjO1I/S1No/VzB/Hm2?=
 =?us-ascii?Q?o//OnTkkHzz4fR+xqR8mYBvcM/YEzH9Q58ilnHkz9VErwv9NiyZuuYyoitUa?=
 =?us-ascii?Q?wpMf1PYHF1kYqW1F+fthmgIfRgNm3KPydcgUPm3ISTYJ/npy+VUBWQoFhIXu?=
 =?us-ascii?Q?wtB0VAEcYR2JwFw+O7KDO/MQPVnRssi/CVX9dmOeGa0OLInnWqUrPEEqTf9r?=
 =?us-ascii?Q?Sq4zBs4pICh7FvResAVrI4EdEu8xXWCaZJheTfIIBK6HP3yNu9OBic6SZ5Z+?=
 =?us-ascii?Q?HpKDZGahl5YMcmShSWqQs+JlADs5YK3DUwyH7H6OmT945bR074rqUCLKZYTZ?=
 =?us-ascii?Q?Os5iQ/4BDG3LaY3G7zdU8W/BUrNMTRBPqi/YITk93CgCw8k6066kzLboahDc?=
 =?us-ascii?Q?yTKZ0zfoTpOw7wDZMxU8IRYx8jhcdjfBePRzDhHMeFlp3nWDIFTaZoq/5saS?=
 =?us-ascii?Q?raD44yg6jyYp1B6m6ogSNlK/EgIgph+Sx6EAqJFgso6S/rJIqp/t35cmDZkp?=
 =?us-ascii?Q?GiwSSHAFjAajEedB4B+QjOtFANR0r/AniCbSMpMH14ISvj0JwFHWFsdrki41?=
 =?us-ascii?Q?Uz+BG95g3HM7meolqHl1xXS7PACuS9lHArVBuqV750JLf1FVABAlCN1qRWWI?=
 =?us-ascii?Q?DtG4ScWvmsjkUco4oGWXw3asZ03vB32Av0voNIpUsS7SGbHAyPL+hAecPyyQ?=
 =?us-ascii?Q?BNi5qEES91K6jgDY8/z7g8YPXH4HbYjxwGTniEl/k9/OEm1isxR6aDCtWyb3?=
 =?us-ascii?Q?0bAuP/jhV/co4QwD2XHoFsgKTp8weCJUxQk5ka/FW7CTEYqshG5khzAKDtC1?=
 =?us-ascii?Q?QBejB9iE3KBN5Lnuyd53w9mYFYkRBcsiPiPM04lRdhpfdKH8kJ6UKd+GWNGP?=
 =?us-ascii?Q?J6mQp9X3RTEIVst8Q8fTV4CG9Oxt5P5U7ZyR6o9TMQlA9eYh7xoR9+VtqxUT?=
 =?us-ascii?Q?iXq2RfA/WoqymfYCHf7ZkkWg5slVA7ppjs0wJ29Fezz3q6nRdbL0OV25y+wx?=
 =?us-ascii?Q?O0q47rfQcyTgM4Z5Sag6IxIqGZp0Nx7lY3GCCciJ?=
X-Forefront-Antispam-Report: CIP:198.47.21.195; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:flwvzet201.ext.ti.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 11:53:17.1568 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e1c342d-26b5-46bf-feef-08de26990fed
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.21.195];
 Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015CD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4731
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
this bridge or not. In the legacy !(DBANC) usecase, we were using the hook
from drm_connector_helper_funcs but with DBANC we need to have mode_valid()
in drm_bridge_funcs.

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

