Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sBDQD1tEe2l+DAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 12:28:27 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A702CAF9B2
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 12:28:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0510E10E08F;
	Thu, 29 Jan 2026 11:28:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="bgVakqCR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013017.outbound.protection.outlook.com
 [40.107.201.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74A0D10E102
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 11:28:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ImkXGnACk/bBM9ROXX9Fye/vqWjmV+ShKt8VoQ6diDczYAfPET3V2tZ6+5bP5CbpV4D9Uvc0JU9n1lVS/vUpB/0z0w/sFz9xc6ZIG49Awcxpj/Lv/UvvLyz/bwIt+WxkDzATzUwdMFkZAhy2E0YhXjaZlUuyVM1trPXbWiWEIBa8teDL8U2QC+X1QrUjl2ERtYCcev0QQNT6S9etZ8WQSF8ptKMyJwQema9bFaMIDYTJCNqDwuSMvM9rcmWXX6booOyZte9MRstTtdpUSQKQhdqyZIl8L5atyEI5vkv6PwlYMGAL5JTMszjwLrUP1rYDDQKfpa5XXBarRDyfV65woA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wSIa51OFwUOlnJQjZRS6pd6DIW74lS9LlNczl/SOI3o=;
 b=Mmr+h5BfyoqtYUPKcqltvmkcZo6vDYGkFN9F+TTsjlR8Y7hbjuD9D+Me8ANymGIW5MP84IiO0apt2E7BA56dlXuOJG+DzlFl+6kl+aUwWpkmsU0wEw7LfrBn9ZYLEIjJGsBKX32KHlSRTwzACMIr4FaLOkqd35HxMRws5qPbaQEcpyC9qrzLM+4LOtMAUZVTqGafSlVaA5QeuubUVUoosCsHM7rbG2u//UMobQQYAZ4MjcvcP75C/LQ4FAhwL5M+FdfuCD9Nu2mNP8y9/dbD4O5mjvgSAFV9b606mMDSXaKIQwCedoKlaCIpL+A4TqotqtEu3NyqO43E8vKaKbwt2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wSIa51OFwUOlnJQjZRS6pd6DIW74lS9LlNczl/SOI3o=;
 b=bgVakqCRQa1FljaPZHMZHrZJY7sHP46vmWQSdHrZW+g8X8LJSBYJsPMZBAQG5niwt9UbaqThiUx7m3Y5n7VPgUs38vBl9/ICeDKva4CNRNcsK3wm7wyLxCSPAZERd7iwSdYY0uon/VBVoeMKec0CJjI+enrlGW6WBSOmw+IN8n4=
Received: from BYAPR02CA0029.namprd02.prod.outlook.com (2603:10b6:a02:ee::42)
 by SJ5PPFB3F166793.namprd10.prod.outlook.com
 (2603:10b6:a0f:fc02::7c4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.10; Thu, 29 Jan
 2026 11:28:20 +0000
Received: from SJ5PEPF000001D6.namprd05.prod.outlook.com
 (2603:10b6:a02:ee:cafe::ee) by BYAPR02CA0029.outlook.office365.com
 (2603:10b6:a02:ee::42) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.11 via Frontend Transport; Thu,
 29 Jan 2026 11:28:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ5PEPF000001D6.mail.protection.outlook.com (10.167.242.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 29 Jan 2026 11:28:19 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 29 Jan
 2026 05:28:17 -0600
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 29 Jan
 2026 05:28:17 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 29 Jan 2026 05:28:17 -0600
Received: from uda0543015.dhcp.ti.com (uda0543015.dhcp.ti.com [10.24.69.9])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60TBSBZ63657229;
 Thu, 29 Jan 2026 05:28:12 -0600
From: Abhash Kumar Jha <a-kumar2@ti.com>
To: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>,
 <rfoss@kernel.org>, <mripard@kernel.org>, <tzimmermann@suse.de>,
 <airlied@gmail.com>, <simona@ffwll.ch>, <devarsht@ti.com>, <u-kumar1@ti.com>, 
 <sjakhade@cadence.com>
CC: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <s-jain1@ti.com>, <p-mantena@ti.com>,
 <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH] drm/bridge: cdns-mhdp8546: Add suspend resume support to the
 bridge driver
Date: Thu, 29 Jan 2026 16:50:16 +0530
Message-ID: <20260129112016.2448037-1-a-kumar2@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D6:EE_|SJ5PPFB3F166793:EE_
X-MS-Office365-Filtering-Correlation-Id: e852e340-caff-46c0-29d8-08de5f2980f6
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|36860700013|82310400026|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GMnHIv7qeibBywDngbmkGm6pDdyfuk7TMucwPlgxf3vzYGy7bB3N7hNbWQWQ?=
 =?us-ascii?Q?VsOZJkoNwQOfOWPsYRmQgFBx5kXs+mHuaaVupxD0MEnSGfv89ck77mdkwJAp?=
 =?us-ascii?Q?Is/tctAr0/7NMkOu+1MH5Emj0WuRp63vzC+v6GA1HtwIzznPk8RKPUMfn419?=
 =?us-ascii?Q?yTYStaoKpYv38qtJeogZ6RaAcdvFB4vMUgEh3kEpM5CKiR9hxxqsqWsMg06a?=
 =?us-ascii?Q?Sm9V3094vy4VgQxnBj7qPX2YR0NDuVRIHoHzWxgMXSbjhnGM40McYeAYNtQq?=
 =?us-ascii?Q?81/2Lh5BbKmR8PjXzSkyBqc5biVu+4UemTXfBhtLA9MVU/5zhq0IFRAW9ADb?=
 =?us-ascii?Q?/IBSjFC8qzH50HF0Ob3001O+Cdb7bn5azobEVInCrGf2fabZ7rxzl9SfsJB3?=
 =?us-ascii?Q?XjgPTLSP8iecW24omkBOs69Dk3aRsAwH2jqoFsUDJ4PATJAAbxRmEDfgv8KO?=
 =?us-ascii?Q?ip1lIliDk+WWFr1FU9zN+8TCfsfUdPP1lEZ3L3vJ39uEQluziSqlD4YM2o7P?=
 =?us-ascii?Q?489VgjnGfER/EXDu02R3KsECIs9M7Wt8OundWIYGp9tkgI2c2VHzanDodzqb?=
 =?us-ascii?Q?gKbK2/2iVRNVQKay3QZMg/ZhoLefI7Bam2azkAjGCo76MhNyLnU5LGm+A+lC?=
 =?us-ascii?Q?AJCiNN8I50hTPEXmtkWj4t+7qbnlf1yW7ZQ4nR5d6h2DD4CP+jefRMBtIghe?=
 =?us-ascii?Q?mTcBwRY/UIp95eNcZZhZoGMHCuanlqJA2mwdTpx00pGs3XiuCQ8gkHtrlSo0?=
 =?us-ascii?Q?1E+NzEnGgjhdqttQayDGOxbydVIQPT/xqXls2us6+lb6UW4VapR1BCFSGM7P?=
 =?us-ascii?Q?QrPOilzN85XR5PmfA/D+nCC0JFJlrLz+cERGenV7OaTMNjNWHDuxGMXNh16V?=
 =?us-ascii?Q?/bUWP49/AqP59pfhDEmVYS3PdKBFJ9dTGcYOmfQ9dN7Za6cjj1zWLOOmh7vN?=
 =?us-ascii?Q?E96Yic616MAcOrTZE0ORXp0rLa7YSFHXi00VWP3EhW4HndnZsSn1J7IZYr+8?=
 =?us-ascii?Q?tNU6IOdn9i8u9TmfxAn3aeVob70cKMrzve5tvnNSucV5bP9VRSF2KSPcO+RZ?=
 =?us-ascii?Q?u7fHxWpXyADWeIR1TOXk3tsq3TYYQ2ocHdOdts6DQ/dYRfYvjX0nhv0CmV56?=
 =?us-ascii?Q?0MVFZLCM8EZXnRKOLgiWQ64ZIi+lJjMpZQvrTX4nSIfgTrZ7bpfn0bIWtb9d?=
 =?us-ascii?Q?S2pe1ujVEZrrjA2bQPtRWeR9jXyTBeEb0z4JJLO1G5uYNj1kaptQO4jvOW38?=
 =?us-ascii?Q?3N0dC2F9DjkYwDevd8bSo27MswAu6gvbfe/AFNUEMa8vxg8mtlij0GAPRZqc?=
 =?us-ascii?Q?ELGo6UpQVuu+IKbY3HZcOlTfYIYpv/Ul1Pd8TEiqO0N8NS7yQCJ5Mh7wvZiC?=
 =?us-ascii?Q?ozC2K9Nm2+n9BWGcmAH5NhznymTR8J2k/qCCFHB7tub80EhGttpKhR3PaTG1?=
 =?us-ascii?Q?dkTqsMPGrgpTt7GB//dDtdCuxz0Oy5PLCixTUl22IBi+qVLFO/Y5TqU9sTI2?=
 =?us-ascii?Q?loH2n9h+HAVnOg5vR6NS9waWuO0DcBGUuhUk5ZYUX9Yd06CHyJujrrNHsBcR?=
 =?us-ascii?Q?b7u9vssJ3rVsoJ6Q4kT9n0ZtauAIWNLMfXf2fxSRN4Riw8uoz8G+l7d2OjZa?=
 =?us-ascii?Q?7GqL8rbyoffH9Dtk0lJ3g35HBE0bF2yvZ3DVSz4Y9S4bNTfZOi5NSCYSnvhE?=
 =?us-ascii?Q?0iTUdg=3D=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.194; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:flwvzet200.ext.ti.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(36860700013)(82310400026)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 11:28:19.3706 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e852e340-caff-46c0-29d8-08de5f2980f6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.21.194];
 Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFB3F166793
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[a-kumar2@ti.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,ideasonboard.com,kwiboo.se,gmail.com,ti.com];
	FORGED_RECIPIENTS(0.00)[m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:devarsht@ti.com,m:u-kumar1@ti.com,m:sjakhade@cadence.com,m:linux-kernel@vger.kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:s-jain1@ti.com,m:p-mantena@ti.com,m:tomi.valkeinen@ideasonboard.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,suse.de,gmail.com,ffwll.ch,ti.com,cadence.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[a-kumar2@ti.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: A702CAF9B2
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
 .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 136 +++++++++++++++++-
 .../drm/bridge/cadence/cdns-mhdp8546-core.h   |   4 +
 2 files changed, 139 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index 38726ae1bf150..dd482094bf184 100644
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
 
+static int cdns_mhdp_resume(struct device *dev)
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
+static int cdns_mhdp_suspend(struct device *dev)
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

