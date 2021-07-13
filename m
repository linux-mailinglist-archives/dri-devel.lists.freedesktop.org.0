Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E82F3C754B
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 18:51:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B56E899DC;
	Tue, 13 Jul 2021 16:51:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C65D899DC;
 Tue, 13 Jul 2021 16:51:07 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id f9so25703748wrq.11;
 Tue, 13 Jul 2021 09:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wFFHLp9waseJ2G/puEpfRVsnB7l3dk1EhVjDPNKxo0w=;
 b=oRYEosIl/+VXXp8xPnkDtbDs6XxcvWe9cSe3IdKQ0xuwtARZBPMqav6ImsdGRAiaIH
 oDrAnnzxRjt1df8F216Cf6hBDj25WwmBu5m9dDIEBS3IAbX/oInQhQ3mxZgkst1YUqmU
 WICQ5MgaZnp2FKMK59mPBLB0PkANyHR9mZXwmgYI2TtDtcl4zLEYljN0/k3nq6Fowi5P
 zsdL8pZc6ZYHyOhoBKTVEqSiKDC1oYIob/wyvfYlUeCWQFbs+FI8Obh3zfDoXyt9/8wD
 V3nJYlz/q1+xd3QpIFZJjxPvek2gaO0B4yTJHhfz/iWSdSZK1Yee2R4/gUJD0o8jWmA5
 qtFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wFFHLp9waseJ2G/puEpfRVsnB7l3dk1EhVjDPNKxo0w=;
 b=W24tMUpPx8QfiDn4PVw0kgQpOsco5+LDHHzd7K5HPMVPqfV3DorqnuCrKaYjv/x5Bj
 mrGnxfS2f+hlkyLuCEcsVdm0gA/hYLo0Kzbryqw2OsfCUUHW0V4YPBOj9vMXXEu2/JPB
 WIHBGZUW1u4pyRWIjqZws6Qn+GchG6GZ8zaRy1MpYL0HdSznI5zWVw98i671fApaKRym
 nWAYhq6e4bCXXdEb4BcpKLV9msd0xN+/0b5gyfY87G48svAPaGpqcMhLRQxOxj3+6rvC
 D3lNnWR90NKjtSlO5X4XnO5O8ZYgDKOrHcBxukMIpIA+HUyB9+XwEoDbhmWpHrk0hkfE
 d9Lg==
X-Gm-Message-State: AOAM531vg55Kl5uX5nVxsP/42c2nelBCPxls9H7rw2hHaKesQG0BFM2m
 rFV6vGMMNFQ62DygTowuzGfyHhduTclOaUUhT4o=
X-Google-Smtp-Source: ABdhPJx/ogTTn6NfhMkXQ92VLMz/HOLhtw2qz/mwA6c9pkrSIwOCJG2zfNP7afdC9MvRMTC4ad7jGc+5QoQoIWGkNpE=
X-Received: by 2002:adf:f346:: with SMTP id e6mr7295133wrp.28.1626195066164;
 Tue, 13 Jul 2021 09:51:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210712175352.802687-1-daniel.vetter@ffwll.ch>
 <20210712175352.802687-15-daniel.vetter@ffwll.ch>
In-Reply-To: <20210712175352.802687-15-daniel.vetter@ffwll.ch>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 13 Jul 2021 09:55:11 -0700
Message-ID: <CAF6AEGtC0BxABJtSaOmhEt_WKiuptWCHP7g4D5wEaJ4NaEuz4w@mail.gmail.com>
Subject: Re: [PATCH v4 14/18] drm/msm: Don't break exclusive fence ordering
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 12, 2021 at 1:02 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> There's only one exclusive slot, and we must not break the ordering.
>
> Adding a new exclusive fence drops all previous fences from the
> dma_resv. To avoid violating the signalling order we err on the side of
> over-synchronizing by waiting for the existing fences, even if
> userspace asked us to ignore them.
>
> A better fix would be to us a dma_fence_chain or _array like e.g.
> amdgpu now uses, but
> - msm has a synchronous dma_fence_wait for anything from another
>   context, so doesn't seem to care much,
> - and it probably makes sense to lift this into dma-resv.c code as a
>   proper concept, so that drivers don't have to hack up their own
>   solution each on their own.
>
> v2: Improve commit message per Lucas' suggestion.
>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> ---
>  drivers/gpu/drm/msm/msm_gem_submit.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> index b71da71a3dd8..edd0051d849f 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -306,7 +306,8 @@ static int submit_fence_sync(struct msm_gem_submit *submit, bool no_implicit)
>                                 return ret;
>                 }
>
> -               if (no_implicit)
> +               /* exclusive fences must be ordered */
> +               if (no_implicit && !write)
>                         continue;

In practice, modern userspace (the kind that is more likely to set the
no-implicit flag on every submit) also sets MSM_SUBMIT_BO_WRITE on
every bo, to shave some cpu overhead so I suppose this would not
really hurt anything

Do you know if this is covered in any piglit/etc test?

BR,
-R

>
>                 ret = msm_gem_sync_object(&msm_obj->base, submit->ring->fctx,
> --
> 2.32.0
>
