Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 366B336CA6E
	for <lists+dri-devel@lfdr.de>; Tue, 27 Apr 2021 19:35:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 068F16E9A9;
	Tue, 27 Apr 2021 17:35:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail2.protonmail.ch (mail2.protonmail.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EA876E9A9
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Apr 2021 17:35:24 +0000 (UTC)
Date: Tue, 27 Apr 2021 17:35:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1619544922;
 bh=QNrbECCQvl+CPyFFyO5xFKvOf7MIlAPdvHg7GH/dlfE=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=fjo2mMBbwEAJoY5qWcpkPJPf9NoOPcuU0J2zeLLPW0Dq1ZlgaTek9JQnJ+vkGuni5
 fpVVdAhSbbSXKGwj3AMEi2FSwq6QBeofgdLvniiCQVLZPdyH+FMm3IJ1zbM7wMMvfX
 q/uzsWWcqK/28ullUbMmrum8CtffgpvvWx5caOe0/GJtvb8hepGMz6Ow7v9cnKDeYl
 W0gJOijGB3+u/758Mm083o+L7oSrh0JGWqwTSmEE1r+GvSlq3JfZgj5VRG1+5AZhKh
 +mFyxClc/Bk4V/QwlMfPy4dC5EYVnVBr6pqn8NK+wIifAzr/oT9JmLTcNGIMQg/9Q5
 eRjzYRy+Vjo5w==
To: Lucas Stach <l.stach@pengutronix.de>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [Mesa-dev] [RFC] Linux Graphics Next: Explicit fences everywhere
 and no BO fences - initial proposal
Message-ID: <s8QVKcJeMhEBcoOS9h7UzE_fUG-VKfgso3HbaM37xGhbBu6i966cTiD_UY1lBbiOMl-VbGyu7r0eBS3vTY8DWSUItsLrf_ISzDuT9vbRs8I=@emersion.fr>
In-Reply-To: <23ea06c825279c7a9f7678b335c7f89437d387ed.camel@pengutronix.de>
References: <CAAxE2A4mpapnCE7uw8GNWkaRR4jXeoz9qa9j=9XknjR3yeq3YQ@mail.gmail.com>
 <CAAxE2A6APcJBwnbq58HOqc5bkHMsrzpiNnrso85kfBkRowwz+g@mail.gmail.com>
 <fada1543-612d-369e-765c-f90b718c2cfa@gmail.com>
 <CAAxE2A7a5+q2j1txN-FxWBvKOoPSRKAZ9iPPeTSjMZDbgJCU-A@mail.gmail.com>
 <CAKMK7uHXSnDetsK1VG-X4ZwUZdA819wUKd=YMgqF=yvAQ6Y2vw@mail.gmail.com>
 <CAAxE2A4BhDZL2rrV1KEXPzmKnOq4DXmkFm=4K5XZoY-Cj0uT=Q@mail.gmail.com>
 <735e0d2e-f2c9-c546-ea6c-b5bbb0fe03a6@gmail.com>
 <CAAxE2A4FwZ11_opL++TPUViTOD6ZpV5b3MR+rTDUPvzqYz-oeQ@mail.gmail.com>
 <23ea06c825279c7a9f7678b335c7f89437d387ed.camel@pengutronix.de>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: =?utf-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 =?utf-8?Q?Marek_Ol=C5=A1=C3=A1k?= <maraeo@gmail.com>,
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, April 27th, 2021 at 7:31 PM, Lucas Stach <l.stach@pengutronix.de> wrote:

> > Ok. So that would only make the following use cases broken for now:
> >
> > - amd render -> external gpu
> > - amd video encode -> network device
>
> FWIW, "only" breaking amd render -> external gpu will make us pretty
> unhappy

I concur. I have quite a few users with a multi-GPU setup involving
AMD hardware.

Note, if this brokenness can't be avoided, I'd prefer a to get a clear
error, and not bad results on screen because nothing is synchronized
anymore.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
