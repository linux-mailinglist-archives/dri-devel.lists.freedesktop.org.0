Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD23A91D623
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2024 04:32:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BE6C10E2D2;
	Mon,  1 Jul 2024 02:32:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="htcsHxVW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2078.outbound.protection.outlook.com [40.107.114.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA39610E2D2
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2024 02:32:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cwmOQso3Mkccxy6/X7ycww7qir6d4yS/KFhtinnimbiyoUCYV/wwfmlhWMO9vx4xR3tADg5ba+6SJNWnjCqM4stie6zycifTC+p+LERxVxnJoYmBS7/sYv9Tc6yMWVjVF2xeEGcYRZEQmuPUXAuMVSjZM7K84t6OSP8AL0d4d0J8y+13sslkvcUhGkS2lnKCbO/r9p2A8YCYfN671Nv+YIfd0gPYoUPS1VOEU4BjWxDg1ZiDC3tEzjH5EdGHy/Jiirgj+1wFMEm68u1byF5d49IptvHI+mMLYGP+ELy4OxbTVUkQMy4Md1EXtOemg4x5NF0f/6ZFg7+NifEKEBNaNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9j3NpXbcZa2ngsRcLst0L0Ff9XISFwF0hb2TrGyyJro=;
 b=apPl4xpJsJntNvC/O5yLr4HEoFMbJ/XV9dkMUZzx8HpZZjYtQmF6JDPE4+RD8ClWHwuF7++Wf36ExYM8BkmeIe33utqdGAJUCBfGaCX2vfc9bLRNetNEHmclHTwf2/fBVVftV4ZuwvQUr65aUHcTaZeXapjSh6LNWpEuFd5dFVbUidXqAiR/1gBLJiG8k4vhn+IYVQVAb/Ivkc/y0i4vN3mTEsDaMcSCDamIhwx3H33FFjK3NqRflrRnk47LMBqPhUeOm1QsCF8UAWZuaHkdqaWD1oBh8fB85H0iA7bhNsjwoBCMXNlkePXh0DsyPSFuLU2moD48uBgJSRoTcavHXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9j3NpXbcZa2ngsRcLst0L0Ff9XISFwF0hb2TrGyyJro=;
 b=htcsHxVWO/fIFaMjaDP01H6NE2zZUlg3AzDsK5PrI6zQIyKL28SfJrBW1BPlCf2eKOZMiAJMqK28iH42veJvkraBTCpzRVkH9mQ/0/DfI5in2gqzvhdZLQlT/+uNjA+X8nvJgXGHFPCQ+P0Wvrfz6Ys71oiW0x/VEseW0Ck/nZc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB9730.jpnprd01.prod.outlook.com
 (2603:1096:400:22e::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.29; Mon, 1 Jul
 2024 02:32:50 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7719.029; Mon, 1 Jul 2024
 02:32:50 +0000
Message-ID: <875xtp96zy.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v5 5/7] media: platform: ti: use for_each_endpoint_of_node()
To: "Lad,  Prabhakar" <prabhakar.csengg@gmail.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alexey Brodkin <abrodkin@synopsys.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Eugen Hristev <eugen.hristev@collabora.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 coresight@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-staging@lists.linux.dev
In-Reply-To: <87cynx971l.wl-kuninori.morimoto.gx@renesas.com>
References: <87cynx971l.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 1 Jul 2024 02:32:49 +0000
X-ClientProxiedBy: TYCPR01CA0024.jpnprd01.prod.outlook.com (2603:1096:405::36)
 To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB9730:EE_
X-MS-Office365-Filtering-Correlation-Id: e2188268-3bbd-4408-40fa-08dc997619c4
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|7416014|1800799024|366016|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?givcfFCSGzYzKg0MW8BRR1EdxCLoNLMW9MiDkkrz7FZILZi4X7aOfN9fjZ09?=
 =?us-ascii?Q?StrXSXuujS8clX635MiBUoOjJ03uL3hVUZi5tWs69OtEA5QRcf+LsNhIbYD6?=
 =?us-ascii?Q?fjIHmwTVFXgiO87SLyihTcHobgdsULY1FVfLrqZ8xxvXeEH+p3aBqtwzGgrA?=
 =?us-ascii?Q?9mxHhXaH+lOGOfcwFmNemKaCXhVa3E8iP4tSzBykIJCXf/44TekUj54D2c5h?=
 =?us-ascii?Q?sfZFMVNZYJq7LczmtL7HFJelXAuHV9EBZyU1Cxa2x25Yen58aPnZ3R6G132t?=
 =?us-ascii?Q?NyAo/a3QP4IMKle5WoEoF2txSfEuca5MREYGQ8kacaTxqGs/BzrGPVVz54WO?=
 =?us-ascii?Q?dCxKTy1RKtkqZjUvrzLUKHR5peProb+8MLKWbFgMmXIOwJyJBtnCAOeG7rMf?=
 =?us-ascii?Q?zcbLMArqpZfXw00K1Jh4YqdEFAE5kKwDRTjVQmn4jga6e3lEKUWPe68WdwKO?=
 =?us-ascii?Q?sv+InhQzuOIv7UacX6nC+loYZxl7AxLGUY0FwJlUaNzBadXg2oV+QOnJDUxW?=
 =?us-ascii?Q?RebEe1mQUeRCHy5jTe6HYKzcDPPzlzvYymn8FCJfXaq34P0tOSCm7SeOvMgl?=
 =?us-ascii?Q?rwbISPIqsaC09y62yQ99eIgIZbkso7Q9N6I7xm4wi2iayheAoxtxgaoI/Jia?=
 =?us-ascii?Q?XCdpjOb/pokKFbkIA6F/PM9kw5/+sQdu4V8/MTx0GtMNvbUoWm67m5ENDkCm?=
 =?us-ascii?Q?cD7gUvOrRdY4UBd+VpL3FYnmwFnyJKcSsc3+gb97G+iLlnSFqasmNPbi/NaA?=
 =?us-ascii?Q?XMMx/WekIpG+7n17W+7viJTX5bhNMK0crR2lgG8ITKyTuOIY/cn+B6M6/IP2?=
 =?us-ascii?Q?41yXcYF4r1AE/EVOj3+F4lTSY17+uiyMQ6jtPIvoOa4HGxc+XAS7LE7ILjVB?=
 =?us-ascii?Q?eSkpkY/EIyc70gue0NTKvz1CLMIlhIo6+QKpOzxKynSzyvfOPDmehUrPFgaI?=
 =?us-ascii?Q?DIpFvf5nI4pDCqbuMvy5+c1FcRKM7siYSiSPYovQ/SBBGyPiF/h+Q7V8OEWa?=
 =?us-ascii?Q?P/FAPWfMisSTRNTGo9qTK7jHocfSwaGahgbyArzy6UFDF9OLJYTss/v7YZXz?=
 =?us-ascii?Q?4IjnjwFNN0990FyGe3wMv2XZrW02Spi9CqjMSmUMrThqZxJiWXbr958pq10f?=
 =?us-ascii?Q?RJwkT+RppreoiOFJ5sr2qvPb+jc9rXGHZEwuPrtyOhGG18eh8ig3lqHq5Cvh?=
 =?us-ascii?Q?Uo2ErOIeQ0Yzf2wibX9RetGlgeKXCzsleLEq8bie6pSlS0xd/S/nEnjHFOnx?=
 =?us-ascii?Q?RJ0RAzh10ah0CYwYhlDiuSOmrASPcOPAIR/RDDb3qNbv8P/EfoSVJ+Q1tMrj?=
 =?us-ascii?Q?FLVc7cFfBYAn3Tc5EOuYk4zKBxqj84zCMY4arNykZNWv3qZANBIB/8KZ9T0f?=
 =?us-ascii?Q?tdynYicaLJiwnWGeL0Cp//uqDRSBPRSJxh69h0sOiuZ5nuXnlbrWSf/ZZT9w?=
 =?us-ascii?Q?TmpsX05wjy8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(366016)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XB7wU6OmI84dZANLDy/vNgPRdsXm6KMR03zOOEUUUN1T8fCZjnjm+L2MjV+C?=
 =?us-ascii?Q?4twNLRTEggGZpO7dR3jHgrvmny8QkchvNv6W6892uqsWdkW+hzzAz/gq1enJ?=
 =?us-ascii?Q?OVBEy5j0CeRekCvqlBUOmygTky/1PUbB0SCV5oWmXGPOsrjCwGgVK2/xOJIf?=
 =?us-ascii?Q?t30REDnoIBfZi0XKFMWRAYSXfrgWz0Cs/Oqt57SwXpMzj5Un46EfhIG92l2r?=
 =?us-ascii?Q?s69yC7huR1Z+HjCjq+4xccglNleW/gFO3DPcNlgS/w302NI5wAZS3xxp1Amm?=
 =?us-ascii?Q?DBB6//aOjTBl8JD8gN8DC7hvJBfMZqYm6tHpwvY4b/b4TjSjX4QsMdFTPlcg?=
 =?us-ascii?Q?4BWcdDXwjUUpuvvVX/Hx3aHdxexWpW5qauriV+fNapLY+llGHMpNWRvJ0ZLi?=
 =?us-ascii?Q?a1L/qRn1/9W/Euf+UVU8SUpA4eg7loUIGcwJD2Dvj8QxmOcoKqRB0E8oQlGZ?=
 =?us-ascii?Q?Y+Yjaoj/bQN2+zefkE1Zjoa0sO5DGrgvyFfOTWyyapXbQCJCAkKPl/DVnoV0?=
 =?us-ascii?Q?NMlvpZp8FgHNi7Z1GUp3UGaqUZ2hcg558UJKkOkd+MiqQbVKZPqnr8P6cnTB?=
 =?us-ascii?Q?0tlAES03wQmi9FUMKJlzJTWrN4Mhx2XUZ1VNkOVWXcG1pUDFo3HTHq4U9hcA?=
 =?us-ascii?Q?lIEoavx9blY6tOANTp5ZB2a1iWubBPmY/RUYaSdJ6TSLbUCHbjWzEVEjLkHS?=
 =?us-ascii?Q?uQBVzXB2AbcgCA83vglkatTdyFBGlU101jlo9Bqc9E3IF3Qae2jlLQA2YIKl?=
 =?us-ascii?Q?v/0y6EH965j78M6G8YkWZn2d/hezwf1Nwm5YXv1F+1Pmk6ra4sqoMth3b7TT?=
 =?us-ascii?Q?nFlSCEPb9EPim6dkmUuOX1qCQqXxhmpOz+v1qqjyeeIe1kNkbDyZrRGtMlf4?=
 =?us-ascii?Q?f0ty7vD9aLeuuQXHa7+a/sW5/quo337c9SB2por/LaJo+5yaI9xzSIapyMqK?=
 =?us-ascii?Q?LEhqHKZGJbtWH2Spj6grT67tzIcW71tD6CidfM0QFIYV0O0QRksltNCuhmXi?=
 =?us-ascii?Q?swuZpXR8/h82cgXPZKc6OwqHZfIQbau8Z/JTVffeno6qFQMXvtO9PMEExFSo?=
 =?us-ascii?Q?2G3q8VOOwOWYJFfoJokX76UhLi8ABB5wtQ2YniweEY/LQ2c7GHF35MMiP9oX?=
 =?us-ascii?Q?TWmbMOmYOqY5pQ/MloJUGoy0/wcJHvNDHrU89OtAli1B9wOycW+r3geK9a4b?=
 =?us-ascii?Q?L+NvkzNKSaxIO6PWARB20tgVQFS6L9r5ydr1Smc4tWKB1Jr9ePtG7WDhrzhw?=
 =?us-ascii?Q?IaSjBVutSmZJ/OONOgVJfnH8W+JMsYbDl+VUcgpmVoScRgW5Gyvn4oGDi1vd?=
 =?us-ascii?Q?z08B+OUh3uD1893jYpVXc+8Pbn1HjSZiiamZhZ38sy4aU+anH9aqurvDzX5h?=
 =?us-ascii?Q?6Xy+mTu6HQVmAIwn+biw+x8/ZImqv3g+ncZuvPF6rY0fRiz7DdasZBvjEFrd?=
 =?us-ascii?Q?Tri4JIRPzyGjY5i0H1Xn6ETQbLO1aabYcf/FtUCn8VCZiyQWRn3gmRuVCDF0?=
 =?us-ascii?Q?qqm5iJuyj4i5PgOxg//Lrs3n5SgwGp4gXj+qOzd2oNdGEbhYaO5QC8W6ZErw?=
 =?us-ascii?Q?pTUmOUNR1ClSaChRsYPYWIQ4FnFuuweOfTzntIoSXwhTg59ka5TBhdaSsWa1?=
 =?us-ascii?Q?jlsSFHj6Injj04BdG+OPQdg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2188268-3bbd-4408-40fa-08dc997619c4
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2024 02:32:49.8572 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BnZDQ2/0DTfhbHYJWWVvtVQY7dAM+uEzgX+CGeDFUyjVD5a0YarB+0/PnF7Fv+ukge9gb0Bd9syrBUVzUHqnHGjFqap4GhV1pDcMEDT80hqwshh5SiqDXI22dWMv9Jcv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9730
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We already have for_each_endpoint_of_node(), don't use
of_graph_get_next_endpoint() directly. Replace it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/platform/ti/am437x/am437x-vpfe.c   | 12 +++++-------
 drivers/media/platform/ti/davinci/vpif_capture.c | 14 +++++++-------
 2 files changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/ti/am437x/am437x-vpfe.c b/drivers/media/platform/ti/am437x/am437x-vpfe.c
index 77e12457d149..009ff68a2b43 100644
--- a/drivers/media/platform/ti/am437x/am437x-vpfe.c
+++ b/drivers/media/platform/ti/am437x/am437x-vpfe.c
@@ -2287,7 +2287,7 @@ static const struct v4l2_async_notifier_operations vpfe_async_ops = {
 static struct vpfe_config *
 vpfe_get_pdata(struct vpfe_device *vpfe)
 {
-	struct device_node *endpoint = NULL;
+	struct device_node *endpoint;
 	struct device *dev = vpfe->pdev;
 	struct vpfe_subdev_info *sdinfo;
 	struct vpfe_config *pdata;
@@ -2306,14 +2306,11 @@ vpfe_get_pdata(struct vpfe_device *vpfe)
 	if (!pdata)
 		return NULL;
 
-	for (i = 0; ; i++) {
+	i = 0;
+	for_each_endpoint_of_node(dev->of_node, endpoint) {
 		struct v4l2_fwnode_endpoint bus_cfg = { .bus_type = 0 };
 		struct device_node *rem;
 
-		endpoint = of_graph_get_next_endpoint(dev->of_node, endpoint);
-		if (!endpoint)
-			break;
-
 		sdinfo = &pdata->sub_devs[i];
 		sdinfo->grp_id = 0;
 
@@ -2371,9 +2368,10 @@ vpfe_get_pdata(struct vpfe_device *vpfe)
 		of_node_put(rem);
 		if (IS_ERR(pdata->asd[i]))
 			goto cleanup;
+
+		i++;
 	}
 
-	of_node_put(endpoint);
 	return pdata;
 
 cleanup:
diff --git a/drivers/media/platform/ti/davinci/vpif_capture.c b/drivers/media/platform/ti/davinci/vpif_capture.c
index c28794b6677b..16326437767f 100644
--- a/drivers/media/platform/ti/davinci/vpif_capture.c
+++ b/drivers/media/platform/ti/davinci/vpif_capture.c
@@ -1487,7 +1487,7 @@ static struct vpif_capture_config *
 vpif_capture_get_pdata(struct platform_device *pdev,
 		       struct v4l2_device *v4l2_dev)
 {
-	struct device_node *endpoint = NULL;
+	struct device_node *endpoint;
 	struct device_node *rem = NULL;
 	struct vpif_capture_config *pdata;
 	struct vpif_subdev_info *sdinfo;
@@ -1517,16 +1517,12 @@ vpif_capture_get_pdata(struct platform_device *pdev,
 	if (!pdata->subdev_info)
 		return NULL;
 
-	for (i = 0; i < VPIF_CAPTURE_NUM_CHANNELS; i++) {
+	i = 0;
+	for_each_endpoint_of_node(pdev->dev.of_node, endpoint) {
 		struct v4l2_fwnode_endpoint bus_cfg = { .bus_type = 0 };
 		unsigned int flags;
 		int err;
 
-		endpoint = of_graph_get_next_endpoint(pdev->dev.of_node,
-						      endpoint);
-		if (!endpoint)
-			break;
-
 		rem = of_graph_get_remote_port_parent(endpoint);
 		if (!rem) {
 			dev_dbg(&pdev->dev, "Remote device at %pOF not found\n",
@@ -1577,6 +1573,10 @@ vpif_capture_get_pdata(struct platform_device *pdev,
 			goto err_cleanup;
 
 		of_node_put(rem);
+
+		i++;
+		if (i >= VPIF_CAPTURE_NUM_CHANNELS)
+			break;
 	}
 
 done:
-- 
2.43.0

