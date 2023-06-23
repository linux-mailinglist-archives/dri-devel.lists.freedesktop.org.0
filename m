Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3291873C8E3
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jun 2023 10:16:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8698010E10B;
	Sat, 24 Jun 2023 08:16:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69ED710E084
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 13:33:34 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1b52418c25bso936975ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 06:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1687527214; x=1690119214;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ACoox6lHywQa9wO0MGPPVAOCZzDjfudqnGd2G0lw0os=;
 b=fa1yyl1XuChlZVeuHnAOkkfkq2hZyLQlU7Qx7FIzebWZlha3QE3pftRSrj+DJxI7Rv
 UhXvlkHo3Vcdolq+ME68HhnTz0k5XIGoqWorIAsqCzinXOgMm/YBV2p6rPjxxhB9xA+p
 CKbtixmq104K/XaeP7c/FRQEzfBhOolOJ13XEqLz2Vl/3W9UCdfjI5o3p38fxwPZQ7jM
 f2Nv1spQskpxwNqmrAc0KV9Etlyt/W0NlU64HVCq3FTgTv7qi6xblmtVtEFrypVRLxTd
 swjUrDnQOk53j5e/5rffnzu2n8zAvNVx/4KpVQ/7vpT1VvkShyKZT45f4U4Mq3kIEUCc
 sA+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687527214; x=1690119214;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ACoox6lHywQa9wO0MGPPVAOCZzDjfudqnGd2G0lw0os=;
 b=A1CxWj05d5i4fcrYTI83wI8Buhsse6BEAspZw2G1ER3mFmk6SV0uY4TwoYD++HPPws
 XJPW8jzsjtRkDPZU57W5yY403F+nTsa0zbGEPhNi/2TiWembaTAq483jNNfRfbl2rFYL
 /Fz8ujwYMMdJ3Pr92kjFjeAXElJi6//YPmhWQzerEeW1fmTnaoB2wWOnk6RP/pszgiU6
 pJVyiBcGO24o5D7W/mWCvYS/X7y4wK+LzZxRG/U41E0fREQLRjK7oB9Tb/PVSTKoFBUS
 PbyuE/h7zOQloWZ0VsCEnY569qOrhHL2jYCiy1DkoFEZo8Z7bad11h5dXhIywroxbrcg
 clvw==
X-Gm-Message-State: AC+VfDwaIPsWvQuTvTqLsHh+RqVId4bN2TvOVAKTq4wavJIuY9LTKK3N
 zxVJjioy59xDi2wzErbMhjCtBQ==
X-Google-Smtp-Source: ACHHUZ7fC8cfi9SbpxWbw1P19vY2WFeiY5bxjWE/lWxj83YOdeMLdFfAi7QBoo42W5+SZOFqK06Ryw==
X-Received: by 2002:a17:902:c945:b0:1ae:3ff8:7fa7 with SMTP id
 i5-20020a170902c94500b001ae3ff87fa7mr26069073pla.4.1687527213878; 
 Fri, 23 Jun 2023 06:33:33 -0700 (PDT)
Received: from [10.4.168.167] ([139.177.225.254])
 by smtp.gmail.com with ESMTPSA id
 kg14-20020a170903060e00b001b6a27dff99sm4341406plb.159.2023.06.23.06.33.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Jun 2023 06:33:33 -0700 (PDT)
Message-ID: <43a07dbe-5049-8596-da58-51e0a0d6243c@bytedance.com>
Date: Fri, 23 Jun 2023 21:33:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH 05/29] drm/panfrost: dynamically allocate the drm-panfrost
 shrinker
Content-Language: en-US
To: Steven Price <steven.price@arm.com>
References: <20230622085335.77010-1-zhengqi.arch@bytedance.com>
 <20230622085335.77010-6-zhengqi.arch@bytedance.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <20230622085335.77010-6-zhengqi.arch@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sat, 24 Jun 2023 08:15:48 +0000
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
Cc: djwong@kernel.org, roman.gushchin@linux.dev, david@fromorbit.com,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, dm-devel@redhat.com, linux-ext4@vger.kernel.org,
 paulmck@kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, brauner@kernel.org,
 linux-raid@vger.kernel.org, linux-bcache@vger.kernel.org, vbabka@suse.cz,
 linux-nfs@vger.kernel.org, tytso@mit.edu, linux-kernel@vger.kernel.org,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 akpm@linux-foundation.org, linux-btrfs@vger.kernel.org, tkhai@ya.ru
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Steven,

The email you replied to was the failed version (due to the error
below), so I copied your reply and replied to you on this successful
version.

(4.7.1 Error: too many recipients from 49.7.199.173)

On 2023/6/23 18:01, Steven Price wrote:
 > On 22/06/2023 09:39, Qi Zheng wrote:
 >> From: Qi Zheng <zhengqi.arch@bytedance.com>
 >>
 >> In preparation for implementing lockless slab shrink,
 >> we need to dynamically allocate the drm-panfrost shrinker,
 >> so that it can be freed asynchronously using kfree_rcu().
 >> Then it doesn't need to wait for RCU read-side critical
 >> section when releasing the struct panfrost_device.
 >>
 >> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
 >> ---
 >>   drivers/gpu/drm/panfrost/panfrost_device.h    |  2 +-
 >>   .../gpu/drm/panfrost/panfrost_gem_shrinker.c  | 24 ++++++++++---------
 >>   2 files changed, 14 insertions(+), 12 deletions(-)
 >>
 >> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h 
b/drivers/gpu/drm/panfrost/panfrost_device.h
 >> index b0126b9fbadc..e667e5689353 100644
 >> --- a/drivers/gpu/drm/panfrost/panfrost_device.h
 >> +++ b/drivers/gpu/drm/panfrost/panfrost_device.h
 >> @@ -118,7 +118,7 @@ struct panfrost_device {
 >>
 >>   	struct mutex shrinker_lock;
 >>   	struct list_head shrinker_list;
 >> -	struct shrinker shrinker;
 >> +	struct shrinker *shrinker;
 >>
 >>   	struct panfrost_devfreq pfdevfreq;
 >>   };
 >> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c 
b/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
 >> index bf0170782f25..2a5513eb9e1f 100644
 >> --- a/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
 >> +++ b/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
 >> @@ -18,8 +18,7 @@
 >>   static unsigned long
 >>   panfrost_gem_shrinker_count(struct shrinker *shrinker, struct 
shrink_control *sc)
 >>   {
 >> -	struct panfrost_device *pfdev =
 >> -		container_of(shrinker, struct panfrost_device, shrinker);
 >> +	struct panfrost_device *pfdev = shrinker->private_data;
 >>   	struct drm_gem_shmem_object *shmem;
 >>   	unsigned long count = 0;
 >>
 >> @@ -65,8 +64,7 @@ static bool panfrost_gem_purge(struct 
drm_gem_object *obj)
 >>   static unsigned long
 >>   panfrost_gem_shrinker_scan(struct shrinker *shrinker, struct 
shrink_control *sc)
 >>   {
 >> -	struct panfrost_device *pfdev =
 >> -		container_of(shrinker, struct panfrost_device, shrinker);
 >> +	struct panfrost_device *pfdev = shrinker->private_data;
 >>   	struct drm_gem_shmem_object *shmem, *tmp;
 >>   	unsigned long freed = 0;
 >>
 >> @@ -100,10 +98,15 @@ panfrost_gem_shrinker_scan(struct shrinker 
*shrinker, struct shrink_control *sc)
 >>   void panfrost_gem_shrinker_init(struct drm_device *dev)
 >>   {
 >>   	struct panfrost_device *pfdev = dev->dev_private;
 >> -	pfdev->shrinker.count_objects = panfrost_gem_shrinker_count;
 >> -	pfdev->shrinker.scan_objects = panfrost_gem_shrinker_scan;
 >> -	pfdev->shrinker.seeks = DEFAULT_SEEKS;
 >> -	WARN_ON(register_shrinker(&pfdev->shrinker, "drm-panfrost"));
 >> +
 >> +	pfdev->shrinker = shrinker_alloc_and_init(panfrost_gem_shrinker_count,
 >> +						  panfrost_gem_shrinker_scan, 0,
 >> +						  DEFAULT_SEEKS, 0, pfdev);
 >> +	if (pfdev->shrinker &&
 >> +	    register_shrinker(pfdev->shrinker, "drm-panfrost")) {
 >> +		shrinker_free(pfdev->shrinker);
 >> +		WARN_ON(1);
 >> +	}
 >
 > So we didn't have good error handling here before, but this is
 > significantly worse. Previously if register_shrinker() failed then the
 > driver could safely continue without a shrinker - it would waste memory
 > but still function.
 >
 > However we now have two failure conditions:
 >   * shrinker_alloc_init() returns NULL. No warning and NULL deferences
 >     will happen later.
 >
 >   * register_shrinker() fails, shrinker_free() will free pdev->shrinker
 >     we get a warning, but followed by a use-after-free later.
 >
 > I think we need to modify panfrost_gem_shrinker_init() to be able to
 > return an error, so a change something like the below (untested) before
 > your change.

Indeed. I will fix it in the v2.

Thanks,
Qi

 >
 > Steve
 >
 > ----8<---
 > diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c
 > b/drivers/gpu/drm/panfrost/panfrost_drv.c
 > index bbada731bbbd..f705bbdea360 100644
 > --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
 > +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
 > @@ -598,10 +598,14 @@ static int panfrost_probe(struct platform_device
 > *pdev)
 >   	if (err < 0)
 >   		goto err_out1;
 >
 > -	panfrost_gem_shrinker_init(ddev);
 > +	err = panfrost_gem_shrinker_init(ddev);
 > +	if (err)
 > +		goto err_out2;
 >
 >   	return 0;
 >
 > +err_out2:
 > +	drm_dev_unregister(ddev);
 >   err_out1:
 >   	pm_runtime_disable(pfdev->dev);
 >   	panfrost_device_fini(pfdev);
 > diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.h
 > b/drivers/gpu/drm/panfrost/panfrost_gem.h
 > index ad2877eeeccd..863d2ec8d4f0 100644
 > --- a/drivers/gpu/drm/panfrost/panfrost_gem.h
 > +++ b/drivers/gpu/drm/panfrost/panfrost_gem.h
 > @@ -81,7 +81,7 @@ panfrost_gem_mapping_get(struct panfrost_gem_object 
*bo,
 >   void panfrost_gem_mapping_put(struct panfrost_gem_mapping *mapping);
 >   void panfrost_gem_teardown_mappings_locked(struct 
panfrost_gem_object *bo);
 >
 > -void panfrost_gem_shrinker_init(struct drm_device *dev);
 > +int panfrost_gem_shrinker_init(struct drm_device *dev);
 >   void panfrost_gem_shrinker_cleanup(struct drm_device *dev);
 >
 >   #endif /* __PANFROST_GEM_H__ */
 > diff --git a/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
 > b/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
 > index bf0170782f25..90265b37636f 100644
 > --- a/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
 > +++ b/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
 > @@ -97,13 +97,17 @@ panfrost_gem_shrinker_scan(struct shrinker
 > *shrinker, struct shrink_control *sc)
 >    *
 >    * This function registers and sets up the panfrost shrinker.
 >    */
 > -void panfrost_gem_shrinker_init(struct drm_device *dev)
 > +int panfrost_gem_shrinker_init(struct drm_device *dev)
 >   {
 >   	struct panfrost_device *pfdev = dev->dev_private;
 > +	int ret;
 > +
 >   	pfdev->shrinker.count_objects = panfrost_gem_shrinker_count;
 >   	pfdev->shrinker.scan_objects = panfrost_gem_shrinker_scan;
 >   	pfdev->shrinker.seeks = DEFAULT_SEEKS;
 > -	WARN_ON(register_shrinker(&pfdev->shrinker, "drm-panfrost"));
 > +	ret = register_shrinker(&pfdev->shrinker, "drm-panfrost");
 > +
 > +	return ret;
 >   }
 >
 >   /**
 >

