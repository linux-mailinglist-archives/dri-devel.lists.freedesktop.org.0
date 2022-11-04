Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A1161A062
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 19:58:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A963210E867;
	Fri,  4 Nov 2022 18:58:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC4D510E10C
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 18:58:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6E787B82EFF;
 Fri,  4 Nov 2022 18:58:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA292C433D6;
 Fri,  4 Nov 2022 18:58:05 +0000 (UTC)
Date: Fri, 4 Nov 2022 14:58:04 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [RFC][PATCH v3 12/33] timers: dma-buf: Use
 timer_shutdown_sync() before freeing timer
Message-ID: <20221104145804.4ec8404e@rorschach.local.home>
In-Reply-To: <d916e29d-d098-c3f3-940a-37be6772ecb5@amd.com>
References: <20221104054053.431922658@goodmis.org>
 <20221104054914.085569465@goodmis.org>
 <20221104015444.57f73efb@rorschach.local.home>
 <d916e29d-d098-c3f3-940a-37be6772ecb5@amd.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Stephen Boyd <sboyd@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linaro-mm-sig@lists.linaro.org, Thomas Gleixner <tglx@linutronix.de>,
 Anna-Maria Gleixner <anna-maria@linutronix.de>,
 Andrew Morton <akpm@linux-foundation.org>, Guenter Roeck <linux@roeck-us.net>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 4 Nov 2022 08:15:53 +0100
Christian K=C3=B6nig <christian.koenig@amd.com> wrote:

> > index fb6e0a6ae2c9..5d3e7b503501 100644
> > --- a/drivers/dma-buf/st-dma-fence.c
> > +++ b/drivers/dma-buf/st-dma-fence.c
> > @@ -412,7 +412,7 @@ static int test_wait_timeout(void *arg)
> >  =20
> >   	err =3D 0;
> >   err_free:
> > -	del_timer_sync(&wt.timer);
> > +	timer_shutdown_sync(&wt.timer); =20
>=20
> Mhm, what exactly is the benefit of renaming the function?
>=20
> Not that I'm against the change, but my thinking is more if there are=20
> more functions which don't re-arm the time than those which do that then=
=20
> why not forbid it in general?

Timers are more often re-armed then not. I had to look for the
locations where del_timer*() was called just before freeing, and other
locations where they are freed later.

I didn't rename del_timer_sync() to timer_shutdown_sync(), this version
renamed the new "del_timer_shutdown()" to "timer_shutdown_sync()".

Maybe I'm just confused at what you are asking.

-- Steve
