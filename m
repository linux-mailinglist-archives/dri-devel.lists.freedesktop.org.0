Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDA5412B2A
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 04:08:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCF7A6E8C2;
	Tue, 21 Sep 2021 02:07:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A3356E8C2
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 02:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632190074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=P0kxhnvVXGqL/DkgQ0Xhuo7zEcFhuLSYFgkrJ0v2bY8=;
 b=XgpU32BGR5MiS6NRq4KTnHQ3Os0tTEFkyxzfJeBjXIGQdT8vKnxhsIxxRsxlTT6szlfav5
 EIIMOgFYzOJB6kpRj0yghLSH9wqVsGbrE4RnblgX7IQxplV9RINyp9nwIo17UEAdH+McJP
 nSRD5NCUzOuFiEBeLCkDKUQQrqnwnZQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359-ESz0OsjmPRC5LhHc-d5Sjg-1; Mon, 20 Sep 2021 22:07:53 -0400
X-MC-Unique: ESz0OsjmPRC5LhHc-d5Sjg-1
Received: by mail-wr1-f71.google.com with SMTP id
 k2-20020adfc702000000b0016006b2da9bso2519200wrg.1
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 19:07:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P0kxhnvVXGqL/DkgQ0Xhuo7zEcFhuLSYFgkrJ0v2bY8=;
 b=bP75LOTs+231aUP751HyfQ81DiPvKyBnBzS5dj2sIly2tu7uXSP2M7RFYskLQM4xmw
 YUPFplfr+fRl3yh2MY6EAUu0GYWalEKVkD3PoseWnqExR90hMxh9Lm2JzL9Ms/TBF+Ip
 PDf2DGta00xJoqnx9l6yqssMT4i/qvtOb48aeBO7i0B9YjgD4XLPaZIDK9VC/f3IcG4z
 vVtGXfygGi9MHp+uaXkCQK7Nzus00+c7CShRys4vzEI/oF5xMkr3UF95XLuL65Y6fIyL
 SfWpLbPksXhvrSiyB7FbvvqJUg+h0fJHVRBD2yml/pm7X//rNlpZ03Q4sT/Df4TWoX27
 UOAw==
X-Gm-Message-State: AOAM5303YhofTlDo0JFi2bw+vdqhhZMgvpuSuGfYrWV6fnU1WJZs89pT
 GSw/AJxOgCUl9mcUMdmqYx+d4nhS+jRSxWHmQg6oWLWXctP/T7aHwQPEmMyPBUbqfZzimeS8MDe
 0fwLWwq4XBljNvbIv2AHPXfZbqOOs6T1xQ5ayFtVjxSsn
X-Received: by 2002:a5d:59a6:: with SMTP id p6mr31897326wrr.142.1632190072362; 
 Mon, 20 Sep 2021 19:07:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzrRzQplbk6pECz7R+jDK45fgzj2acrfM2YcTeVeurs7f31ushctXVBKRv9j3sozVJ/z6cTUf1MM8JcQ4F1Rfo=
X-Received: by 2002:a5d:59a6:: with SMTP id p6mr31897316wrr.142.1632190072226; 
 Mon, 20 Sep 2021 19:07:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210920181647.22156-1-tim.gardner@canonical.com>
In-Reply-To: <20210920181647.22156-1-tim.gardner@canonical.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Tue, 21 Sep 2021 04:07:41 +0200
Message-ID: <CACO55ts0kJaHr0QTzqy5r9Gq4vbV=8bMokuVHSCAqMVEOKAgDw@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau/ga102: Free resources on error in
 ga102_chan_new()
To: Tim Gardner <tim.gardner@canonical.com>
Cc: nouveau <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 20, 2021 at 8:17 PM Tim Gardner <tim.gardner@canonical.com> wrote:
>
> Coverity complains of a resource leak in ga102_chan_new():
>
> CID 119637 (#7 of 7): Resource leak (RESOURCE_LEAK)
> 13. leaked_storage: Variable chan going out of scope leaks the storage it points to.
> 190                return ret;
>
> Fix this by freeing 'chan' in the error path.
>

yeah, this is actually a false positive. I ran your patch through
kasan and got a use-after-free as we deallocate the passed in pointer
after calling the function pointer to the new function. One might
argue that the programming style isn't the best and we should be
explicit about freeing memory though.

> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Karol Herbst <kherbst@redhat.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Tim Gardner <tim.gardner@canonical.com>
> ---
>  .../gpu/drm/nouveau/nvkm/engine/fifo/ga102.c  | 20 ++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga102.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga102.c
> index f897bef13acf..4dbdfb53e65f 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga102.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga102.c
> @@ -175,19 +175,21 @@ ga102_chan_new(struct nvkm_device *device,
>                 }
>         }
>
> -       if (!chan->ctrl.runl)
> -               return -ENODEV;
> +       if (!chan->ctrl.runl) {
> +               ret = -ENODEV;
> +               goto free_chan;
> +       }
>
>         chan->ctrl.chan = nvkm_rd32(device, chan->ctrl.runl + 0x004) & 0xfffffff0;
>         args->token = nvkm_rd32(device, chan->ctrl.runl + 0x008) & 0xffff0000;
>
>         ret = nvkm_memory_new(device, NVKM_MEM_TARGET_INST, 0x1000, 0x1000, true, &chan->mthd);
>         if (ret)
> -               return ret;
> +               goto free_chan;
>
>         ret = nvkm_memory_new(device, NVKM_MEM_TARGET_INST, 0x1000, 0x1000, true, &chan->inst);
>         if (ret)
> -               return ret;
> +               goto free_chan;
>
>         nvkm_kmap(chan->inst);
>         nvkm_wo32(chan->inst, 0x010, 0x0000face);
> @@ -209,11 +211,11 @@ ga102_chan_new(struct nvkm_device *device,
>
>         ret = nvkm_memory_new(device, NVKM_MEM_TARGET_INST, 0x1000, 0x1000, true, &chan->user);
>         if (ret)
> -               return ret;
> +               goto free_chan;
>
>         ret = nvkm_memory_new(device, NVKM_MEM_TARGET_INST, 0x1000, 0x1000, true, &chan->runl);
>         if (ret)
> -               return ret;
> +               goto free_chan;
>
>         nvkm_kmap(chan->runl);
>         nvkm_wo32(chan->runl, 0x00, 0x80030001);
> @@ -228,10 +230,14 @@ ga102_chan_new(struct nvkm_device *device,
>
>         ret = nvkm_vmm_join(vmm, chan->inst);
>         if (ret)
> -               return ret;
> +               goto free_chan;
>
>         chan->vmm = nvkm_vmm_ref(vmm);
>         return 0;
> +
> +free_chan:
> +       kfree(chan);
> +       return ret;
>  }
>
>  static const struct nvkm_device_oclass
> --
> 2.33.0
>

