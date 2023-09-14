Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DD27A0321
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 13:58:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68AF810E566;
	Thu, 14 Sep 2023 11:58:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3CEB10E566
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 11:58:44 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 2CB4E6607347;
 Thu, 14 Sep 2023 12:58:43 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1694692723;
 bh=am4vkW1Rc3Zf2CXsajZe99O+YaptgGzz6iCED2+PmdI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Xsb80TXEFg/eSsS7LdAG0ahjdeM0T9acIkaX/vS+JSSOICKqtLj5o/XBNEv+GO/dL
 0pgGKsZEuu8jEI/LJnwmP7G7Ie7a5TsZCaJk233G8OQGDjfZy9de75P4pFEaqTiGLJ
 UI/7ugeGpcD7Fh7z2hwO603jxR1f0D9G0BtNIFv+HVNC9+Zf4ylIJpsKiED66QKN+K
 Szm3CAWIap3+3oYE9JFgvRaljRTYXVepHZ5n+iBCKmppbvIBjM9sLhpgpY5KviFXSM
 M0mMO55OunloWbIAksXEJwM+T3FtztWeKnL65gTp4d0MkO/Qxq5uSMBiDgz3sQPnR3
 Sd+AoO+tbcunw==
Date: Thu, 14 Sep 2023 13:58:40 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v16 15/20] drm/shmem-helper: Add memory shrinker
Message-ID: <20230914135840.5e0e11fe@collabora.com>
In-Reply-To: <a89cc9c1-5054-e45f-edec-819fdbfef2b5@collabora.com>
References: <20230903170736.513347-1-dmitry.osipenko@collabora.com>
 <20230903170736.513347-16-dmitry.osipenko@collabora.com>
 <20230905100306.3564e729@collabora.com>
 <26f7ba6d-3520-0311-35e2-ef5706a98232@collabora.com>
 <20230913094832.3317c2df@collabora.com>
 <aa270715-89ae-2aac-e2e3-018c21e1ff0e@collabora.com>
 <20230914093626.19692c24@collabora.com>
 <21dda0bd-4264-b480-dbbc-29a7744bc96c@collabora.com>
 <20230914102737.08e61498@collabora.com>
 <a89cc9c1-5054-e45f-edec-819fdbfef2b5@collabora.com>
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

On Thu, 14 Sep 2023 14:36:23 +0300
Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:

> On 9/14/23 11:27, Boris Brezillon wrote:
> > On Thu, 14 Sep 2023 10:50:32 +0300
> > Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:
> >   
> >> On 9/14/23 10:36, Boris Brezillon wrote:  
> >>> On Thu, 14 Sep 2023 07:02:52 +0300
> >>> Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:
> >>>     
> >>>> On 9/13/23 10:48, Boris Brezillon wrote:    
> >>>>> On Wed, 13 Sep 2023 03:56:14 +0300
> >>>>> Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:
> >>>>>       
> >>>>>> On 9/5/23 11:03, Boris Brezillon wrote:      
> >>>>>>>>                * But
> >>>>>>>> +		 * acquiring the obj lock in drm_gem_shmem_release_pages_locked() can
> >>>>>>>> +		 * cause a locking order inversion between reservation_ww_class_mutex
> >>>>>>>> +		 * and fs_reclaim.
> >>>>>>>> +		 *
> >>>>>>>> +		 * This deadlock is not actually possible, because no one should
> >>>>>>>> +		 * be already holding the lock when drm_gem_shmem_free() is called.
> >>>>>>>> +		 * Unfortunately lockdep is not aware of this detail.  So when the
> >>>>>>>> +		 * refcount drops to zero, don't touch the reservation lock.
> >>>>>>>> +		 */
> >>>>>>>> +		if (shmem->got_pages_sgt &&
> >>>>>>>> +		    refcount_dec_and_test(&shmem->pages_use_count)) {
> >>>>>>>> +			drm_gem_shmem_do_release_pages_locked(shmem);
> >>>>>>>> +			shmem->got_pages_sgt = false;
> >>>>>>>>  		}        
> >>>>>>> Leaking memory is the right thing to do if pages_use_count > 1 (it's
> >>>>>>> better to leak than having someone access memory it no longer owns), but
> >>>>>>> I think it's worth mentioning in the above comment.        
> >>>>>>
> >>>>>> It's unlikely that it will be only a leak without a following up
> >>>>>> use-after-free. Neither is acceptable.      
> >>>>>
> >>>>> Not necessarily, if you have a page leak, it could be that the GPU has
> >>>>> access to those pages, but doesn't need the GEM object anymore
> >>>>> (pages are mapped by the iommu, which doesn't need shmem->sgt or
> >>>>> shmem->pages after the mapping is created). Without a WARN_ON(), this
> >>>>> can go unnoticed and lead to memory corruptions/information leaks.
> >>>>>       
> >>>>>>
> >>>>>> The drm_gem_shmem_free() could be changed such that kernel won't blow up
> >>>>>> on a refcnt bug, but that's not worthwhile doing because drivers
> >>>>>> shouldn't have silly bugs.      
> >>>>>
> >>>>> We definitely don't want to fix that, but we want to complain loudly
> >>>>> (WARN_ON()), and make sure the risk is limited (preventing memory from
> >>>>> being re-assigned to someone else by not freeing it).      
> >>>>
> >>>> That's what the code did and continues to do here. Not exactly sure what
> >>>> you're trying to say. I'm going to relocate the comment in v17 to
> >>>> put_pages(), we can continue discussing it there if I'm missing yours point.
> >>>>    
> >>>
> >>> I'm just saying it would be worth mentioning that we're intentionally
> >>> leaking memory if shmem->pages_use_count > 1. Something like:
> >>>
> >>> 	/**
> >>> 	 * shmem->pages_use_count should be 1 when ->sgt != NULL and
> >>> 	 * zero otherwise. If some users still hold a pages reference
> >>> 	 * that's a bug, and we intentionally leak the pages so they
> >>> 	 * can't be re-allocated to someone else while the GPU/CPU
> >>> 	 * still have access to it.
> >>> 	 */
> >>> 	drm_WARN_ON(drm,
> >>> 		    refcount_read(&shmem->pages_use_count) == (shmem->sgt ? 1 : 0));
> >>> 	if (shmem->sgt && refcount_dec_and_test(&shmem->pages_use_count))
> >>> 		drm_gem_shmem_free_pages(shmem);    
> >>
> >> That may be acceptable, but only once there will a driver using this
> >> feature.  
> > 
> > Which feature? That's not related to a specific feature, that's just
> > how drm_gem_shmem_get_pages_sgt() works, it takes a pages ref that can
> > only be released in drm_gem_shmem_free(), because sgt users are not
> > refcounted and the sgt stays around until the GEM object is freed or
> > its pages are evicted. The only valid cases we have at the moment are:
> > 
> > - pages_use_count == 1 && sgt != NULL
> > - pages_use_count == 0
> > 
> > any other situations are buggy.  
> 
> sgt may belong to dma-buf for which pages_use_count=0, this can't be
> done until sgt mess is sorted out

No it can't, not in that path, because the code you're adding is in the
if (!obj->import_branch) branch:


 	if (obj->import_attach) {
 		drm_prime_gem_destroy(obj, shmem->sgt);
 	} else {
		...
		// Your changes are here.
		...
	}
> 

