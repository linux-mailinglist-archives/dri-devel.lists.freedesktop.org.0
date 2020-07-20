Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06092225EBD
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jul 2020 14:43:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2066289E8C;
	Mon, 20 Jul 2020 12:43:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70080.outbound.protection.outlook.com [40.107.7.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34DAB89E8C
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 12:43:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GdbO6YcAdMRaWb4oScxXBsT6QiAVS0YwViJRp41aBitwXG9CA3TkX6TCFJt9jiHHKhmC4WLrlUh7AzOBsZ0XBEj5hi3G1Cb/1C0ALokkSmrQ/EJH4ge/XlvoylZGPL+yBlXp0+82DjJEj0zuq9KQiLT3lQhu8BV0eKwnmDXOx04faJq4M+tF1uwHk5OLFX1IjzFfDgnv1oNVUVsWVrtEAxbOMj3QSGXaZcGXDPQJ52S1boWcC0465rG9HuY4qpLwjFyOk1ndz4RkGX2bEhgudvbwII+oArdKJk9hAMZbRiVReAl/GnzHg2sBnIpLm/MpRX+rCF/W1WbHrs83Nziehg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=msLT4GFSEpmrHEHDPqgYfPER+HYoSF01iTFkzVf4q34=;
 b=NSKWRwzF5/Kjr/a44x6kbaLf5olqMlnKbr5YrK9YEygiJH8eQwMjQB1Tg8Uq0IAXKiBRAfH9xPLnQ5w8PpE2nBNohqzYtnJ55ENMLPPoneMYNj3TtUkpX2i5VbXC98v0ygOUs/12m/q3a1XYO7zj+apg3d31lw+GyxTMMADd/Ztc2tMSwqfTm8dAGPGOfkPtklcfoD8Pr0IzMWVSuj8kK1lvhamqKmN4irp6broO4gQ3qqh/cDTPy0T0WplQJrTDNrCoEE/7Sbnvm9rweA7ONQgSYnZ1XwB0D5SHjz8s4GOFlf/BYdA/MUEWro/5T1xhEwMrwhrB0sM8wlvk2UncpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=msLT4GFSEpmrHEHDPqgYfPER+HYoSF01iTFkzVf4q34=;
 b=hxB6dtmLnZBpMExWAR9+BenvGZeT9SFKVABiwAMzii5f9LQluGCRPkbLcWADCJ4UFZAmOhnT+58729HrMjpdtmUVqin0XFTkY2HQgnQ5OHTfvW7jWmcEfm8yddUmL9KT2MnrDdpJGbUSQgdE8zMJFqgy8DOBv5GpIKXDDj1S+Gg=
Authentication-Results: samsung.com; dkim=none (message not signed)
 header.d=none;samsung.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27) by VE1PR04MB6493.eurprd04.prod.outlook.com
 (2603:10a6:803:11f::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.25; Mon, 20 Jul
 2020 12:43:29 +0000
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::4c0:79dd:b734:9ea7]) by VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::4c0:79dd:b734:9ea7%5]) with mapi id 15.20.3195.024; Mon, 20 Jul 2020
 12:43:29 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/bridge/adv7511: set the bridge type properly
Date: Mon, 20 Jul 2020 15:42:27 +0300
Message-Id: <20200720124228.12552-1-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: AM0PR08CA0006.eurprd08.prod.outlook.com
 (2603:10a6:208:d2::19) To VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1864-141.ea.freescale.net (83.217.231.2) by
 AM0PR08CA0006.eurprd08.prod.outlook.com (2603:10a6:208:d2::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3195.17 via Frontend Transport; Mon, 20 Jul 2020 12:43:28 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [83.217.231.2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6720e8b6-0ad5-4ee3-256d-08d82caa8108
X-MS-TrafficTypeDiagnostic: VE1PR04MB6493:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB6493E8136F60249608F7F926BE7B0@VE1PR04MB6493.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PwhHG2I+8X/T7ZexsKSlg0k5q4yEFynmo0xl94cE4fjBjoLqXYRctqPNByerqZT/LTxmjWrjRFskuHitl3KeNqa7J5RRZmgO3FotR9P4CBU0Q6WOLjzIQijcu0oWW73PbBC2FDxR6b6M3dtVihR5ombxvFufGMgQ8whjK1tZKdeJAvF3t8rTKFh3WLOC+M1HZkcS9sSqTxK2Pjxwj0+/6O7EBdPuoguA4A/PJwf+cCldgtMnX/hsEWV+wQS5U5KZoelXKy1BikiNtNbg1lsCElfHuf+LZzsrpT6p5dYkMk4enKrDDQUbiq+zJsiUHF661bskn803LtjqW/eGQHv9yg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3902.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(396003)(39860400002)(376002)(346002)(136003)(110136005)(6512007)(316002)(66476007)(83380400001)(66946007)(66556008)(4326008)(6486002)(186003)(2906002)(52116002)(86362001)(44832011)(8936002)(26005)(1076003)(956004)(5660300002)(478600001)(8676002)(16526019)(6506007)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: nwSZALFzVmUL7rHq2yhNgMx9LQg67Gspm/lOjKXRzSFUb6Yk5pEaCf/D3vIGQ0Y7o3L9TpOrBV4fHnDUN1z+Pc9MtM/hPOEf/ABWOmXHSe+yUBnWF7FUMTNcuNN8pTD2aNng3Epzac7pROI60Z2CfxuGfnwIgU7Y3bdaRHRSfBZkq8ut0+Yo+rVZzRVSQLsqIXwtueamSvwf5LFeFWjLJ3to1kNenqR4GrxIVVw6F+G9wcbInKdaryGVG6riwdWmSHJvqInxlB3GhK6O2kEYkv+lJI55FqCkki//MaSuSJDIi+SjgZDZYLdow1xaJ58GLsBsGpm6EPAcLZ3qhvtLpOV6rAHY5tYskKnhx7NvnS9HWoKkcwPJK6y3pz82yZtSS86GzHvEzf4q4SI1PWcE0jpXEnQ2P7ZC1hfyneV/PTZilUvzPcpM6r1cp2bhu5Ctby+38DHoYyW/AjVkz8cc1RUi7GTagS7U9HDVcvdkfzs=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6720e8b6-0ad5-4ee3-256d-08d82caa8108
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3902.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2020 12:43:29.7920 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZA6w9gIvjEh252iuFMVVPjAn7rt6BC6mduprI0djzjQg7acphV+CMAylSDwhXasQPIbv9X92D+yAdbu6eWKc7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6493
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
Cc: linux-kernel@vger.kernel.org, linux-imx@nxp.com,
 dri-devel@lists.freedesktop.org, laurentiu.palcu@oss.nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Laurentiu Palcu <laurentiu.palcu@nxp.com>

After the drm_bridge_connector_init() helper function has been added, the ADV
driver has been changed accordingly. However, the 'type' field of the bridge
structure was left unset, which makes the helper function always return -EINVAL.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@nxp.com>
---
Hi,

I've hit this while trying to use this helper in the new i.MX8MQ DCSS
driver, as suggested by Sam, and I wanted to test it with NWL MIPI_DSI and
ADV since support is already in mainline.

Thanks,
laurentiu


 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index f45cdca9cce5..a0d392c338da 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -1283,6 +1283,7 @@ static int adv7511_probe(struct i2c_client *i2c, const struct i2c_device_id *id)
 	adv7511->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID
 			    | DRM_BRIDGE_OP_HPD;
 	adv7511->bridge.of_node = dev->of_node;
+	adv7511->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 
 	drm_bridge_add(&adv7511->bridge);
 
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
