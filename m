Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A64F9C86A2
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2024 10:58:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAB7C10E0D1;
	Thu, 14 Nov 2024 09:58:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=dolcini.it header.i=@dolcini.it header.b="GzsU5z4q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C86610E0D1
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2024 09:58:02 +0000 (UTC)
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
 by mail11.truemail.it (Postfix) with ESMTPA id CC6FE1F967;
 Thu, 14 Nov 2024 10:57:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
 s=default; t=1731578279;
 bh=shuvYLY0wGIkdQPmLkGeU/39Ky+W1R7sgHWYS0+iKIo=; h=From:To:Subject;
 b=GzsU5z4qaNTVEELKRIjILt6VvxTKUkxuZPAPw+19LBfnaIlsK/caxKH0LHa/yEXng
 qEETAAoG4FesVCxa4/cSIlamevbPQonV6rRPlLhhiAkPUGZTeAkZET+eYz0wORsROX
 3IlL+4Lj+SdU0IsLlmSDEcuttt3cMKZG7P6EPZUoYz6RfqFn6WfXpGYDuP5+MXlm8/
 cM5VGFu4ui/rd9Wsa59YRJrKInjfNUonM1zwxVRJA0JYveoiTYLT5poNQRCOtPechh
 olB25m6qLs1Twod2DEEMdSbDbEmPAV6sLGgDLFM9JXtoR0HyAg9w+lib8vfsP3+FGl
 kwSzFH58GdJ2g==
Date: Thu, 14 Nov 2024 10:57:54 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Francesco Dolcini <francesco@dolcini.it>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v1] drm/bridge: tc358768: Fix DSI command tx
Message-ID: <20241114095754.GA23530@francesco-nb>
References: <20240926141246.48282-1-francesco@dolcini.it>
 <e28f88ca-357b-4751-8b37-c324ff40f9f5@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e28f88ca-357b-4751-8b37-c324ff40f9f5@linaro.org>
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

Hello Neil,

On Wed, Oct 23, 2024 at 10:03:20AM +0200, Neil Armstrong wrote:
> On 26/09/2024 16:12, Francesco Dolcini wrote:
> > From: Francesco Dolcini <francesco.dolcini@toradex.com>
> > 
> > Wait for the command transmission to be completed in the DSI transfer
> > function polling for the dc_start bit to go back to idle state after the
> > transmission is started.
> > 
> > This is documented in the datasheet and failures to do so lead to
> > commands corruption.
> > 
> > Fixes: ff1ca6397b1d ("drm/bridge: Add tc358768 driver")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> > ---
> >   drivers/gpu/drm/bridge/tc358768.c | 21 +++++++++++++++++++--
> >   1 file changed, 19 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
> > index 0e8813278a2f..bb1750a3dab0 100644
> > --- a/drivers/gpu/drm/bridge/tc358768.c
> > +++ b/drivers/gpu/drm/bridge/tc358768.c
> > @@ -125,6 +125,9 @@
> >   #define TC358768_DSI_CONFW_MODE_CLR	(6 << 29)
> >   #define TC358768_DSI_CONFW_ADDR_DSI_CONTROL	(0x3 << 24)
> > +/* TC358768_DSICMD_TX (0x0600) register */
> > +#define TC358768_DSI_CMDTX_DC_START	BIT(0)
> > +
> >   static const char * const tc358768_supplies[] = {
> >   	"vddc", "vddmipi", "vddio"
> >   };
> > @@ -229,6 +232,21 @@ static void tc358768_update_bits(struct tc358768_priv *priv, u32 reg, u32 mask,
> >   		tc358768_write(priv, reg, tmp);
> >   }
> > +static void tc358768_dsicmd_tx(struct tc358768_priv *priv)
> > +{
> > +	u32 val;
> > +
> > +	/* start transfer */
> > +	tc358768_write(priv, TC358768_DSICMD_TX, TC358768_DSI_CMDTX_DC_START);
> > +	if (priv->error)
> > +		return;
> > +
> > +	/* wait transfer completion */
> > +	priv->error = regmap_read_poll_timeout(priv->regmap, TC358768_DSICMD_TX, val,
> > +					       (val & TC358768_DSI_CMDTX_DC_START) == 0,
> > +					       100, 100000);
> > +}
> > +
> >   static int tc358768_sw_reset(struct tc358768_priv *priv)
> >   {
> >   	/* Assert Reset */
> > @@ -516,8 +534,7 @@ static ssize_t tc358768_dsi_host_transfer(struct mipi_dsi_host *host,
> >   		}
> >   	}
> > -	/* start transfer */
> > -	tc358768_write(priv, TC358768_DSICMD_TX, 1);
> > +	tc358768_dsicmd_tx(priv);
> >   	ret = tc358768_clear_error(priv);
> >   	if (ret)
> 
> Look good, I'll leave it here a few days if someone has comments

Just a gently reminder, thanks

> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Francesco

