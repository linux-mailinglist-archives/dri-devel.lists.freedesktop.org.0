Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D39E761913D
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 07:46:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 393BD10E6AF;
	Fri,  4 Nov 2022 06:46:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2072.outbound.protection.outlook.com [40.107.21.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DAF410E6B0
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 06:46:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fleA9d34CjFfIaQLMnod8RvBVluHPmCZR5N+2BzsyP+Ph1wrT5jb8Agba+MHCYptzrLIS5+Ea+orVaP1MzmryluVX0MZ7kUAlUENq5tJti0QUhlNW/PQEJDY4vWFu3tTJiseGI6/zWR7/JDNK/W4gYmtL4cb/WrqMMwKWH3qDx62UA1f1zi4S7IYfvfce5jttfHaDLWxjxcSnYPWn2hGzj5g2t4eRXw4t7hX6RyUYvTEw3P96wN7czeKq+cyoQtoQpHXSUoxpoH9KXua1iIxywDLd8dGmZCg7sFWBmSS9+WKj0uSWAdpwb3IxPopNhOw0RIDep9alb8XMSKklRfWjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CI6HiPRkfFukA+gvkjMZqgx2ImVxcURakl6FJilSdaY=;
 b=k4FEkfCSQeXVMQbaABYuX+DrjSpAv76fDhHjQrjEsA20jILloT/0oWt2GbGB7LcnHt2gTJt/5299aQmG39zEtkNU2WQmhK5XXxFC5NYvUsGrBlEbvyEdkUJe5T4aqlclAAmLmVjHa9SKC7xvRMjP1XbfaT7Sxaf2faq58RVdflsJEbtXesvxwVWx4KYvSmLWzB3Xf+NdhkwkM6DsO4kCgmT56TBcSHXtvl4jJkFm3DGZlkMv/CP3CbIZEkFJobvpD3tL/sVYtlr2sEjxw7H1lFQV8/uxgWf7nQT2Qr+UzSWyUayXe9sUt34pSewLxW4v5sgZs6jwX0xv4WYUBn0e+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CI6HiPRkfFukA+gvkjMZqgx2ImVxcURakl6FJilSdaY=;
 b=Xhnk4Id+5tsZmmeVefdvxyafARaHrAOyFKLVnDKvOEjASN8rQKMim0pz9LHXq0dnVxgQO4vkES30h6WHU7qB32MS520Wr2TNvAo+U/TM9ZetsXGGMYEH0QdsQ3Dul6bOwgp6nGOvEz52Q2E58Y38PGDDyW/bS6PxX+kcVDEs+ig=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AM9PR04MB8081.eurprd04.prod.outlook.com (2603:10a6:20b:3e2::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20; Fri, 4 Nov
 2022 06:46:39 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::88a0:57d8:2a57:3f4f]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::88a0:57d8:2a57:3f4f%9]) with mapi id 15.20.5791.022; Fri, 4 Nov 2022
 06:46:39 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, kishon@ti.com, vkoul@kernel.org
Subject: [v2 01/10] drm: bridge: cadence: convert mailbox functions to macro
 functions
Date: Fri,  4 Nov 2022 14:44:51 +0800
Message-Id: <4fd5d644cfcc70e51df5c0bcaecc6cbb43c49218.1667463263.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1667463263.git.Sandor.yu@nxp.com>
References: <cover.1667463263.git.Sandor.yu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0194.apcprd06.prod.outlook.com (2603:1096:4:1::26)
 To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|AM9PR04MB8081:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c9be79d-b1fc-4296-50ab-08dabe305334
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Zo2YIvnKcDqZ4HtSJ99NrfLM3EcgwG50IZgbNKtmmdjeHxO7yaYMIlnO5KA4j2okxC40ZwrdFkCJ9o1YhddUnxGQdKcWgjDh51E6uvFh7OBi2uoRNcJiKKGcu9BLvsmdL6J2R5pbDZJRXE8mxKoIh5uYKSQhpNWX4MQXCJeG70AkIAX4/OJd5qyAzQWShNBQoDxUOys8Gwyll6/6jS60WJmJsRbgwDi7A/UOm5voZhx1p352jW74SJ3b2bAuo3ysKdrJ/oISfU01Wxe05HJ1sF0Ol4/Gh/6H9L0GYrs6JP4WCMz08sfAv64i07NVPAgMZOllSam9qK33ZRtqXlg+xSxLiuCL323mha55P9oZ3kubwqS++eFGAuNSU+flCXrugSMQqH/68AgItqKyEIF1IYR9w3nPxPT5dmsNkazG6kJmkUcG5QuHwo64uuNO99Vrc+a9eALvRO4ZzddKnWlN7shaoa35DE21mMnTZ/xf3aAqTB3xUmiYNm2I7ZgoJvk1Ciekzm0tvOcBONgRNaWsgs2FdtqEmT8TnYJ7bERB0u6LqFBPvdRcVrE/WMZanlSdviTlVjmLFAIq96uKUgNhrHFVR+jaBqHgiQZU/3gJwOKN9lEx54uOT5k+CSMk5DzibMZ81/35ftwswO0B2s9CXIZd+kLVagJTXi/ii/wKTn0ktIrWBxaIugR0mNKzPlkGFTiy5mYkJVfAogaIKG45EbBD616eIwRu4EjDf2m1tCY3by9oIz8sF1C0dZuN+ZzCrY0IntAWtMBir0AR2GdNaQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(39860400002)(366004)(136003)(396003)(451199015)(316002)(8676002)(38350700002)(30864003)(7416002)(5660300002)(15650500001)(66556008)(66476007)(38100700002)(4326008)(66946007)(36756003)(8936002)(41300700001)(83380400001)(6666004)(921005)(186003)(2616005)(86362001)(6486002)(26005)(478600001)(6512007)(52116002)(6506007)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IcKr/c/+RlPG9v8IZFeDGqy3Z77dHgbyqRZpoCkqcFm1ND92EaVzBeWNjZgf?=
 =?us-ascii?Q?yKWwF2MiXNB4lmxCPo6i12HcHp+JxcnH7l0l2tgOOlZ3znksFnFBYayQK2uh?=
 =?us-ascii?Q?2QFQwgX5IvVdKz8NH8qtBZdAf6/9URM8Clu4ub45WVFlYUK5i7NGEFsJDZC8?=
 =?us-ascii?Q?1+tlKqB5JoT471RgtB43pxW3WhTU07rtMAQ/aGHAQHQsf6JwtU4J4s5saPL3?=
 =?us-ascii?Q?Tz3bCBvJQjKzaWXHYn3eMh8WpaVknGd5MD6hN/sz9zck5kCOFYC9QGUIYnOp?=
 =?us-ascii?Q?BMbCYruu49ZB2MgDm7sqs+DH4TE5X0q7ShjUMBb952Moj0Q/IOSKFHZXTcyY?=
 =?us-ascii?Q?8nJBqrUCR65uhmvXoZsNGLybwR6K+7n5xZWLOyG4Hs7QO66PjHyXDoRDvwdk?=
 =?us-ascii?Q?kI+/NTPNO7JqKRSTmULdnLIad+tUS7KODBZYRKbidxZmcG1dOhCaGcmq9VKi?=
 =?us-ascii?Q?8gafgVoMnk48jKubXCl9GCPPfAADKxwfi1tKQt2QLlpVDZKlxkh8iQZSZBMo?=
 =?us-ascii?Q?wsRZQO/j/LwQOo5HTOTRnT+qqsBvpAZcVgZ8M9+Z/wWDTm+tZ844+24fOBCU?=
 =?us-ascii?Q?A+MhxDq+UcbHMYkX0QebQZwFFabAh9R4iu4jNit1AlTtuqkVieLqnpoJgMQa?=
 =?us-ascii?Q?LNC5ygGoSv1usrXwxubc6pVtUXKxAIp7JSvZt4UfCjE/hfreyOblNMQO9nPs?=
 =?us-ascii?Q?TDJlkAOq44umR/VdXHpi/1k6/WoJn1RA7+yOmnFjulSfCghNW5VNuBr3Mw3g?=
 =?us-ascii?Q?Qv/uzDCvM60H0UE2FhV8wbh/9Um5f+Tr6C8FQUXZhfPNLOPY+EBAy3u6xFnX?=
 =?us-ascii?Q?O0qNNNnwi60jrjvNeJItOpSEX8Fcr2EBGpUYDscNYEvaGuDWY+zXsWxrkTSq?=
 =?us-ascii?Q?iemy3xVtZacpEroZGHlpz8SVYJNuFATSqJx3gRtGniXo9CxQo33K9w7jk5YH?=
 =?us-ascii?Q?ipZ1Wzptb9ZOHlg1oIVO41iU6XvikvsePpbeMSP0cwu8c2rXNy4yq2oNoYX4?=
 =?us-ascii?Q?WkXinFau4fUE67oq5pT7Q+xuDsBsJzARBT7dla09sXECgJUlCXrPAlJGQQIM?=
 =?us-ascii?Q?m22r1Fua7wM1vmG6R751kKpUDeB0mZclZ97+gVUjPwZitQzB9jXgFFBqd8FA?=
 =?us-ascii?Q?fuB3ar8FP1eA7bsP2i+vHY/+srJ89G1VTgwvZxJJsUFmeNlLi8p39HEMMkaK?=
 =?us-ascii?Q?HTMRLcw1Mx9ClQIMVjv/vDcQyel4mYFw2PXHvfebJS0R5j1ATN2qfHFhni74?=
 =?us-ascii?Q?v5odJU5D1oE8Q1QirFTWaJUEOGP9gqv79Ml5Y7QgMnlwPfvGL4vV+Hq/ggJR?=
 =?us-ascii?Q?X42WIk/AftT+Adur6SkqUtqjPzm1DV6mTLa1IIYgsY3Vi5AWUOe2ZLxgfR9K?=
 =?us-ascii?Q?g0Dl7LIfp2uz0KEpCcBXk+AjyAv+icB2rA5SMGvlSNzTV8dGENnPzTADtx0M?=
 =?us-ascii?Q?FwK1vX3hFy9oHYFSnCQSb1/Cfe+6GzsI65HGimuq7N8ne1Jkr6NTAZVO5cRJ?=
 =?us-ascii?Q?13UjM+aFdGJgMY+G2PkcEdxxbOv3J1xWIAs2+XN3Ax/oEUYxJJ4Hj5YIiGD/?=
 =?us-ascii?Q?xkEBJn31SJAXznSx1gsFx7z8M1CgiDD5wdUN1mNy?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c9be79d-b1fc-4296-50ab-08dabe305334
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2022 06:46:39.2546 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lao3ettwyduSC7WFLx6eo+RvG10kwom6oTKA06npGGAQmz6GQQaef4Qw/UvBrl/vJKyxsLBVEAHPxWd4HGL8TQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8081
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
Cc: oliver.brown@nxp.com, krzysztof.kozlowski+dt@linaro.org, sam@ravnborg.org,
 jani.nikula@intel.com, tzimmermann@suse.de, s.hauer@pengutronix.de,
 javierm@redhat.com, penguin-kernel@I-love.SAKURA.ne.jp, robh+dt@kernel.org,
 linux-imx@nxp.com, kernel@pengutronix.de, Sandor.yu@nxp.com,
 shawnguo@kernel.org, p.yadav@ti.com, maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Mailbox access functions could be share to other mhdp driver and
HDP-TX HDMI/DP PHY drivers, move those functions to head file
include/drm/bridge/cdns-mhdp-mailbox.h and convert them to
macro functions.

Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
---
 .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 197 +-------------
 .../drm/bridge/cadence/cdns-mhdp8546-core.h   |   1 -
 include/drm/bridge/cdns-mhdp-mailbox.h        | 240 ++++++++++++++++++
 3 files changed, 242 insertions(+), 196 deletions(-)
 create mode 100644 include/drm/bridge/cdns-mhdp-mailbox.h

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index 31442a922502..b77b0ddcc9b3 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -36,6 +36,7 @@
 #include <linux/slab.h>
 #include <linux/wait.h>
 
+#include <drm/bridge/cdns-mhdp-mailbox.h>
 #include <drm/display/drm_dp_helper.h>
 #include <drm/display/drm_hdcp_helper.h>
 #include <drm/drm_atomic.h>
@@ -55,200 +56,6 @@
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
@@ -2058,7 +1865,7 @@ static void cdns_mhdp_atomic_disable(struct drm_bridge *bridge,
 				     struct drm_bridge_state *bridge_state)
 {
 	struct cdns_mhdp_device *mhdp = bridge_to_mhdp(bridge);
-	u32 resp;
+	u32 resp = 0;
 
 	dev_dbg(mhdp->dev, "%s\n", __func__);
 
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
index 000000000000..0249322a74b0
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
+#define CDNS_MAILBOX_FULL			0x00008
+#define CDNS_MAILBOX_EMPTY			0x0000c
+#define CDNS_MAILBOX_TX_DATA		0x00010
+#define CDNS_MAILBOX_RX_DATA		0x00014
+
+#define MAILBOX_RETRY_US			1000
+#define MAILBOX_TIMEOUT_US			2000000
+
+/* Module ID Code */
+#define MB_MODULE_ID_GENERAL		0x0A
+#define MB_MODULE_ID_DP_TX			0x01
+
+/* General Commands */
+#define GENERAL_REGISTER_WRITE		0x05
+#define GENERAL_REGISTER_READ		0x07
+
+/* DP TX Command */
+#define DPTX_WRITE_FIELD			0x08
+
+/* MHDP Firmware access functions by Mailbox */
+#define cdns_mhdp_mailbox_read(__mhdp) \
+({ \
+	int ret, empty, val; \
+\
+	WARN_ON(!mutex_is_locked(&(__mhdp)->mbox_mutex)); \
+\
+	do {  \
+		ret = readx_poll_timeout(readl, (__mhdp)->regs + CDNS_MAILBOX_EMPTY,  \
+					 empty, !empty, MAILBOX_RETRY_US,  \
+					 MAILBOX_TIMEOUT_US);  \
+		if (ret < 0)  \
+			break;  \
+\
+		val = readl((__mhdp)->regs + CDNS_MAILBOX_RX_DATA) & 0xff; \
+	} while (0);  \
+\
+	(ret < 0) ? ret : val;  \
+})
+
+#define cdns_mhdp_mailbox_write(__mhdp, __val) \
+({ \
+	int ret, full;  \
+\
+	WARN_ON(!mutex_is_locked(&(__mhdp)->mbox_mutex)); \
+\
+	do {  \
+		ret = readx_poll_timeout(readl, (__mhdp)->regs + CDNS_MAILBOX_FULL,  \
+					 full, !full, MAILBOX_RETRY_US,  \
+					 MAILBOX_TIMEOUT_US);  \
+		if (ret < 0)  \
+			break;  \
+\
+		writel((__val), (__mhdp)->regs + CDNS_MAILBOX_TX_DATA); \
+	} while (0);  \
+\
+	ret; \
+})
+
+#define  cdns_mhdp_mailbox_recv_header(__mhdp, __module_id, __opcode, __req_size) \
+({  \
+	u32 mbox_size, i;  \
+	u8 header[4];  \
+	int ret;  \
+\
+	do {  \
+		/* read the header of the message */ \
+		for (i = 0; i < sizeof(header); i++) {  \
+			ret = cdns_mhdp_mailbox_read(__mhdp);  \
+			if (ret < 0)  \
+				break;  \
+\
+			header[i] = ret;  \
+		}  \
+\
+		mbox_size = get_unaligned_be16(header + 2);  \
+\
+		if ((__opcode) != header[0] || (__module_id) != header[1] ||  \
+		    (__req_size) != mbox_size) {  \
+			/* If the message in mailbox is not what we want, we need to
+			 * clear the mailbox by reading its contents. */  \
+			for (i = 0; i < mbox_size; i++)   \
+				if (cdns_mhdp_mailbox_read(__mhdp) < 0)  \
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
+#define cdns_mhdp_mailbox_recv_data(mhdp, buff, buff_size)  \
+({  \
+	u32 i;  \
+	int ret;  \
+\
+	do {  \
+		for (i = 0; i < buff_size; i++) {  \
+			ret = cdns_mhdp_mailbox_read(mhdp);  \
+			if (ret < 0)  \
+				break;  \
+\
+			((u8 *)buff)[i] = ret;  \
+		}  \
+\
+		ret = 0;  \
+\
+	} while (0);  \
+\
+	ret; \
+})
+
+#define cdns_mhdp_mailbox_send(mhdp, module_id, opcode, size, message)  \
+({  \
+	u8 header[4];  \
+	int ret, i;  \
+\
+	header[0] = opcode;  \
+	header[1] = module_id;  \
+	put_unaligned_be16(size, header + 2);  \
+\
+	do {  \
+		for (i = 0; i < sizeof(header); i++) {  \
+			ret = cdns_mhdp_mailbox_write(mhdp, header[i]);  \
+			if (ret < 0)  \
+				break;  \
+		}  \
+\
+		for (i = 0; i < size; i++) {  \
+			ret = cdns_mhdp_mailbox_write(mhdp, ((u8 *)message)[i]);  \
+			if (ret < 0)  \
+				break;;  \
+		}  \
+		ret = 0;  \
+	} while (0);  \
+\
+	ret;  \
+})
+
+#define cdns_mhdp_reg_read(mhdp, addr, value)  \
+({  \
+	u8 msg[4], resp[8];  \
+	int ret;  \
+\
+	put_unaligned_be32(addr, msg);  \
+\
+	mutex_lock(&mhdp->mbox_mutex);  \
+\
+	do {  \
+		ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_GENERAL,  \
+					     GENERAL_REGISTER_READ,  \
+					     sizeof(msg), msg);  \
+		if (ret < 0)  \
+			break;  \
+\
+		ret = cdns_mhdp_mailbox_recv_header(mhdp, MB_MODULE_ID_GENERAL,  \
+						    GENERAL_REGISTER_READ,  \
+						    sizeof(resp));  \
+		if (ret < 0)  \
+			break;  \
+\
+		ret = cdns_mhdp_mailbox_recv_data(mhdp, resp, sizeof(resp));  \
+		if (ret < 0)  \
+			break;  \
+\
+		/* Returned address value should be the same as requested */  \
+		if (memcmp(msg, resp, sizeof(msg))) {  \
+			ret = -EINVAL;  \
+			break;  \
+		}  \
+\
+		*((u32 *)value) = get_unaligned_be32(resp + 4);  \
+			ret = 0;  \
+	} while (0);  \
+\
+	mutex_unlock(&mhdp->mbox_mutex);  \
+	if (ret < 0) {  \
+		dev_err(mhdp->dev, "Failed to read register\n");  \
+		*((u32 *)value) = 0;  \
+	}  \
+\
+	ret;  \
+})
+
+#define cdns_mhdp_reg_write(mhdp, addr, val)  \
+({  \
+	u8 msg[8];  \
+	int ret;  \
+\
+	put_unaligned_be32(addr, msg);  \
+	put_unaligned_be32(val, msg + 4);  \
+\
+	mutex_lock(&mhdp->mbox_mutex);  \
+\
+	ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_GENERAL,  \
+				      GENERAL_REGISTER_WRITE, sizeof(msg), msg);  \
+\
+	mutex_unlock(&mhdp->mbox_mutex);  \
+\
+	ret;  \
+})
+
+#define cdns_mhdp_reg_write_bit(mhdp, addr, start_bit, bits_no, val) \
+({  \
+	u8 field[8];  \
+	int ret;  \
+\
+	put_unaligned_be16(addr, field);  \
+	field[2] = start_bit;  \
+	field[3] = bits_no;  \
+	put_unaligned_be32(val, field + 4);  \
+\
+	mutex_lock(&mhdp->mbox_mutex);  \
+\
+	ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX, \
+				     DPTX_WRITE_FIELD, sizeof(field), field);  \
+\
+	mutex_unlock(&mhdp->mbox_mutex);  \
+\
+	ret; \
+})
+
+#endif
-- 
2.34.1

