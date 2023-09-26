Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 864027AE817
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 10:30:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8651110E372;
	Tue, 26 Sep 2023 08:30:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2965910E372
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 08:30:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 3BDBECE12E5;
 Tue, 26 Sep 2023 08:30:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74622C433C7;
 Tue, 26 Sep 2023 08:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695717020;
 bh=1KWbLzquAwU/B/ON0zh3ARW1/mjPU9ppWT7SEVnyDnA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gIB7ZMHmyr4U9VrGTW6fb/xRGmazA+QF92yVzfp6wgpcT3RmDa/Vlfyfkx0L3Yx3D
 nmJRzkkWV/vS8EC8D9q0owAjZgjfwHt2a/ESsN5cmaU4fj2EIeKLPgMinUW7pSEVd0
 XPHk6HQl6tNnVSGOYAWhyuvUgAHZFJBYeg5sXENDOm7AQm9Rn3uuWgjmed69whPcxe
 qYAxknPVHimHuIYYtwKh3PASHTgN1XPW/VjiUG2UWVEETrMA+P00XiscG/AG0xHHE1
 chcHV8H6TlCUiQMHL52dC8RsgJxPSoEV+yaJ5f/u4O7zNLfnWI6J8CbwADQYZ2rh0E
 L9EZhQCGzpjUQ==
Date: Tue, 26 Sep 2023 09:30:15 +0100
From: Lee Jones <lee@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] backlight: pwm_bl: Disable PWM on shutdown and suspend
 disabled PWM emiting inactive state")
Message-ID: <20230926083015.GD9999@google.com>
References: <DB9PR04MB84779AF9758B7FE747C6693D80869@DB9PR04MB8477.eurprd04.prod.outlook.com>
 <20230322070352.xfwmnqyrao3mifuu@pengutronix.de>
 <DB9PR04MB8477FD24740251860648786380869@DB9PR04MB8477.eurprd04.prod.outlook.com>
 <20230322085129.jxxz55tbcxkc6usd@pengutronix.de>
 <20230926071744.oikg3ndaq6x7yjrw@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230926071744.oikg3ndaq6x7yjrw@pengutronix.de>
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
Cc: Aisheng Dong <aisheng.dong@nxp.com>,
 "daniel.thompson@linaro.org" <daniel.thompson@linaro.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, "deller@gmx.de" <deller@gmx.de>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 26 Sep 2023, Uwe Kleine-König wrote:

> Hello,
> 
> On Wed, Mar 22, 2023 at 09:51:29AM +0100, Uwe Kleine-König wrote:
> > Since commit 00e7e698bff1 ("backlight: pwm_bl: Configure pwm only once
> > per backlight toggle") calling pwm_backlight_power_off() doesn't disable
> > the PWM any more. However this is necessary to suspend, because PWM
> > drivers usually refuse to suspend if they are still enabled.
> > 
> > Also adapt shutdown to disable the PWM for similar reasons.
> > 
> > Fixes: 00e7e698bff1 ("backlight: pwm_bl: Configure pwm only once per backlight toggle")
> > Reported-by: Aisheng Dong <aisheng.dong@nxp.com>
> > Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> This patch was never applied but I think it is still needed. I assume it
> fell through the cracks?

This "patch" was sent half way through a thread and when opened in my
mail client looks like a mail reply due to the quotes below the '---'.

I'd suggest sending this again.

-- 
Lee Jones [李琼斯]
