Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7471A383B78
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 19:39:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ACA16EA1C;
	Mon, 17 May 2021 17:39:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com
 [IPv6:2607:f8b0:4864:20::c34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D2DB6EA1C;
 Mon, 17 May 2021 17:39:56 +0000 (UTC)
Received: by mail-oo1-xc34.google.com with SMTP id
 l25-20020a4a35190000b029020a54735152so1649477ooa.4; 
 Mon, 17 May 2021 10:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ec4sBOvG5BiTPHnGCY0JZake08DLljj+YNJ97mOQNxI=;
 b=cJFsKuMG1megg7WR0JtVZ77rgO/ffhegbh5X5R82OA420QsPebmOqiZLvyIV/RxAEp
 Y8JE/4l4aBgCIpg900VImiB4ZWJMyhV7RZ0Nzinj7pBdv85wH/3dUZ6XqbeSfT+ag7wg
 4YXZM+vRv+vNjSAHnZ4SUReL0e3adUXoRmY58TCglsCdcTDiE7/ekn9klligXN/3wZ8w
 Tr7gruhEwMSI9bf2mceYJyDrthdoZE5Mp92HrAWJoMxJ26kKt7vQjf+BAeh8Mgm4FkRV
 hHpVAe9+lqTJi44a8QFVa1uNx1f62hPpDlKlkzIC6Bn2Q+KpI7hGGkvMAS+Bv/UovQa0
 c8HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ec4sBOvG5BiTPHnGCY0JZake08DLljj+YNJ97mOQNxI=;
 b=mcvKh5eIgs/tuMzWp43jOUbG19zNF+Mp1HlYIT2wDxgZXnlrpBvA/fvaOJam0O0/x3
 XNN+Qxm5ysC20LH41DoKuZywxmkbg2q2QSTOZm/lwYbFr/hZ2OPMr/rXjotGsIBvgByg
 8A+/BCQ8/N2DJeH6zLQIVqrqfbxVe5FNRwZlcZ7qwKwja3VGjRRNDCUeFIHXfieedlct
 Vy5C10IPOZ3Z2gTYMXDefIRoj0J7ol7NVhgvBqP4PRTIY//ec1a4Zw0iuTCiNIXYxg90
 I2FdiTcuo9dvP4kwMQtLkQ0MDjdXY2QYey1laHIIzWkMVr+pcnKPg7IPMu41w3PfgBWi
 cptg==
X-Gm-Message-State: AOAM533PbbLg8uQ45ukir67hhD2N7chCnR5kmYZMiH6UzB4k94Z4rwl+
 vPSOjcTfbiLsGnUbtY9WE6hSY/zQX2YUeFqFIIY=
X-Google-Smtp-Source: ABdhPJybtZDTQ8GQ1qN/+nRmMebD4QN5H/NEF/bDyDqCdi0/ToXU0UgVsyKzKpl515Wbzu2rwaw+uJvK+swGh58kP2I=
X-Received: by 2002:a4a:d004:: with SMTP id h4mr822081oor.90.1621273195376;
 Mon, 17 May 2021 10:39:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210512142648.666476-1-andrey.grodzovsky@amd.com>
 <20210512142648.666476-13-andrey.grodzovsky@amd.com>
 <0e13e0fb-5cf8-30fa-6ed8-a0648f8fe50b@amd.com>
 <a589044b-8dac-e573-e864-4093e24574a3@amd.com>
In-Reply-To: <a589044b-8dac-e573-e864-4093e24574a3@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 17 May 2021 13:39:44 -0400
Message-ID: <CADnq5_NGL0eBabd8s3yvt6pMYb8w81gE=C7xSGay5Lh9sW08Dw@mail.gmail.com>
Subject: Re: [PATCH v7 12/16] drm/amdgpu: Fix hang on device removal.
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Greg KH <gregkh@linuxfoundation.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Bjorn Helgaas <helgaas@kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Linux PCI <linux-pci@vger.kernel.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

On Mon, May 17, 2021 at 10:40 AM Andrey Grodzovsky
<andrey.grodzovsky@amd.com> wrote:
>
> Ping
>
> Andrey
>
> On 2021-05-14 10:42 a.m., Andrey Grodzovsky wrote:
> > Ping
> >
> > Andrey
> >
> > On 2021-05-12 10:26 a.m., Andrey Grodzovsky wrote:
> >> If removing while commands in flight you cannot wait to flush the
> >> HW fences on a ring since the device is gone.
> >>
> >> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> >> ---
> >>   drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c | 16 ++++++++++------
> >>   1 file changed, 10 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> >> b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> >> index 1ffb36bd0b19..fa03702ecbfb 100644
> >> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> >> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> >> @@ -36,6 +36,7 @@
> >>   #include <linux/firmware.h>
> >>   #include <linux/pm_runtime.h>
> >> +#include <drm/drm_drv.h>
> >>   #include "amdgpu.h"
> >>   #include "amdgpu_trace.h"
> >> @@ -525,8 +526,7 @@ int amdgpu_fence_driver_init(struct amdgpu_device
> >> *adev)
> >>    */
> >>   void amdgpu_fence_driver_fini_hw(struct amdgpu_device *adev)
> >>   {
> >> -    unsigned i, j;
> >> -    int r;
> >> +    int i, r;
> >>       for (i = 0; i < AMDGPU_MAX_RINGS; i++) {
> >>           struct amdgpu_ring *ring = adev->rings[i];
> >> @@ -535,11 +535,15 @@ void amdgpu_fence_driver_fini_hw(struct
> >> amdgpu_device *adev)
> >>               continue;
> >>           if (!ring->no_scheduler)
> >>               drm_sched_fini(&ring->sched);
> >> -        r = amdgpu_fence_wait_empty(ring);
> >> -        if (r) {
> >> -            /* no need to trigger GPU reset as we are unloading */
> >> +        /* You can't wait for HW to signal if it's gone */
> >> +        if (!drm_dev_is_unplugged(&adev->ddev))
> >> +            r = amdgpu_fence_wait_empty(ring);
> >> +        else
> >> +            r = -ENODEV;
> >> +        /* no need to trigger GPU reset as we are unloading */
> >> +        if (r)
> >>               amdgpu_fence_driver_force_completion(ring);
> >> -        }
> >> +
> >>           if (ring->fence_drv.irq_src)
> >>               amdgpu_irq_put(adev, ring->fence_drv.irq_src,
> >>                          ring->fence_drv.irq_type);
> >>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
