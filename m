Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9C99185AF
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 17:26:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14EA610E918;
	Wed, 26 Jun 2024 15:26:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="mR9uXrBJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 972B210E914
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 15:26:13 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-424798859dfso55555495e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 08:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1719415571; x=1720020371;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IE+ZoOOI53p58bUMEo+gS3J9r8a6CVYxDRQKle6/oYI=;
 b=mR9uXrBJiTfFFmd+hVksokvdsAIMYx4EGMDBRFGPIlemA2nOd1Mx5v4prmb8x0YPY7
 NJwyH6UDx1g4hddYaz0bpaQWoCED6XMPqIyn7I+Zzgq9M1bgA5w7RJ69krBoaLZ2NfDq
 W7jT0IFimQwCbHcf2jWwpO15TdgKBUqlsephbJSaXOK2wkCW5xzSa644adhl1owfiHaG
 T7KoYkX/1DOvAyAAgimBp5vfLWB5tU1tcOErXmERQj8prw2EyQVGxUSfHXAkFII5DL7H
 p2pd/SH4P5wf6lbWcHiR2MPoe/OGdWXPkLCotk1vPEaMZiIYOChx5XUdLUCjQGMsNBCf
 oHcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719415571; x=1720020371;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IE+ZoOOI53p58bUMEo+gS3J9r8a6CVYxDRQKle6/oYI=;
 b=juWj8MklwlqH6aWtDOHd07yM+EuMs97/LwnPbjzTkMRKcnKk/qvgcl41vX+Ndyi+FX
 OiEOWBZshqMJxlVSOxVUOAS83EJURcyoMWYPN37CP09kcQn4V+5wx9cSVg83qaFO2ueq
 mokQUSasvNZGGWPYBbrgwkudFTwwfukfIoORgm1V3HgPIHBA+wAlectaI+nYKefYGNpX
 TKNW4wF2v89sqEgCXs1dhv2OH7X1VRZwj51OIJf2/P3HR2yrXeo72irNMAfZzusfK4nG
 4VfEHb33qoPOA3+GG0RtT8ncY9djUSx0js8c6t04t5xhO95sg5tr8mrpO3cfjs7/7Khv
 yOPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvIzu8Imbub9+g5qvMDQIGW56PzCUTpifIkpb9hexkw+LTh2hroduuoXiu2b1HGpjZJb0k+4xfvHzSL16zNqxaXLCe5k9/S8zrZ/b7utbU
X-Gm-Message-State: AOJu0YxB3EtK3hdInt7/ykVLLL0uF0egg6bPpg2rZhk5vtsuSSmMszRl
 65xPm+HtY43HUTgBVyoXRNxxM4AIjqLZYCYaH9fRJo3k6T2z+Utjc2z8Oi8P96I=
X-Google-Smtp-Source: AGHT+IEGDHnLPK2eqJ44hAGV9u4g5ILwUSDhPg5bkam/EIvxbEYIuVvtY8uavBFyvxbUsaVObENX7g==
X-Received: by 2002:a05:600c:158a:b0:424:b3cf:d704 with SMTP id
 5b1f17b1804b1-424b3cfd940mr14270765e9.37.1719415571230; 
 Wed, 26 Jun 2024 08:26:11 -0700 (PDT)
Received: from ?IPV6:2a01:e34:ec24:52e0:62d6:6a12:585c:d4e1?
 ([2a01:e34:ec24:52e0:62d6:6a12:585c:d4e1])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-424c8264891sm30481115e9.25.2024.06.26.08.26.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jun 2024 08:26:10 -0700 (PDT)
Message-ID: <19167580-4e25-4820-90f1-2d03c7e9cb04@freebox.fr>
Date: Wed, 26 Jun 2024 17:26:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/bridge: add support for TI TDP158
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, Arnaud Vrac <avrac@freebox.fr>,
 Pierre-Hugues Husson <phhusson@freebox.fr>
References: <20240625-tdp158-v2-0-a3b344707fa7@freebox.fr>
 <20240625-tdp158-v2-2-a3b344707fa7@freebox.fr>
 <bgp36sjj5hvldl4tqtjt7q6eva553hkek55easqpugzhdmcjv2@uhafklf25rit>
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <bgp36sjj5hvldl4tqtjt7q6eva553hkek55easqpugzhdmcjv2@uhafklf25rit>
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

On 26/06/2024 06:47, Dmitry Baryshkov wrote:

> On Tue, Jun 25, 2024 at 06:38:13PM GMT, Marc Gonzalez wrote:
>
>> The TI TDP158 is an AC-Coupled HDMI signal to TMDS Redriver supporting
>> DVI 1.0 and HDMI 1.4b and 2.0b output signals.
>>
>> The default settings work fine for our use-case.
>>
>> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
>> ---
>>  drivers/gpu/drm/bridge/Kconfig     |   6 +++
>>  drivers/gpu/drm/bridge/Makefile    |   1 +
>>  drivers/gpu/drm/bridge/ti-tdp158.c | 103 +++++++++++++++++++++++++++++++++++++
>>  3 files changed, 110 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
>> index c621be1a99a89..0859f85cb4b69 100644
>> --- a/drivers/gpu/drm/bridge/Kconfig
>> +++ b/drivers/gpu/drm/bridge/Kconfig
>> @@ -368,6 +368,12 @@ config DRM_TI_DLPC3433
>>  	  It supports up to 720p resolution with 60 and 120 Hz refresh
>>  	  rates.
>>  
>> +config DRM_TI_TDP158
>> +	tristate "TI TDP158 HDMI/TMDS bridge"
>> +	depends on OF
>> +	help
>> +	  Texas Instruments TDP158 HDMI/TMDS Bridge driver
> 
> Please run ./scripts/checkpatch.pl on your patch.

Oops, sorry, will do.
For the record, I did run:
$ make -j16 dt_binding_check DT_SCHEMA_FILES=ti,tdp158.yaml


>> +	if ((err = regulator_enable(tdp158->vcc)))
>> +		pr_err("%s: vcc: %d", __func__, err);
> 
> - dev_err
> - please expand error messages
> - ERROR: do not use assignment in if condition

simple-bridge.c uses DRM_ERROR, but it says:
"NOTE: this is deprecated in favor of pr_err()"
Hence, I used pr_err.
Are you saying I need to record the dev,
just to be able to call dev_err?


> empty line

Will do.

>> +	return drm_bridge_attach(bridge->encoder, tdp158->next, bridge, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> 
> No. Pass flags directly.

Oh, just pass the flags argument here? OK.


>> +	tdp158->next = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
> 
> Missing `select DRM_PANEL_BRIDGE`

OK.

>> +	if (IS_ERR(tdp158->next))
>> +		return dev_err_probe(dev, PTR_ERR(tdp158->next), "next");
> 
> This results in a cryptic message 'foo: ESOMETHING: next'. Please
> expand.

OK.

Thanks for the in-depth review & suggestions.
Will respin with fixes.

Regards

