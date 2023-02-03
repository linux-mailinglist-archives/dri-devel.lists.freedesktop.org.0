Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B960D68B84B
	for <lists+dri-devel@lfdr.de>; Mon,  6 Feb 2023 10:11:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B34DA10E179;
	Mon,  6 Feb 2023 09:11:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C87510E881
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Feb 2023 19:04:45 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id r8so6225562pls.2
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Feb 2023 11:04:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=oo+cKWPEpO2P7RN4zwy1Qd55HkzgWFy9L7T7gDL31nA=;
 b=gTdG2KorutmiQNyxFEPOV9rMuAr4eAnvBj7vMpFlDNzfEk3oPMJvwZnusYta/UmMM9
 793g9QhfVtBRSmrSfPndOdJN65JClVwUyk6CC62nul4toTsipo4quHHtotRbcqIg1Ef/
 PGbej4rh+YcSpJSuMAnkhqc1YXoZt/ytHIXpE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oo+cKWPEpO2P7RN4zwy1Qd55HkzgWFy9L7T7gDL31nA=;
 b=pn+edFDLX20Lj96WjlMZAOTPqUQS+jtsb6NTQYXd4P8WS+yjSm0TWrI3tOGeHwo6oH
 jRy3yDChzw+Ckyjp0QQ2Dt45xtT4UsPvG7zHXB8puV3gRoDWHaIqIrvIw/T/FjLtsXC6
 bMtWcGFo1/F46JlXodwMnAxUEd8l0fZI4d3ZQ9pjyprV4JQDKaKe111AY5MtB7BmPIS6
 3MIJ8wpi57TTDecRfjxb8FnMyhBTceddUNKjboY1n1X2tXuSTVNK3lKsCGJ7cnJS5p+O
 t4O2+MyZ7Pn7n+I6qPU84NHmGIHW1sUcZS4IAaTYkM3LA/wEUf+mhhI2aoQaW9zVwns9
 b88A==
X-Gm-Message-State: AO0yUKVQ/VjP7AW9kmmx1+cbqLsWwl5y7anrkRc354Xh/n+hM4wYOm4J
 ikFMBkRP026x9eC2m/vVF27/mA==
X-Google-Smtp-Source: AK7set9H6v9nr05hTQf2r0CEJ5i21ZnzeRuOt0NDWByly/VLH+B2Nbu3d7bepYZPUftSDEWtZo+IUA==
X-Received: by 2002:a05:6a21:338a:b0:bc:6e88:7f58 with SMTP id
 yy10-20020a056a21338a00b000bc6e887f58mr14503202pzb.51.1675451085184; 
 Fri, 03 Feb 2023 11:04:45 -0800 (PST)
Received: from google.com ([2620:15c:9d:200:7617:a96c:96d2:ed12])
 by smtp.gmail.com with ESMTPSA id
 v14-20020a170902e8ce00b001949c680b52sm1936334plg.193.2023.02.03.11.04.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 11:04:44 -0800 (PST)
Date: Fri, 3 Feb 2023 11:04:42 -0800
From: Ryan Neph <ryanneph@chromium.org>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH] drm/virtio: exbuf->fence_fd unmodified on interrupted wait
Message-ID: <20230203190442.krow5p3bd5u27pg4@google.com>
References: <20230126225815.1518839-1-ryanneph@chromium.org>
 <dee14d1b-fc28-e867-b425-ab11c31d799d@collabora.com>
 <CAJs_Fx4w-a0t9ekHvV55Ys6dYuTsKMa=az9E3UZcsej5AYNdGQ@mail.gmail.com>
 <08560b81-5f97-bd6f-3af0-68cba6bc0bd8@collabora.com>
 <3d347ccc-5867-4a64-a94c-c6141624571e@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3d347ccc-5867-4a64-a94c-c6141624571e@collabora.com>
X-Mailman-Approved-At: Mon, 06 Feb 2023 09:10:58 +0000
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
Cc: Rob Clark <robdclark@chromium.org>, Yiwei Zhang <zzyiwei@chromium.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Gerd Hoffmann <kraxel@redhat.com>, David Airlie <airlied@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Emil Velikov <emil.velikov@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 02, 2023 at 05:24:34AM +0300, Dmitry Osipenko wrote:
> On 2/2/23 05:17, Dmitry Osipenko wrote:
> > On 2/1/23 18:48, Rob Clark wrote:
> >> On Wed, Feb 1, 2023 at 5:28 AM Dmitry Osipenko
> >> <dmitry.osipenko@collabora.com> wrote:
> >>>
> >>> On 1/27/23 01:58, Ryan Neph wrote:
> >>>> An interrupted dma_fence_wait() becomes an -ERESTARTSYS returned
> >>>> to userspace ioctl(DRM_IOCTL_VIRTGPU_EXECBUFFER) calls, prompting to
> >>>> retry the ioctl(), but the passed exbuf->fence_fd has been reset to -1,
> >>>> making the retry attempt fail at sync_file_get_fence().
> >>>>
> >>>> The uapi for DRM_IOCTL_VIRTGPU_EXECBUFFER is changed to retain the
> >>>> passed value for exbuf->fence_fd when returning ERESTARTSYS or EINTR.
> >>>>
> >>>> Fixes: 2cd7b6f08bc4 ("drm/virtio: add in/out fence support for explicit synchronization")
> >>>> Signed-off-by: Ryan Neph <ryanneph@chromium.org>
> >>>> ---
> >>>>
> >>>>  drivers/gpu/drm/virtio/virtgpu_ioctl.c | 9 ++++++---
> >>>>  include/uapi/drm/virtgpu_drm.h         | 3 +++
> >>>>  2 files changed, 9 insertions(+), 3 deletions(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> >>>> index 9f4a90493aea..ffce4e2a409a 100644
> >>>> --- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> >>>> +++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> >>>> @@ -132,6 +132,8 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
> >>>>       uint64_t fence_ctx;
> >>>>       uint32_t ring_idx;
> >>>>
> >>>> +     exbuf->fence_fd = -1;
> >>>> +
> >>>>       fence_ctx = vgdev->fence_drv.context;
> >>>>       ring_idx = 0;
> >>>>
> >>>> @@ -152,8 +154,6 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
> >>>>               ring_idx = exbuf->ring_idx;
> >>>>       }
> >>>>
> >>>> -     exbuf->fence_fd = -1;
> >>>
> >>> Is there any userspace relying on this -1 behaviour? Wouldn't be better
> >>> to remove this offending assignment?
> >>
> >> Looking at current mesa, removing the assignment should be ok (and
> >> more consistent with other drivers).  But I can't say if this was
> >> always true, or that there aren't other non-mesa users, so I can see
> >> the argument for the more conservative uabi change that this patch
> >> went with.
> > 
> > Realistically, Mesa is the only user of this IOCTL. In general, in a
> > such case of doubt, I'll do the UABI change and then wait for complains.
> > If there is a complaint, then the change is reverted. Also will be good
> > to know about existence of other users :)
> > 
> > Given that -1 already wasn't consistently set for all error code paths,
> > it's tempting to see it removed.
> > 
> > The code change of this patch is trivial, hence should fine to keep the
> > -1 if you prefer that, but the patch won't apply cleanly to the stable
> > kernels because of the "exbuf->fence_fd = -1" movement. If stable
> > maintainers won't put effort into rebasing the patch, then better to do
> > the removal and live with a cleaner driver code, IMO.
> 
> Although, there will be a merge conflict either way. I'll give the r-b,
> still removing -1 feels more attractive to me.

I'm not opposed to removing the "exbuf->fence_fd = -1" on error. I made the
v1 patch with extra care to fix the known issue while minimizing the uabi
change, but I'd prefer to see it changed too; thanks for the comments.

I'll follow up with a v2 that removes the modification of "exbuf->fence_fd"
unless the IOCTL succeeds.
