Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62773699417
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 13:15:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4B3710E128;
	Thu, 16 Feb 2023 12:15:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A78F310E128
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 12:15:40 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id m14so1611424wrg.13
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 04:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=piaqzgCKFZLQmY10k4IjC7MluutMq0LDizDNTJemOVE=;
 b=ZwmW+/tsxiqhy4Fe8h8o+D+0Y3rKgPhqnPVd3h2SXXjq9GFWsGM/IYJuSGdI/VS12v
 ONNkkDZVd0AjsYVwEKCHys6pJs4ZVXw9sDzzrSQZ72h1ZFRYSu92lypNMVcYe8A7bQeU
 Emw+iqP0l5YYH99k1kkz89QUaXRVbiZ7JWnEk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=piaqzgCKFZLQmY10k4IjC7MluutMq0LDizDNTJemOVE=;
 b=RxyyRK7/K1cHL8Ib+GDdc30AHAlqQ3xpZR2MNRc/bTRJG/gjijiAGUzOZdXkXDzMBE
 1OR/JgflkqMvhMxoFzI4sGp+UT0Oi/JGM2f3qRalCHhwvPiDApoYOFiSaF+2Bsd974mp
 3puES9h6caiSMmmIc/kh76N2zLwx4AkAP57Y0aB6uzqwptQPaxg7jPpmzF3U60uNzk6t
 cI43hz4gkQRa8UhkWaN58PPKJSP3DRFt3VSdn+WlM6fEuZbWd/8C81QM6FN4OUdCl4o6
 eRJLUG82j5JYjXQaS4DIu9FIZIOxaIF0UxYOwm8aZvMx9YdMnCJkjOV/zZiConev/V8K
 XNxQ==
X-Gm-Message-State: AO0yUKWFj1T4PmKzW7aco6tVCUe05k2izEAvGOEF49v57CQ1EqlM45DK
 LlgZ3c69z1EewlSobyM25cZR4w==
X-Google-Smtp-Source: AK7set8htScoYo9KcDutSph1npWSqUrZBvhCgkZbtOlJws9UnAqhqfODu6C0HWh4XJFXcCSIORzQUA==
X-Received: by 2002:a5d:46d1:0:b0:2bf:de9c:4595 with SMTP id
 g17-20020a5d46d1000000b002bfde9c4595mr3616218wrs.5.1676549739053; 
 Thu, 16 Feb 2023 04:15:39 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 u11-20020a5d514b000000b002425be3c9e2sm1364716wrt.60.2023.02.16.04.15.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 04:15:38 -0800 (PST)
Date: Thu, 16 Feb 2023 13:15:30 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v10 00/11] Add generic memory shrinker to VirtIO-GPU and
 Panfrost DRM drivers
Message-ID: <Y+4eYqdH1Xw2OYX5@phenom.ffwll.local>
Mail-Followup-To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com, virtualization@lists.linux-foundation.org,
 David Airlie <airlied@gmail.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Qiang Yu <yuq825@gmail.com>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Rob Herring <robh@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230108210445.3948344-1-dmitry.osipenko@collabora.com>
 <e5e9e8dd-a5b6-cfd2-44d6-4d5aa768e56c@collabora.com>
 <20230127081339.yovxofpboc4gfdgo@sirius.home.kraxel.org>
 <0081b2c3-56c9-3ed8-b419-5ce8a151999e@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0081b2c3-56c9-3ed8-b419-5ce8a151999e@collabora.com>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Gerd Hoffmann <kraxel@redhat.com>, kernel@collabora.com,
 Sumit Semwal <sumit.semwal@linaro.org>, Steven Price <steven.price@arm.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Sean Paul <sean@poorly.run>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-kernel@vger.kernel.org,
 Qiang Yu <yuq825@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 30, 2023 at 03:02:10PM +0300, Dmitry Osipenko wrote:
> On 1/27/23 11:13, Gerd Hoffmann wrote:
> > On Thu, Jan 26, 2023 at 01:55:09AM +0300, Dmitry Osipenko wrote:
> >> Hello Thomas and Gerd,
> >>
> >> On 1/9/23 00:04, Dmitry Osipenko wrote:
> >>> This series:
> >>>
> >>>   1. Makes minor fixes for drm_gem_lru and Panfrost
> >>>   2. Brings refactoring for older code
> >>>   3. Adds common drm-shmem memory shrinker
> >>>   4. Enables shrinker for VirtIO-GPU driver
> >>>   5. Switches Panfrost driver to the common shrinker
> >>>
> >>> Changelog:
> >>>
> >>> v10:- Rebased on a recent linux-next.
> >>>
> >>>     - Added Rob's ack to MSM "Prevent blocking within shrinker loop" patch.
> >>>
> >>>     - Added Steven's ack/r-b/t-b for the Panfrost patches.
> >>>
> >>>     - Fixed missing export of the new drm_gem_object_evict() function.
> >>>
> >>>     - Added fixes tags to the first two patches that are making minor fixes,
> >>>       for consistency.
> >>
> >> Do you have comments on this version? Otherwise ack will be appreciated.
> >> Thanks in advance!
> > 
> > Don't feel like signing off on the locking changes, I'm not that
> > familiar with the drm locking rules.  So someone else looking at them
> > would be good.  Otherwise the series and specifically the virtio changes
> > look good to me.
> > 
> > Acked-by: Gerd Hoffmann <kraxel@redhat.com>
> 
> Thomas was looking at the the DRM core changes. I expect he'll ack them.
> 
> Thank you for reviewing the virtio patches!

I think best-case would be an ack from msm people that this looks good
(even better a conversion for msm to start using this).

Otherwise I think the locking looks reasonable, I think the tricky bits
have been moving the dma-buf rules, but if you want I can try to take
another in-depth look. But would need to be in 2 weeks since I'm going on
vacations, pls ping me on irc if I'm needed.

Otherwise would be great if we can land this soon, so that it can soak the
entire linux-next cycle to catch any driver specific issues.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
