Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB2C5BD62E
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 23:13:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3512610E12A;
	Mon, 19 Sep 2022 21:13:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E62D10E12A
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 21:13:17 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id r18so1549904eja.11
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 14:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=bhPmmvgwrI1UWM0Mt5gyQZnNHupU9etq5Dz6jZIcg4M=;
 b=mejDcyLSWZX5mTMuwttKSMZJm/QXJls6I8T91VDCeShs4ASYX1lvxUPBvTC3zrre4q
 All/qoUAXzFIgQJ4R7mPOegXTUDzQ2Kk0QO+zGqSftVDPMFjE9rDOKC6kEtTaefrbyzJ
 3OYEsoyVN0+wUQTC0yPVPfclgxmA9DYEAYu3amjVekoKyDfz+7Xy2OqePk1BQ2SQLcgc
 netRXOM6oxDD1Q2oNxcEYcWljqaceOfKeLLZsF8F69hkNa4/OS/oWDkfMD2lnCXRSecH
 MTXI2/iv2VNj3MRrI8NjCwUeyWV+xUl63IntLIyiHz0sh32s9dMbyn7M87+Y4R2oOkb3
 ChUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=bhPmmvgwrI1UWM0Mt5gyQZnNHupU9etq5Dz6jZIcg4M=;
 b=Vj5xE3BzB1zOCIFCR3Tprd7lAYU3MEBQOG0Eh6PYMnobHyIFwwD91R/6vjHBtho4F+
 zMhacj4GTOBT16IpwlE/clsvhd42P0KYrSnx6zSp+7I+AbKWA+h8MbfeOo0gzL+WKoLB
 dLwIXGENQA98bNkkXrjtm4HlfFF8gL1XWM2H4P/I0atfoSv9gSeEwImV2MvtrTaPL+Pc
 ElK032y0o+D+Gn1QYahU4ys731oq2EE80nZwlfhE+4HkAE4rBJIzkMI64K/ewnmizP6e
 rFjgRPpgIAG9WZsra6avQUpQXjJmFMjQHdJz6Y3xe34+g5TrQFPwRFiRBwRhhQz3ii/6
 4Grw==
X-Gm-Message-State: ACrzQf1KyIqyyTqkmnZ0VstyNnmj/deRarKsXY/rda0mvtSk+An8gUzl
 9w9XfIbgXlZwemLkVckDX1I11E4SW403NmyJJ9k=
X-Google-Smtp-Source: AMsMyM7zA8miSzkjN6wj3Wenio+9x9e3vwc1VxojIm7Bo9m4q5oppQbWwS1UZxQZlPWbppFokj1RitvLKfh3ykEyn3E=
X-Received: by 2002:a17:907:6d09:b0:780:aef0:694c with SMTP id
 sa9-20020a1709076d0900b00780aef0694cmr12570553ejc.717.1663621995972; Mon, 19
 Sep 2022 14:13:15 -0700 (PDT)
MIME-Version: 1.0
References: <YygN7jY0GdUSQSy0@kili>
In-Reply-To: <YygN7jY0GdUSQSy0@kili>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Mon, 19 Sep 2022 14:13:04 -0700
Message-ID: <CAPaKu7RbWXTziR0pCeqgYiq-hVdayG8gh_hd_t0gu1swZtA9uw@mail.gmail.com>
Subject: Re: [PATCH v2] virtio-gpu: fix shift wrapping bug in
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
 Nicholas Verne <nverne@chromium.org>, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Sep 18, 2022 at 11:36 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
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
> v2: Style change.  Use BIT_ULL().
Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
>
>  drivers/gpu/drm/virtio/virtgpu_ioctl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> index 3b1701607aae..5d05093014ac 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> @@ -47,7 +47,7 @@ static int virtio_gpu_fence_event_create(struct drm_device *dev,
>         struct virtio_gpu_fence_event *e = NULL;
>         int ret;
>
> -       if (!(vfpriv->ring_idx_mask & (1 << ring_idx)))
> +       if (!(vfpriv->ring_idx_mask & BIT_ULL(ring_idx)))
>                 return 0;
>
>         e = kzalloc(sizeof(*e), GFP_KERNEL);
> --
> 2.35.1
>
