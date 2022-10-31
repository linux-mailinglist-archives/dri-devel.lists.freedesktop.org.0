Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B5C61354C
	for <lists+dri-devel@lfdr.de>; Mon, 31 Oct 2022 13:05:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0760910E1B5;
	Mon, 31 Oct 2022 12:05:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8966D10E1B5
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Oct 2022 12:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inria.fr; s=dc;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=14iICmGII8xNulZN/p1BaMqaiaz+48D2pzhmrN7vrkw=;
 b=SMzbMxp3Jf1dRIc5FmBSL9JLpH5ta5npmYLBqOinHldFs9pUVeFX/96a
 4quxcpxbU4Tm4feIFzjjkqEWTHeZXIwcyNk8AMSCwpoCkJ9eUh5ntyAo9
 ZCUyEOwlbDdXRVueJLZYZpzonpa7bwL5z0F9UHrXC+TPhCZpTQNBGVB5w o=;
Authentication-Results: mail2-relais-roc.national.inria.fr;
 dkim=none (message not signed) header.i=none;
 spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr;
 dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.95,227,1661810400"; d="scan'208";a="72400942"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
 by mail2-relais-roc.national.inria.fr with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2022 13:05:33 +0100
Date: Mon, 31 Oct 2022 13:05:32 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
To: Deepak R Varma <drv@mailo.com>
Subject: Re: [PATCH] staging: fbtft: Use ARRAY_SIZE() to get argument count
In-Reply-To: <Y1+YC5OuycA5hLFx@ubunlion>
Message-ID: <7dc9b4d2-413-3f65-1381-b164d810c3ee@inria.fr>
References: <Y1vZXUi0Bjiub8HZ@ubunlion> <Y1zXIjCe3LGwApWD@kroah.com>
 <Y11b0oCmle2pbRel@ubunlion> <alpine.DEB.2.22.394.2210291931590.2917@hadrien>
 <Y191LI7zKVRA5LEb@ubunlion> <Y1+YC5OuycA5hLFx@ubunlion>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: linux-fbdev@vger.kernel.org, outreachy@lists.linux.dev,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Julia Lawall <julia.lawall@inria.fr>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On Mon, 31 Oct 2022, Deepak R Varma wrote:

> On Mon, Oct 31, 2022 at 12:41:40PM +0530, Deepak Varma wrote:
> > On Sat, Oct 29, 2022 at 07:34:26PM +0200, Julia Lawall wrote:
> > >
> > >
> > > On Sat, 29 Oct 2022, Deepak R Varma wrote:
> > >
> > > > On Sat, Oct 29, 2022 at 09:32:50AM +0200, Greg Kroah-Hartman wrote:
> > > > > On Fri, Oct 28, 2022 at 07:00:05PM +0530, Deepak R Varma wrote:
> > > > > > The ARRAY_SIZE(foo) macro should be preferred over sizeof operator
> > > > > > based computation such as sizeof(foo)/sizeof(foo[0]) for finding
> > > > > > number of elements in an array. Issue identified using coccicheck.
> > > > > >
> > > > > > Signed-off-by: Deepak R Varma <drv@mailo.com>
> > > > > > ---
> > > > > >  drivers/staging/fbtft/fbtft.h | 2 +-
> > > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > >
> > > > > > diff --git a/drivers/staging/fbtft/fbtft.h b/drivers/staging/fbtft/fbtft.h
> > > > > > index 2c2b5f1c1df3..5506a473be91 100644
> > > > > > --- a/drivers/staging/fbtft/fbtft.h
> > > > > > +++ b/drivers/staging/fbtft/fbtft.h
> > > > > > @@ -231,7 +231,7 @@ struct fbtft_par {
> > > > > >  	bool polarity;
> > > > > >  };
> > > > > >
> > > > > > -#define NUMARGS(...)  (sizeof((int[]){__VA_ARGS__}) / sizeof(int))
> > > > > > +#define NUMARGS(...)  ARRAY_SIZE(((int[]){ __VA_ARGS__ }))
> > > > >
> > > > > Please please please test-build your patches before sending them out.
> > > > > To not do so just wastes reviewer resources :(
> > > >
> > > > Hello Greg,
> > > > I did build the .ko files by making the driver/staging/fbtft/ path. I verified
> > > > .o and .ko files were built.
> > > >
> > > > I did a make clean just now and was again able to rebuild without any errors.
> > > > Please see the attached log file.
> > > >
> > > > Is there something wrong with the way I am firing the build?
> > >
> > > The change is in the definition of a macro.  The compiler won't help you
> > > in this case unless the macro is actually used in code that is compiled.
> > > Find the uses and check for any nearby ifdefs.  For file foo.c you can
> > > also do make foo.i to see the result of reducing ifdef and expanding
> > > macros.  Then you can see if the code you changed is actually included in
> > > the build.
> >
> > Okay. This is helpful. I understand. Looking into the file where the macro
> > expansion is reported to be failed.
>
> Hi Julia,
> I could see the macro expansions in the .i files for the fbtft-core.c and
> fb_hx8353d.c file. I am not sure why it built successfully on my x86 though. The
> error in Kerbel bot seems to be specific to ARM arch. I will try that later
> today. I am on the right track to the build error triage?
>
> Also, while reviewing the macro expansion, I saw change in the computation that
> seems odd to me. In the denominator of the expanded macro, there is a "+
> ((int)...." computation that I am not sure if is result of ARRAY_SIZE. I have
> attached the old anf the new .i file diff for your review. If you get a change
> could you help me understand why this additional computation is added to the
> denominator?

I took a look, but it's pretty complex.  You could take the code and
reorganize it so that it is more readable, and then take the definition of
the ARRAY_SIZE macro, to better see what is going on.

julia

>
> Thank you,
> ./drv
> >
> > Thank you,
> > ./drv
> >
> > >
> > > julia
> > >
> >
> >
> >
>
>
>
