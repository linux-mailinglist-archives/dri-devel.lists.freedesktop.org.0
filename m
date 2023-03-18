Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7346F6C0358
	for <lists+dri-devel@lfdr.de>; Sun, 19 Mar 2023 17:56:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A023810E14E;
	Sun, 19 Mar 2023 16:56:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CAN01-YQB-obe.outbound.protection.outlook.com
 (mail-yqbcan01on2098.outbound.protection.outlook.com [40.107.116.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D64EC10E13F
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Mar 2023 22:36:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GCguS2Sa/y9RuXdj5XkYi5vny8AdILhOe8gzmm1WYqGFZIbnSFG8C5axJYRsWSng7XHd2WZbaLtBL3RkLX26Ovg3NbW8e43SLtNrX6zYe0pF+zdIO8n+8PdP+C1GJMhVIEV80cu/QcdQ/FG6ZfL//2EQJcetlIJs7GJsrZDb69gLWvAcsEawheBEkHxoqzsZ8xLcyIDhF+trOAenXO8kgCVM7x9fPyoWzyI/Mm5mXZ4ze1TlAkT9DIqMLLOFRFn/dZeb+iq8xDtKON82sRE2uTaEJ785dUOyEPXP9DnogmzWR8lsiVmDddywPHqXCfiEWbFCBMx9ZyeiMZHxEwMyPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U4COZDCRhiPzcIOO9Y3sdOy4nbOGwKMuOS3zsFOfv+w=;
 b=MgkBIt7hRA0ULde0sGxvq9m+UHlldNxAG66JPw8oinv1ERFceaU5Sz7gJgjiRYSY038h99wmu5V40zSPRbzXvoidXetMXn/FVMQ9/cy5t5I3Ab/ZDNg3EaZUzOog1t8YXhDHqCOmuwetJQMXPJYDaZPLH9NnXhKZfrlog9UB/Iv/gZ2oOoUE2PD64O3uI22h+/rNah4y64K6nMlP7NTSvx8F/K1A+UHBCYpgmqfjSXebIo3IH6Wnppk2BOemWd07U7HdhjfMaMU+xHGffXS1XP9UfUIIDzYq29PZwN9U1g18B+AmtzWPI/lVzfWvjGHIYI3dTm9fqK56s2TF5XBlCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lenbrook.com; dmarc=pass action=none header.from=lenbrook.com;
 dkim=pass header.d=lenbrook.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenbrook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U4COZDCRhiPzcIOO9Y3sdOy4nbOGwKMuOS3zsFOfv+w=;
 b=RA2AQl3F8IxOOOoq38wUR8fbzfSbd7rrKs/jUlaWjLhXjrlFyhjnxXmz+z6NFhhPXy3S5AqI2vO19grTNsg0zzRW2t22+tX0K/xIxQXn7mukEpvfTUrKtjfxcbbEOaaNWRx6DKjQjNNcyvb78NOs6DsCGndI0AYLK8Iy7rg6pcw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=lenbrook.com;
Received: from YT4PR01MB9670.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:e8::12)
 by YT2PR01MB8856.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:bb::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.36; Sat, 18 Mar
 2023 22:36:36 +0000
Received: from YT4PR01MB9670.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::2a76:b922:37e2:e1d2]) by YT4PR01MB9670.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::2a76:b922:37e2:e1d2%3]) with mapi id 15.20.6178.036; Sat, 18 Mar 2023
 22:36:36 +0000
From: Kevin Groeneveld <kgroeneveld@lenbrook.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/bridge: nwl-dsi: fix packet read ISR handling
Date: Sat, 18 Mar 2023 18:36:21 -0400
Message-Id: <20230318223621.4239-1-kgroeneveld@lenbrook.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YT3PR01CA0050.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:82::24) To YT4PR01MB9670.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:e8::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: YT4PR01MB9670:EE_|YT2PR01MB8856:EE_
X-MS-Office365-Filtering-Correlation-Id: 80534bb4-3cf2-47a0-11ca-08db28013b5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 50Ubm5gUH8ehNNFsCq9DedQ7iX347eGHRqiQhtqTXk9jMGOYuUerx2CEZI4C15D96wjVQa36w/EOTsMI8GEsm1a1n5RN3iNcOAmqLUwYXmxoB3xidAmcCh+5r7pH6+EBnoZXEDKNbjqtL55103BmFrWPU3TGATyI2dE1VFgD1qEidq3E1f6uCym3sj/lqcHvFe2U0t5/QrHKteRioRI/+hIWpv4QNsifAZH8TDp6Om6rCzG5qd8E6eQIIjHmpday+Rh+M/g0kAEpB9qk/ptWbXTddw0iGJNU8MRoLkowaQKr14JYXQv3fDmYf6RGOARN0ftx7u00RPKdZ/cd1wDdy7jtwWZfI6+L8UGIA6EwwueSSmNzdUnbRmlyAqAi7+skPvb1VBwE9kNcC8PX7rDiRnAbLRpi9mRcX8bVB3B/y8v/V7jVgwTRaq8TYpq0jrwAscb+YCQcS53tF25Pl2h4FGyrXKAfnmhm84hKg+QmR0VJignP01vooJJtMLMt+Y36De9w0CHkMu8aNwJrmAb1ov1DkhWWHce/PY3JnoODZ9qKS+sJj17Z8s7YDBEQoza6VAjZyH980Jaw/fablUJyLf68jwuf4esjJZN+nqiOh5o3m0C/S3ufb8GOT2ZrSHwpd6tx7CaxjB9/PCHt26oxmeOj8p/QhBydccUUhZnIoJnEVlLL0E2mK2sIkces/eHY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:YT4PR01MB9670.CANPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(366004)(39840400004)(136003)(396003)(376002)(451199018)(2616005)(1076003)(107886003)(186003)(6512007)(6506007)(26005)(6666004)(6486002)(316002)(110136005)(4326008)(66946007)(66556008)(66476007)(478600001)(83380400001)(41300700001)(8936002)(5660300002)(7416002)(921005)(2906002)(8676002)(38100700002)(86362001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mz1v12e9vSUIAJgRy6AsJD8tuPuzeSpyPVKkR37zWwsj3LqqbNOIp2itauX9?=
 =?us-ascii?Q?IXNyxKoapJkmS80HU6VyGPRfmpF7aVtcOPgu9+lByH2dUUsGrjNs8kynKElL?=
 =?us-ascii?Q?zxywMVpFUtK5Wlz+7H57vhYmN10tOURD+3d7uLriIizSbjdV3NGlAUGo3VVu?=
 =?us-ascii?Q?smkUE0EsBT+1t6r93cFFl6joob+rIBSWCKq5zWQNA4fOih783PPNUJfx0aYI?=
 =?us-ascii?Q?mAwttnY6OC688z+Vzf7AbClCLMBnbFibSDzDu/zrLfSqUa6r6PpDF96gZY5D?=
 =?us-ascii?Q?8emVf0flLB5McrSW8i36QXzW23uySqKDENaXgYUNuDLEBsP1nIF2QLr+gEKV?=
 =?us-ascii?Q?xqfsRiT64sd0lQhzoEe0CGsQM8Z2oCrhNpLhlHzdVb2ft9Y8Ek95QuHC5vEW?=
 =?us-ascii?Q?TZLOh2K5zlR2a+ukVskhVt6NsrKjR9mMjXUAbprGADm3KYZ8+YayxMaMJ6k6?=
 =?us-ascii?Q?aXzmQ9otxF90RyzN07y4SpnpqR9QIG45E3yQr9k5LE535dl3eyDpYwctl1WK?=
 =?us-ascii?Q?uDExUiBwbQ2B28nIfNiwj63ervOCuM+0vAzw1qlykr0IhbQoT+Ehu8tvTkBS?=
 =?us-ascii?Q?Si4ucg8Z+j5N8Y9j524hg3dEMQ/zggSSh8ERK7VILSYgT3Z5SpNXrlEka6aT?=
 =?us-ascii?Q?PW6jUiHrWNJiHPoE6ZBiRPuJO/F9n4bSeUojVafaEGrAMMI80AwxUVKKFZAp?=
 =?us-ascii?Q?4vhYE/Sjwr6BFHEnZTLqM7mI5vf+BT9uw0zmY7im1vg8lXtoUUkewt3dpHlq?=
 =?us-ascii?Q?axeQjnDgELZL54qZ13oqmLHTnJQs0QkOB4ybuJC9A2ZyleAEY12vWVeQizqi?=
 =?us-ascii?Q?/rAXF9KGKWv5SJRQd9n4C7jgNwxE6g0AVz3L5vdhry+9YqpNf63iWaur6HDu?=
 =?us-ascii?Q?2Ccs/qAI73puC7yLarTrXRMaOZx8vGQuYlnjqiSzkgs+5WCR818H7o2demJ8?=
 =?us-ascii?Q?MWbRz5SSzxz08IJl+4rckLokzNAxT8UDDL+0tqoy3KAe9ejO2ywVxTgCXuqb?=
 =?us-ascii?Q?/XMlP8HQ+BKtWnmqeoaT9tgblX8JgJ7k2orGU66pNYgase9xP2hQ1XO5Z1d4?=
 =?us-ascii?Q?Kg+dNPANhdY51gIoo2HnHATzNaTxVOdUpPP0r2bLxDHQ+8k6d9BX8lvKjhT8?=
 =?us-ascii?Q?Q0TwlcejBTkFPoxkFKTGxt0M9jWBNk2kQoWEyygdKqc4IJ2iZfdA3HJykgY+?=
 =?us-ascii?Q?ZDgkjFwQMmNa4RZ5kgwGjLFv5IzuSlgszYaG5qLxNEWGDiKs5vdVfgIp5JBj?=
 =?us-ascii?Q?etg5bDFoViS9FO9UoGKw8hxE58uK3MSjOIP+nezkXuSXIgMcy6ECvP1FaSkT?=
 =?us-ascii?Q?sV4yBOPMawvqy0PdS/EpgC8y4LPUC0787yqcbqiXk46Q4WR+KtQcKQ9h4ERh?=
 =?us-ascii?Q?6her4VQQ/RgrRe3jXhRxIo/KlRlABnpCT/5s4A03WRqx3KAUYm55suXADtky?=
 =?us-ascii?Q?r+ONGqlgn6C1pQmOlA0SeLpuxEaEK2GR+JHSWuAJlS8fnRmoSsG+q7mDoYf+?=
 =?us-ascii?Q?F2CG9hdpbFEVW59sg/YXUmCAjoQ4IElch5mNoieFAzyAFAWQM4Zaewx1J2Ju?=
 =?us-ascii?Q?JrlVlaGZVNWbfNbbC5w/PU5vt6GRqGXycm7UMStbWaw72B4qgcCDZ+ksqfdT?=
 =?us-ascii?Q?yw=3D=3D?=
X-OriginatorOrg: lenbrook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80534bb4-3cf2-47a0-11ca-08db28013b5f
X-MS-Exchange-CrossTenant-AuthSource: YT4PR01MB9670.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2023 22:36:36.0003 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3089fb55-f9f3-4ac8-ba44-52ac0e467cb6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fsxz+LmE8xNuPST2xv0Z7VFXiwsTsRxThvycWrUNK8APMaJmGyTo24Rs0iSvba74b0iurV8/N/zCE5r+DTwa18lCdJ40/w455bikzEyGiEI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT2PR01MB8856
X-Mailman-Approved-At: Sun, 19 Mar 2023 16:55:58 +0000
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
Cc: Kevin Groeneveld <kgroeneveld@lenbrook.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In some cases the NWL_DSI_RX_PKT_PAYLOAD_DATA_RCVD interrupt flag is not
set along with NWL_DSI_RX_PKT_HDR_RCVD when the initial interrupt fires.
Since the NWL_DSI_RX_PKT_PAYLOAD_DATA_RCVD_MASK was not set then the ISR
does not fire again when NWL_DSI_RX_PKT_PAYLOAD_DATA_RCVD is finally set
and the read times out.

Also the read packet handling checks for NWL_DSI_DPHY_DIRECTION which is
not always set when the ISR for reading the payload runs. Instead it seems
better to check xfer->direction is DSI_PACKET_RECEIVE (more similar to the
send packet case).

The above two changes were required to perform a successful DCS read from
a display with a Chipone ICNL9707 driver IC.

Signed-off-by: Kevin Groeneveld <kgroeneveld@lenbrook.com>
---
 drivers/gpu/drm/bridge/nwl-dsi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nwl-dsi.c
index 6dc2a4e191d7..241568a17f60 100644
--- a/drivers/gpu/drm/bridge/nwl-dsi.c
+++ b/drivers/gpu/drm/bridge/nwl-dsi.c
@@ -334,6 +334,7 @@ static int nwl_dsi_init_interrupts(struct nwl_dsi *dsi)
 {
 	u32 irq_enable = ~(u32)(NWL_DSI_TX_PKT_DONE_MASK |
 				NWL_DSI_RX_PKT_HDR_RCVD_MASK |
+				NWL_DSI_RX_PKT_PAYLOAD_DATA_RCVD_MASK |
 				NWL_DSI_TX_FIFO_OVFLW_MASK |
 				NWL_DSI_HS_TX_TIMEOUT_MASK);
 
@@ -489,7 +490,7 @@ static void nwl_dsi_finish_transmission(struct nwl_dsi *dsi, u32 status)
 	    status & NWL_DSI_TX_PKT_DONE) {
 		xfer->status = xfer->tx_len;
 		end_packet = true;
-	} else if (status & NWL_DSI_DPHY_DIRECTION &&
+	} else if (xfer->direction == DSI_PACKET_RECEIVE &&
 		   ((status & (NWL_DSI_RX_PKT_HDR_RCVD |
 			       NWL_DSI_RX_PKT_PAYLOAD_DATA_RCVD)))) {
 		end_packet = nwl_dsi_read_packet(dsi, status);
-- 
2.34.1

