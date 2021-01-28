Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD7A30711E
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 09:17:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 698176E944;
	Thu, 28 Jan 2021 08:16:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77DF06E5AE
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 12:58:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1611752302; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Rf92LTTFX4pVSu04S1qGCWjVx84cWC2RbUfV8aaylL0=;
 b=ovHxwd9vUh3DFC3tdSqrSvVBXGoeewXO7zvX/Z1ZxTpcJvFTsNg4CqY0jVrzLafIRI/IOr
 /SxIvVgLdXOEc8uCzSQppYSdFRTUf4Kin0frH1vG5ICidM8tHdpIzcCGyW77Eixiohw1qi
 X9IUpaB07dPxSu9FKXJguFEcDmxKr20=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id ECBDEACBA;
 Wed, 27 Jan 2021 12:58:21 +0000 (UTC)
Date: Wed, 27 Jan 2021 13:58:21 +0100
From: Petr Mladek <pmladek@suse.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 03/13] livepatch: refactor klp_init_object
Message-ID: <YBFjbbuQ7sn4T7yT@alley>
References: <20210121074959.313333-1-hch@lst.de>
 <20210121074959.313333-4-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210121074959.313333-4-hch@lst.de>
X-Mailman-Approved-At: Thu, 28 Jan 2021 08:15:36 +0000
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
Cc: Jiri Kosina <jikos@kernel.org>, Andrew Donnellan <ajd@linux.ibm.com>,
 linux-kbuild@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Masahiro Yamada <masahiroy@kernel.org>, Josh Poimboeuf <jpoimboe@redhat.com>,
 linux-kernel@vger.kernel.org, live-patching@vger.kernel.org,
 Michal Marek <michal.lkml@markovi.net>, Joe Lawrence <joe.lawrence@redhat.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Jessica Yu <jeyu@kernel.org>, Frederic Barrat <fbarrat@linux.ibm.com>,
 Miroslav Benes <mbenes@suse.cz>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu 2021-01-21 08:49:49, Christoph Hellwig wrote:
> Merge three calls to klp_is_module (including one hidden inside
> klp_find_object_module) into a single one to simplify the code a bit.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  kernel/livepatch/core.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/kernel/livepatch/core.c b/kernel/livepatch/core.c
> index f76fdb9255323d..a7f625dc24add3 100644
> --- a/kernel/livepatch/core.c
> +++ b/kernel/livepatch/core.c
> @@ -54,9 +54,6 @@ static void klp_find_object_module(struct klp_object *obj)
>  {
>  	struct module *mod;
>  
> -	if (!klp_is_module(obj))
> -		return;
> -

We need to either update the function description or keep this check.

I prefer to keep the check. The function does the right thing also
for the object "vmlinux". Also the livepatch code includes many
similar paranoid checks that makes the code less error prone
against any further changes.

Of course, it is a matter of taste.

>  	mutex_lock(&module_mutex);
>  	/*
>  	 * We do not want to block removal of patched modules and therefore

Otherwise, the patch looks fine.

Best Regards,
Petr
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
