Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 034947EDD31
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 09:58:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C4B310E099;
	Thu, 16 Nov 2023 08:58:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43AD010E24F
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 08:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700125092;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lzR95smyeeh/FiV11pRQQl93svK/jp4ut938ur2cfQs=;
 b=OZy361w2vFp4ufu6q8s1/IbK3ugnom81J/qMKY8RXu0GiKEG9aJHBdor23JsJ5odLvaxr1
 HmmE4ZiVhlgm74cAkW7ZmEXdpxZKeDGGC8Cm6JwfMaNJmj5lFUm9AqcPCCCEEMpTg8AHj0
 u+kFnCoW5SFsi5rHrXIcoTUH01Cm7Ew=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-468-Q9tWE2x0NZqGB1deMHNY8g-1; Thu, 16 Nov 2023 03:58:09 -0500
X-MC-Unique: Q9tWE2x0NZqGB1deMHNY8g-1
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-53fa5cd4480so407354a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 00:58:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700125088; x=1700729888;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lzR95smyeeh/FiV11pRQQl93svK/jp4ut938ur2cfQs=;
 b=Z0RV/w78Q02WFfH37g1AIjtFUwkG9sRDDQPDjcuQiqPA/cF5pXCNnMl/nR+8nKAXst
 GUC6SAPeyWxFyoMoZpBSyh85UYojOeSeJ9Xc7TThg/lUxh5uNkTLkIyQIpc/pBE0pprd
 6UPH2pKZnSDFCrVULQriBWJznjmDF9pMCiN8vKhKxXpSizIFWWLCh6HvqDr8W0N6LijX
 okgyB0FUh/WjvIJLThhVqZpBgxhXJtYyOfPXMoA00PtuIcOFwRMnejvTTlh/3l7ofQKB
 Qhwn2cKc35HhM5em7hhBEoUyAjoJogUZMRs2nm0a/u+Vq/d/zS1bQ8wIoWMSM/8DQ2Q5
 YIdQ==
X-Gm-Message-State: AOJu0Yx4onvpnFHgd6IrVfMHa9voP0u5Ao16FdQLZL85Yhwv480kIxKc
 HYw4VgxFg2xuo8DOmEe1QtZJ8lFPhWHdvwgKrJdT784flxQqZWqUZdkbRZ4aCOtVKVdsj4lk9vW
 XLPloN8AA1FlliO9ZsLi7MhlmFAAQ
X-Received: by 2002:aa7:d4c2:0:b0:543:9670:7ee8 with SMTP id
 t2-20020aa7d4c2000000b0054396707ee8mr11227126edr.14.1700125088224; 
 Thu, 16 Nov 2023 00:58:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFeO8Z4VQxOJHWlez75/PPOrqNzsKmQn04wP1vApaXiXcOExOZBZFeAqXryegrjIC2O0lA3eA==
X-Received: by 2002:aa7:d4c2:0:b0:543:9670:7ee8 with SMTP id
 t2-20020aa7d4c2000000b0054396707ee8mr11227112edr.14.1700125087921; 
 Thu, 16 Nov 2023 00:58:07 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 v6-20020a056402174600b00530a9488623sm7474432edx.46.2023.11.16.00.58.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Nov 2023 00:58:07 -0800 (PST)
Message-ID: <e66638b0-bbad-4ac7-ad93-6fb0c6147005@redhat.com>
Date: Thu, 16 Nov 2023 09:58:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [rft, PATCH v4 00/16] drm/i915/dsi: 4th attempt to get rid of
 IOSF GPIO
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20231103201831.1037416-1-andriy.shevchenko@linux.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231103201831.1037416-1-andriy.shevchenko@linux.intel.com>
X-Mimecast-Spam-Score: 0
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 11/3/23 21:18, Andy Shevchenko wrote:
> DSI code for VBT has a set of ugly GPIO hacks, one of which is direct
> talking to GPIO IP behind the actual driver's back. A second attempt
> to fix that is here.
> 
> If I understood correctly, my approach should work in the similar way as
> the current IOSF GPIO.
> 
> Hans, I believe you have some devices that use this piece of code,
> is it possible to give a test run on (one of) them?

Ok, this now has been testen on both a BYT and a CHT device which
actually use GPIO controls in their MIPI sequences so this
series is:

Tested-by: Hans de Goede <hdegoede@redhat.com>

And the code of the entire series also looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

for the series.

Regards,

Hans




> In v4:
> - fixed compile time errors in patch 14 (Hans, LKP)
> - fixed cover letter Subject
> - added patch 15 (as suggested by Ville)
> - added Ack tag (Jani)
> 
> In v3:
> - incorporated series by Jani
> - incorporated couple of precursor patches by Hans
> - added Rb tag for used to be first three patches (Andi)
> - rebased on top of the above changes
> - fixed indexing for multi-community devices, such as Cherry View
> 
> In v2:
> - added a few cleanup patches
> - reworked to use dynamic GPIO lookup tables
> - converted CHV as well
> 
> Andy Shevchenko (9):
>   drm/i915/dsi: Replace while(1) with one with clear exit condition
>   drm/i915/dsi: Get rid of redundant 'else'
>   drm/i915/dsi: Replace check with a (missing) MIPI sequence name
>   drm/i915/dsi: Extract common soc_gpio_set_value() helper
>   drm/i915/dsi: Replace poking of VLV GPIOs behind the driver's back
>   drm/i915/dsi: Prepare soc_gpio_set_value() to distinguish GPIO
>     communities
>   drm/i915/dsi: Replace poking of CHV GPIOs behind the driver's back
>   drm/i915/dsi: Combine checks in mipi_exec_gpio()
>   drm/i915/iosf: Drop unused APIs
> 
> Hans de Goede (2):
>   drm/i915/dsi: Remove GPIO lookup table at the end of
>     intel_dsi_vbt_gpio_init()
>   drm/i915/dsi: Fix wrong initial value for GPIOs in
>     bxt_gpio_set_value()
> 
> Jani Nikula (5):
>   drm/i915/dsi: assume BXT gpio works for non-native GPIO
>   drm/i915/dsi: switch mipi_exec_gpio() from dev_priv to i915
>   drm/i915/dsi: clarify GPIO exec sequence
>   drm/i915/dsi: rename platform specific *_exec_gpio() to
>     *_gpio_set_value()
>   drm/i915/dsi: bxt/icl GPIO set value do not need gpio source
> 
>  drivers/gpu/drm/i915/display/intel_dsi_vbt.c | 355 +++++++------------
>  drivers/gpu/drm/i915/vlv_sideband.c          |  17 -
>  drivers/gpu/drm/i915/vlv_sideband.h          |   3 -
>  3 files changed, 136 insertions(+), 239 deletions(-)
> 

