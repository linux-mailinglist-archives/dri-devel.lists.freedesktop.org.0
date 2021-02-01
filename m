Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F298930B9B1
	for <lists+dri-devel@lfdr.de>; Tue,  2 Feb 2021 09:27:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C17C36E8E9;
	Tue,  2 Feb 2021 08:27:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D475D6E526
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Feb 2021 13:16:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5380CAE9A;
 Mon,  1 Feb 2021 13:16:13 +0000 (UTC)
Date: Mon, 1 Feb 2021 14:16:12 +0100 (CET)
From: Miroslav Benes <mbenes@suse.cz>
To: Jessica Yu <jeyu@kernel.org>
Subject: Re: [PATCH 04/13] module: use RCU to synchronize find_module
In-Reply-To: <YBfvvdna9pSeu+1g@gunter>
Message-ID: <alpine.LSU.2.21.2102011415290.21637@pobox.suse.cz>
References: <20210128181421.2279-1-hch@lst.de>
 <20210128181421.2279-5-hch@lst.de>
 <alpine.LSU.2.21.2101291626080.22237@pobox.suse.cz> <YBfvvdna9pSeu+1g@gunter>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 02 Feb 2021 08:27:00 +0000
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
Cc: Petr Mladek <pmladek@suse.com>, Joe Lawrence <joe.lawrence@redhat.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, linux-kbuild@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Masahiro Yamada <masahiroy@kernel.org>,
 Jiri Kosina <jikos@kernel.org>, linux-kernel@vger.kernel.org,
 live-patching@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Josh Poimboeuf <jpoimboe@redhat.com>, Frederic Barrat <fbarrat@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 1 Feb 2021, Jessica Yu wrote:

> +++ Miroslav Benes [29/01/21 16:29 +0100]:
> >On Thu, 28 Jan 2021, Christoph Hellwig wrote:
> >
> >> Allow for a RCU-sched critical section around find_module, following
> >> the lower level find_module_all helper, and switch the two callers
> >> outside of module.c to use such a RCU-sched critical section instead
> >> of module_mutex.
> >
> >That's a nice idea.
> >
> >> @@ -57,7 +58,7 @@ static void klp_find_object_module(struct klp_object
> >> *obj)
> >>   if (!klp_is_module(obj))
> >>    return;
> >>
> >> -	mutex_lock(&module_mutex);
> >> +	rcu_read_lock_sched();
> >>   /*
> >>    * We do not want to block removal of patched modules and therefore
> >>    * we do not take a reference here. The patches are removed by
> >> @@ -74,7 +75,7 @@ static void klp_find_object_module(struct klp_object
> >> *obj)
> >>   if (mod && mod->klp_alive)
> >
> >RCU always baffles me a bit, so I'll ask. Don't we need
> >rcu_dereference_sched() here? "mod" comes from a RCU-protected list, so I
> >wonder.
> 
> Same here :-) I had to double check the RCU documentation. For our
> modules list case I believe the rcu list API should take care of that
> for us. Worth noting is this snippet from Documentation/RCU/whatisRCU.txt:
> 
>    rcu_dereference() is typically used indirectly, via the _rcu
>    list-manipulation primitives, such as list_for_each_entry_rcu()

Ok, thanks to both for checking and explanation.

Ack to the patch then.

Miroslav
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
