Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDD147D7C2
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 20:31:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04F2A10E270;
	Wed, 22 Dec 2021 19:31:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 606FE10E270
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 19:31:33 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id 207so5367317ljf.10
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 11:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UWoUyTKuCZBPTUWhT4JDOJqnu500xgBuHlWsCulVizk=;
 b=c67/4h+IbZqTrY6VpgQDBqvTDORUmjxz5PuQFbzOb8h6CTGOMmAJth5gzc+C8JbWPQ
 2ihYecoc2Q0UoVe859s8GGOvOWFAoWc8AqLS+WuHNuL7F44YYEJgC8ZwMJ8uSfmqNcrO
 ylPbfoXFXr9pVBOTzRp+Dyz4Cwlu7Nnzw1lpBGGz7s0/XNBghnJeG9duEF4uisvpLD34
 69RK0hU/i5Eie/4QF7tzDaBGpK0vVr8/aLXZEvBQGmJAFP5CroY6qbipQC2t85Ms+Xc2
 T8xab18TQMMjYS587kdP8Cl+RLxnmmbhPSRGQyY3mmXUNfKPnIYwmxpy8x14K5404Q3L
 o9eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UWoUyTKuCZBPTUWhT4JDOJqnu500xgBuHlWsCulVizk=;
 b=OxzStax4ues9V4ACw7TliAbGpIfddhtBO64rYU8zviqwScaRUKAPeudq0yAL+atb6f
 EkXyWlztXdA3m01q2vXfb5DGYdKkqv0atkdMeM1eXCYph3YzGQ1FZYdYd+bfWMS4kCqZ
 wawPBzu0g439JoH/oANRgVYVQBfZVkuO4iNrQGsoh9mTUmONclY8an2jihsPTVEhh6Vm
 ZhVMWq6ZOZsUZdtdttQz4lgXM3rZgOnLZTWmee5GXlQUJynQ1rz4l76SH8iqn8iO8/7D
 EIFn0/fD5rlYFsFyLzIsXzDiL+ntq2RRt8qJQf/b/XM/T0ZLeVmRYKYGrul9r92pWDLU
 kgRQ==
X-Gm-Message-State: AOAM533JfpH5ETulVsgeALfFiwVOThGMzR4skjt3yQTFd4ispeYTtdDC
 9MlVr1Wsr5Ivu4A4kWv1+DA=
X-Google-Smtp-Source: ABdhPJx+htWwi+v3AtjfsW4JydR93mF82QsXr8O0IkG6rltx1oU1VGhRQ2z9X1SX8wNh1+xujo7/WA==
X-Received: by 2002:a05:651c:199f:: with SMTP id
 bx31mr591962ljb.109.1640201491742; 
 Wed, 22 Dec 2021 11:31:31 -0800 (PST)
Received: from [192.168.2.145] (46-138-43-24.dynamic.spd-mgts.ru.
 [46.138.43.24])
 by smtp.googlemail.com with ESMTPSA id bn30sm262179ljb.29.2021.12.22.11.31.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Dec 2021 11:31:31 -0800 (PST)
Subject: Re: [PATCH v16 08/40] gpu: host1x: Add initial runtime PM and OPP
 support
To: Jon Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver
 <pdeschrijver@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>,
 Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Michael Turquette <mturquette@baylibre.com>
References: <20211130232347.950-1-digetx@gmail.com>
 <20211130232347.950-9-digetx@gmail.com>
 <21212ddb-205f-71d6-0199-d75768eaf32c@nvidia.com>
 <41edc53b-5ed1-d524-2546-c3d1ee6cdea4@gmail.com>
 <6652ac84-36f5-0e43-65fa-04786f384f21@nvidia.com>
 <56dce9c7-397d-75b0-b5b8-18ce1084e72b@nvidia.com>
 <6dbc8205-5669-8b08-16b8-fe5e1acdd06f@gmail.com>
 <796eb3f7-80e2-bc55-fd52-43e76220f8c2@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <40983f6e-92ee-40d4-861f-06faea0113fc@gmail.com>
Date: Wed, 22 Dec 2021 22:31:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <796eb3f7-80e2-bc55-fd52-43e76220f8c2@nvidia.com>
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
Cc: linux-pwm@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Heidelberg <david@ixit.cz>,
 linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

22.12.2021 22:30, Jon Hunter пишет:
> 
> On 22/12/2021 19:01, Dmitry Osipenko wrote:
> 
> ...
> 
>> diff --git a/drivers/gpu/host1x/syncpt.c b/drivers/gpu/host1x/syncpt.c
>> index e08e331e46ae..8194826c9ce3 100644
>> --- a/drivers/gpu/host1x/syncpt.c
>> +++ b/drivers/gpu/host1x/syncpt.c
>> @@ -137,6 +137,15 @@ void host1x_syncpt_restore(struct host1x *host)
>>       struct host1x_syncpt *sp_base = host->syncpt;
>>       unsigned int i;
>>
>> +    for (i = 0; i < host->info->nb_pts; i++) {
>> +        /*
>> +         * Unassign syncpt from channels for purposes of Tegra186
>> +         * syncpoint protection. This prevents any channel from
>> +         * accessing it until it is reassigned.
>> +         */
>> +        host1x_hw_syncpt_assign_to_channel(host, sp_base + i, NULL);
>> +    }
>> +
>>       for (i = 0; i < host1x_syncpt_nb_pts(host); i++)
>>           host1x_hw_syncpt_restore(host, sp_base + i);
>>
>> @@ -352,13 +361,6 @@ int host1x_syncpt_init(struct host1x *host)
>>       for (i = 0; i < host->info->nb_pts; i++) {
>>           syncpt[i].id = i;
>>           syncpt[i].host = host;
>> -
>> -        /*
>> -         * Unassign syncpt from channels for purposes of Tegra186
>> -         * syncpoint protection. This prevents any channel from
>> -         * accessing it until it is reassigned.
>> -         */
>> -        host1x_hw_syncpt_assign_to_channel(host, &syncpt[i], NULL);
>>       }
>>
>>       for (i = 0; i < host->info->nb_bases; i++)
>>
> 
> 
> Thanks! This fixed it!

I'll prepare proper patch with yours t-b, thank you.

