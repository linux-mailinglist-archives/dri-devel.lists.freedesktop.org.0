Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F79A4EA23C
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 23:08:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B6D110E0EA;
	Mon, 28 Mar 2022 21:08:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68D3610E0EA
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 21:08:33 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id a8so31155833ejc.8
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 14:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Gy52q0hk0EOe2yARL7BLFUrhC07yc/LGzLY5hvJWd9Q=;
 b=PspVM/NGsYmmepvwb7RIAfO4OVL1acnHrWJHnRYbUv5gXs6ulNmvXMW2TyCbx5Q7Yk
 RcTiAFURzmyQiGtT6oGZjLVWGifIlTDuAhMA1jenOe/Ptz3rorytIwMJ6Y9H0kribuVR
 NjaBTSekKRGEvfLcvBKtlgYJu4sjoYMv/TRgRND2J+PaeJymdZeJEpUm2ndWoLA12z6a
 0+BxKzfI8SwJ521yviTn1P6Xfn9uwZ9Dc2knM62zK++NGw1xu9YpOev6kwIoarH0ywVl
 C5/NNpMFgBtOIpU4gEwMOduyuUFvYSMvVNeWJBoPg0SXvoZ4uLz5BOXexjGT8HlcE05X
 kcZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Gy52q0hk0EOe2yARL7BLFUrhC07yc/LGzLY5hvJWd9Q=;
 b=6M4ms7ZKOgGPckIMWFamWplrSe3lIcCzDD4LO50Ws3tnAUiUZDc34Z6m40+oRHmVB4
 TeThxEE5TS99SMc5kdh0nO/qu9ZLZsN2MP1g/LOl2bLnYMp3qkK4RwoxlRNG/obAEbUz
 1By4S73TX92wN3kapkVToDwA1xmZE36ZHXwcTxTj9Jejf6zPQk9EpVEAzE2V7XyjCzxi
 5SG3Vb/Gvh/uU5ilSpt0t4yOkDWwqckOLhm5Nev9w0CeqBfcWUm1g/WcdVTD7WdwNYY4
 7JahiMRCGcSCxXBpeEfVlKdFexsOLNKfFLU2zSEdS0WkV1u62VT/MHxCLxAkBCPpO+hE
 Swrw==
X-Gm-Message-State: AOAM532CNJVSr61xvFbEYSWk/wR35Avw7WIIaHKq+fzCokkU8fvBoVys
 MXpcDY4Df0ujikzr6AS+N1TV/N0wv3MUOCDjxHA=
X-Google-Smtp-Source: ABdhPJzF/ITADHePLd7Kqd1BNDEpYjsT1pDu1lP5yP42YMsGsMH5XWm/84sNviYmE9deBAzqOUwNaIpmQ1r5e4feVGc=
X-Received: by 2002:a17:907:3e92:b0:6df:cb08:14f5 with SMTP id
 hs18-20020a1709073e9200b006dfcb0814f5mr31124556ejc.308.1648501711578; Mon, 28
 Mar 2022 14:08:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220327050945.1614-1-xiam0nd.tong@gmail.com>
In-Reply-To: <20220327050945.1614-1-xiam0nd.tong@gmail.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Mon, 28 Mar 2022 14:08:20 -0700
Message-ID: <CAPaKu7Q54aumxEjih3v=xiW3NG7ct1O5UBzyqMQ0bug4svy-5g@mail.gmail.com>
Subject: Re: [PATCH] virtio-gpu: fix a missing check to avoid NULL dereference
To: Xiaomeng Tong <xiam0nd.tong@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Dave Airlie <airlied@redhat.com>,
 "open list:VIRTIO CORE,
 NET AND BLOCK DRIVERS" <virtualization@lists.linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Mar 26, 2022 at 10:09 PM Xiaomeng Tong <xiam0nd.tong@gmail.com> wrote:
>
> 'cache_ent' could be set NULL inside virtio_gpu_cmd_get_capset()
> and it will lead to a NULL dereference by a lately use of it
> (i.e., ptr = cache_ent->caps_cache). Fix it with a NULL check.
>
> Fixes: 62fb7a5e10962 ("virtio-gpu: add 3d/virgl support")
> Signed-off-by: Xiaomeng Tong <xiam0nd.tong@gmail.com>
Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_ioctl.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> index c708bab555c6..b0f1c4d8fd23 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> @@ -579,8 +579,10 @@ static int virtio_gpu_get_caps_ioctl(struct drm_device *dev,
>         spin_unlock(&vgdev->display_info_lock);
>
>         /* not in cache - need to talk to hw */
> -       virtio_gpu_cmd_get_capset(vgdev, found_valid, args->cap_set_ver,
> +       ret = virtio_gpu_cmd_get_capset(vgdev, found_valid, args->cap_set_ver,
>                                   &cache_ent);
> +       if (ret)
> +               return ret;
>         virtio_gpu_notify(vgdev);
>
>  copy_exit:
>
> base-commit: f443e374ae131c168a065ea1748feac6b2e76613
> --
> 2.17.1
>
