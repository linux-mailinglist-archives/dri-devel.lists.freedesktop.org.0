Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B34402528E0
	for <lists+dri-devel@lfdr.de>; Wed, 26 Aug 2020 10:05:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0D6A894DD;
	Wed, 26 Aug 2020 08:05:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 242E06E9EE;
 Wed, 26 Aug 2020 01:51:48 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id a5so163729wrm.6;
 Tue, 25 Aug 2020 18:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6lKBXswTrzhA0xBsr6HB8AlB5+bACM8/QHtln5EsmDM=;
 b=rkPU8zA6FnvPI7YRdwlrF32Z+jufZRPGDhsVbublBxI+2WdfyrQZ4OMYugj2LjMgRs
 tcBC2iVxYnWeg8Zk6YWzQfE0csZvqLsQKSxRKrpJnxvpSdJ9HVsaxBuVVCZ33a7Fy89F
 YzL00nv71TEx1KwJewv+LaAx654GeLawZ3dB08BJtkewTW0RxdimmA59/2c32/oJxdK5
 dSKP0GfmMvAUQJfWlO1JkSN5McliJO+sig5zbM32H0/Kuj9D+O0+2QWE9ikcOBAgMoCE
 knF+3yVSHzD+dH7rwDtBk3Dij3c2i2NaVRbX/WHThEgypBISYgNE6EdHQjalStrd+n7R
 ERAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6lKBXswTrzhA0xBsr6HB8AlB5+bACM8/QHtln5EsmDM=;
 b=Jir5oU4JYAc/XwzFornCF+JetY+nb0W9W/2VK191K3ybnniVSatqirM8g3123gXWU7
 gbDq1VhNYDde/t6awFAGHqnXD+0OJzCuy7ScZJltJgAhFppedpQoz3QRe6WUNvdcdotT
 RrLX53clzORfON5s0osb5i17uumyV87qyHKJ/I826erHD4mbnx08XB4kGSqmF3Hoj4Qh
 hAdeCwj45X2ARPmBmx+wfTbBLTSZ57uk6UjOLb94ADnQH4VRkVE9bccuz2b7MB2cemij
 cefWQVL3N4bUgDFduU82yvb2Ul0JiXxYmPj++glmd2EZNxNB70dZsbruAT96LVgRXv2D
 W17g==
X-Gm-Message-State: AOAM531h1I51DHsvyKU3cRxxTFTeEouXdDYdtOICUXnc7L/neGNsCmTz
 WJxKNqMpDWc1UStY+6JCj6PGiUCzefDMLvIEKtE=
X-Google-Smtp-Source: ABdhPJyeqlKj5YPc50Em7rO4ODLMTr2DC/m+jfMJDMOpF+XoOI2kKLAaJQ+LNrc4dhPoiuNEDU0+R/Ls8lv1xf0wUss=
X-Received: by 2002:adf:db43:: with SMTP id f3mr14164955wrj.219.1598406706678; 
 Tue, 25 Aug 2020 18:51:46 -0700 (PDT)
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
 <CAOMdWSJRR0BhjJK1FxD7UKxNd5sk4ycmEX6TYtJjRNR6UFAj6Q@mail.gmail.com>
 <1597873172.4030.2.camel@HansenPartnership.com>
In-Reply-To: <1597873172.4030.2.camel@HansenPartnership.com>
From: Allen Pais <allen.cryptic@gmail.com>
Date: Wed, 26 Aug 2020 07:21:35 +0530
Message-ID: <CAEogwTCH8qqjAnSpT0GDn+NuAps8dNbfcPVQ9h8kfOWNbzrD0w@mail.gmail.com>
Subject: Re: [PATCH] block: convert tasklets to use new tasklet_setup() API
To: James Bottomley <James.Bottomley@hansenpartnership.com>
X-Mailman-Approved-At: Wed, 26 Aug 2020 08:04:49 +0000
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
 dri-devel@lists.freedesktop.org, sre@kernel.org, kys@microsoft.com,
 anton.ivanov@cambridgegreys.com, devel@driverdev.osuosl.org,
 linux-s390@vger.kernel.org, linux1394-devel@lists.sourceforge.net,
 maximlevitsky@gmail.com, richard@nod.at, deller@gmx.de,
 jassisinghbrar@gmail.com, linux-spi@vger.kernel.org, 3chas3@gmail.com,
 intel-gfx@lists.freedesktop.org, Jakub Kicinski <kuba@kernel.org>,
 mporter@kernel.crashing.org, jdike@addtoit.com,
 Kees Cook <keescook@chromium.org>, oakad@yahoo.com, s.hauer@pengutronix.de,
 linux-input@vger.kernel.org, linux-um@lists.infradead.org,
 linux-block@vger.kernel.org, broonie@kernel.org,
 openipmi-developer@lists.sourceforge.net, mitch@sfgoth.com,
 linux-arm-kernel@lists.infradead.org, Jens Axboe <axboe@kernel.dk>,
 linux-parisc@vger.kernel.org, netdev@vger.kernel.org, martyn@welchs.me.uk,
 dmitry.torokhov@gmail.com, linux-mmc@vger.kernel.org,
 Allen <allen.lkml@gmail.com>, linux-kernel@vger.kernel.org,
 alex.bou9@gmail.com, stefanr@s5r6.in-berlin.de, linux-ntb@googlegroups.com,
 Romain Perier <romain.perier@gmail.com>, shawnguo@kernel.org,
 David Miller <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 20, 2020 at 3:09 AM James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
>
> On Wed, 2020-08-19 at 21:54 +0530, Allen wrote:
> > > [...]
> > > > > Since both threads seem to have petered out, let me suggest in
> > > > > kernel.h:
> > > > >
> > > > > #define cast_out(ptr, container, member) \
> > > > >     container_of(ptr, typeof(*container), member)
> > > > >
> > > > > It does what you want, the argument order is the same as
> > > > > container_of with the only difference being you name the
> > > > > containing structure instead of having to specify its type.
> > > >
> > > > Not to incessantly bike shed on the naming, but I don't like
> > > > cast_out, it's not very descriptive. And it has connotations of
> > > > getting rid of something, which isn't really true.
> > >
> > > Um, I thought it was exactly descriptive: you're casting to the
> > > outer container.  I thought about following the C++ dynamic casting
> > > style, so out_cast(), but that seemed a bit pejorative.  What about
> > > outer_cast()?
> > >
> > > > FWIW, I like the from_ part of the original naming, as it has
> > > > some clues as to what is being done here. Why not just
> > > > from_container()? That should immediately tell people what it
> > > > does without having to look up the implementation, even before
> > > > this becomes a part of the accepted coding norm.
> > >
> > > I'm not opposed to container_from() but it seems a little less
> > > descriptive than outer_cast() but I don't really care.  I always
> > > have to look up container_of() when I'm using it so this would just
> > > be another macro of that type ...
> > >
> >
> >  So far we have a few which have been suggested as replacement
> > for from_tasklet()
> >
> > - out_cast() or outer_cast()
> > - from_member().
> > - container_from() or from_container()
> >
> > from_container() sounds fine, would trimming it a bit work? like
> > from_cont().
>
> I'm fine with container_from().  It's the same form as container_of()
> and I think we need urgent agreement to not stall everything else so
> the most innocuous name is likely to get the widest acceptance.

Kees,

  Will you be  sending the newly proposed API to Linus? I have V2
which uses container_from()
ready to be sent out.

Thanks.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
