Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73762429514
	for <lists+dri-devel@lfdr.de>; Mon, 11 Oct 2021 19:02:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0F3A6E904;
	Mon, 11 Oct 2021 17:02:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D9816E904
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Oct 2021 17:02:05 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id ed173cd9-2ab4-11ec-ac3c-0050568cd888;
 Mon, 11 Oct 2021 17:01:50 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 50D70194B8C;
 Mon, 11 Oct 2021 19:01:50 +0200 (CEST)
Date: Mon, 11 Oct 2021 19:02:00 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Jeff Dike <jdike@addtoit.com>, Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 linux-um@lists.infradead.org
Subject: Re: [PATCH v2] drm/r128: fix build for UML
Message-ID: <YWRuCCkBOhQ5gN+b@ravnborg.org>
References: <20211011080006.31081-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211011080006.31081-1-rdunlap@infradead.org>
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

On Mon, Oct 11, 2021 at 01:00:06AM -0700, Randy Dunlap wrote:
> Fix a build error on CONFIG_UML, which does not support (provide)
> wbinvd(). UML can use the generic mb() instead.
> 
> ../drivers/gpu/drm/r128/ati_pcigart.c: In function ‘drm_ati_pcigart_init’:
> ../drivers/gpu/drm/r128/ati_pcigart.c:218:2: error: implicit declaration of function ‘wbinvd’ [-Werror=implicit-function-declaration]
>   wbinvd();
>   ^~~~~~
> 
> Fixes: 68f5d3f3b654 ("um: add PCI over virtio emulation driver")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Cc: Jeff Dike <jdike@addtoit.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Anton Ivanov <anton.ivanov@cambridgegreys.com>
> Cc: linux-um@lists.infradead.org
> Cc: Sam Ravnborg <sam@ravnborg.org>

Applied to drm-misc-fixes. I was not sure if this was urgent enough for
fixes but since it fixes the UM build I ended up fast tracking it to
master.

	Sam

> ---
> v2: update Fixes: tag (Johannes)
>     Use simple CONFIG_X86 instead of a more complicated expression. (Sam)
> 
>  drivers/gpu/drm/r128/ati_pcigart.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- linux-next-20211007.orig/drivers/gpu/drm/r128/ati_pcigart.c
> +++ linux-next-20211007/drivers/gpu/drm/r128/ati_pcigart.c
> @@ -215,7 +215,7 @@ int drm_ati_pcigart_init(struct drm_devi
>  	}
>  	ret = 0;
>  
> -#if defined(__i386__) || defined(__x86_64__)
> +#ifdef CONFIG_X86
>  	wbinvd();
>  #else
>  	mb();
