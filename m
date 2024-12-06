Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3D99E61B9
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 01:07:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D02B410EFE8;
	Fri,  6 Dec 2024 00:07:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="R3mjPz72";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC58D10EFE8
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 00:07:36 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-53e274f149fso1595681e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Dec 2024 16:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1733443655; x=1734048455;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=blIrJbErtJBhmg6i7GQdINtKp/1t5xm0HORWyHzR8zA=;
 b=R3mjPz72Yw9gtgRm813lutWkRFwvGGUeApLWebT0jkEJ6hTidEM4bpQ4Ur4L1OsrfB
 EIV4iEUziiMPZFWv1J2kOGqophESG6a4vtoh7z14QxY6rod5wUuktA82kRJxZjuwUmyG
 gX+Czi99HwjxlX8NKQYJX5qiIPFVFfRSMFzYRsy/KWucuAIth0vX+SB4bLFQCUgEdXYs
 ozfs5y1vSUP8vKHIC6BddI6a2rpSWDgFroA1iwArXT2nYRkpkDVL3xVeX+dmYrIlAUY4
 sJ3lR7eh6N9mirRYQb5K8Pgtvgc+2TFUNNev+LsN2Te9l5A2ZouZeEP6fS32k69oBYq5
 KRsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733443655; x=1734048455;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=blIrJbErtJBhmg6i7GQdINtKp/1t5xm0HORWyHzR8zA=;
 b=A4jTakGXKXcZPzsmMuODT6OJa0nbJC180HJjLlsY6jaSqHCDLJtAX4QMT7iSS8oOZf
 axTFApHPajno6qnCVSpmnC29MB3Se6OA/13djVvRo/wJuJ981IFHAF6wO0DVLmZxM95G
 c/2yjz3Uq93HYjAWWp5DXKvONJi30Hzjtmq1fnFzrhLTugS6kYfT9EnzDCDoG4UJuy0H
 7da+t6o+VB+ipY414zeQ/cSGab4Vsv4Qrr+w7+f16jHgTajxJYXtVmLrO3cZKMPbT34T
 7gfpaiybNgV+/k0z1wyZIn4WismlCr0WdtKBnG6x/GM0zBlT3QkcaCPoWtbCK3Ul5UAt
 mbuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJmWqVEmH+iuHvrhq9AS34jUn4UBtVFlEuaTyrrxZnHftUEREAtmXY87GbqSG2n0FrMR/BG6REWzw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyLVEZSBEnRHF7A2mzOS3bmksHISGfX2y4c2NH1olIGTdOpfLRu
 1Dpyd8MqmYh+b92+MHGr2HVKemdywpR4XWUDdnAFatAulbFZTe1RDiItAYESXL3FlIzE+/8MPUO
 7ccnFjleAMIenRjGOzQZBpxIwhvXHoRtAr1ML
X-Gm-Gg: ASbGncvJLLrR3BHt3VGUfLYyDXlpBxaNZV/ExUk44Z7QxA4hd7Sfc4aVCXJL+7gRrLY
 PerXj1YczXsJ3WFGVhqsAl7L9ebGhdw==
X-Google-Smtp-Source: AGHT+IGwkB+5shyB5Uw7Uf9fUCWUSk4ghNB6iVijhuSWeVK3ZvAmFf8V/NY25l5TehZEnnHMKB1Y4S3fEVzEwkI2dcY=
X-Received: by 2002:a05:6512:220c:b0:539:e65a:8a71 with SMTP id
 2adb3069b0e04-53e2c2c1873mr420862e87.34.1733443654651; Thu, 05 Dec 2024
 16:07:34 -0800 (PST)
MIME-Version: 1.0
References: <20241204221627.2247598-1-sashal@kernel.org>
 <20241204221627.2247598-8-sashal@kernel.org>
In-Reply-To: <20241204221627.2247598-8-sashal@kernel.org>
From: Saravana Kannan <saravanak@google.com>
Date: Thu, 5 Dec 2024 16:06:58 -0800
Message-ID: <CAGETcx-8nwfbCHN7zG7XuOM+CRevEU6M8fqaw1H4h+yz-H2BoQ@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 6.12 08/15] drm: display: Set fwnode for aux bus
 devices
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Thierry Reding <treding@nvidia.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 matthias.bgg@gmail.com, elder@kernel.org, sumit.garg@linaro.org, 
 ricardo@marliere.net, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 4, 2024 at 3:28=E2=80=AFPM Sasha Levin <sashal@kernel.org> wrot=
e:
>
> From: Saravana Kannan <saravanak@google.com>
>
> [ Upstream commit fe2e59aa5d7077c5c564d55b7e2997e83710c314 ]
>
> fwnode needs to be set for a device for fw_devlink to be able to
> track/enforce its dependencies correctly. Without this, you'll see error
> messages like this when the supplier has probed and tries to make sure
> all its fwnode consumers are linked to it using device links:
>
> mediatek-drm-dp 1c500000.edp-tx: Failed to create device link (0x180) wit=
h backlight-lcd0
>
> Reported-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Closes: https://lore.kernel.org/all/7b995947-4540-4b17-872e-e107adca4598@=
notapiano/
> Tested-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Thierry Reding <treding@nvidia.com>
> Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabor=
a.com>
> Link: https://lore.kernel.org/r/20241024061347.1771063-2-saravanak@google=
.com
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Sasha Levin <sashal@kernel.org>

I'm okay pulling this into 6.12 as it's recent enough.

-Saravana

> ---
>  drivers/gpu/drm/display/drm_dp_aux_bus.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/display/drm_dp_aux_bus.c b/drivers/gpu/drm/d=
isplay/drm_dp_aux_bus.c
> index d810529ebfb6e..ec7eac6b595f7 100644
> --- a/drivers/gpu/drm/display/drm_dp_aux_bus.c
> +++ b/drivers/gpu/drm/display/drm_dp_aux_bus.c
> @@ -292,7 +292,7 @@ int of_dp_aux_populate_bus(struct drm_dp_aux *aux,
>         aux_ep->dev.parent =3D aux->dev;
>         aux_ep->dev.bus =3D &dp_aux_bus_type;
>         aux_ep->dev.type =3D &dp_aux_device_type_type;
> -       aux_ep->dev.of_node =3D of_node_get(np);
> +       device_set_node(&aux_ep->dev, of_fwnode_handle(of_node_get(np)));
>         dev_set_name(&aux_ep->dev, "aux-%s", dev_name(aux->dev));
>
>         ret =3D device_register(&aux_ep->dev);
> --
> 2.43.0
>
