Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0270B38E79A
	for <lists+dri-devel@lfdr.de>; Mon, 24 May 2021 15:29:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 045266E7EA;
	Mon, 24 May 2021 13:29:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA9706E7EA
 for <dri-devel@lists.freedesktop.org>; Mon, 24 May 2021 13:29:27 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id a4so18776867ljd.5
 for <dri-devel@lists.freedesktop.org>; Mon, 24 May 2021 06:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xQ4af4RoffHiZWw1odnbmrmEK8rRB0AB3mboCujvWr8=;
 b=ICZbNAWSmmLc5SIJU/wxuITZR48alw2/TOGNeyM5P9n6LBeiok57tfHX7v66B2RyOh
 tCzNHxVyqMSrJbUJTzISJV7zFWmaFZPoQG5R6S4pL2Gp5uyZeBi8LZ0Q6VFYHpBbyMIo
 mdUL/vQETA/tnuFe9UVaDOYfjD+wSxaUIGymegy0rXM2yrpkmG44xJHw5lVnFG67KL+x
 cnjTg7NiLvW08G0auT1GgfZz+ReiRx451jgNFTEFipOE6Wh/Wx1auHxzar+iDK1NL1k2
 5tkqygLl5YjGYKoGiybYDDv8gTLY62owIr/PfjemwhRwSY9Ta9KGyxFixXyG+wZVmhME
 wJpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xQ4af4RoffHiZWw1odnbmrmEK8rRB0AB3mboCujvWr8=;
 b=ppuY2fMzavqQmvt3P7EaduLsjPvbRzQuTop+BFTt02CY0UK/OvG5vx/aUZlcMWobot
 Exn7itFALNh2ULgUmHrqEg9WhVF4WQNPH72YTleyuikq/2gkDK/ENPDz5sbzgJSMox7C
 VHuIWu/JAOetKh2MsnSkVlZ8l+82j3t6p2obzIOJzq3N8qmryqPN1l1L02V7Ftx8go8E
 o5fbRDZxTs06WWCwV7bFz1KQDCj2+WyzH3qjodX4D4sc43FCtkC5Byf/4v8Fu8wLHtef
 E86QlcL90hwIFQBuYM0XO9DCqxLWv+CW2uCopiL0yLTvEyJlyfyEJ/zRcFgpGfv289Xm
 zcfA==
X-Gm-Message-State: AOAM533way6+qRmUnvEvIf4c4tGvzf6Fu43SxlSEE1ZtpUxuvN9XbZmn
 kmv8ODLnFpuV7HswfQXY3Ew=
X-Google-Smtp-Source: ABdhPJwpliZ1bhzHrIn6k8dsn+ajuWurlDphmzkpHPvq//PUv6RJ3XDWfGrujfj76UVdbRyCyvLAcg==
X-Received: by 2002:a2e:92c8:: with SMTP id k8mr16866516ljh.100.1621862966377; 
 Mon, 24 May 2021 06:29:26 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-110.dynamic.spd-mgts.ru.
 [109.252.193.110])
 by smtp.googlemail.com with ESMTPSA id h12sm1753363ljh.130.2021.05.24.06.29.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 May 2021 06:29:26 -0700 (PDT)
Subject: Re: [PATCH -next] media: staging: tegra-vde: Fix error return code in
 tegra_vde_probe()
From: Dmitry Osipenko <digetx@gmail.com>
To: Wei Yongjun <weiyongjun1@huawei.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20210524133550.2363884-1-weiyongjun1@huawei.com>
 <db911ac9-2d08-ae30-03ea-dfb7db964441@gmail.com>
Message-ID: <1e05ad22-c4d8-c443-5377-7cd9db024cb9@gmail.com>
Date: Mon, 24 May 2021 16:29:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <db911ac9-2d08-ae30-03ea-dfb7db964441@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Hulk Robot <hulkci@huawei.com>, linux-tegra@vger.kernel.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

24.05.2021 16:27, Dmitry Osipenko пишет:
> 24.05.2021 16:35, Wei Yongjun пишет:
>> Fix to return a negative error code from the error handling
>> case instead of 0, as done elsewhere in this function.
>>
>> Fixes: dc8276b78917 ("staging: media: tegra-vde: use pm_runtime_resume_and_get()")
>> Reported-by: Hulk Robot <hulkci@huawei.com>
>> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
>> ---
>>  drivers/staging/media/tegra-vde/vde.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/staging/media/tegra-vde/vde.c b/drivers/staging/media/tegra-vde/vde.c
>> index e025b69776f2..321d14ba2e56 100644
>> --- a/drivers/staging/media/tegra-vde/vde.c
>> +++ b/drivers/staging/media/tegra-vde/vde.c
>> @@ -1071,7 +1071,8 @@ static int tegra_vde_probe(struct platform_device *pdev)
>>  	 * power-cycle it in order to put hardware into a predictable lower
>>  	 * power state.
>>  	 */
>> -	if (pm_runtime_resume_and_get(dev) < 0)
>> +	err = pm_runtime_resume_and_get(dev);
>> +	if (err < 0)
>>  		goto err_pm_runtime;
>>  
>>  	pm_runtime_put(dev);
>>
> 
> pm_runtime_resume_and_get() doesn't return positive values, the previous
> variant was okay.
> 
> You should also version your patches and add changelog.
> 

Ah, sorry. The other patch is from Yang Yingliang.
