Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E684D24AFDC
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 09:16:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 154536E8F5;
	Thu, 20 Aug 2020 07:15:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFF166E0FD;
 Wed, 19 Aug 2020 16:24:28 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id v13so21486627oiv.13;
 Wed, 19 Aug 2020 09:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HU4eQwextT3u0Vy8pHWyNShnAd/EOsS2z1U17KkaX1w=;
 b=Do1SU13c8m0ev7rC+aSlATz3YC7HLEYtrWvOJM3hlYx5tibAn4nY6QBTQ6sL63+y1B
 MMICOhoWO2QuUo7XJXcNmi2U+jZFkCQmxwKcysxTB45P8s8hyGWMfAV/b9TWZwGMUstf
 eQNrTEk4Md6ORX7QTkn+vE+7QuV40o6StptyB5lbRYfwqel6HisdptT26ZHXxM5fvMgf
 Hrtd8Cg5JcovJzKRBu4i1OQaNFicedwyX0Gjkgy9VMM/toVIToznUVdAB9xldZ2UK6eB
 IrMKr2f8qBsOPZBeTcYzlGRInoJUjiFOhM2YCLXROPBSSoWa8KVaeHXHoJOeD+LqB0Ea
 LpeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HU4eQwextT3u0Vy8pHWyNShnAd/EOsS2z1U17KkaX1w=;
 b=GQtZfoBlQ0GfLnxrz69JrH0uzF1XKeAKCLmI4qSt9Ep4TEIOazA13U9HG7b7GU7UEa
 7AIykoOzZbujdhEeC9VIiAcLJLVLyqHnKo4aTL5pS+URRgORDWgAE3WP/rccMFy7MXFw
 absa+Li5BXOWbhIUxfoAEtMxeno4EVJimI7WRhFp6v8h6X3EhoJDdR7qIwuS2SoPYfTX
 0R5+5KnITbH4Sx98X0q4kvHwUdCFiMDrWCczHNHfjsDmaLvwLHOxnv95RXXd8tMKGXdk
 gMstaLtfKR0rV/mW7S+y8vJ9x9EJlVyj5ExeiLg3aZp0rFCqvDnaA4gjO1zzKkBPed8z
 61Jw==
X-Gm-Message-State: AOAM531MKiMCrYsniIqh8d40jmBb/N2jn74U48CZ0xA8ocfd2+PuARzO
 R8vk6bc5ULoj0N1thMYowMFTZVdbb4T4J5T3SZA=
X-Google-Smtp-Source: ABdhPJzpfHTlGoLujvQ5GY5n5H9BSvs/wYOUntKm/P0xrLOUSJQWGq951RNy2Mt1jRO58Yz8dbZ6uoLPp4/f2bRhLs0=
X-Received: by 2002:a05:6808:4c5:: with SMTP id
 a5mr3863067oie.175.1597854268104; 
 Wed, 19 Aug 2020 09:24:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200817091617.28119-1-allen.cryptic@gmail.com>
 <20200817091617.28119-2-allen.cryptic@gmail.com>
 <b5508ca4-0641-7265-2939-5f03cbfab2e2@kernel.dk>
 <202008171228.29E6B3BB@keescook>
 <161b75f1-4e88-dcdf-42e8-b22504d7525c@kernel.dk>
 <202008171246.80287CDCA@keescook>
 <df645c06-c30b-eafa-4d23-826b84f2ff48@kernel.dk>
 <1597780833.3978.3.camel@HansenPartnership.com>
 <f3312928-430c-25f3-7112-76f2754df080@kernel.dk>
 <1597849185.3875.7.camel@HansenPartnership.com>
In-Reply-To: <1597849185.3875.7.camel@HansenPartnership.com>
From: Allen <allen.lkml@gmail.com>
Date: Wed, 19 Aug 2020 21:54:16 +0530
Message-ID: <CAOMdWSJRR0BhjJK1FxD7UKxNd5sk4ycmEX6TYtJjRNR6UFAj6Q@mail.gmail.com>
Subject: Re: [PATCH] block: convert tasklets to use new tasklet_setup() API
To: James Bottomley <James.Bottomley@hansenpartnership.com>
X-Mailman-Approved-At: Thu, 20 Aug 2020 07:14:47 +0000
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 linux-atm-general@lists.sourceforge.net, manohar.vanga@gmail.com,
 airlied@linux.ie, linux-hyperv@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kys@microsoft.com, anton.ivanov@cambridgegreys.com, devel@driverdev.osuosl.org,
 linux-s390@vger.kernel.org, linux1394-devel@lists.sourceforge.net,
 maximlevitsky@gmail.com, richard@nod.at, deller@gmx.de,
 jassisinghbrar@gmail.com, 3chas3@gmail.com, intel-gfx@lists.freedesktop.org,
 Jakub Kicinski <kuba@kernel.org>, mporter@kernel.crashing.org,
 jdike@addtoit.com, Kees Cook <keescook@chromium.org>, oakad@yahoo.com,
 s.hauer@pengutronix.de, linux-input@vger.kernel.org,
 linux-um@lists.infradead.org, linux-block@vger.kernel.org, broonie@kernel.org,
 openipmi-developer@lists.sourceforge.net, mitch@sfgoth.com,
 linux-arm-kernel@lists.infradead.org, Jens Axboe <axboe@kernel.dk>,
 linux-parisc@vger.kernel.org, netdev@vger.kernel.org, martyn@welchs.me.uk,
 dmitry.torokhov@gmail.com, linux-mmc@vger.kernel.org, sre@kernel.org,
 linux-spi@vger.kernel.org, alex.bou9@gmail.com,
 Allen Pais <allen.cryptic@gmail.com>, stefanr@s5r6.in-berlin.de,
 linux-ntb@googlegroups.com, Romain Perier <romain.perier@gmail.com>,
 shawnguo@kernel.org, David Miller <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> [...]
> > > Since both threads seem to have petered out, let me suggest in
> > > kernel.h:
> > >
> > > #define cast_out(ptr, container, member) \
> > >     container_of(ptr, typeof(*container), member)
> > >
> > > It does what you want, the argument order is the same as
> > > container_of with the only difference being you name the containing
> > > structure instead of having to specify its type.
> >
> > Not to incessantly bike shed on the naming, but I don't like
> > cast_out, it's not very descriptive. And it has connotations of
> > getting rid of something, which isn't really true.
>
> Um, I thought it was exactly descriptive: you're casting to the outer
> container.  I thought about following the C++ dynamic casting style, so
> out_cast(), but that seemed a bit pejorative.  What about outer_cast()?
>
> > FWIW, I like the from_ part of the original naming, as it has some
> > clues as to what is being done here. Why not just from_container()?
> > That should immediately tell people what it does without having to
> > look up the implementation, even before this becomes a part of the
> > accepted coding norm.
>
> I'm not opposed to container_from() but it seems a little less
> descriptive than outer_cast() but I don't really care.  I always have
> to look up container_of() when I'm using it so this would just be
> another macro of that type ...
>

 So far we have a few which have been suggested as replacement
for from_tasklet()

- out_cast() or outer_cast()
- from_member().
- container_from() or from_container()

from_container() sounds fine, would trimming it a bit work? like from_cont().

-- 
       - Allen
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
