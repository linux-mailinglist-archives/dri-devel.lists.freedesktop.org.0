Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C863C30D4E7
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 09:14:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A187D6E9FB;
	Wed,  3 Feb 2021 08:13:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95C3E6E0E7
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Feb 2021 10:45:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 27FC9AE8D;
 Tue,  2 Feb 2021 10:45:48 +0000 (UTC)
Date: Tue, 2 Feb 2021 11:45:47 +0100 (CET)
From: Miroslav Benes <mbenes@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 05/13] kallsyms: refactor {,module_}kallsyms_on_each_symbol
In-Reply-To: <20210201162842.GB7276@lst.de>
Message-ID: <alpine.LSU.2.21.2102021145160.570@pobox.suse.cz>
References: <20210128181421.2279-1-hch@lst.de>
 <20210128181421.2279-6-hch@lst.de> <YBPYyEvesLMrRtZM@alley>
 <20210201114749.GB19696@lst.de>
 <alpine.LSU.2.21.2102011436320.21637@pobox.suse.cz>
 <20210201162842.GB7276@lst.de>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 03 Feb 2021 08:13:07 +0000
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
Cc: Petr Mladek <pmladek@suse.com>, Jiri Kosina <jikos@kernel.org>,
 Andrew Donnellan <ajd@linux.ibm.com>, linux-kbuild@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Masahiro Yamada <masahiroy@kernel.org>,
 Josh Poimboeuf <jpoimboe@redhat.com>, linux-kernel@vger.kernel.org,
 live-patching@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>,
 Joe Lawrence <joe.lawrence@redhat.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Jessica Yu <jeyu@kernel.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 1 Feb 2021, Christoph Hellwig wrote:

> On Mon, Feb 01, 2021 at 02:37:12PM +0100, Miroslav Benes wrote:
> > > > This change is not needed. (objname == NULL) means that we are
> > > > interested only in symbols in "vmlinux".
> > > > 
> > > > module_kallsyms_on_each_symbol(klp_find_callback, &args)
> > > > will always fail when objname == NULL.
> > > 
> > > I just tried to keep the old behavior.  I can respin it with your
> > > recommended change noting the change in behavior, though.
> > 
> > Yes, please. It would be cleaner that way.
> 
> Let me know if this works for you:
> 
> ---
> >From 18af41e88d088cfb8680d1669fcae2bc2ede5328 Mon Sep 17 00:00:00 2001
> From: Christoph Hellwig <hch@lst.de>
> Date: Wed, 20 Jan 2021 16:23:16 +0100
> Subject: kallsyms: refactor {,module_}kallsyms_on_each_symbol
> 
> Require an explicit call to module_kallsyms_on_each_symbol to look
> for symbols in modules instead of the call from kallsyms_on_each_symbol,
> and acquire module_mutex inside of module_kallsyms_on_each_symbol instead
> of leaving that up to the caller.  Note that this slightly changes the
> behavior for the livepatch code in that the symbols from vmlinux are not
> iterated anymore if objname is set, but that actually is the desired
> behavior in this case.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Miroslav Benes <mbenes@suse.cz>

Thanks Christoph

M
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
