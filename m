Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E861F1FA88A
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jun 2020 08:12:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3D536E5D2;
	Tue, 16 Jun 2020 06:12:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com
 [IPv6:2607:f8b0:4864:20::b41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62B026E5D1;
 Tue, 16 Jun 2020 06:11:59 +0000 (UTC)
Received: by mail-yb1-xb41.google.com with SMTP id d13so10244607ybk.8;
 Mon, 15 Jun 2020 23:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lE4bGstBoggLPhv8uJAg4uGkYb5Z9vSRwF4L3Jje+wo=;
 b=MPYFbGpJdUMvtwjGmaIwzG3Iyrhfrd6AwKB1GEr0bqXVBhjaR2bczI97dfYYU+Qrd+
 RsnLtRSc/fJZeNSSmiNzKxBIkV9szGBKwiV4Ub74araqyuNEZBaSMhD2ec8JG2hUHYmp
 l/A0szY/4npdYOTqOj5E/WvTCjD6ZOvlDxdQyw2p39LrF33PYe+Y2Q+dvxVG2evXgdAw
 kMvfkDHgVRDWLMC0/lzGX8RFpZs04so3LLuRk2kYLCt6p8rF+Sfi2n12PKKvQ40Gd4KZ
 jllSxNBKYcH7FwKpG5Cnoulc/mPNInARGsRbMM5kFE0VKOzIcMl3KDYIhx65MHiP3BzW
 wfMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lE4bGstBoggLPhv8uJAg4uGkYb5Z9vSRwF4L3Jje+wo=;
 b=sgUaHDQbmVBM1H6EYZ7THWl20BkIzVBc9MaOLcb+FimiStrjYmTXECwV7Pd8aV2XTi
 sbguZa5B8GdVK6uf8Sbz3Ahp7gORGeg+l82467KA9n5UVyKjKMT+KWPibj9im4lY4E0h
 oSyz9nHQBJd5ARv5Y2hF1G7GZRXXN6hnNS3KyEBykgOGksaZO1XMKGpBoMR2LROpE3u/
 2zE3KhbkoBVSEsriSmi4U53afbPHhYLYqUZ7M5u1Vkfwiha0aUZnU89VwMJDrs/comAG
 /+dJvMxZ7Cef0XdAYTrV7bJj8hAvKGfAuFGqaGs6BMPctZ8H938auMKTHlgTYSw9AxeK
 DgJw==
X-Gm-Message-State: AOAM530OAdshhHGnV0QuW6jCUiCW+45fm3rqarrI0P4KYbfcVUBjYhKz
 lzMTTKkDnRU7xagJYzvXdZzOlLMpJwPKvEYmSJE=
X-Google-Smtp-Source: ABdhPJzm7pCxfaqFQPtBekETYsKJpbYXHIQaJTYd2Y2htl0fodkpebMxxspxfSmn7vXOgp5JviDezUE2Iu1FpMnkCnQ=
X-Received: by 2002:a25:7b41:: with SMTP id w62mr1627864ybc.435.1592287918528; 
 Mon, 15 Jun 2020 23:11:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200614014838.123171-1-pakki001@umn.edu>
In-Reply-To: <20200614014838.123171-1-pakki001@umn.edu>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Tue, 16 Jun 2020 16:11:47 +1000
Message-ID: <CACAvsv7FMUMpZToCQK4QtnaB5muyjk1MW5KOpyrGVtatM-gmsA@mail.gmail.com>
Subject: Re: [PATCH] drm/noveau: fix reference count leak in
 nouveau_debugfs_strap_peek
To: Aditya Pakki <pakki001@umn.edu>
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
Cc: David Airlie <airlied@linux.ie>, ML nouveau <nouveau@lists.freedesktop.org>,
 kjlu@umn.edu, LKML <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>, wu000273@umn.edu
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks,

I've grabbed this, and the others of the same sort you sent out at the
same time.

Ben.

On Mon, 15 Jun 2020 at 17:29, Aditya Pakki <pakki001@umn.edu> wrote:
>
> nouveau_debugfs_strap_peek() calls pm_runtime_get_sync() that
> increments the reference count. In case of failure, decrement the
> ref count before returning the error.
>
> Signed-off-by: Aditya Pakki <pakki001@umn.edu>
> ---
>  drivers/gpu/drm/nouveau/nouveau_debugfs.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_debugfs.c b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> index 63b5c8cf9ae4..8f63cda3db17 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> @@ -54,8 +54,10 @@ nouveau_debugfs_strap_peek(struct seq_file *m, void *data)
>         int ret;
>
>         ret = pm_runtime_get_sync(drm->dev->dev);
> -       if (ret < 0 && ret != -EACCES)
> +       if (ret < 0 && ret != -EACCES) {
> +               pm_runtime_put_autosuspend(drm->dev->dev);
>                 return ret;
> +       }
>
>         seq_printf(m, "0x%08x\n",
>                    nvif_rd32(&drm->client.device.object, 0x101000));
> --
> 2.25.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
