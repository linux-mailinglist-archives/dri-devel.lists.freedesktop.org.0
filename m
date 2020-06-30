Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 111FF20EF77
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 09:35:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1D2989CF2;
	Tue, 30 Jun 2020 07:34:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2044.outbound.protection.outlook.com [40.107.20.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A495189BAF
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 02:45:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EGCcu3fkemF3WR3+lZgB11A48CSE6IjDZ+RnsxTGthMvPyqwBlHLALtRNTXTFFlH1fWvM6h2xryLCdxBw44ETv9osM4pZa7FmpHXcbgVNlmNghDjRhSkgjZ+R/KZkVUeaywNozT0OW3Zu5tH1t4k2tkC+VLq4k3Z0P3c+Nx+nxZy+3YCFHbLYohf0KonpPjlVjrfhRBiAzgmRa7AXl+tDuN8Ql1J7IBUcZgF7OAX7dq+p3JKj2N2tm0SkeikayuZ26+l1FC3d/WS3szZJ2ais6ETUVuB+TxVrTGlNiiIaPo0Z2i3fzPRwNie3CJYJ5W87AGiWX4begqQPyi5K4BjaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u9c2RJmBl8LhkaJfo8whmOflg5VIA7MdftzLYg97IU8=;
 b=byI5y8TyYxbqvnYvUbWig5CjER54zNkMf8/PmR3POcYKhGrGa89RxccYN7vn35KbV/PhSZ00NSUp49b7iQXNR8XJRJG+j6PgScMjDy/z1v0L9pg1/Llii9H/Jn89COZYW7xYwWlhQiloEW5qVggwFDw9Qfaeo3Fv7s55UqABk7r9lID7726+HMLkpT5/3FdvAlmFutXw8paeZ+odCDrr9OmvW+h7UqTptdksDwpXKBg6B/swNhGkJ/AbVqG2+5BxnZOACcU3Zx18p8WxBn2dZ6WAhgqL0atcbvjx50Oq+DfDzDodSa5j4KJrffEhEYjxqoldTC0noUJpdszjfHS0gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u9c2RJmBl8LhkaJfo8whmOflg5VIA7MdftzLYg97IU8=;
 b=B384Gb8bhxf286aGKAPBwOFd8NhPZOqRl2z0Ypb2nmTlH5HG9/+3uSa0gQ/7+YIhJYoBUXbYJF03pkcC8akzEcPR8GSpOKL6C3CIec5HevSYUQAvL4gZGTJ/GN6tOpOLj5/xufwSN7j/s2uGHq3LYj7YByJ9ODZIcnmEpZeFEQ8=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR0402MB3949.eurprd04.prod.outlook.com (2603:10a6:803:23::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.26; Tue, 30 Jun
 2020 02:45:51 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::250a:ccb1:b015:3b38]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::250a:ccb1:b015:3b38%5]) with mapi id 15.20.3131.028; Tue, 30 Jun 2020
 02:45:51 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/2] drm/bridge: dw-hdmi: Don't cleanup i2c adapter and ddc
 ptr in __dw_hdmi_probe() bailout path
Date: Tue, 30 Jun 2020 10:33:39 +0800
Message-Id: <1593484420-28309-1-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
X-ClientProxiedBy: SG2PR04CA0158.apcprd04.prod.outlook.com (2603:1096:4::20)
 To VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.67) by
 SG2PR04CA0158.apcprd04.prod.outlook.com (2603:1096:4::20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3131.21 via Frontend Transport; Tue, 30 Jun 2020 02:45:47 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 024ce1ef-c012-415a-9b2c-08d81c9fb3a0
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3949:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB3949FCE9187F81A8EEAAF4D8986F0@VI1PR0402MB3949.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-Forefront-PRVS: 0450A714CB
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g9shW9Zxq+qsR7F73YyR0oAN/JlAaIuEwadZkpMNjL4q3bVC7e9JLTei4O/TogFIy0Pbmz89fiwHJvF+rQm7nQFhWAc57fHQqqRHu6ZpRzV3YfKhmX8sDADanxIdHanHbH+ulTBwaPnPTzs4VQdcCBjRX9IenE5rzuFMdOk/BskSAZ9cSsxDbjwLHCIMZN/WvYkJcGT78TVTLCTJ9RfiZs8DN2P5QajdZA+9+5WD9RwEAkLm1LuGeDXedPsMAW91nkqaSMFgPaVq3UrVUyPFHG+RhBzs48kHT29AZ4nukcYvOUeGTmSwinoBcnvNjxf2AJNHgNncdCeBF3aeipn5tD6EkIbLHnarRjVrPONSbpIzenlxF0me2OGwPjoB/vlj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(39860400002)(136003)(376002)(366004)(396003)(316002)(83380400001)(6506007)(26005)(2616005)(16526019)(6486002)(54906003)(6512007)(186003)(86362001)(36756003)(956004)(6916009)(6666004)(8936002)(4326008)(69590400007)(66476007)(5660300002)(8676002)(66946007)(478600001)(66556008)(2906002)(52116002)(7416002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: j6lMwTHvWTHHqPSHOsQUjCgPHLlUqwGiNhdyNZUfJ07+MtcV21XkI099xxkLVUDlehu/yd2x4IRW8JbgYt3dmsiqIetGJzBSPiyq44GBzaZwtvTFciU/1L7E1moRgp+BZ/P0QfTOnHSZfjvQL+2ncZJWONu+25yYfn73qIWXjCQp+uxE+CjuXp1O2iwR8OsF3Vsz57yYs3shkogjiqTfR4uDJNuVw38VQmFcYNO3j3fLaMuMAgccyUGsf2kPp8MZBEtkVYt9LE97KGZclGLzvXrZj5tugl2KAa7uF5TshbVGxTG85EJv0I5DNyiEdBEUC8Ve+8YwM8//6iuKzajWUZnDSZBu7vsUWWJL/jYkZFcLf7rd5krHFPbtRxR8icIJ61FovyqLsanagOK80S6qGorOZqjDib+YRVOlVYoKCl8PKuB19YkTmqUuymWER0i8MlLEnr8N0ENMHYOu+VRzUjk579jHBAKemT+xirHByKY=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 024ce1ef-c012-415a-9b2c-08d81c9fb3a0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2020 02:45:51.4338 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BrPQwAXv1RHxKF3qEG/DLdDVr8iB8BlMqEfKUU3BQQageYvv1kqLqtWj3XXOzuM5Qtc88berQMV04i0nQ90UCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3949
X-Mailman-Approved-At: Tue, 30 Jun 2020 07:34:54 +0000
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
