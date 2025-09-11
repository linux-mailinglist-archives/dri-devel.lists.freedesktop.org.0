Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D642AB52B7A
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 10:21:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1EDC10E313;
	Thu, 11 Sep 2025 08:21:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bxkIKVq1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D02E110E313
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 08:21:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 60BE343EA4;
 Thu, 11 Sep 2025 08:21:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EF07C4CEF1;
 Thu, 11 Sep 2025 08:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757578912;
 bh=HjGv5e8J09LIWOPPU09kKH6Zwo3LDbgwb9s+ej/NZaw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bxkIKVq1HzbqhrWH8kOhXRJrgPCiixe9B1xVhexbh4XIJPUyiyiDnRg/dR6QCoiZF
 QeuBlZXkE3EuDdls9lv8rb7m5dZZpMoOjvzvSuA+rTrCc4rGZwfAGIoN0yKLFz1073
 mulxlTEeusgLYSQ+KsgCGAgBtz6Owp0OQg+JC/Ruq5YoOS/kSDNFEzQexLW5GQwlr4
 6zJ8bo2PDqTdlndzDQze1kRRdQJppnWxWa1i4UWPnGkr9pd96IhHiImK1moL192xRw
 zCXf6Q+41544pZR1yPiIQ+f5o6BfdcoiIWmBZ9XnKs21Yuqyc8vG5K4Li62rRBTCF5
 FJg9GPAPYovqw==
Date: Thu, 11 Sep 2025 09:21:47 +0100
From: Lee Jones <lee@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Flavio Suligoi <f.suligoi@asem.it>, Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-pwm@vger.kernel.org
Subject: Re: [PATCH 0/2] backlight: mp3309c: Drop pwm_apply_args()
Message-ID: <20250911082147.GE9224@google.com>
References: <cover.1751361465.git.u.kleine-koenig@baylibre.com>
 <175680932706.2261091.9987211835426797993.b4-ty@kernel.org>
 <zkqqw2jxtx7mhwbck5jr5kgdg5ze5bk65aqarpdzl2ieh2hdj5@fnm5lybd227v>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <zkqqw2jxtx7mhwbck5jr5kgdg5ze5bk65aqarpdzl2ieh2hdj5@fnm5lybd227v>
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

On Tue, 09 Sep 2025, Uwe Kleine-König wrote:

> Hello Lee,
> 
> On Tue, Sep 02, 2025 at 11:35:27AM +0100, Lee Jones wrote:
> > On Tue, 01 Jul 2025 11:22:35 +0200, Uwe Kleine-König wrote:
> > > the first patch of this series is what I really care about: There are
> > > hardly any drivers left that use pwm_apply_args(). When all of them are
> > > converted to not use it any more, I intend to drop that function.
> > > 
> > > The 2nd patch is just a change that I noticed while editing the driver
> > > that is IMHO nice. If you don't agree and only apply the first patch, I
> > > won't argue. It's an alternative approach to what Daniel Thompson did in
> > > commit 7ee6478d5aa9 ("backlight: mp3309c: Fully initialize
> > > backlight_properties during probe").
> > > 
> > > [...]
> > 
> > Applied, thanks!
> > 
> > [1/2] backlight: mp3309c: Drop pwm_apply_args()
> >       commit: d22caa15de3a11b503157aec079cad4bf305ff47
> > [2/2] backlight: mp3309c: Initialize backlight properties without memset
> >       commit: 71ca0594c11b4030c6dece9ba9b080d652a82473
> 
> I would expect to see these commits in your repo at
> https://git.kernel.org/pub/scm/linux/kernel/git/lee/backlight.git, but
> the exact commits don't exist there and if the patches are included
> under a different commit-id it's not obvious to me in which branch. Did
> you forget to push?

Yes.  Now pushed.  Sorry for the delay.

-- 
Lee Jones [李琼斯]
