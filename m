Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0499A5ABA
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 08:47:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6578210E415;
	Mon, 21 Oct 2024 06:47:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="MqdJ45cO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2080.outbound.protection.outlook.com [40.107.241.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67DC810E416
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 06:47:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zgpw8bEDFk1E8XQ0DdR/p9DEfV9rZZQ3xAjzaFVfh0xaWN3UMN9rQDYDLJKAjTbEbl1dZIZQkaU0U2wC7nExr5VaEzijRXgRHBwKRhSDgKcK9nzuH7+OSgg0injqyjVMnY5bXPVUQIoB53vD+poWtDd/VApQ8OsIid6vXDaT8rf1KOrCvAVL5W8ey+EoRfCdbXvgSOznKNNeGQLMpIpslJg8C9AlNQoon90HxTyuo11wyWlTXwHNHJHlMZzJkiKm4HlUwxEn9WmYCXZgz1Ng+lWyggm1G4Rp3XQf3d/f7zzBgzA21NRWMIcMF0KwdWLKCgC4OHIYuyQYLWVSnl5Keg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4wUFT1LW2LIr0aARsL/CecqQcdSy+5ylxKXBMD5MyGE=;
 b=b+0OSzxRQ8K+zI9Q+UjsQIENEjje23jlGZy1bi+BnpjrDvAEI1hbHbLIGG6AYjVvF9IplbxPTYYLLXwQyMN2e9nnxCztR1PoIvMKFjiDmKo9tRX2h8a19MuxRPxbBvM7LvR/3V+HC5oxry4mnWpR1b1Zm7AlgkGCejU1nCars75EqSFxeGNTk+eN5wmf+KU9Dkq8IxGWZDR0Kfs93/BqiI+5kXNFFD4fHX4MkR6QDCWzC3rE0lGpNHRQfByEv+X7i89ugv9vYlRG8gV6od9fGAhDVDSBXu1r8wI14SxTHO5hC51jY/C5KpbJMgmokCUQk8pP7dI+5mdc04RKGgJT+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4wUFT1LW2LIr0aARsL/CecqQcdSy+5ylxKXBMD5MyGE=;
 b=MqdJ45cOIQyoPoepIlVE+ijvv3XUVG7/KjRoIUPj6cK/ckTfgq4bLC4tTudJNJGwLvwMH0O08OcJOlOMTXX672iNKJ6qpvjSZvyZUyKfySNfnrjIGUWqD9g4EtiHWZoA+TSX918YSYr7ELdyHGcEwMbX1sGiES2+Iksz90O3Vtr+a6jdztgd7I8XqSDSS6msZiVoDeQG1+z+n6BUYvPLTALkt+FexdrdQzq0oHQDefS4FxXXA0MDGdIoJQVtkJwzpi3++vdcFbeUVqPEXrevc8V3jm8/IPJ7yVJCilgO6d0W4vJSMAl5tmhsGG9WfA2sHIuHAHACFcQeUZlwzyAecg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM9PR04MB8440.eurprd04.prod.outlook.com (2603:10a6:20b:3df::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.21; Mon, 21 Oct
 2024 06:47:06 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8069.027; Mon, 21 Oct 2024
 06:47:06 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 quic_jesszhan@quicinc.com, mchehab@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 catalin.marinas@arm.com, will@kernel.org, sakari.ailus@linux.intel.com,
 hverkuil@xs4all.nl, tomi.valkeinen@ideasonboard.com,
 quic_bjorande@quicinc.com, geert+renesas@glider.be,
 dmitry.baryshkov@linaro.org, arnd@arndb.de, nfraprado@collabora.com,
 thierry.reding@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 sam@ravnborg.org, marex@denx.de, biju.das.jz@bp.renesas.com
Subject: [PATCH v3 10/15] dt-bindings: display: advantech,
 idk-2121wr: Reference lvds-dual-ports.yaml
Date: Mon, 21 Oct 2024 14:44:41 +0800
Message-Id: <20241021064446.263619-11-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241021064446.263619-1-victor.liu@nxp.com>
References: <20241021064446.263619-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0111.apcprd03.prod.outlook.com
 (2603:1096:4:91::15) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM9PR04MB8440:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c0ae607-936e-4588-9f5a-08dcf19c2dcc
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|1800799024|366016|7416014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9pG4HosxCoXFMjmydJPSC89HV3qcXQOHojjv4OmfWlisICZEINgUvWwX9uMi?=
 =?us-ascii?Q?tc+w+ZGNUTeRmiVZXq+4FFFU/SlFn2u4q1Klja88BZiI9i1Hyd9b19nrk3/K?=
 =?us-ascii?Q?7K4sjWsb/Efm+QWyDTIvP8kHFoFkMZMHA5p751amtzFMiqbLBBFtyiSkbA5a?=
 =?us-ascii?Q?dmBSgE5GKzWesq89TVqDwAWbjoDbECCOQYB+C5uLg/W0+00ONZPWOR0lyoCy?=
 =?us-ascii?Q?MiGCQAkelyNPz1GkV9X+I3VdG9ROsw74P00DSaTvRJuQpd5BirYNCcIXlrd4?=
 =?us-ascii?Q?bu9i9X7sF3gfsWyx0lDDgPikhAyC0mVIBcNj30+ojIe4o8E+bVZt3nS4PUHr?=
 =?us-ascii?Q?cdYK2gkzAkCIuc3iznVuDSmdVCshASBEixOgPh/IZrt7g6G+fYCpWwVjHKq/?=
 =?us-ascii?Q?mTxhddmN3JbZoGCBWVF+ckRfgsSjIb3fr2U4NMPHpfKA8VOAK/1e+h/xiNuF?=
 =?us-ascii?Q?Tnt6zJshtwCDhUiJdQrxLnKjDCmzYqzAU5Fg69+tVwd+8u4J8EvhWb8gnNPR?=
 =?us-ascii?Q?Wacf5cpRdO6B2FEs89SU3y6ROwCwhgtvIc+cImeRvcPupVrQCyICGf2lNm0x?=
 =?us-ascii?Q?IDMyr0XcxiSEGk74dpTpDAwXkarOQEYjSVRnbIlD69iGZn+CevNhaW40VUR7?=
 =?us-ascii?Q?83HqS94cAXCOIM+S5uP1UOOxPx8L63f+LnfAWvkOYsX/dQip7ODRWF+lWegk?=
 =?us-ascii?Q?T2oZj9KyNIPCwNv+0SZ2xJVpZB7aP+GA4w6zW1pHnhZVCJ/mbfqX9mAACZ5/?=
 =?us-ascii?Q?OaGLNH9yw4RurJeN0TccLkaMxjd0AiEmbffV3TEENdD7Sxh4jKNpH7zYA5BE?=
 =?us-ascii?Q?PGgk3rRT5RRF2eFZQ2H7wm/ZPib+4ZmOvG4puYGoU5oQvu6AqbtyX81ln4Y9?=
 =?us-ascii?Q?twaPnM1EptePaFXY/okcO0oyx16tvSs7o0zQgWXRv+UepIclscWLht8JaQJ5?=
 =?us-ascii?Q?aestmMUZAWDgU2KzTPPA/hcnLdVtttrwnN0NJYRabntBhiHGYcPJzWRaWAzD?=
 =?us-ascii?Q?yd6hzp6eHpZoFGp6UioFz2SjRQtAa5nBuDSs++Ib2YHFpZNpoN6C53163Vfl?=
 =?us-ascii?Q?YsBXGh/5ZJLzMo5eIOeqPqlg7ZHO2i2YnQJ1ruBbWZ+lqPKEQsO7rzVAQHlM?=
 =?us-ascii?Q?nrmykf4v2BVJu3ImorKZyObS0zeI/SN2RXUb9htsw5iG3kvfzzY38Cnhtu7j?=
 =?us-ascii?Q?E4mJ3gu2+IsYxPGy1BvB+FAZLk9dSjkQpVjmrkOoknf3WiQqWvX0kfCVBYA4?=
 =?us-ascii?Q?7oW8OVxE/NgiGYgwJ84IsVJGWyqLM3VdjHt8xT5EcDVvowKS6z2U1x47lf7p?=
 =?us-ascii?Q?UPXSHrkGZeuTL3SZQAwK0dRc9C4IXJ9LQjOU5JTDWwbCV/tQSPaxRiTsPFUt?=
 =?us-ascii?Q?MXe/d+g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(1800799024)(366016)(7416014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4038T0P+19/PQSxwWh9iiQ6CA67BcR8mZ8QKc6p6S1h4vcTzYFilaFuId/Ll?=
 =?us-ascii?Q?qDtJcKsQOrkkxZs73cwi1Ni/aKuthenmn+Ao4FWphh19+hB230szGEX6JDJ7?=
 =?us-ascii?Q?eYD+NC3YiSb9oTqPTIM9qF3nq1Ir+UfFt4kD11xE4dDmVwgg9HcdZ9mgZduM?=
 =?us-ascii?Q?6uc/QThYyvjB2oPLkI80wj+7QYr7uYGtNq9MS/tgccK2WoDe4C7sEMBe9RSU?=
 =?us-ascii?Q?oNNwnlp2R0CG1rl3iSK3AsVsZ9c6/eMXCqol2Q/KK84pkRby93YTjDmNeJix?=
 =?us-ascii?Q?z3hgX7js+6rjWxKd5x7/5i8FLz3B/fgFs5wbf1F9XLefhLk5IJM/KR2RIJfV?=
 =?us-ascii?Q?1bSwBzGwxGMh/WDd/dzVV21nPzAB0xsenwf62dUOFS/bCyLkaWzGGo4kR9/Q?=
 =?us-ascii?Q?KuT3PjPW9hCny9eWckROIYS4U4l9zuKX+sXP1qVjPG6jWeS1aXScwrcoGBNZ?=
 =?us-ascii?Q?U3u2OewK7YPLbzXXdz9mS7kDIftDA1itxHZKUWExpy4jMpuK1Ne45EJz8GcA?=
 =?us-ascii?Q?BpQFz7pBAw8qsbydq1hpKisY4MSMPrlae36/fSb7YeNkon1wHRhjdo3yeHlg?=
 =?us-ascii?Q?DQOVpm9cJVIXjib6ia/ZwQ4oHMU8Zx7EvNFqMb3qix4M1jtCuYNI45pBuwy3?=
 =?us-ascii?Q?cA8/9F62+KEFd5dxix/4R6yEZ26DVAu0S8I1bfr5nkmzBaz0B3HAG5ed8+zC?=
 =?us-ascii?Q?vs6q1LbYtPj6QnU9L4EcH0vAccW8+CWkcCjxaeoV+IanGKF3m/P6h3xPQExn?=
 =?us-ascii?Q?zfL/e3ZQbXM2baOfwGwbtFKZkbMW7OWfL40t0kGfQLH4J0aWaYb/Zzpl97nU?=
 =?us-ascii?Q?CuvVl3ZF7j3tJVuW0/GMaxJWX6iIVJ0/ya2tXdxNv0xxhncJPqXpwoAcF36a?=
 =?us-ascii?Q?vVhKqE335uUa4ay8Wdq+lDljN4yeSMW0HAkSFI91kiWgXMpi8OLbbKHZ/8mM?=
 =?us-ascii?Q?0GhHDzRhJWh6ShiOHr0Ccx2kqO9P+RfUZT+mbCkM7pIY6GP7GNeGYUatWlty?=
 =?us-ascii?Q?dMYuZqUv0blroV04Xei0kIB5RuGxPjWy3nH7Yrr2kPaUEESdHC22CH7PRvkB?=
 =?us-ascii?Q?oKJY0N1fDR04vbpw18bMzWkb3ZgSketSCx60m7hxCEIzc7MKa5pHJwxPHJgn?=
 =?us-ascii?Q?KWzQvT88eHAl2vQDWfEA8Nonv29WHXuE3S77orAL4chV+rfvK9ytej5rbZax?=
 =?us-ascii?Q?ZTNnZtp3f39Ay5ovK/CJC0mKaB7iIX5CaVB5EcB3o1m3IXV3oWWBvZjuGAi4?=
 =?us-ascii?Q?5kEoVhFG9c6kH0rIrOjJHYNiEUKiDx7lRpcjZdDD+lpkM8y0F1ZHPLXlrMII?=
 =?us-ascii?Q?90ePpIveBn8yukK+AYVPNRjkaRuuU71vnQKOxJp3EgYD7DAYBhvPiUck4yii?=
 =?us-ascii?Q?VffTdfqj+wceLwYS3up8IXFpRsYaGqQAUMvFZ7lAaqHTSuFRRD8alVDiSBd/?=
 =?us-ascii?Q?G6AwbuI0r41oZwUtrWUYl/8O5WanI7XVXyqp9FXKHCUBTYLuxoyD5lqOPZGA?=
 =?us-ascii?Q?4AElNMJlwoSj+2lopSlmWL3dlcf6cpasMpsWVf1tSWIlkIhIQ6HjForZ+ca2?=
 =?us-ascii?Q?AZbpW4cVwee5w2oqQpPmPuhQmEXtvA2FDVxKu3kv?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c0ae607-936e-4588-9f5a-08dcf19c2dcc
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 06:47:06.7879 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IxDZZ8yTX+0mCyJ6sQukVaFtTZ00MIbQuXGYsmzLMRicHutNkJtq+Du3630e+FnOPiKAdq2pscbwCH8bmz32wQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8440
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

"advantech,idk-2121wr" panel is a dual-link LVDS display device.
lvds-dual-ports.yaml documents dual-link LVDS display common properties.
Reference the ports property defined in lvds-dual-ports.yaml to save lines.

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v3:
* New patch.  (Dmitry)

 .../display/panel/advantech,idk-2121wr.yaml        | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml b/Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml
index 2e8dbdb5a3d5..05ca3b2385f8 100644
--- a/Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml
+++ b/Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml
@@ -20,6 +20,7 @@ description: |
   dual-lvds-odd-pixels or dual-lvds-even-pixels).
 
 allOf:
+  - $ref: /schemas/display/lvds-dual-ports.yaml#
   - $ref: panel-common.yaml#
 
 properties:
@@ -44,22 +45,10 @@ properties:
 
     properties:
       port@0:
-        $ref: /schemas/graph.yaml#/$defs/port-base
-        unevaluatedProperties: false
-        description: The sink for odd pixels.
-        properties:
-          dual-lvds-odd-pixels: true
-
         required:
           - dual-lvds-odd-pixels
 
       port@1:
-        $ref: /schemas/graph.yaml#/$defs/port-base
-        unevaluatedProperties: false
-        description: The sink for even pixels.
-        properties:
-          dual-lvds-even-pixels: true
-
         required:
           - dual-lvds-even-pixels
 
@@ -75,7 +64,6 @@ required:
   - height-mm
   - data-mapping
   - panel-timing
-  - ports
 
 examples:
   - |+
-- 
2.34.1

