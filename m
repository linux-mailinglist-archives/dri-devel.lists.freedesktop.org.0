Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5358889DB
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 04:05:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E25A10E569;
	Mon, 25 Mar 2024 03:05:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="Fdf+420F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2080.outbound.protection.outlook.com [40.107.113.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C962C10E527
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 03:05:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FoEhlIEM7Bi1p+Tf+VtdVhuT+X0s3Tq802/1Fywo/qTpyAKvmA/pqVugj6cvaDpb89rQA0RCSntBctdw/5/CYBcfMiIxCWPUB8AjPPTVmNNjMj5M3y09ZD3MxnzvJz7rI6TM3UjGSIETe4L8Ge8VjcDW/HZ/zB6qWhGcpYDFgEG9dlFFL2xKVtOd2WiW3fzXyql29fUm/dLgz0sb93nAzJoQlhFWyz+MCRgaqG8MmHHeEWN8m7KfXrX64tbNr7bFUuco7yzQucCX901h924Y+aT3x56cyzxonKxkTYchNB+wX9yGb4z6C6/yA3x4FwURbP+owo1W5dtu1eZVnuLYEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0jldO+sU+/sBHPSf1MLXLnSJ7p7Zlxtt6VMOzEH9xjg=;
 b=VwDG0/k7Qd0P3xL8up+6a4jaIkdVY0RHMlzvlaNzftWDR6KWlQJpEhkTAZOWGv/kNCMUdrVRm9kGHJcab4bRGQnasqZ/4jLQhheMx072ZewRH3oAy7ktbT7fJ1e0H2Q35Xqz+2CtShLA/OQps2Bz1dJeEEW24u3w0w+l1ql2eAn1gTl152YqkxWGQ72aJbOK2gUxTbJqt2/86+XVHj/6xCLOxlgrrFwsDgi46lSRbQ/zrUS0nwXm4bctvDBU4C2Qwl5YUWpsgjA3OuHrrXpAh/Fuj/hn6jPvmypbaVhT6y141NoIOw05+y04UP9LH3RzYi/xayU/1TTStyvAAT+AjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0jldO+sU+/sBHPSf1MLXLnSJ7p7Zlxtt6VMOzEH9xjg=;
 b=Fdf+420Fw4hVxhJ12MoYocKrzHL5DHz1qhjKa1bi4m2lrESo+inTYH0uebiJHn8/FY6yqFyhfSONuxxtgUU6g61OvVe5ybUCEGCAVoRsbyaVPwbkLjXSzWTV3mpQi3Q4WTqh3jv3bo3R9berbUENdtnCBDbjepbasPi4Jz9pof8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB6966.jpnprd01.prod.outlook.com
 (2603:1096:604:12d::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Mon, 25 Mar
 2024 03:05:33 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7386.025; Mon, 25 Mar 2024
 03:05:33 +0000
Message-ID: <87v85b57uq.wl-kuninori.morimoto.gx@renesas.com>
To: "Lad,  Prabhakar" <prabhakar.csengg@gmail.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Eugen Hristev <eugen.hristev@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Helge Deller <deller@gmx.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Rob Herring <robh+dt@kernel.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 coresight@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 linux-media@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-staging@lists.linux.dev
In-Reply-To: <8734sf6mgn.wl-kuninori.morimoto.gx@renesas.com>
References: <8734sf6mgn.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 5/8] media: platform: xilinx: use for_each_endpoint_of_node()
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 25 Mar 2024 03:05:33 +0000
X-ClientProxiedBy: TY2PR02CA0005.apcprd02.prod.outlook.com
 (2603:1096:404:56::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB6966:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e8aa0c9-b7e7-4fbb-ad4d-08dc4c786feb
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q9TFfRUd8bcsRopJQ0+QzclCZZS1q2PQBTCqEbcQBw0r7v/EHGS97ZVreVq2BltMv7sMxeR73+fkvH6cfF1+B6T5zuiv9sxLahoTolnIj4VcdatqJDH3upLMytBI3QQe5pbQKUtdfu+JD3o1JU51NeaWJ5PcrBJigPkY1GNdVPAENs+y77hBRP+ioCW1TWmrD1QcMbsDeIbfYuKFpZygSlGLx24jVeuB2hhdCSXVxOfKW+pYlQvHP7VrADQ89Ezdv91Zl2PJlmV/QX0jzFnU+oBOg+keKQ3G+fnD+VRSNY5ey60SiNkJmMPDIDRrvPzVptKRoxqVNztqwqcYur3NFlky2gXABLYjO42qL8fouO8FiuS9/ufofyGXlin+mZbaG4fWbQ15/SXD7gJIXXc4HeYShdbhMlHrBaSJhoy6+HGKFImg4+/5KFuIbqe4+dDq/acQXrPjd+xNWbUZrOlFkYSeh3CgdZ9u4nKvgPCFMZSFEK9zPDr6pP+gUiJwrCGm/AnosKTLovcE1aD1Qc8u4x6lPcJUa/xULFHTM4v09RliqHPEXiFOxjS7SAtXvMWsKOY3x6W6CUi3szhdo5Pq+2jMdCWuEbhQEuD7L08ZeR7KsfWyXrsHylgB8fnQMAK3E+kWDYxvlQUCI3l8M+VuSxfSLgHUcagoKMVWqz1ojnocT8AwUqFoSd/N1aPbbP+6aYrKbcL32g5H/M+9ZkNjJXvDtpwjn/8HZx860VMEOYU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(52116005)(7416005)(366007)(376005)(38350700005)(921011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AvNsMx8CCQfL/9zKf2AUa9lrY9tEpx4S9F9twGYPgxSZLulk976NLOteAjBj?=
 =?us-ascii?Q?iRQ3Tk4Zx5vkFt5VE4BSFTDPs/v+A6sqPhobtR0qClxp07F81AgMYv0z6kTq?=
 =?us-ascii?Q?CgOgZLqFVU1q+2CJhoo/mjdwDWzqVXLQMqwZ64/4nR43nZaYAw86l3ZEj4pn?=
 =?us-ascii?Q?H//KuEt4rkHAij1ewdhpX6Gnz09/CJTSaVKE5WAtbZGx+wTxbz8yLfQOijNb?=
 =?us-ascii?Q?e3vAixhUoQa3wkiE5DtOw/hAwYt4US76VC+ViQ6cjkrtw2zs4MNzE4lhJ4He?=
 =?us-ascii?Q?PAqjqKGCMvpDxMKRdqUhkoRJIXGBGsEtA+2zgATZmw6xUu/JP+prE8BeN7Vm?=
 =?us-ascii?Q?pQl4VTAUrvLwNRLKPD5yYxZDwioFQXIOl2qHxuYwwZNJEWyoZDpcq1jrhaFg?=
 =?us-ascii?Q?gV4PHriA8AXOZdh/m6YWwZ7FMgTCfkVtIXkbZr6twuJQmFiHDzk6MtCiMgAq?=
 =?us-ascii?Q?GwAMpz83ABTm5ua5vl3B4kJTHccuJCN2XlX558FJBePHPfR+eEVuemdXpO+x?=
 =?us-ascii?Q?yo9hzbp24gJ4lv98GtQgmbn7UFp6+HeB2uOn9+DZCooJwA7uROA3klgRKj7F?=
 =?us-ascii?Q?V+D4OUVOqS0/QMmqsHaicLLQJy0Qqq0/HCF9uyROeB1h5t7Zwgbr+0T8f1Ro?=
 =?us-ascii?Q?zV7HaaqRY/TmcnNAEU1SLzyWv6ceCh1IC/6aXt1kNCYL37P6WHxN8KK29S95?=
 =?us-ascii?Q?u8iO2zyl/HGfizaHabKxqGRBm9/lpVGGQejIthIgV6LvhKwelcGFmoPT1Ivd?=
 =?us-ascii?Q?2lGI3mqmGSRy7i3gZrCkfhewGNniq06iMQqcQAppv02A+QO87U4M0LogT7H7?=
 =?us-ascii?Q?OwyNqMbxe/ecRXRCPOY0e7zeldW3suWctqAlXbeJn9oazvvE9cve+ELZrvef?=
 =?us-ascii?Q?AL+mooIRqXN3B+zUmV19PrCCw+nV/Xt77R6UKf2KBrc4G7FZ7ueumuVd76ko?=
 =?us-ascii?Q?cHMyRaakwudFrKAchnHKSOmLRFLbHq3iWaqsN6JbHbE2tDJJNmo3PGBGFKPf?=
 =?us-ascii?Q?birqdY7+SKuURLTT0+zDxonndUCQpEtaznEu8qjM6iEOOPi3GHhnPViPl9tM?=
 =?us-ascii?Q?jRE7ie/ZOFChsJJkuRnEB1+w63Lxb1LKAunz81AWCWl2KVgdaA+i6tnQZPy5?=
 =?us-ascii?Q?fdoexyGgmM2BHkjuP4mZ9oV93qAa7pdbBTS6mLHMgd8kNo5UeB5CrPBcvNuo?=
 =?us-ascii?Q?KOBLDMhsOfPszOi/epS0IwByRhmZAYw70o4jYvW7iXiuhC+FZ3zonArC++jt?=
 =?us-ascii?Q?mqcfZQzSbq4tfjr85PibQseapYtjwSDyy7fYcyy+7pbhppaq2cueDm9p16UH?=
 =?us-ascii?Q?6bUSsWiseOKLl3pmTONLqXaVW0um4yYsZeghHx12tkGVb+gUWY7ojbYar579?=
 =?us-ascii?Q?rHXgibJkwVkBpfHgzpUDFEGqyfzdl0DryQQig29ErKeAQuNw3NPX66DKVkad?=
 =?us-ascii?Q?SR1bzLQI6QYc9C4lwX4x5fn1cHGMd7QqlQvYvBBlFL4qDJyHyq7NA9OljubP?=
 =?us-ascii?Q?cik7848o/vUWfYuODTO38unb0Xp8ZBtVpNkPTIDXYLk1KE2vnVRrN+eCkpaq?=
 =?us-ascii?Q?kFXolxLFn8yCr6Y+4Lz0n6apILeaHMtyq9idA14+mq31OlfrKQ8xJOCdL4LN?=
 =?us-ascii?Q?Q08kJk66NOkYnAgnsEUB75I=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e8aa0c9-b7e7-4fbb-ad4d-08dc4c786feb
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2024 03:05:33.7873 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DgbqdvdV3tfIuu7ifp4+cGCTQXyJwQCVXbWEXRhr3okgR5HFEoNN2pWMcJl8tbGHywOL3AVAXXY7p5IykQshiuCHlso+pyqgu99GG5Ts5l/BdmGE2v8gy/EzvMMP6Y2l
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6966
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
---
 drivers/media/platform/xilinx/xilinx-vipp.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/media/platform/xilinx/xilinx-vipp.c b/drivers/media/platform/xilinx/xilinx-vipp.c
index 996684a73038..38818b82a575 100644
--- a/drivers/media/platform/xilinx/xilinx-vipp.c
+++ b/drivers/media/platform/xilinx/xilinx-vipp.c
@@ -205,12 +205,7 @@ static int xvip_graph_build_dma(struct xvip_composite_device *xdev)
 
 	dev_dbg(xdev->dev, "creating links for DMA engines\n");
 
-	while (1) {
-		/* Get the next endpoint and parse its link. */
-		ep = of_graph_get_next_endpoint(node, ep);
-		if (ep == NULL)
-			break;
-
+	for_each_endpoint_of_node(node, ep) {
 		dev_dbg(xdev->dev, "processing endpoint %pOF\n", ep);
 
 		ret = v4l2_fwnode_parse_link(of_fwnode_handle(ep), &link);
-- 
2.25.1

