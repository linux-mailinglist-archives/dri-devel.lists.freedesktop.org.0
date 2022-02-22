Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4624BF428
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 09:56:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C82310E4C4;
	Tue, 22 Feb 2022 08:56:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 056E810E4C4
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 08:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645520176;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SfMmypL9qttJ3YbFEbSk6QoN2DBXvdpYvKIUwADoCxg=;
 b=flKcvq7y0YOb0tRSYgh5OFhBf79AKWOSZNoej3m2qffOIwH5JBBvRkPrIwjn4CxJKd2/WC
 HHocubLooyO5VvXqLSXgs2SU4P2ti0pOXJzYcf17z1mSqMPlQhe9aEEd9uZP7YZ3E1uW0U
 XbTZPfHWBTOz98DWemZeH0vaHK7XcNE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-599-5drIQPXMOdCq6mSnXrfVKg-1; Tue, 22 Feb 2022 03:56:13 -0500
X-MC-Unique: 5drIQPXMOdCq6mSnXrfVKg-1
Received: by mail-wm1-f69.google.com with SMTP id
 r8-20020a7bc088000000b0037bbf779d26so330555wmh.7
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 00:56:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SfMmypL9qttJ3YbFEbSk6QoN2DBXvdpYvKIUwADoCxg=;
 b=Wd5oVFLnfBWm+br9cwh/CeXcdIbyVHlZOby1I06IAo/t9jS1RU6Xm+mChM1j6TUX1D
 TBkpRPe+ym5Vv2S+Ah+mQ3dbY9AwdUdUfXf8SPZ/T9+5+yfX5QShNsU1cvxdUZ+f8Ly4
 ppW5K5HXj0aYeeGOi+Gx3egZoZKSAEhdPQe8mghCzRRESBoq+YrLN6u3cBwLUpv+s85M
 Huksg0QXqlne9Nas37yj+mwk4EESDrtoKKQGLgNnQ92h0Ci/q6r3+sB83QTZLP5LkqdC
 ypTVKcEB8IvWfLy1YZQWxMWS3mATDPtpPI+7EGpEzZ4Wkt7G9iKYFP1ExgDfZgLfsARR
 nkjA==
X-Gm-Message-State: AOAM533QzBCUEJxfZc5Lpqh7cK52TMEHy0xICtEFCYXKYWVizXqXEmnS
 hQhkVcsI/FJZ68eEtD8LYFWC7IyYzGY1+hisQOPvu5Ud8dynlS4KBIf3GAZUOssnuTp3AX+g+1E
 dEoc7m8TELU/qc2kkUtgrNlKV7dKW
X-Received: by 2002:a1c:4d0e:0:b0:37c:b85:5404 with SMTP id
 o14-20020a1c4d0e000000b0037c0b855404mr2326457wmh.184.1645520172010; 
 Tue, 22 Feb 2022 00:56:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwAi7V9nFO4Il1M/TBd4dL9H2KOJzEojKIJjY4NiH3s5KpZLwSQaMTogtDL+DyU2dnIonrE1g==
X-Received: by 2002:a1c:4d0e:0:b0:37c:b85:5404 with SMTP id
 o14-20020a1c4d0e000000b0037c0b855404mr2326444wmh.184.1645520171726; 
 Tue, 22 Feb 2022 00:56:11 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id d14sm45609000wri.93.2022.02.22.00.56.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 00:56:11 -0800 (PST)
Message-ID: <6e954a23-2b8e-c04d-4ec4-ce792b5fa52a@redhat.com>
Date: Tue, 22 Feb 2022 09:56:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/2] drm/i915/vlv_dsi: Add DMI quirk for wrong panel
 modeline in BIOS on Asus TF103C
To: Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
References: <20220221220608.12131-1-hdegoede@redhat.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220221220608.12131-1-hdegoede@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Hans,

On 2/21/22 23:06, Hans de Goede wrote:
> Vtotal is wrong in the BIOS supplied modeline for the DSI panel on
> the Asus TF103C leading to the last line of the display being shown
> as the first line.
> 
> The factory installed Android has a hardcoded modeline in its kernel,
> causing it to not suffer from this BIOS bug;
> 
> and the Android boot-splash which uses the EFI FB which does have this bug
> has the last line all black causing the bug to not be visible.
> 
> This commit introduces a generic DMI based mechanism for doing modeline
> fixups, in case we need similar fixups on other models in the future.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/gpu/drm/i915/display/vlv_dsi.c | 36 ++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/vlv_dsi.c b/drivers/gpu/drm/i915/display/vlv_dsi.c
> index 06ef822c27bd..66f5cf32bb66 100644
> --- a/drivers/gpu/drm/i915/display/vlv_dsi.c
> +++ b/drivers/gpu/drm/i915/display/vlv_dsi.c
> @@ -23,6 +23,7 @@
>   * Author: Jani Nikula <jani.nikula@intel.com>
>   */
>  
> +#include <linux/dmi.h>
>  #include <linux/slab.h>
>  
>  #include <drm/drm_atomic_helper.h>
> @@ -1831,6 +1832,33 @@ static void vlv_dphy_param_init(struct intel_dsi *intel_dsi)
>  	intel_dsi_log_params(intel_dsi);
>  }
>  
> +typedef void (*vlv_dsi_mode_fixup_func)(struct drm_connector *connector,
> +					struct drm_display_mode *fixed_mode);
> +
> +/*
> + * Vtotal is wrong on the Asus TF103C leading to the last line of the display
> + * being shown as the first line. The factory installed Android has a hardcoded
> + * modeline, causing it to not suffer from this BIOS bug.
> + */
> +static void vlv_dsi_asus_tf103c_mode_fixup(struct drm_connector *connector,
> +					   struct drm_display_mode *fixed_mode)
> +{
> +	fixed_mode->vtotal = 816;
> +	fixed_mode->crtc_vtotal = 816;
> +}
> +
> +static const struct dmi_system_id dmi_mode_fixup_table[] = {
> +	{
> +		/* Asus Transformer Pad TF103C */
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "TF103C"),
> +		},
> +		.driver_data = (void *)vlv_dsi_asus_tf103c_mode_fixup,
> +	},
> +	{ }
> +};
> +

There's nothing driver specific in this mechanism so I wonder if would
be better to add it as a DRM helper, for others drivers to use it too.

Maybe in drivers/gpu/drm/drm_modeset_helper.c or a drm_modeset_quirks.c
like we have for drivers/gpu/drm/drm_panel_orientation_quirks.c ?

The patch looks good to me, regardless where you decide to add it.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

