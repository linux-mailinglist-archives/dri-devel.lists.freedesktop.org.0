Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8EC460AC76
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 16:07:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A664010E77E;
	Mon, 24 Oct 2022 14:07:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CD2910E770
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 14:07:22 +0000 (UTC)
Received: from [192.168.2.241] (109-252-112-196.nat.spd-mgts.ru
 [109.252.112.196])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 1A20666022FA;
 Mon, 24 Oct 2022 15:07:19 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1666620441;
 bh=sh6JZHjVcK4sQR6FMJhukO2i+LgagypVBp5Ixu2ZJ04=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=agiH1/riKKLqF6w+zZcA3BzMKtNhnxHuLi3mqYL/U855m1CpPn5VcizrGW5DIFtRg
 3f1i6dOP9LYg6+BPrlo/U5VJPr38c7kiJ5XlJLWMgBZgfk1D6Wrt1s/FWq9AtHq7rH
 z8UadbAas+5WPjwHbJh5cEcAsRh1xDuROL+S6GycY06Jv+X59/KtjqpEy3s91G73Dc
 dyARWtK402D0vpZa586R5zqHMRL/vvBjZ8uMKnuqlcJiV1QCCC9h8MIq5f2o8N1Eyo
 eAb+1QU5nTD6Fa5tw9YRlLi960Ipfg29aW/W1yxgsHQFWNz6VzAkTnjWhP7kG3fl+N
 LKeGCu1ZqV6bQ==
Message-ID: <7950e2cc-aa1d-3d58-d613-37a5c873e529@collabora.com>
Date: Mon, 24 Oct 2022 17:07:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v1] ACPI: video: Fix missing native backlight on
 Chromebooks
To: Hans de Goede <hdegoede@redhat.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Sean Paul <seanpaul@chromium.org>
References: <20221024133201.43753-1-dmitry.osipenko@collabora.com>
 <92e9d424-0672-b37e-b8b3-cac431ade7f7@redhat.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <92e9d424-0672-b37e-b8b3-cac431ade7f7@redhat.com>
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

On 10/24/22 16:46, Hans de Goede wrote:
> Hi,
> 
> On 10/24/22 15:32, Dmitry Osipenko wrote:
>> Chromebooks don't have backlight in ACPI table, they suppose to use
>> native backlight in this case. Check presence of the CrOS embedded
>> controller ACPI device and prefer the native backlight if EC found.
> 
> Thank you for this patch!
> 
>> Suggested-by: Hans de Goede <hdegoede@redhat.com>
>> Fixes: b1d36e73cc1c ("drm/i915: Don't register backlight when another backlight should be used (v2)")
>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>> ---
>>  drivers/acpi/video_detect.c | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/acpi/video_detect.c b/drivers/acpi/video_detect.c
>> index 0d9064a9804c..8ed5021de6fb 100644
>> --- a/drivers/acpi/video_detect.c
>> +++ b/drivers/acpi/video_detect.c
>> @@ -668,6 +668,11 @@ static const struct dmi_system_id video_detect_dmi_table[] = {
>>  	{ },
>>  };
>>  
>> +static bool google_cros_ec_present(void)
>> +{
>> +	return acpi_dev_found("GOOG0004");
>> +}
>> +
>>  /*
>>   * Determine which type of backlight interface to use on this system,
>>   * First check cmdline, then dmi quirks, then do autodetect.
>> @@ -730,6 +735,9 @@ static enum acpi_backlight_type __acpi_video_get_backlight_type(bool native)
>>  			return acpi_backlight_video;
>>  	}
>>  
>> +	if (google_cros_ec_present())
>> +		return acpi_backlight_native;
>> +
> 
> Nice, a couple of remarks:
> 
> 1. Maybe add a small comment explaining why, like all the other tests in the function have a small comment ?
> 
> 2. I think it would be better to do:
> 
> 	if (google_cros_ec_present() && native_available)
> 		return acpi_backlight_native;
> 
> I can e.g. imagine in the future some chromebooks where for some reason native
> GPU backlight control is not available using the EC for backlight control
> and then having the chrome-ec code register a backlight with "vendor" type ?
> 
> 3. This will also trigger on the Framework laptops and possible other new
> non Chromebook designs which choose to use the Chrome EC code for their EC,
> I don't expect these devices to get to this point of __acpi_video_get_backlight_type()
> (they will hit the earlier acpi_video / native paths) but still I want to
> at least point this out in case someone sees a potential issue with this?
> 
> 
> If you can address 1. and 2. from above (or explain why 2. is a bad idea)
> then I believe that the next version of this can get merged to resolve
> the chromebook backlight issues introduced in 6.1-rc1, thank you!

I don't have anything against 2., it also works.

Thank you for the review!

-- 
Best regards,
Dmitry

