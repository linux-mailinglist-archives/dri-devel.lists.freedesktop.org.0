Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC81756796C
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jul 2022 23:39:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5418814AEF3;
	Tue,  5 Jul 2022 21:39:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76E4411A095
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jul 2022 21:39:44 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 bi22-20020a05600c3d9600b003a04de22ab6so7989868wmb.1
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Jul 2022 14:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uVq3SS5z0OOLu4Dz+fgC14BcaabN+0EvMUub15/aayE=;
 b=C94wUsjHGErDEFfla43eG5MzlsxSHvDnvrDe/Xrq4j16p0QUv7EPUUdY8qfT32N8PO
 AkNo/0UsK88y1OWqCBOYj46lR/3MdEhmM+drGL8ytyaLNB5DkDjEP00OCpzW+m2wAelp
 TCjJ7vUiUbhEC8mlleJNOTcqUVGV/ivrW9GKS7hh9oDIOodvDUlUbW4gWh8hHeIPGFRb
 GmN849Dm7RTsKEWdgUCm5Wtd0phCicceWYfNP3NI0E3rA+EjSvilom+GgarNgzMePkLI
 YUu9amjiRtd4qbZYzhVluqdxKr3YKYOQtRIAdp1MD6idcW/oD9wi9ffHBAtQrXAenSTI
 kDhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uVq3SS5z0OOLu4Dz+fgC14BcaabN+0EvMUub15/aayE=;
 b=dhbXDVgKJquxk0+qVvSJgeUuOj0h6y1q1NE7C+E3Q4Mhg627bq2L8GyYjlF9Wiumk5
 HA9HcKHRqshBJSkSy03jXmn5SpT0Z9h43KwGqjmgQPQ8u16Nd9gmIuVeYByezmosDc4V
 NNKMELlluQjhThilksYoCKOdGYwQF/xVrLnIX1toe0BOjQx7/Ay+JrlzQ8yluJfvX/zC
 pzlVnTYQPXlj/qwd3OPoxYtYy/ermeToR7OeF/ix2yJMEs/pAMeyI3n8FlkIZ2GJv8HV
 95WanF6W01pwafNHCk9sdhv+TYBf6F7KgnK63RVgcTTmPGOutZbUSPa5/sdHaF1oziY3
 3Jpg==
X-Gm-Message-State: AJIora/ZoqAe+NoyTy9KvLN2eKDm6+zduAxCWoWDDPzOTJuR4ODF4H9r
 vyn0AsyI4mxcfXacWQrfc94zcEq9abWy7UCd0RY=
X-Google-Smtp-Source: AGRyM1t4PnuQ4FyRFI1FjuAnfXAuz8RC8AR6+hfD0f99JNKIvcxLDBodEWidId40zCkDUWQDdpcm5SB+uKOKRjrDWac=
X-Received: by 2002:a05:600c:3ac3:b0:3a0:45b6:7efb with SMTP id
 d3-20020a05600c3ac300b003a045b67efbmr40084996wms.183.1657057182563; Tue, 05
 Jul 2022 14:39:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220630200726.1884320-1-dmitry.osipenko@collabora.com>
 <20220630200726.1884320-8-dmitry.osipenko@collabora.com>
 <20220705135323.emr4gdbcxoisdcxe@sirius.home.kraxel.org>
 <d2c64d09-c4bb-9aed-069d-a9b4d07a1f66@collabora.com>
 <20220705154507.67ovlun4m26xzppn@sirius.home.kraxel.org>
 <1380526d-17fb-6eb2-0fd5-5cddbdf0a92e@collabora.com>
In-Reply-To: <1380526d-17fb-6eb2-0fd5-5cddbdf0a92e@collabora.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 5 Jul 2022 14:39:54 -0700
Message-ID: <CAF6AEGtE+3AbaJnSZ07VY0xMOJMNz6BSQ+mPKmPYLi_Z-CLAig@mail.gmail.com>
Subject: Re: [PATCH v7 7/9] drm/virtio: Improve DMA API usage for shmem BOs
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
Cc: David Airlie <airlied@linux.ie>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas_os@shipmail.org>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Osipenko <digetx@gmail.com>, kernel@collabora.com,
 Robin Murphy <robin.murphy@arm.com>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 5, 2022 at 10:02 AM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
>
> On 7/5/22 18:45, Gerd Hoffmann wrote:
> >   Hi,
> >
> >>> Also note that pci is not the only virtio transport we have.
> >>
> >> The VirtIO indeed has other transports, but only PCI is really supported
> >> in case of the VirtIO-GPU in kernel and in Qemu/crosvm, AFAICT. Hence
> >> only the PCI transport was tested.
> >
> > qemu -M microvm \
> >   -global virtio-mmio.force-legacy=false \
> >   -device virtio-gpu-device
> >
> > Gives you a functional virtio-gpu device on virtio-mmio.
> >
> > aarch64 virt machines support both pci and mmio too.
> > s390x has virtio-gpu-ccw ...
>
> Gerd, thank you very much! It's was indeed unclear to me how to test the
> MMIO GPU, but yours variant with microvm works! I was looking for trying
> aarch64 in the past, but it also was unclear how to do it since there is
> no DT support for the VirtIO-GPU, AFAICS.

just a drive-by note, IME on aarch64 kernels, at least with crosvm,
virtgpu is also a pci device.. the non-pci things in the guest kernel
use dt, but devices on discoverable busses like pci don't need dt
nodes (which is true also in the non-vm case)

BR,
-R


> I booted kernel with this patchset applied and everything is okay, Xorg
> works.
>
>  [drm] Initialized virtio_gpu 0.1.0 0 for LNRO0005:01 on minor 0
>  virtio-mmio LNRO0005:01: [drm] drm_plane_enable_fb_damage_clips() not
> called
>  virtio-mmio LNRO0005:01: [drm] fb0: virtio_gpudrmfb frame buffer device
>
> There is no virgl support because it's a virtio-gpu-device and not
> virtio-gpu-device-gl that is PCI-only in Qemu. Hence everything seems good.
>
> I'd appreciate if you could give s390x a test.. I never touched s390x
> and it will probably take some extra effort to get into it.
>
> --
> Best regards,
> Dmitry
