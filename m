Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF065745E5
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 09:38:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B8BB112785;
	Thu, 14 Jul 2022 07:37:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80085.outbound.protection.outlook.com [40.107.8.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 793A6A3142
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 07:37:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=av9XZSOrOmfES84p92S9QrylcOBZ9MFKZ7wUkqP+p+/kVYBReWqoz08LTyKMQ2RVn0O9LbjOE23St8aLz8voo016IKmQdIcguWlUHLvlUHCH2THRzHCG+yiR9Ra9NsuB+kry5bFky1fm0bWNNwp4Bd3j2Czxxn7XJewEvh/PB0QdLZsm/1eOFCTn6B++r1iB4OBFfyF1vYkK95AjtaTadyoUbswltCirYFCatadUoCk2yFQbW2EYHdZHlJJnB7ltK2VX7pQgwhqhyxG61etXYKhMrHdstXwzsWLEkz4QBJ83moO/L+eJbwVx6JcZZ6mCqMG03oSaTaGaqZjjsb+QVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GL2YTplOnKmv8F7iUhG+QpYh8N8URTpbYv4OVdg5eO4=;
 b=aWTpV9eNomr/QqV46w4PyS6YjI5+uUbZM3xgm+5NTxy+Kf0TkhBmDkvcBVdc0vPizjDoSFUSuU5XBj1ma+CCQOAhaDIGMUg2nE/LSvM0vuWva99nN6sSVZc3A0JWPTXMkJd/eNVKxFOu6XLgBUZsj1Wq5thbd9A0Q3Tw9I1mOmpuGU1Gs610ocewIR8E28zrueqOAxSIRCHX51blgx4ImMdc2cmAZI/rkGqSKSWXDgrxJP1qqYr2Rc7HZxiV4VUQScceUJ6FA4fjDZsm5vV2PmNGUvtDPiXSsVM5O4OdJwkij1YuckkfsXpy0VHHZ/dyjM37rE1yxKCwppPsh3Ba/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GL2YTplOnKmv8F7iUhG+QpYh8N8URTpbYv4OVdg5eO4=;
 b=OE6mmyMERmRcQxSAQhiA4nNVi0Dw0CDLwJ2fqT5eS0cYvVeoOm7TozACsE7Pshq4h2OD/Qe5UHWNzfs2gmyoQe6oHsyzLGb5EjMD3540THfSnOyOxJJG/Trl30OECb7hrfvmXF4UcSXa+f7jI9flvm8t4YYECJP8ynA28YcVmEM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27) by AS8PR04MB7799.eurprd04.prod.outlook.com
 (2603:10a6:20b:2a4::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Thu, 14 Jul
 2022 07:37:45 +0000
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::95d3:800b:30e9:603b]) by VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::95d3:800b:30e9:603b%5]) with mapi id 15.20.5417.026; Thu, 14 Jul 2022
 07:37:45 +0000
Date: Thu, 14 Jul 2022 10:37:41 +0300
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Liang He <windhl@126.com>
Subject: Re: [PATCH] drm/imx/dcss: Add missing of_node_put() in fail path
Message-ID: <20220714073741.raufdst77ezkyw2u@fsr-ub1664-121.ea.freescale.net>
References: <20220707023214.307451-1-windhl@126.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220707023214.307451-1-windhl@126.com>
User-Agent: NeoMutt/20171215
X-ClientProxiedBy: AM0PR02CA0131.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c::28) To VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e6afce05-ea4c-4d1c-9d09-08da656bbdef
X-MS-TrafficTypeDiagnostic: AS8PR04MB7799:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CmJVvXgjmyziGYiMjXxlXIUILeyT++CF0ag4Ep9n91JAplarPKsr3DozOeSRgeaFcmPtNiv8ko+kIDQxa1kEpiAI6Q/5Yq+wAr03e/TnCQIzIJlAtG/XAXZ548eB2I5dfXa7VTrWDoTHkdKIJ3qkHW/vVwybk6p8cIuuIaPyM4WPDPbZpkmzHClxqIZcbbjapQ+U6bbitkivXWNwXqRa5qsKaVJ+fS4/z8pT/+qCkf9Fs9FLVpeIZmTd4z3JoyemCvoeKE4UmVIA5j7uegj4g0ZkkL0uuHcTzJiTSAPSxrH4bwEkANEHa1fRPw+z62keOUagpabetNRlz7CJj7EmRwDCBfiGwLp6XogrsCaw60aDIaN13q2efG9P2oa1y4uHq1Xvh4e8oIKJFGS7WaOvcA988sc/RmkoxPfJP3nNhMg23D68Q1PW1FyJT+EcOjud24DHLGBzCH9SWE0wau/k9y6j/o4AY2xFW0XkV7zrszZeEqGli/YesM2bzjmwkSO1j71IwWzwcP0DMDQc2UnPaC3H3IQhlC+JqWrlSs5W5ebmTOdVimaP/87sXR+Tp5n456NGv+bUbpEpZnmEu9opLypA4VMD6772fLzortf+PABaRU9PUFxqvSUTs6SZfW3wEtiJFFcdkmzsyXLvSWkDY5ZkWZcecx/Lui1G5ODT9ylhTPR1ZHIEiGCUZkrX4Xab7YF/sOnawnfQl2igi4igog6fiBCU0KAy9Xx6OnxCRuiLIA7BEfpy5r48UTFglWtb1+ToPQl/QEpXznoEZuz6oLeyLNwNPKzn4wVSNuBggMN1Z+Yo70zwdwRhsmT6E4g1DsjHYzaT+pjfqbl5JRTPeQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3902.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(366004)(136003)(376002)(39860400002)(346002)(52116002)(66946007)(6506007)(86362001)(5660300002)(8676002)(66556008)(4326008)(66476007)(41300700001)(44832011)(478600001)(6486002)(8936002)(2906002)(6666004)(186003)(38350700002)(38100700002)(316002)(6916009)(1076003)(9686003)(6512007)(26005)(525324003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uc6S/Mbil9MN2B5TCIAwQJw0qg/Ldr7I1ZvLFdNMrysGoTaaIK0yFpHaDGbs?=
 =?us-ascii?Q?nUoJUG43t+KXy4HJfO2YjilcsvYVVuCA6/YhizNg0qU0LGQh2/yRCksGsB8T?=
 =?us-ascii?Q?Cy6Xniy4bhE1/lWEiW5E9X1TgH6C147eNoRJoD/nwA8nXcFkGfpo8YNFgMPu?=
 =?us-ascii?Q?wl3J+WDHxstxpDWfZ/ma0B74z49tbyAlZ4c+sBaXGh/6YpRzKb/aKwEd1WXn?=
 =?us-ascii?Q?f8IiJNi4K5HFpgvHjMqq9/kWps6WItU/H2cTSXX9yVuTP61MBa7m3eYJH36c?=
 =?us-ascii?Q?8FYO8li5E9AFYh4eOC7ez2dMOJgt9TqAEcpQl94ZjN+zJ680Ptzi1f7Sbnnh?=
 =?us-ascii?Q?z1oIojVzvemRB5fZckE3BqKs3S+TQdkBhL/XlbLUxXhA8g23uXaAMBqhhTiG?=
 =?us-ascii?Q?5eFdfqxHAoHJDR/+9E/lszg0oHv1am6h/rz5DIqTtfNctqaacUZS0aQZJerx?=
 =?us-ascii?Q?aik/um043PenX09J47fEeOam0YqE07aZ4E6f0WyKtsHpmV4cedhbu7jsIkno?=
 =?us-ascii?Q?WfPLPjNswi0Qvxkb5ronTpthA1aPkfLB9hqIOrqbJCH2zkl9fWa0Vh6iu+Mg?=
 =?us-ascii?Q?wOsR0OhGN4oo0q4DMksT+GwOtnoAfSgLQIqYf2XClLvOzZXgFHNPUD4bqZeT?=
 =?us-ascii?Q?3jT+Nq+AWJyI4wtFNqRpbQaE7efz0T60VxV7S9U/p4+jZtGubWqnhK+JodyU?=
 =?us-ascii?Q?E4sxwXDm3GVZnvI4Y0yv7yybvvdH8/6fHLQZ2NWjJfTDuGZQlAjmXYRxh880?=
 =?us-ascii?Q?S0XrI4FMBRnwkXYiIdbsajx0Nu4Ra+2Bvu7hOMsbNS4tyOkdasqq7ZTYoDRb?=
 =?us-ascii?Q?AVkPu8LuLp8D51BnvAnidV0Jtf8wcWebD0faVDuWx7ITuLgQDFkkjH5SpNl0?=
 =?us-ascii?Q?ShbuFb7rybEqawkrcEuASC6OCCXeYUOzDpn4aSgDNbjq1klmpBYnOhIWdJag?=
 =?us-ascii?Q?mxjd2bMTnXWyc47FNBTPyGeedRXZ16mTvTyWJCSnBScVo8T4SpDQIRkCBu/1?=
 =?us-ascii?Q?Byfl44mN7KY+MG3Ppl24UXbHhIzdD23eM7l+qqeJ/5IuXTLz9Ay05SQ1Khpb?=
 =?us-ascii?Q?uVPkgHGC77X0OxupuWNBDOpwEwNsoX25v0iXnH1vC7rz1BPYDbRLhf6QeLQx?=
 =?us-ascii?Q?/g+AV3BxpvIYwdVc92fm6GDXTP25aHLlr6u3ampa+iN23TEYRmSSe8AkM8CA?=
 =?us-ascii?Q?Bssb5wy+G8eyHHl2qGG2hHnTCbGBrJg9dfaH+xYf5/6yH5wFXgI/mt/DGCGl?=
 =?us-ascii?Q?0XA21iTB+4InRvefKM/0Kv9rC9QnkVmEvbonZuA9+SjIi041vtD9OcjBCEbw?=
 =?us-ascii?Q?GMVTpMNooSZ3c1rUEs6336NP+3oV6vn1CcHj1b76B2w0L66zsC7LvaVP2tye?=
 =?us-ascii?Q?PS1fcJtw9d/fshXyx2N9Af4TIjQKkIgRCQhZV4T1cSxiPUUYqQlybeDJPIFQ?=
 =?us-ascii?Q?qcFymkmFoGtokIahxFNOqcDmGo3aOAFWqw3/1eoG8ob5iG574yEyDAOtixkV?=
 =?us-ascii?Q?CR7PUGz4OQogYjyy2m0V64wVi80gGwUHjJhra06gctCJqK5dVpt67/mfzwYe?=
 =?us-ascii?Q?EqGsjw2RqjYsZOPM0x3g5VHQ610ED9CDA1cu+iDnrAdLBBz6rxrjmqCWB0aF?=
 =?us-ascii?Q?Pg=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6afce05-ea4c-4d1c-9d09-08da656bbdef
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3902.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2022 07:37:45.2911 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GTHIbLEk5x82BZsEyhY5/8EQh16gIBXhjYOUX8l/Lt59+5ntq9ZU/GN75l1rz1YclmBA2IYXLb9SobLudiy3cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7799
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
Cc: airlied@linux.ie, shawnguo@kernel.org, s.hauer@pengutronix.de,
 dri-devel@lists.freedesktop.org, linux-imx@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Liang,

Thanks for the patch.

The patch is ok but, since you're at it, maybe add of_node_put() in the
dcss_dev_destroy() too?

Thanks,
laurentiu

On Thu, Jul 07, 2022 at 10:32:14AM +0800, Liang He wrote:
> In dcss_dev_create(), we should call of_node_put() in fail path for
> of_graph_get_port_by_id() which will increase the refcount.
> 
> Fixes: 9021c317b770 ("drm/imx: Add initial support for DCSS on iMX8MQ")
> Signed-off-by: Liang He <windhl@126.com>
> ---
>  drivers/gpu/drm/imx/dcss/dcss-dev.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/imx/dcss/dcss-dev.c b/drivers/gpu/drm/imx/dcss/dcss-dev.c
> index c849533ca83e..a99141538621 100644
> --- a/drivers/gpu/drm/imx/dcss/dcss-dev.c
> +++ b/drivers/gpu/drm/imx/dcss/dcss-dev.c
> @@ -207,6 +207,7 @@ struct dcss_dev *dcss_dev_create(struct device *dev, bool hdmi_output)
>  
>  	ret = dcss_submodules_init(dcss);
>  	if (ret) {
> +		of_node_put(dcss->of_port);
>  		dev_err(dev, "submodules initialization failed\n");
>  		goto clks_err;
>  	}
> -- 
> 2.25.1
> 
