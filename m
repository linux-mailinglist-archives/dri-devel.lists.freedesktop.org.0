Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC6A1D66B5
	for <lists+dri-devel@lfdr.de>; Sun, 17 May 2020 11:01:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6086C6E3F0;
	Sun, 17 May 2020 09:01:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B917A6E3F0
 for <dri-devel@lists.freedesktop.org>; Sun, 17 May 2020 09:01:14 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 21218995-1500050 for multiple; Sun, 17 May 2020 10:01:02 +0100
MIME-Version: 1.0
In-Reply-To: <20200517085049.278103-1-christophe.jaillet@wanadoo.fr>
References: <20200517085049.278103-1-christophe.jaillet@wanadoo.fr>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, airlied@linux.ie,
 daniel@ffwll.ch, gregkh@linuxfoundation.org, joonas.lahtinen@linux.intel.com,
 tglx@linutronix.de, tvrtko.ursulin@intel.com
Subject: Re: [PATCH] drm/mm: Fix an error handling path in '__igt_once()'
Message-ID: <158970606137.10809.7121434240962824777@build.alporthouse.com>
User-Agent: alot/0.8.1
Date: Sun, 17 May 2020 10:01:01 +0100
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
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Christophe JAILLET (2020-05-17 09:50:49)
> The label of the last gotos must be switched for the error handling code to
> work as expected.
> 
> Fixes: 83bc4ec37210 ("drm/mm: Add a search-by-address variant to only inspect a single hole")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/gpu/drm/selftests/test-drm_mm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/selftests/test-drm_mm.c b/drivers/gpu/drm/selftests/test-drm_mm.c
> index 9aabe82dcd3a..af38c4fa4db5 100644
> --- a/drivers/gpu/drm/selftests/test-drm_mm.c
> +++ b/drivers/gpu/drm/selftests/test-drm_mm.c
> @@ -1864,14 +1864,14 @@ static int __igt_once(unsigned int mode)
>                 pr_err("Unexpectedly inserted the node into the wrong hole: node.start=%llx\n",
>                        node.start);
>                 err = -EINVAL;
> -               goto err_node;
> +               goto err_hi;

This needs to call drm_mm_remove_node() [err_node:] as it accidentally inserted the
node.

>         }
>  
>         err = drm_mm_insert_node_generic(&mm, &node, 2, 0, 0, mode);
>         if (err) {
>                 pr_err("Could not insert the node into the available hole!\n");
>                 err = -EINVAL;
> -               goto err_hi;
> +               goto err_node;

And this must *not* call drm_mm_remove_node.
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
