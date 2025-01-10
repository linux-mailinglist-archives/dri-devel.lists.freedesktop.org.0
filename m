Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08AF1A09702
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 17:18:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0927610E069;
	Fri, 10 Jan 2025 16:17:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="WViFJV2O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2050.outbound.protection.outlook.com [40.107.104.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D77110E069
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 16:17:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kHFCnEph/LSa47fEcgE132y6o7bBiYRC722gdFZQH54fYyATCUSFh3iiyVo3onLe1qd2DzqMfQjGEkjMNEUutAWrov/qm0Ry0f5uy1j6/93yFUBXdUcAhDibfJd2wITzIP2Y6Ca29oOA4PmRS2+tvWdPnmplLz8TqP9LuXIPRja6z/98AuCN5EGF1QKVHVYIDqLJGxFo1Tcz89bldXKByCcvnBug2v3z5197Tp4mFjjTUHu8GYWHanyXAldR/CWKVYRDex08ZUq/9LyVxCgJ+G058QHf71EDJbcN4FIQd/se+AijDwkAiUscPLQ2T6geWCItNL49F09ZWPyM9HcwkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yqacPcDHNsxsK1vX2B7MGShUVZ9yNgouunsr+xQtmTE=;
 b=rSebzOfbYBe9jC/lS3lVnw9CMezHazS34IukGnLwF2Teu6C7xd6iZ+GKGu7lCcS/0a6FPEZLeUqB7W4de2C+uq8L+n7s9hkfNjqhqRgyxUQUYn0Z0Qv+ABRAgZsWoZjWm8FM+ZcnIcbufDsCHXp2lxcG3AwlslSx3SUFYsneQSgLzMr8JNhYylPAoSoimPDNpro6WDjK6WeHiy3D0ucprUfOqV2Zc2AvMQKPYhFU5GBAZArdWGBT6eUgjrmnKV0np2dSXy1S3e6CCTML4Us94zRXNf1djgyEm0/KL7Xn6ESpBbAusyfVarp7rgJX2tqhuUbEyubIKI50J/nre8D3yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yqacPcDHNsxsK1vX2B7MGShUVZ9yNgouunsr+xQtmTE=;
 b=WViFJV2O5Eh4vmH9FQbBgS7sBbG5pqOmASro/SrlS41yx96uD2hSNVuc0LF27HeaxKHME59yfiaBT+gkf1as6eTEGV04MK1oFSQm/dym80Ql/+j0sklNQrTzhw3CoaA6FkBCMv+Ys5+kvXotgpu1cwcpG7TtamKRtHphy+2I6TLDwHkcNsbs3S9DtDsFeoBxMOr+QhCAteSSY2Vlp0en8QkOOdkA2a3Kkd3pD/RmzZYcGLBVWEuoOEYGM0BEOuGHsvZbsMY9rftgxDatYcJISDoOnrAhxfIFCqm/L69LdL1SWftfpROu+p9qNrtgtI1fp0v9E0p1vEeZeUNuvTS23w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB9512.eurprd04.prod.outlook.com (2603:10a6:20b:40f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.13; Fri, 10 Jan
 2025 16:17:52 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8335.012; Fri, 10 Jan 2025
 16:17:52 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 =?UTF-8?q?Guido=20G=C3=BAnther?= <agx@sigxcpu.org>,
 Robert Chiras <robert.chiras@nxp.com>,
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS), linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH v2 1/1] dt-bindings: display: nwl-dsi: Allow 'data-lanes'
 property for port@1
Date: Fri, 10 Jan 2025 11:17:32 -0500
Message-Id: <20250110161733.2515332-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0115.namprd05.prod.outlook.com
 (2603:10b6:a03:334::30) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB9512:EE_
X-MS-Office365-Filtering-Correlation-Id: 77564641-6f49-47f3-f887-08dd31925521
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|52116014|7416014|366016|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gPZy18UZvWKH2VB9ftwQGSIoyoKY4P9JuKKFAFXAop8kQc8BymeAFJW4nHGZ?=
 =?us-ascii?Q?yqNm/vBdwuw/eEDOaHLQOikd0Tn+nY/N8S/7Gtm6NIjsqPzuxsVfgpscLmcE?=
 =?us-ascii?Q?wZJnPIwvi3jB6eRhFTaL4hSMMAJ8eT5CotMqGLWD4dFvJ5OhHXwyi8aV+8jP?=
 =?us-ascii?Q?YIUQUc7ezoUC/RMePEIIhKxuTXhfbArI3VUzdj0FnKW28CAgbwkT9trqGuNV?=
 =?us-ascii?Q?K+lhTn6GpTox+6UXcmVXBTWMOhfsHzGSonDDb6RZXyo4NFaEI+SPfJN+Thgr?=
 =?us-ascii?Q?DCBU3i9jkpbIdO+03AguwziNHNNkRLboO/OnJza8dV5phuKtrczffZSVoUyW?=
 =?us-ascii?Q?znrcSpwlfFDxDFJoFmQnV4U4dof0qr3/vwhBZhPC7Rb/idQX93LDC3Iv9/sr?=
 =?us-ascii?Q?eC+1Jsx3YYj9AQQceq1cvn56wxQITF4c9B0a5Gv3cjxsESwvedur4EXdEcPz?=
 =?us-ascii?Q?dj38gwSjaIOBBEUFKXCEYQhJVhQtw9dW28j4W7IaIvoJaGZptpNFemhMgZAn?=
 =?us-ascii?Q?QxP4LXE8SAkFFyvJXNTEDgH3rllT1mWYFQFRNAtjgLlcn0mC/9yh4Ci5W/pA?=
 =?us-ascii?Q?RFv+80yY4yEBhPOG9Gvh+xc37MBh4TM7F3EfUtR7SV07oAX6a9cqf96Zg4Vz?=
 =?us-ascii?Q?MG1JwG4dKU3r6kDnOKWArbW3r4hxcfeuf1d6xFxk2zVIx1TBaFel4SbEVxn9?=
 =?us-ascii?Q?Fpv0q4MNAd3lLNPYKQJmWQhcTipkVC82zUHfqFTzHS7FQECFUPPSg3GtAQ0H?=
 =?us-ascii?Q?kQTS7g4RwHb9leJjEu92vQiH9R6dSvLkscGFBeY76z5ZXIcyxRf7kguPbSgP?=
 =?us-ascii?Q?JMHNuG9Hq6x0fQGIiWJF+6qz0VEWvCWb+n4MwuWHaxq6jOoub8hHVT2cTJoo?=
 =?us-ascii?Q?ikccI2jS3DsXZ+xE9i4Gfjg5O22FQMM1hpX8ckCXgZddbDK3vpuHmCu32dRX?=
 =?us-ascii?Q?JpVSBVkDCpv+6WOwm7KanShRjCHpA0+jGxO7p8c7vh3kMI7m1A3Rz32ncWq+?=
 =?us-ascii?Q?8DKjmHI5Yevu4JQVQWjlk5fnsEOrtULfNa1+R6TEOzVgNv/Y0ir7BiVZddKO?=
 =?us-ascii?Q?FISmt2SiGEfY1qypbxIx2RY8RuXCZ13c68OQlnQefG0ZbNN3owijypZB17V+?=
 =?us-ascii?Q?pQMPQXxrTx1tT345XTxZQOTvboDmWgwiNho0Fbs0wWFQ98dlmmgih4aUfQwB?=
 =?us-ascii?Q?XdvCOJ5w2ArWXljDOLZwM/wdQuZvi/QrczIHm9gIYkFh708dJ8tQI8h5voi6?=
 =?us-ascii?Q?78H30oRN+14RG/ApC4OuNQvDMWFuhjJ4uwTSESEpDCHl+qBjuLtUZ0nPlErm?=
 =?us-ascii?Q?YA7pSxR0sFdhvZLmsinZZ+Og/ACCAT3Dp+yvWvtzLXXqimNRP7GO1nEuT061?=
 =?us-ascii?Q?ejKo/hF9ycBdPd9466YtqSq0RL9/cKpuXFCFt0PXad7wbJEmstGYetJlxJXp?=
 =?us-ascii?Q?l06wePbfktH1AV4/ITsDNLQ7TTquXn3DAy1LsRXc2EJO10B33Uv1gA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9642.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(52116014)(7416014)(366016)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tEDs8KLHOIXSZsYeJdgVehhNr7Wmuz+e4sWB3MDEPh/uNIX1HPH1+qaH1Qxk?=
 =?us-ascii?Q?BWfzzRpVQ9eohKT18yw9i2o5XCDv+Hm9HB7jq+EeVVq4WrAumuQc67eQpCl1?=
 =?us-ascii?Q?8zD3C5pS3S+eU+nVY7Jyx7wl+HbUU5doILDCUwan+UWPgzSBAe6+wLV+jnQQ?=
 =?us-ascii?Q?LegadwPLz07wC7ozR9I9oZ18ldm1WDr6AsFp52C+5hqFEHT3CPHHz+IdGcHg?=
 =?us-ascii?Q?Dn46l7cuZYd1IxwO1urvFq+4JGK+MMFO9l6RQLZdiJLD1gVAFRLs2hwv7etG?=
 =?us-ascii?Q?xPMLL9nDUspaFvor+Fd2Jd12XNDj2Z3eYE0WNnDJ0oZGvjL1hLk5l36OLpak?=
 =?us-ascii?Q?VYJrkEyzbdhjYUL4CsjtlkkKiyuzdbKRVUl7eDXhpGcJdwHVf+ygp5874dcF?=
 =?us-ascii?Q?IxThJQvuT6D1NuusFaEkcPNBPrk774KF7OF0hoSjQUULNxoFwfyiePP7BP5v?=
 =?us-ascii?Q?i/+vxXFzDiPck/ExLu4exYB1uvZ/ruXmOlo2X1Oq48KSQ7KQchCxoom/c4qa?=
 =?us-ascii?Q?6TDVFA6u1RGhlPTfuoKogbN0ZjmTvk4VFexMjIih+hlpLz5NieL7ec8Vu0zD?=
 =?us-ascii?Q?o1+QdU8DEubzW0StCb96HwA9+T3bzrIVYUXHa+SyAArU64rD7p/Dc1H+BBSW?=
 =?us-ascii?Q?53yiHetseSJRn7zt6IVTv20EvWiwx7occw0YqXOMTHAjGtYaYBmVGnVL2lop?=
 =?us-ascii?Q?3UashQV91RruRQkKNLK5dr9D5Iycf7k6WlJ/yrsnIZvQQC9GNV9XOCm2z9dw?=
 =?us-ascii?Q?U3D4K4GNSL1y8UA+a6CJw0wffISBGjt8WTitETntge3+Qxylzy9s48rP+9mV?=
 =?us-ascii?Q?fo+IyVbY1YOx6otSWXvxgu6qtBQi64fupb4pJmzuSSAm6essBNcfIiK5930P?=
 =?us-ascii?Q?5+Sx+zLLUp9vCHfF77b1HtQKsbOEv62tVVthjrLWyl6OaunYMKVyc+tQYA++?=
 =?us-ascii?Q?IYEvCUTpWi0LqX+54TFYmBBPRcyizXYFQsZ7RAMgoJ8CGkW+Q4MGkNYgyk8O?=
 =?us-ascii?Q?TsV7fx+nMpfWioaokXxmB3M9wBN9Cuh9BYIxiWOCMM5A1GZuAJBMHFv5IY+I?=
 =?us-ascii?Q?MyD56kFR6qxxHGkH43dfP/BtBsXnTQkiEIyNpzXNtD75zZUKmDbnpB1SkyCh?=
 =?us-ascii?Q?CIhWUBzql1WFD666aU6pmANERrb2NgAtGARzP/XJsdWnm5+UQXpQw8LeqbHe?=
 =?us-ascii?Q?3tgSVg0Kd+oDWqrnbzc7adoTu3g1CTKsJVY2mDjnhO30/b9ad/C3iduhj19k?=
 =?us-ascii?Q?ifaLMO8LOAOmlPd463YUJVW1N1p/JqDX4TUfGka0YcwW7R7b8mOEqxzJ8ugB?=
 =?us-ascii?Q?fUTGbkBKpHKFAwoGYueOCRhN3y8ABAc+mfHZWyhqMWJLKQCPmKeUkaabjDgi?=
 =?us-ascii?Q?GlJKS16CUWxCmtX+rSouqc1g4PvxjufWjF7JYVQ+0Ld0WNLBjIQfN0jJI9rC?=
 =?us-ascii?Q?b+i80gGFopW9RkJZxyGy/Zhs3J7JVKkrt2Q4W2S+/14jcfqLHz5tKzQt9dva?=
 =?us-ascii?Q?Wk7knDqOBfJZFdtxPaDvHP3OeSOl966tGnLYLS/edVkdLV3x7vWxdRkDSSaw?=
 =?us-ascii?Q?ONpXuqqSsq3ydzM3a9hhV1no5uzQ2M5yCfPqTF3o?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77564641-6f49-47f3-f887-08dd31925521
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 16:17:52.1216 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: esTwWeHGFVZQGa39FvELmqjKjAJpD8RnY/1suS4yKC+jCrlVfYbCs/eYQwrT2+TZH1IUC1/4NNcUL57OQo+YYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9512
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

This controller support scalable data lanes from 1 to 4. Add the
'data-lanes' property to configure the number of MIPI display panel lanes
selected for boards.

Change $ref of port@1 from 'port' to 'port-base' and add 'endpoint'
property referencing video-interfaces.yaml. Allow 'data-lanes' values
1, 2, 3, and 4 for port@1.

Fix below CHECK_DTB warnings:
arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33.dtb:
 dsi@30a00000: ports:port@1:endpoint: Unevaluated properties are not allowed ('data-lanes' was unexpected)

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Change from v1 to v2
- Add the reason why need 'data-lanes' property in commit message.
---
 .../bindings/display/bridge/nwl-dsi.yaml       | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml b/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml
index 350fb8f400f02..5952e6448ed47 100644
--- a/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml
@@ -111,11 +111,27 @@ properties:
         unevaluatedProperties: false
 
       port@1:
-        $ref: /schemas/graph.yaml#/properties/port
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
         description:
           DSI output port node to the panel or the next bridge
           in the chain
 
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              data-lanes:
+                description: array of physical DSI data lane indexes.
+                minItems: 1
+                items:
+                  - const: 1
+                  - const: 2
+                  - const: 3
+                  - const: 4
+
     required:
       - port@0
       - port@1
-- 
2.34.1

