Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CDC78420D3
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 11:11:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D253112EE0;
	Tue, 30 Jan 2024 10:11:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1436112EE0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 10:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1706609436;
 bh=pvTVYZQvoWE9TYRSfVKQhlX6lvtPW1b9pCFx1Xl/zbk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Bwt9Vxx7XAVrOtbWrBb7G+/IYQ+vog5Ze2jE+wOBgZQqlI16QYW4m05otZWBw0KP4
 Ttk7ggDeV4kKwQo5xwNFYvHFY/3i6ODDbOIHxDzOi8W2QiQmK1q9k+iApJq8PHTvac
 paw++6waKYNiQP3WNaq4FUI8O5zXgRcDvaBsLSH/hbPV4QLmTNLK8Mu0kim5lw1ogQ
 5iSnDI2LlwRH6mzYyj6nAUfwWwgtAsgO9EOmtyUnFRUqThSQR/uPEqfYh6BCtbgxGn
 JfUXMxjE+RcNb2GlDKzpPHOpQK+fA3NnZx7GfJE/yPO2xRdzDq1hx5PqnHWTAaZ9HQ
 /DExCDuRUIJIA==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4F68D3782079;
 Tue, 30 Jan 2024 10:10:35 +0000 (UTC)
Date: Tue, 30 Jan 2024 11:10:33 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v19 09/30] drm/shmem-helper: Add and use lockless
 drm_gem_shmem_get_pages()
Message-ID: <20240130111033.5c01054b@collabora.com>
In-Reply-To: <Zbi0lQG15vz6iHJK@phenom.ffwll.local>
References: <20240105184624.508603-1-dmitry.osipenko@collabora.com>
 <20240105184624.508603-10-dmitry.osipenko@collabora.com>
 <ZbKZNCbZoV4ovWTH@phenom.ffwll.local>
 <20240126111827.70f8726c@collabora.com>
 <d467e5a4-6b61-4cad-8e38-c4495836a0d6@collabora.com>
 <Zbi0lQG15vz6iHJK@phenom.ffwll.local>
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
 Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Steven Price <steven.price@arm.com>, David Airlie <airlied@gmail.com>,
 virtualization@lists.linux-foundation.org, Qiang Yu <yuq825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 30 Jan 2024 09:34:29 +0100
Daniel Vetter <daniel@ffwll.ch> wrote:

> On Fri, Jan 26, 2024 at 07:43:29PM +0300, Dmitry Osipenko wrote:
> > On 1/26/24 13:18, Boris Brezillon wrote:  
> > > On Thu, 25 Jan 2024 18:24:04 +0100
> > > Daniel Vetter <daniel@ffwll.ch> wrote:
> > >   
> > >> On Fri, Jan 05, 2024 at 09:46:03PM +0300, Dmitry Osipenko wrote:  
> > >>> Add lockless drm_gem_shmem_get_pages() helper that skips taking reservation
> > >>> lock if pages_use_count is non-zero, leveraging from atomicity of the
> > >>> refcount_t. Make drm_gem_shmem_mmap() to utilize the new helper.
> > >>>
> > >>> Acked-by: Maxime Ripard <mripard@kernel.org>
> > >>> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> > >>> Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
> > >>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> > >>> ---
> > >>>  drivers/gpu/drm/drm_gem_shmem_helper.c | 19 +++++++++++++++----
> > >>>  1 file changed, 15 insertions(+), 4 deletions(-)
> > >>>
> > >>> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> > >>> index cacf0f8c42e2..1c032513abf1 100644
> > >>> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> > >>> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> > >>> @@ -226,6 +226,20 @@ void drm_gem_shmem_put_pages_locked(struct drm_gem_shmem_object *shmem)
> > >>>  }
> > >>>  EXPORT_SYMBOL_GPL(drm_gem_shmem_put_pages_locked);
> > >>>  
> > >>> +static int drm_gem_shmem_get_pages(struct drm_gem_shmem_object *shmem)
> > >>> +{
> > >>> +	int ret;    
> > >>
> > >> Just random drive-by comment: a might_lock annotation here might be good,
> > >> or people could hit some really interesting bugs that are rather hard to
> > >> reproduce ...  
> > > 
> > > Actually, being able to acquire a ref in a dma-signalling path on an
> > > object we know for sure already has refcount >= 1 (because we previously
> > > acquired a ref in a path where dma_resv_lock() was allowed), was the
> > > primary reason I suggested moving to this atomic-refcount approach.
> > > 
> > > In the meantime, drm_gpuvm has evolved in a way that allows me to not
> > > take the ref in the dma-signalling path (the gpuvm_bo object now holds
> > > the ref, and it's acquired/released outside the dma-signalling path).
> > > 
> > > Not saying we shouldn't add this might_lock(), but others might have
> > > good reasons to have this function called in a path where locking
> > > is not allowed.  
> > 
> > For Panthor the might_lock indeed won't be a appropriate, thanks for
> > reminding about it. I'll add explanatory comment to the code.  
> 
> Hm these kind of tricks feel very dangerous to me. I think it would be
> good to split up the two cases into two functions:
> 
> 1. first one does only the atomic_inc and splats if the refcount is zero.
> I think something in the name that denotes that we're incrementing a
> borrowed pages reference would be good here, so like get_borrowed_pages
> (there's not really a naming convention for these in the kernel).
> Unfortunately no rust so we can't enforce that you provide the right kind
> of borrowed reference at compile time.

Yeah, I also considered adding a dedicated function for that use case
at some point, instead of abusing get_pages(). Given I no longer need
it, we can probably add this might_lock() and defer the addition of this
get_borrowed_pages() helper until someone actually needs it.

> 
> 2. second one has the might_lock.
> 
> This way you force callers to think what they're doing and ideally
> document where the borrowed reference is from, and ideally document that
> in the code. Otherwise we'll end up with way too much "works in testing,
> but is a nice CVE" code :-/

Totally agree with you on that point.
