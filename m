Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0314F9999
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 17:34:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CCA610F2F5;
	Fri,  8 Apr 2022 15:34:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9995C10F2F4
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Apr 2022 15:34:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 235BE1F471F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649432081;
 bh=BzsDgpQC0uZjPQzCLV0OuyvRRcpglqw4IbL/aRtw3SE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YRJtFRQxy+k7xt2DHHWGw6z8/yQFGGrkRFyDdTi2/0iHEhPPUqNE7H6cE52Sjbu2c
 v55flL8qL7NCHjvlXSSwqxCY07EXH9S61P9Y+Prp+4H0W4S0SKdJjSaHyxyrzEB2HR
 hTXy1f+7cASsiumndC+K8o2A/pILtxVrr5cIyAsdGYpkbWIPWV8lcBYnNqrZRqe/vw
 Yin/q6mfJgsoGG3wFGCZ/cmdAKY9Mae1ZhjOjNPBzesuyOOCHN598fzh7aSsxnZOqg
 mo9KgHzkqYTBeTgOy4Tc0HUJeymKcfqO8d4lRZvsJbSJ1bjEYjg1qYyCh68Z8l3GRK
 xYc8oHDk3uHMA==
Date: Fri, 8 Apr 2022 11:34:35 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] drm/bridge: anx7625: Use irq flags from devicetree
Message-ID: <20220408153435.zj3jco56lfo45bfm@notapiano>
References: <20220408013356.673732-1-nfraprado@collabora.com>
 <63867ed3-0c2a-207f-df91-ad1f6ec1d550@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <63867ed3-0c2a-207f-df91-ad1f6ec1d550@collabora.com>
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Maxime Ripard <maxime@cerno.tech>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, Robert Foss <robert.foss@linaro.org>,
 Tzung-Bi Shih <tzungbi@google.com>, Pi-Hsun Shih <pihsun@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 kernel@collabora.com, Sam Ravnborg <sam@ravnborg.org>,
 Xin Ji <xji@analogixsemi.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 08, 2022 at 12:15:44PM +0200, AngeloGioacchino Del Regno wrote:
> Il 08/04/22 03:33, Nícolas F. R. A. Prado ha scritto:
> > Read the irq flags, like which edge to trigger on, from the devicetree
> > and use those when registering the irq instead of hardcoding them.
> > In case none was specified, fallback to falling edge trigger.
> > 
> > Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> > 
> > ---
> > 
> >   drivers/gpu/drm/bridge/analogix/anx7625.c | 8 ++++++--
> >   1 file changed, 6 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > index 6516f9570b86..97d954b8cc12 100644
> > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > @@ -2588,6 +2588,7 @@ static int anx7625_i2c_probe(struct i2c_client *client,
> >   	struct anx7625_platform_data *pdata;
> >   	int ret = 0;
> >   	struct device *dev = &client->dev;
> > +	unsigned long irqflags;
> >   	if (!i2c_check_functionality(client->adapter,
> >   				     I2C_FUNC_SMBUS_I2C_BLOCK)) {
> > @@ -2639,10 +2640,13 @@ static int anx7625_i2c_probe(struct i2c_client *client,
> >   			goto free_hdcp_wq;
> >   		}
> > +		irqflags = irq_get_trigger_type(client->irq);
> 
> Nicolas, this is not necessary... what are you trying to solve?

Hi Angelo,

the ANX7625 DP bridge for the mt8192-asurada-spherion machine specifies
IRQ_TYPE_LEVEL_LOW for its interrupt trigger. The current code would just ignore
that setting and always configure it as falling edge instead. This patch solves
that, which doesn't have any clear behavior impact as a falling edge always
precedes the low level anyway, but from 4c83c071b784 ("Input: elants_i2c - do
not clobber interrupt trigger on x86"), which is similar to this commit for a
different driver, mentions that triggering on low level instead should be more
stable.

In any case, this commit is really only about honoring the irq trigger setting
in DT when present.

> 
> > +		if (!irqflags)
> > +			irqflags = IRQF_TRIGGER_FALLING;
> 
> ...and this is already done for you by __setup_irq(), check kernel/irq/manage.c.

Not that I could see...

I think what you're thinking of is, in __setup_irq():

	/*
	 * If the trigger type is not specified by the caller,
	 * then use the default for this interrupt.
	 */
	if (!(new->flags & IRQF_TRIGGER_MASK))
		new->flags |= irqd_get_trigger_type(&desc->irq_data);

As the comment says, this only sets the trigger when it isn't already specified.
Besides, it would try to get it from DT which has already failed in the first
place.

> 
> > +
> >   		ret = devm_request_threaded_irq(dev, platform->pdata.intp_irq,
> >   						NULL, anx7625_intr_hpd_isr,
> > -						IRQF_TRIGGER_FALLING |
> > -						IRQF_ONESHOT,
> > +						irqflags | IRQF_ONESHOT,
> >   						"anx7625-intp", platform);

I guess another option would be to make this whole patch simply omit the trigger
setting here:

-						IRQF_TRIGGER_FALLING |
-						IRQF_ONESHOT,
+						IRQF_ONESHOT,

so that __setup_irq() would already try to fetch it from the DT. But then 
not having the setting present in the DT wouldn't fallback to the falling edge
trigger, instead it would be set to IRQ_TYPE_NONE. That would break the ABI, so
it's a no-go.

> Partial devm_request_threaded_irq() flow, to make you understand what's going on:
> 
> devm_request_threaded_irq() -> request_threaded_irq() -> __setup_irq()
> 
> 
> That said, congrats for solving that external display issue, but I'm sure that this
> commit is not part of any solution and, if it is, you should recheck your machine's
> DT, as the mistake must be there, then!

Thanks! This commit is not part of the solution for the external display issue
indeed.

Thanks,
Nícolas
