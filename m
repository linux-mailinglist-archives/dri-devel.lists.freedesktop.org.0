Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eATSBmtahGl92gMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 09:52:59 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D66F012B
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 09:52:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E42DD10E7FB;
	Thu,  5 Feb 2026 08:52:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="uIOqu6cE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011064.outbound.protection.outlook.com [52.101.52.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FAF710E7FB
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Feb 2026 08:52:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qKAGhTofHXc9+8H7/GgGq7P7Z6Vjv52Pr+WcdfXc2ic2ypI9xEy/GkYQA8S1OpyrbZRo7++okDy5gW/U1rk9AAI5B6a8xplw4AfY9yh256vANLBJhN8J+kDX6fE7UKPGnq+Fd2K17Z4AJdLzLEedngmoacyRNcQTNtH5ph4ImjwdP/U8KGQgUXJj+scSlRUVWjGm2CceUx2TiHfAO5W/5mXl2To4ILrjNi7yuvlAMTGNP+bhVjUMWintAzVxoqVFUZOGFAWSWq92k8FGDNkEcyZNxgZgsz6paRTDediXBXnQKlw/6i67uwPgQ9KDM3BuDRqpoVi8H9ThwvJxYxVZSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NLpsjcB8HrL445mSkRYFIqL3rPIp1M5/rUHGA1duaHU=;
 b=GyoFbZ0PKQNHaaAOAXUBMOGXyWQeDIsjsr68jdT6VdFgsc1XQOfEBW3en9HUGSPJikbGXn/w7ilOpUQkT03PceJzGlnIZIUZty08s4pTrE7VE1reA3+vb4LZmnF8AdZ45yo38NS4WxhogIcW549n1Ux2qSNBLkZa//9NUQqHgsw/cUx70xesYTs2PfAYXOBTqNDCYCxEoGDxv9421w9obDwEJL6+M+GhTzL8IOqkm4Fx+ZrUAt30o9FG/kSSmaeCJd3qZyqaWR8rtB5mfXn4Cr/uIKlofEGHbbRaQBQ4D6ywLBsE1wLNTcJGGd2J1gpXy7LltR1y40AQw9taQfQUSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NLpsjcB8HrL445mSkRYFIqL3rPIp1M5/rUHGA1duaHU=;
 b=uIOqu6cERWactK0zR5asG01iFk2XXNvOC+vqX3JJpWnza8rNYlRFWbtm+x8LcvcokM28iB7EjkzYpFIELsrbFz5Sffwf/mFgwpAfJGpgMn42f9kXtL/tFFHfq/t/hG6mYdRRyZRwhPUl94U5UJuUgvW/meKJbfafUyGkPyX6SHM=
Received: from BN1PR12CA0017.namprd12.prod.outlook.com (2603:10b6:408:e1::22)
 by PH7PR10MB6225.namprd10.prod.outlook.com (2603:10b6:510:1f2::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Thu, 5 Feb
 2026 08:52:50 +0000
Received: from BN2PEPF000044AC.namprd04.prod.outlook.com
 (2603:10b6:408:e1:cafe::25) by BN1PR12CA0017.outlook.office365.com
 (2603:10b6:408:e1::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.14 via Frontend Transport; Thu,
 5 Feb 2026 08:52:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN2PEPF000044AC.mail.protection.outlook.com (10.167.243.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Thu, 5 Feb 2026 08:52:47 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Feb
 2026 02:52:41 -0600
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Feb
 2026 02:52:41 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Feb 2026 02:52:41 -0600
Received: from uda0543015.dhcp.ti.com (uda0543015.dhcp.ti.com [10.24.69.9])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6158qZ9f3129808;
 Thu, 5 Feb 2026 02:52:36 -0600
From: Abhash Kumar Jha <a-kumar2@ti.com>
To: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>,
 <rfoss@kernel.org>, <mripard@kernel.org>, <tzimmermann@suse.de>,
 <airlied@gmail.com>, <simona@ffwll.ch>, <devarsht@ti.com>, <u-kumar1@ti.com>, 
 <sjakhade@cadence.com>
CC: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <s-jain1@ti.com>, <p-mantena@ti.com>,
 <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v2] drm/bridge: cdns-mhdp8546: Add suspend resume support to
 the bridge driver
Date: Thu, 5 Feb 2026 14:22:33 +0530
Message-ID: <20260205085233.81678-1-a-kumar2@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AC:EE_|PH7PR10MB6225:EE_
X-MS-Office365-Filtering-Correlation-Id: c90bea44-61c2-4ade-b77c-08de6493efd6
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sdJCw9VC8lK+uCQ5yEmkVOBnEJcpOIWFObfaStM4eFhQE+6PwPiZZxqcxYLK?=
 =?us-ascii?Q?TwbajfS85t17a9TL8SnCDAUWbwTJc2BJAgvrPy7UlAAZbo+qV43nDp5+SF8v?=
 =?us-ascii?Q?N1WL+rOQWvQI8HVNmuB5RqSlxslmNDT2kz8Urz3wOPNhyhKNJp7TeNoXNgb8?=
 =?us-ascii?Q?uvW/kkJa9CcxLLi3uD/xPiCAKDInILlqebhRKVvkzIirKZmPRQBXNaC99cFt?=
 =?us-ascii?Q?HdEsjvgEKBg7fnISKNhzLfw8GiKDRm2TL6aZZKvQPWMxTZlrVaSnazRPiehK?=
 =?us-ascii?Q?6kvTI9ReRM+My/s8nFchugjY0Zr9aBcQ/RRnB9r7H2WykZoDHFjc8EZg5dH5?=
 =?us-ascii?Q?OQuBthKsetZf8PS8Vqb0smW9sthqNfc0TnW24thihgPo8y008vlp3TrSAOks?=
 =?us-ascii?Q?87K7Mxy7aLh3RJSStZK+dP/240MHUtM8V6GJ8fza24XmfGWPxj6xg8rBHkf0?=
 =?us-ascii?Q?dDaFKZAbDB+SxJ8/o+hxRNiOtMtaO8s3MSOgp001HnJnWu3RTqjePkQwm2TF?=
 =?us-ascii?Q?CPSuPHUp+SnTucImr6RpBhflBwEig3qWtoci4n1zA56TrFZOoq8IbKoKW1Nj?=
 =?us-ascii?Q?rIpJI9Nh6YbjNkayV7qkhaB7qb/2cIFVa+RbY4F/dZv9hRKZPIeZAYFqPOm4?=
 =?us-ascii?Q?uu9bA9QgKiA5yaFkvOzoF671dCsVk9NOf4SFuksw7QWuaRAyBBoWWh99JE6N?=
 =?us-ascii?Q?XgE+Kroh6v+qNiWKJUTkeueE6F5idLfjNzKPoIlf10VvGyPDus6H3ap4qlWo?=
 =?us-ascii?Q?R6zJIwuO/qoZJNzKdbtLxedzX0RAKp5490JkBpU3onN6RQislWEK2dPQqi1w?=
 =?us-ascii?Q?9jSh4lMeQCO51GBIaujfLEwqv0XBG5op2hD8cG+iz9BRF5eNK3r19rSPouqQ?=
 =?us-ascii?Q?/3Z8+dVZ3dIIYaM5ic1tQn5Zfhca65oxVOdlvgx4hjLo2JtznCUHLKJ8O+05?=
 =?us-ascii?Q?IGEqEzy7se9v7ZnmfPsnRDqUjieRqc2RW4t2lChFWUfqXyYb8C5lS5TM8Xh2?=
 =?us-ascii?Q?pVrvfws7ss/PJy9ReDw+e5zxkD0gQchTKSkV1JGnPFuKVdX+qE3zaejNaONK?=
 =?us-ascii?Q?oIwVBA7TRdD2lOBZvBh+AXw5mGIK6S1aA88WnHqV8sdQ5kKZKL1Bhc4ENOL9?=
 =?us-ascii?Q?QJAGRzPv+4N9Ia/9rjAPaskCmgPfgsdYeNllASDGv1SVU6ftWslK+j0ZQR+P?=
 =?us-ascii?Q?jvOiKiVKNyWp4v1U5yvG4Djm2ebIL53wMvEIhUkKZDW91dzRvNJEj91wJ8EA?=
 =?us-ascii?Q?JCycs5v/FWpV8lI4OEK9E2nWJKyOGEq5KC7IDccv3ZpZcApAKpQi1qGQX2/D?=
 =?us-ascii?Q?iBb5GsjYkMYmzEyZdNn8RjLtfHUgsuNNQYGboBuS9/bHPv6TVAw8EP6a+vY/?=
 =?us-ascii?Q?p12e9mR3atB++7Yw5vHvZaSs7WUBEJVbbsd1vSI3ZG1x2RNK+MAEb1OnUJVA?=
 =?us-ascii?Q?KvdAhwq4PZMN+5wukIQuWeZNFIrJAe5r394dOmLBaAg1nwPfANkSSmwwDzYG?=
 =?us-ascii?Q?J+uh6xnK4BwDIFuftxxX/MAomXYy2U1YbA727NA8OmciP8FCB6VEj9ooyzPW?=
 =?us-ascii?Q?/Egtq9s0MATinCWuVtS59e4blOLBRC5lloceOFNEWWV4BTTPasgmoRhzf/Ln?=
 =?us-ascii?Q?6d5io3z8Gxy3lCIEC05VAUpGEBN+VxSCR51Pb/5qMLv4k6dYpKg6BBGOGlv5?=
 =?us-ascii?Q?mjO7/gtVLELmAx0ImY7uCm4npJk=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.195; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:flwvzet201.ext.ti.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: LLwssKJJb5MsgmgzAtjw8n7Massq7WiMaOHGotNjAy905utDGmK6sfFF5zScpl0xmVdqT5/6yPM+QsOtvvjPf5U/TMUTOpGGVVOhmzhiwF/NvhRitPq6Zr7fpiLZHzILlL0TB3ZGIRLr6dZWrQLwn6CQy/PBOalSKKBmrUwzZhIBMTUk7N3dOfcB0QNF5YvTmFiPsHRfYJSrHnBL91iVEs7ySFvaQQwFLERLR0llRAd+WLWv81Nd2Zzq1NSCgFqGnJh5Q8kgC5p2+pVidx583SvSdDCjL+s5+aoaOMd6S5lgxRFDZVGBpGUnMSFAbiIR6hWDX9y6FcCRfI+1xckpvZ/CrsmO8/iyQL4HhutY6D8CaL8plqF+2/LrrlH38dpTIV4PeUTg74uItEDyoWGKQpv6E+8Iu/YWge893afVnCkjZxH+o3CmsQ0YDJwW6lKI
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 08:52:47.8861 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c90bea44-61c2-4ade-b77c-08de6493efd6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.21.195];
 Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044AC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6225
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,ideasonboard.com,kwiboo.se,gmail.com,ti.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[a-kumar2@ti.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,suse.de,gmail.com,ffwll.ch,ti.com,cadence.com];
	FORGED_RECIPIENTS(0.00)[m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:devarsht@ti.com,m:u-kumar1@ti.com,m:sjakhade@cadence.com,m:linux-kernel@vger.kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:s-jain1@ti.com,m:p-mantena@ti.com,m:tomi.valkeinen@ideasonboard.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[a-kumar2@ti.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: A4D66F012B
X-Rspamd-Action: no action

Add system suspend and resume hooks to the cdns-mhdp8546 bridge driver.

While resuming we either load the firmware or activate it. Firmware
is loaded only when resuming from a successful suspend-resume cycle.

If resuming due to an aborted suspend, loading the firmware is not
possible because the uCPU's IMEM is only accessible after a reset and the
bridge has not gone through a reset in this case. Hence, Activate the
firmware that is already loaded.

Use GENPD_NOTIFY_OFF genpd_notifier to get the power domain status of
the bridge and accordingly load the firmware.

Additionally, introduce phy_power_off/on to control the power to the phy.

Signed-off-by: Abhash Kumar Jha <a-kumar2@ti.com>
---
Changes in v2:
- Fixed defined but not used [-Wunused-function] warning for suspend and resume calls.
- Link to v1: https://lore.kernel.org/all/20260129112016.2448037-1-a-kumar2@ti.com/

 .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 136 +++++++++++++++++-
 .../drm/bridge/cadence/cdns-mhdp8546-core.h   |   4 +
 2 files changed, 139 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index 38726ae1bf150..818eef1a57ffb 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -32,6 +32,7 @@
 #include <linux/phy/phy.h>
 #include <linux/phy/phy-dp.h>
 #include <linux/platform_device.h>
+#include <linux/pm_domain.h>
 #include <linux/slab.h>
 #include <linux/wait.h>
 
@@ -2383,6 +2384,120 @@ static void cdns_mhdp_hpd_work(struct work_struct *work)
 	}
 }
 
+static int __maybe_unused cdns_mhdp_resume(struct device *dev)
+{
+	struct cdns_mhdp_device *mhdp = dev_get_drvdata(dev);
+	unsigned long rate;
+	int ret;
+
+	ret = clk_prepare_enable(mhdp->clk);
+	if (ret)
+		return ret;
+
+	rate = clk_get_rate(mhdp->clk);
+	writel(rate % 1000000, mhdp->regs + CDNS_SW_CLK_L);
+	writel(rate / 1000000, mhdp->regs + CDNS_SW_CLK_H);
+	writel(~0, mhdp->regs + CDNS_APB_INT_MASK);
+
+	ret = phy_init(mhdp->phy);
+	if (ret) {
+		dev_err(mhdp->dev, "Failed to initialize PHY: %d\n", ret);
+		goto disable_clk;
+	}
+	ret = phy_power_on(mhdp->phy);
+	if (ret < 0) {
+		dev_err(mhdp->dev, "Failed to power on PHY: %d\n", ret);
+		goto error;
+	}
+
+	if (mhdp->powered_off) {
+		ret = cdns_mhdp_load_firmware(mhdp);
+		if (ret)
+			goto phy_off;
+
+		ret = wait_event_timeout(mhdp->fw_load_wq,
+					mhdp->hw_state == MHDP_HW_READY,
+					msecs_to_jiffies(1000));
+		if (ret == 0) {
+			dev_err(mhdp->dev, "%s: Timeout waiting for fw loading\n",
+				__func__);
+			ret = -ETIMEDOUT;
+			goto phy_off;
+		}
+	} else {
+		ret = cdns_mhdp_set_firmware_active(mhdp, true);
+		if (ret) {
+			dev_err(mhdp->dev, "Failed to activate firmware (%pe)\n", ERR_PTR(ret));
+			goto phy_off;
+		}
+	}
+
+	return 0;
+
+phy_off:
+	phy_power_off(mhdp->phy);
+error:
+	phy_exit(mhdp->phy);
+disable_clk:
+	clk_disable_unprepare(mhdp->clk);
+
+	return ret;
+}
+
+static int __maybe_unused cdns_mhdp_suspend(struct device *dev)
+{
+	struct cdns_mhdp_device *mhdp = dev_get_drvdata(dev);
+	unsigned long timeout = msecs_to_jiffies(100);
+	int ret = 0;
+
+	cancel_work_sync(&mhdp->hpd_work);
+	ret = wait_event_timeout(mhdp->fw_load_wq,
+				 mhdp->hw_state == MHDP_HW_READY,
+				 timeout);
+
+	spin_lock(&mhdp->start_lock);
+	if (mhdp->hw_state != MHDP_HW_READY) {
+		spin_unlock(&mhdp->start_lock);
+		return -EINVAL;
+	}
+	mhdp->hw_state = MHDP_HW_STOPPED;
+	spin_unlock(&mhdp->start_lock);
+
+	if (ret == 0) {
+		dev_err(mhdp->dev, "%s: Timeout waiting for fw loading\n", __func__);
+		ret = -ETIMEDOUT;
+		goto error;
+	} else {
+		ret = cdns_mhdp_set_firmware_active(mhdp, false);
+		if (ret) {
+			dev_err(mhdp->dev, "Failed to stop firmware (%pe)\n", ERR_PTR(ret));
+			goto error;
+		}
+	}
+
+	phy_power_off(mhdp->phy);
+	phy_exit(mhdp->phy);
+	clk_disable_unprepare(mhdp->clk);
+
+error:
+	return ret;
+}
+
+static int mhdp_pd_notifier_cb(struct notifier_block *nb,
+			unsigned long action, void *data)
+{
+	struct cdns_mhdp_device *mhdp = container_of(nb, struct cdns_mhdp_device, pd_nb);
+
+	if (action == GENPD_NOTIFY_OFF)
+		mhdp->powered_off = true;
+
+	return 0;
+}
+
+static const struct dev_pm_ops cdns_mhdp_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(cdns_mhdp_suspend, cdns_mhdp_resume)
+};
+
 static int cdns_mhdp_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -2494,6 +2609,11 @@ static int cdns_mhdp_probe(struct platform_device *pdev)
 		dev_err(mhdp->dev, "Failed to initialize PHY: %d\n", ret);
 		goto plat_fini;
 	}
+	ret = phy_power_on(mhdp->phy);
+	if (ret < 0) {
+		dev_err(mhdp->dev, "Failed to power on PHY: %d\n", ret);
+		goto phy_exit;
+	}
 
 	/* Initialize the work for modeset in case of link train failure */
 	INIT_WORK(&mhdp->modeset_retry_work, cdns_mhdp_modeset_retry_fn);
@@ -2504,21 +2624,33 @@ static int cdns_mhdp_probe(struct platform_device *pdev)
 
 	ret = cdns_mhdp_load_firmware(mhdp);
 	if (ret)
-		goto phy_exit;
+		goto power_off;
 
 	if (mhdp->hdcp_supported)
 		cdns_mhdp_hdcp_init(mhdp);
 
 	drm_bridge_add(&mhdp->bridge);
 
+	mhdp->powered_off = false;
+	mhdp->pd_nb.notifier_call = mhdp_pd_notifier_cb;
+	ret = dev_pm_genpd_add_notifier(mhdp->dev, &mhdp->pd_nb);
+	if (ret) {
+		dev_err_probe(dev, ret, "failed to add power domain notifier\n");
+		dev_pm_genpd_remove_notifier(mhdp->dev);
+		goto power_off;
+	}
+
 	return 0;
 
+power_off:
+	phy_power_off(mhdp->phy);
 phy_exit:
 	phy_exit(mhdp->phy);
 plat_fini:
 	if (mhdp->info && mhdp->info->ops && mhdp->info->ops->exit)
 		mhdp->info->ops->exit(mhdp);
 runtime_put:
+	mhdp->powered_off = true;
 	pm_runtime_put_sync(dev);
 	pm_runtime_disable(dev);
 
@@ -2550,6 +2682,7 @@ static void cdns_mhdp_remove(struct platform_device *pdev)
 				ERR_PTR(ret));
 	}
 
+	phy_power_off(mhdp->phy);
 	phy_exit(mhdp->phy);
 
 	if (mhdp->info && mhdp->info->ops && mhdp->info->ops->exit)
@@ -2581,6 +2714,7 @@ static struct platform_driver mhdp_driver = {
 	.driver	= {
 		.name		= "cdns-mhdp8546",
 		.of_match_table	= mhdp_ids,
+		.pm = &cdns_mhdp_pm_ops,
 	},
 	.probe	= cdns_mhdp_probe,
 	.remove = cdns_mhdp_remove,
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
index bad2fc0c73066..b06dd5e44aafd 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
@@ -412,6 +412,10 @@ struct cdns_mhdp_device {
 
 	struct cdns_mhdp_hdcp hdcp;
 	bool hdcp_supported;
+
+	/* Power domain status notifier */
+	struct notifier_block pd_nb;
+	bool powered_off;
 };
 
 #define connector_to_mhdp(x) container_of(x, struct cdns_mhdp_device, connector)
-- 
2.34.1

