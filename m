Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D481686C1
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 19:37:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00A7E6E107;
	Fri, 21 Feb 2020 18:37:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81A3D6E107
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 18:37:27 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id x1so3403533iop.7
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 10:37:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5KIFkzcRxxxbL40fHIg8b82jUb9ZF6NPqoXzSqpl30I=;
 b=ivUXFCDCeSQkftsFoJCHtTUMZuNNg4+gGIe+pfHKX/yEcXsJ5z8lPgSWPmMnJJQhxB
 eLVVD9wnoqpWviKMKpEQHgBwWJ3LcVj6DzpIeqbzBISOri9QE2uYFBHmR2k9T1unFCec
 CvECtUe211tTaZ7bgFSK2QDQb2k6V5TqznyoFKBOsaj8dNH1nUaHadv4+t9sx4+MP6lF
 5h6fN3RiAEJu7o0Ehe3o1lMgy6Hd4k9jAnXoTT1k+olExovalcMFLz2HAIBa2W4yrtfm
 iPg5FYtf7Fii0jghrPtInC3L+XdDD+J6R+D635cYXX0zu0Np0jfrsm8qkfNTajdlkVe1
 F/Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5KIFkzcRxxxbL40fHIg8b82jUb9ZF6NPqoXzSqpl30I=;
 b=fY+1qdZwiLxQO0Ib7x/k2DKPp6DyWYdWrKZ0rBzOOm2R/ip0K3zw0wDADSdRGKKDHa
 kT88K4p8NqofAeMEL6/FGTUV4ZqZc0q3qehQP2RM3Ni6dXVofKX8MjkIFHCKcF9xjzwh
 po/aCEop1I7sVVfbGR1m5KbVm1wnjiJ+9abP7uCSTS7k9L7wn9qEfF8vZbrh+ZxQ8rEo
 2IZZYtY6VbxhDQVtjiUed/mKzW91z17KIrbUf7N+C+u/JRMIAxdgwTcEj/Zad1g+xamz
 8gytXa42Nen0UTGELWOgbHwnIlrTFVLh0WFKjLfnwZByF3VhPutSPBNfEZlpYp6h+4uz
 YjEw==
X-Gm-Message-State: APjAAAVQS3360wJMayaNNDc1/dx5uBlZ+6VIfRLVZgXo35k2UVbyi2H7
 SzC2xHpWOV+MgtbKUxJH/EuxFasYBnCpI+0Ztno=
X-Google-Smtp-Source: APXvYqx2C4hinK+2pMOQNrGEYmS8FDmU2woCvrc3mLkZwd3Tqf1SgxESGPRz8CaHdx9dGcd+MyVafsk+cV55iFpx4+w=
X-Received: by 2002:a5d:8146:: with SMTP id f6mr31460123ioo.93.1582310246750; 
 Fri, 21 Feb 2020 10:37:26 -0800 (PST)
MIME-Version: 1.0
References: <20200220225319.45621-1-jbates@chromium.org>
In-Reply-To: <20200220225319.45621-1-jbates@chromium.org>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Fri, 21 Feb 2020 10:37:15 -0800
Message-ID: <CAPaKu7TH+f9w04ouW1qsj9u_rZ22XK_QrmniicC-KUY6p=HeCA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/virtio: fix resource id creation race
To: John Bates <jbates@chromium.org>
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
Cc: David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 21, 2020 at 3:14 AM John Bates <jbates@chromium.org> wrote:
>
> The previous code was not thread safe and caused
> undefined behavior from spurious duplicate resource IDs.
> In this patch, an atomic_t is used instead. We no longer
> see any duplicate IDs in tests with this change.
>
> Fixes: 16065fcdd19d ("drm/virtio: do NOT reuse resource ids")
> Signed-off-by: John Bates <jbates@chromium.org>
Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_object.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
> index 017a9e0fc3bb..890121a45625 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_object.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_object.c
> @@ -42,8 +42,8 @@ static int virtio_gpu_resource_id_get(struct virtio_gpu_device *vgdev,
>                  * "f91a9dd35715 Fix unlinking resources from hash
>                  * table." (Feb 2019) fixes the bug.
>                  */
> -               static int handle;
> -               handle++;
> +               static atomic_t seqno = ATOMIC_INIT(0);
> +               int handle = atomic_inc_return(&seqno);
>                 *resid = handle + 1;
resid 1 is (was) discriminated :D

>         } else {
>                 int handle = ida_alloc(&vgdev->resource_ida, GFP_KERNEL);
> --
> 2.25.0.265.gbab2e86ba0-goog
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
