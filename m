Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE029311FA
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2024 12:08:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EF6E10E22B;
	Mon, 15 Jul 2024 10:08:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="fxwmj2Ev";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3654310E239
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 10:08:53 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4266ea4e4bdso3495925e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 03:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1721038132; x=1721642932; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=CR2Ia0FiVFedpG588AkdnSWlCXZ9egJLBsCqhnpjuT8=;
 b=fxwmj2EvJM4HvJioMcyTDvCYkisTmfxdvJlW5DOu+6yAdXNgAvblh+cOAp76PHDllY
 HCSpZlnFjpQL/M8w+bEkXX/Cz6/7VXaYSwCrPKzCRFNKYMnNb9BacKKgJ2Q+6TP9GEum
 5tlVOu2POKME2M8Zdu0Gdb8lp3g7c9sJekBrU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721038132; x=1721642932;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CR2Ia0FiVFedpG588AkdnSWlCXZ9egJLBsCqhnpjuT8=;
 b=IwSYs0AOVPvikqoeB4pcnwBHkFAdyGaesjCXyGVa3nVKWq/VCTEuYyXeppmMQkSHhl
 i1XnWnFcg/5iUaTCrCFJ/Yl5RlqLT8TDFb9sS/AFABkrNy0WmDam1aXZT8VndSBlhQad
 2Dl3t7dIL4v4FQw//5kMKLHf8FDf7I+k4m0WOEBYzsxkt5xPZFavQ6x7LdqXP2AtPmd9
 ysVBEac83rnm1d/749YXNHm5t57tAe1EXdm2K3jVmvATABMA8mbxeMZB8CscqIwpyDsU
 /XLMQcRVeT/ddZHHHfjNsoiHnkW66vEPwqNhrl3daYk+OQ3M+Pph1UYRBVQa37U3vFNn
 tTzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGOlcRuHg9VCVQ4PwLbivWsEktbr2J/q5yCJwIBM9zxD0TLact7PqzTzVyXl3wkeHP8ODAAPUbEBEXDXGwCpedky/35zBrvDfA65ipdOg9
X-Gm-Message-State: AOJu0YxU5IlNpGCjBdJtQfWBFQOGy9Bb5jMx1QlXP5RaUw91HKZusCcF
 TL4Xkcw46iaoNHRNC1hz2OJTPK/4SdbBIQPSo4AcRjBRnJrifu28JWMEJqPMSJM=
X-Google-Smtp-Source: AGHT+IHyT41V56P2D7gRVnHbsl6ebnID4kMa+VsHDxqWmcAkAFdIoHpQ9xgw+h4TlxD7k+VH6h7+vQ==
X-Received: by 2002:a05:600c:3b8c:b0:426:4920:2846 with SMTP id
 5b1f17b1804b1-4279834f1e5mr64390645e9.3.1721038132199; 
 Mon, 15 Jul 2024 03:08:52 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f23981fsm115958335e9.4.2024.07.15.03.08.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jul 2024 03:08:51 -0700 (PDT)
Date: Mon, 15 Jul 2024 12:08:49 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 1/2] drm: Add might_fault to drm_modeset_lock priming
Message-ID: <ZpT1MeLxz2yLtDxu@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, 
 DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20240710093120.732208-1-daniel.vetter@ffwll.ch>
 <03f7e2ad-fd5c-4da7-a14c-34c2c158c513@amd.com>
 <CAKMK7uFvCr2qcHun06LC-ON3GBqj8=mCpPGHuAOh9BEyr60fiQ@mail.gmail.com>
 <cf3ff1b9-2934-47bd-93c7-5ea55d10c82f@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cf3ff1b9-2934-47bd-93c7-5ea55d10c82f@amd.com>
X-Operating-System: Linux phenom 6.9.7-amd64 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 10, 2024 at 02:40:04PM +0200, Christian König wrote:
> Am 10.07.24 um 13:58 schrieb Daniel Vetter:
> > On Wed, 10 Jul 2024 at 13:39, Christian König <christian.koenig@amd.com> wrote:
> > > Am 10.07.24 um 11:31 schrieb Daniel Vetter:
> > > > We already teach lockdep that dma_resv nests within drm_modeset_lock,
> > > > but there's a lot more: All drm kms ioctl rely on being able to
> > > > put/get_user while holding modeset locks, so we really need a
> > > > might_fault in there too to complete the picture. Add it.
> > > Mhm, lockdep should be able to deduce that when there might be faults
> > > under the dma_resv lock there might also be faults under the
> > > drm_modeset_lock.
> > You're not allowed to take a fault under dma_resv, because drivers
> > might need to take that lock to handle faults. So unfortunately in our
> > combined lockdep priming, there really seems to be no chain yet that
> > teaches about faults possibly happening while holding
> > drm_modeset_lock.
> 
> Ah, of course! You are right, it was just the other way around.

Applied to drm-misc-next, thanks for your review.
-Sima

> 
> Thanks,
> Christian.
> 
> > -Sima
> > 
> > > > Motivated by a syzbot report that blew up on bcachefs doing an
> > > > unconditional console_lock way deep in the locking hierarchy, and
> > > > lockdep only noticing the depency loop in a drm ioctl instead of much
> > > > earlier. This annotation will make sure such issues have a much harder
> > > > time escaping.
> > > > 
> > > > References: https://lore.kernel.org/dri-devel/00000000000073db8b061cd43496@google.com/
> > > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > > Cc: Maxime Ripard <mripard@kernel.org>
> > > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > > > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > > > Cc: "Christian König" <christian.koenig@amd.com>
> > > > Cc: linux-media@vger.kernel.org
> > > > Cc: linaro-mm-sig@lists.linaro.org
> > > On the other hand pointing it out explicitly doesn't hurts us at all, so
> > > Reviewed-by: Christian König <christian.koenig@amd.com>.
> > > 
> > > Regards,
> > > Christian.
> > > 
> > > > ---
> > > >    drivers/gpu/drm/drm_mode_config.c | 2 ++
> > > >    1 file changed, 2 insertions(+)
> > > > 
> > > > diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
> > > > index 568972258222..37d2e0a4ef4b 100644
> > > > --- a/drivers/gpu/drm/drm_mode_config.c
> > > > +++ b/drivers/gpu/drm/drm_mode_config.c
> > > > @@ -456,6 +456,8 @@ int drmm_mode_config_init(struct drm_device *dev)
> > > >                if (ret == -EDEADLK)
> > > >                        ret = drm_modeset_backoff(&modeset_ctx);
> > > > 
> > > > +             might_fault();
> > > > +
> > > >                ww_acquire_init(&resv_ctx, &reservation_ww_class);
> > > >                ret = dma_resv_lock(&resv, &resv_ctx);
> > > >                if (ret == -EDEADLK)
> > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
