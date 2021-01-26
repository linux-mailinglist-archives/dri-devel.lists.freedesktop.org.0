Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B6130402C
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jan 2021 15:25:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43ACA6E419;
	Tue, 26 Jan 2021 14:25:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 322396E419
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jan 2021 14:25:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6961222D58;
 Tue, 26 Jan 2021 14:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611671122;
 bh=zHnnr84X+sq4MJebqrUFKLvmgQBWczP8DyHjmXerqPg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AwWJCyWMMlFIlbu/JtuoYt7B++r72LxtstkUf4QFYfAtgvNAJcO+WUudPI+0YAm7X
 6+fXHHEIDTMTt6kZg6TDZE3I494pl2x+zX+0+Z3zEqrei25Exd4peOX9KjXbAQhMZW
 Xa3bV03H1QYILOE5MzIPVTXLt6G2TfZkhII8H/n8NeE44Jcp4oDH6zKlyiiGpcSKVc
 WuVOo/vdgulzezm729DrHzj9hm6nPGrcz0PM9LaYzOPQKp4Sd2o9i+pM1Kp8WLmR0+
 U2mB0+m3dKee3MVHvNpv99t3i1c1nsU5sjIS0dr1L4bsBmwPtOHhYgrpk2Li8EKP+Y
 WcqC3Dro3fjsw==
Date: Tue, 26 Jan 2021 15:25:16 +0100
From: Jessica Yu <jeyu@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 04/13] livepatch: move klp_find_object_module to module.c
Message-ID: <YBAmTAsT3S01kU1x@gunter>
References: <20210121074959.313333-1-hch@lst.de>
 <20210121074959.313333-5-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210121074959.313333-5-hch@lst.de>
X-OS: Linux gunter 5.10.7-1-default x86_64
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
 Miroslav Benes <mbenes@suse.cz>, linuxppc-dev@lists.ozlabs.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+++ Christoph Hellwig [21/01/21 08:49 +0100]:
>To uncouple the livepatch code from module loader internals move a
>slightly refactored version of klp_find_object_module to module.c
>This allows to mark find_module static and removes one of the last
>users of module_mutex outside of module.c.
>
>Signed-off-by: Christoph Hellwig <hch@lst.de>
>---
> include/linux/module.h  |  3 +--
> kernel/livepatch/core.c | 39 +++++++++++++--------------------------
> kernel/module.c         | 17 ++++++++++++++++-
> 3 files changed, 30 insertions(+), 29 deletions(-)
>
>diff --git a/include/linux/module.h b/include/linux/module.h
>index b4654f8a408134..8588482bde4116 100644
>--- a/include/linux/module.h
>+++ b/include/linux/module.h
>@@ -586,8 +586,7 @@ static inline bool within_module(unsigned long addr, const struct module *mod)
> 	return within_module_init(addr, mod) || within_module_core(addr, mod);
> }
>
>-/* Search for module by name: must hold module_mutex. */
>-struct module *find_module(const char *name);
>+struct module *find_klp_module(const char *name);
>
> /* Check if a module is loaded. */
> bool module_loaded(const char *name);
>diff --git a/kernel/livepatch/core.c b/kernel/livepatch/core.c
>index a7f625dc24add3..878759baadd81c 100644
>--- a/kernel/livepatch/core.c
>+++ b/kernel/livepatch/core.c
>@@ -49,30 +49,6 @@ static bool klp_is_module(struct klp_object *obj)
> 	return obj->name;
> }
>
>-/* sets obj->mod if object is not vmlinux and module is found */
>-static void klp_find_object_module(struct klp_object *obj)
>-{
>-	struct module *mod;
>-
>-	mutex_lock(&module_mutex);
>-	/*
>-	 * We do not want to block removal of patched modules and therefore
>-	 * we do not take a reference here. The patches are removed by
>-	 * klp_module_going() instead.
>-	 */
>-	mod = find_module(obj->name);
>-	/*
>-	 * Do not mess work of klp_module_coming() and klp_module_going().
>-	 * Note that the patch might still be needed before klp_module_going()
>-	 * is called. Module functions can be called even in the GOING state
>-	 * until mod->exit() finishes. This is especially important for
>-	 * patches that modify semantic of the functions.
>-	 */
>-	if (mod && mod->klp_alive)
>-		obj->mod = mod;
>-	mutex_unlock(&module_mutex);
>-}

Hmm, I am not a huge fan of moving more livepatch code into module.c, I
wonder if we can keep them separate.

Why not have module_is_loaded() kill two birds with one stone? That
is, just have it return a module pointer to signify that the module is
loaded, NULL if not. Then we don't need an extra find_klp_module()
function just to call find_module() and return a pointer, as
module_is_loaded() can just do that for us.

As for the mod->klp_alive check, I believe this function
(klp_find_object_module()) is called with klp_mutex held, and
mod->klp_alive is only modified under klp_mutex. Also, if klp_alive is
true, the module is at least COMING and cannot be GOING until it
acquires the klp_mutex again in klp_module_going(). So does that hunk
really need to be under module_mutex? It has been a long time since
I've looked at livepatch code so it would be great if someone could
double check.

Jessica
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
