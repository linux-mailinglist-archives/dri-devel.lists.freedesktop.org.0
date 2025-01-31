Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34EB0A23A44
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2025 08:43:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 672D210EA26;
	Fri, 31 Jan 2025 07:43:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b="p8En1DnK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54A3410EA26
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2025 07:43:32 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-21628b3fe7dso30773475ad.3
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 23:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1738309412;
 x=1738914212; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4+s6PUYoAuvVOLOYu4NXTnsi8GEijG6VOLQxGoXEUQQ=;
 b=p8En1DnK7YJeE747Ja/yjqhnHWX4Jy7rUxXOQU8svQnAvniaIWH5wQCJRIRlR1ODq3
 G/lV7JGmxsOyKEkdRSSPZ+vkGZPmOvGdpHHPVYvOY5pcn/lzTd+ZpNVbTYdQNGuhQoqb
 SdPUXav08nfIue5HDh5aiUcnhsul8Fob/mWMe8iXBerWnFhnFTZUj3HxkDb7Ddt0JLRu
 +gRiHjd9RUy6COkpKPwCJ2Q+v0020pIrOi26L/PoPKdGp/yHVa0xwWUbmpZvW7EQnfjl
 Jgj04A1L7gwnUKARP7Cty2ebdUzljEd3Y6No8Idu7lDdV1BDtCYG7lDa78Bd56yZHDES
 MBKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738309412; x=1738914212;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4+s6PUYoAuvVOLOYu4NXTnsi8GEijG6VOLQxGoXEUQQ=;
 b=tPvQ1pUfxuQvkZ8tf58TT+wORL+5HP4rxW5xWA4sfnap9/Tdyk/yTLuAjRi/Rw08EA
 X9Zwb1K+IMS1q16n1yjVcePMx3fKOQRaqZa05+HKJZyVAKAQlURijzdu4Dw33SuK8VvJ
 AkQGQaDUnVYW9nx38GkLb04P/9JngKiI8VNDai14KWiu96Lg9GQL2/davsNzPTwMqH2k
 1CBMTCGeKv7Zypjd707kh5yeoZVHxURSwFnGsn/6YX/ffJe2hSUhEyi7/GP/2MEMFvR8
 czxWDFBWPC4tG8JdX6Z4UW2RLdcuHE5TMQLYVUjxGAAuGiMgySmG1OhJWDCh32WZrlDi
 dJSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKtMyY3GckPBwy9QgC088luhc3D8FRxQ2j6RUmIUkwpXbI13TjBYCn59JYqRmoZU+tSNpH4SIEffk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzl435/M1IhFmMtNy+f8vQFpplSxv+OnaLo1b2/qdVK/rXgUKKD
 ZW9hA0nEuiw3YVJAfiX+md4a/rJtLYhPku7Uqm2700TpjR0BetjpisbUntKNsis=
X-Gm-Gg: ASbGnct8evbBGekT85uZAtlcKPFnerqwabN2ZlB+ZCwXs3GA8zhDaqVyVOZFVskBK7F
 sMhpWLu7b4SpFAZUy//uy2FFqCvhhPX/D4rYu7EJrto2QRNEaPyhoA/LllbWlLmrCygw45E6ElJ
 MhFp+tt2zkmSwkkIQpOL+8BNCPf++ktbiY3afq2SZoUqJb2TT44MgbirWBeo56gtmYv1mTwM8I/
 qWyS4fHUDcxvbs8Sh1Dbah/VYg9Hkks4bT4FXbnb7mrb/sEBCtrg9aNhWtjjXGuPzbDC74sgxi5
 axB0xvRGHBStzKe6qEiGGHteQotpElMFc6zp2sBnbtBytpDRPfDUPsuTOj7zXGkM7aQ9
X-Google-Smtp-Source: AGHT+IEbiAUmYxvmgAuOEjLQQ1gxS7G3BR7bWoiXfKmgi49nHAJX2G2lNRk5YmHaeQ/oYNi7kQjzUA==
X-Received: by 2002:a17:902:ec84:b0:216:2804:a241 with SMTP id
 d9443c01a7336-21dd7dddea0mr143350925ad.37.1738309411785; 
 Thu, 30 Jan 2025 23:43:31 -0800 (PST)
Received: from [192.168.0.78] (133-32-227-190.east.xps.vectant.ne.jp.
 [133.32.227.190]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f8489d3982sm3214124a91.24.2025.01.30.23.43.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jan 2025 23:43:31 -0800 (PST)
Message-ID: <f6bdbc3b-4af9-4b95-8b6e-42f14f20d788@pf.is.s.u-tokyo.ac.jp>
Date: Fri, 31 Jan 2025 16:43:25 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/bridge: display-connector: implement the error
 path of .probe()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, dmitry.baryshkov@linaro.org
References: <20250131051918.549781-1-joe@pf.is.s.u-tokyo.ac.jp>
 <349b0a91-fd0f-4feb-9351-f8c31ee7bbe2@stanley.mountain>
Content-Language: en-US
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
In-Reply-To: <349b0a91-fd0f-4feb-9351-f8c31ee7bbe2@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Hi Dan,

Thank you for your review.

On 1/31/25 14:48, Dan Carpenter wrote:
> Unrelated to this patch but from a naive reading of the code the
> 
> 	conn->hpd_irq = gpiod_to_irq(conn->hpd_gpio);
> 
> assignment can fail with -EPROBE_DEFER if CONFIG_GPIOLIB_IRQCHIP is
> enabled.  The driver can function without an IRQ so we just ignore
> the error, but probably it would be better to propogate it back?

Makes sense. I will write a patch addressing this issue if anyone thinks 
the EPROBE_DEFER error should not be ignored. Please let me know.

> 
> On Fri, Jan 31, 2025 at 02:19:18PM +0900, Joe Hattori wrote:
>> Current implementation of .probe() leaks a reference of i2c_adapter.
>> Implement an error path and call put_device() on the obtained
>> i2c_adapter in it to fix this refcount bug.
>>
>> This bug was found by an experimental static analysis tool that I am
>> developing.
>>
>> Fixes: 0c275c30176b ("drm/bridge: Add bridge driver for display connectors")
>> Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
>> ---
>> Changes in V3:
>> - Removed shadowed variables (ret).
>>
>> Changes in V2:
>> - Omit the null check before calling i2c_put_adapter().
>> ---
>>   drivers/gpu/drm/bridge/display-connector.c | 31 +++++++++++++---------
>>   1 file changed, 19 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/display-connector.c b/drivers/gpu/drm/bridge/display-connector.c
>> index 72bc508d4e6e..411f9372e064 100644
>> --- a/drivers/gpu/drm/bridge/display-connector.c
>> +++ b/drivers/gpu/drm/bridge/display-connector.c
>> @@ -329,35 +329,39 @@ static int display_connector_probe(struct platform_device *pdev)
>>   
>>   	/* Get the DP PWR for DP connector. */
>>   	if (type == DRM_MODE_CONNECTOR_DisplayPort) {
>> -		int ret;
>> -
>>   		ret = display_connector_get_supply(pdev, conn, "dp-pwr");
>> -		if (ret < 0)
>> -			return dev_err_probe(&pdev->dev, ret, "failed to get DP PWR regulator\n");
>> +		if (ret < 0) {
>> +			ret = dev_err_probe(&pdev->dev, ret,
>                          ^^^                             ^^^
> This is a "ret = ret" assignment.  There is no need for that.  Just
> call dev_err_probe() without saving the return value.

Handled in the V4 patch [1].

> 
>> +					    "failed to get DP PWR regulator\n");
>> +			goto err_put;
>> +		}
>>   	}
>>   
>>   	/* enable DDC */
>>   	if (type == DRM_MODE_CONNECTOR_HDMIA) {
>> -		int ret;
>> -
>>   		conn->ddc_en = devm_gpiod_get_optional(&pdev->dev, "ddc-en",
>>   						       GPIOD_OUT_HIGH);
>>   
>>   		if (IS_ERR(conn->ddc_en)) {
>>   			dev_err(&pdev->dev, "Couldn't get ddc-en gpio\n");
>> -			return PTR_ERR(conn->ddc_en);
>> +			ret = PTR_ERR(conn->ddc_en);
>> +			goto err_put;
>>   		}
>>   
>>   		ret = display_connector_get_supply(pdev, conn, "hdmi-pwr");
>> -		if (ret < 0)
>> -			return dev_err_probe(&pdev->dev, ret, "failed to get HDMI +5V Power regulator\n");
>> +		if (ret < 0) {
>> +			ret = dev_err_probe(
>> +				&pdev->dev, ret,
>> +				"failed to get HDMI +5V Power regulator\n");
> 
> Same.
> 
>> +			goto err_put;
>> +		}
>>   	}
>>   
>>   	if (conn->supply) {
>>   		ret = regulator_enable(conn->supply);
>>   		if (ret) {
>>   			dev_err(&pdev->dev, "failed to enable PWR regulator: %d\n", ret);
>> -			return ret;
>> +			goto err_put;
>>   		}
>>   	}
>>   
>> @@ -383,6 +387,10 @@ static int display_connector_probe(struct platform_device *pdev)
>>   	drm_bridge_add(&conn->bridge);
>>   
>>   	return 0;
>> +
>> +err_put:
>> +	i2c_put_adapter(conn->bridge.ddc);
>> +	return ret;
>>   }
>>   
>>   static void display_connector_remove(struct platform_device *pdev)
>> @@ -397,8 +405,7 @@ static void display_connector_remove(struct platform_device *pdev)
>>   
>>   	drm_bridge_remove(&conn->bridge);
>>   
>> -	if (!IS_ERR(conn->bridge.ddc))
>> -		i2c_put_adapter(conn->bridge.ddc);
>> +	i2c_put_adapter(conn->bridge.ddc);
> 
> This change is a nice cleanup and perhaps it silences a warning in your
> static checker?  It should be mentioned in the commit message.

Reflected in the commit message of v4. (This change was not detected by 
my verifier, but yes, should have been mentioned in the message anyway)

> 
> regards,
> dan carpenter
> 

[1]: 
https://lore.kernel.org/dri-devel/20250131073453.551252-1-joe@pf.is.s.u-tokyo.ac.jp/

Best,
Joe
