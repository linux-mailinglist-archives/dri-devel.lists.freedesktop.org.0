Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E9CA323CF
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 11:47:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04A6410E842;
	Wed, 12 Feb 2025 10:47:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="QvAfAW0f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5660510E842
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 10:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739357270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mjdUa3EI6jjPQESFxZ7QAmDE55PpxL5gJTNRXqkiL/U=;
 b=QvAfAW0faU2m2rDi34rBDczaeZ5v+Q9ZINe/YCvgeoNRMV5BY0DsfyqgUQQGtc5Pl5xbDX
 dkt6v9x/NBe/RFoJIFfJIbDL1fOJUFDjJo4ms48SXMNUWHZK+VxLEaFDGX4SKqjNTWwqes
 ffczT8Pc4z/BKROFZDTqPeENN4Ojkw0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-161-24ZlU-vuNqCBF-HeB1Vpkg-1; Wed, 12 Feb 2025 05:47:49 -0500
X-MC-Unique: 24ZlU-vuNqCBF-HeB1Vpkg-1
X-Mimecast-MFC-AGG-ID: 24ZlU-vuNqCBF-HeB1Vpkg_1739357268
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-5dc5b397109so5959392a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 02:47:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739357268; x=1739962068;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mjdUa3EI6jjPQESFxZ7QAmDE55PpxL5gJTNRXqkiL/U=;
 b=IOLVSIaF8XHoKTt7uQHVZzbtlxU4f34sKkbnrF/PVEZ7nohX69/Tp7qe2L2hc3xVmJ
 ysUx6MzjgOMU5e1EcDUVVOC6mAON7kiuHLwacBN2iBcMfxdJkoZDRdRwQOmmm5lL/l20
 FcH0oamNV9gOfJaIJiny8MVYdJqefnmvmY43xmz8EsSsClzWKhrAsSjR3lB6+5/YwYPC
 EoEIMo5HCerL8RqSLpAr4uPJhAXqcG962kqYGkgm8iUbXKxfw+0jiwGOj0D5GX2ov1bF
 d/F0fS/L3h6QTxX4LsRVO8N3gZEAu5uQ0q4Bf4yMN5m1eyKmDHW1sZH+iuK96idLbxjN
 A/5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTrADTj44kETN29+rHGud4fjjmjz245t+wKJmIV7eo4d5bja2TcN31axDF0Cnm4WwXRZNuhyek6IY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzz85/R4wfw3JNOdwDqcM0R7yps1KsGn1funcWPOx1cf3wV4gey
 8XIWSCfBZvim1IDtCjzdMndm8dWTif6rzUHWP90G4FgfZM+H2WyBnH92YGFSDr9uUS9NRl0cbgn
 24Vce9RgHAwqQvGpE+y9WCm0n4IufGy2m+pHV9LiHo3k5A1AVwptsGwfQfNWw0YsHaQ==
X-Gm-Gg: ASbGnct+AoLWxRkjmVhbuLhsy3XxGRO9CUVq6Pq51D6u1SpwRskeynJ+fYSFcLQPMVf
 2NbzEB8o9HmUu7tPgsyI3pJ82xcLuUvTD4qD7DmR2FZABDS+YAAdwu1RtxvPH1TkvfZaN8pn0y5
 JQULUsHjW4eb9xJmp/vAyNZJ1pZuHpGtegB9OEoioWbRHDvo7u0Nyw20Tz5tpB0ZnV5WtB7VlqX
 MVH6PE1h5Fwx/RI5Qgiyyyk7sfDno0RaigcQ1NuIh0gOEHpFxSdxn5tHXTqdFx9E2ah/NbtCYlz
 zRNtBp27XzAtQ565V56hk5lEz+BU1dF5ZJN70rWUZupaqTZAWMiT1S/edELUurH+l4DKIsUI1AF
 lUbMZEb/bhr/Cjlyu5W5FAIs/X74w9R9pBVV/qJWDGAb5mef+yFuLgTU=
X-Received: by 2002:a05:6402:4024:b0:5d0:efaf:fb73 with SMTP id
 4fb4d7f45d1cf-5deaddc10acmr2533483a12.15.1739357268045; 
 Wed, 12 Feb 2025 02:47:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF+cfN/r2H+5+T27gFwPIpiEUhEl9EoQtBpdey6qTwiUKTmPoUzMtEHwPD5XLyb0CzEKyhwIw==
X-Received: by 2002:a05:6402:4024:b0:5d0:efaf:fb73 with SMTP id
 4fb4d7f45d1cf-5deaddc10acmr2533451a12.15.1739357267633; 
 Wed, 12 Feb 2025 02:47:47 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5de4f4f4daesm9370661a12.21.2025.02.12.02.47.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Feb 2025 02:47:46 -0800 (PST)
Message-ID: <3572b4b0-5d32-4331-b241-567701c2cf7b@redhat.com>
Date: Wed, 12 Feb 2025 11:47:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] drm: panel-orientation-quirks: Add quirks for AYA
 NEO Flip DS and KB
To: John Edwards <uejji@uejji.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Andrew Wyatt <fewtarius@steamfork.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Paco Avelar <pacoavelar@hotmail.com>
References: <20250124204648.56989-2-uejji@uejji.net>
 <20250124204648.56989-6-uejji@uejji.net>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250124204648.56989-6-uejji@uejji.net>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: haaeOsr_HHmv546ccegmxQmt5pU8hoRAwScrIQC41d8_1739357268
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Thank you for your patches and sorry for being slow to respond.

On 24-Jan-25 9:46 PM, John Edwards wrote:
> From: Andrew Wyatt <fewtarius@steamfork.org>
> 
> The AYA NEO Flip DS and KB both use a 1080x1920 portrait LCD panel.  The
> Flip DS additionally uses a 640x960 portrait LCD panel as a second display.
> 
> Add DMI matches to correctly rotate these panels.
> 
> Signed-off-by: Andrew Wyatt <fewtarius@steamfork.org>
> Co-developed-by: John Edwards <uejji@uejji.net>
> Signed-off-by: John Edwards <uejji@uejji.net>
> Tested-by: Paco Avelar <pacoavelar@hotmail.com>
> ---
>  drivers/gpu/drm/drm_panel_orientation_quirks.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> index f9c975338..c5acf2628 100644
> --- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
> +++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> @@ -93,6 +93,12 @@ static const struct drm_dmi_panel_orientation_data onegx1_pro = {
>  	.orientation = DRM_MODE_PANEL_ORIENTATION_RIGHT_UP,
>  };
>  
> +static const struct drm_dmi_panel_orientation_data lcd640x960_leftside_up = {
> +	.width = 640,
> +	.height = 960,
> +	.orientation = DRM_MODE_PANEL_ORIENTATION_LEFT_UP,
> +};
> +
>  static const struct drm_dmi_panel_orientation_data lcd720x1280_rightside_up = {
>  	.width = 720,
>  	.height = 1280,
> @@ -202,6 +208,18 @@ static const struct dmi_system_id orientation_data[] = {
>  		  DMI_MATCH(DMI_PRODUCT_NAME, "AIR"),
>  		},
>  		.driver_data = (void *)&lcd1080x1920_leftside_up,
> +	}, {    /* AYA NEO Flip DS Bottom Screen */
> +		.matches = {
> +		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "AYANEO"),
> +		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "FLIP DS"),
> +	},

Since this '}' is closing the .matches initializer it should be indented 2 tabs,
note I think we can fix this up while merging things so no need for a v3
(assuming Thomas agrees).

> +		.driver_data = (void *)&lcd640x960_leftside_up,
> +	}, {    /* AYA NEO Flip KB/DS Top Screen */
> +		.matches = {
> +		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "AYANEO"),
> +		  DMI_MATCH(DMI_PRODUCT_NAME, "FLIP"),
> +	},

Since this '}' is closing the .matches initializer it should be indented 2 tabs

> +		.driver_data = (void *)&lcd1080x1920_leftside_up,
>  	}, {	/* AYA NEO Founder */
>  		.matches = {
>  		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "AYA NEO"),

Regards,

Hans



