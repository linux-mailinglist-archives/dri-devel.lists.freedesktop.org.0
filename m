Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B447AE70B
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 09:43:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 536B910E35C;
	Tue, 26 Sep 2023 07:43:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26B3510E35C
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 07:43:12 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 356786607314;
 Tue, 26 Sep 2023 08:43:10 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1695714190;
 bh=yxiZWpVqxhEON5vsUHcs14H1MKuPG2laNGhIxvUFUj4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=X++0iks2Sjt4BtU3DuUWiNtZAp7n9eU5yx8gJaKnwb4In5KbopYEZE0UKDSqPsF5+
 YhDie/npt0KcwKy8kcnAd4Bf7x/NT9Z8znqAZkl3mZlRRagGY+1QzDgwU8f15BvPnH
 CfbCB2Lstrng2Yg99mmdwvgjyh75mVkABdUNTE4+mG0oxoJpbbfPOhCkhYN4qoa3Qu
 IxJZ2YfRaAlApG7JPkaxHzPRAObFUjQ2s7aJ3vnbuD2U4J2wbmpBpD1YH0e0GJJqFc
 yLiwrg7p+77hHL2+ojmv/D1gRdB1P9+iyj+/TfPgC2C9kKTk6GDUurw3Dh+eZehSlZ
 axodwmk8Yezcw==
Date: Tue, 26 Sep 2023 09:43:07 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v17 13/18] drm/shmem-helper: Add memory shrinker
Message-ID: <20230926094307.506f4b93@collabora.com>
In-Reply-To: <64e8708a-bb73-96ae-90af-f7b51317613b@collabora.com>
References: <20230914232721.408581-1-dmitry.osipenko@collabora.com>
 <20230914232721.408581-14-dmitry.osipenko@collabora.com>
 <20230915104633.0d5c3932@collabora.com>
 <64e8708a-bb73-96ae-90af-f7b51317613b@collabora.com>
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

On Tue, 26 Sep 2023 03:37:22 +0300
Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:

> On 9/15/23 11:46, Boris Brezillon wrote:
> >> -static int drm_gem_shmem_get_pages_locked(struct drm_gem_shmem_object *shmem)
> >> +static int
> >> +drm_gem_shmem_acquire_pages(struct drm_gem_shmem_object *shmem, bool init)
> >>  {
> >>  	struct drm_gem_object *obj = &shmem->base;
> >>  	struct page **pages;
> >>  
> >>  	dma_resv_assert_held(shmem->base.resv);
> >>  
> >> -	if (refcount_inc_not_zero(&shmem->pages_use_count))
> >> +	if (shmem->madv < 0) {
> >> +		drm_WARN_ON(obj->dev, shmem->pages);
> >> +		return -ENOMEM;
> >> +	}
> >> +
> >> +	if (shmem->pages) {
> >> +		drm_WARN_ON(obj->dev, !shmem->evicted);
> >>  		return 0;
> >> +	}
> >> +
> >> +	if (drm_WARN_ON(obj->dev, !(init ^ refcount_read(&shmem->pages_use_count))))
> >> +		return -EINVAL;  
> > OOC, why do we care? Is there any difference between initial and re-pin
> > that make the page allocation impossible? Feels like, if there's a
> > check to do, it should be done in the caller instead, and you can drop
> > the init param here.  
> 
> This is a sanity check that addresses additional refcnt tracking
> complexity imposed by shrinker.
> 
> This function is used by both init and re-pin that is invoked from
> several places in the code. It's not trivial to move that check to the
> callers.

drm_gem_shmem_acquire_pages() is called twice, once with init=false,
once with init=true. If you really care about this check, it can
be moved to the callers so

1/ it's clearer (the XOR operation between init and refcount to check if
refcount is zero on init and non-zero otherwise is convoluted)
2/ it doesn't leak to the function whose purpose it to [re-]acquire
pages

