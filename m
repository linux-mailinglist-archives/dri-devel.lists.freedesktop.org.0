Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3EF3D6A61
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 01:52:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 942DF6E7D1;
	Mon, 26 Jul 2021 23:51:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 191496E7D1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 23:51:57 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id l18so5337902wrv.5
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 16:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tUIoigUs94bMHsltrSbpLlzLTuAd1wjaaiV0ZjEm+Bw=;
 b=j58O9/6iZBkX0FFFlPgMkDK17SR61mX0DAyRiuYxpvuZFTHbcm/MTFGcdmaNwJibhb
 uTBhqmJYjJWGv3MyOqx4xGwogGAmoI+UZVtAMpFcK+OEYendJwBziq0Rns+3kkBW+O8a
 3fJfm/C9J5jTTrEmg7CJEPy11Aum7gesrmioD5HoVl+4eD4eTMyYZc47HKhJ3Uw+eosu
 BmEcneHHIdMBgGcBFYCW+ZgCUWOHNPGJYJo0tXoR4hy4Rw1pYz5ckBE+OcWVH3jbNzEg
 RWvyOS8MC+EsozfKlizD4TvLFlcl49EUSDdLZf2FM4jYQbglxMxoTmu1AA7WHGTuix5c
 5QLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tUIoigUs94bMHsltrSbpLlzLTuAd1wjaaiV0ZjEm+Bw=;
 b=e62RrheXzN1ZkvqncgN2wOm6a7IxD2Ztth4nL1YCyHwo0UVf0LwsES/2LSPNHgfRs3
 pS+PEzQaWNuIpP6YeEFQYoz28sYDAgNZe7esYizltSxgjwUc2smQqgrN6yz91IM+PYQL
 j+N8sIjgocE0RU4KdFzt2Ncy793cZ4sNVy87Fps2zgFXx/cPqncBe5hMa2yYaV+J5JD+
 jAz8QuTS6oZJ8InHJAyQiFaG06keBkUHEnMhLQxKDh+KfU5wvmZR3BrrRiFW7LYjSE6z
 Rya7C5PdTXQ6LW7FSBqrm047oxzzsCcZgZu/vAVScZ1yqLei61iv6YOLEAf8y+ff7ObE
 9OWA==
X-Gm-Message-State: AOAM5320TsVoIDK6iXu1s3tyxQc7TOqvAkPAwG/OpaNUF6deLiuNaoAb
 eZo8a0CgzaslpSkD6lXEw46WhHHtPo8jpRCPR85BfmtYD+g=
X-Google-Smtp-Source: ABdhPJwXAzbNGuHdLOISfs3BtoWByAYqTqS3hd9v8tdZ2marIa37ZhMgm41g7p2rWzPxRDI2ZgF9Ns/85zSqMuv0bRc=
X-Received: by 2002:a5d:4348:: with SMTP id u8mr18590399wrr.28.1627343515010; 
 Mon, 26 Jul 2021 16:51:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210726233854.2453899-1-robdclark@gmail.com>
In-Reply-To: <20210726233854.2453899-1-robdclark@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 26 Jul 2021 16:51:43 -0700
Message-ID: <CAF6AEGtm4NdQfqo6wGFBM-EBzW9E8twpDuS7GTXf2iHiHZYL1g@mail.gmail.com>
Subject: Re: [RFC 0/4] dma-fence: Deadline awareness
To: dri-devel <dri-devel@lists.freedesktop.org>
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
Cc: Matthew Brost <matthew.brost@intel.com>, Rob Clark <robdclark@chromium.org>,
 Jack Zhang <Jack.Zhang1@amd.com>, Roy Sun <Roy.Sun@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Luben Tuikov <luben.tuikov@amd.com>, Gustavo Padovan <gustavo@padovan.org>,
 Alex Deucher <alexander.deucher@amd.com>, Tian Tao <tiantao6@hisilicon.com>,
 Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 26, 2021 at 4:34 PM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Based on discussion from a previous series[1] to add a "boost" mechanism
> when, for example, vblank deadlines are missed.  Instead of a boost
> callback, this approach adds a way to set a deadline on the fence, by
> which the waiter would like to see the fence signalled.
>
> I've not yet had a chance to re-work the drm/msm part of this, but
> wanted to send this out as an RFC in case I don't have a chance to
> finish the drm/msm part this week.

Fwiw, what I'm thinking for the drm/msm part is a timer set to expire
a bit (couple ms?) before the deadline, which boosts if the timer
expires before the fence is signaled.

Assuming this is roughly in line with what other drivers would do,
possibly there is some room to build this timer into dma-fence itself?

BR,
-R

>
> Original description:
>
> In some cases, like double-buffered rendering, missing vblanks can
> trick the GPU into running at a lower frequence, when really we
> want to be running at a higher frequency to not miss the vblanks
> in the first place.
>
> This is partially inspired by a trick i915 does, but implemented
> via dma-fence for a couple of reasons:
>
> 1) To continue to be able to use the atomic helpers
> 2) To support cases where display and gpu are different drivers
>
> [1] https://patchwork.freedesktop.org/series/90331/
>
> Rob Clark (4):
>   dma-fence: Add deadline awareness
>   drm/vblank: Add helper to get next vblank time
>   drm/atomic-helper: Set fence deadline for vblank
>   drm/scheduler: Add fence deadline support
>
>  drivers/dma-buf/dma-fence.c             | 39 +++++++++++++++++++++++++
>  drivers/gpu/drm/drm_atomic_helper.c     | 36 +++++++++++++++++++++++
>  drivers/gpu/drm/drm_vblank.c            | 31 ++++++++++++++++++++
>  drivers/gpu/drm/scheduler/sched_fence.c | 10 +++++++
>  drivers/gpu/drm/scheduler/sched_main.c  |  3 ++
>  include/drm/drm_vblank.h                |  1 +
>  include/linux/dma-fence.h               | 17 +++++++++++
>  7 files changed, 137 insertions(+)
>
> --
> 2.31.1
>
