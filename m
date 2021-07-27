Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF523D740A
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 13:09:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D6F26E1F3;
	Tue, 27 Jul 2021 11:09:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFC676E0F7
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 11:09:38 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 a5-20020a05683012c5b029036edcf8f9a6so13091289otq.3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 04:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=toEhJU+DBnuXNuC/VzAQiuiOBPJGpanC4ZtXqo4rgcM=;
 b=T3ZjYLBEJHvCyFh3G3Q7kzzhyZl851+30p3BHtc/Psx9QocC5034u/BjICq3LIHL3c
 mqybI1qjeyayJqn1tSVomGiXQFzU+B6Fdz8n3wzIZ8Jajl3q62qJwt3fL7zZ3qT2a1Bb
 ZCXdBxFJ2XIQYAKyCax7sW7u7jmdQTRD5cSM0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=toEhJU+DBnuXNuC/VzAQiuiOBPJGpanC4ZtXqo4rgcM=;
 b=qO6fpACn3NikPR52V9gSYb7lGGBCm2upUE6BZ+mbIROZDYBmKPpm4/ifFyFLgVvwIi
 BeedYFFbNIgtTRRZAG/2AzvhnmiuvQ5tozFNrMa/uTlOBPlgdwYVy4EYIdrnaqHR1d9e
 tNK9X4JVga8QmKs02NYCTmpf0UUuBGYhDVoRD3y9j8DthAeXlbwCQc7hFgP67IjQ92v7
 LyHG0OA3F28meZtFkenkAGpC0pTNz1USdZC4rXcj0mj6U/Bkri4nIMQlf6BYOhq8sKFC
 Y/EhHkVr8aU+ZfYTB8/mm873rM3nq6UtnLUlOvk+h8NfUlyMfz4rx0An5EGqTJ7i91Pd
 gWrA==
X-Gm-Message-State: AOAM532phUoF5J4wWmcNPEXfPIzKgpXfMzQuEDutDMx1Ohu3/81tFDpX
 PfpYgoJv244OQXMyS8M4I698Vzg1ZS4hzg+dUPsv73hvQfw=
X-Google-Smtp-Source: ABdhPJyzU0vZYJAw5c3L/snDmwAuOs0LRxiLHhz+I4RrtqhZBCHAzwTeLL7a9d605aObjgTmHAQnpPT65r1SZTDXlcQ=
X-Received: by 2002:a05:6830:2802:: with SMTP id
 w2mr14709176otu.303.1627384177818; 
 Tue, 27 Jul 2021 04:09:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210712175352.802687-1-daniel.vetter@ffwll.ch>
 <20210712175352.802687-4-daniel.vetter@ffwll.ch>
In-Reply-To: <20210712175352.802687-4-daniel.vetter@ffwll.ch>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 27 Jul 2021 13:09:26 +0200
Message-ID: <CAKMK7uG8bMuDP=7-z9nZ38WgMdbeUk96eNx3buTCiaKatYOJxw@mail.gmail.com>
Subject: Re: [PATCH v4 03/18] drm/sched: Add dependency tracking
To: DRI Development <dri-devel@lists.freedesktop.org>,
 Melissa Wen <melissa.srw@gmail.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>,
 Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Jack Zhang <Jack.Zhang1@amd.com>, David Airlie <airlied@linux.ie>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Luben Tuikov <luben.tuikov@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Steven Price <steven.price@arm.com>,
 Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Nirmoy Das <nirmoy.aiemd@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Adding a few more people to this bikeshed.

On Mon, Jul 12, 2021 at 10:02 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:

> @@ -349,6 +367,13 @@ int drm_sched_job_init(struct drm_sched_job *job,
>                        struct drm_sched_entity *entity,
>                        void *owner);
>  void drm_sched_job_arm(struct drm_sched_job *job);
> +int drm_sched_job_await_fence(struct drm_sched_job *job,
> +                             struct dma_fence *fence);
> +int drm_sched_job_await_implicit(struct drm_sched_job *job,
> +                                struct drm_gem_object *obj,
> +                                bool write);
> +
> +

I'm still waiting on the paint delivery for these two functions so I
can finish this shed.

Thanks, Daniel

>  void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
>                                     struct drm_gpu_scheduler **sched_list,
>                                     unsigned int num_sched_list);
> --
> 2.32.0
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
