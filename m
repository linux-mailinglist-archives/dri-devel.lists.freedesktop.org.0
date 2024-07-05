Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D006C92863E
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2024 11:59:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06E1710E34E;
	Fri,  5 Jul 2024 09:59:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lvGB/rQu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C350010E34E
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2024 09:59:55 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-a77c9c5d68bso62794466b.2
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jul 2024 02:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720173594; x=1720778394; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :references:to:from:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SKgtgRZLEfAbMpFmEcwxpU/wSTAQbwavUN4ozRaHrMk=;
 b=lvGB/rQupKYP4SpYjwmNRsGlAklsGXp8LK3G5kk5SpuPwu0oSdj0WGqJ6la/1T/Agk
 atKtnuR3N4FVqIHDMrYkSoUnvOLY0wTUps0U7SZ5w84tU9rAmLyXOHq0QsfgzPK9JTaW
 69UGCDz4UQXGjVKimnn4i0nu+nYGb/6FjSwBXVf/5D7taXFkG/kdKDRGZ2GzSSflIY7I
 tWpvcnPdRjRVF6trMDTU4f5g7nf+UmsZdhoQcsvDqoxzIgaAyXNJLeeOEeiBPW/SCkkh
 nbsBkMSGb1v2YtK3vNbZFe1YOeNBScsvq9/62W/+2ddqRBXnJey6Bi4jPj2Ry+V7Hz/h
 ckaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720173594; x=1720778394;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :references:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SKgtgRZLEfAbMpFmEcwxpU/wSTAQbwavUN4ozRaHrMk=;
 b=WxfRgw9JHhVPgvOxnrx+WnLnL5SSEOdWDIQujCTZUo+KoLE61wYfHBYnfyW7zMD9sZ
 dn54U3npdZ3Pvd9/+Bi3FsuTn/74wYe8TGIG7duSgWzEx7m7RoTp0xxPfXLEhH0+Rg1O
 NPYDj6s/VX21zHUXfZsy1QxShXPmUqIW3eSLzJSNg3AukfdXxRqO5US37x7Y7cXosNql
 ofVCU+EScrqLbj+RiIdLJp85Xype6ZTDbKADQKLohWlixDP5WuqnA4LxcSAfwPivQAam
 4jgWi1cFDMPgKNTdnmscSUvjBrRWwN2ejO65yW1VNenCan9Ju+dzqTBYAkiyv5VHMupl
 vTtg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqkx8m1RpNoMXxzadbHr9XwA1UlpUxSKlMFhzO56tHXfzv75NVZH7dsw2rAG8Jrx4BEYX96jw200QWqjTxM5/DWQeCmrNFzVOq2EJ8ILU/
X-Gm-Message-State: AOJu0YwzZzrp8WNx+U0w2lmggE9WJcvG9i69LkD0U4SjPs8ObiniLxZz
 Ekhxpa/JihNT2NNAQYqhcgxMs8Ef2yC3aNdVgGWhY4sWga+6AyeJle8NZr6JvUU=
X-Google-Smtp-Source: AGHT+IHeO8PiPw+P+aoHjk5QKEI+tmy/UZRo1wPdFqzdJBo7Ecrn+FfD66pUENyi3PB68lhTzHpeIg==
X-Received: by 2002:a17:906:695:b0:a74:914b:ffb2 with SMTP id
 a640c23a62f3a-a77ba727b76mr277580666b.72.1720173593936; 
 Fri, 05 Jul 2024 02:59:53 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.137])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a72aaf1d201sm657867666b.9.2024.07.05.02.59.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Jul 2024 02:59:53 -0700 (PDT)
Message-ID: <f207b481-f530-4f54-a482-218908869050@linaro.org>
Date: Fri, 5 Jul 2024 11:59:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] drm/sti: hdmi: drop driver owner assignment
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20240330203831.87003-1-krzysztof.kozlowski@linaro.org>
 <20240330205722.93801-1-krzysztof.kozlowski@linaro.org>
 <20240527144700.GC713992@gnbcxd0016.gnb.st.com>
 <77b4e4ad-2b1e-4b6d-bc3b-0c7b339bc295@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <77b4e4ad-2b1e-4b6d-bc3b-0c7b339bc295@linaro.org>
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

On 04/06/2024 15:18, Krzysztof Kozlowski wrote:
> On 27/05/2024 16:47, Alain Volmat wrote:
>> Hi Krzysztof,
>>
>> thanks for your patch, sorry for the delay.
>>
>> On Sat, Mar 30, 2024 at 09:57:21PM +0100, Krzysztof Kozlowski wrote:
>>> Core in platform_driver_register() already sets the .owner, so driver
>>> does not need to.  Whatever is set here will be anyway overwritten by
>>> main driver calling platform_driver_register().
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> ---
>>>
>>> I forgot two drivers.
>>>  drivers/gpu/drm/sti/sti_hdmi.c | 1 -
>>>  1 file changed, 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/sti/sti_hdmi.c b/drivers/gpu/drm/sti/sti_hdmi.c
>>> index 500936d5743c..b0d84440a87b 100644
>>> --- a/drivers/gpu/drm/sti/sti_hdmi.c
>>> +++ b/drivers/gpu/drm/sti/sti_hdmi.c
>>> @@ -1485,7 +1485,6 @@ static void sti_hdmi_remove(struct platform_device *pdev)
>>>  struct platform_driver sti_hdmi_driver = {
>>>  	.driver = {
>>>  		.name = "sti-hdmi",
>>> -		.owner = THIS_MODULE,
>>>  		.of_match_table = hdmi_of_match,
>>>  	},
>>>  	.probe = sti_hdmi_probe,
>>> -- 
>>> 2.34.1
>>>
>>
>> Acked-by: Alain Volmat <alain.volmat@foss.st.com>
> 
> What does this ack mean? You are the maintainer, so what is supposed to
> happen now? If maintainer does not take patches, then the DRM STI looks
> orphaned.

+Cc Neil, Dmitry,

I pinged and pinged and wanted some sort of clarification here but one
month passed and nothing was clarified.

I could be understanding the DRM process wrong, but if no one picks up
trivial cleanups for 1.5 months, then to me subsystem is orphaned. I
will send respective MAINTAINERS update.

Best regards,
Krzysztof

