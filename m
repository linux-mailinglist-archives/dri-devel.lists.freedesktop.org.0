Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B276647757E
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 16:14:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7ACA10ED5E;
	Thu, 16 Dec 2021 15:14:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C755A10ED79
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 15:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639667694;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0IGzeLjajUCnRDE7wINUWUZGpWtmAg9rxOl9NA2Ty7k=;
 b=YdJV1xPKIrVLXrljpoaZyskad3om+YJBRnDV/4WPqWd2M6IBz/OAhwzG2yIWBZbNkZYggK
 BnQwtSdU33zGVRUwz/HrEpnxp6XlY3js19WEPbDQ8oGyRs+GwPWIk81UOfaMNvRvUFvu+j
 yXZEWgWiqLCAGGkRh53S/j79zAidRKw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-7luC5eO1MWmz-PXBu-5i6g-1; Thu, 16 Dec 2021 10:14:47 -0500
X-MC-Unique: 7luC5eO1MWmz-PXBu-5i6g-1
Received: by mail-ed1-f70.google.com with SMTP id
 v22-20020a50a456000000b003e7cbfe3dfeso23533474edb.11
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 07:14:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0IGzeLjajUCnRDE7wINUWUZGpWtmAg9rxOl9NA2Ty7k=;
 b=XieGHYtYlLhqFN3/lRBp9eBjJfhI2qNahu4MWhr+i1W+kCMgnUea9Ev+342puGY/H/
 b1ggI/H/jpw3VgHHNMo4G0vgIxZlbaTdrKRzqYQm6Ht5WPIMj5EK7BiRb9TkmzoGDZwZ
 3hQcGPcxUJVZraDKXwGm3yh5VgbpJpenjIQcOwZvqQa03By7QruYhkUdwUrQsd2aEDjM
 e3/DXeJEz7BMAZwgbgk4NDImppa2WOjs73pHL95FSKlqbHoX70ePl3vKux++NSIR/2MG
 wKX6S06LdRWFegilfEf4CEF+3Hb6D3O8oA8/Us9gwkQN+GoVVCbIoFkgCctOUVQVPX4M
 RiWA==
X-Gm-Message-State: AOAM532AfOX8yfzONjLVwmYLz0+KgzUaKiZZaI8B3gc4YBBTQdKIVLKN
 iHTlTwW8lukaR9H9aLQUoEQcTlhvakZSPqL88tdbjr79Zl4VYGKawKfHiFw+c+jqvbjUFw2tWeH
 Qjm5KdsWVZuI7il2kgw40zG0dyq84
X-Received: by 2002:a17:907:9713:: with SMTP id
 jg19mr1631597ejc.50.1639667686699; 
 Thu, 16 Dec 2021 07:14:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwIl7HuWWGIjHNlHGHaIdFzzndKDqvuhzPeYprWY+GLu7Rk3se8ETxdr8CxnFg9YWwsapquTQ==
X-Received: by 2002:a17:907:9713:: with SMTP id
 jg19mr1631570ejc.50.1639667686403; 
 Thu, 16 Dec 2021 07:14:46 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1?
 (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
 by smtp.gmail.com with ESMTPSA id w22sm2662051edc.62.2021.12.16.07.14.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 07:14:46 -0800 (PST)
Message-ID: <55e7e783-62d6-19c5-207a-88318a4452fb@redhat.com>
Date: Thu, 16 Dec 2021 16:14:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 1/2] drm/i915/backlight: Drop duplicate
 intel_panel_actually_set_backlight()
To: Jani Nikula <jani.nikula@linux.intel.com>, Lyude <lyude@redhat.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20211121110032.4720-1-hdegoede@redhat.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20211121110032.4720-1-hdegoede@redhat.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 11/21/21 12:00, Hans de Goede wrote:
> After the recent refactoring of the backlight code the contents of
> intel_panel_actually_set_backlight() is exactly the same (minus a
> small wording difference in the drm_dbg_kms() as the contents if the
> more widely used intel_backlight_set_pwm_level() function.
> 
> Drop the duplicate intel_panel_actually_set_backlight() function.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I just realized that I did not push this series to drm-intel-next yet.

Before pushing I double checked my work and I noticed that this patch
is wrong there is a subtle but important difference between
intel_panel_actually_set_backlight() and intel_backlight_set_pwm_level()

intel_panel_actually_set_backlight() calls:

	panel->backlight.funcs->set(conn_state, level);

where as intel_backlight_set_pwm_level() calls:

	panel->backlight.pwm_funcs->set(conn_state, level);

I missed the pwm_funcs vs funcs difference, the funcs->set
function is normally just a wrapper for pwm_funcs->set, but
the dp_aux and dsi_dsc code my overwrite the functions to
which backlight.funcs point to so the difference matters.

Tl;DR: self nack for this one.

Patch 2/2 is still valid and I will push that out shortly.

Regards,

Hans





> ---
>  drivers/gpu/drm/i915/display/intel_backlight.c | 16 ++--------------
>  1 file changed, 2 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_backlight.c b/drivers/gpu/drm/i915/display/intel_backlight.c
> index 9523411cddd8..03cd730c926a 100644
> --- a/drivers/gpu/drm/i915/display/intel_backlight.c
> +++ b/drivers/gpu/drm/i915/display/intel_backlight.c
> @@ -268,18 +268,6 @@ static void ext_pwm_set_backlight(const struct drm_connector_state *conn_state,
>  	pwm_apply_state(panel->backlight.pwm, &panel->backlight.pwm_state);
>  }
>  
> -static void
> -intel_panel_actually_set_backlight(const struct drm_connector_state *conn_state, u32 level)
> -{
> -	struct intel_connector *connector = to_intel_connector(conn_state->connector);
> -	struct drm_i915_private *i915 = to_i915(connector->base.dev);
> -	struct intel_panel *panel = &connector->panel;
> -
> -	drm_dbg_kms(&i915->drm, "set backlight level = %d\n", level);
> -
> -	panel->backlight.funcs->set(conn_state, level);
> -}
> -
>  /* set backlight brightness to level in range [0..max], assuming hw min is
>   * respected.
>   */
> @@ -314,7 +302,7 @@ void intel_backlight_set_acpi(const struct drm_connector_state *conn_state,
>  					 panel->backlight.device->props.max_brightness);
>  
>  	if (panel->backlight.enabled)
> -		intel_panel_actually_set_backlight(conn_state, hw_level);
> +		intel_backlight_set_pwm_level(conn_state, hw_level);
>  
>  	mutex_unlock(&dev_priv->backlight_lock);
>  }
> @@ -863,7 +851,7 @@ static void intel_panel_set_backlight(const struct drm_connector_state *conn_sta
>  	panel->backlight.level = hw_level;
>  
>  	if (panel->backlight.enabled)
> -		intel_panel_actually_set_backlight(conn_state, hw_level);
> +		intel_backlight_set_pwm_level(conn_state, hw_level);
>  
>  	mutex_unlock(&dev_priv->backlight_lock);
>  }
> 

