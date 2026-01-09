Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C30D0B1D7
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 17:06:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6192810E8FB;
	Fri,  9 Jan 2026 16:06:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="e7BjxjTN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010052.outbound.protection.outlook.com [52.101.228.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E5CB10E8FB
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 16:06:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UPXLhUOqNWxjwABauJxLytaSH6pSxyiXpexJlWhQy8Og6AD3yDY1ccqkdhhFIrQCt4hBWR/8SNylipNzzjbvIp9bTA44e2KMPn9ksv9WtXTf4mE9dXUdWB+aMiXYPcanQlVWIWul5SMphukYevF6+XsVJ118K6MfXGpYp+Adijw0vYN467UH7x6xI/6ZVnhJ6vOsQ7d0jks0mjNq/z7TFY2l/eySOPOAc9DUshmxA8xIIQqdAGAKaP61jt8GDMmczmFzDc72dyNehi/qmJ4HiwIcx/MAjsr9KrhcGcmuQiISqUF6AYnAgAc5ZxKZJJyrSstQnCJtozfum/4PvZZh2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5b/RHw0/a0BCzXzQe6ua9miYelvOl+HbUabvu28x4LA=;
 b=PGGqpltghRRle1N4PNkMpTtefyKcL6FfKzl9lehZLG5EAHGboU2saStYyf9sGZJ+HhVEHEAlZgWh9wyVbnzdbOssfMYNDtCMEXKDTB0fLbcfL8hblwE/DeUJd/+dvFDYkW2/+KKkkh7pY11tyU30fQjRdglv2U7G/FaY6A1Ytt+ZolqL/1s0IT3Ju/hqzC5Kg8WDSZPzqwkjZxCcMBfodJ3QXk/7YN6y4RBYgMmf+iTkN6udjszhrL+ERkzlccR5axBHETsrqmWwrVfWzlYULGwQT4IO0oDtWGqfmow+xFIYByB/WJ2KJjnkWAH+utDm6Imr+ncsktIVUpZ+wDGiVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5b/RHw0/a0BCzXzQe6ua9miYelvOl+HbUabvu28x4LA=;
 b=e7BjxjTNyZgxBPaPxG6y+Qvr4FszxLWmxccHgap/IMJINY6VONo99Ui50EYe2ceJ0j0PGMcY0o2VlEU/nHdYOGKBRE/9Z+aseKZsfHhyqyonS2Mc01j4ICwWBmvlzwQBI3z+c9ujwwMuVhjtEXqnrRNRj8FRCoGABrMfBdTTxmM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS7PR01MB17288.jpnprd01.prod.outlook.com (2603:1096:604:43f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.2; Fri, 9 Jan
 2026 16:06:35 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9520.001; Fri, 9 Jan 2026
 16:06:35 +0000
Date: Fri, 9 Jan 2026 17:06:20 +0100
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
 biju.das.jz@bp.renesas.com, Andrzej Hajda <andrzej.hajda@intel.com>,
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
Subject: Re: [PATCH 09/22] dt-bindings: display: bridge: renesas,dsi: Add
 support for RZ/G3E SoC
Message-ID: <aWEnfJonv4egKhXo@tom-desktop>
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <1c7657d6c06d99bc2f90251995ad272b5704717d.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <42bbdec7-ce6d-417c-a13d-ce0a6782bc9a@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <42bbdec7-ce6d-417c-a13d-ce0a6782bc9a@kernel.org>
X-ClientProxiedBy: FR2P281CA0049.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::9) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OS7PR01MB17288:EE_
X-MS-Office365-Filtering-Correlation-Id: 78a3d307-8fd8-469d-03af-08de4f99101d
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|52116014|376014|7416014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?He7tAJ7XIfwSsJN/QHXW/hu4/H9BrFpOk0kHBiRJsCrM8f/Jl7wggcZsCfRb?=
 =?us-ascii?Q?2er2aiRN3N7R321gNmrl18TJWx+BsMmQExWv7ShCHgRUZUQcz5Khh/I479MS?=
 =?us-ascii?Q?QlY8KLB7fozX7iiHwDn92TWKVq6h84/ohq9T5otnCiKdQya+PFsXy9IZPWvJ?=
 =?us-ascii?Q?h6p+2zoq8naJ/yPO7jaOG8SjhUsopt8KHxre4VvSBk46VRcO7/1n/4nUFCxS?=
 =?us-ascii?Q?FlFlAvAKQZtY8ak9RtVKi4F/PulCmbVMUacdmRs0/RvKNntNTsXTQpifgpY/?=
 =?us-ascii?Q?K/reRlFlKituIymVlOgKRTCBQUCz6Tq4XXU68No4FoAAP7szrrHlqPEZZ0Zl?=
 =?us-ascii?Q?JgAcJqxtP/c08J21SxCYLbz3ZVUPe8DBFDUvfvTa1iTcVMBzKf/9QEccgHPC?=
 =?us-ascii?Q?yEQmONNpwPz7rqDukfy2l6cCd6sbuHsM2jB7Ag7FdDExTjqLgGQGEfzvB07M?=
 =?us-ascii?Q?8zIzU4iLBzFODn+83eAdCEst4o7QgP2pmUmoQ6H9qdJzFxX+XbKfrANQFI1z?=
 =?us-ascii?Q?YEwTe5BswQP1wf3H5Q6UVipEMAz8iwSbJ6JzEeHwMiPJGZkcBVIyCXWt/i7s?=
 =?us-ascii?Q?OcHx7hlPQhCJAmLXCCrwDDK3e+PVr7xOL9vAC9ZZAfS9kkrm20mmaam2fd0Q?=
 =?us-ascii?Q?aIoDZ/gjRzfZx/5R5dMWeNJRmIKYsYrGgeCtpZEvKW1F4viS/fy2Tlp1Vwlf?=
 =?us-ascii?Q?s4982Nu+vT97nK2kC7KwmJfJUecGTHUf3ZyCP8TJ10qvlEl73rQA0VS+tBTj?=
 =?us-ascii?Q?8Zj0poN8jyX+Z+/6kIS0jQE3uUQuGcYTJK3HIqdKlawhBXQoQ8dovc65tXWC?=
 =?us-ascii?Q?EUQNE/TRQarIDILvrVpj/BBJsIVUCBnMGya/++JCisdRYJD4bXbbSsGUN6w4?=
 =?us-ascii?Q?C3RYBTO2nyYbyYF3oOSCj/atbzv18FoMKrxp4sraxivXu5W0fLBKoEsCzLVh?=
 =?us-ascii?Q?f45wGybhcG0V2lM7ov1e1kAxlQIm1KAQsoFEm8bas0wZw0m4pdxRVj45LLVK?=
 =?us-ascii?Q?0S0/Kra3UQRJ04rn0NJYd1oZSnFySv255Le66I50ulbAClOScvY8bnSRqU0H?=
 =?us-ascii?Q?n4fWFgKXxX+wj3Yu5+onvFOLOioGsEacC9fO+0kkU/fBfp+sfXWEWz9cDdyM?=
 =?us-ascii?Q?gK/B7G3I97PJ69OP/D6QXUnNiPEKW3KIrU2mRk64SQGE9j+vwH0pIbgZx0oF?=
 =?us-ascii?Q?G5RbO/xuJ97+Y674NC+mdduCya4ONIFRwCSaANUtL58vI+aeLGb9bWJi05f4?=
 =?us-ascii?Q?k/R3/V6WEpHD7b4cboqZaX25qKg58xFrHf5EDb88htX2sT3uMC4ljHdIEUd1?=
 =?us-ascii?Q?FLdfnZThBzYHCK/gsNConoMJPKdBdSnYEBXNyE5Mg83jMwFSDWXAggHgEp4x?=
 =?us-ascii?Q?Kxp/0VYQpH932uSQFVFY4/EO+USJNA4dZivyuURpiTjCw67zGoTKmva9x+kg?=
 =?us-ascii?Q?Pp+b7TBWUxMzrwHMJCxOClcubCCMm31Y4XLnC+KICFChXM3pIefB3Eor585w?=
 =?us-ascii?Q?abuUQUODEcYP7awXQoThn2XA1Memz0e/hk2C?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AMQyfabqk8/On7VM2imCDGOHkL47LEzI2RXdc8zlKq0SRXfhnny3UPzc8ki0?=
 =?us-ascii?Q?SZuk34MwkUqNU1QyjZ+j1HeE7BR6CYlQtM0Hl8ykhtZeCH1oTP5AiOzU6rQI?=
 =?us-ascii?Q?wMCLk+XHivGUDWKq1Gb97OADBv/uush6R7n7bDArT6vpnXFK4En9JNI9jJiS?=
 =?us-ascii?Q?DeneeA1iM87oCV7jX3VnTqQofdSf4k1mIDB4ke4QhVfo5EKAo/+xWKVP6vIu?=
 =?us-ascii?Q?Njfyo8F87B7bNLCxnSl77bBx78Tq1ozlE2tpPyPlILbQ4R/Z2wkkJplaTccf?=
 =?us-ascii?Q?nvhB3x4QUAXUcZSGwtcGHhJelUq9mVvNH7hrlAr8KHzPVOQl/yACAVlI4BGg?=
 =?us-ascii?Q?jSAIXVHTJ1zt7x0SvY/Xbl7g+r7jTC5lANN/oeAI4h5mm+GwLptBDD+OZEdI?=
 =?us-ascii?Q?dpEHLpUPONzDwL/gcdm3gkNvscy1uNlf6o/p0sk07kPCITvpIQI6DuYsW+yL?=
 =?us-ascii?Q?tSL/rIrOCBQLUn86uzSsRWyEnPloL7K0nfxbwCx7AMP6yF0VrNc7LErSd6p5?=
 =?us-ascii?Q?uEOMlfbh4072M5g5gTGlFQGSDAdvDPdWL8k9Ik9JEy5TKBav4QUOMDE9ol+Y?=
 =?us-ascii?Q?zC0p4UK8VbxreeuuX48JGlIizgnCKYGeQUbLWUHl7QZvTaNpD8oge9OKlW5Q?=
 =?us-ascii?Q?MTuBDZHl8/dpDP8k3zXfKGfFv3PXKMzwcOP0/chrZrLG7gJKkahzneIXrFcW?=
 =?us-ascii?Q?DY9V5dQ7Jd4fC84518YN04p4F5HPkBNyaOohHVQA8Wr/4Hd5iXMhxxurzir/?=
 =?us-ascii?Q?nTkUMZVHzfTX+WeF7m0fGwutbptdMnvJt0fARJe0Lv5kFJOlp0FOeqTg1oKz?=
 =?us-ascii?Q?u0WnIR1Qp1MHLzEFip2h0ADuGaM79DrLt7Vxjbl3H1d4uj2s26+o4WMVd31F?=
 =?us-ascii?Q?yGJc/OpAcYalfwlzbEdZW2WQb6mxvYhdMDTEOTgWUUrvLRhC6eQRRuv26QYP?=
 =?us-ascii?Q?qKQi7oeMGhdFMw/2qxwjH7PowR3ayKsPpr9e9HB0aqr191mDLtyuL+qAYtGU?=
 =?us-ascii?Q?PGc3vp+1VuKXXej6NQSegLqzmz1cNa/FJxNiQGHUk7VUZALnMlBo4u9s5x9a?=
 =?us-ascii?Q?4QrwM2wqx97mlwFhT6GG9hgUn1dmhPvRqDeAN1T25KC4t+aNXjbbUptV/D2n?=
 =?us-ascii?Q?d/1Cbcf1Bw5vBS9diZRxG31CqTYT4dFY+Poe4tuiL6tcOpIzZ5bYqBHbAvEh?=
 =?us-ascii?Q?l9G0b5D6wSyuASpTwSWSdvHkHdmxh4P7S9X4TFoJR2TxgeEluReTxzsUM8xx?=
 =?us-ascii?Q?PltqvB1de6r3CNTQiam29ZcIF0aXcMTg+j6ByIGiMQpFJeoJwGZmWZA6Ejzp?=
 =?us-ascii?Q?0ErHP+g1rLUiEkthRjbVTZNWprPx+cvlCmgrMpbTOkgsUu8UCu0nhCXlHWGB?=
 =?us-ascii?Q?nLliqLWsa59adLCVNqdIIuo0myGfPtFfTF8qVbzL3KJqZeN/vZbcl6S36Jzn?=
 =?us-ascii?Q?YdEqlauf2BEWXwbARDxJIGydDlIZCqfay1mGyxLMJH1/1dOv1YMTgJ2N4GGm?=
 =?us-ascii?Q?/kcvSM70+CIwPdIgNrpBMiou0zBTeJv58k6qjSYFbuBCoDHuGis5AHFv+aFE?=
 =?us-ascii?Q?L2/F/mR3KWGqjz7Cd3k4sGVm9VxfnaoOXaFmJnzV+HdiWTpzp1s4OOi5wOSQ?=
 =?us-ascii?Q?lPlNyUMCII1HGnJvpTUI8JoHjeAa2ECRwnxvtrClMDb0SR5Xqa3L5jO41UnL?=
 =?us-ascii?Q?BZW8PVoaE/XvbhcuU0W2Xp1w5FoOykla7e5lQ18QcdYXHgRB3sMv2vxOkK0/?=
 =?us-ascii?Q?jS/d8qZkmnAQtlnJjcN4yIZ5Senu8Tf2mcFr2JZofZYNrP+N5Kbp?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78a3d307-8fd8-469d-03af-08de4f99101d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 16:06:35.3986 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j/AAqyC+V2G9fiVNPnElJK7Ty2aOv9CKJidyanm194vZ9G6p6M9f6mbs1BOgztybZJxQjqWVtbOmzKF16f+zISZX7HQ9UfSw2wmRbpI7T2vc6aOsjArOA9TjiBkKA2yh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB17288
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

Hi Krzysztof,
Thanks for your review!

On Sun, Nov 30, 2025 at 09:24:57AM +0100, Krzysztof Kozlowski wrote:
> On 26/11/2025 15:07, Tommaso Merciai wrote:
> > The MIPI DSI interface on the RZ/G3E SoC is nearly identical to that of
> > the RZ/V2H(P) SoC, except that this have 2 input port and can use vclk1
> > or vclk2 as DSI Video clock, depending on the selected port.
> > 
> > To accommodate these differences, a SoC-specific
> > `renesas,r9a09g047-mipi-dsi` compatible string has been added for the
> > RZ/G3E SoC.
> > 
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > ---
> >  .../bindings/display/bridge/renesas,dsi.yaml  | 120 +++++++++++++++---
> >  1 file changed, 101 insertions(+), 19 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> > index c20625b8425e..9917b494a9c9 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> > @@ -28,6 +28,7 @@ properties:
> >            - const: renesas,r9a09g057-mipi-dsi
> >  
> >        - enum:
> > +          - renesas,r9a09g047-mipi-dsi # RZ/G3E
> >            - renesas,r9a09g057-mipi-dsi # RZ/V2H(P)
> >  
> >    reg:
> > @@ -84,6 +85,13 @@ properties:
> >            - const: pclk
> >            - const: vclk
> >            - const: lpclk
> > +      - items:
> > +          - const: pllrefclk
> > +          - const: aclk
> > +          - const: pclk
> > +          - const: vclk1
> > +          - const: vclk2
> > +          - const: lpclk
> 
> Why are you creating completely new lists every time?
> 
> No, come with unified approach.

The intent is not to create a completely new clock list per IP, but to keep a
unified clock definition that can scale with feature differences.

The previous IP supports a single DSI input port, whereas this IP supports two
DSI input ports.

Because of this added capability, the hardware naturally introduced an
additional clock.

Can you please suggest how to handle it?

Kind Regards,
Tommaso

> 
> Best regards,
> Krzysztof
