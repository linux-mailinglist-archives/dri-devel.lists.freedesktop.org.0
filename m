Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE83755DC7
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 10:04:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9503510E1FB;
	Mon, 17 Jul 2023 08:04:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2048.outbound.protection.outlook.com [40.107.6.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CBFE10E1F8
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 08:04:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JOMJaQZS7o8/GTZYbUBkmMf1Bx/9qV2mT3OTmv4mE33B9DIdzCxGXcj+HxWd/bZNNeRj8a1ACbOCmFUsWzVJO3q19LrbLWLN5ds48XYy1MizDQkzIspVnEvfj2ukoDAGX5C5FYh37n2KSM91vPu0O+Y7ytjCPvQ2bLJlLPkYsWJ3zfqsULMXG8jHEQbvLQWfH+Xk7DVzc75B6z0tvquAI7Y2xRAcs94+q89CuzptYx+YKsOhk1uR79UB4NuFfKjkmpbjmYQxxzmx07U+VZl7za6wq3OqWAkcddhci0x5hbULolAksXHv486lYXBbXGfaBArrRpd2U1gvwSbx3KI/pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ijwdeyLNa08NSnsUKg5AfgNvRzY4Cu80iQJCRRRMXtk=;
 b=Mzw84+42LNjtHvzoqZipvHOv15Myhl8btjMRCNUVmw8s7sCN+SkoYOYfUW6aceJtDgSZzIOt6wt6RwS9yepdpLNG28MRRb8UaoCu4vcrUxFFfI4MFnqoLtZ3OZkYN0GSdDZBbjjx1HusFXjb8zRgZvdbx6KX0GFBted3+tv4ZsWrJtgokntq/knQ9EPEc/2csYY/XVD4ow1AKY1h14V3Bs0UTY6MNptaoSz13rMuZr/YQhQ2Oq9hsxoNGIayw1di/VWCwqvvUk9sDMmXREogGdNcVymBUrLLQIQ47wLlHyQxz3nVjRriElf2cmwt4+AeD+ebHSrs6EzgMMqwzE+jAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ijwdeyLNa08NSnsUKg5AfgNvRzY4Cu80iQJCRRRMXtk=;
 b=GBG3jdfFY/BlCKGuYMqdJyD7s/96J8xdgzHCislxMQ9/bWiBkFEzmy6YhLlreWIdYsY5gBXjybGsggl2WbxwpVeyBTdrVZDMkQAJ6+f3IxwYwXYQxNn5RTJp3I7Jick8TOt7RhJ3GDaQM9eodvvoPnrr0/az+MWHToHf8g13VKc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AM9PR04MB8291.eurprd04.prod.outlook.com (2603:10a6:20b:3e5::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.32; Mon, 17 Jul
 2023 08:04:46 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::3505:c499:96d4:1429]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::3505:c499:96d4:1429%4]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 08:04:46 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, festevam@gmail.com, vkoul@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org
Subject: [PATCH v7 1/7] drm: bridge: Cadence: convert mailbox functions to
 macro functions
Date: Mon, 17 Jul 2023 16:03:47 +0800
Message-Id: <4dbf70119fa74dd0061cc65703f4c4e06874d250.1689580812.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689580812.git.Sandor.yu@nxp.com>
References: <cover.1689580812.git.Sandor.yu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0030.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::15) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|AM9PR04MB8291:EE_
X-MS-Office365-Filtering-Correlation-Id: 917830fc-6473-4eb9-d43e-08db869c7c4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KexzPv2vsBz+tG8hymgdGHdPMHqVRC42XD14ADi4DWpRGSmScVjCxlPQ729ZCMP6a1jEgx/7nDfUtAl53uATCvdork+XTsqfLNPWBApP9QikW8s1CbksUKtBocDtn/+p4sL/ciVbs7KnDQPe5GeyxKzu+MwchS1/dlucaEerTNcKe+HKAAmx0BKuSWed+W3/4q9vplVeVArxPURZ93BiZ+frMXb2Inn9ILkGtYisKWZzK6ishGaVwj/F7L83CW1dCYbr9LAXvZyCByE7wHO0nRWimJ4Or9GVbPzcKCqXr0C5txbxkCXxYfeYU6BVx9UVpPW8hDHps+cOTBAT17SI27IzUzLW/EeEn9ayAqzR/tE0Juqb5jn50y4OK78aO5YgW6LEZo4pIZu8xlBLLURopG5jZxszUszIkSJNUGRrQIwJYG/WvrAmpvJsDiNMPW2sYdwu1GxatM2A9q/qceAOBsquC5QCK3kPpz5y/i5+ddiHZSbQZM3+IG2WZXxZuqjcfS9B+1XiTO8aEBUbNmL/yP2EN+LnomZq3W8RXX7gf5U27n2S1jmKZ55CArHYa2oITztlD+SnXxbhivWSE++nGVLsvEbap3mVpQ5WIkE3CHzAWfiG8Xg9M96dzcofzg2K
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(346002)(136003)(39860400002)(396003)(376002)(451199021)(478600001)(52116002)(6486002)(186003)(6506007)(26005)(6512007)(2906002)(15650500001)(30864003)(41300700001)(316002)(4326008)(66476007)(66946007)(66556008)(5660300002)(36756003)(7416002)(8936002)(8676002)(38350700002)(38100700002)(921005)(86362001)(2616005)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TcuXDTgZXdgM3e/qGH8fICPzcHZNEYKalHo3628T/J2dRNqZnS3vtVCVvJq8?=
 =?us-ascii?Q?ziBFQZiSGp+zqhCbPsovBY57mm1Jd9/KqYs0LtU9yu+n4i65RQCw3OYfqNZP?=
 =?us-ascii?Q?Tpo0L6gDGvOdzH7CIu5T0qkFD93wEs4u1i3AMaoQV9G121ssOvFlC3CZ1k/D?=
 =?us-ascii?Q?baBZgFLemhWPkCal2hHgNIq+u3es0K5q3lvRi88eIi16Oh3FhbWw1srEnHox?=
 =?us-ascii?Q?ckN7OF3tREq+5hwMIHncdKtxaBjpolvcAXdDYOAg63oKSlA1wYVFGLaW0QCd?=
 =?us-ascii?Q?qXCOGmuufDrMResqt34rDIF1tRuSoGyg0iHGtadAL1yE/xtLmiFx5E8GyYLj?=
 =?us-ascii?Q?IZXNRqyh/Px44GaNlmeJob3ZVdysW9W1bsOzFKNgq6r4ooBItezxAEzZjqN9?=
 =?us-ascii?Q?X6pOMP6ShAKEPudveS9uWT+92UdEJOmefkQ9Sg/0AqMa4a2A8OvjEYlFQ+kB?=
 =?us-ascii?Q?p+fyvYtIkxwAIUPNnaRcPtW+6Xhq7Gp/m6NlMzAWXNFqXPEzdpbT8gLYUsWf?=
 =?us-ascii?Q?xK42qq2292n4IYrD0IYLwvnEpFB8cZeqEEeZ7aYuS9y0gOMJVGU+2NeivGdS?=
 =?us-ascii?Q?U97Jm1e/6Wxyb+stplBhE2vWQ/KfBLf/Mtp9QoFV8zeOhuCXF5VQW/voq/bc?=
 =?us-ascii?Q?m52hxppHO9rVNwUYnroVbyuKYoqfs36fq7VdL3IV/8xhWgQ/DLyTk2FhD+BJ?=
 =?us-ascii?Q?xO5OlwLJNu1t8CHXLvexi6mPYW1ltkKWLZbdoVY7uDxlVIm8nbHd95rEObGC?=
 =?us-ascii?Q?qvQ689DmCKpINbC48L1GqrB9V3yKj2FIYz0s0N4a1VBeDuc05V/DipexspTt?=
 =?us-ascii?Q?0xYb1Q+9q7uyEDEhHVahWk0WWxl6wvJqRQ2a7b/UjU0KDJeQxdG10g5Tt5jj?=
 =?us-ascii?Q?O//wc6NBkLKhS35gGifEN9kMYg4sowneCt69vzdq8XbwM9J1qQsq7VwpzXmA?=
 =?us-ascii?Q?eqvLkga1wuWNQ3oQp6H6JMZa3qet0o2iM5yRbEoLlmgnd+2C3rlXyLqA7VbQ?=
 =?us-ascii?Q?v0YyfTgDq55QVPKnAMESaE3jsrbdGxkkzIxLo5zSOi74aqRziowws1rFTYzB?=
 =?us-ascii?Q?iEJ8atCt8zNlquEKLLNaxFnUgRKfyuEMnDjrGJQUkQ1Iem8YPguK8BGjw3Kv?=
 =?us-ascii?Q?zG1mGJidATJIvQPZsw4v12+6Ajyb27bPWJeTtv2cJKA0IW2Sg89CbHUy0d8w?=
 =?us-ascii?Q?BY2Wf+0FXCEUspNTGj1uYxzjJ+KF9rOGA5kpxUiN9/9lZQvH2PXwkzKJmF67?=
 =?us-ascii?Q?UVnf8IeY1jtJVihtb1XTEFukmEYoJeoAAkeG0qz/YygzxTY8Lmk6LIDmTdqp?=
 =?us-ascii?Q?w2WtAZ91Si17xwu7IV/mzOKXPs1I42cCvOcgxNg3k8ssmwWr2sUtX17M1vq/?=
 =?us-ascii?Q?KmfPoTRFAEH5CHQ3srQa89pXjwjb7adIkZDUYe3e2ZCmcFwadhBMTsjKkq/3?=
 =?us-ascii?Q?nrVy3nbBL7mWGccsuv+UihdJTL7pOafDf7q56uqnMNPQpAm+Mz9UoP7m8Wq3?=
 =?us-ascii?Q?uKD3s1AHQHlowgbi2ybIaoCGGXSfoqhEesqRA2pjTGB7ylaQK0Y3pb+crcMY?=
 =?us-ascii?Q?z93zABljrB/HyGLsfalbdHl9JCWISpBI7oX+8jzN?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 917830fc-6473-4eb9-d43e-08db869c7c4d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 08:04:46.4023 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1grhWpf25d0Ef/1IVsL+mP0mSjdy+mi5BJZ1E8iCE1qBLarvnIA8jnp77BAyM7fjaodi5bDv1TBK7bh7tT7Thg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8291
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

