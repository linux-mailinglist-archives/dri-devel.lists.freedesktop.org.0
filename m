Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D21CC47D74C
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 20:01:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F34810E166;
	Wed, 22 Dec 2021 19:01:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AF1110E166
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 19:01:06 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id u22so5284841lju.7
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 11:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5qyDhDUwPSzlKry3WWiQixXU+Cd/VbSsGfSS3pBCnbQ=;
 b=RQazfz82dLgGWyQnWzFwUJVjtPEbt5YWT/uQVL4cXzIi4bKwZhm62VKgJ1svmH5Oc0
 F9U/ZS6gqturE3qBxcaLOQ5OUEvO9fwu7aZFr4d08jAL4nGEAQbxVC2NeSw5GGpTKQHI
 iTJtxnSMZPahl9KKsJAeCOzmeJtXBFwk6XAmkGxh0fJcq+5l1tQPCJV7440mR16rm3aa
 cthd//CZWZNvdgCV893iMnxac6h2QRQPEN4d1qOItYKhf3PtlcDiOQH7jUmQWgV0Ua/R
 QZ68nb/kcdUNScJXlTrYR9HMSD0IbbHvfIpWp2hmSEM9oVf5A4t6nshy/8Fx9PU6Ubgu
 ifXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5qyDhDUwPSzlKry3WWiQixXU+Cd/VbSsGfSS3pBCnbQ=;
 b=yXG6kHrEHaUMbZrSBa+5PxUF+XEak0+CKFqJ48p90lw3vf36FJvIjJJC8aSAgX376D
 VreKKZYt8dqh10c+5BhJhIWQ1+J5iz9tAFEOd4rX9GWZVZHBKDfenSppq6vuYv1UYb3g
 UkIQ+VY7PCkoct/lCCHDRUhYZCvpC9oFeSng6dQM5qaoJ0/FGrfa3Y9bsooxCrWWe6HA
 yRXz4Et549zWQ9JpuKVvE5ufGuO4UsNnRCc1m9CRaSv4N9Aqf9jrczoB/Od8zzoCKCE/
 NuuY5W/Vt9ROgbZaGR5OF+tT8ypFir3ecB1jPybdGxA0xMx6h+aM/J9s/fXV+Yp4cDGF
 6lhg==
X-Gm-Message-State: AOAM530DVs0OGu01XnVRVN1PjYeDfj/Cw+tJhPsHW9ft0wiL2eIsGEzi
 FpHq5EVMufDpi9gBWk3LJw0=
X-Google-Smtp-Source: ABdhPJx2bFnl4KwymiZWBgpVgj62KepZK1/+QIA7UfkgYV7U42wp2ZF38bQi8wul84W/UBzbREFafw==
X-Received: by 2002:a2e:8507:: with SMTP id j7mr2863920lji.307.1640199664643; 
 Wed, 22 Dec 2021 11:01:04 -0800 (PST)
Received: from [192.168.2.145] (46-138-43-24.dynamic.spd-mgts.ru.
 [46.138.43.24])
 by smtp.googlemail.com with ESMTPSA id a28sm245793ljm.65.2021.12.22.11.01.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Dec 2021 11:01:04 -0800 (PST)
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
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <6dbc8205-5669-8b08-16b8-fe5e1acdd06f@gmail.com>
Date: Wed, 22 Dec 2021 22:01:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <56dce9c7-397d-75b0-b5b8-18ce1084e72b@nvidia.com>
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

22.12.2021 21:41, Jon Hunter пишет:
> 
> On 22/12/2021 09:47, Jon Hunter wrote:
>>
>> On 21/12/2021 20:58, Dmitry Osipenko wrote:
>>> Hi,
>>>
>>> Thank you for testing it all.
>>>
>>> 21.12.2021 21:55, Jon Hunter пишет:
>>>> Hi Dmitry, Thierry,
>>>>
>>>> On 30/11/2021 23:23, Dmitry Osipenko wrote:
>>>>> Add runtime PM and OPP support to the Host1x driver. For the
>>>>> starter we
>>>>> will keep host1x always-on because dynamic power management require a
>>>>> major
>>>>> refactoring of the driver code since lot's of code paths are
>>>>> missing the
>>>>> RPM handling and we're going to remove some of these paths in the
>>>>> future.
>>>>
>>>>
>>>> Unfortunately, this change is breaking boot on Tegra186. Bisect points
>>>> to this and reverting on top of -next gets the board booting again.
>>>> Sadly, there is no panic or error reported, it is just a hard hang. I
>>>> will not have time to look at this this week and so we may need to
>>>> revert for the moment.
>>>
>>> Only T186 broken? What about T194?
>>
>> Yes interestingly only Tegra186 and no other board.
>>
>>> Which board model fails to boot? Is it running in hypervisor mode?
>>
>> This is Jetson TX2. No hypervisor.
>>
>>> Do you use any additional patches?
>>
>> No just plain -next. The tests run every day on top of tree.
>>
>>> Could you please test the below diff? I suspect that
>>> host1x_syncpt_save/restore may be entirely broken for T186 since we
>>> never used these funcs before.
>>>
>>> --- >8 ---
>>>
>>> diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
>>> index f5b4dcded088..fd5dfb875422 100644
>>> --- a/drivers/gpu/host1x/dev.c
>>> +++ b/drivers/gpu/host1x/dev.c
>>> @@ -580,7 +580,6 @@ static int __maybe_unused
>>> host1x_runtime_suspend(struct device *dev)
>>>       int err;
>>>
>>>       host1x_intr_stop(host);
>>> -    host1x_syncpt_save(host);
>>>
>>>       err = reset_control_bulk_assert(host->nresets, host->resets);
>>>       if (err) {
>>> @@ -596,9 +595,8 @@ static int __maybe_unused
>>> host1x_runtime_suspend(struct device *dev)
>>>       return 0;
>>>
>>>   resume_host1x:
>>> -    host1x_setup_sid_table(host);
>>> -    host1x_syncpt_restore(host);
>>>       host1x_intr_start(host);
>>> +    host1x_setup_sid_table(host);
>>>
>>>       return err;
>>>   }
>>> @@ -626,9 +624,8 @@ static int __maybe_unused
>>> host1x_runtime_resume(struct device *dev)
>>>           goto disable_clk;
>>>       }
>>>
>>> -    host1x_setup_sid_table(host);
>>> -    host1x_syncpt_restore(host);
>>>       host1x_intr_start(host);
>>> +    host1x_setup_sid_table(host);
>>
>>
>> Thanks! Will try this later, once the next bisect is finished :-)
> 
> I tested the above, but this did not fix it. It still hangs on boot.

Thank you, now I see where the problem should be. Apparently host1x is
disabled at a boot time on T186 and we touch h/w before RPM is resumed.

Could you please revert the above change and try this instead:

diff --git a/drivers/gpu/host1x/syncpt.c b/drivers/gpu/host1x/syncpt.c
index e08e331e46ae..8194826c9ce3 100644
--- a/drivers/gpu/host1x/syncpt.c
+++ b/drivers/gpu/host1x/syncpt.c
@@ -137,6 +137,15 @@ void host1x_syncpt_restore(struct host1x *host)
 	struct host1x_syncpt *sp_base = host->syncpt;
 	unsigned int i;

+	for (i = 0; i < host->info->nb_pts; i++) {
+		/*
+		 * Unassign syncpt from channels for purposes of Tegra186
+		 * syncpoint protection. This prevents any channel from
+		 * accessing it until it is reassigned.
+		 */
+		host1x_hw_syncpt_assign_to_channel(host, sp_base + i, NULL);
+	}
+
 	for (i = 0; i < host1x_syncpt_nb_pts(host); i++)
 		host1x_hw_syncpt_restore(host, sp_base + i);

@@ -352,13 +361,6 @@ int host1x_syncpt_init(struct host1x *host)
 	for (i = 0; i < host->info->nb_pts; i++) {
 		syncpt[i].id = i;
 		syncpt[i].host = host;
-
-		/*
-		 * Unassign syncpt from channels for purposes of Tegra186
-		 * syncpoint protection. This prevents any channel from
-		 * accessing it until it is reassigned.
-		 */
-		host1x_hw_syncpt_assign_to_channel(host, &syncpt[i], NULL);
 	}

 	for (i = 0; i < host->info->nb_bases; i++)
