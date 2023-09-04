Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 828617912E2
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 10:01:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1250210E2E8;
	Mon,  4 Sep 2023 08:01:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CADC110E2E9;
 Mon,  4 Sep 2023 08:01:45 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 4B1416607239;
 Mon,  4 Sep 2023 09:01:43 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1693814504;
 bh=e788C098QfddEO6hbR3WKnWmYUt07fZ7PCwwrd1VwFI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=EOqkLVtSqUOCgc8GPlpz2M4k/6FdauJ5pvx55T+jY+dq7Ot4IHIhnADdb4GXozeiH
 ndpbRAwKSPxos43fFKQUg+3BmY3ucNNfGNw5x19QqCbila88LyIU7j0wWq9q77/FMv
 qK9khOPykQCMpCGnjoyUmaXMdzBeSngN0ABciFV9Rg1LhIp3viYPbZFqZNG4xFtsED
 vgJv5Hp4u5XnY0JLuJvX2wcvp0dHadNCK5i7up4G1pyigyoGz9/b1qBSazHGNDpUiX
 KfgUeIuIS7OGuAMqg2kTT+ITINSyd08RoPgVYrCUdmEUPuFoe/gYlqqz+odKvv0Now
 8Of5RikIDdL1Q==
Date: Mon, 4 Sep 2023 10:01:40 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v15 01/23] drm/shmem-helper: Fix UAF in error path when
 freeing SGT of imported GEM
Message-ID: <20230904100140.6f4e3012@collabora.com>
In-Reply-To: <a587b4db-c3a8-654b-a043-b698f1d98bf6@collabora.com>
References: <20230827175449.1766701-1-dmitry.osipenko@collabora.com>
 <20230827175449.1766701-2-dmitry.osipenko@collabora.com>
 <20230828131647.18888896@collabora.com>
 <a587b4db-c3a8-654b-a043-b698f1d98bf6@collabora.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Emma Anholt <emma@anholt.net>,
 Peter Zijlstra <peterz@infradead.org>, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, kernel@collabora.com,
 Will Deacon <will@kernel.org>, Steven Price <steven.price@arm.com>,
 intel-gfx@lists.freedesktop.org, Boqun Feng <boqun.feng@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Melissa Wen <mwen@igalia.com>,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 Qiang Yu <yuq825@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 2 Sep 2023 21:15:39 +0300
Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:

> On 8/28/23 14:16, Boris Brezillon wrote:
> > On Sun, 27 Aug 2023 20:54:27 +0300
> > Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:
> >   
> >> Freeing drm-shmem GEM right after creating it using
> >> drm_gem_shmem_prime_import_sg_table() frees SGT of the imported dma-buf
> >> and then dma-buf frees this SGT second time.
> >>
> >> The v3d_prime_import_sg_table() is example of a error code path where
> >> dma-buf's SGT is freed by drm-shmem and then it's freed second time by
> >> dma_buf_unmap_attachment() in drm_gem_prime_import_dev().
> >>
> >> Add drm-shmem GEM flag telling that this is imported SGT shall not be
> >> treated as own SGT, fixing the use-after-free bug.
> >>
> >> Cc: stable@vger.kernel.org
> >> Fixes: 2194a63a818d ("drm: Add library for shmem backed GEM objects")
> >> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> >> ---
> >>  drivers/gpu/drm/drm_gem_shmem_helper.c | 3 ++-
> >>  include/drm/drm_gem_shmem_helper.h     | 7 +++++++
> >>  2 files changed, 9 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> >> index a783d2245599..78d9cf2355a5 100644
> >> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> >> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> >> @@ -141,7 +141,7 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
> >>  
> >>  	if (obj->import_attach) {
> >>  		drm_prime_gem_destroy(obj, shmem->sgt);
> >> -	} else {
> >> +	} else if (!shmem->imported_sgt) {
> >>  		dma_resv_lock(shmem->base.resv, NULL);
> >>  
> >>  		drm_WARN_ON(obj->dev, shmem->vmap_use_count);
> >> @@ -758,6 +758,7 @@ drm_gem_shmem_prime_import_sg_table(struct drm_device *dev,
> >>  		return ERR_CAST(shmem);
> >>  
> >>  	shmem->sgt = sgt;
> >> +	shmem->imported_sgt = true;  
> > 
> > 
> > I feel like adding more fields that can be used to do the is_imported()
> > check is going to be even more confusing. Can we instead have
> > 
> > 	/* drm_gem_shmem_prime_import_sg_table() can be called from a
> > 	 * driver specific ->import_sg_table() implementations that
> > 	 * have extra failable initialization steps. Assign
> > 	 * drm_gem_object::import_attach here (even though it's
> > 	 * assigned in drm_gem_prime_import_dev()), so we don't end up
> > 	 * with driver error paths calling drm_gem_shmem_free() with an
> > 	 * imported sg_table assigned to drm_gem_shmem_object::sgt and
> > 	 * drm_gem_object::import_attach left uninitialized.
> > 	 */
> > 	shmem->base.import_attach = attach;
> > 
> > here?  
> 
> AFAICT, this is not going to work because obj->import_attach will be
> released by drm_prime core by the time drm_gem_shmem_free() is invoked
> and drm_gem_shmem_free() uses obj->import_attach as well.

How can this happen? If something wrong happens in the driver-specific
->gem_prime_import_sg_table() implementation, drm_gem_shmem_free() will
be called before ->gem_prime_import_sg_table() returns, and the
attachment will only be released after that [1].

> I'll keep this
> patch around unless there will be other suggestions. To me the flag is
> good enough, I'll add a clarifying comment to the code in v16.

I really think this is a bad idea, for the same reasons I gave in my
reply to patch 2 (adding fields that need to be maintained when the
state can be inferred from other fields is error prone).

[1]https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_prime.c#L958
