Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCFF63A20E
	for <lists+dri-devel@lfdr.de>; Mon, 28 Nov 2022 08:38:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 726F610E1E1;
	Mon, 28 Nov 2022 07:38:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2076.outbound.protection.outlook.com [40.107.105.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C93CB10E1E0
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Nov 2022 07:38:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SLEU1Ok++iNyaRfnYtrWOiNbaKSqHJI5PfEZ0OUrHHCFpuYWyChr6KIKr84Mw8IQlOhoz2RYqACcTbxtfGQjli02W1ciXtWQ1y7GinU1I7cMNWxAE9Zt3d+0vO//10W1j5wIEFPSkz6rw+8Ny6QaOolJGXyBfc4b4rLoOVS1YXep6j73mHkVoc9BsOs6n6aDP8nMKdcQ5v0i/nPiC7JDi9XbLau9h8INl/L8ElP0MPuzBPR/d9HAR0f1B5RmQuI98ok4Cqn5p4gfeYcY+ebGTMOFtAr7eEMF7c+gVwG0j64eAnE57E32+HzNzPggjUStiFNKR7gQX0k7Dk2+AjUhRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CI6HiPRkfFukA+gvkjMZqgx2ImVxcURakl6FJilSdaY=;
 b=GKF0EIEepxd7X8BGE4tVVAHrEtvzki3ycdInl0BnoBA39y7pyJ55sZxekz+qdgS0Ocn6Ps1+2ByegXXCqYu9bdTJCAF3OREhSfxTR1Sp8v8Sl0nljoR1K1gdzy5labUbabaagTzAnCZUsjZPpwZlY+w/766IE0TrwI1AdDD/Gxz2+gJvJACob4OeG9QqjGQgaNoJqZPv1ONME+FYvA4ohtj83quM6fi/o0s2NNjNqviTuHslfrIwlEHKqwCEkJEJ2DPtS8DsWOpd4qa/tRid+2o0Nk7fcLNiMpFbYfDxAepGIrUoaRl6LdQXj1/TNcHDyC+SMFP7d1dY0ImVhoDH3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CI6HiPRkfFukA+gvkjMZqgx2ImVxcURakl6FJilSdaY=;
 b=Qs7H3fnqhjwIqFUwAVajbCvI0lUgtwtOP6sfX9tgkbNWp/plCL5btqZihvBiXYo6ELAwtuxfS2Q8SPlTU4JrniQGhkRd4HZ/hnmPXqjvz6o0Nm7jPr+C+mOtRW87ljG+VjdxEcohIYzeJGSaKqHPV9h7SXIEVd/HBcKzlbyqNuc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by DBBPR04MB7754.eurprd04.prod.outlook.com (2603:10a6:10:1ee::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.21; Mon, 28 Nov
 2022 07:37:57 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::d0c6:7b1d:6982:d400]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::d0c6:7b1d:6982:d400%6]) with mapi id 15.20.5857.022; Mon, 28 Nov 2022
 07:37:56 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, festevam@gmail.com, vkoul@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org
Subject: [PATCH v5 01/10] drm: bridge: cadence: convert mailbox functions to
 macro functions
Date: Mon, 28 Nov 2022 15:36:09 +0800
Message-Id: <be4532b834109595b0fbf3562bf072caf2852a01.1669620155.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1669620155.git.Sandor.yu@nxp.com>
References: <cover.1669620155.git.Sandor.yu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0051.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::6) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|DBBPR04MB7754:EE_
X-MS-Office365-Filtering-Correlation-Id: d7c0b582-22ac-4720-92b9-08dad113778a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JtJCSr19NO3ZXa6NuFTHD0dxEpw4ndqd53QbZG3OoKbVRFQ0Ib9+z8wJDA/t4On/ojmHwPEWota5QyMkDVX0zuoOET/qNU0X48hezBsIEMDGJdIfikXf8f7BOASOv54GxSXQ7OBAwS2BdnUOtqnJ2Nh0tK/NqkcQr02uQcFtXg1mpAhsiybzQ8PxbrTepSczbhzS5ZWBtiwF8IcJXAoCd+rnGx2gDrhkYYzQbBlzu7ZsKRuDUJHFgya7uFJcaoJ7GUqYvBeNzrV7Eg+5mY9BWThRox2qR0hfQvLyfhN3AMyDto0wCP39yzdD0ikKRIl/lOCSQ5jeqol8jREgiHowS9zdXTsc+H4stkYDyhxAOixEAeNkHq4rHy3FkxDdNRj4nHlAp2ph8KovcBNAf+bLUAakO2qfhZ98HZoH720a/BsW1XeaclO3ROxn+wUb2hoyg/JrFY07royGth/bfUOEfhBXOqOgxxNRnCBxARsyLfaz4y95Bcjf6ZE5TBs19pG4VT6KRpQA0oWPhYKI/doPNlfu6yUW1Z3ZwRb/f2Nfx2aPI4fTPui2VI34tqXCcHSpIyGC0HxF9AdViThMDkmzj020YKpFJfAqhPLBmhbSH9hgX2VoED0esy0BhNzqzhuhMAAAFYWiaTtu3TuoezWYnG8oONrwgceMnPQoI0iVZZGL2TxTH2FAtrxUHKzwn1HZD3M74VrHJvtyLqVOQvlUFQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(39860400002)(136003)(396003)(366004)(376002)(451199015)(38100700002)(38350700002)(6486002)(316002)(478600001)(921005)(8936002)(2906002)(41300700001)(83380400001)(26005)(6512007)(86362001)(2616005)(6666004)(36756003)(15650500001)(7416002)(6506007)(52116002)(8676002)(66476007)(66556008)(186003)(30864003)(5660300002)(4326008)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EKFbeHU6x6OtMiGfHuUNZI2ljOFGI4ikboReyM4AEYLMKBk/DQW4b3CyykDj?=
 =?us-ascii?Q?zkQxxXLcZ8Rmo/J2lywpA/8Hf/gAx7XHvbYm/bKdzhkg61B/77s2GwJMcxFi?=
 =?us-ascii?Q?T22C35+emYhZvpgBTBgYPAHjd28XfjvV9JooQGDumDNvInyFo6sajaUBXhWP?=
 =?us-ascii?Q?o6DcHrguPPTo9RARHqOrUJhZQQIwfyd/mLX585PHHQImu3mOOcZbiVIqPrjw?=
 =?us-ascii?Q?IZzlI8ED90iPIbVbnLjdnVJR9pfIAfSu5LsdrPqkRVPdFvRcFN9FrFpuwLwJ?=
 =?us-ascii?Q?Y9HnJYiL+lz6EayYSDRCClSt3HSwMO3FPxtP3Ue1+LFasJJpnmJMQtC05MLC?=
 =?us-ascii?Q?+3MOdf6GOC2gUgRtaRjGQ5O/la5trWMPyi9cca9GpqHoSR6IfqOgZw6TREg/?=
 =?us-ascii?Q?bj0UDQ33lQ8ozNS+4PMN60iwWRRHTdSK3rNZzcSRCeuEDa7Wf/onLB22jo+S?=
 =?us-ascii?Q?G6nZjC2ZwO/W1CSPdgufwiU4Q/bSHhVGh57t0DLgokgROjheNJRRf53LZmVa?=
 =?us-ascii?Q?Qp9N7uLVW3aUicCXSCkKLHgIW/YLI/ta7VkPMh0X4Sh4TndcvIY2kl+x0Zn2?=
 =?us-ascii?Q?7pj93rvlgz1ylk+Qk4NEr6bxWG1wOQ3dO24rdyerTSQgYFzvvAQbJ1hD7Y2M?=
 =?us-ascii?Q?7EGMGrj2MLDh+EkRD/SiS/ImlAuHxoAnPf/e0LOVqYXYU3u/oenNQ1netCzK?=
 =?us-ascii?Q?xDSz493TlMB8Gn6waE0qMnfF6j4s4dx1UgVjLqfhpEnAttdwPpAnyyTxZVzu?=
 =?us-ascii?Q?r6NqDO4OZBuKy6tv41lc80YvKVGGpF8GV5TBw4TiwDaezUSJMLAj/HiznFhJ?=
 =?us-ascii?Q?MP4lNynTM8kDf/2foRblLLCBtwrgCQowxem6Iad3a2Yh+Rd2ccAb1lk8ljn+?=
 =?us-ascii?Q?DTU8EJRWK9eAQSJLEIL74iytTjrGJRf+djL5aleOpkJODK7Q8LKi2K6/MNSy?=
 =?us-ascii?Q?VJFJ06WB3AgieARHiGe57OZqMMyY2d6UnhERCfebKwJb6mvBSHKY1UHF8RgX?=
 =?us-ascii?Q?QintLBl5qs6PrPpecsK+wrJ02SpyBd4LKRyHilVS4TGXghOLHvXKUn26M7OG?=
 =?us-ascii?Q?W5tRgKGsE64sXltlG8nFiIZuyDUtr8K+ScyiYpO0Usce5X0Wwdfarhdme7EQ?=
 =?us-ascii?Q?rPiqcpo/Cj8fevOZMQ+C3qqyxbj7Vfrjy4Qk1Ynt0/WtWIRWhZTUh3wDY9lC?=
 =?us-ascii?Q?pCQ646iNUpR4ejW1nrv77W/e+1A7pzGyuapUuQP00zBf2ZZj2gwPP8SzbiWB?=
 =?us-ascii?Q?LMbWp+lLUjrJ7hAeEqGYMO4klkPwv9bzyyVeYVH/925Xhf2tr2+s5tFl4pbY?=
 =?us-ascii?Q?kZfxPEKOgVq5UlXoSJoZRDiNtgpKGxCTLyvnTGDw8W/5Vrm9r7qFG0Wtgev9?=
 =?us-ascii?Q?bINV7GbUBzbfM9kLxTv1ULD0ru1oEV9txF++yh0+DMxcTi4XAXXLoaCULPZF?=
 =?us-ascii?Q?1lqdzorIlst+1UelIFBraxkaZ4xt2DmLMApcISJPTSuGalJJCIUWihBPnEAU?=
 =?us-ascii?Q?qPBnyg3uBZzAs9EEEK00i2l6PCA37wXaidlvB1yqlalRSrFEPc5+eaElpn/j?=
 =?us-ascii?Q?BxM0YpDTEK17qtJb/bqB/Y40w5JcKhV86sjwa2Tn?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7c0b582-22ac-4720-92b9-08dad113778a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2022 07:37:56.9000 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CpvUWSodQlN6bCyxswUlQAcCssQrZzMKS46aXFD9A9nupjlyQFuxpmc+O5eImVOgLnUbuUShfonrGG0yyMeWfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7754
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

