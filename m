Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0A69B8443
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2024 21:20:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E486B10E42F;
	Thu, 31 Oct 2024 20:20:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="MBIp9phN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2042.outbound.protection.outlook.com [40.107.247.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5D4510E42F
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 20:20:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MtZDJz+pm9vXXkNISLrADkyW2lmaP+rNS/kaTXMykJx4GD3cxCB1u9a2w8jwkCoh+NGyTKTla8IytSbOJ030/ItH31wdNNYEGe1QtODED/KDui7eMTdeKX7ZC2EK1+NoLzqbN2gfXZx/OLu2F201FNRb8r06WdQDBgVMznS7caYwBJaNYIpFNrOGK3ez0IdMXss1k5kWe9MUUp5PvCilvgilcY49imBtK4tB8yQLus52fvjxHJRny8plGg5bvn2AeFDi6nlF24bPrRRwH/w+ZucEDmrk32UInTpIKdctwaRMzruoRGz0Kd0LBsTBxgBinwEfW12rSNPw9SFWakwL5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z7qKzBQp/SA7Cw4i9p3QZCc3JFNsiVWm9vd5mo58wms=;
 b=DHolAbhg/C1A8XLtp3BCuvH0+mipYeRAA5RiX8o2kiH3ihcWw4CCqgvRsrC6J5//XVWAjRBLHF1m2FAKORb3ZJx0lGX+8oH8lAY1+Sd5LWF0kdCk5pdO6XLtSTwuQG6QLTZgsD4JqawnYVf5meUK8Da1UrN50B2DirOGK4hSIcB/SEAFn4deHh2Bz/Z5nxNUcSU0IgfcrHNLYvAAahqqAqK4TTvq8OeCTKUus4Tbts5EXxDONX7vaXpe22ctkRNzjrGN75tS81DUcHFJx1eRNVK5OtANOwavW1xjGrIC7aIHEYlWb0OlBUm8tBEhWUm6LTdPOPb22TrpzrpDFECjLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z7qKzBQp/SA7Cw4i9p3QZCc3JFNsiVWm9vd5mo58wms=;
 b=MBIp9phNKDMtJPY1C+R5JKduYqazrhjm1T4rBTZfQbT0k9oel41wbBziRzS55HSYZJaQZFCgfDKl7ruc7xfJA5y3OSbXqtX8iqETK0QbrUsEOapnh15tKnkUHf1vsSsqWCm11xtIkwWxCSAosNjbYV2DFWKY+ZQtN2SWlwrTowCiCxQkwCUFCazVIJkU0tTGtXyRYs6+4LpTXEjdB84dhB3aco+okXakURWspflYz38Gtoj2LTdX94Mem7/yK0dJBz/3JxxLEB7SVcValHEEpSt9sU0WZgoYQNzKlnk96pvzbvF5uA2+FPNAwPRcO8n7hS5pWt6EDsA/NHdNproc2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PR3PR04MB7433.eurprd04.prod.outlook.com (2603:10a6:102:86::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20; Thu, 31 Oct
 2024 20:20:21 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.8093.027; Thu, 31 Oct 2024
 20:20:20 +0000
Date: Thu, 31 Oct 2024 16:20:10 -0400
From: Frank Li <Frank.li@nxp.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Guido =?iso-8859-1?Q?G=FAnther?= <agx@sigxcpu.org>,
 Robert Chiras <robert.chiras@nxp.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: display: nwl-dsi: Allow 'data-lanes'
 property for port@1
Message-ID: <ZyPmeippTU8SQLkH@lizhi-Precision-Tower-5810>
References: <20241031194714.2398527-1-Frank.Li@nxp.com>
 <gz3ifraqt7ga4isxhx6negcmfngen5jmhmcecnvy7gu7mpfffw@j65umo6arwc7>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <gz3ifraqt7ga4isxhx6negcmfngen5jmhmcecnvy7gu7mpfffw@j65umo6arwc7>
X-ClientProxiedBy: BYAPR11CA0091.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::32) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PR3PR04MB7433:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d1c8648-38dd-4467-df01-08dcf9e9711d
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|52116014|7416014|376014|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?srfwuOgBx3YhYR+G6sOKqDsSCXQknU0XZQmupYnuEO24oy6yCi9gw7Qxv/mq?=
 =?us-ascii?Q?QsSpiH7JI1wYEus1+dNC7kU2ByPihhL1gEjabnw2gA8npyScZ11SBHIU7hlF?=
 =?us-ascii?Q?ZrmVcJ7MPlnqpcTXHW9HkG3oU/HC8o4fv+2lokXwZmmIejmL1ovn2PWJk4ip?=
 =?us-ascii?Q?B+CfUr+mwT1jqNs5zZP/kfpzHwIyu69fdORuTVG6LlvZLM4ivL3/2sEcECg4?=
 =?us-ascii?Q?XFwHsYVpAJ7pRm+N/vKs45euYG4nIgZbQ7EtWuZtbFxS0bnJFwjB7IrbX94C?=
 =?us-ascii?Q?kjTwlJrKrwvOlI64ms+63ayvrSSdgVHnn7n7fLoO1ZE2cKjkB0U2T/lWpQ+c?=
 =?us-ascii?Q?ArPiBESrTmxkeSRSwbE2yYUeLcjfIS6Kl8YMRKZeyumQBtDtf2mH3rk99ck2?=
 =?us-ascii?Q?yG3UvKN7WYB3MnBzWSI34kEAmyZ+Tk/TJA9Jto9/mryubQXR2aws+Y2yhBHg?=
 =?us-ascii?Q?XiUEqRDdN3oKXTUzJCFoHHXT5L2uj7TgTO8KKJbR//wkYVSGGZXSzoUOi4dM?=
 =?us-ascii?Q?xysKoYugy5BlNM+YEEwksb3UbefnnSFXl7ikAdmoNHI5JQvK2h1E1ID6R33L?=
 =?us-ascii?Q?vDsomEUdxk8MXIRkmWMLxaZp93yy0z2xp1YyJ3Uv8EGUdr8UUWDnhXFUtmQ5?=
 =?us-ascii?Q?D9wuSOwUDOWt+XRG3iWejnOfYSb4FZBRL62Y2SuBABHm/8xyGIU4wYNa/lPw?=
 =?us-ascii?Q?UKvGvHT76MG1t4REyY+X+7TdzG3atyQsV9U4tK2PrDYfDODkYzvQCV0qWwQ9?=
 =?us-ascii?Q?+fSdwvMiXFz14cT7sWQAZDOqZiOdYziL+zA8itYAI7N/LkQs+PxAkgoPT2EH?=
 =?us-ascii?Q?zNyyqAAaUjKDvoxXQWQWIfZUwUDhQai3+90ZHr1s92ibdG52c+Q4gHdp5wda?=
 =?us-ascii?Q?oE7w0TCnPYXWIA6IQkcqygl35Yj7ZJeCVBXlWfBVxaUsixWZbnn2888XcmYT?=
 =?us-ascii?Q?lPG4Ysbq2Gy25CmyGo6oJITw0L8hIWB9Oz4/kd3S/EAOVdasDoH6KQWEnmRe?=
 =?us-ascii?Q?dbHSQSeWB08c4WVnzgtCAITGF+483zBW1Md/oYjZ9ZcbJlYdr0BXYh/afcC4?=
 =?us-ascii?Q?ts6WS64vhOKpba0n7oeqSrGrfnXjrIGM8g16buEMPyjmvrc4J7iUz26iV/de?=
 =?us-ascii?Q?jwm1pxBhTH3ntqOWzDhq9T8fTFnH1/p5R4co2uOC8uw+FeV4D6KCnUVDqfYT?=
 =?us-ascii?Q?9fmjH6UNcEyZdICWYLzub2w8mmGR0vqHdiRNFqnLwPaArL8+cJ9QJmP0zaFP?=
 =?us-ascii?Q?oJI1eyb2tGomzXIMU0AksdqfyEhar1GY9aSfHXefKmSGtJgKxIYGPUaBHmDH?=
 =?us-ascii?Q?sb5YO7hho+6ddRMOaUtLkXCXG8QMoYqWP4uGT4T3Nsoe5E7D1c3J/uSbwWwQ?=
 =?us-ascii?Q?XgYjRw0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9642.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vpj/Kc+yNy1TGUrZATocib7I+awe9Zxr7FBE04JDT0daGtihcHHbFvD7LLzc?=
 =?us-ascii?Q?tV5/XBZNZpoen+/yISEBWFwCPp1F1yyP73OuVA8Eynh3qsr1M/C0BjKGuqxx?=
 =?us-ascii?Q?Fn38jqccvrqvzOwA1Ub7rextd5nxPcIuTkRogf3f2AGKFMVS2b4PmGbOkEaS?=
 =?us-ascii?Q?c9SLXCCX4PL/DquicD3FBxFnap78vioJFP3Zs69LjdfA0VT6xVIKILoxp/tD?=
 =?us-ascii?Q?gztTL8TBx3NqVJccgYateFzr4W+TnDHOSXjCUx/FBue5/VtnEgs5jrMFlVO6?=
 =?us-ascii?Q?iPdWfncIuuJgQBm4A5dp25q/wa8UepIzy3ATIuBBOzhKRbF5+G1whtoz90nG?=
 =?us-ascii?Q?6gGZgWTOrrecyOmBepHcViojMFbM+ET+jz9V/y/3nvatUnq8vzD+2+9tlKBT?=
 =?us-ascii?Q?FHwCRXbbPVop3mH+r/xKu52rBjt1wFs4wYe9Xh7/6Jz2LpuZsoa2QLwKF1VF?=
 =?us-ascii?Q?clfjePGvBIpIZviiGWbzNrM0badWeOMb2ayumDhilycIjqxJFNc+3DpaJ7cv?=
 =?us-ascii?Q?Uink6dpxVZrOIJ2EZF0IpFsyqmDWWsnCI5QDk2NJxVCruJXVwnf/SjeAVri5?=
 =?us-ascii?Q?tdYLtCR5yzeX2ze+GzFse1ddmimb/IJUi/q4tBf46w4hTgY9rIYnMLWrzUqg?=
 =?us-ascii?Q?RiCRhK/lpPg3HpltPpu4Jd+iC+TASTmImDNfDFhDBuvGaMdJrdwJ3gg8c6U3?=
 =?us-ascii?Q?NTyzdf6+V2HNvhtaOK8SUTHuFvwCXoVCYKjeuDBKlVVX+OcjGK9LXhxPo+DC?=
 =?us-ascii?Q?UrbcPRBhPQnBerVL3Vp41J8QnCaN8jxdj4Zk8ETAjNwINO/L/JS/X9JElX49?=
 =?us-ascii?Q?hmMOrAFmCXUGDwiRxkmg5gDsSaZieG0floRc6AcQZ3jV227tRxY2gxOgXpJY?=
 =?us-ascii?Q?djG9BoFDE49eRqfDUNOSzk5raIhtcvA6uUMPM1S8BdA7Wq43W8CWyQAEQ/kl?=
 =?us-ascii?Q?0m09UanHrhUoHHLFuuGKxg7n/m6u/kq4b8y9+FbEKQv1V5pYJKQlxjUB9mMu?=
 =?us-ascii?Q?Zhvnk3pHj/3krlhWB282Jz5vXEGPvIwmeJfW80mBoF+fWdjA5IzrbBpLB2eL?=
 =?us-ascii?Q?1xfotnglkSaXJzDH5aLDt6G5M0SA0AeY1hi0Dn0aHBSzGKm85mcKXoFPjxwE?=
 =?us-ascii?Q?0oWCIFRkrmXrz097ZKWh37eowNIP5Sjk5XKkkMRvUmFs0Oa/XB0SC5eSoa2h?=
 =?us-ascii?Q?EHLugmlYJqy1n4teKIcWHaXAybiM2UnTxHskfsSm+4i68JsM3qwKl97teuBe?=
 =?us-ascii?Q?ewYfpTKDEKAIPyF77jiaGo9K0sX+kmUooG8XGyppZUFEtRFxf6MUys7KYEeu?=
 =?us-ascii?Q?d2R/7Fsc1Ec7jPCHql+lq3Zwn18kPUM8O/eniJfyp9wuzhE23N8WOu0RkoUJ?=
 =?us-ascii?Q?vp3Ab1SVLOwtOP/SBAv2eDuV+KokT9Rg07fsC91+Zqbm7BNJWDrmrgwSX2lB?=
 =?us-ascii?Q?0m1ImK/3E7yeQOQP8qLZcuxU4XAFThUD1OxPyvmRjXDvluHfvv4lixdrT4+A?=
 =?us-ascii?Q?Jr19ZROqkQO7wmECZC6FRN3ajnr3WMa18TWg1onx/AMSfcigw+ntzmYgp12p?=
 =?us-ascii?Q?+xAmwdiH4aNE0z7diqN8VD1/Qy25GB2BJOQIXm6W?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d1c8648-38dd-4467-df01-08dcf9e9711d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 20:20:20.1445 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aQe+WhCmgBtjvDOncKkN1fWp+HEa7onHaRJ4oov6Z52gt51PuQwJarVJs63ax4aVGDoAObCm3X114J4/izztug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7433
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

On Thu, Oct 31, 2024 at 09:59:26PM +0200, Dmitry Baryshkov wrote:
> On Thu, Oct 31, 2024 at 03:47:14PM -0400, Frank Li wrote:
> > Change $ref of port@1 from 'port' to 'port-base' and add 'endpoint'
> > property referencing video-interfaces.yaml. Allow 'data-lanes' values
> > 1, 2, 3, and 4 for port@1.
> >
> > Fix below CHECK_DTB warnings:
> > arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33.dtb:
> >  dsi@30a00000: ports:port@1:endpoint: Unevaluated properties are not allowed ('data-lanes' was unexpected)
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >  .../bindings/display/bridge/nwl-dsi.yaml       | 18 +++++++++++++++++-
> >  1 file changed, 17 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml b/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml
> > index 350fb8f400f02..5952e6448ed47 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml
> > @@ -111,11 +111,27 @@ properties:
> >          unevaluatedProperties: false
> >
> >        port@1:
> > -        $ref: /schemas/graph.yaml#/properties/port
> > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > +        unevaluatedProperties: false
> >          description:
> >            DSI output port node to the panel or the next bridge
> >            in the chain
> >
> > +        properties:
> > +          endpoint:
> > +            $ref: /schemas/media/video-interfaces.yaml#
> > +            unevaluatedProperties: false
> > +
> > +            properties:
> > +              data-lanes:
> > +                description: array of physical DSI data lane indexes.
> > +                minItems: 1
> > +                items:
> > +                  - const: 1
> > +                  - const: 2
> > +                  - const: 3
> > +                  - const: 4
>
> Why are they indexed starting from 1?

Not sure, git grep -r data-lanes Documentation/devicetree/bindings/
Most start from 1. Not sure latest DT team's intention.

Frank

>
> > +
> >      required:
> >        - port@0
> >        - port@1
> > --
> > 2.34.1
> >
>
> --
> With best wishes
> Dmitry
