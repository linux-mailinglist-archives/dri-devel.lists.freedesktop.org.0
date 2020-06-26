Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3089120AF19
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jun 2020 11:36:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64D6A6E03E;
	Fri, 26 Jun 2020 09:36:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75AA46E03E
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jun 2020 09:36:24 +0000 (UTC)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1jokmV-0005a8-5e; Fri, 26 Jun 2020 11:36:23 +0200
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1jokmU-0004Lf-Ke; Fri, 26 Jun 2020 11:36:22 +0200
Message-ID: <9269e6e9347d599528432ac3b987623855829193.camel@pengutronix.de>
Subject: Re: [PATCH 2/3] gpu: ipu-v3: image-convert: Combine
 rotate/no-rotate irq handlers
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Steve Longerbeam <slongerbeam@gmail.com>
Date: Fri, 26 Jun 2020 11:36:22 +0200
In-Reply-To: <20200617224038.17889-2-slongerbeam@gmail.com>
References: <20200617224038.17889-1-slongerbeam@gmail.com>
 <20200617224038.17889-2-slongerbeam@gmail.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2020-06-17 at 15:40 -0700, Steve Longerbeam wrote:
> Combine the rotate_irq() and norotate_irq() handlers into a single
> eof_irq() handler.
> 
> Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

> ---
>  drivers/gpu/ipu-v3/ipu-image-convert.c | 58 +++++++++-----------------
>  1 file changed, 20 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/gpu/ipu-v3/ipu-image-convert.c b/drivers/gpu/ipu-v3/ipu-image-convert.c
> index eeca50d9a1ee..f8b031ded3cf 100644
> --- a/drivers/gpu/ipu-v3/ipu-image-convert.c
> +++ b/drivers/gpu/ipu-v3/ipu-image-convert.c
> @@ -1709,9 +1709,10 @@ static irqreturn_t do_irq(struct ipu_image_convert_run *run)
>  	return IRQ_WAKE_THREAD;
>  }
>  
> -static irqreturn_t norotate_irq(int irq, void *data)
> +static irqreturn_t eof_irq(int irq, void *data)
>  {
>  	struct ipu_image_convert_chan *chan = data;
> +	struct ipu_image_convert_priv *priv = chan->priv;
>  	struct ipu_image_convert_ctx *ctx;
>  	struct ipu_image_convert_run *run;
>  	unsigned long flags;
> @@ -1728,45 +1729,26 @@ static irqreturn_t norotate_irq(int irq, void *data)
>  
>  	ctx = run->ctx;
>  
> -	if (ipu_rot_mode_is_irt(ctx->rot_mode)) {
> -		/* this is a rotation operation, just ignore */
> -		spin_unlock_irqrestore(&chan->irqlock, flags);
> -		return IRQ_HANDLED;
> -	}
> -
> -	ret = do_irq(run);
> -out:
> -	spin_unlock_irqrestore(&chan->irqlock, flags);
> -	return ret;
> -}
> -
> -static irqreturn_t rotate_irq(int irq, void *data)
> -{
> -	struct ipu_image_convert_chan *chan = data;
> -	struct ipu_image_convert_priv *priv = chan->priv;
> -	struct ipu_image_convert_ctx *ctx;
> -	struct ipu_image_convert_run *run;
> -	unsigned long flags;
> -	irqreturn_t ret;
> -
> -	spin_lock_irqsave(&chan->irqlock, flags);
> -
> -	/* get current run and its context */
> -	run = chan->current_run;
> -	if (!run) {
> +	if (irq == chan->out_eof_irq) {
> +		if (ipu_rot_mode_is_irt(ctx->rot_mode)) {
> +			/* this is a rotation op, just ignore */
> +			ret = IRQ_HANDLED;
> +			goto out;
> +		}
> +	} else if (irq == chan->rot_out_eof_irq) {
> +		if (!ipu_rot_mode_is_irt(ctx->rot_mode)) {
> +			/* this was NOT a rotation op, shouldn't happen */
> +			dev_err(priv->ipu->dev,
> +				"Unexpected rotation interrupt\n");
> +			ret = IRQ_HANDLED;
> +			goto out;
> +		}
> +	} else {
> +		dev_err(priv->ipu->dev, "Received unknown irq %d\n", irq);
>  		ret = IRQ_NONE;
>  		goto out;
>  	}
>  
> -	ctx = run->ctx;
> -
> -	if (!ipu_rot_mode_is_irt(ctx->rot_mode)) {
> -		/* this was NOT a rotation operation, shouldn't happen */
> -		dev_err(priv->ipu->dev, "Unexpected rotation interrupt\n");
> -		spin_unlock_irqrestore(&chan->irqlock, flags);
> -		return IRQ_HANDLED;
> -	}
> -
>  	ret = do_irq(run);
>  out:
>  	spin_unlock_irqrestore(&chan->irqlock, flags);
> @@ -1859,7 +1841,7 @@ static int get_ipu_resources(struct ipu_image_convert_chan *chan)
>  						  chan->out_chan,
>  						  IPU_IRQ_EOF);
>  
> -	ret = request_threaded_irq(chan->out_eof_irq, norotate_irq, do_bh,
> +	ret = request_threaded_irq(chan->out_eof_irq, eof_irq, do_bh,
>  				   0, "ipu-ic", chan);
>  	if (ret < 0) {
>  		dev_err(priv->ipu->dev, "could not acquire irq %d\n",
> @@ -1872,7 +1854,7 @@ static int get_ipu_resources(struct ipu_image_convert_chan *chan)
>  						     chan->rotation_out_chan,
>  						     IPU_IRQ_EOF);
>  
> -	ret = request_threaded_irq(chan->rot_out_eof_irq, rotate_irq, do_bh,
> +	ret = request_threaded_irq(chan->rot_out_eof_irq, eof_irq, do_bh,
>  				   0, "ipu-ic", chan);
>  	if (ret < 0) {
>  		dev_err(priv->ipu->dev, "could not acquire irq %d\n",
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
