Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 614ECC73EB4
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 13:14:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC16610E27E;
	Thu, 20 Nov 2025 12:14:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="NadxFfIN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012040.outbound.protection.outlook.com [52.101.48.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7A4610E27E
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 12:14:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rKi4AmJ/P69f7CwXt57wMy7hQprrCM/kjXqpp03QTLxOeK7BjUVJW8dGJDd8QYKj4Wgi7q+GyFefC5i7EMhpMgvJq2qud1UNWxYEZ7jRd70TZDV6xjfg25c594VAwII5ziAeZb2n/QNe2ZJRTYlkFyjDTjOpCmaWLzHEVM3qelYSy4SOEVc6GubqVtaXFA19fz/IZKBto8VffYifS2RngxtWLZmGu/riFt8Df1RWSYP0b63ynmfUyGnXuJ8YW1uZ4017R0QWG0tbUxOeVw/ZMXd6zpg1JTVUhhW7EyzNGdGvORUPwVACkNYENK0SNO9XuPabJKvebDbIm7uDveDi/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2A/X2cKJPzIUynJOP0tfMCoreJ4+oBhLtpm3lBxDwiY=;
 b=uP0d5ZyTOP3RCfWS8i1VpQ9Fp/X9q0o4Gc3vWRPN0+95en0Ck+zt+qTxp1g/XT40tmtWCQqXehcouVzIfMnpBIWmnMQ3DmE04eCAhnoxGqANJSlN1bFq8G3N6V04k6GCZGqg/lelR7VIOp3oMve5ViEHZ8dbs84vIOdS1Nlij6aIIBqXVnAH8Cg7GzkvgQmyuKqgRR9iGd8j9PDPzIiJ5Bb7eC4mjvP2xapJH7w1kAE9j/pVZeypnS/S1nl917qtUIZkEiQySo9E+LMtXrCx1g465sxo2Vh42g2Ha8oQLcf3sBLsrQf4n5t32KqY0En+CzNvGt1OXeIgzbLyhJ6jJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=suse.de smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2A/X2cKJPzIUynJOP0tfMCoreJ4+oBhLtpm3lBxDwiY=;
 b=NadxFfIN9UyPbGAR33mW/PGm/6LFZ3q4R+0ZqHnRa4XvE/uBuT9mXmHET50LTccCP18REX8cKPoANN+jGZ9YMBo11QT47zriHO96a693ej+s0CN8koDNkE/uFSy32Z1bzAILkwGFso0OQ9pT11PFiJjcgZAxNJWb+9IDpUEzns8=
Received: from MN2PR19CA0040.namprd19.prod.outlook.com (2603:10b6:208:19b::17)
 by CO6PR10MB5569.namprd10.prod.outlook.com (2603:10b6:303:144::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 12:14:49 +0000
Received: from BL02EPF00029927.namprd02.prod.outlook.com
 (2603:10b6:208:19b:cafe::55) by MN2PR19CA0040.outlook.office365.com
 (2603:10b6:208:19b::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Thu,
 20 Nov 2025 12:14:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL02EPF00029927.mail.protection.outlook.com (10.167.249.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Thu, 20 Nov 2025 12:14:47 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 20 Nov
 2025 06:14:43 -0600
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 20 Nov
 2025 06:14:43 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 20 Nov 2025 06:14:43 -0600
Received: from hkshenoy.dhcp.ti.com (hkshenoy.dhcp.ti.com [172.24.235.208])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AKCEHDw3636470;
 Thu, 20 Nov 2025 06:14:37 -0600
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
Subject: [PATCH RESEND v9 3/6] drm/bridge: cadence: cdns-mhdp8546-core: Handle
 HDCP state in bridge atomic check
Date: Thu, 20 Nov 2025 17:44:13 +0530
Message-ID: <20251120121416.660781-4-h-shenoy@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251120121416.660781-1-h-shenoy@ti.com>
References: <20251120121416.660781-1-h-shenoy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00029927:EE_|CO6PR10MB5569:EE_
X-MS-Office365-Filtering-Correlation-Id: 4eb4c586-439f-4a50-edd5-08de282e660a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|82310400026|36860700013|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?t34yp0US0yZYxdw5lKaMxXaTw0/w4LpN4UsX6zIjPZiaKeTCf48Rm/9aC34f?=
 =?us-ascii?Q?ZbVOB7NIOgLVqkKmMBc99H4b5PLvBWgfEEAyrYG5+5PE9A8MUrKfKZ4DFgog?=
 =?us-ascii?Q?JxTfuteXRjXxDK7jjuZs1EOOpLT+IAwyMT6XpqzwDMsNebvTh876UJnmzjaI?=
 =?us-ascii?Q?BOkc34tzViTExHUqJc5+YWClE0HfdLirKTagol0elT6Qp9PPQRPEVHUqkQxb?=
 =?us-ascii?Q?a1AhHzZN0ltWs8e0bbuAvs9uMTn3pIUk+dNM2gbI5gKahV+VpfhRl6MTgRoI?=
 =?us-ascii?Q?VdandyegPnyhnlMBjFiebIQfqxY/M4k+6valXaZw+rcWZ7r3rd20VeCQUh2f?=
 =?us-ascii?Q?7WvwxcEWw0k6p/0c3cfOtGpoqWclyJpbCUheQHWy7thCfNTSxlF+TjerYBlD?=
 =?us-ascii?Q?UATBBUsgzZwcQLLDTfNUVhFqsP2AQna75xnBp0iZpxVxeTGYk2PJxGXvJMps?=
 =?us-ascii?Q?OiLbCccSMa3NQ4AVk5fF95duWuo/xPx6PvR/roMKasG9+5dlut54unVCi4By?=
 =?us-ascii?Q?EL8WJ4dTVn9j3HTJ1M+7Xq1bE6OAY17XGcWW9x3TL+IstEWpL9USsIQI10dM?=
 =?us-ascii?Q?V80y6JwI06m4Hhu5/QFeEOaQ9u8bKb5uz3LMvdGafeRjHP7CCVxb/f7861CT?=
 =?us-ascii?Q?wm2/4PYAb58gBLnCKZ7r1jffIm5x7UWtVEQtnFJjSD5cMmBKMn6OsxIScWeK?=
 =?us-ascii?Q?Pm/1yicf/BeEUfhvoTy4dZvn2GUE+SxFa9kaRbHFwZ49bL4AqwYYDUJJYkKG?=
 =?us-ascii?Q?QApZNqeqqGhRtH/zJ9PcRqSKvhKpBeNFulKgy7YBT7WNR7W+U923yqXX4roX?=
 =?us-ascii?Q?e2591mY6eL742D9dJPmKUFA1vSunha1QssBpGwXbehOMxo7wH+LdzApT+48a?=
 =?us-ascii?Q?rHqS9UQMVSoPGEPt1jfZh7eScyevROKzu4q8o7un/w7XtKBWBXc7LJzNIPFA?=
 =?us-ascii?Q?rcBa/XIdmi4SCoMC2/OMKMHo1+xCtSoAxW4Y1juDmf3zE+ienw3RNN4OBuPf?=
 =?us-ascii?Q?mk6WM7FY3dcJ6v9fGuDhU/MBq0T4bJQfa8sq5vjC66ZQ/NsnDo+sIFBkCMt3?=
 =?us-ascii?Q?OO0xarn3q9/QN2AWZz/m5P8fuISviM2yNyAiuZPevFP7ww74PaQbA9SGW7BV?=
 =?us-ascii?Q?Ht6hf9HKnfMbZNlAP6dLBLPNJZPQfcCda2Ixaf0jgucAe+YlcZflJcGsGKwM?=
 =?us-ascii?Q?HtsnNM9VhW49jUsmdAGT2MT6y64v/0PrqIOCvd24TXUbuDVrFW+x56ImtKkQ?=
 =?us-ascii?Q?Eu+NPNyho9o/SKngD7/N9cZ/xPVPF5OX1p4ELKk30U1RRcFzNOfnj1yzlijM?=
 =?us-ascii?Q?A/CiaAciz3gE5ueXoI15YxyFjuV/vQPju3aXQuB8KswPxu8ZTwJIbYhgblPh?=
 =?us-ascii?Q?phgrqJ0ELLoeDQFuL/F7/cZa4n3QMgt5jDKlM8McompatCyJuvBLibi0Oggk?=
 =?us-ascii?Q?n5YUDp99K/ofSOLWLR3LTby/mkiRekqTnf8F/Z7OhhZFBgmsnC1wMbCBJriz?=
 =?us-ascii?Q?EMhcvRr0g1WGfTALgN1RHTnCIPK+/ilom40Prcua+07vDvmgE/hiW3Z2ak+Y?=
 =?us-ascii?Q?AmLYp9fzSBKGrfNMnoMfFjjWbTTJlC4DKw8cFpDL?=
X-Forefront-Antispam-Report: CIP:198.47.23.195; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:lewvzet201.ext.ti.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(82310400026)(36860700013)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 12:14:47.7616 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4eb4c586-439f-4a50-edd5-08de282e660a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.23.195];
 Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00029927.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5569
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
HDCP state change inbridge atomic check as well to enable correct
functioning for HDCP in both DRM_BRIDGE_ATTACH_NO_CONNECTOR and
!DRM_BRIDGE_ATTACH_NO_CONNECTOR case.

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

