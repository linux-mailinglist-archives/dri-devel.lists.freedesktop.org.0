Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A52493C9C
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 16:06:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F83710E20B;
	Wed, 19 Jan 2022 15:06:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 732D210E1E5;
 Wed, 19 Jan 2022 15:06:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3B661614B8;
 Wed, 19 Jan 2022 15:06:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04AE5C004E1;
 Wed, 19 Jan 2022 15:06:36 +0000 (UTC)
Date: Wed, 19 Jan 2022 10:06:35 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH 1/3] lib/string_helpers: Consolidate yesno() implementation
Message-ID: <20220119100635.6c45372b@gandalf.local.home>
In-Reply-To: <YefXg03hXtrdUj6y@paasikivi.fi.intel.com>
References: <20220119072450.2890107-1-lucas.demarchi@intel.com>
 <20220119072450.2890107-2-lucas.demarchi@intel.com>
 <YefXg03hXtrdUj6y@paasikivi.fi.intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Vishal Kulkarni <vishal@chelsio.com>,
 Francis Laniel <laniel_francis@privacyrequired.com>,
 Kentaro Takeda <takedakn@nttdata.co.jp>, Mikita Lipski <mikita.lipski@amd.com>,
 amd-gfx@lists.freedesktop.org, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Ben Skeggs <bskeggs@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Petr Mladek <pmladek@suse.com>, Leo Li <sunpeng.li@amd.com>,
 intel-gfx@lists.freedesktop.org, Raju Rangoju <rajur@chelsio.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Julia Lawall <julia.lawall@lip6.fr>,
 Rahul Lakkireddy <rahul.lakkireddy@chelsio.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Eryk Brol <eryk.brol@amd.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 linux-security-module@vger.kernel.org, netdev@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S . Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 19 Jan 2022 11:18:59 +0200
Sakari Ailus <sakari.ailus@linux.intel.com> wrote:

> On Tue, Jan 18, 2022 at 11:24:48PM -0800, Lucas De Marchi wrote:
> > @@ -1354,8 +1345,7 @@ static bool tomoyo_print_condition(struct tomoyo_io_buffer *head,
> >  	case 3:
> >  		if (cond->grant_log != TOMOYO_GRANTLOG_AUTO)
> >  			tomoyo_io_printf(head, " grant_log=%s",
> > -					 tomoyo_yesno(cond->grant_log ==
> > -						      TOMOYO_GRANTLOG_YES));
> > +					 yesno(cond->grant_log == TOMOYO_GRANTLOG_YES));  
> 
> This would be better split on two lines.

Really? Yuck!

I thought the "max line size" guideline was going to grow to a 100, but I
still see it as 80. But anyway...

	cond->grant_log ==
	TOMOYO_GRANTLOG_YES

is not readable at all. Not compared to

	cond->grant_log == TOMOYO_GRANTLOG_YES

I say keep it one line!

Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>

-- Steve

> 
> Then,
> 
> Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

