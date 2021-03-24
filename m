Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1975734846E
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 23:18:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45D326EA9A;
	Wed, 24 Mar 2021 22:18:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0199.hostedemail.com
 [216.40.44.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 612C46EA9A
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 22:18:42 +0000 (UTC)
Received: from omf13.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
 by smtprelay06.hostedemail.com (Postfix) with ESMTP id 6A9901822451D;
 Wed, 24 Mar 2021 22:18:41 +0000 (UTC)
Received: from [192.168.1.159] (unknown [47.151.137.21])
 (Authenticated sender: joe@perches.com)
 by omf13.hostedemail.com (Postfix) with ESMTPA id D56711124F6;
 Wed, 24 Mar 2021 22:18:36 +0000 (UTC)
Message-ID: <9d320cd403921f4b36b726b71a51572463599cf5.camel@perches.com>
Subject: Re: [RFC patch] vsprintf: Allow %pe to print non PTR_ERR %pe uses
 as decimal
From: Joe Perches <joe@perches.com>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>, Arnd Bergmann
 <arnd@kernel.org>,  Petr Mladek <pmladek@suse.com>, Steven Rostedt
 <rostedt@goodmis.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Wed, 24 Mar 2021 15:18:35 -0700
In-Reply-To: <3d66137e-7842-2764-456f-7cc9e54a6d2e@rasmusvillemoes.dk>
References: <20210324121832.3714570-1-arnd@kernel.org>
 <e1310273dcc577f3a772380ada7b6cc1906d680b.camel@perches.com>
 <CAK8P3a0JyoAtTYTi+M_mJ3_KtUJ6NeJB=FNWhzezqcXMac++mQ@mail.gmail.com>
 <810d36184b9fa2880d3ba7738a8f182e27f5107b.camel@perches.com>
 <3252fd83141aa9e0e6001acee1dd98e87c676b9a.camel@perches.com>
 <9feab1e8-4dee-6b79-03f7-7b9f0cb24f6e@rasmusvillemoes.dk>
 <d184069de43135a9c9e5f031447faf98ab3f437d.camel@perches.com>
 <3d66137e-7842-2764-456f-7cc9e54a6d2e@rasmusvillemoes.dk>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
X-Rspamd-Queue-Id: D56711124F6
X-Spam-Status: No, score=0.10
X-Stat-Signature: jght7a4w3aihr8qtzepipotqu39yx7bw
X-Rspamd-Server: rspamout01
X-HE-Tag: 1616624316-471145
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
Cc: David Airlie <airlied@linux.ie>, Sascha Hauer <s.hauer@pengutronix.de>,
 Marco Felsch <m.felsch@pengutronix.de>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Liu Ying <victor.liu@nxp.com>, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2021-03-24 at 22:27 +0100, Rasmus Villemoes wrote:
> On 24/03/2021 20.24, Joe Perches wrote:
> > On Wed, 2021-03-24 at 18:33 +0100, Rasmus Villemoes wrote:
> > > On 24/03/2021 18.20, Joe Perches wrote:
> > > 
> > > > 
> > > > Maybe it's better to output non PTR_ERR %pe uses as decimal so this
> > > > sort of code would work.
> > > 
> > > No, because that would leak the pointer value when somebody has
> > > accidentally passed a real kernel pointer to %pe.
> > 
> > I think it's not really an issue.
> > 
> > _All_ code that uses %p<foo> extensions need inspection anyway.
> 
> There are now a bunch of sanity checks in place that catch e.g. an
> ERR_PTR passed to an extension that would derefence the pointer;
> enforcing that only ERR_PTRs are passed to %pe (or falling back to %p)
> is another of those safeguards.
> 
> > It's already possible to intentionally 'leak' the ptr value
> > by using %pe, -ptr so I think that's not really an issue.
> > 
> 
> Huh, what? I assume -ptr is shorthand for (void*)-(unsigned long)ptr.
> How would that leak the value if ptr is an ordinary kernel pointer?
> That's not an ERR_PTR unless (unsigned long)ptr is < 4095 or so.

You are confusing ERR_PTR with IS_ERR

ERR_PTR is just

include/linux/err.h:static inline void * __must_check ERR_PTR(long error)
include/linux/err.h-{
include/linux/err.h-    return (void *) error;
include/linux/err.h-}f 

> If you want to print the pointer value just do %px. No need for silly
> games.

There's no silly game here.  %pe would either print a string or a value.
It already does that in 2 cases.


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
