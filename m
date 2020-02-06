Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3B2154ADD
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2020 19:15:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 780026FAF4;
	Thu,  6 Feb 2020 18:15:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 832EA6FAF4
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2020 18:15:40 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id z193so7397600iof.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Feb 2020 10:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qm/9DZ1+cOCeT82di260lY0T4I/3ttFrYIoKFTAg9gs=;
 b=mpRfwzMmUJ3L0g1O2GfGVBmIfAqQL7N3wdd3Tb8slq9OwTT2ye8YHI1zw3p37eZnyy
 J2prHTc+aPQZ2eJNu7sxiZYePzw7J3H4ZLFd1zPzQl9oEVcd74hrjm8t+SBvaR/Av7TB
 GWR8BPHYT/K0D/kSO7rE35MMHmNWghOdZFVLXQaZyqYDsodF5vI+3cZdZ1c8y08WXRbw
 QbIrDZnO58iwfzXViEnszlGFfVaMf9DtlZ8EcEDGPL9WNKmGCpUmAzsdo/2cCgoSaC3m
 yUWXZS3Ii/U65H0r+YRQ7wKOrdZcjYivbhPkGek+tfzNH5u7Yeqe6Zj0F7n1zrvoc0W0
 hBOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qm/9DZ1+cOCeT82di260lY0T4I/3ttFrYIoKFTAg9gs=;
 b=V94RxU54SKzrjmKJhtuFtcs0NBkOipX74GxiH7NDd5MZ/8iqBJ6Ol9eVLRFn+RAxhZ
 1tkKGJFhuz6GtHEtDlpHkHde/I/IPgAcg0A//dbsdXKlxZbcHRCNSoeFYFI3FXbRtay4
 TJ15OAELGcoYaq9RHxC+UmsfUJt3nFPmXzUE66D+Gx8RQaFLhtICTAg0UtRfFcwrokdo
 mfb9PwUqOKaQRfb4ogxJofte434HtICPwHcH9D5YU+HrerG4C4pQNTTieAoyUSJo+Pir
 fKZ2irJoEYT1aaSw83rRMr+eiHDjB8bKyv67EZrt1CAMItDBglEhHHmOQyax6fvQ0ixn
 cpbw==
X-Gm-Message-State: APjAAAUKvZVRCgJtXo2GRoHJSXC2EXm2XYYqO6E00Kl3cUvP+uTS6MTg
 QxmECpkViSOD/+OEGZgbsBPIDOc28Y/wR3DjmLe9btXA
X-Google-Smtp-Source: APXvYqwwfx7ahBEIq6ja5VIzZPkRCDJAqTWXAylu6Iv8sD9Vj3+b0UuhHrjWFgteX+4PfVmyFedq0YesmBmAj46tNxM=
X-Received: by 2002:a5e:df06:: with SMTP id f6mr34748316ioq.84.1581012939714; 
 Thu, 06 Feb 2020 10:15:39 -0800 (PST)
MIME-Version: 1.0
References: <20200205181955.202485-1-olvaffe@gmail.com>
 <20200205181955.202485-10-olvaffe@gmail.com>
 <20200206094929.vuyjenl6fz2gfjus@sirius.home.kraxel.org>
In-Reply-To: <20200206094929.vuyjenl6fz2gfjus@sirius.home.kraxel.org>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Thu, 6 Feb 2020 10:15:28 -0800
Message-ID: <CAPaKu7TaCznzd5zv079qkmuXX+HtQyKeCPwznQ30kWTwEAAczA@mail.gmail.com>
Subject: Re: [PATCH 09/11] drm/virtio: avoid an infinite loop
To: Gerd Hoffmann <kraxel@redhat.com>
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 6, 2020 at 1:49 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> On Wed, Feb 05, 2020 at 10:19:53AM -0800, Chia-I Wu wrote:
> > Make sure elemcnt does not exceed the maximum element count in
> > virtio_gpu_queue_ctrl_sgs.  We should improve our error handling or
> > impose a size limit on execbuffer, which are TODOs.
>
> Hmm, virtio supports indirect ring entries, so large execbuffers should
> not be a problem ...
>
> So I've waded through the virtio code.  Figured our logic is wrong.
> Luckily we err on the safe side (waiting for more free entries than we
> actually need).  The patch below should fix that (not tested yet).
That is good to know!  I was not sure if we have
VIRTIO_RING_F_INDIRECT_DESC so I kept our logic.  I will drop this
patch in v2.

>
> cheers,
>   Gerd
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
> index aa25e8781404..535399b3a3ea 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_vq.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
> @@ -328,7 +328,7 @@ static bool virtio_gpu_queue_ctrl_sgs(struct virtio_gpu_device *vgdev,
>  {
>         struct virtqueue *vq = vgdev->ctrlq.vq;
>         bool notify = false;
> -       int ret;
> +       int vqcnt, ret;
>
>  again:
>         spin_lock(&vgdev->ctrlq.qlock);
> @@ -341,9 +341,10 @@ static bool virtio_gpu_queue_ctrl_sgs(struct virtio_gpu_device *vgdev,
>                 return notify;
>         }
>
> -       if (vq->num_free < elemcnt) {
> +       vqcnt = virtqueue_use_indirect(vq, elemcnt) ? 1 : elemcnt;
> +       if (vq->num_free < vqcnt) {
>                 spin_unlock(&vgdev->ctrlq.qlock);
> -               wait_event(vgdev->ctrlq.ack_queue, vq->num_free >= elemcnt);
> +               wait_event(vgdev->ctrlq.ack_queue, vq->num_free >= vq);
>                 goto again;
>         }
>
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
