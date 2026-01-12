Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0D2D126D6
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 13:00:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE52F10E031;
	Mon, 12 Jan 2026 12:00:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="VRUDcRsx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010003.outbound.protection.outlook.com [52.101.229.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EBB010E031
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 12:00:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n0OlHXnlCiWF7KP1ASO9m1KCAE4pU0R7KG582lRm7F8FCChCuPVapi4kMqkXJMlZfSkgjIZOekv0hlKJCsnGCubHgtDTjSC4NqL3sph/9IwfS5Huy64jtXMUKiAmwgZ2HGPMD1d0bCyLxHFI3DoXQAU88ObVa5vYc7FihXyiSNaqLBZMij/fHtEyechVKh8hM0vEBhzcfzGU2CE276LqV9U0+Rs8DwtKDxInEo4v27OCc7dbp0e8E6yBYqns0l7lTNd3y5JAxGjEVVr4ih2/rHWKF5986E4bK9VNnKOBSscwwvtGdu0x/OrHj8hE9W9L62IIbT793xp1HIrS+xH16Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gyqu2gF4PpmoD8ysDPqfYjBYqBHS8NS8AectZQO6fB4=;
 b=Io+T9draECsplCHJF0nxZfrugkSdp7FMFKKl0YwmBjWMnZ62UnZPaJxgFT3g6zzkenH7BgS7h6WqcL4xPlFB1d8PjVwSt/fPIgYdeIVpfsrNmwnpSndqNaMo5o+ceYg+9t5snlUUFvMcEJadpDEPi/EyeeyclEI97S9uOCpkNje3hhHJQ/oMZI1tUeMftq1jJE17uru8tbEUDbxUTPWslsngobEUYhWr9c/OQqVYkBsKYv22KyK5Q4nzDSY6R+Eub9Ib1BotrTWH+xM0Mq/b8ivO/622qBlAplrviqoF7XBFuXhJ2+6XRLIdn5pQnd6EkEABic0mrmvC4Lhw15fOsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gyqu2gF4PpmoD8ysDPqfYjBYqBHS8NS8AectZQO6fB4=;
 b=VRUDcRsxynVl8dlHHFTvPvBJd47gz8EsU2qs0GRcXd25BOCMmo2KKqLga+PczelS1iUSsdUSpfZ8jA78dc7uYHJMP/SBWdyfuqSOgWKJV0PzLy6N2roRDUifLIUPXTNa+wAkg3T8SMbp69mL2W+tusZBf6xucqhgtg6zpGeNf4M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYYPR01MB12544.jpnprd01.prod.outlook.com (2603:1096:405:198::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Mon, 12 Jan
 2026 11:59:56 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9520.003; Mon, 12 Jan 2026
 11:59:56 +0000
Date: Mon, 12 Jan 2026 12:59:37 +0100
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
Message-ID: <aWTiKQFBZT4hpaG_@tom-desktop>
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <1c7657d6c06d99bc2f90251995ad272b5704717d.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <42bbdec7-ce6d-417c-a13d-ce0a6782bc9a@kernel.org>
 <aWEnfJonv4egKhXo@tom-desktop>
 <CAMuHMdUm-yHkRw0k42pfq9BD8urLO7rqF2yD7s2JbkMFpRTQwQ@mail.gmail.com>
 <aWE8ikhsthB_0VQV@tom-desktop>
 <CAMuHMdWGf7MgFzxjuea8agZgSyAMzXwFYO22NmRZ7i1-VPzqFw@mail.gmail.com>
 <aWTYS9BjWn2bY5Lz@tom-desktop>
 <CAMuHMdVdntJrcT8d4sCBXdnYr1m3X7s-_58KBiEDV5+GAW353A@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVdntJrcT8d4sCBXdnYr1m3X7s-_58KBiEDV5+GAW353A@mail.gmail.com>
X-ClientProxiedBy: FR2P281CA0186.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::20) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYYPR01MB12544:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ddfa839-8381-4206-6f76-08de51d21aa0
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?k/0kQWHaTwZ1DVMr8WBJS8U0DXI7xsWp8GYh3Mz0gu5NQlLiGA7GeNBosg3R?=
 =?us-ascii?Q?bcw/RRgaH8mMs9EAj57QZLwAhellxox84pSa0+9oGrglLOKIOgGwEVpedoAN?=
 =?us-ascii?Q?N6qiJaTJ5B35pojoD2MU0ArFReaeTGV1Z6PKEyCR+Y+DO0a/o0S5GmVb9oUi?=
 =?us-ascii?Q?Z8DjPUANnIdaKjrfEjDFEK5L9HS1Lt96/9VfhimQFjedWBZqL5OKvsUzh/mo?=
 =?us-ascii?Q?fMAyPC2a3zNPl59Lv2ndVL98jXRE3yLjRAcqc/0WZkn4Q58WyPWQe29TLHOl?=
 =?us-ascii?Q?Jhp5UC99PBuH7Xf9e6d/E/jO0W9Q5+2LreUigyP6jM5gl+5YoGgVwFT2Bwws?=
 =?us-ascii?Q?CCqOgOGVtaMHKtsV4+Hw6YzPrO/FxnE5OyD1M315bVIDv9DJhPQxq/szDVMu?=
 =?us-ascii?Q?IyMSzZb3kMOyRxTUfCHmSL9pawwX0jHtS7KHnx/PVClMV0L0kF4GFMheos4q?=
 =?us-ascii?Q?89eLNxLr+0etO9nDXwm740FWphaXnyi8lzq6Uxd4zvO/qgcpGSK+SF1f2akH?=
 =?us-ascii?Q?Ih3kE8gYLceqlHKwKsHkLkfQNWmroILlNBnNvROD6A/SmbRk0LWIIEE8Nhak?=
 =?us-ascii?Q?wLaoAyDS8cNZ4dj9ppSzZElcIDQapICCw17XglukODQuoMqMP9kKN9ZAsaqD?=
 =?us-ascii?Q?jwZcv+taAs4eVorJmGDwneT9XQ3ca9saylq/c63olkwYgjWXKu+vZy6uoC/7?=
 =?us-ascii?Q?FJYOt/7zF4VbGAWEtTkDNK1sL8gnxgjqLRopBBvXSzKJo+J9GaSr2i9HCZFC?=
 =?us-ascii?Q?rNKdC1yUJfkkLvmkEGI7pQH4h5xLmjci22GRdKKxfqfDlYmko1GIqr3A+97Z?=
 =?us-ascii?Q?C724rXz9LTe+qYmB7Uk2GYgss0Ul5MOi2gDxZ0vvFPV3eJuX7KanlVDXzKTr?=
 =?us-ascii?Q?owY6TQrKcHYK82tC4T36T4Hgg7KYnqjchPsj2Dh6Fkn9Ew/nCqfKe9W5xreF?=
 =?us-ascii?Q?zyVY3jW8+hX1m1NBsQxVCEDprYQ1QaLBGvsISr5STzFNZ/L3WdNLkL2iXYap?=
 =?us-ascii?Q?a73RI3NUtwz3pg6UFmPeNFjw4hl07lOsRN2HEiIT/ZWsKH6+IlfLLsEeAsQx?=
 =?us-ascii?Q?MoK8yfjyySMPVmf/jqxwrw0/WAP19vqiL9HCf3079nEREIQVxz6a6fOortsH?=
 =?us-ascii?Q?ZpAMgas+Wl4xx/YZo8Ulc90BBWAxVkhOEcmpOBVWU45YCX4hHYypIoQlD2qM?=
 =?us-ascii?Q?XROVmp4qTkrvvuNDMYy1FetTxBxxYUPzO5+SS9bn+kQjBI4741hpL65164YR?=
 =?us-ascii?Q?IsP/v05Cq23NAY15w2Oqy+sWxCH7WclRGyyjju1md7ZQHOr7j3e5arL5tA1Q?=
 =?us-ascii?Q?n2YjpaJCpSTwDgbR98k0CD/BsW2KFWnFmDOBNR+ZY4XfVR0ORkv1ILOjmbEc?=
 =?us-ascii?Q?w+yqJWa+gVxLFZQDIQqtjpmMbNd2lCmeMGbLkdACwxZKdaBTE7fMj53xGJbz?=
 =?us-ascii?Q?NdQ2TVzd4QED8YjGoYAupgaqcu7BVvhZ27f4H+hCf3uaumiyKVHhC1kfuRYG?=
 =?us-ascii?Q?o4+EK3f4z22JalzTjDToQYr6qJrp5i4ZtdnC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(52116014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0rw9xftp5YClaxp2M+YO+A0laYDRmchTrZ1yQLGfVtP7ScHIHB1Rinq8mVp6?=
 =?us-ascii?Q?oYhlJmDsHo2VDkobs+FGylkGdq9cYzWS5FfpGuSBEyOyN2ifibjr3q/Bkm2e?=
 =?us-ascii?Q?yktiW0PYEOeiu4FCEqoPpW41GjOHIoze2ci8/+XjiT9Azrrg5jAa08j3xAN8?=
 =?us-ascii?Q?xcw1KWzCERkYojJosoyUV3yB8/VbnN1hBRSwtCogY5K8YFHX/329zfFJVTJ8?=
 =?us-ascii?Q?EjI38wtveKFcsrksgsk4OlogsQMtyCfxUPg9OMhzNFxL4t+iD1Td6FwHpI90?=
 =?us-ascii?Q?cUd7BJUBasuyLSbj5gXyhxonAZCZWeZ+/EAcYuiRFJqwu0bj+/BR9ZtWSUS6?=
 =?us-ascii?Q?52mJ+nsblv2eUZj0Ij21J216VBDUXXhf5B3DNr9uqNbnK7GdpnDAhHFJvslV?=
 =?us-ascii?Q?8K/i3r0pi1gt85srgD7f2QzfwlvYiDIKbk8SNbR1G8aNG6ZeMCuGK9gPUNQE?=
 =?us-ascii?Q?3GJrbUwc6KnaeM87lw72NBaMFvPp+FFn7LgbARWRtUbfj3y7sRBiRLhGTqmv?=
 =?us-ascii?Q?g4FX+78r/P0dmVS+zu22KBlUvFk8GIHblzhsa+cbR09n8Ga+QBc7EtJhA/Yd?=
 =?us-ascii?Q?o2iPTx54YVocx5BjSRfWkNZC6WrF6wjTpsUTysWnfSy5lKUVVmT2KLNOoyhQ?=
 =?us-ascii?Q?yMGGajEuu53T5oBdUKlXgjlmBtAHmiPJzqJNJQtfG9AwJSWhKd/NRhMAvPjp?=
 =?us-ascii?Q?JTkHe/r9f8dROpxPO9p4p9CLWrcrC0wgdGbnQ6gnkbXMIB5iBolJFKwVckre?=
 =?us-ascii?Q?3Nvub/JTChWcfTjx66Td+nSkfVZup2MBcMvzc1AJ1fGuTM9zN96T/3f/4LH5?=
 =?us-ascii?Q?e/KpLgixr2Yl3N54gxAQ3SJXpTvdteqIlJsHO5ScabGUVSVBENOVyGeelL/H?=
 =?us-ascii?Q?HYajA6QEs0jbR5tUA9+mpyeqRykvyOIE6T5Xw4P0iDHS/GV16GRseN1lpeaW?=
 =?us-ascii?Q?Mred1DSl4vMLQhHWrUOJy+WCsoyBEZT2cliOL5f0KBpcLAgiE3RhLYFkwgN9?=
 =?us-ascii?Q?8XvZ1G5cs+oIkRiZF4l6a0srBn02YuKRJsRPEXv3umZwW8VXVoxKxmi02Izi?=
 =?us-ascii?Q?2/UTo6zCd+N5+UQhyv/4H1m56wJnFuabsOXXN2rXqZER3GafB9g0BOwE5hbA?=
 =?us-ascii?Q?g6Du1B+2cCPgVmVd3i9DDENLYg++2mNsM67t9urhfpIYtyQYz/oHhKxlt4RQ?=
 =?us-ascii?Q?0vl3749xxpWpw32Iai+Gwl4NTskhH2tZHxL2fwo3yoc6UINEZ7o8IP43Jn15?=
 =?us-ascii?Q?W9jSQRg+bOpwt6Mep4ggdbW6RjfrDBZdsew+rugq7NpOK4Diwmi2xUUueSHG?=
 =?us-ascii?Q?vbOQxSACVEDQ/UPjVkP1hHTP/h+CkFNPCuqTjKwy0BNmmXRVAtxUqvB2eF2c?=
 =?us-ascii?Q?I7X93VMRWNvFSVMduf9H1gJgN01HCU6eUjYmqpdk1L/J9YvunIL0WznVmMz3?=
 =?us-ascii?Q?FuN8VdlX5b3yPfqDWUcwIm9iUsJa6AAQr7qROydCIx1A//AMpmSZ+wtxBiI2?=
 =?us-ascii?Q?HyN72ZxtnuQ4POV84t3GzYfO1X5alna+t1f6LolUXBIhDiL/zCoDIG1c40i9?=
 =?us-ascii?Q?hPdNRi6Y2w3Pln6T5LYQ/u1rXcaJ1vEvC7C3qPl4zXDOByIshKxE9q4X4oQi?=
 =?us-ascii?Q?HEQ6lO7IM6ou9KicWXxmRt4IwxovsejZtCC6A+dCo2wsXqTJRW73G4GmTi9V?=
 =?us-ascii?Q?W/GZWrjNS0j128SrAHlJHdUEAiDY15vMwyH54Xh76RakB8BJ1wZsjnfVgwqb?=
 =?us-ascii?Q?yaDmcfLOvxAvXQD4muLJ4x8VODy71WppQAKkN4K1SU6VAUOCGRTE?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ddfa839-8381-4206-6f76-08de51d21aa0
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 11:59:56.8113 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 10YYqQvxrfs9ZoqF08opFdpVeZiOBKtGVDVtPDIfhJnOxIpdXI7pzuT/7n56ZSf12naSN3WTm3v8AY4ZiV3uHfXu8M5ytqYRQlT7Pzd41pA3o3Le1TnKUs4S1aiZQaLL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12544
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
Thanks for your comment.

On Mon, Jan 12, 2026 at 12:35:15PM +0100, Geert Uytterhoeven wrote:
> Hi Tommaso,
> 
> On Mon, 12 Jan 2026 at 12:18, Tommaso Merciai
> <tommaso.merciai.xr@bp.renesas.com> wrote:
> > On Fri, Jan 09, 2026 at 06:59:12PM +0100, Geert Uytterhoeven wrote:
> > > On Fri, 9 Jan 2026 at 18:36, Tommaso Merciai
> > > <tommaso.merciai.xr@bp.renesas.com> wrote:
> > > > On Fri, Jan 09, 2026 at 05:22:02PM +0100, Geert Uytterhoeven wrote:
> > > > > On Fri, 9 Jan 2026 at 17:06, Tommaso Merciai
> > > > > <tommaso.merciai.xr@bp.renesas.com> wrote:
> > > > > > On Sun, Nov 30, 2025 at 09:24:57AM +0100, Krzysztof Kozlowski wrote:
> > > > > > > On 26/11/2025 15:07, Tommaso Merciai wrote:
> > > > > > > > The MIPI DSI interface on the RZ/G3E SoC is nearly identical to that of
> > > > > > > > the RZ/V2H(P) SoC, except that this have 2 input port and can use vclk1
> > > > > > > > or vclk2 as DSI Video clock, depending on the selected port.
> > > > > > > >
> > > > > > > > To accommodate these differences, a SoC-specific
> > > > > > > > `renesas,r9a09g047-mipi-dsi` compatible string has been added for the
> > > > > > > > RZ/G3E SoC.
> > > > > > > >
> > > > > > > > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> 
> > > > > > > > --- a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> > > > > > > > +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> > > > > > > > @@ -28,6 +28,7 @@ properties:
> > > > > > > >            - const: renesas,r9a09g057-mipi-dsi
> > > > > > > >
> > > > > > > >        - enum:
> > > > > > > > +          - renesas,r9a09g047-mipi-dsi # RZ/G3E
> > > > > > > >            - renesas,r9a09g057-mipi-dsi # RZ/V2H(P)
> > > > > > > >
> > > > > > > >    reg:
> > > > > > > > @@ -84,6 +85,13 @@ properties:
> > > > > > > >            - const: pclk
> > > > > > > >            - const: vclk
> > > > > > > >            - const: lpclk
> > > > > > > > +      - items:
> > > > > > > > +          - const: pllrefclk
> > > > > > > > +          - const: aclk
> > > > > > > > +          - const: pclk
> > > > > > > > +          - const: vclk1
> > > > > > > > +          - const: vclk2
> > > > > > > > +          - const: lpclk
> > > > > > >
> > > > > > > Why are you creating completely new lists every time?
> > > > > > >
> > > > > > > No, come with unified approach.
> > > > > >
> > > > > > The intent is not to create a completely new clock list per IP, but to keep a
> > > > > > unified clock definition that can scale with feature differences.
> > > > > >
> > > > > > The previous IP supports a single DSI input port, whereas this IP supports two
> > > > > > DSI input ports.
> > > > > >
> > > > > > Because of this added capability, the hardware naturally introduced an
> > > > > > additional clock.
> > > > > >
> > > > > > Can you please suggest how to handle it?
> > > > >
> > > > > Keep on calling the first vclk "vclk", and add "vclk2" at the end of the list?
> > > > > Then RZ/V2H can specify the first 5 clocks, and RZ/G3E can specify all 6.
> > > >
> > > > Testing a bit your suggestion
> > > > we can do:
> > > >
> > > >   clock-names:
> > > >     oneOf:
> > > >       - items:
> > > >           - const: pllclk
> > > >           - const: sysclk
> > > >           - const: aclk
> > > >           - const: pclk
> > > >           - const: vclk
> > > >           - const: lpclk
> > > >       - minItems: 5
> > > >         items:
> > > >           - const: pllrefclk
> > > >           - const: aclk
> > > >           - const: pclk
> > > >           - const: vclk
> > > >           - const: lpclk
> > > >           - const: vclk2
> > > >
> > > > Then later into the compatible if switch we can do:
> > > >
> > > >
> > > >   - if:
> > > >       properties:
> > > >         compatible:
> > > >           contains:
> > > >             const: renesas,r9a09g047-mipi-dsi
> > > >     then:
> > > >       properties:
> > > >         clocks:
> > > >           items:
> > > >             - description: DSI PLL reference input clock
> > > >             - description: DSI AXI bus clock
> > > >             - description: DSI Register access clock
> > > >             - description: DSI Video clock
> > > >             - description: DSI D-PHY Escape mode transmit clock
> > > >             - description: DSI Video clock (2nd input clock)
> > >
> > > All descriptions belong at the top level. Just add the 6th one.
> >
> > Please correct me if I'm wrong but if we move up:
> >
> >         - description: DSI Video clock (2nd input clock)
> >
> > To the top level description we will have 6 clocks for G3E and 6 for
> > RZ/G2L. With that I think dt_binding_check will fail ("is valid under
> > each of") because of the oneOf.
> 
> RZ/G2L and RZ/V2H need "maxItems: 5" in their if-sections.

RZ/V2H -> maxItems: 5 is fine.
RZ/G2L -> needs 6 clocks no?

Please correct me if I'm wrong.

Kind Regards,
Tommaso

> 
> > > >         clock-names:
> > > >           minItems: 6
> > >
> > > Exactly.
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
> 
