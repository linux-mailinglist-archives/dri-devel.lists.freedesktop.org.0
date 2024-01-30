Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8633841E06
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 09:40:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6B02112E3F;
	Tue, 30 Jan 2024 08:40:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80504112E3F
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 08:40:07 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-a34addf84dbso98363466b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 00:40:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1706603946; x=1707208746; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TE8g68bLoogToLshL4JAe9mPYk5p/5wsw2SHoYT3R4c=;
 b=VWh6iLSsdGLPN9erh71lWxFtyX7nK0i1eY1XIm4r1v2zG2dCXu/jPIdfRW9P6SowJj
 mKJGqIcf6TGv2OPKvmoh08c/IJmg2NO/JzejJdDMvq2Ixw5cbg/fvg60GeJN37XTGc+V
 pXzDeUoCdUUtbfZkRHKGdz6EGIcKf8K5OAPaw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706603946; x=1707208746;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TE8g68bLoogToLshL4JAe9mPYk5p/5wsw2SHoYT3R4c=;
 b=TVCTk1tWpyDH+0H13Kp9VCpsx74+WpND1j897Oyt/UxT9au6oaj9w0fAPcWf6Q0XzN
 vwJwDHQWuEJxSp88qfCwV1OoDYuEAPtfJlZIkH5YZbtTykF2d7/5dIPx3+xEm2+WaYUe
 Oz7v/ACgMIdI1K43dLajnZNHMvWyhCCQz3PRr3a6tHqNXFYKU/IG3aLi39mAoY2zIAp0
 243u85xw4HirTV7c5mH8f9htLIs4i3xXFu6Y61Bf6l0wSi5FpMTK0ZqTDTMivSshMbCi
 hIDwl9aHEG7MPl9yz3nZYGxAQUhzFlkRDE/sUvJ5w8S0Ts1zZCQXuDdz1b4BQI5mFJBb
 yDcA==
X-Gm-Message-State: AOJu0Yx3ZCetj06n3SG1EH5C6TJhJjLkZ/yFCrmc1iyiHytls7U0qRFj
 6gqftHfw6OUo0enhnjFxgNp33azEz+2NXTW0Kf2YbUNRpeKtl+oxBNct7VBpE/M=
X-Google-Smtp-Source: AGHT+IFdCTZEdjvisRYBnyq6kNe7z03n8kmvQKAP+gzRjiJX+KgoRRSwkprv6TQSY4NWeiBUSsDbbA==
X-Received: by 2002:a17:906:6d01:b0:a35:561d:cf5a with SMTP id
 m1-20020a1709066d0100b00a35561dcf5amr5688909ejr.6.1706603945702; 
 Tue, 30 Jan 2024 00:39:05 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 s8-20020a17090699c800b00a351828ca32sm4271064ejn.118.2024.01.30.00.39.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jan 2024 00:39:05 -0800 (PST)
Date: Tue, 30 Jan 2024 09:39:03 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v19 22/30] drm/shmem-helper: Add common memory shrinker
Message-ID: <Zbi1pzY3CbQxnnBQ@phenom.ffwll.local>
Mail-Followup-To: Boris Brezillon <boris.brezillon@collabora.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
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
 <20240105184624.508603-23-dmitry.osipenko@collabora.com>
 <20240125100703.76d802ad@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240125100703.76d802ad@collabora.com>
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
Cc: kernel@collabora.com, Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Emma Anholt <emma@anholt.net>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Melissa Wen <mwen@igalia.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Steven Price <steven.price@arm.com>, David Airlie <airlied@gmail.com>,
 virtualization@lists.linux-foundation.org, Qiang Yu <yuq825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 25, 2024 at 10:07:03AM +0100, Boris Brezillon wrote:
> On Fri,  5 Jan 2024 21:46:16 +0300
> Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:
> 
> >   *
> >   * This function Increases the use count and allocates the backing pages if
> >   * use-count equals to zero.
> > + *
> > + * Note that this function doesn't pin pages in memory. If your driver
> > + * uses drm-shmem shrinker, then it's free to relocate pages to swap.
> > + * Getting pages only guarantees that pages are allocated, and not that
> > + * pages reside in memory. In order to pin pages use drm_gem_shmem_pin().
> 
> I still find this explanation confusing, if pages are allocated, they
> reside in memory. The only difference between drm_gem_shmem_get_pages()
> and drm_gem_shmem_pin_pages() is that the former lets the system
> reclaim the memory if the buffer is idle (no unsignalled fence attached
> to the dma_resv).
> 
> We also need to describe the workflow for GEM validation (that's the
> TTM term for the swapin process happening when a GPU job is submitted).
> 
> 1. Prepare the GPU job and initialize its fence
> 2. Lock the GEM resv
> 3. Add the GPU job fence to the resv object
> 4. If the GEM is evicted
>    a. call drm_gem_shmem_swapin_locked()
>    b. get the new sgt with drm_gem_shmem_get_pages_sgt_locked()
>    c. repopulate the MMU table (driver internals)

Might be good to explain where to call drm_sched_job_arm() here for
drivers using drm/sched, since that also needs to be at a very specific
point. Probably best to flesh out the details here by linking to the
relevant drm/sched and gpuvm functions as examples.

> 5. Unlock the GEM dma_resv
> 6. Submit the GPU job
> 
> With this sequence, the GEM pages are guaranteed to stay around until
> the GPU job is finished.

Yeah I think the comment needs to explain how this ties together with
dma_resv locking and dma_resv fences, otherwise it just doesn't make much
sense.

This holds even more so given that some of the earlier drivers derived
from i915-gem code (and i915-gem itself) use _pin() both for these more
permanent pinnings, and also to temporarily put the memory in place before
it all gets fenced and then unpinned&unlocked.

So would be really good to have the sharpest possible nomeclatura here we
can get, and link between all the related concepts and functions in the
kerneldoc.

Some overview flow like Boris sketched above in a DOC: section would also
be great.

Cheers, Sima
> 
> >   */
> >  int drm_gem_shmem_get_pages(struct drm_gem_shmem_object *shmem)

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
