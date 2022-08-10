Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 731C758EB7C
	for <lists+dri-devel@lfdr.de>; Wed, 10 Aug 2022 13:47:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B6C8B3D39;
	Wed, 10 Aug 2022 11:47:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2BBEB3CA8
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 11:47:15 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id a11so7666658wmq.3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 04:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc;
 bh=BaeZbBum+4I2jOGaqSAi7IFGsiLy5fQf1iTIfmWWOdI=;
 b=BZC3Ko+eQnZVoFMw/NtIXSIKWwBGZ5JnUirPvLbP6MeZ9lAjcs7/NqIUBAAVmnmfsc
 yjF8l5SAxV6c+aoMIfXu59H8J8pu0tA1mzIb5wnr2Jep7gRbo+no+ZileVc8DHsw3Cca
 WqOuT1Cl+srXtRh0H8IL02PLB6XJFXq2TL9WY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc;
 bh=BaeZbBum+4I2jOGaqSAi7IFGsiLy5fQf1iTIfmWWOdI=;
 b=iLn+SpcGRqnPxRId5PXkIY4RxKx/+XkzhkDXxTd9AwaZtSQtCNQoWgDKl1qwdGCYGo
 O80rzkRvjXYT0ZlTSPJDOeswTG6i0Jv4rKjXbvUR1ogalWBHGymCktu/z5bvycrMVAKS
 lYmG2pFgLBeI9i7HpypLC8a5Dn9VrJY1tb6wftf+bjSF0RE4sC6o+5RpD8GcJ+ev3qDr
 lNgZfv/wR5DRHcLsFmA9RS6Tjd4jOQyGgL/oO96FgtMSrDKKZhm60zPdoUwH3Jd8vDNy
 8Vhdvr97WXsdOTxWyn/Pxbn4ZigU2gFV0RJcv5/EvGTCljCXpSRFUrybJu7G8vQPiPpR
 mAqg==
X-Gm-Message-State: ACgBeo2WzEGqRIlAI8OxtxX7rgEvXhcOuKMUnulW60buoJDwL/ZFc8Eb
 Tohjjgj0yqwq41YD6jFirJsPKQ==
X-Google-Smtp-Source: AA6agR74SoyJ7WCFqoZzbBzJESlrpKgFu1tQjTIechrYDCzQN1w2VaiNKABFBaMCcdYBj6DRC+PfJA==
X-Received: by 2002:a05:600c:4e86:b0:3a3:2edc:bcb4 with SMTP id
 f6-20020a05600c4e8600b003a32edcbcb4mr2207476wmq.85.1660132034314; 
 Wed, 10 Aug 2022 04:47:14 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 d2-20020a5d6dc2000000b002235eb9d200sm5647242wrz.10.2022.08.10.04.47.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 04:47:13 -0700 (PDT)
Date: Wed, 10 Aug 2022 13:47:11 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v8 2/2] drm/gem: Don't map imported GEMs
Message-ID: <YvOav/vF2awVWIu0@phenom.ffwll.local>
Mail-Followup-To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Rob Clark <robdclark@gmail.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas_os@shipmail.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
 kernel@collabora.com
References: <20220701090240.1896131-1-dmitry.osipenko@collabora.com>
 <20220701090240.1896131-3-dmitry.osipenko@collabora.com>
 <2bb95e80-b60a-36c0-76c8-a06833032c77@amd.com>
 <CAF6AEGtqPeF1DjmBKgzWK39Yi81YiNjTjDNn85TKx7uwicFTSA@mail.gmail.com>
 <2a646ce4-c2ec-3b11-77a0-cc720afd6fe1@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2a646ce4-c2ec-3b11-77a0-cc720afd6fe1@collabora.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>, kernel@collabora.com,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Emil Velikov <emil.l.velikov@gmail.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas_os@shipmail.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, linux-tegra@vger.kernel.org,
 Dmitry Osipenko <digetx@gmail.com>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 06, 2022 at 10:02:07AM +0300, Dmitry Osipenko wrote:
> On 7/6/22 00:48, Rob Clark wrote:
> > On Tue, Jul 5, 2022 at 4:51 AM Christian König <christian.koenig@amd.com> wrote:
> >>
> >> Am 01.07.22 um 11:02 schrieb Dmitry Osipenko:
> >>> Drivers that use drm_gem_mmap() and drm_gem_mmap_obj() helpers don't
> >>> handle imported dma-bufs properly, which results in mapping of something
> >>> else than the imported dma-buf. On NVIDIA Tegra we get a hard lockup when
> >>> userspace writes to the memory mapping of a dma-buf that was imported into
> >>> Tegra's DRM GEM.
> >>>
> >>> Majority of DRM drivers prohibit mapping of the imported GEM objects.
> >>> Mapping of imported GEMs require special care from userspace since it
> >>> should sync dma-buf because mapping coherency of the exporter device may
> >>> not match the DRM device. Let's prohibit the mapping for all DRM drivers
> >>> for consistency.
> >>>
> >>> Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> >>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> >>
> >> I'm pretty sure that this is the right approach, but it's certainly more
> >> than possible that somebody abused this already.
> > 
> > I suspect that this is abused if you run deqp cts on android.. ie. all
> > winsys buffers are dma-buf imports from gralloc.  And then when you
> > hit readpix...
> > 
> > You might only hit this in scenarios with separate gpu and display (or
> > dGPU+iGPU) because self-imports are handled differently in
> > drm_gem_prime_import_dev().. and maybe not in cases where you end up
> > with a blit from tiled/compressed to linear.. maybe that narrows the
> > scope enough to just fix it in userspace?
> 
> Given that that only drivers which use DRM-SHMEM potentially could've
> map imported dma-bufs (Panfrost, Lima) and they already don't allow to
> do that, I think we're good.

So can I have an ack from Rob here or are there still questions that this
might go boom?

Dmitry, since you have a bunch of patches merged now I think would also be
good to get commit rights so you can drive this more yourself. I've asked
Daniel Stone to help you out with getting that.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
