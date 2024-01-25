Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0521283BCC2
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 10:07:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B90BB10F136;
	Thu, 25 Jan 2024 09:07:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E585510F85A
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 09:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1706173625;
 bh=jmxwkZEbRI0XAx+cYJ9cpE0ROLMlbdLaVvy/jQgXN+k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XJdgAyCRCGRT5DZYiJj70aIqs9zLKE3ws7azgqOUKukhW8MrG7e30kyqaQrg6pZ/J
 SjlBmKORjFGH0UJk9kC//JPytCbBFzL4bp9od75RK2NDfH+7O005+UUqwet/hfBx+S
 GsL/eKTgsKTtZOC/DDaCxr6OnY+lPxCWn6lkP0SzeJgFCbFlREWsJPN51u25R61ZCy
 nRFY5YLfNHLWDu8KndWfMdqEiOdwYwFLMJsgtv9LHCknZt9ob0UrjHmMoLVdNaDYnP
 wJ9b9gjuSaklo5rFWUUS8ZD1E4NFN8CCMD7EeZp5hR7adRcqPzlduZ7g57t0v4r9Dp
 rKhAqRsiXmH2g==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 44F1437813C4;
 Thu, 25 Jan 2024 09:07:04 +0000 (UTC)
Date: Thu, 25 Jan 2024 10:07:03 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v19 22/30] drm/shmem-helper: Add common memory shrinker
Message-ID: <20240125100703.76d802ad@collabora.com>
In-Reply-To: <20240105184624.508603-23-dmitry.osipenko@collabora.com>
References: <20240105184624.508603-1-dmitry.osipenko@collabora.com>
 <20240105184624.508603-23-dmitry.osipenko@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
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
 Gerd Hoffmann <kraxel@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Steven Price <steven.price@arm.com>, David Airlie <airlied@gmail.com>,
 virtualization@lists.linux-foundation.org, Qiang Yu <yuq825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri,  5 Jan 2024 21:46:16 +0300
Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:

>   *
>   * This function Increases the use count and allocates the backing pages if
>   * use-count equals to zero.
> + *
> + * Note that this function doesn't pin pages in memory. If your driver
> + * uses drm-shmem shrinker, then it's free to relocate pages to swap.
> + * Getting pages only guarantees that pages are allocated, and not that
> + * pages reside in memory. In order to pin pages use drm_gem_shmem_pin().

I still find this explanation confusing, if pages are allocated, they
reside in memory. The only difference between drm_gem_shmem_get_pages()
and drm_gem_shmem_pin_pages() is that the former lets the system
reclaim the memory if the buffer is idle (no unsignalled fence attached
to the dma_resv).

We also need to describe the workflow for GEM validation (that's the
TTM term for the swapin process happening when a GPU job is submitted).

1. Prepare the GPU job and initialize its fence
2. Lock the GEM resv
3. Add the GPU job fence to the resv object
4. If the GEM is evicted
   a. call drm_gem_shmem_swapin_locked()
   b. get the new sgt with drm_gem_shmem_get_pages_sgt_locked()
   c. repopulate the MMU table (driver internals)
5. Unlock the GEM dma_resv
6. Submit the GPU job

With this sequence, the GEM pages are guaranteed to stay around until
the GPU job is finished.

>   */
>  int drm_gem_shmem_get_pages(struct drm_gem_shmem_object *shmem)
