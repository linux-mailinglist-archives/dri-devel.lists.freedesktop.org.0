Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5FF8686AA2
	for <lists+dri-devel@lfdr.de>; Wed,  1 Feb 2023 16:48:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF16E10E41F;
	Wed,  1 Feb 2023 15:48:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D8CA10E41F
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Feb 2023 15:48:13 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id 65so4270925iou.3
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Feb 2023 07:48:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0/nyhBk1uOsA1XtH9biqxBSFqS1i1uBqehOG4r1+rrk=;
 b=QAh/alzSMUbrP5wWliBdWn2kgG9OcxsCCn8tqvcHvowDVvFzzvZS8KoFL5JD9RU6bp
 i9lf1qw45Htg1Kmp5W4oqo7iZ4sMEqpG+ZDUJGYE6Bj/KDWxvoSpkZ/eehlU+2CcY6ke
 F4LRv7U4hMh5jX4N0nfcgT7yuCFpfRVcEkNM8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0/nyhBk1uOsA1XtH9biqxBSFqS1i1uBqehOG4r1+rrk=;
 b=buQR1eyBa30gF30cHBs8sXzbOwxSFO/kxex69+NlRcuaPh518czEDv8gNbKWMoqH9W
 WO7LjTN4XlEmyK2soWu5z22NVI3b6QZLYS564tpRnufg1R6iUfH890qWJfTZvw+Z9rp0
 TllJSsxIp1LmrJdWVChGkuErgEY7UMtHMviTDZP7qnDRr9PrMPdsRu3GKyLszBJceaoZ
 kVhkxuDZZBfgS7CKu8VbG/yoTjJwDV43zKbptGLwDGpV1cRjsFNNu7cAT54H3gyFxoUs
 8TrdfQzbOvJsdcmhgNbcD6zrQA8Ul5HfLheNbp34hKSAT2ZpPkburn7EjjD6+33H/bDm
 mKsw==
X-Gm-Message-State: AO0yUKUoIK2p0OLwOPJ7PFMaw6Ak2Zmb6JgVTpdNHwK9mxxRuAy7/Edn
 +Uu3vrAWS80fWSqPhdwHc2HWRqxZ0YxWvtZPRfUvpg==
X-Google-Smtp-Source: AK7set/F3VMGseYlu8zVbfJ1ajGRHTFHKE+1AiIPu8gs1RdZDgpyaPurXyum0GX6DS8jbFkyZ0tTDXIFWINKX3VRPas=
X-Received: by 2002:a02:856e:0:b0:3a9:5aa1:3477 with SMTP id
 g101-20020a02856e000000b003a95aa13477mr602873jai.18.1675266492402; Wed, 01
 Feb 2023 07:48:12 -0800 (PST)
MIME-Version: 1.0
References: <20230126225815.1518839-1-ryanneph@chromium.org>
 <dee14d1b-fc28-e867-b425-ab11c31d799d@collabora.com>
In-Reply-To: <dee14d1b-fc28-e867-b425-ab11c31d799d@collabora.com>
From: Rob Clark <robdclark@chromium.org>
Date: Wed, 1 Feb 2023 07:48:11 -0800
Message-ID: <CAJs_Fx4w-a0t9ekHvV55Ys6dYuTsKMa=az9E3UZcsej5AYNdGQ@mail.gmail.com>
Subject: Re: [PATCH] drm/virtio: exbuf->fence_fd unmodified on interrupted wait
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
Cc: Ryan Neph <ryanneph@chromium.org>, Yiwei Zhang <zzyiwei@chromium.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Gerd Hoffmann <kraxel@redhat.com>, David Airlie <airlied@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Emil Velikov <emil.velikov@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 1, 2023 at 5:28 AM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
>
> On 1/27/23 01:58, Ryan Neph wrote:
> > An interrupted dma_fence_wait() becomes an -ERESTARTSYS returned
> > to userspace ioctl(DRM_IOCTL_VIRTGPU_EXECBUFFER) calls, prompting to
> > retry the ioctl(), but the passed exbuf->fence_fd has been reset to -1,
> > making the retry attempt fail at sync_file_get_fence().
> >
> > The uapi for DRM_IOCTL_VIRTGPU_EXECBUFFER is changed to retain the
> > passed value for exbuf->fence_fd when returning ERESTARTSYS or EINTR.
> >
> > Fixes: 2cd7b6f08bc4 ("drm/virtio: add in/out fence support for explicit synchronization")
> > Signed-off-by: Ryan Neph <ryanneph@chromium.org>
> > ---
> >
> >  drivers/gpu/drm/virtio/virtgpu_ioctl.c | 9 ++++++---
> >  include/uapi/drm/virtgpu_drm.h         | 3 +++
> >  2 files changed, 9 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> > index 9f4a90493aea..ffce4e2a409a 100644
> > --- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> > +++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> > @@ -132,6 +132,8 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
> >       uint64_t fence_ctx;
> >       uint32_t ring_idx;
> >
> > +     exbuf->fence_fd = -1;
> > +
> >       fence_ctx = vgdev->fence_drv.context;
> >       ring_idx = 0;
> >
> > @@ -152,8 +154,6 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
> >               ring_idx = exbuf->ring_idx;
> >       }
> >
> > -     exbuf->fence_fd = -1;
>
> Is there any userspace relying on this -1 behaviour? Wouldn't be better
> to remove this offending assignment?

Looking at current mesa, removing the assignment should be ok (and
more consistent with other drivers).  But I can't say if this was
always true, or that there aren't other non-mesa users, so I can see
the argument for the more conservative uabi change that this patch
went with.

BR,
-R
