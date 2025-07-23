Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1066B0ED3F
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 10:32:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4267D10E004;
	Wed, 23 Jul 2025 08:32:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from srv01.abscue.de (abscue.de [89.58.28.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39AEE10E004
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 08:32:19 +0000 (UTC)
Received: from srv01.abscue.de (localhost [127.0.0.1])
 by spamfilter.srv.local (Postfix) with ESMTP id A14371C025E;
 Wed, 23 Jul 2025 10:32:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on abscue.de
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=NO_RECEIVED,NO_RELAYS
 autolearn=ham autolearn_force=no version=4.0.1
Date: Wed, 23 Jul 2025 10:32:11 +0200
From: Otto =?iso-8859-1?Q?Pfl=FCger?= <otto.pflueger@abscue.de>
To: Maxime Ripard <mripard@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Kevin Tang <kevin.tang@unisoc.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 10/15] drm: sprd: add clock gating support
Message-ID: <aICeC5lSSW0qR7oh@abscue.de>
References: <20250722-ums9230-drm-v2-0-054276ec213d@abscue.de>
 <20250722-ums9230-drm-v2-10-054276ec213d@abscue.de>
 <20250723-resourceful-intrepid-beaver-cbeada@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250723-resourceful-intrepid-beaver-cbeada@houat>
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

Hi Maxime,

On Wed, Jul 23, 2025 at 09:00:28AM +0200, Maxime Ripard wrote:
> Hi,
> 
> On Tue, Jul 22, 2025 at 04:41:12PM +0200, Otto Pflüger wrote:
> > Enable the DPU and DSI clocks specified in the device tree.
> > Disable the DSI clock when it is not needed.
> > 
> > Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
> > ---
> >  drivers/gpu/drm/sprd/sprd_dpu.c | 7 +++++++
> >  drivers/gpu/drm/sprd/sprd_dpu.h | 1 +
> >  drivers/gpu/drm/sprd/sprd_dsi.c | 9 +++++++++
> >  drivers/gpu/drm/sprd/sprd_dsi.h | 4 +++-
> >  4 files changed, 20 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/sprd/sprd_dpu.c b/drivers/gpu/drm/sprd/sprd_dpu.c
> > index 0d9eb778794d92418b39f8535d94abde3566de43..9d274600e6a80bdfc435f6c6eff77c9dd71cb38c 100644
> > --- a/drivers/gpu/drm/sprd/sprd_dpu.c
> > +++ b/drivers/gpu/drm/sprd/sprd_dpu.c
> > @@ -3,6 +3,7 @@
> >   * Copyright (C) 2020 Unisoc Inc.
> >   */
> >  
> > +#include <linux/clk.h>
> >  #include <linux/component.h>
> >  #include <linux/delay.h>
> >  #include <linux/dma-buf.h>
> > @@ -794,6 +795,12 @@ static int sprd_dpu_context_init(struct sprd_dpu *dpu,
> >  	if (ctx->irq < 0)
> >  		return ctx->irq;
> >  
> > +	ctx->clk = devm_clk_get_optional_enabled(dev, "core");
> > +	if (IS_ERR(ctx->clk)) {
> > +		dev_err(dev, "failed to get DPU core clock\n");
> > +		return PTR_ERR(ctx->clk);
> > +	}
> > +
> >  	/* disable and clear interrupts before register dpu IRQ. */
> >  	writel(0x00, ctx->base + REG_DPU_INT_EN);
> >  	writel(0xff, ctx->base + REG_DPU_INT_CLR);
> > diff --git a/drivers/gpu/drm/sprd/sprd_dpu.h b/drivers/gpu/drm/sprd/sprd_dpu.h
> > index 157a78f24dc18b071602552ea9d005af66525263..d48b922de580a8a4bf07c4610c431d3321f7b810 100644
> > --- a/drivers/gpu/drm/sprd/sprd_dpu.h
> > +++ b/drivers/gpu/drm/sprd/sprd_dpu.h
> > @@ -44,6 +44,7 @@ enum {
> >   */
> >  struct dpu_context {
> >  	void __iomem *base;
> > +	struct clk *clk;
> >  	int irq;
> >  	u8 if_type;
> >  	struct videomode vm;
> > diff --git a/drivers/gpu/drm/sprd/sprd_dsi.c b/drivers/gpu/drm/sprd/sprd_dsi.c
> > index e01d1d28fe579644ec2e0c83ec9170269932adfe..2af4273a6c73185084290c9d14b8ac18914d514b 100644
> > --- a/drivers/gpu/drm/sprd/sprd_dsi.c
> > +++ b/drivers/gpu/drm/sprd/sprd_dsi.c
> > @@ -828,6 +828,8 @@ static void sprd_dsi_bridge_pre_enable(struct drm_bridge *bridge)
> >  	struct sprd_dsi *dsi = bridge_to_dsi(bridge);
> >  	struct dsi_context *ctx = &dsi->ctx;
> >  
> > +	clk_prepare_enable(ctx->clk);
> > +
> >  	if (ctx->enabled) {
> >  		drm_warn(dsi->drm, "dsi is initialized\n");
> >  		return;
> > @@ -875,6 +877,8 @@ static void sprd_dsi_bridge_post_disable(struct drm_bridge *bridge)
> >  	sprd_dphy_fini(ctx);
> >  	sprd_dsi_fini(ctx);
> >  
> > +	clk_disable_unprepare(ctx->clk);
> > +
> >  	ctx->enabled = false;
> >  }
> 
> I'm a bit confused. Why do you need to enable / disable that clock in
> pre_enable / post_disable, if you already enabled it at probe?

These are two different clocks. DPU uses devm_clk_get_optional_enabled,
while DSI uses devm_clk_get_optional and enables/disables it when
needed. Ideally both clocks should be disabled when not needed, but this
will be implemented later.

Best regards,
Otto Pflüger
