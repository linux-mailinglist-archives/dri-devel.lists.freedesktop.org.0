Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A0437BC40
	for <lists+dri-devel@lfdr.de>; Wed, 12 May 2021 14:08:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D008E6EB82;
	Wed, 12 May 2021 12:08:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 301 seconds by postgrey-1.36 at gabe;
 Wed, 12 May 2021 12:08:24 UTC
Received: from andre.telenet-ops.be (andre.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B1FB6EB82
 for <dri-devel@lists.freedesktop.org>; Wed, 12 May 2021 12:08:24 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:1174:b9bd:23c9:ffce])
 by andre.telenet-ops.be with bizsmtp
 id 3o3M2500C0HTjNG01o3Mco; Wed, 12 May 2021 14:03:21 +0200
Received: from geert (helo=localhost)
 by ramsan.of.borg with local-esmtp (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1lgnaC-0053Um-Nc; Wed, 12 May 2021 14:03:20 +0200
Date: Wed, 12 May 2021 14:03:20 +0200 (CEST)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Yiyuan GUO <yguoaz@gmail.com>
Subject: Re: [PATCH] video/logo: protect against divide by zero when reading
 image
In-Reply-To: <20210512054843.54883-1-yguoaz@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2105121353530.1204552@ramsan.of.borg>
References: <20210512054843.54883-1-yguoaz@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
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
Cc: Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 linux-parisc@vger.kernel.org, linux-fbdev@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

 	Hi Yiyuan,

CC dri-devel, linux-fbdev

On Wed, 12 May 2021, Yiyuan GUO wrote:
> In video/logo/pnmtologo.c, the function read_image can read from the
> image file an integer 0 and pass it to function get_number255, leading
> to a divide by zero problem.
>
> Signed-off-by: Yiyuan GUO <yguoaz@gmail.com>

Thanks for your patch!

> --- a/drivers/video/logo/pnmtologo.c
> +++ b/drivers/video/logo/pnmtologo.c
> @@ -118,7 +118,12 @@ static unsigned int get_number(FILE *fp)
>
> static unsigned int get_number255(FILE *fp, unsigned int maxval)
> {
> -    unsigned int val = get_number(fp);
> +    unsigned int val;
> +
> +    if (!maxval)
> +	die("Corrupted maxval\n");

Please be consistent with other places reporting errors, e.g.

     die("%s: invalid maxval zero\n", filename);

This looks like a strange place to check the validity of maxval.
What about checking if right after its assignment?
To avoid duplicating code, you can create a helper:

     static unsigned int get_maxval(FILE *fp)
     {
 	unsigned int maxval = get_number(fp);

 	if (!maxval)
 	    die("%s: invalid maxval zero\n", filename);

 	return maxval;
     }

and:

     /* Plain PGM */
-   maxval = get_number(fp);
+   maxval = get_maxval(fp);

and:

     /* Plain PPM */
-   maxval = get_number(fp);
+   maxval = get_maxval(fp);

> +
> +    val = get_number(fp);
>     return (255*val+maxval/2)/maxval;
> }

Gr{oetje,eeting}s,

 						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
 							    -- Linus Torvalds
