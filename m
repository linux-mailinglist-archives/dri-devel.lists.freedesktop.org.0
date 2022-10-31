Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D7D613123
	for <lists+dri-devel@lfdr.de>; Mon, 31 Oct 2022 08:22:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D14910E137;
	Mon, 31 Oct 2022 07:22:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from msg-1.mailo.com (msg-1.mailo.com [213.182.54.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D15A210E137
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Oct 2022 07:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
 t=1667200906; bh=fEkcGv4YwJBOgvGb34R/II7LTO2Xc8lQDxRnl4xZAbQ=;
 h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:In-Reply-To;
 b=fT9iha+NV+wVMQgLXmYYJU64rPaVXitGlLxtTTyQuGnblzRH0+3ARfR5Bnr/M7woc
 dwuhAUny6NpdaM4ZWJMnfMtCGIyjqoOqSsuKtyU7saOPWL/a9u0JIVLJbPJTD6NdvM
 UJaCFByzRXgQoj8KyeTA1hayCHmcifaR4chKmEIw=
Received: by b-5.in.mailobj.net [192.168.90.15] with ESMTP via [213.182.55.206]
 Mon, 31 Oct 2022 08:21:46 +0100 (CET)
X-EA-Auth: OMPKm0D6NR0UfEu61VC4V3zXIgDSyaMG14J/jya0ucpUTCrwEwb+wLUV9k6tqzTYmdxtASeyttk+Bd1SMzB+Xc4ydYgQbVyz
Date: Mon, 31 Oct 2022 12:41:40 +0530
From: Deepak R Varma <drv@mailo.com>
To: Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH] staging: fbtft: Use ARRAY_SIZE() to get argument count
Message-ID: <Y191LI7zKVRA5LEb@ubunlion>
References: <Y1vZXUi0Bjiub8HZ@ubunlion> <Y1zXIjCe3LGwApWD@kroah.com>
 <Y11b0oCmle2pbRel@ubunlion>
 <alpine.DEB.2.22.394.2210291931590.2917@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2210291931590.2917@hadrien>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Oct 29, 2022 at 07:34:26PM +0200, Julia Lawall wrote:
>
>
> On Sat, 29 Oct 2022, Deepak R Varma wrote:
>
> > On Sat, Oct 29, 2022 at 09:32:50AM +0200, Greg Kroah-Hartman wrote:
> > > On Fri, Oct 28, 2022 at 07:00:05PM +0530, Deepak R Varma wrote:
> > > > The ARRAY_SIZE(foo) macro should be preferred over sizeof operator
> > > > based computation such as sizeof(foo)/sizeof(foo[0]) for finding
> > > > number of elements in an array. Issue identified using coccicheck.
> > > >
> > > > Signed-off-by: Deepak R Varma <drv@mailo.com>
> > > > ---
> > > >  drivers/staging/fbtft/fbtft.h | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/staging/fbtft/fbtft.h b/drivers/staging/fbtft/fbtft.h
> > > > index 2c2b5f1c1df3..5506a473be91 100644
> > > > --- a/drivers/staging/fbtft/fbtft.h
> > > > +++ b/drivers/staging/fbtft/fbtft.h
> > > > @@ -231,7 +231,7 @@ struct fbtft_par {
> > > >  	bool polarity;
> > > >  };
> > > >
> > > > -#define NUMARGS(...)  (sizeof((int[]){__VA_ARGS__}) / sizeof(int))
> > > > +#define NUMARGS(...)  ARRAY_SIZE(((int[]){ __VA_ARGS__ }))
> > >
> > > Please please please test-build your patches before sending them out.
> > > To not do so just wastes reviewer resources :(
> >
> > Hello Greg,
> > I did build the .ko files by making the driver/staging/fbtft/ path. I verified
> > .o and .ko files were built.
> >
> > I did a make clean just now and was again able to rebuild without any errors.
> > Please see the attached log file.
> >
> > Is there something wrong with the way I am firing the build?
>
> The change is in the definition of a macro.  The compiler won't help you
> in this case unless the macro is actually used in code that is compiled.
> Find the uses and check for any nearby ifdefs.  For file foo.c you can
> also do make foo.i to see the result of reducing ifdef and expanding
> macros.  Then you can see if the code you changed is actually included in
> the build.

Okay. This is helpful. I understand. Looking into the file where the macro
expansion is reported to be failed.

Thank you,
./drv

>
> julia
>


