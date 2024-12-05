Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA229E5FD0
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 22:08:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85B5F10E00C;
	Thu,  5 Dec 2024 21:07:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="kkVVTZA5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2046.outbound.protection.outlook.com [40.107.249.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88EB410E00C
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2024 21:07:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LIMymRAY0jS9bUbJDv3AIXGqAlMoNLzF/4p+nybzia9LfOl5XfCPM+HTDUv9rHkO6ZJKAmPlM82l9Z6ePehm4+gMcOUJ6QpTFZf5b/1Y5Xt1t8lo8Oc9ScCfGGqfL+tIcFGdqctSQqSLZr4NOxlBv8LZcEnphqqPgwYSYXNKdFEQzqp3734xi2GY6z6SkfEJ4MH+rs0PiWF5RB+ebMnQLSVLpTainFtywhQpOqQyChYdsWxhunSb7DbYeTM0VnDBJ4dEv3tQ9x4LrflewvoQA3XP5gU8w7pUPQsld81xFXFGftcLO99Q2iyuf/+Pm3ApVSS95OsPg7zW2vqh+wimCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cX9Fp3T/bHXaqQ+ENyiqPCZrUmaK1R0YaDrlF5QXQec=;
 b=lPsZPryl4tSNV1TL/zsvaUT4lNg9oowwVP44AwXZiqScR3nDKQkDNB4FF6b7FphHKG4ftGBf8vzvp+j6sqVGrd1WwuFrzE47mAY+EUi6kmwZUHQ02FK9uAaegjCZCY/uOZQ+OtD863PPf0k5PDujOuI2d8c+ZZwcF/JoY8m+wshmuERauJThOIBVYvTlpt49BZFeak5KC8k6lQSp9qvGt0IUt3SmjSeLiCZccLl10zOVP/dooksdbgNSWJp0StF69MrkQSVgXdiLYHf/u7z0MNZBZ7+LrTEbj0qfHAJn/EYNw1jFTJtnB27rKKH9TYfXVwqvgsY4bU53uJYInWzLig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cX9Fp3T/bHXaqQ+ENyiqPCZrUmaK1R0YaDrlF5QXQec=;
 b=kkVVTZA5LYNmdrfLkDH/ZCjinqhcOQZiou19ZFrlsjCPwbGmgMY6esVMVM3ENgqYqsrfv4n85iKB37mGRi0lyHJaZBYHBsNMH97uLasLqIpIug6qLX+eWmy5L/hrZDULodBUjWcoUW59mn5prVXh4jzzjwfQ845cEhFC8Bm7YCXV23qCivoJY+ixehtzox+EvH4I8G/k5cbML8m6pGcKpQzImUSjrtRBAfXHPPBJ1nrAayxLjnSrgrT8qpa1zqi6FSRmDbISQ72eGrBfn4HwC3Bnz97k6GFeDl8QMkM8B14SafuAV0fYnDHkUFHpilirG54GiHAlYSwqgUfn9EBhzA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS4PR04MB9410.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.18; Thu, 5 Dec
 2024 21:07:54 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8230.010; Thu, 5 Dec 2024
 21:07:54 +0000
Date: Thu, 5 Dec 2024 16:07:44 -0500
From: Frank Li <Frank.li@nxp.com>
To: Rob Herring <robh@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
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
Message-ID: <Z1IWIFWQqvwCi1S+@lizhi-Precision-Tower-5810>
References: <20241031194714.2398527-1-Frank.Li@nxp.com>
 <20241104154059.GA203243-robh@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241104154059.GA203243-robh@kernel.org>
X-ClientProxiedBy: SJ0PR05CA0193.namprd05.prod.outlook.com
 (2603:10b6:a03:330::18) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS4PR04MB9410:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f83e31e-913c-4ccc-93a9-08dd1570e27a
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|52116014|376014|7416014|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?U2BmbMCFWEIQe8Fslbce39db204rszOMozAu2oKEeksJgc5iyXyRCCF438GX?=
 =?us-ascii?Q?rbRyCUKM97FA1EdGnA/UQA81a7aOzJAjCCevXKnGKZ5wu2tlezy/1/OEj5SE?=
 =?us-ascii?Q?Jr9a4CO7xiYOAEfDt2ej1cFl824MdAev0oXSyAUX4im9MSbDgOZzktZ8uGxt?=
 =?us-ascii?Q?3U4Op5FlKcpf+lByWAz2VfjZrvYjFf88UVkLvKDl38hMetDHnS0fVYxbu9DE?=
 =?us-ascii?Q?p/ppLeL9FKWe6Al/PyCVliRa+jZE6h96wCpGBhvAmQoXlML/acaJ9A5x2Z/h?=
 =?us-ascii?Q?1/8CWsv/VvxyzjzCbehCBvUfze2aAHZOW0H9YzGLzo7tSUTH7Z2uSG3v51vb?=
 =?us-ascii?Q?RjrC8ywv4l8kFiQhxADt7gWxHSHtcSNAivUgTOLxuYj7UqP/+C/nC/lJ4TrB?=
 =?us-ascii?Q?vSDSsQHfory5IGU0qPbBdOvxhUOuS8EMq52FnuRHjd3RSVGIaAi6C8lIeJDX?=
 =?us-ascii?Q?RKlUU0pmSn1J75ExcWfPcMqz5jlDEaygJvtNRT/6IxVucK7vz2futbfiGFUA?=
 =?us-ascii?Q?atZkkqmFYKj6Ypg/U1vGzduo1eC3OnM4Vzg1xOlSgHecWg0DujzPgAC/yE51?=
 =?us-ascii?Q?5P84lRel+KEznyZDvkOLqz7Q6q6Z1PqvicJsOAnFVTpj2ElpSHtAonhhEBbf?=
 =?us-ascii?Q?xtn7pi5p+iwtKd+YG/tjyZsZOkRrCLDa0K4iLkaLb9b8KuxXsbvm3vUTpIUv?=
 =?us-ascii?Q?hi7xvEAP5n9u1eK+faYp1js30Op+sAccwJbiRsFcGDrBeJ5FUjtrjSgZhmWC?=
 =?us-ascii?Q?EoDdTHZhpq5gE04KzXI1SuyF9eE3Tu8vGlI0d4TpdrSGUeKf8YPQjnAGDcSq?=
 =?us-ascii?Q?MvqqfPOC6AqAM2fF4nL1Yqj7N/Mpa77kCE58plru0YBfpTVvbDl6p2gU5AWn?=
 =?us-ascii?Q?EgdNoSO51ANDOqevhfEowXkBajXO0rIyf/TG85N0/cCIn5QIxFMjR9C1Vo9K?=
 =?us-ascii?Q?CQQE50m2T2yvzj4LUMpUORdwYB/kXfaOXhTLdiYmEa3Xx7dkNOg8w1WHYjqz?=
 =?us-ascii?Q?KTjgBd9t3O6BKXnUGK25RfoSpIyWpwIyt+idT79RTbK+36ch4tisvPL8Rluy?=
 =?us-ascii?Q?udh5W3PT4g7un7Zuim4aKN7pFI2mWJL/xvNDDYObcc1mfIVfawzyrWagva2x?=
 =?us-ascii?Q?UAoi7YmbUC+1MnvyQv3jEg7g+PnAB3eCBPp/40XuYJwof/rgtodaesUXW65C?=
 =?us-ascii?Q?XsYefRl1PCs9c8bHbj1N0J8meR2mrKTT3s0WOz/wKAEwOIohADNhn7aDmYh0?=
 =?us-ascii?Q?GJZjbbI3tr5O4uDc9cexA6H4d1X3IO67J4K5if252oF0MOFMmVd97k/vdfi/?=
 =?us-ascii?Q?FrvWrg7bzYsvC3z7l1tMU5VPaPHfqGtvD9srVlJQb2tzNNEk4uLnjn2DPoSO?=
 =?us-ascii?Q?Lfg/bVRY11CFL8Jc+CmBhIzISYwFp1RmWFVlXuUtzrTxcLD+KA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9642.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?deXHyoYAFN/cQiUAReo9W4VTQwWRBMm6woblSsn6iZGISRyJnm0oP/4isLd4?=
 =?us-ascii?Q?Hhy7K+Avf5P1DAVAwcVNuZvnULlSYLsNo2Uez9U98TZx9RmcEtyGJ0dHtsoZ?=
 =?us-ascii?Q?G8TI1VcL2EPvRIqfqq/eYxb8j5bKaxkSEWhuL+dBzdYwkZhuaKgAijpGHTDU?=
 =?us-ascii?Q?C03afaVyd8m7j4Jq3sqOa1L0RFXQcluRr0qaq3Syvzh3f0k/wPJKE6Zdn3jA?=
 =?us-ascii?Q?0Myqzg/VLzZXFhqNd6S++fMEKZsLx8ngOCeqQGTSmsICeoock/aTbF0ldUGZ?=
 =?us-ascii?Q?6/6qGt/vBjzbfX8QvKLQDmet0B3gnnpYvPvke4sIQpvRMKXmIGwoy0NWfChq?=
 =?us-ascii?Q?/l8Z4OkKgV1+/YLc9JX/5KaaQsB3K2ffRDB37vfxheTCqDYXWKgGKwxNuKm/?=
 =?us-ascii?Q?94hV/soku2aMBpwl6TBbeieI3zAvSFpMmID4Ryu4Ed8MaE13TwO+MqKIoPw2?=
 =?us-ascii?Q?lW5KCqYiclB/P9kYfizKf/k5TmHnviwcIZryUNZs9gKJHqSyM9ZuQNkEUAXN?=
 =?us-ascii?Q?AFWx8WzGBFQJkclMdUsbWwHlLGNUga+EbUA/+QgC8KzIlbZ9sKGYR+ehkGR/?=
 =?us-ascii?Q?XSoMDZRkGH39dcBqIxdk6eZXI2yFC35dctCfWaI6zUF/ohTUJRFniZF4jUs4?=
 =?us-ascii?Q?kX+6JFr7x1dAflYsXMy+w+TC9Haf/OLVHO0Q+5OTCM7vjB90rvf8qkB0tV1c?=
 =?us-ascii?Q?BMXs6O1HDq6aAOBOGcvOgMFwHpQpcqrQHJf6EHT2REMMBvQQnTd64qpdX25X?=
 =?us-ascii?Q?37zTyUBSB5V3dAyb/tZtCW9h03QRrttcdO9G2Uy+mP/CkOCWhoAA/SkXEAdL?=
 =?us-ascii?Q?vBgf56+RfPShHCpOAnCBwVNRerh3W1/DGVpb+VjZ7GVFV044U1ph3wuTC0P6?=
 =?us-ascii?Q?Gq3Uf1ktcdFgBdXuusTb4Pwm6JzKhSLa4AyADboT58e7/5tM9dymyD2+xjMn?=
 =?us-ascii?Q?5xz5ojemSEmqW2R2+L/x/o4isYQw8dZW0WvPqFPauS3fXQItlZbcQw0Zmsyv?=
 =?us-ascii?Q?EX9D6MrcPAW7z8XdQNAxs8HBKzR5h16EZwnFl035KrvcrwBM7OXDKc/KpGAx?=
 =?us-ascii?Q?sJBbiZvqtF6hk3iMJtc8siLMiwb7akqICk4WDnHlQMiBwJnHgb4rsgMSebEO?=
 =?us-ascii?Q?sdPvcj8MQWh+xyIXDAPMLgddZZKGPV88yPq7m7KxTf1EKBqGoQYu4dluEles?=
 =?us-ascii?Q?Vy1FTzXyHOvvhBNWoY2gjY1tCxtv2BuhF1ZA+i51hCKpdcKIxkur5x6ZxqU4?=
 =?us-ascii?Q?Q2DuB2hqo++PgJDE/AIyrnCgOKML+A9508mg2q1KxRMx1TdXaCANJYDPjsXq?=
 =?us-ascii?Q?yyNPnvyb6lx9ddX+AP9Vpmh2WL77wrNUZeHlVvtOigDuBGoGF1299w6LzM09?=
 =?us-ascii?Q?SCVtfjkT8V5m4IEbzeGksp8oewKTe9pEgOLGnhE3IK4eLmdDMQsyF5syY0RA?=
 =?us-ascii?Q?7nUsqdpiBQKJm1dcpH2faQb11BcI1+5IG0LrgLVMsqKJT06uCPIPUreC6xpu?=
 =?us-ascii?Q?tl/v23IZBYl7R8LQvTQsa86PMOzn5kxBRdZfqZbd2zPwqqiB0gDWwxpbauq8?=
 =?us-ascii?Q?qoqzHAbM+iMgSWEpouwl6V3BJBIpjgdMDj6DPzI3?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f83e31e-913c-4ccc-93a9-08dd1570e27a
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2024 21:07:54.2897 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RrMeG6Z9w74BKNUnWthXMOscVvaD6NcBYPcCwse40EniTgV8ucQgi1mf3lCkz7Udzq+x18etVacGNXWNtNw7RA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9410
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

On Mon, Nov 04, 2024 at 09:40:59AM -0600, Rob Herring wrote:
> On Thu, Oct 31, 2024 at 03:47:14PM -0400, Frank Li wrote:
> > Change $ref of port@1 from 'port' to 'port-base' and add 'endpoint'
> > property referencing video-interfaces.yaml. Allow 'data-lanes' values
> > 1, 2, 3, and 4 for port@1.
>
> Describe "why", not what the changes are. I can read the diff. Why is
> the IP has a configurable number of lanes...

How about

"This controller support scalable data lanes from 1 to 4. Add the
'data-lanes' property to configure the number of MIPI display panel lanes
selected for boards."

Frank

>
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
> > +
> >      required:
> >        - port@0
> >        - port@1
> > --
> > 2.34.1
> >
