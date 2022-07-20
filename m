Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6844D57BD49
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 19:57:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90F5C14AA51;
	Wed, 20 Jul 2022 17:57:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1260F11BEEF;
 Wed, 20 Jul 2022 17:57:02 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id a11so5214764wmq.3;
 Wed, 20 Jul 2022 10:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yHRPEwie+kv37rjFQaOMTG39vvbswHQIAL5qJKmAXZY=;
 b=jHHP9ovMBvjF1Tz2XGF2O9uZIGYUh8uL3ccc1JcN0v8LL9vnt/CinMBSagcmUsB0Ha
 xOMPdfqLVfRR8KBTjUW3q4gJAiq9/Bj+xwq8vM5i2NJGbuUau3prMQFvEfK187IPw3sP
 ldn0KN2bm3rURRez4YtZRMTE9BhOk8rkB5kG+pW/VAI5cr1aqPSKS04ccEoqIYJR6tVy
 Zuw3v3nP+Hb8a3vYv7VyQIgdXWHzjqNVBfIr4tnV16bQGFafAwIaR6YmH3qdWmpIj3MM
 3fM2UpyV4zp2x+GfoPfTe10AJahSclTCRwIrWIwAQ6N64nxC0rG4BGVOnfxlHcdrCw9m
 qR4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yHRPEwie+kv37rjFQaOMTG39vvbswHQIAL5qJKmAXZY=;
 b=fTNxJH5HEoBwElRCDCKqBBXKlGPq6iewQn35x0YMdCAuTb8hfB4+hmEM/lt572iKUU
 qSBs+K1g9jn5sQmmyp6HeyBz3qB+4ZjhT2pqLI238WYVy1OnFHcdtc/KU0iL5uMhtVXy
 7m+OYn7ngL2mdiRyJERk4LysUf5qLY0p+vfoYk6atoGEn+AGung3Xj7zbrNs2jQM1UVY
 6hgrZXhmkNf27Mk1htlrGvgNMcAjJgyrLfUioWjGKitPxiL3X8E3SJ092+tdq3ymux1k
 ug6uflUgSH00eyymcxxAIEftSmXAcCFo5S8T02ra/XjDDlWBsJPCKdabfRe+c2gtFzIk
 RIcw==
X-Gm-Message-State: AJIora8tpm0Pq5gv9IRCmSo3uVvQElrOe/p9qOngqWPKJEoaeGHVw5S7
 i62XGb83OzNg0k2lEPeI6vArezE9AOsKALPXvk0=
X-Google-Smtp-Source: AGRyM1um84Qx2d3VuA14HmTjZeEjFriFAeIWZ5gQkmqsDi89xqJ0we4+Qh4P4848RYr0tzuTinlTksVyONKTxWesIwg=
X-Received: by 2002:a05:600c:3ac3:b0:3a0:45b6:7efb with SMTP id
 d3-20020a05600c3ac300b003a045b67efbmr4906657wms.183.1658339820479; Wed, 20
 Jul 2022 10:57:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220719171900.289265-1-robdclark@gmail.com>
 <20220719171900.289265-10-robdclark@gmail.com>
 <c5beb186-96d3-59d7-fad8-987bb8125de1@collabora.com>
In-Reply-To: <c5beb186-96d3-59d7-fad8-987bb8125de1@collabora.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 20 Jul 2022 10:57:21 -0700
Message-ID: <CAF6AEGusbnsY8fyFetkov5bRPd0vidTyBm8QL7a56TwYZ+NdRQ@mail.gmail.com>
Subject: Re: [PATCH v2 09/13] drm/gem: Add LRU/shrinker helper
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
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 19, 2022 at 11:56 AM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
>
> On 7/19/22 20:18, Rob Clark wrote:
> > +void
> > +drm_gem_lru_move_tail_locked(struct drm_gem_lru *lru, struct drm_gem_object *obj)
> > +{
> > +     WARN_ON(!mutex_is_locked(lru->lock));
>
> Nit: What about lockdep_assert_held_once(&lru->lock->base)) ?

ahh, good point.. I've switched it locally

BR,
-R

> Otherwise, looks good! I'll use it for the DRM-SHMEM shrinker after
> completing the work on the dma-buf locks.
>
> Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>
> --
> Best regards,
> Dmitry
