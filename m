Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F182B96B120
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 08:11:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B44F310E632;
	Wed,  4 Sep 2024 06:11:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="CHRcpr6s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010046.outbound.protection.outlook.com [52.101.229.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62A8A10E632
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 06:11:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y7H61GiuOP+Wd68XOH/XYbeWgz5Bm/QtKNalKJyNkVKzNrJtVgZR8kNrPoZCsZavoHrFpKCiAbz+bCNE2aic2n50Qbk/7AGR1itcFT/vT2WkaUISP67mhGS6rPN65ZV8VnjQJT/eL44SHaL/iak0VEm7e/yUEBP+KVlm1yyDrGW7pHl2kHzh9rT0UKz6LxxpGWVNkeEhzq67UUC0v4pAtFjK1J9XpTtfyBeTnsTbz+qg4CMmhFft1W5hjfAtgpEP71t1NdWgcgmIvaRslBCtE4w18fOyWa/AcVpA6a/1d70a6aygBTTYgU2zLL0BY7V15p4KFuCTpPDqErpQHBnCNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hp4n9zD26Pjr3suPV3xZ/lwMpWsgUaeqizfk9RGR8Ns=;
 b=Y4OSKSWh0j6sApmdgoza3gtAkUY/NDHag5zvjCtrUl3PAAHfZ80H7kcEnvKvHB8CEkuOWDWQWcYXH3SQy13aC/n5QVasyJ83MVY7BCcIOe9jVGHXD7kUm+ZY2GS8Q4U0k12xmTOXbxOPyFcoThBCm6N0Afbl4HA0JuXh7paj5D9uJJCCG+DCA3EQB0hoGHK8vcI1N13jYHIbwytOFdIL3TuvWpd9KaeHE6pc+U2izALx8ewEfxPls6dUYbxPL3Z7wmKSdpbltqyk8p1IyCrjvpsdsBCiI2KvGbiG4sT3tuF7sb39pAwB66rxMg4J3jKkr+mdLF1IORxt3fZeXLBJLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hp4n9zD26Pjr3suPV3xZ/lwMpWsgUaeqizfk9RGR8Ns=;
 b=CHRcpr6sKZcptMUQX84B04W2sIw0C7n0+bbzI30qCWE4Pcy6/YdM0Nq3CNHVMrVWgFMKlbApFthlLYT8FtRFiTyqHTwrjWDyd0zJfRKflVKWPJEeg5aYROVH+afRAzavBKeqR6xC5zuJ0h5dnCS+efcttOAbGgBXBZRpOkIxfDU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB7309.jpnprd01.prod.outlook.com
 (2603:1096:604:11e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Wed, 4 Sep
 2024 06:11:35 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 06:11:35 +0000
Message-ID: <87ikvc6j8p.wl-kuninori.morimoto.gx@renesas.com>
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Helge Deller <deller@gmx.de>, Jaroslav Kysela <perex@perex.cz>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
 Takashi Iwai <tiwai@suse.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 linux-media@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-sound@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>
In-Reply-To: <87r0a06ja1.wl-kuninori.morimoto.gx@renesas.com>
References: <87r0a06ja1.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v5 6/9] ASoC: audio-graph-card2: use new of_graph functions
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 4 Sep 2024 06:11:34 +0000
X-ClientProxiedBy: TYCP301CA0067.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB7309:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e4d3e85-ba83-4a01-f7e8-08dccca86e04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|52116014|7416014|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?o0q7Gv5Uz4CGyhRIkSwHx57Ix7/IEPLoDEf1h7oW9OuUpxttCHdwUYbWrrAq?=
 =?us-ascii?Q?sLy0dtNvjTYW5+YCxiVts7Aqka+xCeoEAprqTR4e4DJ30ATcuAlahHeoZuvS?=
 =?us-ascii?Q?ThBTd3J1Zw+VNVYGS9ymIq6oVkXifoSOs4du5k7L/viG3HZrPsR8BJ7CjG27?=
 =?us-ascii?Q?VqZ6Wc0NE4NRRsS6y5qcuK6Z0D6BdWJj1SzbLXqqNDx67APJ6rF4B/mzSw/f?=
 =?us-ascii?Q?2e6667lEcEMlalHR4iWipLYjIdCYh7OP/nvnCIfTRiL/1WIIrfDTXKek5zyk?=
 =?us-ascii?Q?Kuj7+Ai/L3mNcIASotLpJqfvovVD38xRDTfYapO73pmW7uDCn/0cP6Ee77zu?=
 =?us-ascii?Q?RDIOoERqyL8cOniBNPmmusJhjtHfB+ODEAcMtHyixLL0aLPJFEP3hmfazHg+?=
 =?us-ascii?Q?3XJCs7ucFpI8au2/lx7jqo+1Yknq9RTONqpx4ksay8H5r3XHqaEeXlNCidn0?=
 =?us-ascii?Q?URJkS8fhKvqMVCmUTxC/SqtJI78rZxQiVgHZcc0KGhWCwRlGpBwLUnrDHO82?=
 =?us-ascii?Q?RDHyAmRnNp+jbRFZPbzzWHKMu6M0lW07Ajffo52t4RrLsYX8kV2KANMb+2dB?=
 =?us-ascii?Q?MCcObQJDO5QujYau+K+NvdaLR7Kza6Gswa4EAMBzsrCl7pJPSx8mbnFW9iHn?=
 =?us-ascii?Q?Z1S9Vd5I7ac6JasfHPlkEVkn/myodVqO3xy4iDXVygY05u9oiopYBrSsD92N?=
 =?us-ascii?Q?Gj3BLB7xELkeZhuNAOgsRK7PCw1fa0PwVIDTDSib9Al/fD5KfF5FToOv1pC8?=
 =?us-ascii?Q?nf3c+1kcIIJOZ0xoVG29nJApPx5VxG44TYI0ekxaptAOcAobv9ozZGdqbhrC?=
 =?us-ascii?Q?ay7p+8ezBpQh9m/0nCCDQDGk9lMLPeqdieUNaVASia5UoMW8/IvcbKQKbjAy?=
 =?us-ascii?Q?vx6cfd6msaBTgsdCroMIJUAjlddzCLKusowX3J13+0qkxZB3X8st47lkahf/?=
 =?us-ascii?Q?mYyA1oPjeSnXD9EVUu+FQ4kI0f5nRhgQ9vnbnmlb8H8/pBzeK3c+uOUPMOCI?=
 =?us-ascii?Q?PMGPIkkXft91MyaxJh9AYb4lQTcYBoBUiEfJ3vXEjSxLadW6/4jtQ4T9AEyK?=
 =?us-ascii?Q?u3OV6nb340UJjlVYYIeUfL/CnSP9mh7jNWKR5UUi7EU1NQamzbJWjOAzp/BB?=
 =?us-ascii?Q?SxKqtLUaBj/I8mtkd8IdT0ahDhjgCyT8k4yicBBWc30g2KTatC75/mE+T6+D?=
 =?us-ascii?Q?fc/CBBGHJQO+Bfy9f7uWDVudhrWMSsPO5dCgBoEgGCeN5LXGuaA40THeQoZg?=
 =?us-ascii?Q?zd5EFifyD3W3X3JsWYyza0frRbzFnsVjAeIXQAHUQEYC5Hug84G26+EZTmE8?=
 =?us-ascii?Q?GMq2C3j+c8CuvWWyKBQQJdowxEuBHREi9lATQMGA2kJ1zEkG+9Rmj1hvekSM?=
 =?us-ascii?Q?ovn70B0TVssg7MQScUpOEL3Ftb2WkYqyvfl2WEhJUk98GyVzJfbN+fT7jNXM?=
 =?us-ascii?Q?nL93GMI5af0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?W95IqluxMr9g0MgguYHUctcAmu6dJLoC+sQn7Y/HSthspwN/qPBZG3ptYjaL?=
 =?us-ascii?Q?EPaDJ+Qg8rHX4ugh0vFAu3HuiNEvKX1rYM/zMInmbU6oe3u8icNK7dyRarSW?=
 =?us-ascii?Q?Q1XZ2SVLf7kuVXMjI0Qy3PV21THexUJyd+5V+aazYDrfHrbahjgTgCb2zoFz?=
 =?us-ascii?Q?7b4EKbXNBVKxru3pjbbVPYM/mdl1CT/YBuG+K+fIl90zzV41ZFpCEee7MIBZ?=
 =?us-ascii?Q?5t2pshrx9bCZaBg9adE/2VIyLKtfU30CMH51qYYFQNKSWU03XXqdPq7TsJaF?=
 =?us-ascii?Q?P3D/kJAB7fCtPjd9X2/VtwBhlWV01EZkKYWVsZut39LOZ8J7nVN+vLklPlNR?=
 =?us-ascii?Q?KwU6IyoT/4xNLyqOa5rqMWc6vRRle/HX5euB9MapMA269sw3cv+iNWjvxbFn?=
 =?us-ascii?Q?Tye1jacY7SemjXb2pw5LdnP5b0XkcVVu4yz6YJrKP3CZb+18v3FUK17nQ3O/?=
 =?us-ascii?Q?a7pn4yYgDOHJ2aiXYVtI5vbuMebdvVr8azmTcUHKBVcYbkO/114XYzvnEETn?=
 =?us-ascii?Q?1S3eZczxyI+SrHNb8E3zNMvliC1CD6bIMyL89ew4cn+I7AiKhPDT2nO/gVGG?=
 =?us-ascii?Q?sX61kd9BrVkzVKmD8Ogfx8S7yx33AE5+lLutbVHR2LhduGMM5ZKF8jyvRorP?=
 =?us-ascii?Q?veZTDrmhbLliUuPphivl4x5dIwvb3QyckpO8UemxebC0ojXyXtyl2jwVgVdV?=
 =?us-ascii?Q?Q9PeDFzkpoIaFfcvMA0aBicfkqahI89g7h2qxLa7yVO7RvCGVHZB9yDyXI25?=
 =?us-ascii?Q?94WRbx2hWNCg5z1dlI4HSm9aSmQZpTmh2GNvIVPOg8BNfXk86hdRV48+wZWR?=
 =?us-ascii?Q?ZnBDSiGJuiVQ/q03juV52UVITXkiU4jbWjWkvbyBALjeyxuL+Z6+l2reyTYR?=
 =?us-ascii?Q?jQq6eFCORCopYdSVPUNFCOO7QMbenXtPnL+BdnZP4/aOhTkSO4LCPH5bdIzB?=
 =?us-ascii?Q?izBgXQwr/6+hNUVsBe9lmMy/jYOgvIiRpUb01p6BIPNwTnshETsN+JNELYtF?=
 =?us-ascii?Q?+m2YmWkrPyqDqyP25Aj74/9HpRXjim0mXakyH+yqw54X80bbAXcF8skQ4Fym?=
 =?us-ascii?Q?Uko5spkSJWfhWFmyy9szLQQifsB0hPV5CL0aN7O3u+ublWpVF2EupYBLNefu?=
 =?us-ascii?Q?R8FbzS8qVSQQzS/NI+pQ62BCDa8GF7bvnyP6npP7cEUsAvULNwnio0IU3r+6?=
 =?us-ascii?Q?1YYJZX4cI5HsIWH43ZF2oJozbXe4OCQJpZhD4GFi/L0/Wzs8yuwdn0Ufy2qf?=
 =?us-ascii?Q?85whpsD9K0ROal8K0XlEwXnJygID6L28pCNC1Y5ZEOmclSn87quxLHAqAPcl?=
 =?us-ascii?Q?ZUk3ypJ36BuVENeWkVJGuxZDuAgfHCNQ034GuPZwAsXo7kqNFmZ/+GSx4m1K?=
 =?us-ascii?Q?MtDukww9L8Ftn5oXSqgGaON2ypqnDGxuQqukj+u8U+c5gW2sMn0QKepCMYka?=
 =?us-ascii?Q?OL59uon+kbJu1ITRQ7spwyefnGnc6DXZ6s5wCUB/R/ClLZ7ZsT81h5ZyYMjg?=
 =?us-ascii?Q?xRGjGDwhJhD6WucDU+7wFHTapX1I1Zm+65C7ebs7oa3/y88tAEB6IjOpFDaG?=
 =?us-ascii?Q?L+iS3yDiG1v60211auROMl9ROrNn6WF6jBs/hVtc69HYKiyRIRRquPq+BxOr?=
 =?us-ascii?Q?OtkhzLNWdRC/db5/2EWm6Gk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e4d3e85-ba83-4a01-f7e8-08dccca86e04
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2024 06:11:35.3097 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZW/QMZl3fABB3uFx/AXmUBJJ3fmw2ViVbBeOcrueBIjrDBlfKqubt5JqyU9Glq1hL+9papZ1SOxoj7OCTid8dMU0tHaVb/ctAIC2Sp8VSMNDUWli/CI+hYWSRIhKSuSx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7309
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

Now we can use new port related functions for port parsing. Use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Acked-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/generic/audio-graph-card2.c | 113 +++++++++++---------------
 1 file changed, 48 insertions(+), 65 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index 051adb5673972..90babed0f02e4 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -234,8 +234,6 @@ enum graph_type {
 #define GRAPH_NODENAME_DPCM	"dpcm"
 #define GRAPH_NODENAME_C2C	"codec2codec"
 
-#define port_to_endpoint(port) of_get_child_by_name(port, "endpoint")
-
 #define ep_to_port(ep)	of_get_parent(ep)
 static struct device_node *port_to_ports(struct device_node *port)
 {
@@ -351,14 +349,9 @@ static struct device_node *graph_get_next_multi_ep(struct device_node **port)
 	 *	port@1 { rep1 };
 	 * };
 	 */
-	do {
-		*port = of_get_next_child(ports, *port);
-		if (!*port)
-			break;
-	} while (!of_node_name_eq(*port, "port"));
-
+	*port = of_graph_get_next_port(ports, *port);
 	if (*port) {
-		ep  = port_to_endpoint(*port);
+		ep  = of_graph_get_next_port_endpoint(*port, NULL);
 		rep = of_graph_get_remote_endpoint(ep);
 	}
 
@@ -530,67 +523,66 @@ static int graph_parse_node_multi_nm(struct snd_soc_dai_link *dai_link,
 	 *	};
 	 * };
 	 */
-	struct device_node *mcpu_ep		= port_to_endpoint(mcpu_port);
-	struct device_node *mcpu_ep_n		= mcpu_ep;
-	struct device_node *mcpu_port_top	= of_get_next_child(port_to_ports(mcpu_port), NULL);
-	struct device_node *mcpu_ep_top		= port_to_endpoint(mcpu_port_top);
+	struct device_node *mcpu_ep		= of_graph_get_next_port_endpoint(mcpu_port, NULL);
+	struct device_node *mcpu_ports		= port_to_ports(mcpu_port);
+	struct device_node *mcpu_port_top	= of_graph_get_next_port(mcpu_ports, NULL);
+	struct device_node *mcpu_ep_top		= of_graph_get_next_port_endpoint(mcpu_port_top, NULL);
 	struct device_node *mcodec_ep_top	= of_graph_get_remote_endpoint(mcpu_ep_top);
 	struct device_node *mcodec_port_top	= ep_to_port(mcodec_ep_top);
 	struct device_node *mcodec_ports	= port_to_ports(mcodec_port_top);
 	int nm_max = max(dai_link->num_cpus, dai_link->num_codecs);
-	int ret = -EINVAL;
+	int ret = 0;
 
-	if (cpu_idx > dai_link->num_cpus)
+	if (cpu_idx > dai_link->num_cpus) {
+		ret = -EINVAL;
 		goto mcpu_err;
+	}
 
-	while (1) {
+	for_each_of_graph_port_endpoint(mcpu_port, mcpu_ep_n) {
 		struct device_node *mcodec_ep_n;
-		struct device_node *mcodec_port_i;
 		struct device_node *mcodec_port;
 		int codec_idx;
 
-		if (*nm_idx > nm_max)
-			break;
+		/* ignore 1st ep which is for element */
+		if (mcpu_ep_n == mcpu_ep)
+			continue;
 
-		mcpu_ep_n = of_get_next_child(mcpu_port, mcpu_ep_n);
-		if (!mcpu_ep_n) {
-			ret = 0;
+		if (*nm_idx > nm_max)
 			break;
-		}
 
 		mcodec_ep_n	= of_graph_get_remote_endpoint(mcpu_ep_n);
 		mcodec_port	= ep_to_port(mcodec_ep_n);
 
-		if (mcodec_ports != port_to_ports(mcodec_port))
+		if (mcodec_ports != port_to_ports(mcodec_port)) {
+			ret = -EINVAL;
 			goto mcpu_err;
+		}
 
 		codec_idx = 0;
-		mcodec_port_i = of_get_next_child(mcodec_ports, NULL);
-		while (1) {
-			if (codec_idx > dai_link->num_codecs)
-				goto mcodec_err;
-
-			mcodec_port_i = of_get_next_child(mcodec_ports, mcodec_port_i);
+		ret = -EINVAL;
+		for_each_of_graph_port(mcodec_ports, mcodec_port_i) {
 
-			if (!mcodec_port_i)
-				goto mcodec_err;
+			/* ignore 1st port which is for pair connection */
+			if (mcodec_port_top == mcodec_port_i)
+				continue;
 
-			if (mcodec_port_i == mcodec_port)
+			if (codec_idx > dai_link->num_codecs)
 				break;
 
+			if (mcodec_port_i == mcodec_port) {
+				dai_link->ch_maps[*nm_idx].cpu	 = cpu_idx;
+				dai_link->ch_maps[*nm_idx].codec = codec_idx;
+
+				(*nm_idx)++;
+				ret = 0;
+				break;
+			}
 			codec_idx++;
 		}
-
-		dai_link->ch_maps[*nm_idx].cpu		= cpu_idx;
-		dai_link->ch_maps[*nm_idx].codec	= codec_idx;
-
-		(*nm_idx)++;
-
-		of_node_put(mcodec_port_i);
-mcodec_err:
 		of_node_put(mcodec_port);
-		of_node_put(mcpu_ep_n);
 		of_node_put(mcodec_ep_n);
+		if (ret < 0)
+			break;
 	}
 mcpu_err:
 	of_node_put(mcpu_ep);
@@ -674,7 +666,7 @@ static int graph_parse_node_single(struct simple_util_priv *priv,
 				   struct device_node *port,
 				   struct link_info *li, int is_cpu)
 {
-	struct device_node *ep = port_to_endpoint(port);
+	struct device_node *ep = of_graph_get_next_port_endpoint(port, NULL);
 	int ret = __graph_parse_node(priv, gtype, ep, li, is_cpu, 0);
 
 	of_node_put(ep);
@@ -769,7 +761,7 @@ static void graph_link_init(struct simple_util_priv *priv,
 		of_node_put(port_cpu);
 		port_cpu = ep_to_port(ep_cpu);
 	} else {
-		ep_cpu = port_to_endpoint(port_cpu);
+		ep_cpu = of_graph_get_next_port_endpoint(port_cpu, NULL);
 	}
 	ports_cpu = port_to_ports(port_cpu);
 
@@ -779,7 +771,7 @@ static void graph_link_init(struct simple_util_priv *priv,
 		of_node_put(port_cpu);
 		port_codec = ep_to_port(ep_codec);
 	} else {
-		ep_codec = port_to_endpoint(port_codec);
+		ep_codec = of_graph_get_next_port_endpoint(port_codec, NULL);
 	}
 	ports_codec = port_to_ports(port_codec);
 
@@ -850,7 +842,7 @@ int audio_graph2_link_normal(struct simple_util_priv *priv,
 			     struct link_info *li)
 {
 	struct device_node *cpu_port = lnk;
-	struct device_node *cpu_ep = port_to_endpoint(cpu_port);
+	struct device_node *cpu_ep = of_graph_get_next_port_endpoint(cpu_port, NULL);
 	struct device_node *codec_port = of_graph_get_remote_port(cpu_ep);
 	int ret;
 
@@ -883,7 +875,7 @@ int audio_graph2_link_dpcm(struct simple_util_priv *priv,
 			   struct device_node *lnk,
 			   struct link_info *li)
 {
-	struct device_node *ep = port_to_endpoint(lnk);
+	struct device_node *ep = of_graph_get_next_port_endpoint(lnk, NULL);
 	struct device_node *rep = of_graph_get_remote_endpoint(ep);
 	struct device_node *cpu_port = NULL;
 	struct device_node *codec_port = NULL;
@@ -1007,7 +999,7 @@ int audio_graph2_link_c2c(struct simple_util_priv *priv,
 	of_node_get(lnk);
 	port0 = lnk;
 	ports = port_to_ports(port0);
-	port1 = of_get_next_child(ports, lnk);
+	port1 = of_graph_get_next_port(ports, port0);
 
 	/*
 	 * Card2 can use original Codec2Codec settings if DT has.
@@ -1037,8 +1029,8 @@ int audio_graph2_link_c2c(struct simple_util_priv *priv,
 		dai_link->num_c2c_params	= 1;
 	}
 
-	ep0 = port_to_endpoint(port0);
-	ep1 = port_to_endpoint(port1);
+	ep0 = of_graph_get_next_port_endpoint(port0, NULL);
+	ep1 = of_graph_get_next_port_endpoint(port1, NULL);
 
 	codec0_port = of_graph_get_remote_port(ep0);
 	codec1_port = of_graph_get_remote_port(ep1);
@@ -1139,21 +1131,12 @@ static int graph_counter(struct device_node *lnk)
 	 */
 	if (graph_lnk_is_multi(lnk)) {
 		struct device_node *ports = port_to_ports(lnk);
-		struct device_node *port = NULL;
-		int cnt = 0;
 
 		/*
 		 * CPU/Codec = N:M case has many endpoints.
 		 * We can't use of_graph_get_endpoint_count() here
 		 */
-		while(1) {
-			port = of_get_next_child(ports, port);
-			if (!port)
-				break;
-			cnt++;
-		}
-
-		return cnt - 1;
+		return of_graph_get_port_count(ports) - 1;
 	}
 	/*
 	 * Single CPU / Codec
@@ -1167,7 +1150,7 @@ static int graph_count_normal(struct simple_util_priv *priv,
 			      struct link_info *li)
 {
 	struct device_node *cpu_port = lnk;
-	struct device_node *cpu_ep = port_to_endpoint(cpu_port);
+	struct device_node *cpu_ep = of_graph_get_next_port_endpoint(cpu_port, NULL);
 	struct device_node *codec_port = of_graph_get_remote_port(cpu_ep);
 
 	/*
@@ -1195,7 +1178,7 @@ static int graph_count_dpcm(struct simple_util_priv *priv,
 			    struct device_node *lnk,
 			    struct link_info *li)
 {
-	struct device_node *ep = port_to_endpoint(lnk);
+	struct device_node *ep = of_graph_get_next_port_endpoint(lnk, NULL);
 	struct device_node *rport = of_graph_get_remote_port(ep);
 
 	/*
@@ -1237,9 +1220,9 @@ static int graph_count_c2c(struct simple_util_priv *priv,
 {
 	struct device_node *ports = port_to_ports(lnk);
 	struct device_node *port0 = lnk;
-	struct device_node *port1 = of_get_next_child(ports, of_node_get(lnk));
-	struct device_node *ep0 = port_to_endpoint(port0);
-	struct device_node *ep1 = port_to_endpoint(port1);
+	struct device_node *port1 = of_graph_get_next_port(ports, of_node_get(port0));
+	struct device_node *ep0 = of_graph_get_next_port_endpoint(port0, NULL);
+	struct device_node *ep1 = of_graph_get_next_port_endpoint(port1, NULL);
 	struct device_node *codec0 = of_graph_get_remote_port(ep0);
 	struct device_node *codec1 = of_graph_get_remote_port(ep1);
 
-- 
2.43.0

