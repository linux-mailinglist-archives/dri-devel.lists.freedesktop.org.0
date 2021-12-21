Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9576447C706
	for <lists+dri-devel@lfdr.de>; Tue, 21 Dec 2021 19:53:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4725511B5C5;
	Tue, 21 Dec 2021 18:53:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A0AC11B5C5
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Dec 2021 18:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640112814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RaxEfKPsvW2G/7TOdhBfY5WrgkaW6Nyc3UL395DMCcQ=;
 b=P7f3mFQkypbxJCbYd3Bb/DrrMLROUCLfpkO6Lus4RaezfChWM3Mv53w3KSv5qhgsl1KkeN
 EODobJgVngysp1MbEkmbIy1KP2R67zpilwYjztsJCqdeetNNEdbBUV8EJ9TD5mkcPg/TGn
 H8zWlyzYTS+GQHRH6xtI54N3o0wefzQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-217-R_ycAvmZPq6PUey1U7S0AA-1; Tue, 21 Dec 2021 13:53:31 -0500
X-MC-Unique: R_ycAvmZPq6PUey1U7S0AA-1
Received: by mail-ed1-f70.google.com with SMTP id
 y10-20020a056402358a00b003f88b132849so33505edc.0
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Dec 2021 10:53:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RaxEfKPsvW2G/7TOdhBfY5WrgkaW6Nyc3UL395DMCcQ=;
 b=WUhviudo/uHO1dzh2WwfpyUt0GW7ixF8JytS1gqr5KeRmgrJAGdWgHaMdb29GM7n2u
 NcvlwqACuRDaieTqkiy46nYwkjj2EUbkMQQkeolciMyALrYMyjL7swgM6nZAV1aBSB6s
 k5zk+DvchZxqUAOBJJBHSbYRar/jj5/53JdDTlkNmJF8221p67ab3QWELkYAw88xyxX6
 1IlNyLGGoKE6O2Cyoeg5SI10GwXmEQnYDnSQ55yFi03v1uQ5u+G62U4QxFbmaaFZZ5td
 r3Ltv8hCyuidlynZ0c2h9IhPw0HPBSpy1EOuaBBxNZE9hLeOA3cEyXa7rgm5rm5RHSh6
 sw9A==
X-Gm-Message-State: AOAM533LcTF209/VGhxFAQy5Mn5PpPv0xvCvVrHHPnMy9u86S+yO/Xa4
 0nz5AY4c3vX50+JL0oloO7J481ZtL+bKx+suZZ1fKGNrdO06hi4Zs5iV02pQdWELkDM/eXrKT3e
 0k/aQ80sra90mWMzHvb4ZnUbP9/EV
X-Received: by 2002:a17:906:2802:: with SMTP id
 r2mr3940472ejc.172.1640112810367; 
 Tue, 21 Dec 2021 10:53:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwRqLy4pcUlbMjBepIrlRH0zBM2jdr2lBOYDmUXU8Typ0GYIlXRJZrjUnh4K1UqEUq6499rUA==
X-Received: by 2002:a17:906:2802:: with SMTP id
 r2mr3940454ejc.172.1640112810048; 
 Tue, 21 Dec 2021 10:53:30 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1?
 (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
 by smtp.gmail.com with ESMTPSA id i6sm5695402edx.46.2021.12.21.10.53.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Dec 2021 10:53:29 -0800 (PST)
Message-ID: <c6abc6df-6e66-38e3-d934-e71467d71f88@redhat.com>
Date: Tue, 21 Dec 2021 19:53:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v3 3/3] drm/privacy_screen_x86: Add entry for ChromeOS
 privacy-screen
To: Rajat Jain <rajatja@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Benson Leung <bleung@chromium.org>,
 Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
 Mark Gross <markgross@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, ibm-acpi-devel@lists.sourceforge.net,
 platform-driver-x86@vger.kernel.org, gwendal@google.com,
 seanpaul@google.com, marcheu@google.com, dtor@google.com
References: <20211220222828.2625444-1-rajatja@google.com>
 <20211220222828.2625444-3-rajatja@google.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20211220222828.2625444-3-rajatja@google.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
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
Cc: rajatxjain@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 12/20/21 23:28, Rajat Jain wrote:
> Add a static entry in the x86 table, to detect and wait for
> privacy-screen on some ChromeOS platforms.
> 
> Please note that this means that if CONFIG_CHROMEOS_PRIVACY_SCREEN is
> enabled, and if "GOOG0010" device is found in ACPI, then the i915 probe
> shall return EPROBE_DEFER until a platform driver actually registers the
> privacy-screen: https://hansdegoede.livejournal.com/25948.html
> 
> Signed-off-by: Rajat Jain <rajatja@google.com>
> ---
> v3: * Remove the pr_info() from detect_chromeos_privacy_screen(), instead
>       enhance the one already present in drm_privacy_screen_lookup_init()
> v2: * Use #if instead of #elif
>     * Reorder the patches in the series.
>     * Rebased on drm-tip
> 
>  drivers/gpu/drm/drm_privacy_screen_x86.c | 23 ++++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_privacy_screen_x86.c b/drivers/gpu/drm/drm_privacy_screen_x86.c
> index a2cafb294ca6..0fdd2b500e6d 100644
> --- a/drivers/gpu/drm/drm_privacy_screen_x86.c
> +++ b/drivers/gpu/drm/drm_privacy_screen_x86.c
> @@ -47,6 +47,16 @@ static bool __init detect_thinkpad_privacy_screen(void)
>  }
>  #endif
>  
> +#if IS_ENABLED(CONFIG_CHROMEOS_PRIVACY_SCREEN)
> +static bool __init detect_chromeos_privacy_screen(void)
> +{
> +	if (!acpi_dev_present("GOOG0010", NULL, -1))
> +		return false;
> +
> +	return true;

This can be simplified to just:

	return acpi_dev_present("GOOG0010", NULL, -1);

> +}
> +#endif
> +
>  static const struct arch_init_data arch_init_data[] __initconst = {
>  #if IS_ENABLED(CONFIG_THINKPAD_ACPI)
>  	{
> @@ -58,6 +68,16 @@ static const struct arch_init_data arch_init_data[] __initconst = {
>  		.detect = detect_thinkpad_privacy_screen,
>  	},
>  #endif
> +#if IS_ENABLED(CONFIG_CHROMEOS_PRIVACY_SCREEN)
> +	{
> +		.lookup = {
> +			.dev_id = NULL,
> +			.con_id = NULL,
> +			.provider = "privacy_screen-GOOG0010:00",
> +		},
> +		.detect = detect_chromeos_privacy_screen,
> +	},
> +#endif
>  };
>  
>  void __init drm_privacy_screen_lookup_init(void)
> @@ -68,7 +88,8 @@ void __init drm_privacy_screen_lookup_init(void)
>  		if (!arch_init_data[i].detect())
>  			continue;
>  
> -		pr_info("Found '%s' privacy-screen provider\n",
> +		pr_info("Found '%s' privacy-screen provider."
> +			"Might have to defer probe for it...\n",
>  			arch_init_data[i].lookup.provider);

I'm afraid this change in the log message will only confuse users,
and for your goal of checking if a privacy-screen provider has
been detected, the original message is good enough.

Please drop this part of the patch.

Regards,

Hans



>  
>  		/* Make a copy because arch_init_data is __initconst */
> 

