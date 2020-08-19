Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEACE24A242
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 17:00:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17ED76E3D6;
	Wed, 19 Aug 2020 14:59:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com
 [66.63.167.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EEDF6E3D6;
 Wed, 19 Aug 2020 14:59:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by bedivere.hansenpartnership.com (Postfix) with ESMTP id D115F8EE17F;
 Wed, 19 Aug 2020 07:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
 s=20151216; t=1597849189;
 bh=7PMu9izfvJP0Yqog7vxhcEQb9h62GDKPX1If4m+L8R0=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=OjUAwUTp/ItAZSlbV+f5fOCaWVzt9DqIN+w9yoJxaEE0gnHE6rZZVb54+Hz0c5ZZE
 Hb/3aibCu54t6gcW2aVqbWIIDHBKiOLbR/fOvAY90fW0SUrQP0QkX8+CeCZ+PSzzdQ
 ViQuLsoRKTFDhSIJnCWv76g7gqa9l4AuHedfCKt8=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id XOU0COqUWmkB; Wed, 19 Aug 2020 07:59:49 -0700 (PDT)
Received: from [153.66.254.174] (c-73-35-198-56.hsd1.wa.comcast.net
 [73.35.198.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 6C2C88EE0E9;
 Wed, 19 Aug 2020 07:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
 s=20151216; t=1597849189;
 bh=7PMu9izfvJP0Yqog7vxhcEQb9h62GDKPX1If4m+L8R0=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=OjUAwUTp/ItAZSlbV+f5fOCaWVzt9DqIN+w9yoJxaEE0gnHE6rZZVb54+Hz0c5ZZE
 Hb/3aibCu54t6gcW2aVqbWIIDHBKiOLbR/fOvAY90fW0SUrQP0QkX8+CeCZ+PSzzdQ
 ViQuLsoRKTFDhSIJnCWv76g7gqa9l4AuHedfCKt8=
Message-ID: <1597849185.3875.7.camel@HansenPartnership.com>
Subject: Re: [PATCH] block: convert tasklets to use new tasklet_setup() API
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Jens Axboe <axboe@kernel.dk>, Kees Cook <keescook@chromium.org>
Date: Wed, 19 Aug 2020 07:59:45 -0700
In-Reply-To: <f3312928-430c-25f3-7112-76f2754df080@kernel.dk>
References: <20200817091617.28119-1-allen.cryptic@gmail.com>
 <20200817091617.28119-2-allen.cryptic@gmail.com>
 <b5508ca4-0641-7265-2939-5f03cbfab2e2@kernel.dk>
 <202008171228.29E6B3BB@keescook>
 <161b75f1-4e88-dcdf-42e8-b22504d7525c@kernel.dk>
 <202008171246.80287CDCA@keescook>
 <df645c06-c30b-eafa-4d23-826b84f2ff48@kernel.dk>
 <1597780833.3978.3.camel@HansenPartnership.com>
 <f3312928-430c-25f3-7112-76f2754df080@kernel.dk>
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
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
Cc: ulf.hansson@linaro.org, linux-atm-general@lists.sourceforge.net,
 manohar.vanga@gmail.com, airlied@linux.ie, Allen Pais <allen.lkml@gmail.com>,
 linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kys@microsoft.com,
 anton.ivanov@cambridgegreys.com, devel@driverdev.osuosl.org,
 linux-s390@vger.kernel.org, linux1394-devel@lists.sourceforge.net,
 maximlevitsky@gmail.com, richard@nod.at, deller@gmx.de,
 jassisinghbrar@gmail.com, 3chas3@gmail.com, intel-gfx@lists.freedesktop.org,
 kuba@kernel.org, mporter@kernel.crashing.org, jdike@addtoit.com,
 oakad@yahoo.com, s.hauer@pengutronix.de, linux-input@vger.kernel.org,
 linux-um@lists.infradead.org, linux-block@vger.kernel.org, broonie@kernel.org,
 openipmi-developer@lists.sourceforge.net, mitch@sfgoth.com,
 linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
 netdev@vger.kernel.org, martyn@welchs.me.uk, dmitry.torokhov@gmail.com,
 linux-mmc@vger.kernel.org, sre@kernel.org, linux-spi@vger.kernel.org,
 alex.bou9@gmail.com, Allen Pais <allen.cryptic@gmail.com>,
 stefanr@s5r6.in-berlin.de, linux-ntb@googlegroups.com,
 Romain Perier <romain.perier@gmail.com>, shawnguo@kernel.org,
 davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2020-08-19 at 07:00 -0600, Jens Axboe wrote:
> On 8/18/20 1:00 PM, James Bottomley wrote:
[...]
> > Since both threads seem to have petered out, let me suggest in
> > kernel.h:
> > 
> > #define cast_out(ptr, container, member) \
> > 	container_of(ptr, typeof(*container), member)
> > 
> > It does what you want, the argument order is the same as
> > container_of with the only difference being you name the containing
> > structure instead of having to specify its type.
> 
> Not to incessantly bike shed on the naming, but I don't like
> cast_out, it's not very descriptive. And it has connotations of
> getting rid of something, which isn't really true.

Um, I thought it was exactly descriptive: you're casting to the outer
container.  I thought about following the C++ dynamic casting style, so
out_cast(), but that seemed a bit pejorative.  What about outer_cast()?

> FWIW, I like the from_ part of the original naming, as it has some
> clues as to what is being done here. Why not just from_container()?
> That should immediately tell people what it does without having to
> look up the implementation, even before this becomes a part of the
> accepted coding norm.

I'm not opposed to container_from() but it seems a little less
descriptive than outer_cast() but I don't really care.  I always have
to look up container_of() when I'm using it so this would just be
another macro of that type ...

James

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
