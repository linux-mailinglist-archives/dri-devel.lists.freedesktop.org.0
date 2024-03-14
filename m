Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 375B187BB26
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 11:20:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 760C410EDC0;
	Thu, 14 Mar 2024 10:20:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aGd6GxVu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 809AB10FA35
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 10:20:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9A77061616;
 Thu, 14 Mar 2024 10:20:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8974BC433F1;
 Thu, 14 Mar 2024 10:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710411640;
 bh=ngB6lPw5E5YduqZY9oFh10xcMS09OfDy2k7K4Z+l75I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aGd6GxVugJMP71VjabhDcHE4Sa68HXsLA3xQe5Uy9CBAJ/OGNgezLljw1E0kxjO11
 1i/anEQCKL2CVaoxNtQAz1tUyNQ20ZdsGlyKspkkmUFojfZ4OFKOZEH/MLz16Kj4J4
 dlhuOL/zxQBeh7Y+H6xqK0v8GDdgr780JPmciPgq4iDc4UhMLVTB3tiOCSwVn8CXmN
 RZdgmVi7oIhcBAZzLfeB6xDsT1wuMK1s/7yTA4gxECoE00jxW4Yc/Lj6WYJ8tYUG7u
 ZqKnnP2zn3g9HFdN5mnhDYOF+I7e9HNFjfrTFH0VXuS5Y6cBSq2lT1IbXVEjda9vS9
 bxeH905BBub1g==
Date: Thu, 14 Mar 2024 10:20:35 +0000
From: Lee Jones <lee@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 kernel@pengutronix.de, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] backlight: lp8788: Drop support for platform data
Message-ID: <20240314102035.GI1522089@google.com>
References: <20240313124828.861731-2-u.kleine-koenig@pengutronix.de>
 <7nvqboywxhviyuzkiesy4qfqybxx7vc5sw2seluc3dwnhk3q5h@hlzwxhnm2q6r>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7nvqboywxhviyuzkiesy4qfqybxx7vc5sw2seluc3dwnhk3q5h@hlzwxhnm2q6r>
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

On Wed, 13 Mar 2024, Uwe Kleine-König wrote:

> Hello,
> 
> On Wed, Mar 13, 2024 at 01:48:27PM +0100, Uwe Kleine-König wrote:
> > diff --git a/drivers/video/backlight/lp8788_bl.c b/drivers/video/backlight/lp8788_bl.c
> > index 31f97230ee50..f3a89677c31c 100644
> > --- a/drivers/video/backlight/lp8788_bl.c
> > +++ b/drivers/video/backlight/lp8788_bl.c
> > @@ -12,7 +12,6 @@
> >  #include <linux/mfd/lp8788.h>
> >  #include <linux/module.h>
> >  #include <linux/platform_device.h>
> > -#include <linux/pwm.h>
> >  #include <linux/slab.h>
> >  
> >  /* Register address */
> > @@ -31,149 +30,41 @@
> >  #define MAX_BRIGHTNESS			127
> >  #define DEFAULT_BL_NAME			"lcd-backlight"
> >  
> > -struct lp8788_bl_config {
> > -	enum lp8788_bl_ctrl_mode bl_mode;
> > -	enum lp8788_bl_dim_mode dim_mode;
> > -	enum lp8788_bl_full_scale_current full_scale;
> > -	enum lp8788_bl_ramp_step rise_time;
> > -	enum lp8788_bl_ramp_step fall_time;
> > -	enum pwm_polarity pwm_pol;
> > -};
> > -
> >  struct lp8788_bl {
> >  	struct lp8788 *lp;
> >  	struct backlight_device *bl_dev;
> > -	struct lp8788_backlight_platform_data *pdata;
> > -	enum lp8788_bl_ctrl_mode mode;
> >  	struct pwm_device *pwm;
> 
> Actually this pwm_device member should be dropped, too. I wonder why
> this even passes a W=1 build without a warning ...
> 
> @Lee: Feel free to fix this up while applying, or tell me if you prefer
> an incremental fixup or a complete v2.

Either of the last 2 options would be fine.

-- 
Lee Jones [李琼斯]
