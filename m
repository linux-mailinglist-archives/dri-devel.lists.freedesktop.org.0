Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B02F21995B
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 09:07:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A4286EA24;
	Thu,  9 Jul 2020 07:05:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140047.outbound.protection.outlook.com [40.107.14.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D61C6E3D3
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jul 2020 02:06:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hfHeG6QftJAg+L3v23orvKz6wZfZtON7/OOS0TIZJnyPSmds0XQpboxUILhjxzUwnpGUKMfeCJuLnSns2TBwdL/loN240lg1G8KaUbrtoJHk5etkR3QJnw6v/eWZ1ZMaorFDUtLm3PTY0U8Fn1Zmsrjr5zu+EXtIlacb7XH+F23LLpr9Qyy8hS2xapbV7ywG7CVNOm3vlx9WDt8bNop5NHrP0JfsLTdoG3NO+j0auVF95Reu2T2/FkUdc03TRuqN+iGM9XEIIhEDBVthC+sYG0njei9wbPyHcFgpniTWblpg4xjPWPWXYrZMKM7QMJ0gUNFDmwbmYHwDiRlWSceJrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u9c2RJmBl8LhkaJfo8whmOflg5VIA7MdftzLYg97IU8=;
 b=Af0OdP3rz6XGnfQ7a2AG5KvwyK2p8cMTDGmD0pLq8HV7sHms2p4Dz14uI2n5VjjBex8vJkal3xgWMIn4t7H1WrhVAYv60sarm0pXcQ2661stMxcqycTND3IGVJg6GsKCKcBuA3K+/OEML4PQwiIGtkwsTk2Q0HP89oRoMdRe4bv5UO2cFjQgQ5dcE/wud/qEOa0IVxG2eLTkE79QCavFkKPkU0X7MY237Tl8PDg7x+iNc5m0dZN3yARz33Lby8gTeo+oURmTlEP7qBgAn8XsluN3S+UDEImoSFZXHo3MVzYM8JVbhJAz5e+u0XvyAStNH6Ls+W20VV0aL7suqED5wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u9c2RJmBl8LhkaJfo8whmOflg5VIA7MdftzLYg97IU8=;
 b=RzdrY6XJYWUovILL9TFGZUUALzfiSj3x3lPgO9Uq+tK2aAV8l8nYU+7ClEbyKXJblNiNcNMLwt/cRyzFZGHkSQbQlFJB6eTx8kq8VYpfUByH4LcJgUg3leqt1DTQCQxd6Tsmd7XfiKkvHs5jz1jgPfTkrjBzimfJYl6OcIwJRQE=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB7183.eurprd04.prod.outlook.com (2603:10a6:800:128::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.20; Thu, 9 Jul
 2020 02:06:25 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::250a:ccb1:b015:3b38]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::250a:ccb1:b015:3b38%5]) with mapi id 15.20.3153.031; Thu, 9 Jul 2020
 02:06:25 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH RESEND v2 1/2] drm/bridge: dw-hdmi: Don't cleanup i2c adapter
 and ddc ptr in __dw_hdmi_probe() bailout path
Date: Thu,  9 Jul 2020 10:02:35 +0800
Message-Id: <1594260156-8316-1-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
X-ClientProxiedBy: SG2PR01CA0110.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::14) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.67) by
 SG2PR01CA0110.apcprd01.prod.exchangelabs.com (2603:1096:4:40::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3174.20 via Frontend
 Transport; Thu, 9 Jul 2020 02:06:20 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 24b5af1d-a92f-40ef-f1bb-08d823acaf04
X-MS-TrafficTypeDiagnostic: VI1PR04MB7183:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB71834F52977FF37CF45C7AF498640@VI1PR04MB7183.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7+vbMnJAzSUE+l4RXXjmVk0VKYBIKTam0YN+99094aybdPlLZJAcAjnetsarPQ/mh/QUIRtFjfT60PCtvYqRYuzIgWmSC5YCN+OKyyccjPCnxmFKIlde6dV9+UBnItl2qc9dlFoOjWdyfRHKaU9KuRfM33keUGkvtNqUN6BbWkdX1b6GITG0edEeilfiRs0TanNEwpRlOfAXmD2xU6VQ9yVsAtyeCe3T3sWMbkJ4J86UZaOR5J1ZMWEX5K5Hp2F7kZr8gF3mYgM+qASo2xlgHdOH/wLTffbH0g/89yZ+iQ3bG0JZOvRsqsNJCIXi7SbVTtj+FTRHqdx0u8gIygA2LCCkT7ngfkj3u/+tjSJosgjm3XKsiOJ81tYDq39+o4ru
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(346002)(376002)(366004)(396003)(136003)(6916009)(66556008)(69590400007)(66946007)(66476007)(478600001)(54906003)(5660300002)(316002)(2906002)(52116002)(6666004)(8676002)(6506007)(86362001)(7416002)(8936002)(6512007)(6486002)(4326008)(956004)(2616005)(186003)(16526019)(83380400001)(26005)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: jL8eAvxpj2mHd/wzKheVvzipk2mWd88KY5dUoKfbfdOiDtdVzOPzJgJQqoifUyZbpifwUpg2aXJuV9DcX/NW0GW8yOoPmIGWfUOTy2hV5wCa3rJ2hmfPzM4S30NbYFZVUGkuTw0GkNLMbrfGKPxv80VYu+Sr7aCdmAnmofYMlhB0vPLoL3HJK+whU1euLBzuenEglGem67A1heBRSyEVrmN3eFMlPFNpRdGt6EfH/oQsS2FIj4LuDpVBLSs8/g5IeyyqOkX4fToKbiL64M46rIpGMJhB8AD0YhVwJ4j6eE2aT9EncDbkCfVVUgzRGQbYcd1y9/dXStfH6nXzvW7ALPWaf1p//hfCmiiznfYBcbUuGbj5H0GcwpsJhk7wckYCVD+QXR1fYBNI/Ca6Kff/0R47AAHvV8ewfXSgvA3fOXSBMpFEZvDSwezSsfD83aeT3JH3QubZHDZGxkIszYqrBL+u2L37ib+WVAVKzi//hSA=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24b5af1d-a92f-40ef-f1bb-08d823acaf04
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2020 02:06:25.3137 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3lNH3lrpxxdCVLsbHm/9GEVP4f9kuutiKGGQ7woT8+94MhPFcAmVqXCxaICt5vuc4G4h6nge/4i1XpUTjkqTTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7183
X-Mailman-Approved-At: Thu, 09 Jul 2020 07:05:06 +0000
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
Cc: Jose Abreu <joabreu@synopsys.com>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Dariusz Marcinkiewicz <darekm@google.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 Archit Taneja <architt@codeaurora.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 NXP Linux Team <linux-imx@nxp.com>, Cheng-Yi Chiang <cychiang@chromium.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's unnecessary to cleanup the i2c adapter and the ddc pointer in
the bailout path of  __dw_hdmi_probe(), since the adapter is not
added and the ddc pointer is not set.

Fixes: a23d6265f033 (drm: bridge: dw-hdmi: Extract PHY interrupt setup to a function)
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Cheng-Yi Chiang <cychiang@chromium.org>
Cc: Dariusz Marcinkiewicz <darekm@google.com>
Cc: Archit Taneja <architt@codeaurora.org>
Cc: Jose Abreu <joabreu@synopsys.com>
Cc: dri-devel@lists.freedesktop.org
Cc: NXP Linux Team <linux-imx@nxp.com>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
v1->v2:
* Add Laurent's R-b tag.

 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 6148a02..137b6eb 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -3441,11 +3441,6 @@ __dw_hdmi_probe(struct platform_device *pdev,
 	return hdmi;
 
 err_iahb:
-	if (hdmi->i2c) {
-		i2c_del_adapter(&hdmi->i2c->adap);
-		hdmi->ddc = NULL;
-	}
-
 	clk_disable_unprepare(hdmi->iahb_clk);
 	if (hdmi->cec_clk)
 		clk_disable_unprepare(hdmi->cec_clk);
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
