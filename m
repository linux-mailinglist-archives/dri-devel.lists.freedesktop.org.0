Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A18105BA38E
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 02:46:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F026810E339;
	Fri, 16 Sep 2022 00:46:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53DC110E339
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Sep 2022 00:45:59 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id y8so22443992edc.10
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Sep 2022 17:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=fgvuqsUTyWyuOvAIEgrlM+1FJPr0CKG3fXPQsUY/0fA=;
 b=cLx8a1wYzET6txnhpQe08LOWhlT2HAaOoEZ6Xivw5dltqJhG5nNtCsQ0KD4vzbdN/N
 M82otOxiqyjLzN6gYqig2MI5FbZiP8z/0epchRNXhz2xKF3VEO1kQL63JnCk2PL1qzA5
 u+z6KZrKuPKZBB2U97Xd4bX1iduraXZLJTgpCJi9YqQywjVI4rFnF3emhLFEJZGYHZkK
 N4d8835lZypHOoMBHcS7ibvuIYSsuk7Oh325nGuCtxDtjHnyoq6VjbC63Gi5hgNGISxP
 gM//Fi7GrxIdxZOyYkYFViPXPlR8mQ6+TPCywflwoun6XLbrkoGSgD55COpAvGSOUudr
 +adg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=fgvuqsUTyWyuOvAIEgrlM+1FJPr0CKG3fXPQsUY/0fA=;
 b=IdJJx6aFUJeO/Oxbo6vhe8SRVO2XA5ypnDM2NUHN3x+nwitxln7bVj83FMBA0RJhr9
 lF7gJRbavBsQyvRjPX5NyYoAFQl19vL8KspZj5wW1PPdkzd6CY4vUk3xr4auIbgLyfJP
 TGZ7m3DDMhtiSe+ycF1M2sicT/mMAZlXuAaAmpICBH109Dm9VBU1VdtzQtpa0o9a/84v
 U/9LdHyyJPlQvbwZEjSwVnNyKn3GCECPOrVbhBlHk8tbsroC0o97/UDX4fJmn1RclDmF
 QgN6b7uDSlwYnhGsXKSzFoM4XwXyN2a8ILvM7wm6EtqEi+kBdR+GBqR3An4og9H/gCQq
 imuQ==
X-Gm-Message-State: ACrzQf0d2eM1bHHI56CeC36hmUYOiQk7+OCuv1PglUCb+AJ3CbfLZp2o
 yz3kgTMcBmcXiE43ni9Fqa0hvhyLEpjG9o/Ys5I=
X-Google-Smtp-Source: AMsMyM765GVM5HcFPB43/QMjNSuBYxWMcW2k/CHvmEVg52f2dnJANqGDzrkFWPFpWGtgqCTEqMLOAuL9dBQOLX2/gkY=
X-Received: by 2002:a05:6402:194e:b0:452:5f30:7b03 with SMTP id
 f14-20020a056402194e00b004525f307b03mr1990017edz.124.1663289157743; Thu, 15
 Sep 2022 17:45:57 -0700 (PDT)
MIME-Version: 1.0
References: <YyMJBkId0c1lvrrO@kili>
In-Reply-To: <YyMJBkId0c1lvrrO@kili>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Thu, 15 Sep 2022 17:45:46 -0700
Message-ID: <CAPaKu7SCZuX_agp3WUWkra63w6=+ZMyLSSqk9tZyB+B75sVo7w@mail.gmail.com>
Subject: Re: [PATCH] virtio-gpu: fix shift wrapping bug in
 virtio_gpu_fence_event_create()
To: Dan Carpenter <dan.carpenter@oracle.com>
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 15, 2022 at 4:14 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The ->ring_idx_mask variable is a u64 so static checkers, Smatch in
> this case, complain if the BIT() is not also a u64.
>
> drivers/gpu/drm/virtio/virtgpu_ioctl.c:50 virtio_gpu_fence_event_create()
> warn: should '(1 << ring_idx)' be a 64 bit type?
>
> Fixes: cd7f5ca33585 ("drm/virtio: implement context init: add virtio_gpu_fence_event")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_ioctl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> index 3b1701607aae..14eedb75f8a8 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> @@ -47,7 +47,7 @@ static int virtio_gpu_fence_event_create(struct drm_device *dev,
>         struct virtio_gpu_fence_event *e = NULL;
>         int ret;
>
> -       if (!(vfpriv->ring_idx_mask & (1 << ring_idx)))
> +       if (!(vfpriv->ring_idx_mask & (1ULL << ring_idx)))
BIT_ULL(ring_indx)?

>                 return 0;
>
>         e = kzalloc(sizeof(*e), GFP_KERNEL);
> --
> 2.35.1
>
