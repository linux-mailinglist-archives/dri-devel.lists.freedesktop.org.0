Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 362545871F0
	for <lists+dri-devel@lfdr.de>; Mon,  1 Aug 2022 22:01:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3A0014A13A;
	Mon,  1 Aug 2022 20:00:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B636014A70E;
 Mon,  1 Aug 2022 20:00:41 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id t1so18954129lft.8;
 Mon, 01 Aug 2022 13:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=V5gQ5qjxqGzCmOK1PLGxzPSbavAClYglR/pW8JvcVsY=;
 b=EOL03vS8sJyZdeSxpiRsCpF+3QVM3bz3TKLSdmNrCoN76SVWyUko+Tv6vsSYLW7ohS
 OoFPkFDsJRnCHJ8rN0rBpqI8kXsGle4DYUVWllYVv4qGUEKKkiDcieFDGBfMgt6tEi7t
 LP86DXRvoqv4wH2xg+sMC+aIO5Wf/uE9oLW9FlN2WJvKg9mQqtKopNHU39gskBLHOLhg
 oqT9ulPJApTuxEbnIx4D096yBekO7hEns8wHMQ8Vga8PMh+bdRVTg2U1BdfxwzpUz+Sa
 x2ALv/PS9Hp6ZtJQhZD3YGGC5A9n7f4sDdG7YeKW3OJkegRDy04hq3vJtVLEaS9RiQd6
 Co6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=V5gQ5qjxqGzCmOK1PLGxzPSbavAClYglR/pW8JvcVsY=;
 b=PtG86v0kx+LwH61i7yDcNZTaULLXV6U1PScFfGv/+Qlf48ZANMoqpWZqyda651wA4v
 ghleXkYcGxy/RBwvilKF6NG0G7uTfXAXUZEYelinK5hX/0aExPAHRmMrdONqVmu6YD0k
 oZWZL8eTOXW8VVvtv2zvVpm/wOr9JYzqSQmsd7nCFDzalO8fCCvhu09GBdOyOuoF1lsr
 uQjm2YC3h9pxKmd8oSawixR3gU8AZtfmFtAESwWTA4WAkxqPl/h43Ql3uiLbwp/01r0W
 DNwxsW8g1dioq7i6Q/EYBFqfGUTb7rW9IG0gG0CavJBNdJZq5BVys6m0crqGf4jY5lL5
 pg6A==
X-Gm-Message-State: AJIora8xcDZvk4iemLnGCnbPghUJnWZP/fVTO1PbOQdL57I7mhuhoGxu
 UPUiT0xkvhS7LNdBxHn/rZLHvII1VNkIsWKZcVA=
X-Google-Smtp-Source: AGRyM1vBBRHawcG8ftTonyM9q75QurQ3p3zcaTaySOV/jAW8LTQYo2ezKlXopdPACqJAWiV0BTKWTE1V6STR2cdwnFI=
X-Received: by 2002:a05:6512:3f13:b0:48a:a89e:3ccb with SMTP id
 y19-20020a0565123f1300b0048aa89e3ccbmr5804969lfa.245.1659384039913; Mon, 01
 Aug 2022 13:00:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220726175043.1027731-1-robdclark@gmail.com>
 <20220726175043.1027731-10-robdclark@gmail.com>
 <def8e47c-067e-0841-4ae4-1eb90244cd50@collabora.com>
In-Reply-To: <def8e47c-067e-0841-4ae4-1eb90244cd50@collabora.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 1 Aug 2022 13:00:27 -0700
Message-ID: <CAF6AEGtV4GY6=PmQh0wrKxjxk_baRCzOo=s=Uz-uKBNEn7SBBg@mail.gmail.com>
Subject: Re: [PATCH v3 09/15] drm/gem: Add LRU/shrinker helper
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 1, 2022 at 12:41 PM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
>
> On 7/26/22 20:50, Rob Clark wrote:
> > +/**
> > + * drm_gem_lru_remove - remove object from whatever LRU it is in
> > + *
> > + * If the object is currently in any LRU, remove it.
> > + *
> > + * @obj: The GEM object to remove from current LRU
> > + */
> > +void
> > +drm_gem_lru_remove(struct drm_gem_object *obj)
> > +{
> > +     struct drm_gem_lru *lru = obj->lru;
> > +
> > +     if (!lru)
> > +             return;
> > +
> > +     mutex_lock(lru->lock);
> > +     lru_remove(obj);
> > +     mutex_unlock(lru->lock);
> > +}
> > +EXPORT_SYMBOL(drm_gem_lru_remove);
>
> I made a preliminary port of the DRM-SHMEM shrinker on top of the the
> latest version of dma-buf locking convention and yours LRU patches. It
> all works good, the only thing that is missing for the DRM-SHMEM
> shrinker is the drm_gem_lru_remove_locked().
>
> What about to add a locked variant of drm_gem_lru_remove()?

Sounds fine to me.. the only reason it didn't exist yet was because it
wasn't needed yet..

I can respin w/ an addition of a _locked() version, or you can add it
on top in your patchset.  Either is fine by me

BR,
-R
