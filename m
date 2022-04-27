Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF1A5118EA
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 16:50:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7E8F10E51F;
	Wed, 27 Apr 2022 14:50:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3762C10E51F
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 14:50:09 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id p4so2276359edx.0
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 07:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=2ukhvq6UCkilr6qtjyCJGVeLtyAJOtLrDnxOLi9CaTw=;
 b=EVO0ouyrgiZootRwq5voIFao1mlr3tWZKAxywItZk5du+HZwD4P2s5o/P/joQkbtwK
 QooStUd0Yx0O2Z+XDGfydzdAP/FbPjNWO4WxY8O0nGE72bfq4ax7/ehYBzkWh7TclOP5
 VxcoSpLJg9f3J4Dh6xWwfRPO1gbuX/nryjY1Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=2ukhvq6UCkilr6qtjyCJGVeLtyAJOtLrDnxOLi9CaTw=;
 b=tJnriR4G1dVtO/KugEk676pF24ssf6WDlrqhBeqBP3KLQg6Z4BT/WYQPkp3b1LJvyn
 pqKGLNYBhRJ5FXxocHIkhWSfDaodFytbkCpm0sftq16TInZCXC3cdkqoqq69Z+x/0Z0a
 yWgghbzxu6HARtj4nv5Y3F6/oaCy+bkQ0fi6R5rVesyfR+TZdsdpnBvKPUcyJlEPNcEG
 05znJxpuhiy5MdLdmfLPZa6iyr3g8F15OwxZARfTAO2eGFK5FCbTLN3zhmfpvISyOr6y
 9behhA9krp1SMuFR+a0cDx2rC+TbyZ9ULYiCvYo/LrswR+Q22jDeje2dVcvKNPE3Jum3
 jfmw==
X-Gm-Message-State: AOAM532vqZHGJgI+ARrAPuBFwEIIbOYiDmOUNlVnS8sERK0KYY4AZ/so
 PTDK2NIIamBLTzTBSkJ/UHqzcmJ5Zdg0YmqD
X-Google-Smtp-Source: ABdhPJxMlHpjWS0SulDJ6s+ciG4icei4dr6Xqjg815QsDmVCoJLzvCGXG89ebz4XatZjLaBdvYNUnQ==
X-Received: by 2002:a05:6402:34d2:b0:423:e6c4:3e9 with SMTP id
 w18-20020a05640234d200b00423e6c403e9mr31451583edc.372.1651071007653; 
 Wed, 27 Apr 2022 07:50:07 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 m17-20020a1709066d1100b006f39b1d3addsm3963081ejr.196.2022.04.27.07.50.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 07:50:06 -0700 (PDT)
Date: Wed, 27 Apr 2022 16:50:04 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>
Subject: Re: [PATCH v4 10/15] drm/shmem-helper: Take reservation lock instead
 of drm_gem_shmem locks
Message-ID: <YmlYHNlcmNMfOeyy@phenom.ffwll.local>
Mail-Followup-To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Rob Clark <robdclark@gmail.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Dmitry Osipenko <digetx@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
References: <20220417223707.157113-1-dmitry.osipenko@collabora.com>
 <20220417223707.157113-11-dmitry.osipenko@collabora.com>
 <248083d2-b8f2-a4d7-099d-70a7e7859c11@suse.de>
 <d9e7bec1-fffb-e0c4-8659-ef3ce2c31280@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d9e7bec1-fffb-e0c4-8659-ef3ce2c31280@collabora.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Dmitry Osipenko <digetx@gmail.com>,
 Steven Price <steven.price@arm.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 virtualization@lists.linux-foundation.org,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Emil Velikov <emil.l.velikov@gmail.com>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 18, 2022 at 10:18:54PM +0300, Dmitry Osipenko wrote:
> Hello,
> 
> On 4/18/22 21:38, Thomas Zimmermann wrote:
> > Hi
> > 
> > Am 18.04.22 um 00:37 schrieb Dmitry Osipenko:
> >> Replace drm_gem_shmem locks with the reservation lock to make GEM
> >> lockings more consistent.
> >>
> >> Previously drm_gem_shmem_vmap() and drm_gem_shmem_get_pages() were
> >> protected by separate locks, now it's the same lock, but it doesn't
> >> make any difference for the current GEM SHMEM users. Only Panfrost
> >> and Lima drivers use vmap() and they do it in the slow code paths,
> >> hence there was no practical justification for the usage of separate
> >> lock in the vmap().
> >>
> >> Suggested-by: Daniel Vetter <daniel@ffwll.ch>
> >> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> >> ---
> ...
> >>   @@ -310,7 +306,7 @@ static int drm_gem_shmem_vmap_locked(struct
> >> drm_gem_shmem_object *shmem,
> >>       } else {
> >>           pgprot_t prot = PAGE_KERNEL;
> >>   -        ret = drm_gem_shmem_get_pages(shmem);
> >> +        ret = drm_gem_shmem_get_pages_locked(shmem);
> >>           if (ret)
> >>               goto err_zero_use;
> >>   @@ -360,11 +356,11 @@ int drm_gem_shmem_vmap(struct
> >> drm_gem_shmem_object *shmem,
> >>   {
> >>       int ret;
> >>   -    ret = mutex_lock_interruptible(&shmem->vmap_lock);
> >> +    ret = dma_resv_lock_interruptible(shmem->base.resv, NULL);
> >>       if (ret)
> >>           return ret;
> >>       ret = drm_gem_shmem_vmap_locked(shmem, map);
> > 
> > Within drm_gem_shmem_vmap_locked(), there's a call to dma_buf_vmap() for
> > imported pages. If the exporter side also holds/acquires the same
> > reservation lock as our object, the whole thing can deadlock. We cannot
> > move dma_buf_vmap() out of the CS, because we still need to increment
> > the reference counter. I honestly don't know how to easily fix this
> > problem. There's a TODO item about replacing these locks at [1]. As
> > Daniel suggested this patch, we should talk to him about the issue.
> > 
> > Best regards
> > Thomas
> > 
> > [1]
> > https://www.kernel.org/doc/html/latest/gpu/todo.html#move-buffer-object-locking-to-dma-resv-lock
> 
> Indeed, good catch! Perhaps we could simply use a separate lock for the
> vmapping of the *imported* GEMs? The vmap_use_count is used only by
> vmap/vunmap, so it doesn't matter which lock is used by these functions
> in the case of imported GEMs since we only need to protect the
> vmap_use_count.

Apologies for the late reply, I'm flooded.

I discussed this with Daniel Stone last week in a chat, roughly what we
need to do is:

1. Pick a function from shmem helpers.

2. Go through all drivers that call this, and make sure that we acquire
dma_resv_lock in the top level driver entry point for this.

3. Once all driver code paths are converted, add a dma_resv_assert_held()
call to that function to make sure you have it all correctly.

4. Repeate 1-3 until all shmem helper functions are converted over.

5. Ditch the 3 different shmem helper locks.

The trouble is that I forgot that vmap is a thing, so that needs more
work. I think there's two approaches here:
- Do the vmap at import time. This is the trick we used to untangle the
  dma_resv_lock issues around dma_buf_attachment_map()
- Change the dma_buf_vmap rules that callers must hold the dma_resv_lock.
- Maybe also do what you suggest and keep a separate lock for this, but
  the fundamental issue is that this doesn't really work - if you share
  buffers both ways with two drivers using shmem helpers, then the
  ordering of this vmap_count_mutex vs dma_resv_lock is inconsistent and
  you can get some nice deadlocks. So not a great approach (and also the
  reason why we really need to get everyone to move towards dma_resv_lock
  as _the_ buffer object lock, since otherwise we'll never get a
  consistent lock nesting hierarchy).

The trouble here is that trying to be clever and doing the conversion just
in shmem helpers wont work, because there's a lot of cases where the
drivers are all kinds of inconsistent with their locking.

Adding Daniel S, also maybe for questions it'd be fastest to chat on irc?
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
