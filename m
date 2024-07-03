Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 507AE92661B
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 18:27:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1534910E0AC;
	Wed,  3 Jul 2024 16:27:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Rwd9e7kl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F45E10E0AC
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 16:27:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 6510ECE2D2B;
 Wed,  3 Jul 2024 16:27:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EC89C2BD10;
 Wed,  3 Jul 2024 16:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720024025;
 bh=iqYxlC1bhe/7ALpkNeE5phKu3N9aTBnG3R0HukiaLws=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Rwd9e7kliYyzi9FQPgDbHOkyrNE+y0jJRVWnOdmXhAkVOD1ALZD0O10DjNWFdt3yC
 ofb8OUs3AK4tJ1ETzauW/+3t+eb/4uqnz3ZVD6XWlRjMjQGvlP8UR9uBfs+9//130N
 CeN/pC1bgOCnO1VB1B+hlwcVy289AeM/esB0ht8j55bH9Y8nSprZ7wpAtbvdTbz9AL
 iL/UQJKak4mdUS3H81Mn47L1q38rjm7FaAXhIo9ngCEgZjFb3ikj1ZDBhqbVK8SiJr
 HZg0QGdZ9zMNJD8lbhhVjPqYxuorXhgrPYWZkHunA9J73aHALa3eQQyUQIz2HvRh3j
 HNWAuSbLQR1RA==
Date: Wed, 3 Jul 2024 09:27:04 -0700
From: Kees Cook <kees@kernel.org>
To: Petr Mladek <pmladek@suse.com>
Cc: Jocelyn Falempe <jfalempe@redhat.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tony Luck <tony.luck@intel.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 John Ogness <john.ogness@linutronix.de>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jani Nikula <jani.nikula@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Uros Bizjak <ubizjak@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-hyperv@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2] printk: Add a short description string to kmsg_dump()
Message-ID: <202407030926.D5DA9B901D@keescook>
References: <20240702122639.248110-1-jfalempe@redhat.com>
 <202407021326.E75B8EA@keescook>
 <10ea2ea1-e692-443e-8b48-ce9884e8b942@redhat.com>
 <ZoUKM9-RiOrv0_Vf@pathway.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZoUKM9-RiOrv0_Vf@pathway.suse.cz>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 03, 2024 at 10:22:11AM +0200, Petr Mladek wrote:
> On Wed 2024-07-03 09:57:26, Jocelyn Falempe wrote:
> > 
> > 
> > On 02/07/2024 22:29, Kees Cook wrote:
> > > On Tue, Jul 02, 2024 at 02:26:04PM +0200, Jocelyn Falempe wrote:
> > > > kmsg_dump doesn't forward the panic reason string to the kmsg_dumper
> > > > callback.
> > > > This patch adds a new struct kmsg_dump_detail, that will hold the
> > > > reason and description, and pass it to the dump() callback.
> > > 
> > > Thanks! I like this much better. :)
> > > 
> > > > 
> > > > To avoid updating all kmsg_dump() call, it adds a kmsg_dump_desc()
> > > > function and a macro for backward compatibility.
> > > > 
> > > > I've written this for drm_panic, but it can be useful for other
> > > > kmsg_dumper.
> > > > It allows to see the panic reason, like "sysrq triggered crash"
> > > > or "VFS: Unable to mount root fs on xxxx" on the drm panic screen.
> > > > 
> > > > v2:
> > > >   * Use a struct kmsg_dump_detail to hold the reason and description
> > > >     pointer, for more flexibility if we want to add other parameters.
> > > >     (Kees Cook)
> > > >   * Fix powerpc/nvram_64 build, as I didn't update the forward
> > > >     declaration of oops_to_nvram()
> > > 
> > > The versioning history commonly goes after the "---".
> > 
> > ok, I was not aware of this.
> > > 
> > > > [...]
> > > > diff --git a/include/linux/kmsg_dump.h b/include/linux/kmsg_dump.h
> > > > index 906521c2329c..65f5a47727bc 100644
> > > > --- a/include/linux/kmsg_dump.h
> > > > +++ b/include/linux/kmsg_dump.h
> > > > @@ -39,6 +39,17 @@ struct kmsg_dump_iter {
> > > >   	u64	next_seq;
> > > >   };
> > > > +/**
> > > > + *struct kmsg_dump_detail - kernel crash detail
> > > 
> > > Is kern-doc happy with this? I think there is supposed to be a space
> > > between the "*" and the first word:
> > > 
> > >   /**
> > >    * struct kmsg...
> > > 
> > > 
> > Good catch, yes there is a space missing.
> > 
> > I just checked with "make htmldocs", and in fact include/linux/kmsg_dump.h
> > is not indexed for kernel documentation.
> > And you can't find the definition of struct kmsg_dumper in the online doc.
> > https://www.kernel.org/doc/html/latest/search.html?q=kmsg_dumper
> > 
> > > Otherwise looks good to me!
> > > 
> > 
> > Thanks.
> > 
> > As this patch touches different subsystems, do you know on which tree it
> > should land ?
> 
> Andrew usually takes patches against kernel/panic.c.
> 
> Or you could take it via the DRM tree, especially if you already have the code
> using the string.
> 
> Also I could take it via the printk tree. The only complication is
> that I am going to be away the following two weeks and would come
> back in the middle of the merge window. I do not expect much problems
> with this change but...

If DRM doesn't want to carry it, I can put it in through the pstore
tree. Let me know! :)

-- 
Kees Cook
