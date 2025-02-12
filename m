Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC072A323D1
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 11:48:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68D9310E847;
	Wed, 12 Feb 2025 10:48:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="V02AFA3z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 307E510E846
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 10:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739357285;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4fsMpkvryDt2LzZ0h4OPEHC7XVpjdmg/PwbED44BwIQ=;
 b=V02AFA3zMsJrhAFwRteucEjdMdyeASW9HmwV6KwhE/8VBv6Ahc25Pn2aB5p1CJxk3ZlbSx
 E1HctArkouPHh+N/G7J1t2QQ0jQXDp2+fMIzoLhm+elmhuCSHprIsQmlxKTVNGGx8Nz2Gg
 eeijQDBuAyCXlnHnp4bSavc73FbGMmM=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-677-zWLYNbscMaWf6RSOHU7YaQ-1; Wed, 12 Feb 2025 05:48:04 -0500
X-MC-Unique: zWLYNbscMaWf6RSOHU7YaQ-1
X-Mimecast-MFC-AGG-ID: zWLYNbscMaWf6RSOHU7YaQ
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-ab397fff5a3so74573866b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 02:48:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739357283; x=1739962083;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4fsMpkvryDt2LzZ0h4OPEHC7XVpjdmg/PwbED44BwIQ=;
 b=lwQKaIo5CYDRCLUmJ/I83w2CzUlPpXDfqIL4IPd/L6tfquywCi4WS0Bi4AxxjFNtug
 nE6xL2wnQ93x4jNwtJCM2O3uGHpStoDkmBwT1+mTHcoy63CMJfipUdWCuGZR6zWuMgjT
 FK8mJoQ75yRl3V5e8jynRDtixfOvotB4hrlVkZ0dmwxQp6DiVfXiwxPl1GAWxJzoDT5/
 xlL0nHXIze+64W3a6dingEhz/b91ZYqZgnn9kK0Z5qlEJibZI33KOBAsN1jtY2vEh5sC
 uFhYdE9tQbvl+KNB2aQo7c7gFe11QsGcTnWBTxVy2bo0T7XG6HenZr4n4RfwV4SEoAZr
 w/XA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWC2kDoNBisGxLPGtqj9FR6BHNsKWgknhuZMaCBNhflv5XXjYxqRuUVXvcuDkh2Ddk6S0kleNc5HUo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxgt+xxuFxuse65nTKOxicXIfLepPLEp1gVU0yA0iSM75md9fck
 Rn9ICl81omH+H9UriTjk7j66r9cvCMnWQCejDiaFSHeV5MVxoY1hDHWnQGg2B40vpzcufG3vcrl
 2mlmm0vCwqyeDqkboZ2ioyCI/8XPNQrygNRj82dBD8t+P+hNpnbiO3EuC9QMN/xwN4w==
X-Gm-Gg: ASbGncuiIrd6ib/hA6PTd9K7oiLngluZ5fD3P5Hj3nKtxToMZ64tclzGq5UoFjkwRNW
 d19cvWykE+mwcX81ruR9J7m52og+p2iHQKJFLT1Dc4F9rDPk0hXOAv1lsBtC1EdjlGZn7umBLdt
 ziGFXyaU4GBph1mJUvthxPQQqDNrIKlA0+S1gPSLqmlXQUdwPXx3mZYO5x91esldjWSmrpWCOJl
 HGcqWxB3o/FkMblGISWXfufEq60LzOlAzl3FDvq5EFPL5Y2o2YNC1wI6MWP9hxZBKXSlBgkZfwT
 9rTzEXnIr1pOmMHpToaHIFT2GZYDubKhutBTyXptRtAMgI5cmvCcbHtRlQZKRIpUibDKG4c+MN5
 fUuI0Q6AWE1mQx3Db/q2AxOvnJVhRco+iDt4tA2SQ+77gyMXsK0TiReE=
X-Received: by 2002:a17:907:1c29:b0:ab7:bd8c:3501 with SMTP id
 a640c23a62f3a-ab7db35bf15mr680650666b.18.1739357283035; 
 Wed, 12 Feb 2025 02:48:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFkdB7Pi0J1+nM7qlAaDy/GDdKVi9B1YckCYUNv866WaVvUJfQA1SBNJ+NyM9ozbis0yn7i6w==
X-Received: by 2002:a17:907:1c29:b0:ab7:bd8c:3501 with SMTP id
 a640c23a62f3a-ab7db35bf15mr680648966b.18.1739357282577; 
 Wed, 12 Feb 2025 02:48:02 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab7f6064185sm102447366b.175.2025.02.12.02.48.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Feb 2025 02:48:02 -0800 (PST)
Message-ID: <eec5bb5f-80ad-469e-b3bc-1e8bb2de36a2@redhat.com>
Date: Wed, 12 Feb 2025 11:48:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] drm: panel-orientation-quirks: Add quirk for AYA
 NEO Slide
To: John Edwards <uejji@uejji.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Andrew Wyatt <fewtarius@steamfork.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250124204648.56989-2-uejji@uejji.net>
 <20250124204648.56989-8-uejji@uejji.net>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250124204648.56989-8-uejji@uejji.net>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -jmmBAjNqpAFAAI84Hh_LkFPlRg_5im6XkHyTpiToUo_1739357283
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

On 24-Jan-25 9:46 PM, John Edwards wrote:
> From: Andrew Wyatt <fewtarius@steamfork.org>
> 
> The AYANEO Slide uses a 1080x1920 portrait LCD panel.  This is the same
> panel used on the AYANEO Air Plus, but the DMI data is too different to
> match both with one entry.
> 
> Add a DMI match to correctly rotate the panel on the AYANEO Slide.
> 
> This also covers the Antec Core HS, which is a rebranded AYANEO Slide with
> the exact same hardware and DMI strings.
> 
> Signed-off-by: Andrew Wyatt <fewtarius@steamfork.org>
> Signed-off-by: John Edwards <uejji@uejji.net>
> Tested-by: John Edwards <uejji@uejji.net>
> ---
>  drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> index c5acf2628..9e6708cd1 100644
> --- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
> +++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> @@ -244,6 +244,12 @@ static const struct dmi_system_id orientation_data[] = {
>  		  DMI_MATCH(DMI_BOARD_NAME, "KUN"),
>  		},
>  		.driver_data = (void *)&lcd1600x2560_rightside_up,
> +	}, {	/* AYA NEO SLIDE */
> +		 .matches = {
> +		   DMI_EXACT_MATCH(DMI_SYS_VENDOR, "AYANEO"),
> +		   DMI_MATCH(DMI_PRODUCT_NAME, "SLIDE"),
> +	},

Since this '}' is closing the .matches initializer it should be indented 2 tabs

> +		.driver_data = (void *)&lcd1080x1920_leftside_up,
>  	}, {    /* AYN Loki Max */
>  		.matches = {
>  			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ayn"),

Regards,

Hans


