Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B38E477390D
	for <lists+dri-devel@lfdr.de>; Tue,  8 Aug 2023 10:33:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8BB310E3D6;
	Tue,  8 Aug 2023 08:33:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2060e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7d00::60e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0255810E3C7
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Aug 2023 08:33:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iJJ98+15Zdp9N8BeNjzMO5+cg48Z5FQr15qiaHM9A+l8+BXkxtVGz0Pni87dtJbNTAovl0jONXm6P/glnQZ6PSj+q/QBD8+OKyULDW7PyRjAKrODsaTxQM1ohO/Lh640bNB8W9g/Fi3jVnuL4bmAPWeM1XeZENShR4TYBINn0Wb/N49S/EiHTVAHuMapFXee22gZ2J5t8OHLNnEZABQETMvN6/9mfPOeMTGPaWxn5UZW/zvAXyUNTJDzriH8ZLrxj1UAySY4qaHxPyPLO18rW2lYZRh3JFugbTafmOqrwZ3SewlQufta7I7d9Brg2m1xhnkzWLS9maiaQKehUnHOpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ijwdeyLNa08NSnsUKg5AfgNvRzY4Cu80iQJCRRRMXtk=;
 b=Yw+jSDcQRvB+OYJn5WlJkv8EczI/RWAZ4p80gupv3bF9zB2vXKqRrUDBLvAUeAoh4Hxcxjm7mQzGXmSIOFVsfMTCY0DgBLfdCl5FIv1HuLh6RKQSN7mR42eqv1/CHweVA0p0TDX9xEXfQM1uIF9H8CTtRga3AcIhTy7DRkJE9rl19FcPLqnn65mNck4JA3hOd0NUdukYMHCWu8FVGsPK8PeC4vb6pyh2nc54En9i/fRSmP5A2HtmTSo1ZKY5nkLlP05Ar8pyhCb6V3xAx1wtFzNKJVic/C4krKE99O3+7/1ncZlEMYG5d4HYJabekH/TVs1vutgQAOqhQ4yGQ19whA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ijwdeyLNa08NSnsUKg5AfgNvRzY4Cu80iQJCRRRMXtk=;
 b=jHHBGKHs93JgIz6D26rza8m1WkN/5oiRvXXJWAk3KT8H5yqHas57qd3RcCEdK4EKkWRpxhi+pMhsvBl9BPV4ucuEAtPuDwychtEn2o8H+wVdjZCfkbrtAH3NyZq2/gbEKiyEeNNPE75IJtwKY+f6h4CbXPufjtS+aPE2MRclA3Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by VE1PR04MB7296.eurprd04.prod.outlook.com (2603:10a6:800:1aa::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Tue, 8 Aug
 2023 08:33:38 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::3505:c499:96d4:1429]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::3505:c499:96d4:1429%4]) with mapi id 15.20.6652.026; Tue, 8 Aug 2023
 08:33:38 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, festevam@gmail.com, vkoul@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org
Subject: [PATCH v8 1/7] drm: bridge: Cadence: convert mailbox functions to
 macro functions
Date: Tue,  8 Aug 2023 16:32:37 +0800
Message-Id: <20230808083243.3113192-2-Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230808083243.3113192-1-Sandor.yu@nxp.com>
References: <20230808083243.3113192-1-Sandor.yu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0010.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::17) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|VE1PR04MB7296:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d441f7a-a141-4585-2047-08db97ea29e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pkLE7ZRspfOPpxZLGczaDqmOCW/7q7/ZzPSDszSnhl0AUekgdh6niUVvR8tO8XpyUdcmGZDOktr6cpqR5PMtDwz04A/xJx3c92YduqTx2oZg1AZ+bIir07LsJWe8MbPNqEkchnf3IIMoreEofkON1RVgwAWZi8+uQeRJV0Z024ZmMD+OH5n3ksWd6iVs45YyUQceAt87KfTK4/Uf+JAwg9UYBnS+BVKhrG0OVzeLERlpzyeYuU3/le21hW8fEWC6a6ZFr0MXnnOZjA7SPVRFkLDxav0/5hAI2iMVXBUjBDWgo89kEcUqBjIDlUBG3mVcP9oHUhzVAHAMlLMu+qh6In+WnqbrOtgkxJFhkztgBxXSPft/xdUcNRvf6miT3q55BmZed1pxNRl0dMl9l2FyYCAYr34MJjej8Rp8Y3+2XWwFvLosIv8Hv9hE4YI7R9thppH8TCgyzaVnLTmnmK49oLPfUj0ZwyuCbcsNfttRY6q8gpbOiXAqe0jod0T97rHWADsTw9tJ22XJS+tB+fydilQjR8BK63+BvXpKaVnmsbqLBNTsW3bO32yP9lDpy05jdCG9m8ra1pw0ow0ITE8qJiJBJSZsEIMOZnHZdMioqs1aKowh/913vtuBi0guFi96
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(396003)(376002)(39860400002)(366004)(346002)(451199021)(1800799003)(186006)(83380400001)(36756003)(2906002)(5660300002)(2616005)(30864003)(15650500001)(38100700002)(52116002)(38350700002)(6486002)(66476007)(66556008)(921005)(66946007)(6512007)(4326008)(316002)(41300700001)(86362001)(8676002)(26005)(7416002)(1076003)(8936002)(6506007)(478600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ypEshae1EHEVoLqndjt/f55A+ps+ki9J+vE97iPwc3xj4q+MtG3x4TRZPmvg?=
 =?us-ascii?Q?e82RpRXC/JjG+Zy2qlz73uv5YTscnkrZexOyMpkVZ2bPZL9Vsp9n9M80wAAr?=
 =?us-ascii?Q?7VPDQ/AVwYyhsqyt+EtZA9wUWsi+cSrLCeGXei2US3uIU2ZevrCpqyZFhKjw?=
 =?us-ascii?Q?BBUmdPWJa8A0+q8SE1n3HIdBfZSuG8Yc5u6aGLUqB6UgjYdoK3LL6HhJ/KT/?=
 =?us-ascii?Q?w3VAqxDSZw1DOHztUyjpOGq4p3eUbSe8AkmwC35ak8tUrmFgO9na94/QSXCA?=
 =?us-ascii?Q?Kt458P3dSmcyD0/bAVErgh5fW5LKpZHJA4iWYNd6YE+6FD0cz4huV9BX6g8W?=
 =?us-ascii?Q?v3P2toAdie15LBrUrtn7C2DbPI8ZdrVS9n8pzecXQ2Pdzmi25XHQUWmhK1gZ?=
 =?us-ascii?Q?6u4Vta6EmE1dxsYtcjLz0XR5w0RMhRHm2L3KiDBAPLRiDJSTdy4iVgvi7+VT?=
 =?us-ascii?Q?qCQukN7h4eytewAT8sFqKFviOsxr8yors+tJW3k7rJKx7B8iMatXpC2xIguK?=
 =?us-ascii?Q?XihLsgTz6dWQg3L5VdjhTMTBNC/fR+8JIo3Q01erjnXqSFP3PhcPExMYyUni?=
 =?us-ascii?Q?Ov+isIJY2U7SDaGfaKecKobQNeaaTjy1VNhsgzg5xbGEVOVeatx6goe4g5uj?=
 =?us-ascii?Q?hII7euyUfCBOSIXgK9dcsoI/6Wr9NL9aBO5paNcLy0Fc5g9bVLnv9w77t+vF?=
 =?us-ascii?Q?Xde+X/XjRWmsskSGBHkQGaXt8Hm3qUlgTC3i+x1tP7IqiTe0Fqkgy9hv7/pX?=
 =?us-ascii?Q?YEn6oTTqw4XgEKkrguwNyjY2e+Mz2QxaOjvxn1TtlAwMYiliEb54M3NPf/ni?=
 =?us-ascii?Q?3diAs0md3S0jFBJe71WRp0JNGHqpE/do+uu0JXCarJ6EYDSOg5q2YpKjYZ1H?=
 =?us-ascii?Q?yenKuUFOydjfIEb+fndGS+Qoh0n/U5RVA92hlyEfiuLJWCQ4M5JJzej/lqpQ?=
 =?us-ascii?Q?/9q7h8ZheICcojcZ3mSEXXiH/yj4Rs/Fl3hApOAHQC2WxwCrs/lE3sWwnIXx?=
 =?us-ascii?Q?6yZAIKTcG4zcmfedwGY1ZeoC6L3je4UyApGoT5uGKL/MGK7epLj9GXuBb9oe?=
 =?us-ascii?Q?BANUpy+Q+tcFAhLVRMtK00743Gd0m2fulYXLu3kmasZtxRwMft60ancBMRya?=
 =?us-ascii?Q?HGhUNTaVIIGyzKJU3xjnlaNdWL1T8i5ngmk7vD/qbNqbsdoDUEQkLvdgeAcs?=
 =?us-ascii?Q?jzm2Q7kPG5aGDVRdOekaVAk0U6utVwrlUp018faqzmlKbs5ArBCxBNUNqiu+?=
 =?us-ascii?Q?M3x9mB7xzYajPiNH14uXzeevofeDaKtLeOOLKRy7amdGaWdu7TWM8tLX3qov?=
 =?us-ascii?Q?PvdfP+GyiEjLpbmOJznEkXUlH1z2kSh1xcyHSeaA95Wd1gKs/nYOuMfn1P5H?=
 =?us-ascii?Q?MDRY9rK9su9dy1tK/4k5i7Sk3zaOSAaYULUJ+mlceS2Tm4R3S5W9bvIZGywf?=
 =?us-ascii?Q?wnxl4VM5KDoP2mCfSrXfB1Kf0nPAmFilt1E3IxOKy1jYfCAQkSzJrshiDQb+?=
 =?us-ascii?Q?inBBOXrDCVSDoRyHCfkyGyYjnA0iGprLhot/YgbRmrtscDkGPf70WLrJdXra?=
 =?us-ascii?Q?MQNoNOJdP5aT8CjJZ7AGkIkNrWq8t8tJYqyt4h10?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d441f7a-a141-4585-2047-08db97ea29e3
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 08:33:38.6527 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ny6IV4ggq+h5jT+hhq2RRZ3vkOBVGx9Q+zdE9zbfVFw6jbBT+6IjFpL6m8/+f7hha/yiTLRos5rczgV1mZ0BiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7296
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

