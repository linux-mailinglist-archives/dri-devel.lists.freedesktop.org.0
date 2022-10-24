Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D39E660AB38
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 15:46:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C8F410E709;
	Mon, 24 Oct 2022 13:46:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 109CE10E709
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 13:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666619180;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6q/xMoeVmga+HpwADG17OmHFg0oiwCuCqYr1QHNmRRc=;
 b=FeNTllDrTEtUaP4IG9+z6HkEuH/iRh8Ek6v0WmQCulr3hzIHAXLlpIZ/8O1Jmnh7Rz2yZE
 0QV5WxuAOOuWSDNzEZTLhk63l7H27fFjok3i2tX4TB6j/vOInVyQ7r0vG5sXQlIExpb2dV
 9wZg1pVdi8sQ/25vJJiBqJY//JDvvSo=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-49-OxDXbXbjNUGdn6OViQ1GHg-1; Mon, 24 Oct 2022 09:46:19 -0400
X-MC-Unique: OxDXbXbjNUGdn6OViQ1GHg-1
Received: by mail-ed1-f72.google.com with SMTP id
 y14-20020a056402270e00b0045d1baf4951so9784444edd.11
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 06:46:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6q/xMoeVmga+HpwADG17OmHFg0oiwCuCqYr1QHNmRRc=;
 b=t/9I5euKcXQQ2Dn27w5ZRsqNYdcldrc1tGbWG3Ho2Bi1a246ev7BN9lXDQdTgSKWw5
 ZDtHttGV0Dnb+VDuILBSdXUMyVrgtrpfuN4nLSIC92Qh0W4WNo0gtB2V+n+9n2/bl5gn
 RMz60MU09MBaoogy12r0Tno/IKHGhwdhUfnJkeH0orSXK6AxDBIuxNS4MexJvx8mspVC
 xCxnb+ZSbMGi1NcEP/gT8a75xRhUOlb+pX82sBoqK8SZXEMLVUx35ODfdlMPfLZLFwiN
 mcYT12VzKX7G8xkGIVMza96ALH8uwoPvtQz3lvpLPhXJkoydtG9ggVVCtGsPVmNIIoWX
 td3g==
X-Gm-Message-State: ACrzQf2pq5qhc7pu6yDi+QxLz315kPODIXJzwk+y5sdtSuzUoSyV9n9T
 dARbUeMFsTp4xBgUH7OdEy56wwm98F/e6Lrj3ajKMO7GH9fkHY+dhI8zJpVr3QLvXUIsLpUquCn
 +LMXGoqS88ZabESU4c7xaHhUJFi3n
X-Received: by 2002:a17:906:da86:b0:740:7120:c6e6 with SMTP id
 xh6-20020a170906da8600b007407120c6e6mr27436723ejb.44.1666619178176; 
 Mon, 24 Oct 2022 06:46:18 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6uMSQOmAR/n4zmJ/YtVjssY4EoT9E812QLXAB+tzpiYwnRu5WPcD0IDb/sMzkkzPqWVtQXng==
X-Received: by 2002:a17:906:da86:b0:740:7120:c6e6 with SMTP id
 xh6-20020a170906da8600b007407120c6e6mr27436705ejb.44.1666619177956; 
 Mon, 24 Oct 2022 06:46:17 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
 by smtp.gmail.com with ESMTPSA id
 i1-20020a170906250100b0077a11b79b9bsm15523488ejb.133.2022.10.24.06.46.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 06:46:17 -0700 (PDT)
Message-ID: <92e9d424-0672-b37e-b8b3-cac431ade7f7@redhat.com>
Date: Mon, 24 Oct 2022 15:46:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v1] ACPI: video: Fix missing native backlight on
 Chromebooks
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Sean Paul <seanpaul@chromium.org>
References: <20221024133201.43753-1-dmitry.osipenko@collabora.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221024133201.43753-1-dmitry.osipenko@collabora.com>
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

On 10/24/22 15:32, Dmitry Osipenko wrote:
> Chromebooks don't have backlight in ACPI table, they suppose to use
> native backlight in this case. Check presence of the CrOS embedded
> controller ACPI device and prefer the native backlight if EC found.

Thank you for this patch!

> Suggested-by: Hans de Goede <hdegoede@redhat.com>
> Fixes: b1d36e73cc1c ("drm/i915: Don't register backlight when another backlight should be used (v2)")
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>  drivers/acpi/video_detect.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/acpi/video_detect.c b/drivers/acpi/video_detect.c
> index 0d9064a9804c..8ed5021de6fb 100644
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
> @@ -730,6 +735,9 @@ static enum acpi_backlight_type __acpi_video_get_backlight_type(bool native)
>  			return acpi_backlight_video;
>  	}
>  
> +	if (google_cros_ec_present())
> +		return acpi_backlight_native;
> +

Nice, a couple of remarks:

1. Maybe add a small comment explaining why, like all the other tests in the function have a small comment ?

2. I think it would be better to do:

	if (google_cros_ec_present() && native_available)
		return acpi_backlight_native;

I can e.g. imagine in the future some chromebooks where for some reason native
GPU backlight control is not available using the EC for backlight control
and then having the chrome-ec code register a backlight with "vendor" type ?

3. This will also trigger on the Framework laptops and possible other new
non Chromebook designs which choose to use the Chrome EC code for their EC,
I don't expect these devices to get to this point of __acpi_video_get_backlight_type()
(they will hit the earlier acpi_video / native paths) but still I want to
at least point this out in case someone sees a potential issue with this?


If you can address 1. and 2. from above (or explain why 2. is a bad idea)
then I believe that the next version of this can get merged to resolve
the chromebook backlight issues introduced in 6.1-rc1, thank you!


>  	/* No ACPI video (old hw), use vendor specific fw methods. */
>  	return acpi_backlight_vendor;
>  }


Regards,

Hans

