Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E804A670BA
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 11:06:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21DCE10E0E8;
	Tue, 18 Mar 2025 10:06:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dzMzJb4S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC92910E0E8
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 10:06:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 8A7C9A48EAE;
 Tue, 18 Mar 2025 10:00:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B009C4CEDD;
 Tue, 18 Mar 2025 10:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742292360;
 bh=T3bHKUxclsfhdannYbovFZH5KGdJa2QdzkUB8e9znU4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dzMzJb4SYQBTXA1fP2qUbk6QZQeKBJecnbTtbEdkkJb3kAPSrIUnZlr5P8QdGY68+
 zbhh7By8hO7XZM+Qf+LLtKDkPYlunvY9wQWTcY6KqzpGxC4NFEZIy28CIXp2JoJ3Yv
 oh0r06rr3oLVN8PySEjo0EQKzeLzGy2TBt8fyfgnDGmlIMNzT2ZJFjZP8DMqf/+1Oh
 4CgbfwaGqLK2GJQ9umvakEflJlCFwKOREQY82ItlK32kqNQ2/Ip2XJe62Td0Yzaxgi
 n/D77+0zWy7pfruNohI7eS7xl95QNEg0B7N8Qe/JReADC78vc1XfAOZ8GTri71RE+C
 tHIRuBxNdtwvg==
Date: Tue, 18 Mar 2025 10:05:55 +0000
From: Daniel Thompson <danielt@kernel.org>
To: Sebastian Reichel <sre@kernel.org>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
 Abel Vesa <abel.vesa@linaro.org>, Lee Jones <lee@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Johan Hovold <johan@kernel.org>, linux-pwm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] backlight: pwm_bl: Read back PWM period from provider
Message-ID: <Z9lFg98srzYivGoI@aspen.lan>
References: <20250226-pwm-bl-read-back-period-from-hw-v1-1-ccd1df656b23@linaro.org>
 <xltamao27utfrsax2pc6mh5tthanmrqszz4k7gyw3knqkm24xp@4tydmhfh6g4j>
 <cmjyaveolhjtfhqbjpc6ghh7g2f5jmeyavoms5lqup6dyidngl@ljvxgoyw57md>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cmjyaveolhjtfhqbjpc6ghh7g2f5jmeyavoms5lqup6dyidngl@ljvxgoyw57md>
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

On Thu, Feb 27, 2025 at 04:06:47AM +0100, Sebastian Reichel wrote:
> Hi,
>
> On Wed, Feb 26, 2025 at 05:34:50PM +0100, Uwe Kleine-König wrote:
> > On Wed, Feb 26, 2025 at 05:31:08PM +0200, Abel Vesa wrote:
> > > The current implementation assumes that the PWM provider will be able to
> > > meet the requested period, but that is not always the case. Some PWM
> > > providers have limited HW configuration capabilities and can only
> > > provide a period that is somewhat close to the requested one. This
> > > simply means that the duty cycle requested might either be above the
> > > PWM's maximum value or the 100% duty cycle is never reached.
> >
> > If you request a state with 100% relative duty cycle you should get 100%
> > unless the hardware cannot do that. Which PWM hardware are you using?
> > Which requests are you actually doing that don't match your expectation?
>
> drivers/leds/rgb/leds-qcom-lpg.c (which probably should at least get
> a MAINTAINERS entry to have you CC'd considering all the PWM bits in
> it). See the following discussion (I point you to my message in the
> middle of a thread, which has a summary and probably is a good
> starting point):
>
> https://lore.kernel.org/all/vc7irlp7nuy5yvkxwb5m7wy7j7jzgpg73zmajbmq2zjcd67pd2@cz2dcracta6w/

I had a quick glance at this thread.

It sounded to me like the PWM driver was scaling the requested period
to match h/ware capability but then neglected to scale the requested
duty cycle accordingly. That means the qcomm PWM driver programming a
fractional value into the hardware that was not being anywhere close
to duty_cycle / period.

So the recommendation was to fix the PWM driver rather than have
pwm_bl.c work around it?


Daniel.
