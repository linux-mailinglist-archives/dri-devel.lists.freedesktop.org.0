Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC46AEB1F2
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 11:04:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B464C10E98A;
	Fri, 27 Jun 2025 09:04:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="TO+bQ5Sf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B76C710E98A
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 09:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751015061;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3KmsmsR1zkdWGHUqUCVWxvNYYetoO/L55l7eas6vaQU=;
 b=TO+bQ5Sf4QwOq1GGEtK343EvC7EtuHf3htGAbybTbPUhSEMHxfsBhzLhvvUfE9bDKnVYQk
 tm9MtlOx+XLq1ZY791T531AEhoEzbnMT0fEo7DVeiEY8fyYZhb6sdNm9l0Z6Plcm/4NHrS
 kw0YwtCzSJATxxu87Q2SrVBycKaZ3ko=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-248-gBeCY40tO8WUrEQUT-O4qA-1; Fri, 27 Jun 2025 05:04:20 -0400
X-MC-Unique: gBeCY40tO8WUrEQUT-O4qA-1
X-Mimecast-MFC-AGG-ID: gBeCY40tO8WUrEQUT-O4qA_1751015059
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-453804ee4dfso9590545e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 02:04:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751015059; x=1751619859;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3KmsmsR1zkdWGHUqUCVWxvNYYetoO/L55l7eas6vaQU=;
 b=YtI6QwDIpFC1V0uk2OmVRQNzYUB7jG38IxHRro8oZUhcuMHVfmPLBRmwSNguSCL3+i
 5Zk4QYVJ2rqq3tPG2Hlo2pcSFeCU2WOEJEOOwjMz9ly0G6qxN2KVtJev1xG+GbHBgoKE
 TXWVRMoU19TJI6ZZaap4cfQ9HM9DQ75CMmbG2jo3JBGlfiZfCjOUQBLsFcwilvPNuhDH
 KPR1Oxn72xn8e/OiRxddE1g5PiBCNkBLTRJvfefsJHBjBHFSXxrM9EfI6Amsocwz06DQ
 K4yLCBJIiTDv8s4WGz/+FRLKEGatdkjDOYvI6AQsKrR7nofAOFFP8dv18cQZP3N7HYon
 YamQ==
X-Gm-Message-State: AOJu0YxTa7e5HfgcOwm25VEn+34yxy8b3Ftt9vlHPM6iDXFhn5+90vO4
 9auYHN48XDuenbyFG+UFpC8PCB4tr+iFq/LvN9NbjnclNtpTV+JC0GElQd+RYjOUCvD9oDe8G0j
 5jmsRV2HAUSsfteiW3saofJMAY+4q4DunOidaHGd30zgWosJf2Z6bzMJbgPKsORLOystiIA==
X-Gm-Gg: ASbGncuneQVi1g6txO9J1baSLFyKd9bUp6eytMwcO6gr2Cc/WGeRyInG/qTHCE6dJHK
 sG+cYsU9LtWNmbsA3X7yAGYmlUH4ka30Q8gRXn09bzByJRJ8j2umUwTJ7z8YBpnmNExYoZOmqRU
 mHwSkYUPtBZSpT7UXey3hKj19C3649wWiqTJZYn5TVg7Q+R6UYHzJgVCWvCf12W1jcPGnqsbYfl
 3YUzkvDQD3v5Qh/BE9yBT+9t9rnL2IZ+r5FBQ4tnzfKEvjKEvASITR+DqGD+KZ7VqTAUXOYOXWC
 9iSGz5pPoQ5nTBcNebVG91ZmGzYMOQh6D1Nbilh5Ik+AeevuPrDM8r8MLRUrTWSo14IAzprzIRI
 OXLql
X-Received: by 2002:a05:6000:23c3:b0:3a4:c8c1:aed8 with SMTP id
 ffacd0b85a97d-3a8ff9ea18bmr1806163f8f.39.1751015058648; 
 Fri, 27 Jun 2025 02:04:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFvtbVNhtoT88g8GCP3xDLM03Xs+KFxLUDU0up7wRpfFhdOnPdXOQT+WY57/deJVibdF9AU1g==
X-Received: by 2002:a05:6000:23c3:b0:3a4:c8c1:aed8 with SMTP id
 ffacd0b85a97d-3a8ff9ea18bmr1806130f8f.39.1751015058205; 
 Fri, 27 Jun 2025 02:04:18 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a88c7fb20esm2169081f8f.36.2025.06.27.02.04.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jun 2025 02:04:17 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Maxime Ripard <mripard@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Luca Ceresoli <luca.ceresoli@bootlin.com>, Anusha
 Srivatsa <asrivats@redhat.com>, Francesco Dolcini <francesco@dolcini.it>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Maxime
 Ripard <mripard@kernel.org>
Subject: Re: [PATCH v2 1/5] drm/mipi-dsi: Add dev_is_mipi_dsi function
In-Reply-To: <20250626-drm-panel-simple-fixes-v2-1-5afcaa608bdc@kernel.org>
References: <20250626-drm-panel-simple-fixes-v2-0-5afcaa608bdc@kernel.org>
 <20250626-drm-panel-simple-fixes-v2-1-5afcaa608bdc@kernel.org>
Date: Fri, 27 Jun 2025 11:04:16 +0200
Message-ID: <87cyapd08f.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4cg_nn96G5M3R0tPHaoysgW2Rinlx137UPmC0bRLFXU_1751015059
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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

Maxime Ripard <mripard@kernel.org> writes:

Hello Maxime,

> This will be especially useful for generic panels (like panel-simple)
> which can take different code path depending on if they are MIPI-DSI
> devices or platform devices.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_mipi_dsi.c | 3 ++-
>  include/drm/drm_mipi_dsi.h     | 3 +++
>  2 files changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
> index e5184a0c24651756ee0b1eb27d94083d63eb35a7..21fd647f8ce1a6a862e2f8fb5320e701f26f614f 100644
> --- a/drivers/gpu/drm/drm_mipi_dsi.c
> +++ b/drivers/gpu/drm/drm_mipi_dsi.c
> @@ -89,16 +89,17 @@ static const struct dev_pm_ops mipi_dsi_device_pm_ops = {
>  	.thaw = pm_generic_thaw,
>  	.poweroff = pm_generic_poweroff,
>  	.restore = pm_generic_restore,
>  };
>  
> -static const struct bus_type mipi_dsi_bus_type = {
> +const struct bus_type mipi_dsi_bus_type = {
>  	.name = "mipi-dsi",
>  	.match = mipi_dsi_device_match,
>  	.uevent = mipi_dsi_uevent,
>  	.pm = &mipi_dsi_device_pm_ops,
>  };
> +EXPORT_SYMBOL_GPL(mipi_dsi_bus_type);
>  
>  /**
>   * of_find_mipi_dsi_device_by_node() - find the MIPI DSI device matching a
>   *    device tree node
>   * @np: device tree node
> diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
> index b37860f4a895c25ef8ba1c5b3f44827ef53aa100..6d2c08e8110151a97620389197f1ef79c058329d 100644
> --- a/include/drm/drm_mipi_dsi.h
> +++ b/include/drm/drm_mipi_dsi.h
> @@ -221,10 +221,13 @@ struct mipi_dsi_multi_context {
>  
>  #define MIPI_DSI_MODULE_PREFIX "mipi-dsi:"
>  
>  #define to_mipi_dsi_device(__dev)	container_of_const(__dev, struct mipi_dsi_device, dev)
>  
> +extern const struct bus_type mipi_dsi_bus_type;
> +#define dev_is_mipi_dsi(dev)	((dev)->bus == &mipi_dsi_bus_type)
> +

Usually I prefer to have static inline functions instead of macros to have
type checking. I see that this header has a mix of both, so I don't have a
strong opinion on what to use in this case.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

