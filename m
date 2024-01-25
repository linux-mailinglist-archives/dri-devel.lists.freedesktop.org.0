Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7B183BE87
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 11:20:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF72010E233;
	Thu, 25 Jan 2024 10:20:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3142310E233
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 10:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1706177988;
 bh=SNTqFndHS7fusbc/JoJL6VmM5mMHU74c/gZCl49dXII=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=crzCrYotEFR6vHCVGwVhc8KCpzfBEpAGjgrKWvRQ8thXlbUnvSjkuRRNucJZMkYO3
 zpqJs3oi/mRonlfMsnR8WglzPGURtXrGnD/c/EYZ1qzVEvXG5SWZ+3mf0fypx2lfQL
 L3YMzd1en2ZEJrPhSPIYcmV60/0CrIV3BaDFTOyvRlZGDTWAZan6sjhww3Gi5+rw2s
 2U+wIVvsDuFaCAgxTFLxMryEeh3XIyFe/HQpQAcOv69BfzfzdalaQ1yFWDlugbiSn2
 qnEmc23s7Q2UktOoh6Hqknk3+8RnVzZLFTFb7lAWGInDP7jaaTmNsmXeVf2H8/RTZN
 QjpJHe786N2vw==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 657083780FC7;
 Thu, 25 Jan 2024 10:19:47 +0000 (UTC)
Date: Thu, 25 Jan 2024 11:19:46 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v19 22/30] drm/shmem-helper: Add common memory shrinker
Message-ID: <20240125111946.797a1e1e@collabora.com>
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

> +static bool drm_gem_shmem_is_evictable(struct drm_gem_shmem_object *shmem)
> +{
> +	return (shmem->madv >= 0) && shmem->base.funcs->evict &&
> +		refcount_read(&shmem->pages_use_count) &&
> +		!refcount_read(&shmem->pages_pin_count) &&
> +		!shmem->base.dma_buf && !shmem->base.import_attach &&
> +		!shmem->evicted;

Are we missing

                && dma_resv_test_signaled(shmem->base.resv,
					  DMA_RESV_USAGE_BOOKKEEP)

to make sure the GPU is done using the BO?
The same applies to drm_gem_shmem_is_purgeable() BTW.

If you don't want to do this test here, we need a way to let drivers
provide a custom is_{evictable,purgeable}() test.

I guess we should also expose drm_gem_shmem_shrinker_update_lru_locked()
to let drivers move the GEMs that were used most recently (those
referenced by a GPU job) at the end of the evictable LRU.

> +}
> +
