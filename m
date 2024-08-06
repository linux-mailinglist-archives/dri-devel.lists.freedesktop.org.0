Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE23948E85
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 14:10:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1312410E337;
	Tue,  6 Aug 2024 12:10:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Ux3cQpvs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED0A310E337
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2024 12:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1722946199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TMpQ+JRKQnsmv7A3qWnupI15nxT5axPr0qdVCrmgPHE=;
 b=Ux3cQpvsyhLtHBPE/QcK2hObC+sNOOtofuDEKFCy63OAPqz0L91kPaDcCkxBjRxH9P/TJe
 pWQ7tGxZNLE0g49DFhp38VaoG7EzaHQpHwFZUeTD35aKWPy92MbKXtSXmGATOKQ3+e/S0T
 lvheY7mASLyzsSPGAUKxBN8V5d2Sw9s=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-228-HL2fuD-fOJaybuESKEshRw-1; Tue, 06 Aug 2024 08:09:58 -0400
X-MC-Unique: HL2fuD-fOJaybuESKEshRw-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4280291f739so4816545e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Aug 2024 05:09:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722946197; x=1723550997;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TMpQ+JRKQnsmv7A3qWnupI15nxT5axPr0qdVCrmgPHE=;
 b=iN8X11WHjl0P1EvRAngnnc5yMEcNUeWFT2U+Rx/EnBs/s6eJ87iEYCua5yoR+rKm0D
 LohgBpmdhf57Ty8LE741mf9x6PohdpyZUZe1KggwyPNoUNCiKzMZpucBpDs2zlNdkEMF
 leLe48avpUJpXrUaDOUa+L3Jn2whA9quB9tC8rHV3mGVwlHcQ7lGPdWw/lEcpGpTlhMV
 Rb8LGFrNPrWjdBmjueRBRufAPNduyq3kgKXr2nHFVdSqCG9xq9GkPDWy0ExZwYz9fKFG
 TSRTmtI40+jQmdpen6MmKLHg1pSVxdkCbkCBxzkRiQXMSvWLuNwTPj5cPufc7bvncvnM
 xXVg==
X-Gm-Message-State: AOJu0YxzuaDnF2PSOaK1JevNTGAv8xCraxeYYtQPSFFoDoXtmEUij9Un
 hdHmiTckmYmsVr8s5egCe8uzKuh289MubUlB7rAa/VA2WPZ/QldBPdvbIhl+i8nGrEJW472hJBI
 Spg+cd0jbNVVkcRcZXpryhgEMCktOkpsOD5FFqQeV2/hqhWsFJGJ+bn5Xp9JYEHE9jQ==
X-Received: by 2002:a05:600c:154c:b0:426:6389:94c4 with SMTP id
 5b1f17b1804b1-428e6b956edmr93957265e9.37.1722946196772; 
 Tue, 06 Aug 2024 05:09:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFLhIXnAoUIfcTe5tyDiwgcJLxM4WIH3Z67/nN1boxvAF2P3lk4kJNf9Wxa5Ajv+yoqrLyuw==
X-Received: by 2002:a05:600c:154c:b0:426:6389:94c4 with SMTP id
 5b1f17b1804b1-428e6b956edmr93957085e9.37.1722946196380; 
 Tue, 06 Aug 2024 05:09:56 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d5:a000:d3ea:62cf:3052:fac6?
 ([2a01:e0a:d5:a000:d3ea:62cf:3052:fac6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-428e6e9c9fdsm178994005e9.41.2024.08.06.05.09.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Aug 2024 05:09:55 -0700 (PDT)
Message-ID: <3f8ed7ff-2292-4411-9a7a-71b56c3e64b2@redhat.com>
Date: Tue, 6 Aug 2024 14:09:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] drm/mgag200: vga-bmc: Transparently handle BMC
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
References: <20240805130622.63458-1-tzimmermann@suse.de>
 <20240805130622.63458-3-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240805130622.63458-3-tzimmermann@suse.de>
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



On 05/08/2024 15:05, Thomas Zimmermann wrote:
> The VGA-BMC connector selects the VGA output if a display has been
> attached to the physical connector. Otherwise it selects the BMC
> output. In any case, the connector status is set to 'detected', so
> that the userspace compositor displays to it.
> 
> Depending on the setting, the connector's display modes either come
> from the VGA monitor's EDID or from an internal list of BMC-compatible
> modes.
> 

Thanks for this work.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/mgag200/mgag200_vga_bmc.c | 50 ++++++++++++++++++++++-
>   1 file changed, 48 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mgag200/mgag200_vga_bmc.c b/drivers/gpu/drm/mgag200/mgag200_vga_bmc.c
> index b6b90632b3c6..3a958c3587ac 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_vga_bmc.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_vga_bmc.c
> @@ -1,6 +1,7 @@
>   // SPDX-License-Identifier: GPL-2.0-only
>   
>   #include <drm/drm_atomic_helper.h>
> +#include <drm/drm_edid.h>
>   #include <drm/drm_modeset_helper_vtables.h>
>   #include <drm/drm_probe_helper.h>
>   
> @@ -11,9 +12,54 @@ static const struct drm_encoder_funcs mgag200_dac_encoder_funcs = {
>   	.destroy = drm_encoder_cleanup
>   };
>   
> +static int mgag200_vga_bmc_connector_helper_get_modes(struct drm_connector *connector)
> +{
> +	struct mga_device *mdev = to_mga_device(connector->dev);
> +	const struct mgag200_device_info *minfo = mdev->info;
> +	int count;
> +
> +	count = drm_connector_helper_get_modes(connector);
> +
> +	if (!count) {
> +		/*
> +		 * There's no EDID data without a connected monitor. Set BMC-
> +		 * compatible modes in this case. The XGA default resolution
> +		 * should work well for all BMCs.
> +		 */
> +		count = drm_add_modes_noedid(connector, minfo->max_hdisplay, minfo->max_vdisplay);
> +		if (count)
> +			drm_set_preferred_mode(connector, 1024, 768);
> +	}
> +
> +	return count;
> +}
> +
> +/*
> + * There's no monitor connected if the DDC did not return an EDID. Still
> + * return 'connected' as there's always a BMC. Incrementing the connector's
> + * epoch counter triggers an update of the related properties.
> + */
> +static int mgag200_vga_bmc_connector_helper_detect_ctx(struct drm_connector *connector,
> +						       struct drm_modeset_acquire_ctx *ctx,
> +						       bool force)
> +{
> +	enum drm_connector_status old_status, status;
> +
> +	if (connector->edid_blob_ptr)
> +		old_status = connector_status_connected;
> +	else
> +		old_status = connector_status_disconnected;
> +
> +	status = drm_connector_helper_detect_from_ddc(connector, ctx, force);
> +
> +	if (status != old_status)
> +		++connector->epoch_counter;
> +	return connector_status_connected;
> +}
> +
>   static const struct drm_connector_helper_funcs mgag200_vga_connector_helper_funcs = {
> -	.get_modes = drm_connector_helper_get_modes,
> -	.detect_ctx = drm_connector_helper_detect_from_ddc
> +	.get_modes = mgag200_vga_bmc_connector_helper_get_modes,
> +	.detect_ctx = mgag200_vga_bmc_connector_helper_detect_ctx,
>   };
>   
>   static const struct drm_connector_funcs mgag200_vga_connector_funcs = {

