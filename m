Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC222FB4F5
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jan 2021 10:36:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 112FB6E071;
	Tue, 19 Jan 2021 09:36:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E9786E071
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jan 2021 09:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=hvDZ+fxryuq539HgDjOUrQrHbe7h9X7Wa0ctGASWN10=; b=OgKqJ+MG9z0OBm+QeKncoVH6nk
 XENt9FT49QZ7pXyt0d/n9FCFplAji+NLya51furZxTzehV6KnCjtX9ae0RtvONsRPkKSt+o9omq+U
 FqAOa+4lAGL1GK7J5qRWeOv0HSEmmQhb3jSClOJas3LIDEHty4ow3qb7IiLIhAf7oOx6jOc8Uk42y
 I3J7opZCXmmgirRPi/bx4/lj0qCTKK5BzVCI49Lves81lga7JsIGfXw8D/nw+cSK1pvJrh4vNGpau
 26o//HwgrWsjnJfpFQtBxmJY1RfIYA16Ra9tyMh35SuIy3WC6pxRLpjfebbYXgt3c5D6sYUQdzmUf
 gPDlYEsw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1l1nQN-00E7lm-FO; Tue, 19 Jan 2021 09:35:51 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 84BB7304D28;
 Tue, 19 Jan 2021 10:35:38 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 392A12023AA22; Tue, 19 Jan 2021 10:35:38 +0100 (CET)
Date: Tue, 19 Jan 2021 10:35:38 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH] drm/syncobj: make lockdep complain on WAIT_FOR_SUBMIT v2
Message-ID: <YAan6haGjnIlNIoJ@hirez.programming.kicks-ass.net>
References: <20210118180334.43714-1-christian.koenig@amd.com>
 <20210118180334.43714-2-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210118180334.43714-2-christian.koenig@amd.com>
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
Cc: mingo@redhat.com, will@kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 18, 2021 at 07:03:34PM +0100, Christian K=F6nig wrote:

> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
> index 6e74e6745eca..f51458615158 100644
> --- a/drivers/gpu/drm/drm_syncobj.c
> +++ b/drivers/gpu/drm/drm_syncobj.c
> @@ -387,6 +387,13 @@ int drm_syncobj_find_fence(struct drm_file *file_pri=
vate,
>  	if (!syncobj)
>  		return -ENOENT;
>  =

> +	/* Waiting for userspace with locks help is illegal cause that can
> +	 * trivial deadlock with page faults for example. Make lockdep complain
> +	 * about it early on.
> +	 */

Egads, the cursed comment style is spreading :/

> +	if (flags & DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT)
> +		lockdep_assert_none_held_once();
> +

Should this not be part of drm_syncobj_fence_add_wait() instead? Also,
do you want to sprinkle might_sleep() around ?

>  	*fence =3D drm_syncobj_fence_get(syncobj);
>  	drm_syncobj_put(syncobj);
>  =

> diff --git a/include/linux/lockdep.h b/include/linux/lockdep.h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
