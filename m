Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D732796E51
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 03:06:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 472BC10E73D;
	Thu,  7 Sep 2023 01:06:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on2049.outbound.protection.outlook.com [40.107.14.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D773110E741
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Sep 2023 01:06:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IZbK72r07vbHHQJu9QFaKvOghLzQi6agssS/keKkknaHmjtqsEXJ5/AWgif9Cpnlb0lI01tefuRwbqTUzGLKoBMcbv9vj49clvZoT1H0a2vIipEoG9KeF0iZue+v8CbAc2Mtg3hKzn8tKQr2ZX3F1kO7Z3glxuNIWSnlseCVELQMIVSSGUjMymDvuEu781lG21c6BXsMXsitm2Jxj5irCTf0NiO3JTILl5npQv4K24+Nd4xqSp7/kyvgD62iZfkKFq7+KobZZSj99vwsgWmx5Vn6fkBou5C3o+xneYqZbSTbsuNsfGsadoI5XAY9YrTfCp8Sz6Xx2oi/ZTd/Sb8RAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ijwdeyLNa08NSnsUKg5AfgNvRzY4Cu80iQJCRRRMXtk=;
 b=ZOwKWg8Ew520v1MTJx+mxlbiyY0Jt8+dtOc0LMItM94VdzExp9Oi1rz+kbZMvhvHjChS29EMBktHR5nnuyMl6TiaDXAlV+DPVgRwLEMV5WzC6zLf8HJpSY0jryuP+toir9pfTACZ2Lm28EU63Wg35Z5X+CQEwt6o3l/PxxOqJOAlJNpXVXxmDhyVYr4DxP4oAiFMz2DNez+a3q1uFBD2H1aBGkot709oDxCgULA/4KqXE/ORh9I9JWO6cF17HlUkQN0OTIk0Hk+KIPtWu/skwPsWQehPFs9qGNsexhs2erQ0aHy22w4JINUdlt6nZiRvRPrtwX5gp7lZ7VY6ljc0BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ijwdeyLNa08NSnsUKg5AfgNvRzY4Cu80iQJCRRRMXtk=;
 b=oAy92u6kyrrjEvERuhXE+Y6Bljzrg8CihjU5gb7hSo15/eOcRLGQFlckKnHffnCQXZ9LE7rpJcW4Oj4cMGX127k10R8f0R02yqltMaw+FfGI70n9SfBWfidw6akIbn+uxby4ESWGe2wvGehQeVCe8WhwyLMtcLukpBK2uiKcF1Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AM0PR04MB6802.eurprd04.prod.outlook.com (2603:10a6:208:184::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.30; Thu, 7 Sep
 2023 01:06:32 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::3505:c499:96d4:1429]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::3505:c499:96d4:1429%4]) with mapi id 15.20.6745.034; Thu, 7 Sep 2023
 01:06:32 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, festevam@gmail.com, vkoul@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org
Subject: [PATCH v9 1/7] drm: bridge: Cadence: convert mailbox functions to
 macro functions
Date: Thu,  7 Sep 2023 09:05:28 +0800
Message-Id: <e13e7a274983d2a5f891161446ca573914eeb9f7.1694047629.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694047629.git.Sandor.yu@nxp.com>
References: <cover.1694047629.git.Sandor.yu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG3P274CA0003.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::15)
 To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|AM0PR04MB6802:EE_
X-MS-Office365-Filtering-Correlation-Id: 488dd74b-81e9-4661-2003-08dbaf3eacd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L60yGTyJkGSOCGIImYfxAz/r8cdTsrS12QHY5JNvny3FvLghbXr2ATyA3jz1yKc/NuYur2L4ExwFS+n2JSbUFng7prc9Gi7QqhkZ9FPsuHQ5jCm8DvcUd1rQC0H5hTs14RaGtSEO5Sr1QcPAo83nkzhA39BomJ3pplFvC2+/Ffi7fiMmPhD16TzV7pyCxmKVGWg/qyprC4kCiYdFctrVwxSA1MKdvTfcK5YCtgyo0hGu4Spp/uyhrAvyTulsgnN1hDw7qVOLdcI/zEPHHpp8bvaDfh0ykDMvftQyy5wZk/2yEpNGMQ70C3lD9BMmeCBdKlFnXudn6gmeSdvgD2S6WivUxTFHJ7plBUvS8DOE5TXwwErqdIGdeUkIRDdSGS3S8fdBr7zd2Ti6QgBIsTXtKxDNf+GeA5FGJXUkeXtINd0xeAlQk1foRbWYj1eFZ3E2z/eP7uh3jmhReT+a7iSPRo3nfGCTabl9J3AzKhd0lULk0GFrrjqm8c8em2NKeOM5KAjYF5L9CFNUx5bMYui9rnF7KerKCWoni4/9fj7DOxvINFw7C+WcRKctcr6uKKL0fAhTM5eTiDHTZ76d61vli+WJ86hIH2YxdRLkDXUbpbUBQI1Vn6ncE6PTye2InqAI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(136003)(376002)(346002)(396003)(1800799009)(186009)(451199024)(921005)(66476007)(6666004)(66946007)(26005)(66556008)(478600001)(2616005)(6486002)(15650500001)(30864003)(6512007)(52116002)(8936002)(4326008)(8676002)(316002)(5660300002)(86362001)(83380400001)(38350700002)(38100700002)(7416002)(36756003)(41300700001)(6506007)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Xs+Ar1nfVY8veIuC74+0HCCz0KnnGBI6CHULR1CMWTi1ydJoDG4Z62VQlpj3?=
 =?us-ascii?Q?fO38SlVYd94tAnruo6IKPsKpKPfGxxWN0yWCJ7Jqg3ErQGVQOqOvoWpt8X0d?=
 =?us-ascii?Q?TWQuwe5yT5X7AuP4K04aUKQhJ6FRgnFK8yhvzGTmgpAYwvS4yGQZ6R2RGTNw?=
 =?us-ascii?Q?e39pJrtpAvCLMYDSAuuVdrrBGMuUEpPs6tS9H25nsG/DDW1GQ1UW1SOsgvYC?=
 =?us-ascii?Q?0zmnt/o/Fk0M3XJ6ZbyHLsSYirIZJ/1BdqcR+fxjsUta8DCkAhMQaIgjaxix?=
 =?us-ascii?Q?HGS6XECwZc0yCqQQmJM3GOhCtM9ntjg7SpyAKgSuHt8CiyUb2DAqXEIyErie?=
 =?us-ascii?Q?MV2JKJbDqPdAKuGrSyv2xdo8km9B0Xvxkh06iu4Gj0suFCEzr/tQ6Mtuiznv?=
 =?us-ascii?Q?JXJU3wPbE6u5jIxGZmITyQAh28DzyGYRPeXS8pPcCHjICGSTP5QrOHgLdyqo?=
 =?us-ascii?Q?y9u5HEWMoc/LZKK0zF9v/BisjkHAAhKIQhDh8Z6oJf/NlMQPseQyg/e9KUy6?=
 =?us-ascii?Q?hYFdokMwArPG0MRXBPxPOJtE05p/mK3r9tByK5XemrpLuStic+ow0aSq6NPM?=
 =?us-ascii?Q?5aeW+H8v5NDRybbXHSRygkTYYVgptXLoQDE0DxNwE3cQrJHjn/ik2SlrLsPa?=
 =?us-ascii?Q?jeH2cQZMJnFV8QQjcDb/Z6X/9cD85jlTdaCa+uEdp6293HRErrx7aplSICWe?=
 =?us-ascii?Q?WSUqIcqnRpPUJNgLSVWRgVhrGb0mG84V/D1a/uS8VcYZHAWh1UizmIzYQR2A?=
 =?us-ascii?Q?xze4RSseDxWe9vAiwL6Mih/3gj8acuEWIhyO1lPqFzPzP61TDyZ0YFgO9j3j?=
 =?us-ascii?Q?ajdcOTH6qKAqQdDg4vFaOUvdNaHfc1gWjOwbZEuu85cKidwZy1nrTkhXibUL?=
 =?us-ascii?Q?k/eLoy73lYlMJCXKNB/Tx96OsuLs96FzfZqU930sxWOQ2LxBW2f4ESMVVnnb?=
 =?us-ascii?Q?97c/8YMVGm8JJzyItrHJQDmZ63uP4mgFysu0csOl0R1S5XUvy1Ib/wxq0BXs?=
 =?us-ascii?Q?77Ll7IiO/JY6HWv6ScW0WYr3hr2nbMQQwKRa3UhKXtGjdn32bIht98lULAD4?=
 =?us-ascii?Q?HVDa7CTNUJLXEM1TgesqlA7YokLCs52eobhaOyMnacc+Pq7w445OidYoxlkh?=
 =?us-ascii?Q?rRhV61GO6uaxdUiGxU+acgrElGrusaQjs68tXKCh/1Ul5g7p2+ftnH3DwZp4?=
 =?us-ascii?Q?4FY0b/vY0ct6mvoLVzQ5ay6tO2QuJKPUcTlc5ekdP4HtXE43sc7jwKHxE/Xl?=
 =?us-ascii?Q?oMIqiUmQ5KfPweO/ID0MlEaT2IVzRSd8shffQftFyNVOV5boHJByJdGn+wqU?=
 =?us-ascii?Q?1k/nZqCpfCtIm9uoUTAxyOQzqdh+5b5dL1H8Zk2D0adMAxsm4vESnPLwHCyb?=
 =?us-ascii?Q?NbF05w6TsBsIAvWOptZ7nVLnE3eOEb67f9dZJbi/9adjRuIagUWh4rv7LQJA?=
 =?us-ascii?Q?/nSsP72IkRguWEFCZeASwKPSbmKHMsKe/MEWcDZ6wL4SlEq6utK1ssh1XF4R?=
 =?us-ascii?Q?tS8yW9C02F7GMGIT04O0VRsoL4zcpC49iU8vKqaPqAHLnAOwO2P5gC3TQyfK?=
 =?us-ascii?Q?q2aW5RGJcqF2X/tQQ56by39SUXB13WoSP4c7EVxg?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 488dd74b-81e9-4661-2003-08dbaf3eacd1
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2023 01:06:32.8142 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rwPzN+0aJu9UEwUcNAKBt5HTlv+2nqYuTgDIRQp5AYu7gnq3z4VrgnhZU1driAc+pNcKkIfPS7q65IODmCjn5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6802
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
Cc: oliver.brown@nxp.com, alexander.stein@ew.tq-group.com, Sandor.yu@nxp.com,
 linux-imx@nxp.com, kernel@pengutronix.de, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MHDP8546 mailbox access functions will be share to other mhdp driver
and Cadence HDP-TX HDMI/DP PHY drivers.
Move those functions to head file include/drm/bridge/cdns-mhdp-mailbox.h
and convert them to macro functions.

Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
---
 .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 195 +-------------
 .../drm/bridge/cadence/cdns-mhdp8546-core.h   |   1 -
 include/drm/bridge/cdns-mhdp-mailbox.h        | 240 ++++++++++++++++++
 3 files changed, 241 insertions(+), 195 deletions(-)
 create mode 100644 include/drm/bridge/cdns-mhdp-mailbox.h

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index f6822dfa3805..ddd3c633c7bf 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -36,6 +36,7 @@
 #include <linux/slab.h>
 #include <linux/wait.h>
 
+#include <drm/bridge/cdns-mhdp-mailbox.h>
 #include <drm/display/drm_dp_helper.h>
 #include <drm/display/drm_hdcp_helper.h>
 #include <drm/drm_atomic.h>
@@ -54,200 +55,6 @@
 #include "cdns-mhdp8546-hdcp.h"
 #include "cdns-mhdp8546-j721e.h"
 
-static int cdns_mhdp_mailbox_read(struct cdns_mhdp_device *mhdp)
-{
-	int ret, empty;
-
-	WARN_ON(!mutex_is_locked(&mhdp->mbox_mutex));
-
-	ret = readx_poll_timeout(readl, mhdp->regs + CDNS_MAILBOX_EMPTY,
-				 empty, !empty, MAILBOX_RETRY_US,
-				 MAILBOX_TIMEOUT_US);
-	if (ret < 0)
-		return ret;
-
-	return readl(mhdp->regs + CDNS_MAILBOX_RX_DATA) & 0xff;
-}
-
-static int cdns_mhdp_mailbox_write(struct cdns_mhdp_device *mhdp, u8 val)
-{
-	int ret, full;
-
-	WARN_ON(!mutex_is_locked(&mhdp->mbox_mutex));
-
-	ret = readx_poll_timeout(readl, mhdp->regs + CDNS_MAILBOX_FULL,
-				 full, !full, MAILBOX_RETRY_US,
-				 MAILBOX_TIMEOUT_US);
-	if (ret < 0)
-		return ret;
-
-	writel(val, mhdp->regs + CDNS_MAILBOX_TX_DATA);
-
-	return 0;
-}
-
-static int cdns_mhdp_mailbox_recv_header(struct cdns_mhdp_device *mhdp,
-					 u8 module_id, u8 opcode,
-					 u16 req_size)
-{
-	u32 mbox_size, i;
-	u8 header[4];
-	int ret;
-
-	/* read the header of the message */
-	for (i = 0; i < sizeof(header); i++) {
-		ret = cdns_mhdp_mailbox_read(mhdp);
-		if (ret < 0)
-			return ret;
-
-		header[i] = ret;
-	}
-
-	mbox_size = get_unaligned_be16(header + 2);
-
-	if (opcode != header[0] || module_id != header[1] ||
-	    req_size != mbox_size) {
-		/*
-		 * If the message in mailbox is not what we want, we need to
-		 * clear the mailbox by reading its contents.
-		 */
-		for (i = 0; i < mbox_size; i++)
-			if (cdns_mhdp_mailbox_read(mhdp) < 0)
-				break;
-
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
-static int cdns_mhdp_mailbox_recv_data(struct cdns_mhdp_device *mhdp,
-				       u8 *buff, u16 buff_size)
-{
-	u32 i;
-	int ret;
-
-	for (i = 0; i < buff_size; i++) {
-		ret = cdns_mhdp_mailbox_read(mhdp);
-		if (ret < 0)
-			return ret;
-
-		buff[i] = ret;
-	}
-
-	return 0;
-}
-
-static int cdns_mhdp_mailbox_send(struct cdns_mhdp_device *mhdp, u8 module_id,
-				  u8 opcode, u16 size, u8 *message)
-{
-	u8 header[4];
-	int ret, i;
-
-	header[0] = opcode;
-	header[1] = module_id;
-	put_unaligned_be16(size, header + 2);
-
-	for (i = 0; i < sizeof(header); i++) {
-		ret = cdns_mhdp_mailbox_write(mhdp, header[i]);
-		if (ret)
-			return ret;
-	}
-
-	for (i = 0; i < size; i++) {
-		ret = cdns_mhdp_mailbox_write(mhdp, message[i]);
-		if (ret)
-			return ret;
-	}
-
-	return 0;
-}
-
-static
-int cdns_mhdp_reg_read(struct cdns_mhdp_device *mhdp, u32 addr, u32 *value)
-{
-	u8 msg[4], resp[8];
-	int ret;
-
-	put_unaligned_be32(addr, msg);
-
-	mutex_lock(&mhdp->mbox_mutex);
-
-	ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_GENERAL,
-				     GENERAL_REGISTER_READ,
-				     sizeof(msg), msg);
-	if (ret)
-		goto out;
-
-	ret = cdns_mhdp_mailbox_recv_header(mhdp, MB_MODULE_ID_GENERAL,
-					    GENERAL_REGISTER_READ,
-					    sizeof(resp));
-	if (ret)
-		goto out;
-
-	ret = cdns_mhdp_mailbox_recv_data(mhdp, resp, sizeof(resp));
-	if (ret)
-		goto out;
-
-	/* Returned address value should be the same as requested */
-	if (memcmp(msg, resp, sizeof(msg))) {
-		ret = -EINVAL;
-		goto out;
-	}
-
-	*value = get_unaligned_be32(resp + 4);
-
-out:
-	mutex_unlock(&mhdp->mbox_mutex);
-	if (ret) {
-		dev_err(mhdp->dev, "Failed to read register\n");
-		*value = 0;
-	}
-
-	return ret;
-}
-
-static
-int cdns_mhdp_reg_write(struct cdns_mhdp_device *mhdp, u16 addr, u32 val)
-{
-	u8 msg[6];
-	int ret;
-
-	put_unaligned_be16(addr, msg);
-	put_unaligned_be32(val, msg + 2);
-
-	mutex_lock(&mhdp->mbox_mutex);
-
-	ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX,
-				     DPTX_WRITE_REGISTER, sizeof(msg), msg);
-
-	mutex_unlock(&mhdp->mbox_mutex);
-
-	return ret;
-}
-
-static
-int cdns_mhdp_reg_write_bit(struct cdns_mhdp_device *mhdp, u16 addr,
-			    u8 start_bit, u8 bits_no, u32 val)
-{
-	u8 field[8];
-	int ret;
-
-	put_unaligned_be16(addr, field);
-	field[2] = start_bit;
-	field[3] = bits_no;
-	put_unaligned_be32(val, field + 4);
-
-	mutex_lock(&mhdp->mbox_mutex);
-
-	ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX,
-				     DPTX_WRITE_FIELD, sizeof(field), field);
-
-	mutex_unlock(&mhdp->mbox_mutex);
-
-	return ret;
-}
-
 static
 int cdns_mhdp_dpcd_read(struct cdns_mhdp_device *mhdp,
 			u32 addr, u8 *data, u16 len)
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
index bedddd510d17..10c878bf0e63 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
@@ -212,7 +212,6 @@ struct phy;
 #define MB_MODULE_ID_HDCP_TX			0x07
 #define MB_MODULE_ID_HDCP_RX			0x08
 #define MB_MODULE_ID_HDCP_GENERAL		0x09
-#define MB_MODULE_ID_GENERAL			0x0a
 
 /* firmware and opcodes */
 #define FW_NAME					"cadence/mhdp8546.bin"
diff --git a/include/drm/bridge/cdns-mhdp-mailbox.h b/include/drm/bridge/cdns-mhdp-mailbox.h
new file mode 100644
index 000000000000..9f551bf956a1
--- /dev/null
+++ b/include/drm/bridge/cdns-mhdp-mailbox.h
@@ -0,0 +1,240 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Cadence MHDP Firmware Access API function by Malibox.
+ *
+ * Copyright (C) 2022 NXP Semiconductor, Inc.
+ *
+ */
+#ifndef CDNS_MHDP_MAILBOX_H
+#define CDNS_MHDP_MAILBOX_H
+
+#include <asm/unaligned.h>
+#include <linux/iopoll.h>
+
+/* mailbox regs offset */
+#define CDNS_MAILBOX_FULL		0x00008
+#define CDNS_MAILBOX_EMPTY		0x0000c
+#define CDNS_MAILBOX_TX_DATA		0x00010
+#define CDNS_MAILBOX_RX_DATA		0x00014
+
+#define MAILBOX_RETRY_US		1000
+#define MAILBOX_TIMEOUT_US		2000000
+
+/* Module ID Code */
+#define MB_MODULE_ID_GENERAL		0x0A
+#define MB_MODULE_ID_DP_TX		0x01
+
+/* General Commands */
+#define GENERAL_REGISTER_WRITE		0x05
+#define GENERAL_REGISTER_READ		0x07
+
+/* DP TX Command */
+#define DPTX_WRITE_FIELD		0x08
+
+/* MHDP Firmware access functions by Mailbox */
+#define cdns_mhdp_mailbox_read(_mhdp) \
+({ \
+	int ret, empty, val; \
+\
+	WARN_ON(!mutex_is_locked(&(_mhdp)->mbox_mutex)); \
+\
+	do {  \
+		ret = readx_poll_timeout(readl, (_mhdp)->regs + CDNS_MAILBOX_EMPTY,  \
+					 empty, !empty, MAILBOX_RETRY_US,  \
+					 MAILBOX_TIMEOUT_US);  \
+		if (ret < 0)  \
+			break;  \
+\
+		val = readl((_mhdp)->regs + CDNS_MAILBOX_RX_DATA) & 0xff; \
+	} while (0);  \
+\
+	(ret < 0) ? ret : val;  \
+})
+
+#define cdns_mhdp_mailbox_write(_mhdp, _val) \
+({ \
+	int ret, full;  \
+\
+	WARN_ON(!mutex_is_locked(&(_mhdp)->mbox_mutex)); \
+\
+	do {  \
+		ret = readx_poll_timeout(readl, (_mhdp)->regs + CDNS_MAILBOX_FULL,  \
+					 full, !full, MAILBOX_RETRY_US,  \
+					 MAILBOX_TIMEOUT_US);  \
+		if (ret < 0)  \
+			break;  \
+\
+		writel((_val), (_mhdp)->regs + CDNS_MAILBOX_TX_DATA); \
+	} while (0);  \
+\
+	ret; \
+})
+
+#define  cdns_mhdp_mailbox_recv_header(_mhdp, _module_id, _opcode, _req_size) \
+({  \
+	u32 mbox_size, i;  \
+	u8 header[4];  \
+	int ret;  \
+\
+	do {  \
+		/* read the header of the message */ \
+		for (i = 0; i < sizeof(header); i++) {  \
+			ret = cdns_mhdp_mailbox_read(_mhdp);  \
+			if (ret < 0)  \
+				break;  \
+\
+			header[i] = ret;  \
+		}  \
+\
+		mbox_size = get_unaligned_be16(header + 2);  \
+\
+		if ((_opcode) != header[0] || (_module_id) != header[1] ||  \
+		    (_req_size) != mbox_size) {  \
+			/* If the message in mailbox is not what we want, we need to
+			 * clear the mailbox by reading its contents. */  \
+			for (i = 0; i < mbox_size; i++)   \
+				if (cdns_mhdp_mailbox_read(_mhdp) < 0)  \
+					break;  \
+\
+			ret = -EINVAL;  \
+		}  \
+\
+		ret = 0; \
+\
+	} while (0);  \
+\
+	ret;  \
+})
+
+#define cdns_mhdp_mailbox_recv_data(_mhdp, _buff, _buff_size)  \
+({  \
+	u32 i;  \
+	int ret;  \
+\
+	do {  \
+		for (i = 0; i < (_buff_size); i++) {  \
+			ret = cdns_mhdp_mailbox_read(_mhdp);  \
+			if (ret < 0)  \
+				break;  \
+\
+			((u8 *)_buff)[i] = ret;  \
+		}  \
+\
+		ret = 0;  \
+\
+	} while (0);  \
+\
+	ret; \
+})
+
+#define cdns_mhdp_mailbox_send(_mhdp, _module_id, _opcode, _size, _message)  \
+({  \
+	u8 header[4];  \
+	int ret, i;  \
+\
+	header[0] = _opcode;  \
+	header[1] = _module_id;  \
+	put_unaligned_be16(_size, header + 2);  \
+\
+	do {  \
+		for (i = 0; i < sizeof(header); i++) {  \
+			ret = cdns_mhdp_mailbox_write(_mhdp, header[i]);  \
+			if (ret < 0)  \
+				break;  \
+		}  \
+\
+		for (i = 0; i < _size; i++) {  \
+			ret = cdns_mhdp_mailbox_write(_mhdp, ((u8 *)_message)[i]);  \
+			if (ret < 0)  \
+				break;;  \
+		}  \
+		ret = 0;  \
+	} while (0);  \
+\
+	ret;  \
+})
+
+#define cdns_mhdp_reg_read(_mhdp, _addr, _value)  \
+({  \
+	u8 msg[4], resp[8];  \
+	int ret;  \
+\
+	put_unaligned_be32(_addr, msg);  \
+\
+	mutex_lock(&(_mhdp)->mbox_mutex);  \
+\
+	do {  \
+		ret = cdns_mhdp_mailbox_send(_mhdp, MB_MODULE_ID_GENERAL,  \
+					     GENERAL_REGISTER_READ,  \
+					     sizeof(msg), msg);  \
+		if (ret < 0)  \
+			break;  \
+\
+		ret = cdns_mhdp_mailbox_recv_header(_mhdp, MB_MODULE_ID_GENERAL,  \
+						    GENERAL_REGISTER_READ,  \
+						    sizeof(resp));  \
+		if (ret < 0)  \
+			break;  \
+\
+		ret = cdns_mhdp_mailbox_recv_data(_mhdp, resp, sizeof(resp));  \
+		if (ret < 0)  \
+			break;  \
+\
+		/* Returned address value should be the same as requested */  \
+		if (memcmp(msg, resp, sizeof(msg))) {  \
+			ret = -EINVAL;  \
+			break;  \
+		}  \
+\
+		*((u32 *)_value) = get_unaligned_be32(resp + 4);  \
+			ret = 0;  \
+	} while (0);  \
+\
+	mutex_unlock(&(_mhdp)->mbox_mutex);  \
+	if (ret < 0) {  \
+		dev_err((_mhdp)->dev, "Failed to read register\n");  \
+		*((u32 *)_value) = 0;  \
+	}  \
+\
+	ret;  \
+})
+
+#define cdns_mhdp_reg_write(_mhdp, _addr, _val)  \
+({  \
+	u8 msg[8];  \
+	int ret;  \
+\
+	put_unaligned_be32(_addr, msg);  \
+	put_unaligned_be32(_val, msg + 4);  \
+\
+	mutex_lock(&(_mhdp)->mbox_mutex);  \
+\
+	ret = cdns_mhdp_mailbox_send(_mhdp, MB_MODULE_ID_GENERAL,  \
+				      GENERAL_REGISTER_WRITE, sizeof(msg), msg);  \
+\
+	mutex_unlock(&(_mhdp)->mbox_mutex);  \
+\
+	ret;  \
+})
+
+#define cdns_mhdp_reg_write_bit(_mhdp, _addr, _start_bit, _bits_no, _val) \
+({  \
+	u8 field[8];  \
+	int ret;  \
+\
+	put_unaligned_be16(_addr, field);  \
+	field[2] = _start_bit;  \
+	field[3] = _bits_no;  \
+	put_unaligned_be32(_val, field + 4);  \
+\
+	mutex_lock(&(_mhdp)->mbox_mutex);  \
+\
+	ret = cdns_mhdp_mailbox_send((_mhdp), MB_MODULE_ID_DP_TX, \
+				     DPTX_WRITE_FIELD, sizeof(field), field);  \
+\
+	mutex_unlock(&(_mhdp)->mbox_mutex);  \
+\
+	ret; \
+})
+
+#endif
-- 
2.34.1

