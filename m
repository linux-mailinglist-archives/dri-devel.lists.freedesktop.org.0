Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0BD488463
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jan 2022 17:10:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E882510E128;
	Sat,  8 Jan 2022 16:10:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E12A10E128
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Jan 2022 16:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641658212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZfgabDSS/gH6CDQ8l3rvCMIxMgihojIJUexXgrRTlE0=;
 b=N/+AlIDzKro2i40JRlfz0Cso6lYzMF0CopSByJ0vChCtnJ65fRGh0EW+1reEeHfnGLrMWQ
 hSct3F7Jk/Rg3eqpoLLthkQsEr+m8U+9k76GXkk8wX7/JvMdEznj8PcAGAsndaoV6nzBfi
 frCLvl4uFpyTSTTYFPIfHHDouyp6HrI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-202-jvAfoKUXM_WqggcJv_ddZQ-1; Sat, 08 Jan 2022 11:10:10 -0500
X-MC-Unique: jvAfoKUXM_WqggcJv_ddZQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 h11-20020a05640250cb00b003fa024f87c2so6981782edb.4
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Jan 2022 08:10:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZfgabDSS/gH6CDQ8l3rvCMIxMgihojIJUexXgrRTlE0=;
 b=g8FnCH4KTxaiJHGYcA7IG/8wJeuAuej0LzA5w8Qx8wc4+tSnWVApRvousogT12T8zU
 bzU2jXJIOd4y+5kSkneNbMTBmgo9p8c5TCx2xf8y9gu/vknNsDNxgFT/eLUTrMKoeeE9
 kPqbEUS73KexnrOGU3jUdyGlmlW0ylMRGmVuUZNnNpyv1XbJcig9+nSHrn03vlfKVk/n
 DgyXcCCOD3Hklx48J/ZOht3waTGlpluOKAN4OQvY/P3WqS0BHQeNPNXdDEl/zk0XGkgA
 r/VIB7Y/UXed0ZkM1YjHLM9Z65KLToVCPddcZAMLYFZnKMzOcB6MWxSWppTrOiGPhDOy
 8jdg==
X-Gm-Message-State: AOAM531aMPbLJYGJldJawtfPBFJot7ppDzBfh10UXZPSXU9/utcMYDrm
 ibidp3S06rSPX0V8a8OvyX7yutN+1oR4G2+4LiTnQ7Sisyjkr/f7NSG86pg0JDn+plVT86hgsaG
 AL3R+xHQRKcJDHRDW0p14xm3Znqko
X-Received: by 2002:a17:906:86cb:: with SMTP id
 j11mr10313304ejy.40.1641658209796; 
 Sat, 08 Jan 2022 08:10:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzafHPA1hS1YxU4MAlmNDyZjL5mOgs//ZNBjd0fJXg2UApooAeaTTngtJ64hglQALtpKMzMrA==
X-Received: by 2002:a17:906:86cb:: with SMTP id
 j11mr10313276ejy.40.1641658209573; 
 Sat, 08 Jan 2022 08:10:09 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1?
 (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
 by smtp.gmail.com with ESMTPSA id r3sm619371ejr.79.2022.01.08.08.10.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Jan 2022 08:10:09 -0800 (PST)
Message-ID: <d38ec2f9-a21f-d431-235a-9edb59fc40e9@redhat.com>
Date: Sat, 8 Jan 2022 17:10:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v5 3/3] drm/privacy_screen_x86: Add entry for ChromeOS
 privacy-screen
To: Benson Leung <bleung@google.com>, Rajat Jain <rajatja@google.com>
References: <20220107190208.95479-1-rajatja@google.com>
 <20220107190208.95479-3-rajatja@google.com> <YdiPOoU1JrqR7N6S@google.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <YdiPOoU1JrqR7N6S@google.com>
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
Cc: gwendal@google.com, marcheu@google.com,
 Thomas Zimmermann <tzimmermann@suse.de>, seanpaul@google.com,
 David Airlie <airlied@linux.ie>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 Mark Gross <markgross@kernel.org>, ibm-acpi-devel@lists.sourceforge.net,
 dtor@google.com, dri-devel@lists.freedesktop.org,
 Henrique de Moraes Holschuh <hmh@hmh.eng.br>, rajatxjain@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi All,

On 1/7/22 20:06, Benson Leung wrote:
> Hi Rajat, 
> 
> Thanks for your changes here.
> 
> On Fri, Jan 07, 2022 at 11:02:08AM -0800, Rajat Jain wrote:
>> Add a static entry in the x86 table, to detect and wait for
>> privacy-screen on some ChromeOS platforms.
>>
>> Please note that this means that if CONFIG_CHROMEOS_PRIVACY_SCREEN is
>> enabled, and if "GOOG0010" device is found in ACPI, then the i915 probe
>> shall return EPROBE_DEFER until a platform driver actually registers the
>> privacy-screen: https://hansdegoede.livejournal.com/25948.html
>>
>> Signed-off-by: Rajat Jain <rajatja@google.com>
>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> 
> Hi Hans,
> 
> Since this change depends on the privacy screen changes staged for v5.17,
> I'm OK as platform/chrome maintainer to have this go through the drm tree.
> 
> Acked-By: Benson Leung <bleung@chromium.org>

Ok, I will merge this into drm-misc-next coming Monday.

Note I'm afraid that it is too late for 5.17, the drm-misc maintainers
have already created the final drm-misc tag for the 5.17 pull-req.

Regards,

Hans


> 
> 
>> ---
>> v5: * Add Hans' "Reviewed by"
>> v4: * Simplify the detect_chromeos_privacy_screen() function
>>     * Don't change the existing print statement
>> v3: * Remove the pr_info() from detect_chromeos_privacy_screen(), instead
>>       enhance the one already present in drm_privacy_screen_lookup_init()
>> v2: * Use #if instead of #elif
>>     * Reorder the patches in the series.
>>     * Rebased on drm-tip
>>
>>  drivers/gpu/drm/drm_privacy_screen_x86.c | 17 +++++++++++++++++
>>  1 file changed, 17 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_privacy_screen_x86.c b/drivers/gpu/drm/drm_privacy_screen_x86.c
>> index a2cafb294ca6..88802cd7a1ee 100644
>> --- a/drivers/gpu/drm/drm_privacy_screen_x86.c
>> +++ b/drivers/gpu/drm/drm_privacy_screen_x86.c
>> @@ -47,6 +47,13 @@ static bool __init detect_thinkpad_privacy_screen(void)
>>  }
>>  #endif
>>  
>> +#if IS_ENABLED(CONFIG_CHROMEOS_PRIVACY_SCREEN)
>> +static bool __init detect_chromeos_privacy_screen(void)
>> +{
>> +	return acpi_dev_present("GOOG0010", NULL, -1);
>> +}
>> +#endif
>> +
>>  static const struct arch_init_data arch_init_data[] __initconst = {
>>  #if IS_ENABLED(CONFIG_THINKPAD_ACPI)
>>  	{
>> @@ -58,6 +65,16 @@ static const struct arch_init_data arch_init_data[] __initconst = {
>>  		.detect = detect_thinkpad_privacy_screen,
>>  	},
>>  #endif
>> +#if IS_ENABLED(CONFIG_CHROMEOS_PRIVACY_SCREEN)
>> +	{
>> +		.lookup = {
>> +			.dev_id = NULL,
>> +			.con_id = NULL,
>> +			.provider = "privacy_screen-GOOG0010:00",
>> +		},
>> +		.detect = detect_chromeos_privacy_screen,
>> +	},
>> +#endif
>>  };
>>  
>>  void __init drm_privacy_screen_lookup_init(void)
>> -- 
>> 2.34.1.575.g55b058a8bb-goog
>>
> 

