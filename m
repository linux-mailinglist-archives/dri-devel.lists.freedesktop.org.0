Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D63AD841DE4
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 09:36:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3AC0112E40;
	Tue, 30 Jan 2024 08:35:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34B85112E40
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 08:35:34 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-a31846fd10cso61257766b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 00:35:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1706603672; x=1707208472; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8A/F0qjSBSUkCN1wUoX6X3MUwGOk7GLAJ8sdI6nLy84=;
 b=SAGTqrv3BG+bItOakBZwMWGOIcPwx+kW8uqaF9fJhiKWtoRvxqlwV3gdtjokakr7qp
 PBo+8zYWali27/Q/NvE0CmExAJuIU9e9MVsOLsushzYfXVfzsckBC3zl8McCHsdZploi
 B9VJ0ae/oITqUUDOz4NJ2EEI3KZtHPWmbyK5A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706603672; x=1707208472;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8A/F0qjSBSUkCN1wUoX6X3MUwGOk7GLAJ8sdI6nLy84=;
 b=Osx9XELo70wNERnJKga9uRk+Sy5akTEUp7hkXoy5FTAt5GvZToybJiNikQkS8Qu4Yb
 0ZxA29BP7aSbdzbLM6LQxBHa43BqWlZZYt/j2KXfu5gDFsPwCqGpQ9oDvVLHuPrVMnZb
 HxksSVgxfy/1OL6jp9AMmYu49Vt5X4C7iHdBIiVnGQoSGIf81cgtYqseu1lHHNUl28cB
 DG+YZr+gAYA3cPaHKBJJC64l4U7n/lXCDQXZj7kA2GeedtGMj7AvVggZjDjyymEUHgff
 hHocar5oZzspirA+OabzlVay/lRriw1yuUdleGGy2cT828yAMOJHUQrNyKctSN4qHUcg
 /IeA==
X-Gm-Message-State: AOJu0YzJxHFvKCGelP7vn0o6Plw7TBoyoHo/ITPuSZnMLusNTcH8aMK4
 UWg3eArjN3tBPAv1ZbvF7XpNUrxZ42KbK4lJ9bEVxvQy3Y2q7jENwxSMZ7uduoc=
X-Google-Smtp-Source: AGHT+IFoBU0SlfO62YFQyBv5072jSKi3i4eibji92GBY7EfnrbEorrPEFCoLGaBtQ3uSEA6MKeKnRg==
X-Received: by 2002:a17:907:7d89:b0:a2c:4b28:90d5 with SMTP id
 oz9-20020a1709077d8900b00a2c4b2890d5mr7611829ejc.2.1706603672306; 
 Tue, 30 Jan 2024 00:34:32 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 vx3-20020a170907a78300b00a363346802asm198856ejc.19.2024.01.30.00.34.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jan 2024 00:34:31 -0800 (PST)
Date: Tue, 30 Jan 2024 09:34:29 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v19 09/30] drm/shmem-helper: Add and use lockless
 drm_gem_shmem_get_pages()
Message-ID: <Zbi0lQG15vz6iHJK@phenom.ffwll.local>
Mail-Followup-To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 David Airlie <airlied@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Qiang Yu <yuq825@gmail.com>, Steven Price <steven.price@arm.com>,
 Emma Anholt <emma@anholt.net>, Melissa Wen <mwen@igalia.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com, virtualization@lists.linux-foundation.org
References: <20240105184624.508603-1-dmitry.osipenko@collabora.com>
 <20240105184624.508603-10-dmitry.osipenko@collabora.com>
 <ZbKZNCbZoV4ovWTH@phenom.ffwll.local>
 <20240126111827.70f8726c@collabora.com>
 <d467e5a4-6b61-4cad-8e38-c4495836a0d6@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d467e5a4-6b61-4cad-8e38-c4495836a0d6@collabora.com>
X-Operating-System: Linux phenom 6.6.11-amd64 
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
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Melissa Wen <mwen@igalia.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Steven Price <steven.price@arm.com>, David Airlie <airlied@gmail.com>,
 virtualization@lists.linux-foundation.org, Qiang Yu <yuq825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 26, 2024 at 07:43:29PM +0300, Dmitry Osipenko wrote:
> On 1/26/24 13:18, Boris Brezillon wrote:
> > On Thu, 25 Jan 2024 18:24:04 +0100
> > Daniel Vetter <daniel@ffwll.ch> wrote:
> > 
> >> On Fri, Jan 05, 2024 at 09:46:03PM +0300, Dmitry Osipenko wrote:
> >>> Add lockless drm_gem_shmem_get_pages() helper that skips taking reservation
> >>> lock if pages_use_count is non-zero, leveraging from atomicity of the
> >>> refcount_t. Make drm_gem_shmem_mmap() to utilize the new helper.
> >>>
> >>> Acked-by: Maxime Ripard <mripard@kernel.org>
> >>> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> >>> Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
> >>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> >>> ---
> >>>  drivers/gpu/drm/drm_gem_shmem_helper.c | 19 +++++++++++++++----
> >>>  1 file changed, 15 insertions(+), 4 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> >>> index cacf0f8c42e2..1c032513abf1 100644
> >>> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> >>> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> >>> @@ -226,6 +226,20 @@ void drm_gem_shmem_put_pages_locked(struct drm_gem_shmem_object *shmem)
> >>>  }
> >>>  EXPORT_SYMBOL_GPL(drm_gem_shmem_put_pages_locked);
> >>>  
> >>> +static int drm_gem_shmem_get_pages(struct drm_gem_shmem_object *shmem)
> >>> +{
> >>> +	int ret;  
> >>
> >> Just random drive-by comment: a might_lock annotation here might be good,
> >> or people could hit some really interesting bugs that are rather hard to
> >> reproduce ...
> > 
> > Actually, being able to acquire a ref in a dma-signalling path on an
> > object we know for sure already has refcount >= 1 (because we previously
> > acquired a ref in a path where dma_resv_lock() was allowed), was the
> > primary reason I suggested moving to this atomic-refcount approach.
> > 
> > In the meantime, drm_gpuvm has evolved in a way that allows me to not
> > take the ref in the dma-signalling path (the gpuvm_bo object now holds
> > the ref, and it's acquired/released outside the dma-signalling path).
> > 
> > Not saying we shouldn't add this might_lock(), but others might have
> > good reasons to have this function called in a path where locking
> > is not allowed.
> 
> For Panthor the might_lock indeed won't be a appropriate, thanks for
> reminding about it. I'll add explanatory comment to the code.

Hm these kind of tricks feel very dangerous to me. I think it would be
good to split up the two cases into two functions:

1. first one does only the atomic_inc and splats if the refcount is zero.
I think something in the name that denotes that we're incrementing a
borrowed pages reference would be good here, so like get_borrowed_pages
(there's not really a naming convention for these in the kernel).
Unfortunately no rust so we can't enforce that you provide the right kind
of borrowed reference at compile time.

2. second one has the might_lock.

This way you force callers to think what they're doing and ideally
document where the borrowed reference is from, and ideally document that
in the code. Otherwise we'll end up with way too much "works in testing,
but is a nice CVE" code :-/

Cheers, Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
