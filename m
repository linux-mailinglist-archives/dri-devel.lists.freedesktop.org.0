Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C1F79E11D
	for <lists+dri-devel@lfdr.de>; Wed, 13 Sep 2023 09:48:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F65A10E0F0;
	Wed, 13 Sep 2023 07:48:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F91510E0F0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 07:48:36 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 88D0F6607319;
 Wed, 13 Sep 2023 08:48:34 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1694591315;
 bh=EGLX0+KxN7hUT9YpTYg5LgU9mcegZL1wrYeI+JeqTiA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Ny8/LDYyxVRceVVvo1mDSez4K8treZJHNLwGat1Kx7Ch8uyC4nbACQ38l2HmCMepj
 9EmeCTADZ9KYKBjFmJ3llXRgUxX/n4xa1IzopwnvvTH0KtaLYHKWMH12Xqr1/2GLOY
 2iWGVJDd5Pt7oAAh4k0jw0iMGEMoEbkyD4HBGcm3ZOoWUOporKCd1xJJ7+eqyEQGkQ
 jBS9nqhtV09nauFdB/+3HKQJeNuCMHSzPGLO4zV6Nmey7D1mmu0ZEXCmNeM7HT9o9c
 rGp9yblZmNpUHGWmvZBkgXR2a96y+P4UUFtNVe6n2u71/F3iptvf/XVusa2clwzM3a
 CSneCkV3NNjWg==
Date: Wed, 13 Sep 2023 09:48:32 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v16 15/20] drm/shmem-helper: Add memory shrinker
Message-ID: <20230913094832.3317c2df@collabora.com>
In-Reply-To: <26f7ba6d-3520-0311-35e2-ef5706a98232@collabora.com>
References: <20230903170736.513347-1-dmitry.osipenko@collabora.com>
 <20230903170736.513347-16-dmitry.osipenko@collabora.com>
 <20230905100306.3564e729@collabora.com>
 <26f7ba6d-3520-0311-35e2-ef5706a98232@collabora.com>
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

On Wed, 13 Sep 2023 03:56:14 +0300
Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:

> On 9/5/23 11:03, Boris Brezillon wrote:
> >>                * But
> >> +		 * acquiring the obj lock in drm_gem_shmem_release_pages_locked() can
> >> +		 * cause a locking order inversion between reservation_ww_class_mutex
> >> +		 * and fs_reclaim.
> >> +		 *
> >> +		 * This deadlock is not actually possible, because no one should
> >> +		 * be already holding the lock when drm_gem_shmem_free() is called.
> >> +		 * Unfortunately lockdep is not aware of this detail.  So when the
> >> +		 * refcount drops to zero, don't touch the reservation lock.
> >> +		 */
> >> +		if (shmem->got_pages_sgt &&
> >> +		    refcount_dec_and_test(&shmem->pages_use_count)) {
> >> +			drm_gem_shmem_do_release_pages_locked(shmem);
> >> +			shmem->got_pages_sgt = false;
> >>  		}  
> > Leaking memory is the right thing to do if pages_use_count > 1 (it's
> > better to leak than having someone access memory it no longer owns), but
> > I think it's worth mentioning in the above comment.  
> 
> It's unlikely that it will be only a leak without a following up
> use-after-free. Neither is acceptable.

Not necessarily, if you have a page leak, it could be that the GPU has
access to those pages, but doesn't need the GEM object anymore
(pages are mapped by the iommu, which doesn't need shmem->sgt or
shmem->pages after the mapping is created). Without a WARN_ON(), this
can go unnoticed and lead to memory corruptions/information leaks.

> 
> The drm_gem_shmem_free() could be changed such that kernel won't blow up
> on a refcnt bug, but that's not worthwhile doing because drivers
> shouldn't have silly bugs.

We definitely don't want to fix that, but we want to complain loudly
(WARN_ON()), and make sure the risk is limited (preventing memory from
being re-assigned to someone else by not freeing it).

