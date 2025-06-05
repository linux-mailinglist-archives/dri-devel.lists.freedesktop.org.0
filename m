Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 212E6ACF086
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 15:29:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E532210E2F5;
	Thu,  5 Jun 2025 13:29:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=hotmail.com header.i=@hotmail.com header.b="ZoR5fksq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10olkn2049.outbound.protection.outlook.com [40.92.42.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E373D10E2F5
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 13:29:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A/RObs4pRQd5DHCtZ9ZeYcK96x+BKAMCd+tXvX6vKjpBdIqo6Ow1IxspIZfR8s6wXzfymdFptKjLaVfVLlZe89S4WWVy+0d3VSLmIWSKAI0OzLSdUGA6Sh56U/CSgTyNBS2cDxVmBwcI7mmMbVmwqcOoPzrn/ylGzkj4uu2AxWR5t75bwfK92e4StzqXhWjD7nRQyvKOx0HRDYWUQLdmIc9kiT1ogv21ZVuxdM8myVt+DdgjJyCFa7BR4UzrWcblT4EGkk5BhHOE7m/I1IAG2j5lQyYXuiiIom5MA0cIWmOcHLGmieGEIGQgqecevkoXVWFdtNnO3XqskOKnOmboXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mR31yj7AZg710SvFtAjs7MGPciCUk1ZBCZ2licVlLRg=;
 b=xBfoEEvKMYc3iQPqbOKTTCkxZBvalaSEss+G9ew8A9uyJe+9fsJWdM4YJNDMu7N8VrIOpy3C2bjR7AYAgbKBcpGTbsG/y3t328qQUKF8dOEVEgthdlgAIaQehtecjyYbTMLN2dyg2W+UysQcGIPw+GVR+RmLkBUbuL6Dy2nLxTppJKS7uUc4fBjo8ckxkytgRvcgnWLkHwjOGEg5VMbNJ3ibrE49DFLN2nj1VIJts7mdrDZ1IDo7czu33kw6Xo1vOihtJ2oWikdoxj8BNkPd2PAQSoQbrp3Adv1hdP/Idq3j6KX9R9ovVOdTMgG9PUwILqEEUpDP90fwHsxlE9LSJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mR31yj7AZg710SvFtAjs7MGPciCUk1ZBCZ2licVlLRg=;
 b=ZoR5fksqyyKXyRxeqge0DCwXSbp9+J8A8RrmGlM8Y/rO9fKs2WYTT6ls0MPoM5SUh4yO7OSkkfRIzFz+TUskpMz6Gej+AuYM+1ngOlpG+kzfc0yjaLFvJqbVOmQH3SWuyBbUMQH6tp44Wt3HijQqa/x3v0QyfvVTGBROWokXMNIIK6BEqCkafoiDtyu3z+bvqW60O29TRXzxDxYN1KfNQUciU0IiJpwlczhKsNTgXJJXlP4GFWMrUeSG3/sjCzWbPU9AKWVNCzHTYLrussGIRsPmhvX3K5exEKqZsTMgZMMY7CwYSaeo68IrhHz2wMf7FWQCehMTa2ewgqQbnoZjrw==
Received: from SN6PR1901MB4654.namprd19.prod.outlook.com (2603:10b6:805:b::18)
 by SA0PR19MB4396.namprd19.prod.outlook.com (2603:10b6:806:b5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.22; Thu, 5 Jun
 2025 13:29:40 +0000
Received: from SN6PR1901MB4654.namprd19.prod.outlook.com
 ([fe80::7ffe:9f3a:678b:150]) by SN6PR1901MB4654.namprd19.prod.outlook.com
 ([fe80::7ffe:9f3a:678b:150%4]) with mapi id 15.20.8792.034; Thu, 5 Jun 2025
 13:29:40 +0000
Date: Thu, 5 Jun 2025 08:29:37 -0500
From: Chris Morgan <macromorgan@hotmail.com>
To: Diederik de Haas <didi.debian@cknow.org>
Cc: Chris Morgan <macroalpha82@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 sebastian.reichel@collabora.com, heiko@sntech.de,
 conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org,
 tzimmermann@suse.de, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, simona@ffwll.ch,
 airlied@gmail.com, quic_jesszhan@quicinc.com,
 neil.armstrong@linaro.org, javierm@redhat.com, megi@xff.cz
Subject: Re: [PATCH 3/4] drm/panel: himax-hx8394: Add Support for Huiling
 hl055fhav028c
Message-ID: <SN6PR1901MB4654F52BF78262C570A08515A56FA@SN6PR1901MB4654.namprd19.prod.outlook.com>
References: <20250603193930.323607-1-macroalpha82@gmail.com>
 <20250603193930.323607-4-macroalpha82@gmail.com>
 <DAEKVTXT0FHB.TOVX7BU9ZYXA@cknow.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DAEKVTXT0FHB.TOVX7BU9ZYXA@cknow.org>
X-ClientProxiedBy: SA9P223CA0022.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:26::27) To SN6PR1901MB4654.namprd19.prod.outlook.com
 (2603:10b6:805:b::18)
X-Microsoft-Original-Message-ID: <aEGbwfHHa6pFRqbw@wintermute.localhost.fail>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR1901MB4654:EE_|SA0PR19MB4396:EE_
X-MS-Office365-Filtering-Correlation-Id: b6df1f9a-2cdd-4460-7b39-08dda43505de
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|7092599006|6090799003|19110799006|5072599009|8060799009|15080799009|461199028|3412199025|440099028;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?E9mcVI4CfYE50zT2S+KdXotsqHJF4f0FH9NL2heF/g0PL8B5X99izbz1EBTy?=
 =?us-ascii?Q?0CUvMIxMMUqyc40oZphKomYe4IawHCHv7BeojLY5pk/tAUuELlUzq5izhuwK?=
 =?us-ascii?Q?vEvRkhSCa3uzMoNUcEY+FB3ZFppC/48JexcOsU7jwdZe1TVHspz7nBIDiK5t?=
 =?us-ascii?Q?36vCu0Tn9pCCTjvgxhlQbYlSAeWKQasmAZOS0ADpNc1jVkblqw2KIbq8QR7S?=
 =?us-ascii?Q?w2Ti2DOmT9Y01rdfNybHtTTMs4wtLCcp8TtIb/kBfyYVHL1jx92QuuOB+RgM?=
 =?us-ascii?Q?KWfBkN56JzagZnMLNhJsdwrfm3GV9YJthw98nPQnJ2KwmyyCB1IEKjFkiDRY?=
 =?us-ascii?Q?ebuazgY6eq7oyHaTTfo+b3QcY7OqyqHfADmYrLGdIojbHIaaaK0ityRpzdQt?=
 =?us-ascii?Q?F/PXnsYBBTLpIwk1/iZn4wCFETpiTL1J1AcPy40LhVtCtgQaqyygmEgdU3XM?=
 =?us-ascii?Q?5q/gnpup4J/P5fgy7B1LznhBZmR9jCwy+xEKlkaNYVCgkgnIRJmvD01pR1Qn?=
 =?us-ascii?Q?L87EtlVpbqEqHYywTnr6PJ2Mj/x2Jjz4hI0VDflE1+cEXoSijbvPdClQ8Uab?=
 =?us-ascii?Q?1K4PN20bf3oIat+PZAoXWX1LncgNDySzRDMpoXgzeu9Xa6mxPQKLCufsDwfj?=
 =?us-ascii?Q?FfDOBf1dsmOwXY0gM4WCr83mnz983cAufkMoZ4qzcvmqIQr+79wPAgECWbU/?=
 =?us-ascii?Q?CaJFcw+zmTJl5JDdOkvOHpDWen2SRdnpprMfjRbOS1TxJlcl5EJrrazJ8uyK?=
 =?us-ascii?Q?1o/+JQ8jgbmkP0mEBdcmjhGWmJKMpfOLu1BzIRdGH/zpB54OATtHCddG1xrE?=
 =?us-ascii?Q?QL8iCKniw/igdjJWPQd5C2TwXEpf3BO6mD9+a5ahswBsQapWamdBOygb5xTq?=
 =?us-ascii?Q?EEw0brO27jFLkzoWxm0T5JyPMcdJ2GlEwdUH20Y2ua20oyor59XKGJ8lkS+5?=
 =?us-ascii?Q?QUzdXF8rUELmpAUwfqZx/FpR8tav6tiHsaFFqGj0lNV2Zu345RdO1+kNr2ma?=
 =?us-ascii?Q?XBvNTBjudbGJcc8uR8em1SR88BxfxAz3yyUozJcxtAqqFtJj3ZVIOxtP+Szu?=
 =?us-ascii?Q?u8TjPY0GHGJpRb4Afcou7zo4w7aDqh1Q8R6aDRhSTFl07HL9Hs+NT5E6Hxfy?=
 =?us-ascii?Q?eJbOGUpMqN6yzbOE6wXAhkCE0Qyskl72XA=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Kka8L9Y7BLyehRRVH0hIIOTmank9+A9DakaJjZ1Ud2a9L+LU+nKIIcqdLxYs?=
 =?us-ascii?Q?EvQHYNRZV/1CEAwoMQjn7ldDacGEATCo+nPAyltyqembefQB5LoRJPiH3nFn?=
 =?us-ascii?Q?ai45TxvEajBj5C5HIgqcOgb0/MpBfjG6L2junEfcSqJ0nWG16y5ZajBYQno9?=
 =?us-ascii?Q?uentdk+54PlrSsbOFCtleItwNqgdvSpQ3loXU8vy3xJ39avAk0+KPX0vhtP8?=
 =?us-ascii?Q?yN3Hdisc/mQaOHlefiqWmVWE6R6T6phji2ZqThw+yPI1shzX83lNh7ik2cWd?=
 =?us-ascii?Q?gMsT4WGGkBE+vvUmn1OnLvpVOHnksbqjCzRoyXC2ec2gIhGfPRs1NpJFEczV?=
 =?us-ascii?Q?pje7AJ7pI3qJ+1158hWAt3XZ+lrD/Ec9oL8Iqa7MLakRmLVBIUfQJl/ARBe/?=
 =?us-ascii?Q?37n1wSPAopXxVZk0WEI1ydJ6RDlVjyXcjNLr4THwH9ILio8xTyxzliY8SgXR?=
 =?us-ascii?Q?izg0pQ532+/jtkp/C0V2F9dsCtCbqNxVbGTn6mZ8WxLF+IwK1iE5tNDBZxmF?=
 =?us-ascii?Q?stdBH1qZx7cX0kyFK+FJb+UyR2k0Zcg7tBpM41Kruog0TWeRVu9wfct/iptp?=
 =?us-ascii?Q?78HGIIohvEUGzkRxZOLX5hmINnlBNTFV4TT0vi3isRbaSPHDkJz/LEDM7tzA?=
 =?us-ascii?Q?1vpH3SFgluihA21GpxO7sdThRQKY2QCbv82Jw48CQOiW9gyG6muEcvTv8zQ3?=
 =?us-ascii?Q?uZQ/6OS6myhLT4en+mL4/hkTzYOzOaZ7WH78Lzanz4SbTGpBhW11dcqKFI/t?=
 =?us-ascii?Q?T1cHa59NOu5rM3SL/HbGIcujvyA8AlX8+urjH8j4/IrG7zu6opWCZ/oqKgFI?=
 =?us-ascii?Q?YZl6PsFpIJzvdOQqEt2MQeVqIFyY2bdLUvM0CJc73RzBzXIYV5AFrFg+ExBR?=
 =?us-ascii?Q?TKLXdYvC4Uy3xmQZTe8DfFTGd2GNIdlqKTIktzAgSJq48S0o5D1bWU+2+Nnn?=
 =?us-ascii?Q?ORdd7h3pNnV717AiOND8zGHTrVgdAhL3a0rP/LLih59iFcVchyiKWlecI2ZP?=
 =?us-ascii?Q?NcsRTh7+ZpGT/n6NNZMpxlxoZYGvsL8E0EUA7ILRy2Whtrklpn4Fm+TU2x4I?=
 =?us-ascii?Q?VvWASQfCYGtdgTvrqqJJ434si8lpGx5yA/LXqXZAeovWyARU3o6j0Ah5YJ8A?=
 =?us-ascii?Q?jE4h1Rn8ADXXH/1dpzdHlOS1jZOw/s7LKi/IqawHsD0VI8DfnVHOWMmK1b30?=
 =?us-ascii?Q?gAYN6W/xSwHFFDIk/im9o3quliJ2hyCGlnqUSQFdJbIYZVa6NEJbo7+jUO04?=
 =?us-ascii?Q?dv7XTBi9WiKabiTxTHbJzVQP2DXmIpFxnVrcZwLuKg=3D=3D?=
X-OriginatorOrg: sct-15-20-8534-20-msonline-outlook-2c339.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: b6df1f9a-2cdd-4460-7b39-08dda43505de
X-MS-Exchange-CrossTenant-AuthSource: SN6PR1901MB4654.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 13:29:40.1487 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR19MB4396
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

On Thu, Jun 05, 2025 at 01:54:50PM +0200, Diederik de Haas wrote:
> On Tue Jun 3, 2025 at 9:39 PM CEST, Chris Morgan wrote:
> > From: Chris Morgan <macromorgan@hotmail.com>
> >
> > Add support for the Huiling hl055fhav028c panel as used on the
> > Gameforce Ace handheld gaming console. This panel uses a Himax HX8399C
> > display controller and requires a sparsely documented vendor provided
> > init sequence. The display resolution is 1080x1920 and is 70mm by 127mm
> > as stated in the manufacturer's documentation.
> >
> > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > ---
> >  drivers/gpu/drm/panel/panel-himax-hx8394.c | 142 +++++++++++++++++++++
> >  1 file changed, 142 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-himax-hx8394.c b/drivers/gpu/drm/panel/panel-himax-hx8394.c
> > index ff994bf0e3cc..16e450b156b7 100644
> > --- a/drivers/gpu/drm/panel/panel-himax-hx8394.c
> > +++ b/drivers/gpu/drm/panel/panel-himax-hx8394.c
> > @@ -477,6 +477,147 @@ static const struct hx8394_panel_desc mchp_ac40t08a_desc = {
> >  	.init_sequence = mchp_ac40t08a_init_sequence,
> >  };
> > <snip>
> > +
> > +static const struct drm_display_mode hl055fhav028c_mode = {
> > +	.hdisplay	= 1080,
> > +	.hsync_start	= 1080 + 32,
> > +	.hsync_end	= 1080 + 32 + 8,
> > +	.htotal		= 1080 + 32 + 8 + 32,
> > +	.vdisplay	= 1920,
> > +	.vsync_start	= 1920 + 16,
> > +	.vsync_end	= 1920 + 16 + 2,
> > +	.vtotal		= 1920 + 16 + 2 + 14,
> 
> Shouldn't this be 's/14/16/' ?
> 
> Cheers,
>   Diederik
> 

With the exception of the pixel clock, these are the values from the
manufacturer. I did increase the pixel clock from 124MHz to 135MHz so
the panel would run at ~60hz. After extensive testing I can confirm
a 135MHz pixel clock works well for this panel which is why I am
using that value.

Thank you,
Chris

> > +	.clock		= 134920,
> > +	.flags		= DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> > +	.width_mm	= 70,
> > +	.height_mm	= 127,
> > +};
> > +
> > +static const struct hx8394_panel_desc hl055fhav028c_desc = {
> > +	.mode = &hl055fhav028c_mode,
> > +	.lanes = 4,
> > +	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST,
> > +	.format = MIPI_DSI_FMT_RGB888,
> > +	.init_sequence = hl055fhav028c_init_sequence,
> > +};
> > +
> >  static int hx8394_enable(struct drm_panel *panel)
> >  {
> >  	struct hx8394 *ctx = panel_to_hx8394(panel);
> > @@ -683,6 +824,7 @@ static void hx8394_remove(struct mipi_dsi_device *dsi)
> >  
> >  static const struct of_device_id hx8394_of_match[] = {
> >  	{ .compatible = "hannstar,hsd060bhw4", .data = &hsd060bhw4_desc },
> > +	{ .compatible = "huiling,hl055fhav028c", .data = &hl055fhav028c_desc },
> >  	{ .compatible = "powkiddy,x55-panel", .data = &powkiddy_x55_desc },
> >  	{ .compatible = "microchip,ac40t08a-mipi-panel", .data = &mchp_ac40t08a_desc },
> >  	{ /* sentinel */ }
> 


