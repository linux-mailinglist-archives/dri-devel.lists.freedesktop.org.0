Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7E4631A2A
	for <lists+dri-devel@lfdr.de>; Mon, 21 Nov 2022 08:27:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9F2F10E146;
	Mon, 21 Nov 2022 07:27:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130040.outbound.protection.outlook.com [40.107.13.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81C3610E146
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 07:27:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hLe7iPGUWMFaeoOlJQkgMlRCLWhxNGsfl6ZKsIKNZKO2KJ96vH+mlVjsqCz7v5sqRbemVSmgsUiUOP0yPJkVpjYS0GynRkvo0/wR6tw8RR6Lo8jZNRGv6n1BONEZHL6r0Y9t8mSPmhgx5V9Oah0buBNRDj5s2DoLMdMlg9Cu48eEX4H+y1Nql9JGr/7AYdnwrAdQqKgkXDH2o/MKmlXqElxWfFI5tpqK3VMMro3fUVbfqhDI+IcjfysN5ktYveVSFahW8uzQm2jfaffD3VN7/xylRrGT3UFrfz2x0UqXYQN3UaEkrBpee3l3J5HROx4I8u4hzMeu8qzguB/X1qIHGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CI6HiPRkfFukA+gvkjMZqgx2ImVxcURakl6FJilSdaY=;
 b=c8DBLspV6q3FFZX0X8kLjAORh/ynyWIWXwQ3P0TO6TG3UL1K7kA9MhHjtCjG4EtcyYd+FslLZiC2slaaIwKso9N7gjb89xjfsqZMe0SRPvW+k8Iob4pxBZFs8jTsJlAQG6Z/MX9dH86ff3fMFzv9/aIrF7UnCsYpVkH6rqIoNGEQK4YRYmvO5dRp2OQmC9Q+L1I8WsPZAYGv9S3lez0lE0hTyJTEVshB9DiodmmwIemfq26TqrRavV+FwBCnFg7Yao4BcJ6rEUifQ8Ys9cVM/CufbmxAJwyTkSdDz+rkLvnCKK1JdJNkzlVC2vZv+wyUy9hVw5JV4KgS9QtTHf7U9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CI6HiPRkfFukA+gvkjMZqgx2ImVxcURakl6FJilSdaY=;
 b=oklkKTBZYsIBarzXg8tZPCmyBs18EvzKaclyu4330+49LSDhei6ZdK9eo7KfktUG8tV7S+q2JsjmyLrRxN2Pw5SzI3PrAhpJ5G+uTrJSVY5rQ42u8ffPcKk7YSFVGMzgvGAXBd1+zC9yf6tiiGc+yyVRA9bZ99nzTWb/NKvAkj8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by DBBPR04MB7769.eurprd04.prod.outlook.com (2603:10a6:10:1e0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Mon, 21 Nov
 2022 07:27:00 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::60b2:4bec:7707:e196]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::60b2:4bec:7707:e196%5]) with mapi id 15.20.5834.015; Mon, 21 Nov 2022
 07:27:00 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, festevam@gmail.com, kishon@ti.com,
 vkoul@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 alexander.stein@ew.tq-group.com
Subject: [PATCH v4 01/10] drm: bridge: cadence: convert mailbox functions to
 macro functions
Date: Mon, 21 Nov 2022 15:23:51 +0800
Message-Id: <be4532b834109595b0fbf3562bf072caf2852a01.1669013346.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1669013346.git.Sandor.yu@nxp.com>
References: <cover.1669013346.git.Sandor.yu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0246.apcprd06.prod.outlook.com
 (2603:1096:4:ac::30) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|DBBPR04MB7769:EE_
X-MS-Office365-Filtering-Correlation-Id: f17b0c54-ed56-4442-debc-08dacb91c74f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v3bLgsoc70cRt1VT7wmghzB5CTJySIO+X127bv9VIrlMnBUBcB9Lwor9rA6neH6ykaxvOycRtFGQDwVlYne2UR1KzeZr1kunwzT0V8iU48sXufboasxWrTmW4UBK7TD6NrQfzWg+rdHqSBRByJvL5djt2QtSDD5gMwgCdV7xHISE8Oc6mLleHZyF+AvJycKsdBZWF1sOTR3wYyN6pBStpTd7H0LKcSFNsSzfCIFDWwTL7h2niRscH4d274DOB9yuzYWcQE4vVnSuyPPX61DA3Oa6X4kwFGxro23UWi+jgE8yG6wAKroiMe8KxFtyiXDi4CpjPvC+7dj2RNU/igDGqwS80u7fu6w4yUEyKo+qKJYDOhT+3CDMz4IPSE0z/NXw4F0WEfE4zUmlRItqqdnz2dZY1/HdSpS9qI3ZSFRkbV9jY7xYLyz2o8ZPcth4ikbB14oOwgh1P5+wfD+ZVBCtfQxyHJT5YoRMdjesfP87vgEYYPVH9wErh+VEJBdvY7RZHc/21dnGm8ELLkOQl8kQwMvvlLwE5E8gEe8v4q7z4Llg7z3/3Qg++yYo/rSSOyFBKpVeh3H5HbnwJiNFv7fuPuXPTvt63ylHI0AKf4F7oBhZzWEUhWHuCREtSKa2Xhvmtj6Kin0mWzKyGDuM719Xu6z623lfQy1slTfifnaYZxJ2oBdrZQdDwbrWej/1Bcwm6pFO/iv6mmZlj2YY/jm5lA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(366004)(39860400002)(136003)(376002)(346002)(451199015)(86362001)(36756003)(8936002)(5660300002)(7416002)(2616005)(2906002)(186003)(30864003)(15650500001)(316002)(52116002)(4326008)(6506007)(6666004)(66476007)(66946007)(8676002)(66556008)(6512007)(478600001)(38350700002)(38100700002)(26005)(921005)(41300700001)(83380400001)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QIBKzSt1QZJx8/AFrCHC4ivzT02dd1roKhUrpRHiir7NqKAQnBxrILgvepp8?=
 =?us-ascii?Q?kTdEF5BzsLLBihWVxfnssXSZJjzdJCVgLMXouf6mExqpWmMJONFuq9bnSiin?=
 =?us-ascii?Q?OHveW/OGvpO03+gvp9V8e+DowXoM2SSVgN2cz8FjtewsamiSFAQv63VHfkdg?=
 =?us-ascii?Q?JbjwdRPAy/bI9/pgQYv64yETB3k9Es+FgRLYVpdoZ2jlvNpXEt7UL4xLJ8AX?=
 =?us-ascii?Q?0xXctGHjxBhkimFMra73lFWN0Z8gYzfZfHxiarmEp4Bb2wtkilFOKEzp7mgt?=
 =?us-ascii?Q?3pset5viBUfKbGTh83xtGYh/2brSSyUv/bavQmspX9kxhFs0AXmBRfvhSh0Y?=
 =?us-ascii?Q?VW9j+aubuHQm3bbFZ6XVpxX56hfn3lOPi6+cEay8i8vWNIUeSCgsrWX52kZd?=
 =?us-ascii?Q?axxTAAkEXW3BjVoAmeZB5FDo1hhxSMl1K2jIqrtsSZI/6irweE9NavF5czLp?=
 =?us-ascii?Q?eqDEMPoKGHDOMB6o4VdNiw1CRGLhG3O9Cn4J+UH+ZgIHoYQNA/qjmcSusN8F?=
 =?us-ascii?Q?gUhnt/PVDpNG/2TpnJnmGyO+Lz44OYfRzi4w2LbiHBTW5cQtxzEiRlSQ7Gt6?=
 =?us-ascii?Q?jjW/gZlETPU3TWi2VZpnLzc8gQIdT41vn6Lrl5GdXyvF9uWO5Bgl8vKX6bAh?=
 =?us-ascii?Q?tpwkRwYQb9ergPy7fRGsSGe1d9gPrH8FzIl7IsN7QG53lxDM3hEnUsS8pkJ2?=
 =?us-ascii?Q?LzelZPpmLfmhwkWbWLvKfQgnINzBsOoK/RyVMccKTXQyIIKlNGvcPBkpa73a?=
 =?us-ascii?Q?IFMaHxp5rxuYpcp8z7inuket58KA3fI5eFpJqPbOndaEqo6eTP2a4J40K/W5?=
 =?us-ascii?Q?R7Gs/71BDFNG823iwD52/IeG4P129Zx19vVxnkdoFD/JrPaaT/OP2GBBGU40?=
 =?us-ascii?Q?VJntqEz6b6cA73naqmy934uPJ3bxrLIneohwXyd7M+rMbB6bclMz0DnzT8yW?=
 =?us-ascii?Q?DJGobkvenp8XrQjTItKXaBuVypZVEBIQZ2mEFB4xpJSOrwlNk9+h8QrEvI6w?=
 =?us-ascii?Q?FSGu8wMPuVLkUAfBC7Zft6CafIUIQxrkO3Q98pA50XQn2C79QnINilIPVshV?=
 =?us-ascii?Q?ityStWKQNjJ2OBDFa5mfIKNY1LR4eJ+cOJLFRloNhudAPcq++vsRlC47iUsb?=
 =?us-ascii?Q?2ZPSXV5eoYLe/eGx8RKd/EchCi9JolpB25+IKi5J7V6mkRrRvOOD/tVzMI6K?=
 =?us-ascii?Q?ncj/SgCNkIVUuMyGoP9+nRRfrprRObURtzOfBP/O+dVIAk8Vr6choTp5KVsE?=
 =?us-ascii?Q?amtvnadXQrvLfttNElN60MG/6FFXROOKutvY/yGiJDl4eujI++BVBRgZCwr5?=
 =?us-ascii?Q?RyzjIFx5uygsznGWIpBKcyxpGo5SVDsIb/4VP5VLucPD/s5AbuuVuP0AXgpS?=
 =?us-ascii?Q?7Pl9Htx24lc1vdHWb+BWA8A77A712ub/TRFVfAu3N2AZJvoLdu/HQs3Fx30m?=
 =?us-ascii?Q?quM84oFuQ+v3eUt0o8nCggDts4Vq+QY82aIB+owbco+wryPE40IB9s1jGNsr?=
 =?us-ascii?Q?z1Dym0NfKGpQNjHJiG/+IadRsUXm9odFDzDkyrkFZPsbOXQRWEai2HZihrE2?=
 =?us-ascii?Q?8wS6AjAMH0yaghNzvgZj76aLHNr9jHfX7tMfs7uv?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f17b0c54-ed56-4442-debc-08dacb91c74f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2022 07:27:00.5017 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 19CzhCVDoCF2uBY6ngFifAiUOjxJGSKc6YRtabuPjUlv8PFgzoIZQ5i4k+9K1g/9UTSHoEgaW9xJDqFpqgvChQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7769
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
Cc: oliver.brown@nxp.com, Sandor.yu@nxp.com, linux-imx@nxp.com,
 kernel@pengutronix.de
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

