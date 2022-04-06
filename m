Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 905D74F6419
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 18:06:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5F2210E40D;
	Wed,  6 Apr 2022 16:06:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52B9F10E40D;
 Wed,  6 Apr 2022 16:06:34 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id h4so3905600wrc.13;
 Wed, 06 Apr 2022 09:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c6IFtJoccYowp2SPFkLYl7fBTN/gyRfnIU15c9wrgHI=;
 b=grM1c17B0+b10VDghHxy8oPE55Scxin6NssMWayxOjNDQoqugsgbLfxFLwL8WGZxT0
 nQKyhL51D6/3Zvs37Htp607mvGk3e4EqwSuojcAvtXGfITqyx2pbWetI2tPgjx2s3Nq0
 L2AxpxCPyahMH9H19Uv9QemuQi7JT+OpwJvACkjwKZaJYDcWMCXBGPgqOFNldl6gFV2h
 NOwQHgJoADY7iqKi4gUlYYFbMg9PhKfCY1KVaaQY+BogPv8zofz36D/LGuH9WsEmsXB0
 19rRpPGUf1LyuIz3lPAwY/Gkbs57SYBCjmbpWCdNYI5wl4JiwnUuUBFDXTLXx7sk7Xs4
 DA4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c6IFtJoccYowp2SPFkLYl7fBTN/gyRfnIU15c9wrgHI=;
 b=hDte1QvtN+Tj9X7ey3Knv0nnfvn89PybB16In+vfhzdDlLuhvtAJsl82J0qa2u0c0i
 4TXcmE4XUO7tpYXh7Si71U3uPTb56XbGhXUr+dn7NlC8UL2bCi9D9AJh/nRVBc8wzPvG
 nIAcCH2QrsF2DkBNM5sahVY4rqdzqcJQFAASSSgm4PLQMf6qjhWZ3v01uYFGC1HA5lB5
 dpkIu84tokUz4UohpCSBQuGmYOSdgBfb6GlhlTlIYEu5IWqjy6ky1dMj4m4SQzMMD2br
 ToobkU9p6LCKoYBPyIAK8AJDHBxvtcSx8+jwWSlq/BlLhgPVroOCPfpUMfEYNAlMfUFr
 UnBw==
X-Gm-Message-State: AOAM533IZOzh+LyI5Opkf2X9SRGiDy/FqJADFVxynYfnY+8/SzjqHJB3
 WgaaKZFdAv7fdJxZyDxOrGY1vdWXtMn+di/CIgA=
X-Google-Smtp-Source: ABdhPJwtoCa6agm4ae7x3ltTqzFBJvsMB5pyzwvMFqAyEOix6fNa73x/0iOZLqFrV58zC6dyFRZPjkcrKrbc4E9GDio=
X-Received: by 2002:a5d:6dad:0:b0:204:154d:c93d with SMTP id
 u13-20020a5d6dad000000b00204154dc93dmr7070237wrs.574.1649261192659; Wed, 06
 Apr 2022 09:06:32 -0700 (PDT)
MIME-Version: 1.0
References: <5ab4f4574d7f3e042261da702d493ee40d003356.1649168268.git.robin.murphy@arm.com>
In-Reply-To: <5ab4f4574d7f3e042261da702d493ee40d003356.1649168268.git.robin.murphy@arm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 6 Apr 2022 09:07:26 -0700
Message-ID: <CAF6AEGvgfqFrXHji6R1sTsxOFSdvA7HQSxa1QCXWVmEL1qcK9w@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Stop using iommu_present()
To: Robin Murphy <robin.murphy@arm.com>
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 5, 2022 at 7:17 AM Robin Murphy <robin.murphy@arm.com> wrote:
>
> Even if some IOMMU has registered itself on the platform "bus", that
> doesn't necessarily mean it provides translation for the device we
> care about. Replace iommu_present() with a more appropriate check.
>
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>

Reviewed-by: Rob Clark <robdclark@gmail.com>

> ---
>  drivers/gpu/drm/msm/msm_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index affa95eb05fc..9c36b505daab 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -274,7 +274,7 @@ bool msm_use_mmu(struct drm_device *dev)
>         struct msm_drm_private *priv = dev->dev_private;
>
>         /* a2xx comes with its own MMU */
> -       return priv->is_a2xx || iommu_present(&platform_bus_type);
> +       return priv->is_a2xx || device_iommu_mapped(dev->dev);
>  }
>
>  static int msm_init_vram(struct drm_device *dev)
> --
> 2.28.0.dirty
>
