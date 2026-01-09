Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B35D0BB3E
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 18:36:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0048A10E911;
	Fri,  9 Jan 2026 17:36:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="CSCFcJ3N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11011026.outbound.protection.outlook.com [40.107.74.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F377210E919
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 17:36:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XZkT2qUvYGmZ3djKRfX9VXQFGlz+pNSLrl1GR2946N/vBM2vFpLPpHXt5Y5Ae1vBx7rqXrCx+6yJpos7h9WPXQyVFLdChnNnDY1Yg0U74uywgdsf2zyfUh26XPaR+TwZh1azdll2/NQ9KlhTlVg1warSpUpO78sWZGKddru8T7xlI4DHZcv5eZW8P3BV4utY2hoJhq0N5MvRQV+uwvRj66xjF+N1Lc4BW9ZmaBnVbc0l/PIvCITQTqIi17C+a+yh3bCYHdHcbOP8PVueXdzNLj02SpP+DJlQvsu+El8SLWFTKH9Ywr1794InP216u3pcdbQVxgeIx0HI/u65GHKFrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fOTXlwrQ7Q+kD8fUgI4+NVMgtTZQidCRWCIBbobff38=;
 b=q56oQCDLEn9s01BdY6Gewn0Dj4BT6EdhBTC32ptlj9F3xz6Evto+jraJnQJa9BmjbxtWbtC9I3meXiRDjqNXRWSfwVgCu93krPBut/OpMSaVeY5qGp+AXCcz0wOXIx9DMN2t+FSBgWTZpuFtrAz42Cc+qEO4SLyogioWenC8o8Tr3WmRGHJ9/6POQqgg7wl/fDTqnTHb+kZyv3o2+lkRitqKeF0KR1/qViRatI8MvEmroRrMiaQfeGbza+VsygxEziH2WdMfNQPzJ2pt4o4MkhqsQJ0KTHg1FkrP2kF8LEo5kqCSER6kmj0gcAwfhPVPcVUjGmjgV57PAB2NdhrRzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fOTXlwrQ7Q+kD8fUgI4+NVMgtTZQidCRWCIBbobff38=;
 b=CSCFcJ3Nk1IkI/qUP4ST2Pm0V1fEOJYR3AHiqsJ3dxPP/YkgHFJ+pVfFt/0BkbJbxjfR2ROnjKzUlDnGbcTgUC3aQakfvW2aouzCXx6iXivY+quu4GkyTfpKfJ66iBAGeADdH9U7jMm2pdmcUYMxOFasGgzu0Kdeiet0y8ptDGQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TY3PR01MB11948.jpnprd01.prod.outlook.com (2603:1096:400:409::5)
 by OSZPR01MB6663.jpnprd01.prod.outlook.com (2603:1096:604:ff::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.1; Fri, 9 Jan
 2026 17:36:36 +0000
Received: from TY3PR01MB11948.jpnprd01.prod.outlook.com
 ([fe80::1de5:890d:9c69:172]) by TY3PR01MB11948.jpnprd01.prod.outlook.com
 ([fe80::1de5:890d:9c69:172%4]) with mapi id 15.20.9520.001; Fri, 9 Jan 2026
 17:36:30 +0000
Date: Fri, 9 Jan 2026 18:36:10 +0100
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, tomm.merciai@gmail.com,
 linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
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
Subject: Re: [PATCH 09/22] dt-bindings: display: bridge: renesas,dsi: Add
 support for RZ/G3E SoC
Message-ID: <aWE8ikhsthB_0VQV@tom-desktop>
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <1c7657d6c06d99bc2f90251995ad272b5704717d.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <42bbdec7-ce6d-417c-a13d-ce0a6782bc9a@kernel.org>
 <aWEnfJonv4egKhXo@tom-desktop>
 <CAMuHMdUm-yHkRw0k42pfq9BD8urLO7rqF2yD7s2JbkMFpRTQwQ@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUm-yHkRw0k42pfq9BD8urLO7rqF2yD7s2JbkMFpRTQwQ@mail.gmail.com>
X-ClientProxiedBy: FR4P281CA0285.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e6::19) To TY3PR01MB11948.jpnprd01.prod.outlook.com
 (2603:1096:400:409::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11948:EE_|OSZPR01MB6663:EE_
X-MS-Office365-Filtering-Correlation-Id: 0be36083-2db0-462b-6850-08de4fa59fed
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|52116014|376014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Mq1vAutTqIicZpRnVlf9PZkbz6o3lo+3OCXZmpTSn6dTDCQqcfFFZoMFl4GC?=
 =?us-ascii?Q?XNeYn5w2aRnuxWHOlXx4cGAz+PHJg6jQfFp5eMbZ6rMVnsPfryWKgmuT74WY?=
 =?us-ascii?Q?649pAdjQ5Hp2v2aOCH159QuD4O8suEoLlaEb2siPvv2xt3aaV8/evgfu5UrO?=
 =?us-ascii?Q?s8zaGJ7fpfvO5QcVpepvNNk3EaubrF5OTIj2T/xAXOgX5QiwoU9QwrPGuNBw?=
 =?us-ascii?Q?DrtZzAp25liBA5H5yWIbjAAOOPqqbe2XUGBKhoYCvKLoOhzu8K4wP6K99V0B?=
 =?us-ascii?Q?BLy+agiF0SuU6q9Yd5FVt7MPGPfQ96V35E/5AKc13pl8q/AFjwKlBPRK6J2w?=
 =?us-ascii?Q?3GxdKpmt3D/roCbOugKKpiG5sNzZyovox+I1S2GK3Wa/L8///1luWb8XIA83?=
 =?us-ascii?Q?SZVH/VAnAPwCnpnHr1htHPGoaG4tIYm47cg1bBIb5QfJNfuaHhp8xwEcWVnz?=
 =?us-ascii?Q?2oQak2vjdEWKUVNCHxyaPnIHFfQCMIppOIwEyaDHBUWQ7aUrbflw1fluXTLT?=
 =?us-ascii?Q?ZjouLPO0Yc3aUtRGhhUnTbuxtzhGo3pQdx4RQKGLNhgFGMGI1vi8/DX4w2VR?=
 =?us-ascii?Q?BlQ8xT4m5AQqDP4zcclxd6XmAGjUj8KRNGGLttfU7U8TD/l41Azl0as/QzV8?=
 =?us-ascii?Q?yQqNTysRDRsi7Fl6pDxICsX9ow4GDszgHFuFMv7Fs6egm06mWXMOSBpy+3PM?=
 =?us-ascii?Q?u3zBWNbwP5piJ35NVX7Zv0uqhVWJY8jJ4kvSIiUH8xghzCDE5bJ64wEuMMqF?=
 =?us-ascii?Q?w663fDF08VA1UcyBmhFHbytgJG54DPhg50cOxL4H35BG7KemgytEErLh2RP7?=
 =?us-ascii?Q?sdlanPkwsIWvfD1V6FUJFFknKDoVL4B3mI9lOS0UCaUg6lU0hMW4Bo6d6ukK?=
 =?us-ascii?Q?FIFbkMbH8uQ+mfHsSLXPBil60ytKSV9tNzl9c3CcQ7FBZ9IOSi8lf2dY1fNu?=
 =?us-ascii?Q?zetsJcp3CXqSpbJAYN07ZsXue/1aSnXJSuMXBHkwq97uE5l9Un4wIXKTsiTh?=
 =?us-ascii?Q?UPOfbB8ap5lFgziVtRl/lkAKNpOc26gTxLOYQbqlwXa9F3V6DmayjPaLTOOL?=
 =?us-ascii?Q?UR4Fr0SD8pbQE91aIZiKAMHSIjXeRaS/M17LiiYe7iq9pkd/iZsk/W2Jnl0A?=
 =?us-ascii?Q?OLEZpllB60OaBQxcIn0Qicg4BDPbcAgrElgCiVpU7UL8TjehW5EVkh9Pm37l?=
 =?us-ascii?Q?TBisG5EUpeym8q6iWeEyisPieplFjrB/EjSAr0t/5XmnpV2Hlw/zYPRu322O?=
 =?us-ascii?Q?eTwEqlhRzJV3EX0X5boS7zAQjufy10/JWEOZhcbNZ0f96Bx/aEpcfMBe8hxE?=
 =?us-ascii?Q?7kLVWidlvUlY/brqxotkfHKV3pU4zdAUWeriGQWakCncaO6WEx9FYylrsgxZ?=
 =?us-ascii?Q?WuiG2q4S7yB1ypfA1hi56H8o3C00L2JqUnFSXagU3naJpcxESvHfqGgFrt1m?=
 =?us-ascii?Q?XeUJGAvTFOYUtfL8dTuUHEL1LW9g3ZGU0gt7TSNVBoSzD3Lpln0W/OtS54lB?=
 =?us-ascii?Q?Lkb5Sbe+9GOkImu3I9f0IVINSwar/trJVZpF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11948.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RkapEDjBhVH12EUfCuP+36KSF/BTkkYCiYNJxGzzvLZRJ5elZvVh+lKSCcXd?=
 =?us-ascii?Q?2uPuCdSFSW/AffepZTYCfPM1YCLjek4oYGG7u+/LA4KtE8a9l+NAXqNO1u+2?=
 =?us-ascii?Q?X2SosYAcI1nyqYq4SxDZO5RqL6k61+bGz0I7gW3Rapq/l1lA+/6CKSikQw4s?=
 =?us-ascii?Q?65FsCJx+ExUyG4J7altdc/fHBiXBXSqTsl+eRBJEISOrtPn+hCPRrVNPKmOO?=
 =?us-ascii?Q?Wt/KviKqQJ2qDMxMDXnzAyUXGKIfHEhdjJ1RZvy+xYXGG3QdS4kdCQG5XdXW?=
 =?us-ascii?Q?dtJwK6PDw8K9AKYZCASHFRzyK86KVoe6XaAXomPgnHC7gDQMIV4iN1o+lz0D?=
 =?us-ascii?Q?GWQMZsBLh2arMmfT/4F/V4lCMpiaq+9ApoG1bDhbnaJWuwoiqAxVcf9HI7LW?=
 =?us-ascii?Q?E1kZW0a4ccdaELhj5CHeI8mMTG8zy093acyiWH0rAey5iYgxsLvhFXUGwvAM?=
 =?us-ascii?Q?rmm8E45htRJaZwFjxmk33q+C4YR0BmP7oh05kpWpboRacLO6ltbZXcBnyBYm?=
 =?us-ascii?Q?fYwdx+pn0xLmqzuVFubBLafZQ+UTa+BVT5/Pm0i6y2p3sCQPMcZvQfbYoxGK?=
 =?us-ascii?Q?G87lJgQltJicbMaC6pSCqF6Gu2JuVo2lP4HST7UxtTFbeoqlRgyqAEAWPH5Z?=
 =?us-ascii?Q?bQfv2VEasKL/mPzHq8H6S11toCl92tVJPBtEunhkBjESplfzOsnJIr2syoQZ?=
 =?us-ascii?Q?hweiYYVdhfVn7xaMkFSZLOYJgSs5s3tBYQQZ1FUCTp+HsNHii9MEi1lZJe5X?=
 =?us-ascii?Q?lzaIeiFhDXOFoghYsZ0mrmE7aNW32uZjl1YlocrEKO+3arARN1Vo3y6B0d/C?=
 =?us-ascii?Q?rETEmcH5vgRFgCKvG4vLBmo3zNqUO7UAChxMly3zqoRzYiAxRN8EDQOm/ffp?=
 =?us-ascii?Q?/HKdAvh+zwyIf1ORECm2jYeJxS0qOkQGg7lZlTxtY1SS0FYwWCv5/CG78twf?=
 =?us-ascii?Q?19egQ47iYl1DcYPK8PtBCFH8sEZh3VKTkR2vb+mk1RBYqdjx8DB29v8mXuvI?=
 =?us-ascii?Q?+lLzOP1vM/P2psHmd7l6oeAaeYV29Jr8IawHkkBlQ21tQ+PWb9iVZr9rWoqd?=
 =?us-ascii?Q?o0quprcEITCKVGxDsAJm7TI3pvPH8Xjd/62YB2GbZmMBXN1usRVtdjqF3yi3?=
 =?us-ascii?Q?t8UpbuqBPtJB1L1PpPr+x1rDwywBE5/13uDfS4nrKb+Xf3wBi9egHgHo7REY?=
 =?us-ascii?Q?tV1MHRcxkCHPa/3KHgI1V7rw2XCB9+2AL4HEO4lX6w6YkFjPgtBur5Atwds7?=
 =?us-ascii?Q?nZ+MxPGptnpEEB6Kn+Swul4KhAzYrxDOZI+6MeV6OmbpvHF19JNaBf1uNRpc?=
 =?us-ascii?Q?Ll/At0grntHNsA+z9ePll8r1jhWRli3jfs9h7kHZikMJ1PWMoQpbbimMh0v6?=
 =?us-ascii?Q?uiaX7YYDcNEOV2HNA4HZB/dxUxMEmTQ1D7FmwnobLvIQNIx9OhVNb+d3zIOz?=
 =?us-ascii?Q?vwY3O1XxUq6FO30dMg1gO9Ycv4k/FZdfHfoS1Qx8pPf/h0PJteKrPDDsYX8m?=
 =?us-ascii?Q?DGUz8B9e/qkAlU/pczVWJV/pfcpTNwc3uQoSef6yjAwrzs0LXtQ36kHQhJ18?=
 =?us-ascii?Q?8ouWGy1QzUeG4lqtPF2F5ZzmeXkIupZl0+4J9SRhuhc0dB/ZEAlQymVJprDx?=
 =?us-ascii?Q?X+62dXTER3WGPFLJFxl9WwHwQY8/68crqRiKPn1d5unQCwtB3dIFum3KHPXh?=
 =?us-ascii?Q?a350OXkA0T+Ip33fjk6dnjADmXEhnGZUA2VKmFOnT7K/ud8Wk+sKyyeNIB3Z?=
 =?us-ascii?Q?R2ZjG7ingD9oKYW0c+sugVQflBCdBxmqfihTlEmyPvgZbfkqC7WZ?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0be36083-2db0-462b-6850-08de4fa59fed
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11948.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 17:36:30.8152 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o6pqCcXRz2/jOpWI0mUGXBBKvJfHdnwAVIo5xbYwrXR0vKcQ9Grsnms+sWeBkF3xvNa32nfa02zfhlXzBaKFRna+L89PeUwaG37e7r++NWs9WJTXbpoDcwDxF7N+E0YP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6663
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

Hi Geert,
Thanks for your comment!

On Fri, Jan 09, 2026 at 05:22:02PM +0100, Geert Uytterhoeven wrote:
> Hi Tommaso,
> 
> On Fri, 9 Jan 2026 at 17:06, Tommaso Merciai
> <tommaso.merciai.xr@bp.renesas.com> wrote:
> > On Sun, Nov 30, 2025 at 09:24:57AM +0100, Krzysztof Kozlowski wrote:
> > > On 26/11/2025 15:07, Tommaso Merciai wrote:
> > > > The MIPI DSI interface on the RZ/G3E SoC is nearly identical to that of
> > > > the RZ/V2H(P) SoC, except that this have 2 input port and can use vclk1
> > > > or vclk2 as DSI Video clock, depending on the selected port.
> > > >
> > > > To accommodate these differences, a SoC-specific
> > > > `renesas,r9a09g047-mipi-dsi` compatible string has been added for the
> > > > RZ/G3E SoC.
> > > >
> > > > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > > > ---
> > > >  .../bindings/display/bridge/renesas,dsi.yaml  | 120 +++++++++++++++---
> > > >  1 file changed, 101 insertions(+), 19 deletions(-)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> > > > index c20625b8425e..9917b494a9c9 100644
> > > > --- a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> > > > +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> > > > @@ -28,6 +28,7 @@ properties:
> > > >            - const: renesas,r9a09g057-mipi-dsi
> > > >
> > > >        - enum:
> > > > +          - renesas,r9a09g047-mipi-dsi # RZ/G3E
> > > >            - renesas,r9a09g057-mipi-dsi # RZ/V2H(P)
> > > >
> > > >    reg:
> > > > @@ -84,6 +85,13 @@ properties:
> > > >            - const: pclk
> > > >            - const: vclk
> > > >            - const: lpclk
> > > > +      - items:
> > > > +          - const: pllrefclk
> > > > +          - const: aclk
> > > > +          - const: pclk
> > > > +          - const: vclk1
> > > > +          - const: vclk2
> > > > +          - const: lpclk
> > >
> > > Why are you creating completely new lists every time?
> > >
> > > No, come with unified approach.
> >
> > The intent is not to create a completely new clock list per IP, but to keep a
> > unified clock definition that can scale with feature differences.
> >
> > The previous IP supports a single DSI input port, whereas this IP supports two
> > DSI input ports.
> >
> > Because of this added capability, the hardware naturally introduced an
> > additional clock.
> >
> > Can you please suggest how to handle it?
> 
> Keep on calling the first vclk "vclk", and add "vclk2" at the end of the list?
> Then RZ/V2H can specify the first 5 clocks, and RZ/G3E can specify all 6.

Testing a bit your suggestion
we can do:

  clock-names:
    oneOf:
      - items:
          - const: pllclk
          - const: sysclk
          - const: aclk
          - const: pclk
          - const: vclk
          - const: lpclk
      - minItems: 5
        items:
          - const: pllrefclk
          - const: aclk
          - const: pclk
          - const: vclk
          - const: lpclk
          - const: vclk2

Then later into the compatible if switch we can do:


  - if:
      properties:
        compatible:
          contains:
            const: renesas,r9a09g047-mipi-dsi
    then:
      properties:
        clocks:
          items:
            - description: DSI PLL reference input clock
            - description: DSI AXI bus clock
            - description: DSI Register access clock
            - description: DSI Video clock
            - description: DSI D-PHY Escape mode transmit clock
            - description: DSI Video clock (2nd input clock)

        clock-names:
          minItems: 6

Thanks & Regards,
Tommaso


> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
