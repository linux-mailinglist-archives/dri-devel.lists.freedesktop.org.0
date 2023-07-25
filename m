Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35422760C72
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 09:53:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B08F110E3B5;
	Tue, 25 Jul 2023 07:53:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98F6E10E3B5
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 07:53:07 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id BCBAE6602329;
 Tue, 25 Jul 2023 08:53:05 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1690271586;
 bh=zjDdOFC9a1xT+iucTQPYYWPpLRkpkkaJ/SZ1lyENylU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=A5RF9fvuErLTTvbPfKhQvA4Hyyh6T7cSpgCDd1LSttaXS1+zKyeE/EdBcrPV1NeG2
 Z44sXJRI/ITzfx42VkryHJN1NV70oos2eRxd0ENr1QT5fKNLqUQUYvNCoGpW7VgX6r
 c+fCgy1Myi1ALYgq9563g+WhzpVaeAbR8yDD9aV8958g1aBi7p6e1cRLnwyUohmhU4
 mdtvTUjZASe68U7AuXMKB+NuO2shG+u1+GOAo1dUblr3ehIDu+nMk9nP7nFOeWQlg5
 alymvlFCeOQZcLTvAjgCBAbFvQB0swt+U1uc5apucwQz2eb/0h517UGrsR+YSb8tte
 UuBCB+OFmonmg==
Date: Tue, 25 Jul 2023 09:53:03 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v14 12/12] drm/gem: Add _unlocked postfix to
 drm_gem_pin/unpin()
Message-ID: <20230725095303.07611834@collabora.com>
In-Reply-To: <20230722234746.205949-13-dmitry.osipenko@collabora.com>
References: <20230722234746.205949-1-dmitry.osipenko@collabora.com>
 <20230722234746.205949-13-dmitry.osipenko@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: kernel@collabora.com, Thomas Zimmermann <tzimmermann@suse.de>,
 Emma Anholt <emma@anholt.net>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Melissa Wen <mwen@igalia.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Steven Price <steven.price@arm.com>,
 virtualization@lists.linux-foundation.org, Qiang Yu <yuq825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 23 Jul 2023 02:47:46 +0300
Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:

> Make clear that drm_gem_pin/unpin() functions take reservation lock by
> adding _unlocked postfix to the function names.
> 
> Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

I'm still a bit confused by the fact we sometimes use the
xxx[_locked]() pattern (version without the _locked suffix takes the
lock) and other times the xxx[_unlocked]() pattern (version with the
_unlocked suffix takes the lock). It'd be good to chose one pattern and
stick to it, at least for all core functions...

> ---
>  drivers/gpu/drm/drm_gem.c      | 4 ++--
>  drivers/gpu/drm/drm_internal.h | 4 ++--
>  drivers/gpu/drm/drm_prime.c    | 4 ++--
>  3 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index c18686f434d4..805eb0d85297 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -1146,7 +1146,7 @@ void drm_gem_print_info(struct drm_printer *p, unsigned int indent,
>  		obj->funcs->print_info(p, indent, obj);
>  }
>  
> -int drm_gem_pin(struct drm_gem_object *obj)
> +int drm_gem_pin_unlocked(struct drm_gem_object *obj)
>  {
>  	if (obj->funcs->pin)
>  		return obj->funcs->pin(obj);
> @@ -1154,7 +1154,7 @@ int drm_gem_pin(struct drm_gem_object *obj)
>  	return 0;
>  }
>  
> -void drm_gem_unpin(struct drm_gem_object *obj)
> +void drm_gem_unpin_unlocked(struct drm_gem_object *obj)
>  {
>  	if (obj->funcs->unpin)
>  		obj->funcs->unpin(obj);
> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
> index d7e023bbb0d5..80f5bd1da8fd 100644
> --- a/drivers/gpu/drm/drm_internal.h
> +++ b/drivers/gpu/drm/drm_internal.h
> @@ -173,8 +173,8 @@ void drm_gem_release(struct drm_device *dev, struct drm_file *file_private);
>  void drm_gem_print_info(struct drm_printer *p, unsigned int indent,
>  			const struct drm_gem_object *obj);
>  
> -int drm_gem_pin(struct drm_gem_object *obj);
> -void drm_gem_unpin(struct drm_gem_object *obj);
> +int drm_gem_pin_unlocked(struct drm_gem_object *obj);
> +void drm_gem_unpin_unlocked(struct drm_gem_object *obj);
>  int drm_gem_vmap(struct drm_gem_object *obj, struct iosys_map *map);
>  void drm_gem_vunmap(struct drm_gem_object *obj, struct iosys_map *map);
>  
> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index 63b709a67471..8145b49e95ff 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -583,7 +583,7 @@ int drm_gem_map_attach(struct dma_buf *dma_buf,
>  	if (!obj->funcs->get_sg_table)
>  		return -ENOSYS;
>  
> -	return drm_gem_pin(obj);
> +	return drm_gem_pin_unlocked(obj);
>  }
>  EXPORT_SYMBOL(drm_gem_map_attach);
>  
> @@ -601,7 +601,7 @@ void drm_gem_map_detach(struct dma_buf *dma_buf,
>  {
>  	struct drm_gem_object *obj = dma_buf->priv;
>  
> -	drm_gem_unpin(obj);
> +	drm_gem_unpin_unlocked(obj);
>  }
>  EXPORT_SYMBOL(drm_gem_map_detach);
>  

