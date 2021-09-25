Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C2F418440
	for <lists+dri-devel@lfdr.de>; Sat, 25 Sep 2021 21:45:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A6596E45C;
	Sat, 25 Sep 2021 19:45:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A44866E45C
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Sep 2021 19:45:02 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id i25so56575345lfg.6
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Sep 2021 12:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WspVhhcjbCVl9IH7qDEfbtgDZV8Aq2EsjEj0ktZelOw=;
 b=fhbQyWBNLF64uI82RiruuNDrkFY/USs3yyOBryCQkwnGM+ZP3DK2n9PEN7rxIgvcz1
 lE8inSoC4TOxygspX8NgvKfhZWbYxyPeq7cjnDiCuEKYwlyZqIJbH/VXabwC9k3v5MVq
 PrO0jV0AQULreWhQaqS2PdmK8BCdIjAZ8T/7rmKYaewg7TvN+Sw06gCYCgspTZcgoj3m
 6zNtEb+6opWLtm072mOyTZszg8Y3aZpqxcdrT/aSVyyOBf7t1rp7PBiw7Pwa2C0g6GQs
 4W2nj2e3AZ3E2fcEYaDJWDm1qXFdeUt76seQDHEQB4jI8KS6lmzgEXBajTqcEIMeqZ+J
 6gWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WspVhhcjbCVl9IH7qDEfbtgDZV8Aq2EsjEj0ktZelOw=;
 b=iutCzfy8kFs47+15hhgLTJ3CgG4RW8hsZDsNj7kPn6R49Tp8GPwTRCS6OgIGOZjlI5
 WKeKzwRqm86hsLoJRGVP4J8t+es9cwx+Bmtf8HlwXYS48Fj+7oyoXRpPmeFEjMDbr49/
 VfKSKW6fOj3JGJDxXYM9v317EgGTJfKfNmHL0wPnQzzfyXeg9asvHcVZgGcelY0+IrwA
 Ja7dYjTa4YTpRvql/t8EFYSqFs52Y+pKBU6DuGXlhiW0VJS2ueQdMKRRyEJ1ezcySBB2
 gkofMA8J89PJ6ooQi7KlzRVCLDMYegpdsc/u8YFomNzL97/atHLZsuY13vIfi03f2PdE
 OQZA==
X-Gm-Message-State: AOAM5317PTrJr8yX4+P9R/X9F8VTLAFTaX/7/Za1Fvf7SP6Ogy0F71Iu
 7xoi9ZWhOLGkIYmfeqPBPe/bNw==
X-Google-Smtp-Source: ABdhPJxbvUPgocojPNJLSgMMqvRJaOrbWuVqziqUNPhqrIEXEnKwLQhptW/hfBjI3nDLzGQljmYmsg==
X-Received: by 2002:a19:c757:: with SMTP id x84mr15490521lff.121.1632599100987; 
 Sat, 25 Sep 2021 12:45:00 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id f9sm1102563lfc.189.2021.09.25.12.45.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Sep 2021 12:45:00 -0700 (PDT)
Subject: Re: [PATCH] drm/msm/dsi: do not install irq handler before power up
 the host
To: Andrzej Hajda <a.hajda@samsung.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, David Heidelberg <david@ixit.cz>
References: <CGME20210921162311eucas1p203a8c6477b03f44887f76e99c9c60e28@eucas1p2.samsung.com>
 <20210921162258.1858223-1-dmitry.baryshkov@linaro.org>
 <ead3bbcd-5d24-5015-e2b1-3a82141708b6@samsung.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <8164885c-7f58-c901-aa9a-1bfd5bcb63a1@linaro.org>
Date: Sat, 25 Sep 2021 22:44:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <ead3bbcd-5d24-5015-e2b1-3a82141708b6@samsung.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
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

On 21/09/2021 21:26, Andrzej Hajda wrote:
> W dniu 21.09.2021 o 18:22, Dmitry Baryshkov pisze:
>> The DSI host might be left in some state by the bootloader. If this
>> state generates an IRQ, it might hang the system by holding the
>> interrupt line before the driver sets up the DSI host to the known
>> state.
>>
>> Move the request/free_irq calls into msm_dsi_host_power_on/_off calls,
>> so that we can be sure that the interrupt is delivered when the host is
>> in the known state.
> 
> 
> The established practice is to request IRQ in probe, to avoid
> auto-enabling use IRQF_NO_AUTOEN flag.
> 
> Then you can call enable_irq in power-on.

Nice idea, thank you! I somehow missed addition of IRQF_NO_AUTOEN. I've 
used it in v2 ([PATCH v2] drm/msm/dsi: do not enable irq handler before 
powering up the host).

> 
> 
> Regards
> 
> Andrzej
> 
> 
> 
>>
>> Fixes: a689554ba6ed ("drm/msm: Initial add DSI connector support")
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>    drivers/gpu/drm/msm/dsi/dsi_host.c | 21 ++++++++++++---------
>>    1 file changed, 12 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> index e269df285136..cd842347a6b1 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> @@ -1951,15 +1951,6 @@ int msm_dsi_host_modeset_init(struct mipi_dsi_host *host,
>>    		return ret;
>>    	}
>>    
>> -	ret = devm_request_irq(&pdev->dev, msm_host->irq,
>> -			dsi_host_irq, IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
>> -			"dsi_isr", msm_host);
>> -	if (ret < 0) {
>> -		DRM_DEV_ERROR(&pdev->dev, "failed to request IRQ%u: %d\n",
>> -				msm_host->irq, ret);
>> -		return ret;
>> -	}
>> -
>>    	msm_host->dev = dev;
>>    	ret = cfg_hnd->ops->tx_buf_alloc(msm_host, SZ_4K);
>>    	if (ret) {
>> @@ -2413,6 +2404,16 @@ int msm_dsi_host_power_on(struct mipi_dsi_host *host,
>>    	if (msm_host->disp_en_gpio)
>>    		gpiod_set_value(msm_host->disp_en_gpio, 1);
>>    
>> +	ret = devm_request_irq(&msm_host->pdev->dev, msm_host->irq,
>> +			dsi_host_irq, IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
>> +			"dsi_isr", msm_host);
>> +	if (ret < 0) {
>> +		DRM_DEV_ERROR(&msm_host->pdev->dev, "failed to request IRQ%u: %d\n",
>> +				msm_host->irq, ret);
>> +		return ret;
>> +	}
>> +
>> +
>>    	msm_host->power_on = true;
>>    	mutex_unlock(&msm_host->dev_mutex);
>>    
>> @@ -2439,6 +2440,8 @@ int msm_dsi_host_power_off(struct mipi_dsi_host *host)
>>    		goto unlock_ret;
>>    	}
>>    
>> +	devm_free_irq(&msm_host->pdev->dev, msm_host->irq, msm_host);
>> +
>>    	dsi_ctrl_config(msm_host, false, NULL, NULL);
>>    
>>    	if (msm_host->disp_en_gpio)


-- 
With best wishes
Dmitry
