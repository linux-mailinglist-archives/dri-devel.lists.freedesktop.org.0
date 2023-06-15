Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 486A2730CB1
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 03:41:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7297810E105;
	Thu, 15 Jun 2023 01:41:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on2053.outbound.protection.outlook.com [40.107.15.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA6C410E110
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 01:41:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=girvEoY/5BK/vfI6vJ1qKgcVsY++Rp00Kh4eSF1sc7wWqpESfql9JmQ3ccKXYK/t6RPNREw4NzUckaEpCrSgC6pprTClwOlFNhGjs7VIp4yem6txZnMjfImYQ7qCxbvS+3kdtFngE6uw7u80EI7H/2GZs8OIwvClamgEVy66yJG3dfIQcDUf8PKHV48wbPkUjual6lkdZhm6p2XkQGXThW/0mPZ9iaaG1MbteQWSK/fjBEMXyniawAu5/rNgtHuGY5qzCtB1jnUqnytbtkis2r19UBttcTxTdePU4fvMoRlq3krdF2tx+DjHTHnEDZlJgbrDZIx5GYfTuKquv/n4RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0I+fKRtDDAcMt2aizgr7kNUrVlcGa9vIcDrP7O2qDLo=;
 b=iD6m7O2NfoPJPq7WXyZ7D9v+PDoz10gFGBA3JNevQzgSp9lsgSQ3CrPwbMTT6mmDaRxc+a84budUFyApr8/yUwZrCcC+fMxnAWMf7FhlcGmm951SrPrm85WWW9oaC8YkE9+deM8JSWSgB/1a7a00f3/2CmIYRngu/BRecABsFBwkGz1BusJC55r4+eSzwbRAGWMtMlag4Mo8PseObHbVL/m9gKbVJz0adgzesKiOO5bVlrXf8WT6dBjRYJkyljb1qRrmCymyeFW4ABQKFwa1TlFJ2uZW6gH4b/Y8ofE2h2lu1W8BIC2isxWLuUHkHS8Z0xSuELCzLh+k6ozmjzsy7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0I+fKRtDDAcMt2aizgr7kNUrVlcGa9vIcDrP7O2qDLo=;
 b=ihtIVUGFkeo+IdE6sB+irZBRE/HrT3sQnOH9bO5lCXaFlMwymhrt0Viw9bEXFg0WwRWEVCPE2fXieLmSLdA0G6sM18SrJv3+A52TNOYSSSgRs++dL4WC5HlytbyELd91wI+juEyM+VTxAbJaJPkcgYunP/TlGpoS3CKgY9exxIE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AM8PR04MB8034.eurprd04.prod.outlook.com (2603:10a6:20b:249::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.25; Thu, 15 Jun
 2023 01:41:19 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::8af8:59df:c8ab:ff51]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::8af8:59df:c8ab:ff51%5]) with mapi id 15.20.6477.037; Thu, 15 Jun 2023
 01:41:19 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, festevam@gmail.com, vkoul@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org
Subject: [PATCH v6 1/8] drm: bridge: Cadence: convert mailbox functions to
 macro functions
Date: Thu, 15 Jun 2023 09:38:11 +0800
Message-Id: <a3128625daad8348a454c8efed0ee07094db4820.1686729444.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686729444.git.Sandor.yu@nxp.com>
References: <cover.1686729444.git.Sandor.yu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0176.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::32) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|AM8PR04MB8034:EE_
X-MS-Office365-Filtering-Correlation-Id: ea6c72e0-7cbd-4ef7-5af3-08db6d419d96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 30S0ffoYe66ZpNJH9aKaHTi5cc34N3abPZ9dpb6KMjeyrF75GMT3VIG8PhJ2dgPycAMgABbcUP6Ji5xmm3+MhlbqpKuCe963uV19m/VZRDFGVcOicmUSWLwQZ3DV/QAmanoDKqiVAtmc2ZxGbtX76kfK6UYeOePlSviwpeLaQIEy05bdo4yLguFtyHG8Z/ntuO06MGA6N75XyiCiwB9jT7d9u8YmSjraHmRwoRAgtp7dm5Jn9JBW13/8JoG4Co6LfRtg0rqwmcMUChDfiFBVrZ+oeUgRd/oe+r3jdNpYy02mkrqAdlkMkrry9UjQ9PvuW5niaIwHxGpwRUb+82VRIwiHxEadAIz9BoUgJ9OTXfQGdL+t9vyQNhDQ9Ri5XEfrAz6aWaj9137EpdGu+71u9MQ0n04sMXlGu/KvFuWPN9g7dOcnob1K3J0ctUiqNaHuIO/JPzUKsQ6iLZizSf3jZv6D+r5RkSr1YvHf2dWFgYtlDvI3Xjb0xYtdmJQ8uYnhbhJ2yYed8Q1uuHSZvnk6PiFIpWwJAAlaObmMmOR10M7rRxJRx5kzkvbRFMaPl8WHeHXeGtURG+JBJrFMQqYjwB4XginyNwo9+IY/azA/cad0vmmvnA3d3H/MRT/b+Or9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(39860400002)(376002)(136003)(396003)(366004)(451199021)(2616005)(186003)(2906002)(83380400001)(6666004)(66476007)(66946007)(66556008)(52116002)(316002)(36756003)(8936002)(41300700001)(8676002)(6486002)(86362001)(4326008)(478600001)(15650500001)(26005)(30864003)(6512007)(6506007)(7416002)(38100700002)(38350700002)(5660300002)(921005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PqUiVy2+wpCh1yESAiQUwK6GKyjIjFr7mXF//xcmXeTR1p/Mn6Wh9ADdkEZL?=
 =?us-ascii?Q?9mR+1dGCbGgyIoQzZ4LYOd9IODhL3m0YuTiYPpwBJ+Kzw1MmYGlrcy6lcjab?=
 =?us-ascii?Q?4P5SALzMfT7EtXizT9l3TDqefxSKMno9llgzM636FEK7t+IO4xTfxk6fLgBs?=
 =?us-ascii?Q?VuOa/SRCfp/NJuCBp46LdVrrSvPM7Yn2Hjv7+2VFP8KW463YNCGzGVHO1DOI?=
 =?us-ascii?Q?gaZt33LQ6jr1pEoAODMQGJZzjIaRrmOyNulY0tV17enyxWWv5EyLl4WXacq9?=
 =?us-ascii?Q?0GGhpYLpEzChLX2O2OBOg+Ar7gySbe74pStq5xEd7/5T3rdOJWPLnVCo1OBi?=
 =?us-ascii?Q?7KFO6TLjyn8klZR+HAnWgjnnHtKxCPrqWn0StrcW3H2+Mo8sFN+lOoYRsV4Z?=
 =?us-ascii?Q?hmg81eBZU7hKsBTSul/tPOKltjiN1tfeJeBubZPwLFpCDB6+TlR8pchsZBkZ?=
 =?us-ascii?Q?tGvSEfM2YQCqZtC7n+EynVbskwPB+GICn04QTn5nyHj+zZvQC0vBulkB8KBf?=
 =?us-ascii?Q?7Eah5qMbFdXAiHtjk+iiaCjorvqR1GNg0eq/Jzbb4lxeUwnFVFKsQ37GiheR?=
 =?us-ascii?Q?xSkby80R7Vu9iIwSDAcZBONYEdWJZiaZdxhn+JLp9roF9/RjFLd1hMofO3dx?=
 =?us-ascii?Q?1ji4WefqiiPUORjBAZcswYxIx5UaZPQCrmQ0bIUZGggoh8N5+C50qmPQ1c1n?=
 =?us-ascii?Q?qc5IfeoWitGXdk/zXiDIJdzPLrHPp2ob4mIa9RrGAQlav9W0k6sCegF4Mhz3?=
 =?us-ascii?Q?uaqZkZP4bkrIj6QbVWAIMgtUeOicVRA9kiqBLZqFC0tXVlhBw1avf4uAr94g?=
 =?us-ascii?Q?5Tc0Nrg88DuGy4eRnZ6NYOrUlCsdoyX0sBzPwUtADKkrC/3IfZzc7uFDCzUB?=
 =?us-ascii?Q?aMVOu5PS+NUdQMiJxYOvIVbJrtghYzYuCW30K4GIh8lWbMboFCG9p8Ya5jR6?=
 =?us-ascii?Q?rClvnT5J7gF4sbGEZ9GSdATKoDqQJaPDmarz60Nwe7RJXXAS46+xs0o+XiYd?=
 =?us-ascii?Q?QZXKMTMiANIsQU46iUPEFjs6Co9DFf8WJxYqRiMUvCEu77SJ/l2USqq9TeZM?=
 =?us-ascii?Q?EIJlSPd3A4yn7af/aRix+a7SO4suHHsjEX4AHHsFF247CeDCq8bOzWMtZyBl?=
 =?us-ascii?Q?2nA6fyIybNHf3a4wrhbWUPpRWBKQLxzN8hsS6uNWL8RI7K2qWAK68DwGAQa4?=
 =?us-ascii?Q?prc2t8R8T5d0l1LbGQqu5tDzTqu48YYcIduYAWfHs7o5SWs/nEncgWGhniga?=
 =?us-ascii?Q?Sud4qIKtbbyvOKK6sKXP4z7MlkfqPQCozG6rSiOis7j+JZakeowsC4g1zg6R?=
 =?us-ascii?Q?IPVtFnwXtDP5YX7FSu4VjhV1wGX6yzbs8oLsQjBBE6WfrXTpPgMarGnRcoFX?=
 =?us-ascii?Q?WjB9yjSMKTyA4q5KBMbpRGzbwEsXLHzJGkcmRO92qPLnZuhIaBVFFmnutN6t?=
 =?us-ascii?Q?JLbG9DKcxS/Ok2sRBRtA6hsqi9CC0J0BNl7paUwzSdMWE/dAFOPGVKWLGj7K?=
 =?us-ascii?Q?V7aG4nTGPUKS6rsG85vy09zRvSI3X8TGp9Tzrmp3IEXYTIBsAUbGJ5M+ARKb?=
 =?us-ascii?Q?Miw8+QPO1aqtlifNn3aDJODMTE+Vi6Mt5S7wRWX1?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea6c72e0-7cbd-4ef7-5af3-08db6d419d96
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2023 01:41:18.9876 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5wqCA/y5IyGeBpZ6FbAW0R6cQ8p9j/bj3WfvBywuk5k5FxRNFYn0RCOBL/hUoxC9Gx04Wc9SNkkdkVkJF0XEwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8034
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

