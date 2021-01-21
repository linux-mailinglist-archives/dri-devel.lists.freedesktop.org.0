Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 996DF2FF785
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jan 2021 22:45:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76B526E95E;
	Thu, 21 Jan 2021 21:45:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 336EA6E95E
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jan 2021 21:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611265546;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+rDl9+7fXwTudocqpSNQ/uswuuzlXykto241XVMPhJI=;
 b=LY/Wg0807FU2U+wJ/ReQSo/Gfb8SR/zSXfgI11eSomBILlWaGEbA5daVCYneyAgOq7xGYj
 XAfXfHI7HQpIxhVmDoFGqWf60lcQPmFNbomz6k9e+JF2cdLvIqXT5aMdumKG2bT4pWS+Tp
 14gYkvivhXUjVQHIDdECkx1hHgjvoqo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-517-OKLBo_BNP5yCUTW080-5Wg-1; Thu, 21 Jan 2021 16:45:42 -0500
X-MC-Unique: OKLBo_BNP5yCUTW080-5Wg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8E5AC802B40;
 Thu, 21 Jan 2021 21:45:39 +0000 (UTC)
Received: from treble (ovpn-116-102.rdu2.redhat.com [10.10.116.102])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3EF795F9B5;
 Thu, 21 Jan 2021 21:45:31 +0000 (UTC)
Date: Thu, 21 Jan 2021 15:45:29 -0600
From: Josh Poimboeuf <jpoimboe@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 04/13] livepatch: move klp_find_object_module to module.c
Message-ID: <20210121214529.il2ac3vk6oqogjpr@treble>
References: <20210121074959.313333-1-hch@lst.de>
 <20210121074959.313333-5-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210121074959.313333-5-hch@lst.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
 Jessica Yu <jeyu@kernel.org>, Frederic Barrat <fbarrat@linux.ibm.com>,
 Miroslav Benes <mbenes@suse.cz>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 21, 2021 at 08:49:50AM +0100, Christoph Hellwig wrote:
> @@ -820,14 +796,25 @@ static int klp_init_object(struct klp_patch *patch, struct klp_object *obj)
>  	const char *name;
>  
>  	obj->patched = false;
> -	obj->mod = NULL;

Why was this line removed?

>  	if (klp_is_module(obj)) {
>  		if (strlen(obj->name) >= MODULE_NAME_LEN)
>  			return -EINVAL;
>  		name = obj->name;
>  
> -		klp_find_object_module(obj);
> +		/*
> +		 * We do not want to block removal of patched modules and
> +		 * therefore we do not take a reference here. The patches are
> +		 * removed by klp_module_going() instead.
> +		 * 
> +		 * Do not mess work of klp_module_coming() and
> +		 * klp_module_going().  Note that the patch might still be
> +		 * needed before klp_module_going() is called.  Module functions
> +		 * can be called even in the GOING state until mod->exit()
> +		 * finishes.  This is especially important for patches that
> +		 * modify semantic of the functions.
> +		 */
> +		obj->mod = find_klp_module(obj->name);

These comments don't make sense in this context, they should be kept
with the code in find_klp_module().

-- 
Josh

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
