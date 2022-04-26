Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77BC8510682
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 20:15:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89BE910E6CD;
	Tue, 26 Apr 2022 18:15:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6734310E6B8
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 18:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650996944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5eKECW1gDIo2Gn5I+8eJ141sOgh784fCDwHXtewOPik=;
 b=WnYJPFovWzmX5IT3WNoM03+055IDD65N38FxObcXVB/PV+eGcGosnA4+rYqH3ikVrChp2I
 oNfG8Gc4KRtl9S3Tw0HboO9Rs8G1PiGRbUkHyilES0kz+ucCh2NRcf/PBmD9X47fXKvVCY
 4GqZ+ejRzDiUy2Bn5X9yJY5i7AcksBM=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-zfXiGb6KPAul92WiNvHCJw-1; Tue, 26 Apr 2022 14:15:43 -0400
X-MC-Unique: zfXiGb6KPAul92WiNvHCJw-1
Received: by mail-qv1-f70.google.com with SMTP id
 g10-20020a0562141cca00b00456332167ffso6291594qvd.13
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 11:15:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=5eKECW1gDIo2Gn5I+8eJ141sOgh784fCDwHXtewOPik=;
 b=coVqIfU6iTS05wAB12/N1vpRkaJqVx8VLH5L/7IjTxtU5hdk8k1mocp4DQJF//NMex
 cR4JurGBZO3oCTu8VpUEOLFYxYmg7udmdITcuBjWNvpxLpndDDgdQLIL33x3mMbArCUT
 J1j+IgYhjLTTWbYaEBpHFx242SLZ2CXfw4sj4amyIwgSofCZQx0mugqT60UjU/sw6ohf
 J/Fuxc09e4iKI3u4WWF3CaBVFsY5O6k5SCvQjpLrFh84ZnluWyRHhFggZ0DL7U60O8f4
 0gX8j6FoXVgg7qiR9/uRrzIF6yxp6qJ6z2qiW0QQHtR6fZKYmimVf9xrZqfvgIHfOqBC
 Bfow==
X-Gm-Message-State: AOAM530Tjqy1DsaQFc0pSEzF1xqrT3kQUjnB4SXhu5LnfCMU22hdoiV3
 0SJPf2iNTYXvA0AQ6Y2ja7gLfT/UGUoHx8SDe2KnSG5yRdJcCUJhKFRIIzPDSl6sjQTZVhubx80
 HdXhLx+EScMuq6pK3WmHjGn7ieu67
X-Received: by 2002:a05:622a:13:b0:2f3:64ce:c72a with SMTP id
 x19-20020a05622a001300b002f364cec72amr8826939qtw.620.1650996942689; 
 Tue, 26 Apr 2022 11:15:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1e4/M/au78sjUpZYL6OJmbQ+wWx6rD4GopCcbIHg0y7+HfqjhyaKxpYxh4L66r+tD+2xJhA==
X-Received: by 2002:a05:622a:13:b0:2f3:64ce:c72a with SMTP id
 x19-20020a05622a001300b002f364cec72amr8826912qtw.620.1650996942425; 
 Tue, 26 Apr 2022 11:15:42 -0700 (PDT)
Received: from [192.168.8.138] (static-71-184-137-158.bstnma.ftas.verizon.net.
 [71.184.137.158]) by smtp.gmail.com with ESMTPSA id
 a1-20020a05622a02c100b002f342ccc1c5sm8103969qtx.72.2022.04.26.11.15.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 11:15:41 -0700 (PDT)
Message-ID: <6fb203ca8182c50156fdc7655146c803a3f22b05.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau: fix returnvar.cocci warning
From: Lyude Paul <lyude@redhat.com>
To: Guo Zhengkui <guozhengkui@vivo.com>, Ben Skeggs <bskeggs@redhat.com>, 
 Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>, "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO
 GPUS" <dri-devel@lists.freedesktop.org>, "open list:DRM DRIVER FOR NVIDIA
 GEFORCE/QUADRO GPUS" <nouveau@lists.freedesktop.org>, open list
 <linux-kernel@vger.kernel.org>
Date: Tue, 26 Apr 2022 14:15:40 -0400
In-Reply-To: <20220425114701.7182-1-guozhengkui@vivo.com>
References: <20220425114701.7182-1-guozhengkui@vivo.com>
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

Will push upstream in a moment

On Mon, 2022-04-25 at 19:47 +0800, Guo Zhengkui wrote:
> Fix the following coccicheck warning:
> drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gt215.c:71:5-12:
> Unneeded variable: "disable". Return "0ULL" on line 85.
> 
> Signed-off-by: Guo Zhengkui <guozhengkui@vivo.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gt215.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gt215.c
> b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gt215.c
> index dc026ac1b595..3d0ab86c3115 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gt215.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gt215.c
> @@ -68,7 +68,6 @@ gt215_devinit_disable(struct nvkm_devinit *init)
>         struct nvkm_device *device = init->subdev.device;
>         u32 r001540 = nvkm_rd32(device, 0x001540);
>         u32 r00154c = nvkm_rd32(device, 0x00154c);
> -       u64 disable = 0ULL;
>  
>         if (!(r001540 & 0x40000000)) {
>                 nvkm_subdev_disable(device, NVKM_ENGINE_MSPDEC, 0);
> @@ -82,7 +81,7 @@ gt215_devinit_disable(struct nvkm_devinit *init)
>         if (!(r00154c & 0x00000200))
>                 nvkm_subdev_disable(device, NVKM_ENGINE_CE, 0);
>  
> -       return disable;
> +       return 0ULL;
>  }
>  
>  static u32

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

