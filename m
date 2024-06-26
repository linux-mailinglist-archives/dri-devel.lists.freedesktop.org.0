Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC82D91816C
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 14:53:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4376C10E88F;
	Wed, 26 Jun 2024 12:52:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=xff.cz header.i=@xff.cz header.b="Gs8TT9xE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0162810E892
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 12:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
 t=1719406372; bh=b3NSYr4A7rhOQf7hyJ0eOj0PBbnA5dAe2vjUEtfa54M=;
 h=Date:From:To:Cc:Subject:X-My-GPG-KeyId:References:From;
 b=Gs8TT9xEiVVtFfcByqaWKnR3ZR5eumb3IKTvKB6jdGYEm9aEEKmom8Ij9bb7Aqghk
 zs90BTjZXmHpqdgH7CRvee/BPOAzixwKcJS9MZrv4eQSjE5Towcmm5TTFh1W6AcvC6
 zsDP4moX4EyFioxClADoBOO85mzf5FEiN3zIYLjA=
Date: Wed, 26 Jun 2024 14:52:52 +0200
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>
To: Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>
Cc: Tejas Vipin <tejasvipin76@gmail.com>, kernel@puri.sm, 
 neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, dianders@chromium.org, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/panel: sitronix-st7703: transition to mipi_dsi
 wrapped functions
Message-ID: <uhjjn5fto22s24vy6gaerhnuqepgc3y6im7mq36dbvdya62m5w@wfjp5qgqym4f>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>, 
 Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>,
 Tejas Vipin <tejasvipin76@gmail.com>, kernel@puri.sm, 
 neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, dianders@chromium.org, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
References: <20240626045244.48858-1-tejasvipin76@gmail.com>
 <ZnwIrH47Rhcu4zDq@qwark.sigxcpu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZnwIrH47Rhcu4zDq@qwark.sigxcpu.org>
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

Hi Guido,

On Wed, Jun 26, 2024 at 02:25:16PM GMT, Guido Günther wrote:
> [...]
> > -	ret = ctx->desc->init_sequence(ctx);
> > -	if (ret < 0) {
> > -		dev_err(ctx->dev, "Panel init sequence failed: %d\n", ret);
> > -		return ret;
> > -	}
> > +	ctx->desc->init_sequence(&dsi_ctx);
> 
> Why no return early here in the error case (same for the other cases
> below) giving us an indication which step went wrong?

Return early is hidden in the wrapped *_multi() function calls.

> >  
> > -	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
> > -	if (ret < 0) {
> > -		dev_err(ctx->dev, "Failed to exit sleep mode: %d\n", ret);
> > -		return ret;
> > -	}
> > +	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
> >  
> >  	/* It takes the controller 120 msec to wake up after sleep. */
> > -	msleep(120);
> > +	mipi_dsi_msleep(&dsi_ctx, 120);
> >  
> > -	ret = mipi_dsi_dcs_set_display_on(dsi);
> > -	if (ret)
> > -		return ret;
> > +	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
> >  
> > -	dev_dbg(ctx->dev, "Panel init sequence done\n");
> 
> Would be nice to keep the debug message.
> 
> > +	if (!dsi_ctx.accum_err)
> > +		dev_dbg(ctx->dev, "Panel init sequence done\n");
> >  
> > -	return 0;
> > +	return dsi_ctx.accum_err;
> >  }
> >  
> >  static int st7703_disable(struct drm_panel *panel)
> >  {
> >  	struct st7703 *ctx = panel_to_st7703(panel);
> >  	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
> > -	int ret;
> > +	struct mipi_dsi_multi_context dsi_ctx = {.dsi = dsi};
> >  
> > -	ret = mipi_dsi_dcs_set_display_off(dsi);
> > -	if (ret < 0)
> > -		dev_err(ctx->dev, "Failed to turn off the display: %d\n", ret);
> > +	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
> 
> Similar to the above: it'd be nice to keep the information which step
> failed.

That's done by the _multi() wrappers.

kind regards,
	o.

