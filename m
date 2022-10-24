Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1C360ADBE
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 16:32:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9041910E7D9;
	Mon, 24 Oct 2022 14:32:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2CAE10E7D1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 14:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666621965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=St4Oo1+ZOBe0lGhOZfdzJtwdKULc2yTF38gsrCy5cIs=;
 b=CgdfEYfb1gao8O1JGgDrpyWvT32XX2Lu9h7B2zsyI/scgeLm9l9jTAJkIXXDfWP4GS8YME
 GR7PfcNe/hQTfs3lK40+icgZGXgQc+KAB0/BJLVV9OWew0FB7yousHEi4+RMWdI2kQTy/r
 8yxg2j9tXniGKXTiSrM7lJU+Ty9y564=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-10-i1FTFKG3OjevwJWe9MX97A-1; Mon, 24 Oct 2022 10:32:42 -0400
X-MC-Unique: i1FTFKG3OjevwJWe9MX97A-1
Received: by mail-ed1-f71.google.com with SMTP id
 v13-20020a056402348d00b0045d36615696so9865258edc.14
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 07:32:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=St4Oo1+ZOBe0lGhOZfdzJtwdKULc2yTF38gsrCy5cIs=;
 b=2FWgI5EI8aymE4Bru5O12h/lI9RVgEMTWQtP+tGYKwirtV0uTOg0+mmRmkMVmMv71N
 2LIEcBFzboh5OL2vCjhmocCT1T2iIKuZOKRsRH0i0kV1Lu3q3abdDlcj8g3UgHN6aGJt
 5dgJm2vCvo/yfdk5SbtveWAZorq3PLGdYGHuV0tprBT+yj9Fuj84NY0JPwuiFW+KOh+o
 6pK+EkyurtHc6tKa5eNxPZpnmQghIC0KmGXV0awzmWQ7lOczniWiuSpS0NSlf8K++cXY
 gU/bNwixiQ/UjoTMbZ27tscUEVFczfCgcupHYiNzEwP/8Qlsm/BBJX4eE8gNCPdh7Vqa
 TD5w==
X-Gm-Message-State: ACrzQf1chRh+AKybbtuWhCPVNtlNrIm7gXif6QKEqN5uu3KH2ACY6Wb3
 fDvUOqYRi1FL0ax19yNdvqRZlNjIokbU6QrTO/FvyPEe11koOgtp0vBRmUX/itEX2JSiSGlEMeJ
 s/dEP3WjelEVdeuyLBVqY1HDprmOL
X-Received: by 2002:a05:6402:2710:b0:45c:d7b4:6948 with SMTP id
 y16-20020a056402271000b0045cd7b46948mr30996976edd.215.1666621960896; 
 Mon, 24 Oct 2022 07:32:40 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7FteBuj1i+suD+fzUBHUwobCQ42/zPj3LuJ2XNuBwLGr/mL3KqKm8I/n6s3gjZh8Jv/+v1Ag==
X-Received: by 2002:a05:6402:2710:b0:45c:d7b4:6948 with SMTP id
 y16-20020a056402271000b0045cd7b46948mr30996964edd.215.1666621960720; 
 Mon, 24 Oct 2022 07:32:40 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
 by smtp.gmail.com with ESMTPSA id
 ed5-20020a056402294500b00461621cae1fsm4010174edb.16.2022.10.24.07.32.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 07:32:39 -0700 (PDT)
Message-ID: <dda4b024-69d2-1d1d-da23-e922e5b6128a@redhat.com>
Date: Mon, 24 Oct 2022 16:32:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2] ACPI: video: Fix missing native backlight on
 Chromebooks
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Sean Paul <seanpaul@chromium.org>
References: <20221024141210.67784-1-dmitry.osipenko@collabora.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221024141210.67784-1-dmitry.osipenko@collabora.com>
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
Cc: linux-acpi@vger.kernel.org, kernel@collabora.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 10/24/22 16:12, Dmitry Osipenko wrote:
> Chromebooks don't have backlight in ACPI table, they suppose to use
> native backlight in this case. Check presence of the CrOS embedded
> controller ACPI device and prefer the native backlight if EC found.
> 
> Suggested-by: Hans de Goede <hdegoede@redhat.com>
> Fixes: 2600bfa3df99 ("ACPI: video: Add acpi_video_backlight_use_native() helper")
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
> 
> Changelog:
> 
> v2: - Added explanatory comment to the code and added check for the
>       native backlight presence, like was requested by Hans de Goede.

Thanks this version looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Rafael, can you pick this up and send it in a fixes pull-req
for 6.1 to Linus? Or shall I pick this one up and include it
in my next pull-req?

Regards,

Hans





> 
>  drivers/acpi/video_detect.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/acpi/video_detect.c b/drivers/acpi/video_detect.c
> index 0d9064a9804c..9cd8797d12bb 100644
> --- a/drivers/acpi/video_detect.c
> +++ b/drivers/acpi/video_detect.c
> @@ -668,6 +668,11 @@ static const struct dmi_system_id video_detect_dmi_table[] = {
>  	{ },
>  };
>  
> +static bool google_cros_ec_present(void)
> +{
> +	return acpi_dev_found("GOOG0004");
> +}
> +
>  /*
>   * Determine which type of backlight interface to use on this system,
>   * First check cmdline, then dmi quirks, then do autodetect.
> @@ -730,6 +735,13 @@ static enum acpi_backlight_type __acpi_video_get_backlight_type(bool native)
>  			return acpi_backlight_video;
>  	}
>  
> +	/*
> +	 * Chromebooks that don't have backlight handle in ACPI table
> +	 * are supposed to use native backlight if it's available.
> +	 */
> +	if (google_cros_ec_present() && native_available)
> +		return acpi_backlight_native;
> +
>  	/* No ACPI video (old hw), use vendor specific fw methods. */
>  	return acpi_backlight_vendor;
>  }

