Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 794965315EA
	for <lists+dri-devel@lfdr.de>; Mon, 23 May 2022 22:11:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42A1E10E8DD;
	Mon, 23 May 2022 20:11:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68E5510E9C4
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 20:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653336682;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aeYANgG6QafvRhsuT7XrX05LA9JnznyUmzj/VsLlMdA=;
 b=Kf+6TbvUMxjf2d0ilZcko+PMsB3sj132OXRhbCVyWXcCzlMzBLQCL+ClM4zHCJV/0qtNPq
 gZOXmgq7DcsR4YqoDotMXZWwRYc1Tw05XK9ipbEQpkAwA4SB9yKywbBTD34KfWn+rRuuh4
 3A66S6QgphVx8Ct1r3EwYy0SPddpr+s=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-447-GBzWeTtiOfaIwR1IuBzuvA-1; Mon, 23 May 2022 16:11:15 -0400
X-MC-Unique: GBzWeTtiOfaIwR1IuBzuvA-1
Received: by mail-qk1-f197.google.com with SMTP id
 f20-20020a05620a12f400b006a36317a58aso5309163qkl.6
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 13:11:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=aeYANgG6QafvRhsuT7XrX05LA9JnznyUmzj/VsLlMdA=;
 b=FoQi1LHbVinQTqmcEwq4sicNNilARMNJN+CcbekOsC6Z+kyQ45Gmicgm4mNKXOZC/r
 qKy8gw6jU+aGx/68VyM/uX+MfKSZWdNPsDohlVGdQLnsolM4en1doR2ZYQJfnEwqHFmE
 k3lZqD/acinQ0p9b3QiL6/q5poNN3rUK9Gsg4F3QmfNSC9gcwXi2NN0cUIlXWuVCp6WX
 JE5JYTCoWPQAgkSfd6FwuKegOOWWNgHXvpiHVevXlsZ0zHBz8r+hpHrG2ITH8YbJ4g4j
 jtZEutCHKrJf2cVPmdZjHuGkPRfJfFKItgNXIn8hC0x68PgQQemoIJ4FeJ7Zxw+ru3jw
 NM1w==
X-Gm-Message-State: AOAM531RRpAQPYQ4TueI8/coV1tIet4C8cxJCedDjblfxdcHO+x8VZSM
 AmEbd+tMqCPB22u/AGxPZaoIZaYFDcTsA8O5vjB1IeDIvrBPfpsGOgYlmKWcxc0jX6FSU9z6jM4
 QomzNRh3dPz+qm1cyrWoKp8m87IUy
X-Received: by 2002:a0c:ea34:0:b0:456:319f:f3aa with SMTP id
 t20-20020a0cea34000000b00456319ff3aamr18692668qvp.18.1653336670105; 
 Mon, 23 May 2022 13:11:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzIbD5TagG8AM+h1aWON0DBIBdEu6ADrvmmcaZwyFRUjX0un+O0w38rbCqt0Cq79b62hJyx0w==
X-Received: by 2002:a0c:ea34:0:b0:456:319f:f3aa with SMTP id
 t20-20020a0cea34000000b00456319ff3aamr18692652qvp.18.1653336669916; 
 Mon, 23 May 2022 13:11:09 -0700 (PDT)
Received: from [192.168.8.138] (static-71-184-137-158.bstnma.ftas.verizon.net.
 [71.184.137.158]) by smtp.gmail.com with ESMTPSA id
 c15-20020ac81e8f000000b002f39b99f69fsm5231205qtm.57.2022.05.23.13.11.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 13:11:09 -0700 (PDT)
Message-ID: <4212b4d087c68a5c32e92cfe2609221a5ecac71d.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau/tegra: remove needless NULL check
From: Lyude Paul <lyude@redhat.com>
To: Guo Zhengkui <guozhengkui@vivo.com>, Ben Skeggs <bskeggs@redhat.com>, 
 Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>,  Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Robin Murphy
 <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Joerg Roedel
 <jroedel@suse.de>, Lu Baolu <baolu.lu@linux.intel.com>, "open list:DRM
 DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS" <dri-devel@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>, "open list:TEGRA ARCHITECTURE SUPPORT"
 <linux-tegra@vger.kernel.org>,  open list <linux-kernel@vger.kernel.org>
Date: Mon, 23 May 2022 16:11:07 -0400
In-Reply-To: <20220519072950.128268-1-guozhengkui@vivo.com>
References: <20220519072950.128268-1-guozhengkui@vivo.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Cc: zhengkui_guo@outlook.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will push to the appropriate branch in a moment

On Thu, 2022-05-19 at 15:29 +0800, Guo Zhengkui wrote:
> There has already been NULL check in clk_prepare_enable() and
> clk_disable_unprepare(), so remove needless NULL check before
> calling them.
> 
> Signed-off-by: Guo Zhengkui <guozhengkui@vivo.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c | 14 +++++---------
>  1 file changed, 5 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
> b/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
> index 2ed528c065fa..ac9e122586bc 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
> @@ -41,11 +41,9 @@ nvkm_device_tegra_power_up(struct nvkm_device_tegra
> *tdev)
>         ret = clk_prepare_enable(tdev->clk);
>         if (ret)
>                 goto err_clk;
> -       if (tdev->clk_ref) {
> -               ret = clk_prepare_enable(tdev->clk_ref);
> -               if (ret)
> -                       goto err_clk_ref;
> -       }
> +       ret = clk_prepare_enable(tdev->clk_ref);
> +       if (ret)
> +               goto err_clk_ref;
>         ret = clk_prepare_enable(tdev->clk_pwr);
>         if (ret)
>                 goto err_clk_pwr;
> @@ -70,8 +68,7 @@ nvkm_device_tegra_power_up(struct nvkm_device_tegra *tdev)
>  err_clamp:
>         clk_disable_unprepare(tdev->clk_pwr);
>  err_clk_pwr:
> -       if (tdev->clk_ref)
> -               clk_disable_unprepare(tdev->clk_ref);
> +       clk_disable_unprepare(tdev->clk_ref);
>  err_clk_ref:
>         clk_disable_unprepare(tdev->clk);
>  err_clk:
> @@ -87,8 +84,7 @@ nvkm_device_tegra_power_down(struct nvkm_device_tegra
> *tdev)
>         int ret;
>  
>         clk_disable_unprepare(tdev->clk_pwr);
> -       if (tdev->clk_ref)
> -               clk_disable_unprepare(tdev->clk_ref);
> +       clk_disable_unprepare(tdev->clk_ref);
>         clk_disable_unprepare(tdev->clk);
>         udelay(10);
>  

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

