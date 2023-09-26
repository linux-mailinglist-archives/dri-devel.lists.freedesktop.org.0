Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAEE37AE8BF
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 11:17:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0206E10E37B;
	Tue, 26 Sep 2023 09:17:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 347AB10E37B
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 09:17:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 85914B80EBA;
 Tue, 26 Sep 2023 09:17:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6890C433C7;
 Tue, 26 Sep 2023 09:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695719824;
 bh=BIyysZ/qJRqN0WjlvEhE3O9YSQ2fL55IakHxJk2wiFM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pk0oGlfNE3jFIafSlZ/PJM8crMk0kZpKbAl63Pt8xFxC6dE772Zo11TKkyC+qAfGv
 mC51S4m+kdv7pUDUxDBisK7C5anncKQhVgJKdSTAjChwzIR3g0dzfcWm6nXM303C8x
 x5cqGmxaFPyS3dDy9omSmLG7l27/pmd1rUYsWQMlfrRc8y6bCy5Nf2Otx86cV0BHdN
 HZL51tnpOzeE0oBMzUdzgADTZZEB89cocxYB0GD8TJw0OYtEWP5P3uW3GvK5C0i9YG
 ZUwDroczEB2Rd56K6DGUbvO+ptW1PmDnExiQnH0PaNBGD494RFJpE9SwdV+GAHG3qp
 IA+8vSTmRBB+w==
Date: Tue, 26 Sep 2023 10:16:59 +0100
From: Lee Jones <lee@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v2] backlight: pwm_bl: Disable PWM on shutdown and suspend
Message-ID: <20230926091659.GF9999@google.com>
References: <20230926084612.2074692-1-u.kleine-koenig@pengutronix.de>
 <20230926085336.czgrztefbrstzbw7@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230926085336.czgrztefbrstzbw7@pengutronix.de>
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
Cc: Aisheng Dong <aisheng.dong@nxp.com>, linux-pwm@vger.kernel.org,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 26 Sep 2023, Uwe Kleine-König wrote:

> On Tue, Sep 26, 2023 at 10:46:12AM +0200, Uwe Kleine-König wrote:
> > Since commit 00e7e698bff1 ("backlight: pwm_bl: Configure pwm only once
> > per backlight toggle") calling pwm_backlight_power_off() doesn't disable
> > the PWM any more. However this is necessary to suspend because PWM
> > drivers usually refuse to suspend if they are still enabled.
> > 
> > Also adapt shutdown to disable the PWM for similar reasons.
> > 
> > Fixes: 00e7e698bff1 ("backlight: pwm_bl: Configure pwm only once per backlight toggle")
> > Reported-by: Aisheng Dong <aisheng.dong@nxp.com>
> > Tested-by: Aisheng Dong <asheng.dong@nxp.com>
> 
> The two email addresses should actually be identical, the first one is
> the right one. (Failure introduced by
> https://lore.kernel.org/dri-devel/DB9PR04MB8477D4BBF1B31035789DA08680869@DB9PR04MB8477.eurprd04.prod.outlook.com
> and picked up by b4.) Lee, can you fixup or should I resend?

I'll probably forget by the time Daniel gets around to review.

Your call, but probably safer to turn it around yourself.

-- 
Lee Jones [李琼斯]
