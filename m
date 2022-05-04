Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDC951AAB5
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 19:29:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9111610E5D9;
	Wed,  4 May 2022 17:29:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF8B310ED3E
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 17:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651685362;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6DtzKR9aJWXKQXaXTDvVkj3EbrIwKfckZvxRRNgRE8g=;
 b=MQq/VA2q4cdAFMvXFTgwbQdz+x6him+xa6J16VTHs7zwJQN5P5dqxlA1P2G8FIHFi1AM1x
 PmaxxzP2a9akcrLggncAOz1Orh6N+HtZVZOgDMmPvIbxk0Dk9E/llwyecC3lEVebUiHInX
 suLwVA7QABObyDuCp/wwHuH/3NRG+zU=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-3-YpVlwqlsMvOytDSpdW3jfg-1; Wed, 04 May 2022 13:29:20 -0400
X-MC-Unique: YpVlwqlsMvOytDSpdW3jfg-1
Received: by mail-qv1-f70.google.com with SMTP id
 kd30-20020a056214401e00b0045a96ed0d4aso1354032qvb.17
 for <dri-devel@lists.freedesktop.org>; Wed, 04 May 2022 10:29:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=6DtzKR9aJWXKQXaXTDvVkj3EbrIwKfckZvxRRNgRE8g=;
 b=krCpPpBiWPx1I+uqoVqsxqFZ4Xgrow2jzkTyTxjNcX+QwVkn7WKaH7xxmrOJuwviI9
 +4h9PNCawjHBw1tzNOw4v8DtQX83eUHiP7ywy1JZzTgQsfWjW5KifMjKSAUVe9JCcibH
 u0NjBf1LpBX5NQFGeE7t1hT4fB7Vl23Wf8zbk+RQhVXY/GCpI1khRqBe20KOUTR8Y4ri
 Y/24g8itFj8df1Z/7i0E5e/6CRo4aR2Qf3GQC/HNmRRvczTfJJ/uN0LRy0dXMWCGjAGm
 HsFfIyIm9S0qw+xEZYeRIkNEwYUezF7ysSUR6AplfdFmycrlglD7NbCpP4DizZ4qy2fV
 Z1fA==
X-Gm-Message-State: AOAM532kMoo6+SfN9KNGKnRGdXSD7hBO9UJZtZN4DU1RElAUI+FelFKx
 mvPN6QobTr+/moJGHtw14PEbt1g3A7uDsPgOHCb1s+xpHIpSuiQqnsNaR+HkY1m5fG9gA066ZDb
 nIE8GUHS9pr+Du8wAmvX/oLeYo5tP
X-Received: by 2002:ac8:5e0c:0:b0:2f3:adfd:bd30 with SMTP id
 h12-20020ac85e0c000000b002f3adfdbd30mr8408570qtx.277.1651685360397; 
 Wed, 04 May 2022 10:29:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxjrX58n0IOhBj6Fr3PV/2lw6DGC036Yba/rU/r+Mamk+IeEqM5857Vdlz0oR2XeiB+lpTMJA==
X-Received: by 2002:ac8:5e0c:0:b0:2f3:adfd:bd30 with SMTP id
 h12-20020ac85e0c000000b002f3adfdbd30mr8408554qtx.277.1651685360137; 
 Wed, 04 May 2022 10:29:20 -0700 (PDT)
Received: from [192.168.8.138] (static-71-184-137-158.bstnma.ftas.verizon.net.
 [71.184.137.158]) by smtp.gmail.com with ESMTPSA id
 h23-20020ac85497000000b002f39b99f6b9sm7762181qtq.83.2022.05.04.10.29.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 10:29:19 -0700 (PDT)
Message-ID: <0ca5c54fab5dd7dd5988ae48af779570076800a6.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau/devinit: fix returnvar.cocci warnings
From: Lyude Paul <lyude@redhat.com>
To: Guo Zhengkui <guozhengkui@vivo.com>, Ben Skeggs <bskeggs@redhat.com>, 
 Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>,  dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org,  linux-kernel@vger.kernel.org
Date: Wed, 04 May 2022 13:29:18 -0400
In-Reply-To: <20220504161003.9245-1-guozhengkui@vivo.com>
References: <20220504161003.9245-1-guozhengkui@vivo.com>
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

Will push to the appropriate branch in a little bit

On Thu, 2022-05-05 at 00:09 +0800, Guo Zhengkui wrote:
> Fix the following coccicheck warnings:
> 
> drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gf100.c:71:5-12:
> Unneeded variable: "disable". Return "0ULL" on line 90.
> drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gm107.c:35:5-12:
> Unneeded variable: "disable". Return "0ULL" on line 44.
> drivers/gpu/drm/nouveau/nvkm/subdev/devinit/g98.c:35:5-12:
> Unneeded variable: "disable". Return "0ULL" on line 50.
> 
> Signed-off-by: Guo Zhengkui <guozhengkui@vivo.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/g98.c   | 3 +--
>  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gf100.c | 3 +--
>  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gm107.c | 3 +--
>  3 files changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/g98.c
> b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/g98.c
> index 05729ca19e9a..8977483a9f42 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/g98.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/g98.c
> @@ -32,7 +32,6 @@ g98_devinit_disable(struct nvkm_devinit *init)
>         struct nvkm_device *device = init->subdev.device;
>         u32 r001540 = nvkm_rd32(device, 0x001540);
>         u32 r00154c = nvkm_rd32(device, 0x00154c);
> -       u64 disable = 0ULL;
>  
>         if (!(r001540 & 0x40000000)) {
>                 nvkm_subdev_disable(device, NVKM_ENGINE_MSPDEC, 0);
> @@ -47,7 +46,7 @@ g98_devinit_disable(struct nvkm_devinit *init)
>         if (!(r00154c & 0x00000040))
>                 nvkm_subdev_disable(device, NVKM_ENGINE_SEC, 0);
>  
> -       return disable;
> +       return 0ULL;
>  }
>  
>  static const struct nvkm_devinit_func
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gf100.c
> b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gf100.c
> index 051cfd6a5caf..5b7cb1fe7897 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gf100.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gf100.c
> @@ -68,7 +68,6 @@ gf100_devinit_disable(struct nvkm_devinit *init)
>  {
>         struct nvkm_device *device = init->subdev.device;
>         u32 r022500 = nvkm_rd32(device, 0x022500);
> -       u64 disable = 0ULL;
>  
>         if (r022500 & 0x00000001)
>                 nvkm_subdev_disable(device, NVKM_ENGINE_DISP, 0);
> @@ -87,7 +86,7 @@ gf100_devinit_disable(struct nvkm_devinit *init)
>         if (r022500 & 0x00000200)
>                 nvkm_subdev_disable(device, NVKM_ENGINE_CE, 1);
>  
> -       return disable;
> +       return 0ULL;
>  }
>  
>  void
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gm107.c
> b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gm107.c
> index 4323732a3cb2..8955af2704c7 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gm107.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gm107.c
> @@ -32,7 +32,6 @@ gm107_devinit_disable(struct nvkm_devinit *init)
>         struct nvkm_device *device = init->subdev.device;
>         u32 r021c00 = nvkm_rd32(device, 0x021c00);
>         u32 r021c04 = nvkm_rd32(device, 0x021c04);
> -       u64 disable = 0ULL;
>  
>         if (r021c00 & 0x00000001)
>                 nvkm_subdev_disable(device, NVKM_ENGINE_CE, 0);
> @@ -41,7 +40,7 @@ gm107_devinit_disable(struct nvkm_devinit *init)
>         if (r021c04 & 0x00000001)
>                 nvkm_subdev_disable(device, NVKM_ENGINE_DISP, 0);
>  
> -       return disable;
> +       return 0ULL;
>  }
>  
>  static const struct nvkm_devinit_func

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

