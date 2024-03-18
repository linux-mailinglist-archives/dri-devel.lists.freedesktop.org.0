Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0971A87E59A
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 10:22:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0B1A10F0CD;
	Mon, 18 Mar 2024 09:22:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="f0yY2HTO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B424F10F0CD
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 09:22:11 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2C4FD7E9;
 Mon, 18 Mar 2024 10:21:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1710753704;
 bh=Jk1gJnoYSPzwF4zk3imeizYa/iwql1CVzGklY9LoAFA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=f0yY2HTOFaciTKbTOGQY4Ge5r20zOKlgQALHER3wpj1GwTgFo9jp+3XCf3EXvt/0Z
 Dg/sRtWBJDtRAmbkq1hnsnHFQ8s627QL1JWE7+SVJJ813Sl8AYvIp62NtevK6eyT9y
 lNm4SrGz1OlHThUTVqOWsfWOqON8EfgQ28v4eT2g=
Date: Mon, 18 Mar 2024 11:22:07 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: dri-devel@lists.freedesktop.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] drm/panel: ilitek-ili9881c: Fix warning with GPIO
 controllers that sleep
Message-ID: <20240318092207.GA6052@pendragon.ideasonboard.com>
References: <20240317154839.21260-1-laurent.pinchart@ideasonboard.com>
 <1c15f8b3-e9e0-4840-ab67-8a9de9d3ea6a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1c15f8b3-e9e0-4840-ab67-8a9de9d3ea6a@linaro.org>
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

Hi Neil,

On Mon, Mar 18, 2024 at 10:03:21AM +0100, Neil Armstrong wrote:
> On 17/03/2024 16:48, Laurent Pinchart wrote:
> > The ilitek-ili9881c controls the reset GPIO using the non-sleeping
> > gpiod_set_value() function. This complains loudly when the GPIO
> > controller needs to sleep. As the caller can sleep, use
> > gpiod_set_value_cansleep() to fix the issue.
> 
> Seems something buggy happened to the patchset, this patch doesn't appear
> in the cover letter and insn't numbered...

I've sent it separately, as it's functionally independent from the small
series for the same driver.

> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >   drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 6 +++---
> >   1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> > index 80b386f91320..084c37fa7348 100644
> > --- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> > +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> > @@ -1276,10 +1276,10 @@ static int ili9881c_prepare(struct drm_panel *panel)
> >   	msleep(5);
> >   
> >   	/* And reset it */
> > -	gpiod_set_value(ctx->reset, 1);
> > +	gpiod_set_value_cansleep(ctx->reset, 1);
> >   	msleep(20);
> >   
> > -	gpiod_set_value(ctx->reset, 0);
> > +	gpiod_set_value_cansleep(ctx->reset, 0);
> >   	msleep(20);
> >   
> >   	for (i = 0; i < ctx->desc->init_length; i++) {
> > @@ -1334,7 +1334,7 @@ static int ili9881c_unprepare(struct drm_panel *panel)
> >   
> >   	mipi_dsi_dcs_enter_sleep_mode(ctx->dsi);
> >   	regulator_disable(ctx->power);
> > -	gpiod_set_value(ctx->reset, 1);
> > +	gpiod_set_value_cansleep(ctx->reset, 1);
> >   
> >   	return 0;
> >   }
> 
> Anyway:
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

-- 
Regards,

Laurent Pinchart
