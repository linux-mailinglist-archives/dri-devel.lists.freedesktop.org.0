Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F347269D0A8
	for <lists+dri-devel@lfdr.de>; Mon, 20 Feb 2023 16:32:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 490E510E259;
	Mon, 20 Feb 2023 15:31:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5612410E223;
 Mon, 20 Feb 2023 15:31:57 +0000 (UTC)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-1720433ba75so2000977fac.5; 
 Mon, 20 Feb 2023 07:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=EnqvKbjcXR+shgyFqAn4kLOdtmvRNWegMnSy5waDRGg=;
 b=UoFmKZzcmBX+MDVNTTEYkbv8JaCbBojVOgJhy4HB9tIUcyUIHFpju4oXzuy+3GaTIT
 zm6n5GJPaAUsUnpqPEYz2nrvuKBMoR+aYPFdfdbyxQadGjW8IK70RwzGnlDVqww6nQN1
 K47TKQSb/gCIGnfb7WulWM04aKdeo28mpEbeRz+/YAfw390WYZ7t8ZopReSpncn2qSC1
 Lg9Qg+KpEgTiA1U8LjVtbvbnMDmRKCKhVu7YOAzQd6DH1Bd6YEX4QLKN3n/JWj2cNSRI
 L60Dg1JVA2B5puf9W/lNqZBCuk+Fw0ymeZplAyuXe7+N4JY8sk7t/NFn0pC2WArk5bIi
 3hjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EnqvKbjcXR+shgyFqAn4kLOdtmvRNWegMnSy5waDRGg=;
 b=enMlve15BGi32whKrmO3SQiJ+9JVtPgnDc82GdWo/lWUTb7ue0j/+tuDdkmflXgdli
 ApG2MnKF2vkqHj8vFqa5cIT8u0kNw2TbTe7epbIOfc56GDzbFnb3hQE42Ce7VFuoBuEV
 RI607LbBIvT+XuaVMcCTDQmTKNbFa/uq1uDFuf1gt23Udl40qBII4qafiYCdo1S5x2gm
 hnCpgiptlNWUzIUG12Qw9QNLdhVLQ72rkSQ1K6pebt5AMEYRR9SAqB3cI7zYyO9tOBKT
 Vmyg4iEJkLQpvBGcDDqYO+h32994+JM+GFimG0KfjB2rZt9xrrc6CLshS5tnNQ209Inn
 or4A==
X-Gm-Message-State: AO0yUKUlQ5BvIpEpxXpNtVbN3jo13//dYyPuOjn8bh4DJXNvNK8/Io6m
 ZOUrmRlOi6praSDJ9lZrR3NYqhW/azMr6bfRb18=
X-Google-Smtp-Source: AK7set+7FnMD2t07MuqDGy/KTxF9WiYX/rSVCcOrL9sKyQtn1QeIDHJ1RcRQxtfrjpj6ga9vEBrqF6S7WEvxyr5Oasc=
X-Received: by 2002:a05:6870:32d4:b0:16e:5e5a:49da with SMTP id
 r20-20020a05687032d400b0016e5e5a49damr1175495oac.58.1676907116217; Mon, 20
 Feb 2023 07:31:56 -0800 (PST)
MIME-Version: 1.0
References: <20230216105921.624960-1-tvrtko.ursulin@linux.intel.com>
 <20230216105921.624960-7-tvrtko.ursulin@linux.intel.com>
 <CAF6AEGuXNCXL5cNy4nS8sd6iVj7E62C93o+HZLVkeqpOcWGdKw@mail.gmail.com>
 <d5914234-4f9d-4495-46b8-29322e758122@linux.intel.com>
In-Reply-To: <d5914234-4f9d-4495-46b8-29322e758122@linux.intel.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 20 Feb 2023 07:31:45 -0800
Message-ID: <CAF6AEGsNLFoO1ZGE5gTFUi52kg4WXkZEi8GciSe=pqDSALOzvg@mail.gmail.com>
Subject: Re: [Intel-gfx] [RFC 6/9] drm/syncobj: Mark syncobj waits as external
 waiters
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
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
Cc: Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 20, 2023 at 5:19 AM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
>
> On 18/02/2023 19:56, Rob Clark wrote:
> > On Thu, Feb 16, 2023 at 2:59 AM Tvrtko Ursulin
> > <tvrtko.ursulin@linux.intel.com> wrote:
> >>
> >> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> >>
> >> Use the previously added dma-fence tracking of explicit waiters.
> >>
> >> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> >> ---
> >>   drivers/gpu/drm/drm_syncobj.c | 6 +++---
> >>   1 file changed, 3 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
> >> index 0c2be8360525..776b90774a64 100644
> >> --- a/drivers/gpu/drm/drm_syncobj.c
> >> +++ b/drivers/gpu/drm/drm_syncobj.c
> >> @@ -1065,9 +1065,9 @@ static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
> >>                          if ((flags & DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE) ||
> >>                              dma_fence_is_signaled(fence) ||
> >>                              (!entries[i].fence_cb.func &&
> >> -                            dma_fence_add_callback(fence,
> >> -                                                   &entries[i].fence_cb,
> >> -                                                   syncobj_wait_fence_func))) {
> >> +                            dma_fence_add_wait_callback(fence,
> >> +                                                        &entries[i].fence_cb,
> >> +                                                        syncobj_wait_fence_func))) {
> >
> > I think this isn't really what you want if count > 1, because you
> > wouldn't be notifying the fence signaler of fence n+1 until the wait
> > on fence n completed
>
> Are you sure? After some staring all I can see is that all callbacks are
> added before the first sleep.

Ahh, yes, you are right

BR,
-R
