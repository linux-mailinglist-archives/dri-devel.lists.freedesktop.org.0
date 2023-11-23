Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B44417F5ACB
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 10:08:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D94510E6EB;
	Thu, 23 Nov 2023 09:08:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F3CE10E6EB
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 09:08:35 +0000 (UTC)
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id B73B86607377;
 Thu, 23 Nov 2023 09:08:32 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1700730513;
 bh=BIHodNmsBiGjHqmmU2/SA/mIIzueNfft8YCTcpkLTgU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cXWnvuH2n9K2VzAsDkgwZW6+wVffZIAgGJPyIyl4iY6CA5ZEZLHdwnS/E6UzU/ju/
 6sFmHXVuEb31W1jwWXksIzQLoYFfRv5f+C9VqCUvh4hHs/AZf7/YBEIZPEncVEN3uV
 AAUO/q2UlgCcyEGw8444Agt0CLXNfeSqHhLXgCSO1UjWM5WO8WlwOtE8198AbDX7p4
 Re1gN18WWsPBREhAUxkQsHRq0d6yA44PpLx6quYZ9Slpi6z8fMl8cD6NQXUptuRocp
 +2QKYnE3GWBCIfi+hn1a6kzP4jNGhfhuBftAnL+HXKzlQofFiGrSRQx2q11hHncSwp
 GR6eTwumf6icQ==
Date: Thu, 23 Nov 2023 10:08:29 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v18 22/26] drm/shmem-helper: Don't free refcounted GEM
Message-ID: <20231123100829.2e4addd0@collabora.com>
In-Reply-To: <2faf1111-9646-21e3-feb3-f59c955bc719@collabora.com>
References: <20231029230205.93277-1-dmitry.osipenko@collabora.com>
 <20231029230205.93277-23-dmitry.osipenko@collabora.com>
 <20231113105438.60896fdf@collabora.com>
 <2faf1111-9646-21e3-feb3-f59c955bc719@collabora.com>
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

On Thu, 23 Nov 2023 01:30:24 +0300
Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:

> On 11/13/23 12:54, Boris Brezillon wrote:
> > On Mon, 30 Oct 2023 02:02:01 +0300
> > Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:
> >   
> >> Don't free refcounted shmem object to prevent use-after-free bug that
> >> is worse than a memory leak.
> >>
> >> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> >> ---
> >>  drivers/gpu/drm/drm_gem_shmem_helper.c | 7 ++++---
> >>  1 file changed, 4 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> >> index 6dd087f19ea3..4253c367dc07 100644
> >> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> >> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> >> @@ -203,9 +203,10 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
> >>  	if (obj->import_attach)
> >>  		drm_prime_gem_destroy(obj, shmem->sgt);
> >>  
> >> -	drm_WARN_ON(obj->dev, refcount_read(&shmem->vmap_use_count));
> >> -	drm_WARN_ON(obj->dev, refcount_read(&shmem->pages_use_count));
> >> -	drm_WARN_ON(obj->dev, refcount_read(&shmem->pages_pin_count));
> >> +	if (drm_WARN_ON(obj->dev, refcount_read(&shmem->vmap_use_count)) ||
> >> +	    drm_WARN_ON(obj->dev, refcount_read(&shmem->pages_use_count)) ||
> >> +	    drm_WARN_ON(obj->dev, refcount_read(&shmem->pages_pin_count)))
> >> +		return;  
> > 
> > I guess you're worried about ->sgt being referenced by the driver after
> > the GEM is destroyed. If we assume drivers don't cache the sgt and
> > always call get_pages_sgt() when they need it that shouldn't be an
> > issue. What we really don't want to release is the pages themselves,
> > but the GPU MMU might still have active mappings pointing to these
> > pages.
> > 
> > In any case, I'm not against leaking the GEM object when any of these
> > counters are not zero, but can we at least have a comment in the
> > code explaining why we're doing that, so people don't have to go look
> > at the git history to figure it out.  
> 
> This patch is a minor improvement, it doesn't address any specific
> issue. This should be a common pattern in kernel. If you're giving a
> warning and know about the inevitable catastrophe, then avoid it if you can.

Sure, I'm just asking that we add a comment to explain why we leak
memory here. Is that too much to ask?
