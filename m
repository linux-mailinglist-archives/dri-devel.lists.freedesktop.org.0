Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FF594026A
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 02:34:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B61BB10E116;
	Tue, 30 Jul 2024 00:34:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="ldmLHM7a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011021.outbound.protection.outlook.com [52.101.125.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5B5A10E116
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 00:34:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xL3TzyCOcOs3A6vBWx/Dk+2tLynSJ6PFD3GGf80dB9lcwmz7e95pEGGCXQqmZRNntQFV2OnCxbzvQH9ttU+ZuKGv42Aq1GonWu68fBhdp8d/q72OWeSmx8tD3k/zdvCD3UoKERRaOj1PHkfWuPeXKYK1RudPtKrmJJ5/9U2JaZpWowN2dtUzJYwSdpFu2zdX/S45uDXDqUnVQjkXga0zD+35VTLYjNWKV/DIdlsjFeLRIojNwtQxK25D3f2+XGPIzlEZc3tXsfLHEa6wAKmrASbsVRAgqaN3BXwduZM4K3XZ/A8tRiACW6T3vv1DZ9NBDo56gQSgRr0zrkbCkTNj+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cbb0dRK+5iDbyv2Y/MVH4j/HgoQMnUdnZRnxe2rrKFw=;
 b=KO9xkd98JOGxXKVPxpwJjeV6VnuDjIw7bdYNDQqvL+mK7DM43UO0PDoX7JfsrrbFRvZ2kRWdCdt92Z6jWugf+iutYrWH2DigElJfR3Pxr9ccYU5J6MiXpbjZVD9ircw8qRgThCXES8HFRERgDeGGaMZiPGUsTiMAjB9unIxrQuQwrwaIHUOx+XmVJcV4dF7c9dgxn8XcLkQ5uw6XXUroVwN5XoRRfbziL8ZVxxFMyuJg3yYdPtGe7laPlnv7wf8paNn38G7tWFuSKGzKqz/FtsSwXZLhk5JFuuTRWX78ih4W2xIb/kQPHd1bb/ApQ6kjeYBAlSUeb+gY0ck5jmeujw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cbb0dRK+5iDbyv2Y/MVH4j/HgoQMnUdnZRnxe2rrKFw=;
 b=ldmLHM7aV3Kqt+CMe2Vp3H/xTEEJbj6HZm8lgZp/babblfxbpkq+dAbdLrxrCgkXwaElqdvnDSfolVEnUr9GKG7AGKVwNKXS+98W04bKfdMwKQcuRY7b2ex9RDn313erH8fBBLnfYsoRcrGvHqWh7K13NQBPCG06rP9MhYK5wVk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB12227.jpnprd01.prod.outlook.com
 (2603:1096:405:f5::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Tue, 30 Jul
 2024 00:34:20 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7807.026; Tue, 30 Jul 2024
 00:34:19 +0000
Message-ID: <87le1jlnui.wl-kuninori.morimoto.gx@renesas.com>
To: Alexey Brodkin <abrodkin@synopsys.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] gpu: drm: replace of_graph_get_next_endpoint()
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 Jul 2024 00:34:19 +0000
X-ClientProxiedBy: TYAPR01CA0027.jpnprd01.prod.outlook.com
 (2603:1096:404:28::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB12227:EE_
X-MS-Office365-Filtering-Correlation-Id: 00a33425-413f-41dc-bd88-08dcb02f59d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|52116014|7416014|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gdmzPZ6MmTrFST4CSO7HpHnjW1rX0oJfePy7FCOsywEPhijeRm2KK92clf7b?=
 =?us-ascii?Q?USCrTSI5juVRFojTgQFIIKJy6N8aruS1DPuEBgscCax9EOCQldePXDmkwKQl?=
 =?us-ascii?Q?Oh9oGvGuoCm6AJRXZ9ZzPb8Mi6LzmxYofewM74i++/JwRiC06N6ePIySxYm0?=
 =?us-ascii?Q?OR4JinKwx0JNLN7BT7PzmlPdw4oy97IOH272NYgD99WARvDW35Piq0oanVHt?=
 =?us-ascii?Q?bui8hWiXjEqyT4Vxmr3lqmLlfZe1h13LTnvzhCM0hrzgbj/RRTxha1qMiiUb?=
 =?us-ascii?Q?9FQycG2XXVsVuDyKkPWw2BHILZAP3U3f0NlFSmL92Vyw7Gt8VAov/6te8gjG?=
 =?us-ascii?Q?+oFqDl6cfnDm65quUWHuc2W9efXDFfuJ9X/vQ7tBPNcomC4uE0TsJWR+mcB+?=
 =?us-ascii?Q?2MuuZ1KwXlV5Q+6QNrWlauKSW8WQSibG2KU71c189ghMe+M9EnfPbBeRXunh?=
 =?us-ascii?Q?DRA+mG6GCnGULle8fpdaWEDAyqit+cFcNwKmLTP5r3x4U2wWLgE9KH1JMR9Z?=
 =?us-ascii?Q?ZQVAq+ko3ndY4RFH0oOMjrM3CqVes8PupOudiHFM/cuL0JX7qfbi1Lruyfaq?=
 =?us-ascii?Q?UX+5LHaOPEgfVaQAG8ioaCSKIxhWtNA8y32Si5jAUgkPjbCefLrvAsIg1tTq?=
 =?us-ascii?Q?e+Cuxcj6zlribfv++jwZA1bmspG5tezwF/rkREcOD+0JJfqFDVzNzrc1dgo9?=
 =?us-ascii?Q?xpUj96sdLABejNEKvDhP5rShv3vWCqzoMwzwW/NLQkrktZBVdPHHfVkQubVQ?=
 =?us-ascii?Q?XDEkJpXTD/wqMkuV0aAJUlhfqG5RIrN6NWU8BxVqB1+3i+B65TkXa8ALSFTk?=
 =?us-ascii?Q?iRo5iSnav5gow08MbnF7nZ1xU/BGIgrbT919R8uIyZ8aNe8yMxBfpHfoJKj9?=
 =?us-ascii?Q?eLRhRFfs/IRONj/lXeyXx33spPZ83rlFxVqQL/NvRITeFHCnCK0WrIVvxUtH?=
 =?us-ascii?Q?81bLfdvYA/23K3kw9sJLlcXmyCOrwTYix6NYQavj+zUOCxgkKZlmmxGa5wSY?=
 =?us-ascii?Q?nfQ4DD2keLQvwkR10iZaURgn2zeXcco/RrqiOPtqfRFfZP8LMdZa6L9f1w0G?=
 =?us-ascii?Q?tJN3HLPozrzPBZyY9ABiiOu83lDrtKplAU+FJtD7UbTDtXVLaOhH8hdXkGxf?=
 =?us-ascii?Q?+VMalk3tgU53Sgc2BHGkRAb9URNBuprcdNpz7NgH6rRnyvfS+YGe4s3L/AE4?=
 =?us-ascii?Q?ML2l84vCUeTEvFks60fpAps2kyCfXrlz0NgDkUcJAW23ziJwzEsGJf5fh+Yn?=
 =?us-ascii?Q?s8pHbcUQ1xx+sXCUrkiVwBf+cAi6KO7c1r7tZcpWa9wwru4jWr/cWHwtIvF4?=
 =?us-ascii?Q?kcv30AhQHuVmMJRraM5LSHbvbv9TVbuUSTQ/Pp5OvFM9gyJi4+iAOdYMAWr+?=
 =?us-ascii?Q?eHLUGRN75E6qnUsTYULtpSXmiAij?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IiRE07TB6XWNq4SHx2c+MSspshbcLmIaenMSh7Q0IaWroYBCiTP6x+O3M+P9?=
 =?us-ascii?Q?9nYdCDMbFZ9ws3kX7YVWF5nMOZzWuVecXlrrbTKya7bDuRaftw+2nQKLITyL?=
 =?us-ascii?Q?SJCdda7WworZxFQwI4oMVXFBe2iTJTqi3JpWGruLoooSQ2REldYgF+3SyFqd?=
 =?us-ascii?Q?ReIfsSu6eXECXFEXk2Z6ZwSP5ptex4THPRD4p8ps8N1d0F2/RcxCWUu/IF7c?=
 =?us-ascii?Q?+XSUi+2L2Ugij/WJrYhmg+hzVb7THGZbjVwq5VO7gQjnT6Wk+VpKwvB9ocZe?=
 =?us-ascii?Q?YgjAyA6nLkei6lA46r2itPJZ6NVCo960tK7kU8UfkM3Esr8PX5YMgBpL9dYp?=
 =?us-ascii?Q?Emkvle4V7V6tbHhhawsqU5SQcMkKf98RxtW+Uwq3D7PUq1hgDETHA6EWO/PE?=
 =?us-ascii?Q?VY36Y9eJS7vJEHXogpmo19fDwSxKMz4JOFB6038HKt618mqGihDxvyXquDox?=
 =?us-ascii?Q?+Wt2IMRvQmydPBPhhdw+nRZ0eWicDlcxHak3r6ZUiSquoKv1Db431iafqBF9?=
 =?us-ascii?Q?jYt5r09biEyv9ep6ooYSGWKFVK0MrbIsO5SLF9QsoEYpigt4EK2mg8v2S0qF?=
 =?us-ascii?Q?DISn9Q2YaOakGe32lOt8mfUfrR4fc1AgGaDlzVhFKKtIjm3pQWKDCbmGWMGm?=
 =?us-ascii?Q?hKHQyceqIBzeEAnKnqrUG1pq7Ckab40mqsaXlurGKILxBS21yKQkgj65piTY?=
 =?us-ascii?Q?dLyWkrxufcauwiVBpA5KnxAp1yXLUWxBZydAKsczlzZe4b5FLJHdOAbM1622?=
 =?us-ascii?Q?j6MiZVWTmYMmyvmg093wVezEWf5UiXR3vZ7NObN+cgXCNWS7+jm0D47MRS5K?=
 =?us-ascii?Q?AJKTzdnSv05CWcmPr4tDkHelBVgJKUJursCsH8NCW6cPoeyTgUU2odEcOXYb?=
 =?us-ascii?Q?TDTIldPouWAZFWpAXQ/CMsMPyLkBNqjKF2xhhXiNChwKCpKF266cTb7lR1q0?=
 =?us-ascii?Q?3w/AudRYW6WMc9B9wfkoqcu8Ko5JTs7J9So7Vv0sTLnHyh67nRw6+cWjqbxt?=
 =?us-ascii?Q?qLIgKL2aN7cG1lThaPnWQuE0/uJsVJlRBmH07nGmlvLRvaSh2DB3Ww2JdbxF?=
 =?us-ascii?Q?w2PQriSEtxURVPz1Gf/mR5/m9z3FSALWkrh1qqQ0nnkEAfVEwMvHGw19EdSU?=
 =?us-ascii?Q?04+MdLsXXP6xBM+/1LZLEkG6bWwXPeUOkqqVYCZ8KbQTmepZr7jxwsXV8qvt?=
 =?us-ascii?Q?rMrIBY0i66eKh0kQ0kI17PzvdytiarcZgmcjYpU4mJAS4PGwqEo549qeQTWs?=
 =?us-ascii?Q?QyJfxI+6sZ0cX+7IxJEjt/8MmgMKsT1/SMw5JuuEUMKs64dy8QYREt6EXwWu?=
 =?us-ascii?Q?PxtGe3r84VLQBMRgF7G3fD3UmJQZS4rawPcY2TI5t9q22NTsZPum1LuBib91?=
 =?us-ascii?Q?Xfly+rMoAIWKXhnA8XJxSL+v4cjgyLXWtiVJKGUQ4ba4A87qu1ka3CjwTUsx?=
 =?us-ascii?Q?lfpwe2LrwQ34XTX5U2ApciMgqcLu9Db64upkRznvym0mrJ5n9Zcqm7RPolX6?=
 =?us-ascii?Q?jXw8lH3tztNR7Ku/DF8uC4mbcbq4ZheD57EyeUqMdj4T+UtEC+TclhkabdWm?=
 =?us-ascii?Q?49TX8lKguP6rsdf7razBXiPzmM9iEu9n/AXE8TuUWY5z4osCoqc4UZAKxqSN?=
 =?us-ascii?Q?mJ7wGS0zSKa5G/xisc/2c24=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00a33425-413f-41dc-bd88-08dcb02f59d9
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 00:34:19.8345 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FYVjrUz/QFhqDgb1EvM8HTobiaMwMqXVPedCIYcNWxEuxgF3cJHl/QciPgaFt4bN5kIoKzy531UekfeGmrqW26xguSwzw6UXXHxMg6GrEAvShFb1ieAYG8kfohdg6eY4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12227
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

From DT point of view, in general, drivers should be asking for a
specific port number because their function is fixed in the binding.

of_graph_get_next_endpoint() doesn't match to this concept.

Simply replace

	- of_graph_get_next_endpoint(xxx, NULL);
	+ of_graph_get_endpoint_by_regs(xxx, 0, -1);

Link: https://lore.kernel.org/r/20240202174941.GA310089-robh@kernel.org
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/drm_of.c                              | 4 +++-
 drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c | 2 +-
 drivers/gpu/drm/tiny/arcpgu.c                         | 2 +-
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
index 177b600895d3c..b6b2cade69aeb 100644
--- a/drivers/gpu/drm/drm_of.c
+++ b/drivers/gpu/drm/drm_of.c
@@ -504,6 +504,8 @@ EXPORT_SYMBOL_GPL(drm_of_get_data_lanes_count_ep);
  * Gets parent DSI bus for a DSI device controlled through a bus other
  * than MIPI-DCS (SPI, I2C, etc.) using the Device Tree.
  *
+ * This function assumes that the device's port@0 is the DSI input.
+ *
  * Returns pointer to mipi_dsi_host if successful, -EINVAL if the
  * request is unsupported, -EPROBE_DEFER if the DSI host is found but
  * not available, or -ENODEV otherwise.
@@ -516,7 +518,7 @@ struct mipi_dsi_host *drm_of_get_dsi_bus(struct device =
*dev)
 	/*
 	 * Get first endpoint child from device.
 	 */
-	endpoint =3D of_graph_get_next_endpoint(dev->of_node, NULL);
+	endpoint =3D of_graph_get_endpoint_by_regs(dev->of_node, 0, -1);
 	if (!endpoint)
 		return ERR_PTR(-ENODEV);
=20
diff --git a/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c b/driver=
s/gpu/drm/panel/panel-raspberrypi-touchscreen.c
index 4618c892cdd65..e10e469aa7a6c 100644
--- a/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
+++ b/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
@@ -400,7 +400,7 @@ static int rpi_touchscreen_probe(struct i2c_client *i2c=
)
 	rpi_touchscreen_i2c_write(ts, REG_POWERON, 0);
=20
 	/* Look up the DSI host.  It needs to probe before we do. */
-	endpoint =3D of_graph_get_next_endpoint(dev->of_node, NULL);
+	endpoint =3D of_graph_get_endpoint_by_regs(dev->of_node, 0, -1);
 	if (!endpoint)
 		return -ENODEV;
=20
diff --git a/drivers/gpu/drm/tiny/arcpgu.c b/drivers/gpu/drm/tiny/arcpgu.c
index 4f8f3172379e3..8c29b719ea626 100644
--- a/drivers/gpu/drm/tiny/arcpgu.c
+++ b/drivers/gpu/drm/tiny/arcpgu.c
@@ -288,7 +288,7 @@ static int arcpgu_load(struct arcpgu_drm_private *arcpg=
u)
 	 * There is only one output port inside each device. It is linked with
 	 * encoder endpoint.
 	 */
-	endpoint_node =3D of_graph_get_next_endpoint(pdev->dev.of_node, NULL);
+	endpoint_node =3D of_graph_get_endpoint_by_regs(pdev->dev.of_node, 0, -1)=
;
 	if (endpoint_node) {
 		encoder_node =3D of_graph_get_remote_port_parent(endpoint_node);
 		of_node_put(endpoint_node);
--=20
2.43.0

