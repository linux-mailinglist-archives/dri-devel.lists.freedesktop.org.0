Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4A51A2FC4
	for <lists+dri-devel@lfdr.de>; Thu,  9 Apr 2020 09:10:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 896426EB50;
	Thu,  9 Apr 2020 07:10:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F01AC6EB50
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Apr 2020 07:09:58 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id q2so6714530otk.7
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Apr 2020 00:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GlUPB+6q2mjcNuVTriGgW97+CB0wWd7mr5tulU4n63s=;
 b=Pn8bmpR4HLo/rUfUOGF+R/fNynlNfCPYfvRTLnCYr+qLDJPMm88Z2CpKpGDMNfapS7
 s0l0npj891/g/EmW1JvQX9+vAsgNUMj/enzIWNRWJOs+MNdzeIpA4n8hiREhGUgacS9M
 0Owqo+5Rkn0ftDPJf32XCZj6MPEyxe7VXaaM4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GlUPB+6q2mjcNuVTriGgW97+CB0wWd7mr5tulU4n63s=;
 b=ttuUwMjurMqowfPzih4P3mEHj6DTM1r39JhSAuFcqeRhxCm0oDWX0YOPrXT3vrj1x+
 JtsHwCXSewsciqEa0g3RJLlkZRe9F2AF5R/55E/wKf66bwV9vqMTaKuiZxsIaPoQEn7a
 SO2qKj/NiyWJgBFq7E4Pgs7tnELev0t/LzFUkHRNnrMsMK5zi5klGpuTVtS7y1Pl2bGm
 1E/9YAyDnAHFVO2/3SeImvo7YAirQPaHxnnFoRS8BMUnybjTablgh8ls60X1TfzFGed+
 aPrq8q/w6qjOuL0l38IqHXpXorl70heUqVa4tx48cNWdwarSWsOL1MqhfOSKykkuNmBo
 lS4w==
X-Gm-Message-State: AGi0PuZOf8/BqHvk98SFESuZFN/aRa85NR3elXsZPNIjPDccMw5lmHtr
 W1SCDAwenkLi87qVuI1+QKeh33I+j4bToYOrUsi3Xw==
X-Google-Smtp-Source: APiQypJTmXZ1C/k1LBwOpOzzXyn5auKKSntAs/wF2Or17hXByhXcRvRBCe+phy7aZ0bHhP6DYvYfauLei8ndvS539C4=
X-Received: by 2002:a4a:4190:: with SMTP id x138mr8844225ooa.35.1586416198200; 
 Thu, 09 Apr 2020 00:09:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200408191224.947302-1-arnd@arndb.de>
In-Reply-To: <20200408191224.947302-1-arnd@arndb.de>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 9 Apr 2020 09:09:46 +0200
Message-ID: <CAKMK7uGsF-C7AXjLESDYb6=09qp0j+OXS9OgLEVCFd9-GAo-kg@mail.gmail.com>
Subject: Re: [PATCH] drm: work around dma_addr_t/resource_size_t mixup warning
To: Arnd Bergmann <arnd@arndb.de>
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
Cc: Benjamin Gaignard <benjamin.gaignard@st.com>,
 David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, Sean Paul <seanpaul@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The fix got stuck a bit, I just pushed it out, should make it to the
next linux-next:

commit b2ecb89c27a4fd110187e0afeca70557215f55a1 (drm-misc-next-fixes)
Author: Chris Wilson <chris@chris-wilson.co.uk>
Date:   Thu Apr 2 22:59:26 2020 +0100

    drm/legacy: Fix type for drm_local_map.offset

Cheers, Daniel

On Wed, Apr 8, 2020 at 9:12 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On configurations with 64-bit dma_addr_t but 32-bit resource_size_t,
> there is now a warning:
>
> drivers/gpu/drm/drm_bufs.c: In function 'drm_addmap_core':
> drivers/gpu/drm/drm_bufs.c:328:8: error: passing argument 3 of 'dma_alloc_coherent' from incompatible pointer type [-Werror=incompatible-pointer-types]
>   328 |        &map->offset,
>       |        ^~~~~~~~~~~~
>       |        |
>       |        resource_size_t * {aka unsigned int *}
> In file included from include/linux/pci-dma-compat.h:8,
>                  from include/linux/pci.h:2392,
>                  from include/drm/drm_pci.h:35,
>                  from drivers/gpu/drm/drm_bufs.c:46:
> include/linux/dma-mapping.h:642:15: note: expected 'dma_addr_t *' {aka 'long long unsigned int *'} but argument is of type 'resource_size_t *' {aka 'unsigned int *'}
>   642 |   dma_addr_t *dma_handle, gfp_t gfp)
>       |   ~~~~~~~~~~~~^~~~~~~~~~
>
> I have no idea if this is safe on targets that may need a high DMA address,
> or why we store a DMA address token in a resource_size_t in the first place,
> but using a temporary variable avoids the warning.
>
> Fixes: 8e4ff9b56957 ("drm: Remove the dma_alloc_coherent wrapper for internal usage")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpu/drm/drm_bufs.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_bufs.c b/drivers/gpu/drm/drm_bufs.c
> index dcabf5698333..0fbe65c62f1e 100644
> --- a/drivers/gpu/drm/drm_bufs.c
> +++ b/drivers/gpu/drm/drm_bufs.c
> @@ -149,6 +149,7 @@ static int drm_addmap_core(struct drm_device *dev, resource_size_t offset,
>  {
>         struct drm_local_map *map;
>         struct drm_map_list *list;
> +       dma_addr_t dma_addr;
>         unsigned long user_token;
>         int ret;
>
> @@ -325,8 +326,9 @@ static int drm_addmap_core(struct drm_device *dev, resource_size_t offset,
>                  * need to point to a 64bit variable first. */
>                 map->handle = dma_alloc_coherent(&dev->pdev->dev,
>                                                  map->size,
> -                                                &map->offset,
> +                                                &dma_addr,
>                                                  GFP_KERNEL);
> +               map->offset = (resource_size_t)dma_addr;
>                 if (!map->handle) {
>                         kfree(map);
>                         return -ENOMEM;
> --
> 2.26.0
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
