Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8605B31D9B5
	for <lists+dri-devel@lfdr.de>; Wed, 17 Feb 2021 13:46:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 478F16E0CF;
	Wed, 17 Feb 2021 12:46:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D89126E08C;
 Wed, 17 Feb 2021 12:46:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1613565959; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N00yAhsyZbw+Nel/sbxQYAWqciOhUzp9bz7wDMnc5es=;
 b=X95Zya3LHME58OqF/fGOges5Ys2yN9XI9UOk1w4f4CQcA/Ji7pUuY5gTbuBmcaGxOAAlR0
 VZlYkf6Brip0RW+RZIDnZtVwCKLZ31/SZOAFdyEPBkyMeDAlAl+SNdaLEKU6ksQT1aIM19
 vTTytiQ0WWvTgFE3S2DIgxsEVdTyXiM=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4C233AF26;
 Wed, 17 Feb 2021 12:45:59 +0000 (UTC)
Date: Wed, 17 Feb 2021 13:45:58 +0100
From: Petr Mladek <pmladek@suse.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v1 1/3] string: Consolidate yesno() helpers under
 string.h hood
Message-ID: <YC0QBvv9HXr64ySf@alley>
References: <20210215142137.64476-1-andriy.shevchenko@linux.intel.com>
 <43456ba7-c372-84cc-4949-dcb817188e21@amd.com>
 <CAHp75VfVXnqdVRAPQ36vZeD-ZMCjWmjA_-6T=jnOEVMne4bv0g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHp75VfVXnqdVRAPQ36vZeD-ZMCjWmjA_-6T=jnOEVMne4bv0g@mail.gmail.com>
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
Cc: David Airlie <airlied@linux.ie>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Francis Laniel <laniel_francis@privacyrequired.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 amd-gfx@lists.freedesktop.org, Jakub Kicinski <kuba@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Leo Li <sunpeng.li@amd.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Rahul Lakkireddy <rahul.lakkireddy@chelsio.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Mikita Lipski <mikita.lipski@amd.com>,
 Eryk Brol <eryk.brol@amd.com>, netdev <netdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Raju Rangoju <rajur@chelsio.com>, Alex Deucher <alexander.deucher@amd.com>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon 2021-02-15 16:39:26, Andy Shevchenko wrote:
> +Cc: Sakari and printk people
> =

> On Mon, Feb 15, 2021 at 4:28 PM Christian K=F6nig
> <christian.koenig@amd.com> wrote:
> > Am 15.02.21 um 15:21 schrieb Andy Shevchenko:
> > > We have already few similar implementation and a lot of code that can=
 benefit
> > > of the yesno() helper.  Consolidate yesno() helpers under string.h ho=
od.
> > >
> > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> >
> > Looks like a good idea to me, feel free to add an Acked-by: Christian
> > K=F6nig <christian.koenig@amd.com> to the series.
> =

> Thanks.
> =

> > But looking at the use cases for this, wouldn't it make more sense to
> > teach kprintf some new format modifier for this?
> =

> As a next step? IIRC Sakari has at some point the series converted
> yesno and Co. to something which I don't remember the details of.
> =

> Guys, what do you think?

Honestly, I think that yesno() is much easier to understand than %py.
And %py[DOY] looks really scary. It has been suggested at
https://lore.kernel.org/lkml/YCqaNnr7ynRydczE@smile.fi.intel.com/#t

Yes, enabledisable() is hard to parse but it is still self-explaining
and can be found easily by cscope. On the contrary, %pyD will likely
print some python code and it is not clear if it would be compatible
with v3. I am just kidding but you get the picture.

Best Regards,
Petr
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
