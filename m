Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5244E698C
	for <lists+dri-devel@lfdr.de>; Thu, 24 Mar 2022 20:54:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2411089E1D;
	Thu, 24 Mar 2022 19:54:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACDB289CB3
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 19:54:19 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id bg10so11332875ejb.4
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 12:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K9sl01AafDLfHeJ8+rUYL1jruEZ6Cs2sfqWkv5Qf36M=;
 b=kJbLa8fVZEm9Lomxaz580vFzf/vK0kM5gxcSSAlcYViTg3RoiXMMeXAUijr5uWypMX
 YF/k5dd42BjL/g0wTFXTLeTJhQXBeoSpv16UwXSYoApKghKarShWRBtnT/TakPd3lp1I
 kjCD+CQJ0R0m0N65cjghEh6OEf5lB/OZ8Yc2tHYWPoj7DsFtqdQL5dVNog8kPYQZxRrb
 ttTSGTMLUGwO2YuXPx5kEX21/+vCv8H/rTzwtOkhkEYizolaVyP+TI7Rr+mAWMk0PrC2
 KqV6wmgGzMns38SEmoXzcf777FSIcQGcMbejxBv+dWWmJyNcLDy91Jm5XVmFsxMrNUO1
 LZEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K9sl01AafDLfHeJ8+rUYL1jruEZ6Cs2sfqWkv5Qf36M=;
 b=NggQCZ93v/jqfYsIxRyZ5iGS2Hfo1Kyt9exhbQk4cZpL1Bgz5IwxWkVqq7rlaB1pyt
 TClYwTNNl5nC1hSIfyC93G6z6KfwhP5YNvEHgNEuOtvIoj7DaCYPsCvMK8EnYujAcsv5
 0GicdSf7cMVTFFmT87kT75MeSQuPzKQ7D42S5WQ8pGIZfwSSWXD393z2zLtfeHpiJZ/2
 weTDiQCn/gF5hUN5LsVs58/0gwMt0vUsu4HyT6xYhiC3zE1bJVnjw11Ph6s5yE0Jx2ze
 o50jthzd6hGKOltkPylg8ik81Wk7+5PfFgwbg9gnR9UV2TvbzuAR5DtQDCbsShAWyUzS
 mBHA==
X-Gm-Message-State: AOAM5309hizIYY+HAB06YXi6N3JpV4Ff+4XjIacymbZtk5Cx9RozrgP8
 myYLHQg/kz43aaawr/YzqAygy1gq0MYmjud7juY=
X-Google-Smtp-Source: ABdhPJxMqUgL9xIKmM0ThULgMmo4gdtf6W2OaS3j8SXt35yUtFmr9WCOJe5pu921op6RnmuJhqPSHv1cO1XB6/gQv88=
X-Received: by 2002:a17:907:2ce3:b0:6df:d819:8b98 with SMTP id
 hz3-20020a1709072ce300b006dfd8198b98mr7797833ejc.130.1648151657995; Thu, 24
 Mar 2022 12:54:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220322081844.1602-1-liuzixian4@huawei.com>
In-Reply-To: <20220322081844.1602-1-liuzixian4@huawei.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Thu, 24 Mar 2022 12:54:07 -0700
Message-ID: <CAPaKu7QgGH2jhvBYZvOpyMXDf6xS_uvNkGADfdjHb4GVSCFeFg@mail.gmail.com>
Subject: Re: [PATCH] drm/virtio: fix NULL pointer dereference in
 virtio_gpu_conn_get_modes
To: Liu Zixian <liuzixian4@huawei.com>
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
Cc: linfeilong@huawei.com, ML dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:VIRTIO CORE,
 NET AND BLOCK DRIVERS" <virtualization@lists.linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 23, 2022 at 4:01 AM Liu Zixian <liuzixian4@huawei.com> wrote:
> diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm/virtio/virtgpu_display.c
> index 5b00310ac..f73352e7b 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_display.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_display.c
> @@ -179,6 +179,8 @@ static int virtio_gpu_conn_get_modes(struct drm_connector *connector)
>                 DRM_DEBUG("add mode: %dx%d\n", width, height);
>                 mode = drm_cvt_mode(connector->dev, width, height, 60,
>                                     false, false, false);
> +               if (!mode)
> +                       return count;
>                 mode->type |= DRM_MODE_TYPE_PREFERRED;
>                 drm_mode_probed_add(connector, mode);
>                 count++;
Can we avoid early return here?  Something like

  mode = drm_cvt_mode(...);
  if (mode) {
    DRM_DEBUG("add mode: %dx%d\n", width, height);
    mode->type |= DRM_MODE_TYPE_PREFERRED
    drm_mode_probed_add(connector, mode);
    count++;
  }

is more future proof.

> --
> 2.33.0
>
