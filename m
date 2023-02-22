Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B044369F7A6
	for <lists+dri-devel@lfdr.de>; Wed, 22 Feb 2023 16:23:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AAF710EA05;
	Wed, 22 Feb 2023 15:23:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A92710EA05
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Feb 2023 15:23:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0676BB815C8;
 Wed, 22 Feb 2023 15:23:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CE2DC433D2;
 Wed, 22 Feb 2023 15:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1677079411;
 bh=DQiMmdzoaF/dJutqCYfJ3egYITEZ/zDtJM+U9xI5WEs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BGdOCU5d+rDHLhFIStOTwsyB9Il/laUoKCVjPrlyymwgfPAo2QcQ4hfPROctZfhnU
 cCVWcL3hBoZy4qGXlRs+mRIma7k6/Nn52OaI13EZgpbHNDwy0t4ISAB3NyGo4hL9go
 cwZsfAolnLkhZE0JLZzn1JnHD3bNvYhff+ah7L8s+X81vJNGIT0sZls627lBcy8zYr
 pRvpmlwchC+J5Kp+bCyyBC0mW/IUUWmbprFTdzhf3YsLiOkABCYu4skZtz89gBifLG
 BeutjoCA2ndmD+3A+7FgJaqavbTMDGJOK3feLnghY1bqPzvJMYjA0AQ14o1BHgIXuZ
 BGfm0SHVUOYZQ==
Date: Wed, 22 Feb 2023 15:23:27 +0000
From: Lee Jones <lee@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] backlight: ktz8866: Convert to i2c's .probe_new()
Message-ID: <Y/Yzb7pWcMzSFYfG@google.com>
References: <20230127152639.1347229-1-u.kleine-koenig@pengutronix.de>
 <Y9eQ6QTngI18zUJn@google.com>
 <20230211230545.lv5g2f376rojlwyc@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230211230545.lv5g2f376rojlwyc@pengutronix.de>
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jianhua Lu <lujianhua000@gmail.com>,
 kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 12 Feb 2023, Uwe Kleine-König wrote:

> Hello Lee,
> 
> On Mon, Jan 30, 2023 at 09:42:01AM +0000, Lee Jones wrote:
> > On Fri, 27 Jan 2023, Uwe Kleine-König wrote:
> > 
> > > The probe function doesn't make use of the i2c_device_id * parameter so
> > > it can be trivially converted.
> > > 
> > > Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> > > ---
> > > Hello,
> > > 
> > > there is an ongoing effort to convert all drivers to .probe_new to
> > > eventually drop .probe with the i2c_device_id parameter. This driver
> > > currently sits in next so wasn't on my radar before.
> > > 
> > > My plan is to tackle that after the next merge window. So I ask you to
> > > either apply this patch during the next merge window or accept that it
> > > will go in via the i2c tree together with the patch that drops .probe().
> > > 
> > >  drivers/video/backlight/ktz8866.c | 5 ++---
> > >  1 file changed, 2 insertions(+), 3 deletions(-)
> > 
> > Applied, thanks
> 
> Thanks, this patch didn't make it into next yet though. Is there a
> problem other than pending tests before you publish it in your tree that
> gets pulled into next?

It's queued, ready to be submitted tomorrow.  Don't worry.

-- 
Lee Jones [李琼斯]
