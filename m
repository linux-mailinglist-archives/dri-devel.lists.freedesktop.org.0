Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A67F2164D69
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 19:11:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D00C6EC68;
	Wed, 19 Feb 2020 18:11:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com
 [IPv6:2607:f8b0:4864:20::942])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7DDF6EC6A
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 18:11:07 +0000 (UTC)
Received: by mail-ua1-x942.google.com with SMTP id g13so556273uab.7
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 10:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ie4gvOrM0HZxYBgc3rQsCjjJaKfpCQHC9fLi2QF4Gh4=;
 b=qSKorqc6eva8rejw0HK4xpsGapDXGxLayg39RZTZGjTej5F9YQJPtx9vNkt+0E3Uud
 FigUAtxl9TUCkfI68tyaDXZu8bvjRspEbbtIUwKK2BiRQoHONZlaIhZM+kYHPcg+aJ3c
 g/KV4fbxUJ4lsogTrQQXs7smMlnrEeruKRLOYra2KV502MdTskZqiZoNweOZvY8U5DnZ
 Dj08+5iuSW9vaFI8vhlSjy1wIC8p5hZgn6L3rr27bQVnpTa3hPBe82D67QoeZld1Qd//
 DmRDjvmpkoUBY862jpMnIkSaUi+n7Rww7b8XJTtHpGX05xGrYdtHm3Rb3RaIkkweL0sM
 gbBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ie4gvOrM0HZxYBgc3rQsCjjJaKfpCQHC9fLi2QF4Gh4=;
 b=RolWXBNzrlxwLmLzp2ywfEvAq3e6GApaQfAEYskjASkaKlBBbOjfHfcO818kP2Djan
 boRPO6zvvkD/9aG2QGSXkZBtw2HJuso6X9i6Lehj85RH7pFFeZazZt1V5ByQl7pcq+PY
 /iNUc49EbdVIZm6pZ9qWBVCual34Hvz72YdrKqs5MNULjL9DLOTf/9D9w6Uv84Mi1/id
 nYJli/dJYSTlb8c7DhXM3niNVhgAkSNA4jzHcjb8pkXpOmAX6oawTYTL65+OwnPtOojx
 9gb4P0WV9aSsM2UBJpK7C/QLQWZSb0S+zupFzuokLcrRjfO0E6YcW+2Ju9xo+/FFgYB5
 fXeQ==
X-Gm-Message-State: APjAAAVzVM8cDvvxkgazbCkIvyjTDNrOYYuUkviSLyW5whcseIuUvYgg
 KEptR65ILO3cpLW0HX3AoOI+2iy88JUnX3MewE0=
X-Google-Smtp-Source: APXvYqwKJMYZkR6PV3gqpRIzo72NB+ZpjFtQi35Ac1v9hg1SIjPJSnYrZly9MzK26hPSa2Q9+KW6uFq6PZkpMo3k7/M=
X-Received: by 2002:ab0:5bc6:: with SMTP id z6mr14829229uae.46.1582135866642; 
 Wed, 19 Feb 2020 10:11:06 -0800 (PST)
MIME-Version: 1.0
References: <20200219175640.809-1-gurchetansingh@chromium.org>
 <20200219175640.809-2-gurchetansingh@chromium.org>
In-Reply-To: <20200219175640.809-2-gurchetansingh@chromium.org>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Wed, 19 Feb 2020 18:10:55 +0000
Message-ID: <CACvgo51ks7UFy2GM9T0=PGAT8H_k4UHpTaCZcuW8ZvODiFbxNQ@mail.gmail.com>
Subject: Re: [PATCH 2/5 v5] drm/virtio: factor out context create hyercall
To: Gurchetan Singh <gurchetansingh@chromium.org>
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
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, jbates@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Gurchetan,

s/hyercall/hypercall/ in the commit message

On Wed, 19 Feb 2020 at 17:56, Gurchetan Singh
<gurchetansingh@chromium.org> wrote:

> +void virtio_gpu_create_context(struct drm_device *dev,
> +                              struct drm_file *file)
> +{
> +       struct virtio_gpu_device *vgdev = dev->dev_private;
> +       struct virtio_gpu_fpriv *vfpriv = file->driver_priv;
> +       char dbgname[TASK_COMM_LEN];
> +
> +       /* can't create contexts without 3d renderer */
> +       if (!vgdev->has_virgl_3d)
> +               return;
> +
This cannot trigger, since we have similar check in the caller
virtio_gpu_driver_open().


> @@ -260,8 +247,7 @@ int virtio_gpu_driver_open(struct drm_device *dev, struct drm_file *file)
>  {
>         struct virtio_gpu_device *vgdev = dev->dev_private;
>         struct virtio_gpu_fpriv *vfpriv;
> -       int id;
> -       char dbgname[TASK_COMM_LEN];
> +       int handle;
>
>         /* can't create contexts without 3d renderer */
>         if (!vgdev->has_virgl_3d)
... namely this here.

With either of the two dropped:
Reviewed-by: Emil Velikov <emil.velikov@collabora.com>

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
