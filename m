Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9EBFC8A2A2
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 15:08:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3F9010E619;
	Wed, 26 Nov 2025 14:08:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="HqSByA/C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011063.outbound.protection.outlook.com [52.101.125.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE64E10E617
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 14:08:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CBbKrxyZ+h9ZUH1Dt6qKNKoc6ttdOLuesg54uJqn/F4WzbPTS36Ab3X2fczZ6u7gtmkQOfQYoVqXenskuHxyXpj10XU5IzNyP4i4UcMnpMc/ZqfpS9XhRoDU5Jgu/iYRxJq70JgVCJkUb24wAoLIt2UMiUxzVKqHqCgVUG1MP7b+fZOfnTCMmo0ccB5igFKxDQnRLwyCFCX5d9bBJdCj3Nj2Ml6INCKGfNJqTc8OeE7zCuPGg+mgyj5AfG7VkB1nEqJmPryGHvFF2NV7bQZNTSA/JX6tVZSLTKOvgOZIKnTi3kKdEIwJrzomgyWIV4qqs0Iovrb4OEZEZzZV47igug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IZx/z4d4w0XN8RXt/X6Pg90gBIIdlgtm6doZb0vpTIk=;
 b=hCqqgHe2zf9xJk9wYHva4IcSLuRgAvwCleUKj47lD2o1Xo+z3OQuG68BZslKu1A8anMv2mCk4Ekkzh+zjmSTuGsOPgG65t63sIs4Xa+kE4qHet+V8J+QbAMjbMAAMGiv6lEaOnyMgaZmyx+0z11pT2V9ZnTUE47YEAg+eB3eTg/csBU4jCyxg2Cupnhv+VEWAUI/sLyuN+dmju+MQ+FqdYiswqvmsHprfwc0fYi5eXlqDCkboCuglK43jCb3mB5AtXZUYEFZSDIHAvkAnysmCulmQ9PKHI27gU9pF3Qgk8cJoeIiZf3jm7oV7gLDnaSL2Bvh1gs9cXe9szKyjVf5Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IZx/z4d4w0XN8RXt/X6Pg90gBIIdlgtm6doZb0vpTIk=;
 b=HqSByA/C1j8C2OV00DFEs30vh8D/IynnmL++Zoq/I3uMdG5TWjrf3QW85lQKOdNZQ5QHJ+JBU1tlkMJmZzyUVmRncjpEvMb30H3URCpen83DgdFJ5H0rYYQgkHTDQ56Ke5O6FUhUNEpizLeSUD2h2kdG0whc0S1XA7QDIu66DMM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYCPR01MB6804.jpnprd01.prod.outlook.com (2603:1096:400:b3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 14:08:54 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 14:08:53 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 04/22] clk: renesas: r9a09g047: Add CLK_PLLDSI{0,
 1}_DIV7 clocks
Date: Wed, 26 Nov 2025 15:07:16 +0100
Message-ID: <0cdcfb470dbc4e897db049cf09f5d579f2035270.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0143.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::14) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYCPR01MB6804:EE_
X-MS-Office365-Filtering-Correlation-Id: cab4eb68-03fb-48c9-f52e-08de2cf55465
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|52116014|7416014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rOFr+E8VxMJURVDNyVbEpFbqKW8HPzq6s9KpC3Pn5+I7bL/rGvEoV6nrH8JF?=
 =?us-ascii?Q?a7Q/BhLz6RQAR/+EEGRQHCPxTigLH8wJKSxn5pG2Pk2mbi1cUBSGTng13NcF?=
 =?us-ascii?Q?S9JT6w20iqysKn536pcBwUnfCNwd581cGQQOwkYqPlhYbZmk2V2qPnknkKxD?=
 =?us-ascii?Q?BwbAlcDOgUKy0fkMZMwBpKUfsTty88F3B3A5qxo96PYX8aTBltPv+RlupYhV?=
 =?us-ascii?Q?zEkjbqAbumw2oWploKU6u8ah1oVDa/WkOfAZKpIDTngLfZ4F8r0mC53L076w?=
 =?us-ascii?Q?sQvMVcfWdoNvFso2yjIgxFGtT+kNMZybkgcnG7AtKxkjQniz8d6I0li2ldw+?=
 =?us-ascii?Q?yoiVAy5dAYZt9lyEtJvqTHx4jVA7CkjbfUcytJNEefGARRMtuaAWSqpMCaRW?=
 =?us-ascii?Q?q+fqLyCLdr+GKlcx1JluU+uUaL/dOe8HvhfjJDlWDL0XpaM6Kz6bV7zXc+7V?=
 =?us-ascii?Q?4omIoWHfmuXQMqC1u3CtVatQyDdqUFUzw3rggJF02NvQIJFwNMDpw9mkpPJ0?=
 =?us-ascii?Q?KcIwsIj4dau9wQS6uiq57JS+xUA7JqN/janTNy//vCIk7vnaP5hhOI5SCKQz?=
 =?us-ascii?Q?7DpCawj/GY79yA+cF9P88toAnd1fHGd1RHA/amoz3ZSkmYouBeT+OD4suto0?=
 =?us-ascii?Q?seEuJRVLs1as/3OfAQWTC4lg/WvM0oX6C/qHUNl1wFSg/e5TC3UFccvqNj+T?=
 =?us-ascii?Q?KJ8n1EHBoKhuG0AdQo0K5M6KU21lUHMQ5rDQFyy/uP8vMaCyvKkh9J8Umt/a?=
 =?us-ascii?Q?paOnbBTCZSQwmOTJg5PGNcWtCrHQmsa6PupP8To1+IwsI+8MQqZyzO3XyYYg?=
 =?us-ascii?Q?ZMHY9VbnsrKdrOIekm9ouzBy7OOBOPy1OXn0O7yPjsC4SiCQ/BJ555IuPgFt?=
 =?us-ascii?Q?juXrh4jl5j6/IDqOj+lqvph60f7uUEV1NW5MIQPZMgqad9B/NWWQX8as5mwR?=
 =?us-ascii?Q?+GvnUKFHuWtIADiwXvDABYYXcKlANN1T90lzCOUupuY6Z8Ty3ahPWp0L/+aS?=
 =?us-ascii?Q?GZyHx6mnQLZcfVFAH0lrVsRPhwQnnDeQDMjW8luNrIjKAuOqVHNKXulDhNhz?=
 =?us-ascii?Q?gQGhHp3a+31nOanX94QnK8XAqN67LGNqVTZyj+ixBreVNWfqf6k1lg4cKSMd?=
 =?us-ascii?Q?EoLRKWLrs7NwZn2z+O7o097++642qAssHVXqWs5tYD547NS7RlbOvK8/SYAY?=
 =?us-ascii?Q?GVbh7G+1lqZBS7L8YPINLPURfcx2KdnXxJI5MSHT25u62MKLJn6eqnC0aQOs?=
 =?us-ascii?Q?4o+q2JxTp347XsoY0rF0JEGmqm8thSfOoUT9BO2sKLyfHZVJ7hzraKRmAuuN?=
 =?us-ascii?Q?19q0SKwaXin45NK5q91DOk0IDqndZl8c8QIU2tA2MaTdSiKaSrHo2LCWBb8I?=
 =?us-ascii?Q?l5nGz6TuC28jv1N1+2bZ6Vr+6w/nzPrU6Kutv5arI9uvUWuNgP+DySf5vXue?=
 =?us-ascii?Q?CGuRcrYOEz64JbVLyShuuw5FfY7nlr6c1F4PdgRCE6f3AMMD+sKQKpA3G8f1?=
 =?us-ascii?Q?cnzcnUNZJqAyphljHR3T3fASPMTGklp/EhrD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(52116014)(7416014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Yk35PNCtkf0fkl7KnZUhz4BP1kmM5UTpm21RzjMeyIgmYQSCTlsNXiTq41wd?=
 =?us-ascii?Q?yDpHPIiCoTBosoy9KVZzXBwT6kRLnQqefxdykXJL59tRGKGMDPXgSlg7BMkM?=
 =?us-ascii?Q?U9Z/8kdEZEo2BQ5nq9uLbS05YRv+vUhkdMe+pzPDlergwMgfYzF3JvZTfJ+s?=
 =?us-ascii?Q?1AgywYdWfREm9LVaTcUYUvLvhCN+Fl23yLtSgBODKi2oeJLJu3l4OU6AuElJ?=
 =?us-ascii?Q?Qm/LFW7XdDUZzMCfTQJc49fevtCp0nj3VbbuMvy4cg8qi0v2ArPUg9UTqB1b?=
 =?us-ascii?Q?SnFQ1HUSv5NTlVpuAAoQJlg+OJTJ9kQmIJNrjr/bi1WqoRJC9Up/z17rv9Yt?=
 =?us-ascii?Q?6rJrcBHhfTAP04F14hFeRM4uKk/ekCm0BfNCamgjaOhidJV7anQcxTZZ9IVS?=
 =?us-ascii?Q?AS0xFNuJcztcelqoGuffZxcqM8JlNU3I1dB8G7fUgQXmeGUfV1iabZAb+7QT?=
 =?us-ascii?Q?oOaGnkFkVggnbsipfCYk7nm1iLO37eVQoywQtpnAA3sJbOpTAnZBmxShjMDS?=
 =?us-ascii?Q?jmcHDgVWgCS7bwCad3weQYg1Mkx74HbZu/J18I0vbKJ6/T5olE4xpbmhMD7i?=
 =?us-ascii?Q?WGDe23H4927h9rW1plYfwnY8HNAIvs1oqp3a8oDqmKtjVaSzwH0crdtGmAjO?=
 =?us-ascii?Q?nHKWbLxUo/pIusfUYQBJpHfG6ZlOc/unfu1FXXGg6Q4j+OY7JOUbcbyiovIV?=
 =?us-ascii?Q?qE6+yMGop4E7yytK09iD3FcldeIJwSc/z74eYDiCvoDmR8xbFuWVP4oinlXA?=
 =?us-ascii?Q?CDdEENIwbszd7H7fOvTRhCB/DbLYqyNS4IsLxWg0AXZ3tAkDmq8iw0FrapTY?=
 =?us-ascii?Q?vt1TFO0umoEG/bT/IzuGUge/QXm6WnOtPsT8s7LN71oD+wgeOW3UguAd+5zM?=
 =?us-ascii?Q?xZqlkj50lN6GcQS7fHBGLKjqPAi2R1dvbBHVYDcHLQZeimeUu0IbcybtrZXQ?=
 =?us-ascii?Q?8e6Zsetvyek81PBmSbUUb5EDDXIlkVf8lTjNOm9ZKDH739CWPxetHpkcX8+S?=
 =?us-ascii?Q?5e9Sp1SmXlPQQ3VBiVCzmQzT5gP70+/cTt3neELMSri4xk3wB0E0kHoAMzJQ?=
 =?us-ascii?Q?k0keYBwW3vQmmFK+E8+zZfww8zjYe9wdEi0NmoJ1rU5aUXrxo6VETN4oFF0J?=
 =?us-ascii?Q?gkXq/lSIhw24xCOkHxMru5KpFwvYFZOHFIO5tkIOFZXIBNSGPVpjczOzONFa?=
 =?us-ascii?Q?iG+PD2FOrJLySFREpM5rlXi/5faCtoRb6z6XKdnKitT3s9753lAzKtDEdJsl?=
 =?us-ascii?Q?+9N4+Pp6R/sv4Eswd9a32wEU8JJotIkFZMz66Vfzr5iLH9UF24yeVhXDgSxW?=
 =?us-ascii?Q?X1KutMYzQKCv/fbEGvCb+UZ913/J7t61XpUD/hY8N8hcwartbQIlqBpnmAdO?=
 =?us-ascii?Q?5izmLY2FUIrnKvIrWY808ZERkPkoWCBIv1CsqQo72cgLyU+fHaC45Lk60f1D?=
 =?us-ascii?Q?hgSDfPrLLr1wL/xay0152wL8nEN3FUVFKDFtT6wvU53kwjJyUsneLu5K+n+C?=
 =?us-ascii?Q?Gi0ZmSbY0OrVwSgg1T2VDcucv5HOJB4nA06ksUFQqyG2/szntMXTS2TxAcaL?=
 =?us-ascii?Q?0QrS8HLGrwb9DgtrbIZ9TMj2fT2bq6tVRe3RDZbSlBuMS7tqwi9kG77W2NGy?=
 =?us-ascii?Q?a8qAMqu7xRK+3gAXwIedI0M=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cab4eb68-03fb-48c9-f52e-08de2cf55465
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 14:08:53.1505 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zNZLd6qsMrTWmv6O/IPDRoZwFZbZARjtA6OHYk4+n1wdwhYE2Eslh6N7mbLn13UMOC9RsJsrzPnJ7cbmzIrJfe3t5dCyF1ZYwqhYCHOw4PycC0AQVX1wTfkXhEsUeip0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6804
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

Add the CLK_PLLDSI0_DIV7 and CLK_PLLDSI1_DIV7 fixed-factor clocks to
the r9a09g047 SoC clock driver.

These clocks are required to enable LVDS0 and LVDS1 output support.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 drivers/clk/renesas/r9a09g047-cpg.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g047-cpg.c b/drivers/clk/renesas/r9a09g047-cpg.c
index 8d4c70533a79..0e707391283f 100644
--- a/drivers/clk/renesas/r9a09g047-cpg.c
+++ b/drivers/clk/renesas/r9a09g047-cpg.c
@@ -69,6 +69,8 @@ enum clk_ids {
 	CLK_PLLVDO_GPU,
 	CLK_PLLETH_DIV4_LPCLK,
 	CLK_PLLETH_LPCLK,
+	CLK_PLLDSI0_DIV7,
+	CLK_PLLDSI1_DIV7,
 
 	/* Module Clocks */
 	MOD_CLK_BASE,
@@ -196,6 +198,9 @@ static const struct cpg_core_clk r9a09g047_core_clks[] __initconst = {
 	DEF_CSDIV(".plleth_lpclk", CLK_PLLETH_LPCLK, CLK_PLLETH_DIV4_LPCLK,
 		  CSDIV0_DIVCTL2, dtable_16_128),
 
+	DEF_FIXED(".plldsi0_div7", CLK_PLLDSI0_DIV7, CLK_PLLDSI0, 1, 7),
+	DEF_FIXED(".plldsi1_div7", CLK_PLLDSI1_DIV7, CLK_PLLDSI1, 1, 7),
+
 	/* Core Clocks */
 	DEF_FIXED("sys_0_pclk", R9A09G047_SYS_0_PCLK, CLK_QEXTAL, 1, 1),
 	DEF_DDIV("ca55_0_coreclk0", R9A09G047_CA55_0_CORECLK0, CLK_PLLCA55,
-- 
2.43.0

