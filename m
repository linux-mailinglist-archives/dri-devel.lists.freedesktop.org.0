Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C497AE81A
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 10:31:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F49110E377;
	Tue, 26 Sep 2023 08:31:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB4ED10E377
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 08:31:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 19D44CE12F6;
 Tue, 26 Sep 2023 08:31:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F53FC433C8;
 Tue, 26 Sep 2023 08:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695717071;
 bh=ZCDxwsZyOwa+nNRDkbNfSAVg8HokBeANzu0Swgv6opY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cge+92kI0dsZabKHFLZ7vaYhSSVwlhRsKDNkmuS8fSubucaBuPnayEYn7Gw5ObFnr
 EdJ7Fv0sBBbKM7DzxN7PLL90HD0RsXzni+lMO7qJiK80teQIp1r9fdskeSka7s1Aqr
 AeFX/VHPBHJ3Qp26UJ83CWhGe3CdgdWu0g6TTiZFFrnBX6X9yQeCgGtpNRy+5j0i40
 aRAT8YvCQwELWlPjFFGjVUoEP0tATtqBoOIfyd8sJi7Cvztsk6oVqOnxAH1HcAnDJx
 M7Mrsp6PZ0iHgGyBTVLKaLLv/Dc+T2DaeJ17mEcpsu813Ssi7fStaXtGCiyt75BgCG
 f+B6T3iz7D1Ng==
Date: Tue, 26 Sep 2023 09:31:06 +0100
From: Lee Jones <lee@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] backlight: pwm_bl: Disable PWM on shutdown and suspend
 disabled PWM emiting inactive state")
Message-ID: <20230926083106.GE9999@google.com>
References: <DB9PR04MB84779AF9758B7FE747C6693D80869@DB9PR04MB8477.eurprd04.prod.outlook.com>
 <20230322070352.xfwmnqyrao3mifuu@pengutronix.de>
 <DB9PR04MB8477FD24740251860648786380869@DB9PR04MB8477.eurprd04.prod.outlook.com>
 <20230322085129.jxxz55tbcxkc6usd@pengutronix.de>
 <20230926071744.oikg3ndaq6x7yjrw@pengutronix.de>
 <20230926083015.GD9999@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230926083015.GD9999@google.com>
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

On Tue, 26 Sep 2023, Lee Jones wrote:

> On Tue, 26 Sep 2023, Uwe Kleine-König wrote:
> 
> > Hello,
> > 
> > On Wed, Mar 22, 2023 at 09:51:29AM +0100, Uwe Kleine-König wrote:
> > > Since commit 00e7e698bff1 ("backlight: pwm_bl: Configure pwm only once
> > > per backlight toggle") calling pwm_backlight_power_off() doesn't disable
> > > the PWM any more. However this is necessary to suspend, because PWM
> > > drivers usually refuse to suspend if they are still enabled.
> > > 
> > > Also adapt shutdown to disable the PWM for similar reasons.
> > > 
> > > Fixes: 00e7e698bff1 ("backlight: pwm_bl: Configure pwm only once per backlight toggle")
> > > Reported-by: Aisheng Dong <aisheng.dong@nxp.com>
> > > Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> > 
> > This patch was never applied but I think it is still needed. I assume it
> > fell through the cracks?
> 
> This "patch" was sent half way through a thread and when opened in my
> mail client looks like a mail reply due to the quotes below the '---'.
> 
> I'd suggest sending this again.

You also have a copy/paste error in the subject line.

-- 
Lee Jones [李琼斯]
