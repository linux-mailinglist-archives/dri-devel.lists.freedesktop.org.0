Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8939D19D8F5
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 16:22:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB7896EBE1;
	Fri,  3 Apr 2020 14:22:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9D7C6EBE1
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 14:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-ID:Content-Description;
 bh=YN+nDi5ri8WqCT+wyS5XzUuEbEnx6eD8KXJvPFKkcJ0=; b=JsEUU9LS/TRsw3vAcYvjbME7w1
 46230s179k6N8hcYbzdod0iClZb5pfF1hnPswFh0w511l3De0mzqGLNLF9CSrEAUGNiJdbxIjd0Dc
 GVkUchwJ3Jb6w2V2udovgVkaRiKitbWGjSoJ/Sh5iVHWfe5UwMKTGFoC016EVbAebiyeBR0GhGFAa
 JIsSlT1WXIfB8WjA3HpGyLPTYjL9aL4c/2u7PIr/aH6buIywtwfpOFJp+3g1mbZi12WJ8m9CcRf4K
 yK6E5zkRJfoZkfu/xKrHK9XxdAClb2YT91sHCSHTlRtwaifkkWC7gfpBbi+BGG2trtwPdzmvyVgdt
 GHXCjRIQ==;
Received: from ip5f5ad4d8.dynamic.kabel-deutschland.de ([95.90.212.216]
 helo=coco.lan)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jKND8-0001JS-8I; Fri, 03 Apr 2020 14:22:18 +0000
Date: Fri, 3 Apr 2020 16:22:10 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [PATCH v2 1/1] lib/vsprintf: Add support for printing V4L2 and
 DRM fourccs
Message-ID: <20200403162210.23f1e2a5@coco.lan>
In-Reply-To: <1105bfe5-88f1-040e-db40-54d7761747d5@rasmusvillemoes.dk>
References: <20200403091156.7814-1-sakari.ailus@linux.intel.com>
 <1105bfe5-88f1-040e-db40-54d7761747d5@rasmusvillemoes.dk>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
Cc: Petr Mladek <pmladek@suse.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hverkuil@xs4all.nl,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>, laurent.pinchart@ideasonboard.com,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Joe Perches <joe@perches.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Em Fri, 3 Apr 2020 14:10:53 +0200
Rasmus Villemoes <linux@rasmusvillemoes.dk> escreveu:

> On 03/04/2020 11.11, Sakari Ailus wrote:
> > Add a printk modifier %ppf (for pixel format) for printing V4L2 and DRM
> > pixel formats denoted by 4ccs. The 4cc encoding is the same for both so
> > the same implementation can be used.  
> 
> This seems quite niche to me, I'm not sure that belongs in vsprintf.c.

It is used on different subsystems. At least media, drm and input (yes, 
there are some input multi-touch devices with return images using
"GREY" fourcc - see drivers/input/touchscreen/sur40.c).

> What's wrong with having a
> 
> char *fourcc_string(char *buf, u32 x)
> 
> that formats x into buf and returns buf, so it can be used in a
> 
> char buf[8];
> pr_debug("bla: %s\n", fourcc_string(buf, x))
> 
> Or, for that matter, since it's for debugging, why not just print x with
> 0x%08x?

That's about what it has been done so far, using different solutions
on different places. Some display hex values, others display fourcc
(usually ignoring the BE case). We'd like to have a common solution
that won't be subsystem-specific and will handle it on a proper unified
way.

With regards to ex values, see for example the GREY format:

	V4L2_PIX_FMT_GREY ('GREY')

when someone reads 'GREY', this is easily understandable as a grey image
format, even by someone that it is not familiar with 4cc codes. Same is
true for several other widely used formats, like BGR and RGB.

If you see its hexa representation, 0x47524559 is a lot more obscure.

Thanks,
Mauro
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
