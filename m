Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 841FE903EFF
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2024 16:42:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55A2A10E1C2;
	Tue, 11 Jun 2024 14:42:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Bwk85Vqc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6814889070
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 14:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718116916;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0btn/WtKKma3vvYamu66ZcpqCCy2QjDKdtmukDRLpDM=;
 b=Bwk85Vqc755xF/DNP/szO3Bu+WF4kbZDstwnSr3+pXaMhFBTVl/Q3dUxvCXjNddGlE+9Cx
 gxiLWVfJNaC2WtNaFD2+NV3DurC1KwM7z7Ya/up3dL7CFUeDFhzfGPQyd3zORT68Fvs87t
 qQOsElUu4nHdl1bUCD4zrs2pDkqpWU8=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-287-cKZPPPA9MUu9qR5clTxRdQ-1; Tue, 11 Jun 2024 10:41:53 -0400
X-MC-Unique: cKZPPPA9MUu9qR5clTxRdQ-1
Received: by mail-lf1-f72.google.com with SMTP id
 2adb3069b0e04-52c7cff3b89so942380e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 07:41:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718116911; x=1718721711;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0btn/WtKKma3vvYamu66ZcpqCCy2QjDKdtmukDRLpDM=;
 b=C4pEYPhOoYqvMofgSwLRbDKlkKpkmhWtYiVZf3lCq7eW1Adu/WEe5Z8lj8AHwG/0nG
 InCwbMx2bAstdQUjLhTE8SY9EpFjw0ZDq3rAImd1gcD28Kop0eFOef/RhnxsKNzikQy7
 TzxKTU7ubVUk7Yc1cRnZQVJx99eav+Gm/VLG70+NTDifnLTAaX3gIaP4QWtV2OEYEgqG
 s+qwKXbemq8VN+PY+3zYLsk59t4wnB1D0xeTqNRF+QyIbn3C8Tc1j7KI3G6VhbNEgb0H
 c+vEusYqf5olJCmop9+DgH5WNDUEGdEwqogTWnvV2z/xZUv+qrHeftK1zI5rnG9IxIez
 3FvA==
X-Gm-Message-State: AOJu0Yx+mqgMI1btqfDD5x1/+MV7z4dwq3s22Xg9qXUVn7ie5ykBUCgb
 Ngce47g3FBqQYbh2mgB+F52f+cwSZpk7uP/An9bZexojC/IonP/g73tNIZFZzZamKoqlkhaBGuA
 XrDPD6vd1rBACR870gfcWgeJ5GvW1W5igJ1e4z1iKbelvexLRo2qlsWOdfUSqV9SLGA==
X-Received: by 2002:a05:6512:308f:b0:52c:884c:3d82 with SMTP id
 2adb3069b0e04-52c884c3e94mr4502475e87.46.1718116911588; 
 Tue, 11 Jun 2024 07:41:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYWvoSnwwT48ZM61nNIVOcFPcYumKk94VRm/0YUQ58o/A2bxa7ok6W0QGhhwtKoFa323k+tw==
X-Received: by 2002:a05:6512:308f:b0:52c:884c:3d82 with SMTP id
 2adb3069b0e04-52c884c3e94mr4502456e87.46.1718116911171; 
 Tue, 11 Jun 2024 07:41:51 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e?
 ([2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35f23a00997sm5968150f8f.0.2024.06.11.07.41.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jun 2024 07:41:50 -0700 (PDT)
Message-ID: <7b92e719-3187-4470-92b9-d017c729ddac@redhat.com>
Date: Tue, 11 Jun 2024 16:41:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] drm/mgag200: Set .detect_ctx() and enable
 connector polling
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
References: <20240610141141.29527-1-tzimmermann@suse.de>
 <20240610141141.29527-4-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240610141141.29527-4-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 10/06/2024 16:06, Thomas Zimmermann wrote:
> Set .detect_ctx() in struct drm_connector_helper_funcs to the
> common helper drm_connector_helper_detect_from_ddc() and enable
> polling for the connector. Mgag200 will now test for the monitor's
> presence by probing the DDC in regular intervals.
> 
I've tested this series on two servers, one with physical VGA plugged, 
and one remote system, and it works as intended.

Thanks a lot for this work.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/mgag200/mgag200_g200.c    | 1 +
>   drivers/gpu/drm/mgag200/mgag200_g200eh.c  | 1 +
>   drivers/gpu/drm/mgag200/mgag200_g200eh3.c | 1 +
>   drivers/gpu/drm/mgag200/mgag200_g200er.c  | 1 +
>   drivers/gpu/drm/mgag200/mgag200_g200ev.c  | 1 +
>   drivers/gpu/drm/mgag200/mgag200_g200ew3.c | 1 +
>   drivers/gpu/drm/mgag200/mgag200_g200se.c  | 1 +
>   drivers/gpu/drm/mgag200/mgag200_g200wb.c  | 1 +
>   drivers/gpu/drm/mgag200/mgag200_vga.c     | 6 +++++-
>   9 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200.c b/drivers/gpu/drm/mgag200/mgag200_g200.c
> index ff467b0f9cbf3..f874e29498409 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_g200.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_g200.c
> @@ -401,6 +401,7 @@ struct mga_device *mgag200_g200_device_create(struct pci_dev *pdev, const struct
>   		return ERR_PTR(ret);
>   
>   	drm_mode_config_reset(dev);
> +	drm_kms_helper_poll_init(dev);
>   
>   	return mdev;
>   }
> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200eh.c b/drivers/gpu/drm/mgag200/mgag200_g200eh.c
> index 6f31c5249f0b1..52bf49ead5c50 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_g200eh.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_g200eh.c
> @@ -277,6 +277,7 @@ struct mga_device *mgag200_g200eh_device_create(struct pci_dev *pdev, const stru
>   		return ERR_PTR(ret);
>   
>   	drm_mode_config_reset(dev);
> +	drm_kms_helper_poll_init(dev);
>   
>   	return mdev;
>   }
> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200eh3.c b/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
> index 5befe8da4beb2..e7f89b2a59fd0 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
> @@ -182,6 +182,7 @@ struct mga_device *mgag200_g200eh3_device_create(struct pci_dev *pdev,
>   		return ERR_PTR(ret);
>   
>   	drm_mode_config_reset(dev);
> +	drm_kms_helper_poll_init(dev);
>   
>   	return mdev;
>   }
> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200er.c b/drivers/gpu/drm/mgag200/mgag200_g200er.c
> index 55c275180cde2..4e8a1756138d7 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_g200er.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_g200er.c
> @@ -316,6 +316,7 @@ struct mga_device *mgag200_g200er_device_create(struct pci_dev *pdev, const stru
>   		return ERR_PTR(ret);
>   
>   	drm_mode_config_reset(dev);
> +	drm_kms_helper_poll_init(dev);
>   
>   	return mdev;
>   }
> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200ev.c b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
> index 2466126140db6..d884f3cb0ec79 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_g200ev.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
> @@ -321,6 +321,7 @@ struct mga_device *mgag200_g200ev_device_create(struct pci_dev *pdev, const stru
>   		return ERR_PTR(ret);
>   
>   	drm_mode_config_reset(dev);
> +	drm_kms_helper_poll_init(dev);
>   
>   	return mdev;
>   }
> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200ew3.c b/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
> index a52e60609c3de..839401e8b4654 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
> @@ -202,6 +202,7 @@ struct mga_device *mgag200_g200ew3_device_create(struct pci_dev *pdev,
>   		return ERR_PTR(ret);
>   
>   	drm_mode_config_reset(dev);
> +	drm_kms_helper_poll_init(dev);
>   
>   	return mdev;
>   }
> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200se.c b/drivers/gpu/drm/mgag200/mgag200_g200se.c
> index 212770acdd477..a824bb8ad5791 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_g200se.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_g200se.c
> @@ -521,6 +521,7 @@ struct mga_device *mgag200_g200se_device_create(struct pci_dev *pdev, const stru
>   		return ERR_PTR(ret);
>   
>   	drm_mode_config_reset(dev);
> +	drm_kms_helper_poll_init(dev);
>   
>   	return mdev;
>   }
> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200wb.c b/drivers/gpu/drm/mgag200/mgag200_g200wb.c
> index cb6daa0426fbc..835df0f4fc13d 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_g200wb.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_g200wb.c
> @@ -326,6 +326,7 @@ struct mga_device *mgag200_g200wb_device_create(struct pci_dev *pdev, const stru
>   		return ERR_PTR(ret);
>   
>   	drm_mode_config_reset(dev);
> +	drm_kms_helper_poll_init(dev);
>   
>   	return mdev;
>   }
> diff --git a/drivers/gpu/drm/mgag200/mgag200_vga.c b/drivers/gpu/drm/mgag200/mgag200_vga.c
> index 6d8982990c2c3..60568f32736dd 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_vga.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_vga.c
> @@ -12,7 +12,8 @@ static const struct drm_encoder_funcs mgag200_dac_encoder_funcs = {
>   };
>   
>   static const struct drm_connector_helper_funcs mgag200_vga_connector_helper_funcs = {
> -	.get_modes = drm_connector_helper_get_modes
> +	.get_modes = drm_connector_helper_get_modes,
> +	.detect_ctx = drm_connector_helper_detect_from_ddc
>   };
>   
>   static const struct drm_connector_funcs mgag200_vga_connector_funcs = {
> @@ -58,6 +59,9 @@ int mgag200_vga_output_init(struct mga_device *mdev)
>   	}
>   	drm_connector_helper_add(connector, &mgag200_vga_connector_helper_funcs);
>   
> +	connector->polled = DRM_CONNECTOR_POLL_CONNECT |
> +			    DRM_CONNECTOR_POLL_DISCONNECT;
> +
>   	ret = drm_connector_attach_encoder(connector, encoder);
>   	if (ret) {
>   		drm_err(dev, "drm_connector_attach_encoder() failed: %d\n", ret);

