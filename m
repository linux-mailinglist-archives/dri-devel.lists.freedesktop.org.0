Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E513190B5
	for <lists+dri-devel@lfdr.de>; Thu, 11 Feb 2021 18:15:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E90E56E2D8;
	Thu, 11 Feb 2021 17:15:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59FEA6EE5F
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Feb 2021 16:31:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1613061108; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BbG6Odf+JD77Oaj4tijiqobP8c0JzMdMyyOJHdX5L4o=;
 b=f1Ltyt90MLztLp4o5YGA5lafjptrjIVPGreN9KbBAY5SCCbi91cHzI6Xnh+IUxE5Lmm1fD
 BcXvuc7xaLMHJvw1hxka60KGnUcNIslKnvkv/NBrz0n5nj211ewMQ6b0A8rUullW/dwBmG
 8CqsLsuhcSNorYWwhKQw5ehoDY7II+s=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D39ACAC69;
 Thu, 11 Feb 2021 16:31:47 +0000 (UTC)
Date: Thu, 11 Feb 2021 17:31:46 +0100
From: Petr Mladek <pmladek@suse.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v6 2/3] v4l: ioctl: Use %p4cc printk modifier to print
 FourCC codes
Message-ID: <YCVb8hxawwd2l2yx@alley>
References: <20210208200903.28084-1-sakari.ailus@linux.intel.com>
 <20210208200903.28084-3-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210208200903.28084-3-sakari.ailus@linux.intel.com>
X-Mailman-Approved-At: Thu, 11 Feb 2021 17:15:40 +0000
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
Cc: mchehab@kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hverkuil@xs4all.nl,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>, laurent.pinchart@ideasonboard.com,
 Joe Perches <joe@perches.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon 2021-02-08 22:09:02, Sakari Ailus wrote:
> Now that we can print FourCC codes directly using printk, make use of the
> feature in V4L2 core.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/v4l2-core/v4l2-ioctl.c | 85 +++++++---------------------
>  1 file changed, 21 insertions(+), 64 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 31d1342e61e8..31662c3a8c9e 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -265,13 +265,9 @@ static void v4l_print_fmtdesc(const void *arg, bool write_only)
>  {
>  	const struct v4l2_fmtdesc *p = arg;
>  
> -	pr_cont("index=%u, type=%s, flags=0x%x, pixelformat=%c%c%c%c, mbus_code=0x%04x, description='%.*s'\n",
> +	pr_cont("index=%u, type=%s, flags=0x%x, pixelformat=%p4cc, mbus_code=0x%04x, description='%.*s'\n",

Is %p4cc really acceptable here?

The original code printed only the 4 characters. The original code
would print something like:

  index=21, type=bla, flags=0x0, pixelformat=BG12, mbus_code=0x0a9f, descrition="bla bla bla"

while the new code will do:

  index=21, type=bla, flags=0x0, pixelformat=BG12 little-endian (0x32314742), mbus_code=0x0a9f, descrition="bla bla bla"

This is much harder to parse because there are spaces also inside pixel_format=<value>



>  		p->index, prt_names(p->type, v4l2_type_names),
> -		p->flags, (p->pixelformat & 0xff),
> -		(p->pixelformat >>  8) & 0xff,
> -		(p->pixelformat >> 16) & 0xff,
> -		(p->pixelformat >> 24) & 0xff,
> -		p->mbus_code,
> +		p->flags, &p->pixelformat, p->mbus_code,
>  		(int)sizeof(p->description), p->description);
>  }
>  

Best Regards,
Petr
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
