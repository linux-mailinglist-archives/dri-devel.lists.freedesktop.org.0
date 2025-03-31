Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E35E6A7649E
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 12:57:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4339510E118;
	Mon, 31 Mar 2025 10:57:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id D216110E118
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 10:57:35 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 456271F02;
 Mon, 31 Mar 2025 03:57:39 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A98BC3F694;
 Mon, 31 Mar 2025 03:57:33 -0700 (PDT)
Date: Mon, 31 Mar 2025 11:57:29 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Steven Price <steven.price@arm.com>
Cc: Philippe Simons <simons.philippe@gmail.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, Rob Herring <robh@kernel.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Philipp Zabel
 <p.zabel@pengutronix.de>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-sunxi@lists.linux.dev>, Jernej
 =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
Subject: Re: [PATCH 2/2] drm/panfrost: add h616 compatible string
Message-ID: <20250331115729.33e54615@donnerap.manchester.arm.com>
In-Reply-To: <9ad57d16-5977-4542-8598-d23d41227e7a@arm.com>
References: <20250312232319.25712-1-simons.philippe@gmail.com>
 <20250312232319.25712-3-simons.philippe@gmail.com>
 <9ad57d16-5977-4542-8598-d23d41227e7a@arm.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Mon, 31 Mar 2025 11:32:58 +0100
Steven Price <steven.price@arm.com> wrote:

Hi Steven,

thanks for having a look!

> On 12/03/2025 23:23, Philippe Simons wrote:
> > Tie the Allwinner compatible string to the two features bits that will
> > toggle the clocks and the reset line whenever the power domain is changing
> > state.  
> 
> This looks fine, but we need the new compatible string to be documented
> in the bindings:
> 
> Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> 
> I'm not sure what the situation is for the device tree for this
> platform, but it would be good to get that all sorted before we merge
> the compatible into panfrost.

The binding addition was sent earlier, as part of my power-domain driver
series:
https://lore.kernel.org/linux-sunxi/20250221005802.11001-1-andre.przywara@arm.com/T/#m083df99cf34ddfd06a6a4b8fbb49636a51b05112

Rob took that one already, and it landed in Linus' tree last week, so
that would be covered.

Cheers,
Andre

> 
> Thanks,
> Steve
> 
> > Signed-off-by: Philippe Simons <simons.philippe@gmail.com>
> > ---
> >  drivers/gpu/drm/panfrost/panfrost_drv.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> > index 0f3935556ac7..f13743fe6bad 100644
> > --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> > +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> > @@ -776,6 +776,13 @@ static const struct panfrost_compatible default_data = {
> >  	.pm_domain_names = NULL,
> >  };
> >  
> > +static const struct panfrost_compatible allwinner_h616_data = {
> > +	.num_supplies = ARRAY_SIZE(default_supplies) - 1,
> > +	.supply_names = default_supplies,
> > +	.num_pm_domains = 1,
> > +	.pm_features = BIT(GPU_PM_RT_CLK_DIS) | BIT(GPU_PM_RT_RST_ASRT),
> > +};
> > +
> >  static const struct panfrost_compatible amlogic_data = {
> >  	.num_supplies = ARRAY_SIZE(default_supplies) - 1,
> >  	.supply_names = default_supplies,
> > @@ -859,6 +866,7 @@ static const struct of_device_id dt_match[] = {
> >  	{ .compatible = "mediatek,mt8186-mali", .data = &mediatek_mt8186_data },
> >  	{ .compatible = "mediatek,mt8188-mali", .data = &mediatek_mt8188_data },
> >  	{ .compatible = "mediatek,mt8192-mali", .data = &mediatek_mt8192_data },
> > +	{ .compatible = "allwinner,sun50i-h616-mali", .data = &allwinner_h616_data },
> >  	{}
> >  };
> >  MODULE_DEVICE_TABLE(of, dt_match);  
> 

