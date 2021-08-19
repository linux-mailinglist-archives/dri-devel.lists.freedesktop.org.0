Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 000123F20B9
	for <lists+dri-devel@lfdr.de>; Thu, 19 Aug 2021 21:36:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AAA16E9CE;
	Thu, 19 Aug 2021 19:36:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC22F6E9CE
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 19:36:00 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id y34so15240681lfa.8
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 12:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DULWQbyXgQID8PNJR65q3ui7SrWpcCN+90FL5qtDGW4=;
 b=pavH6Or3hHtiPfMvi8hlpl/tg+4iNkFsKU223QQBDdOUdi6iU/UGWUvtDPrwHRvATY
 T93cP1HXuc5W/zHN7xvpRXKJW7BinJL9sVNA6qZxjeijHdmFtCqxrxnpd+WkEHRtVU0B
 Iyqua5rSNmWSDpSD3gZsArfjTWgs81iBNdQYXU+kNJ+OumOnoCaZh+LP24EMz52MwP27
 4AWCJslbtOmcFHBYAOMwZEDrmTB/tzURM30c4z+24S3Lj2lVdIHxSFuPOnhXpzmvotQF
 wvsrbFpOMxH2mR1ZpXZ7XMAP/i3UFW88iZgByQUfkdB9/YhjC/JuWWWMJqO4edcr+32D
 1LbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DULWQbyXgQID8PNJR65q3ui7SrWpcCN+90FL5qtDGW4=;
 b=lDpRttxmFXBleEme4SE0QFoqCnvYoloYVJq02AY/YOnr0BpMlKTQf6aIHnrlNs71Vi
 eAUwDhsUTXJd7cvpRe76J8Ixc/4GvTuF9gw6fGDqre2h890CYvQNLYZTOKaX/DTtctH5
 JkrcBvMesyJY2lOZg886Iua6qd26q6uMRm6VVdPT6Y8LSCYerM30G7rSKaD7pymCHOi3
 yp54fcLNzGNmUd7HWdclqgM9SrdsfPVrZwdLkddRnh395MAzYIzLf6jiHvoQmGTzOb2p
 oltZelQTX2UPamkq2JtxZBsoN78LxMZcWJBUjBUv60zp0ZryR1wipWeaMIHG0H6H64Kt
 NWuQ==
X-Gm-Message-State: AOAM531fezs0hbD52E+mEsWHZSv3FLKo1V0eW90Opm0cdlSCpqiZA8Nf
 O/okLlXSsqyqrz1P6uX+l48=
X-Google-Smtp-Source: ABdhPJz8kaZlUqWZzmjPF+roXrLNhHc7Bu21Y9J69HyMCnrDHOaQ6jNYy2BIrPwa/yg8Go50EqboLQ==
X-Received: by 2002:a05:6512:23aa:: with SMTP id
 c42mr11397932lfv.55.1629401759119; 
 Thu, 19 Aug 2021 12:35:59 -0700 (PDT)
Received: from [192.168.2.145] (46-138-120-72.dynamic.spd-mgts.ru.
 [46.138.120.72])
 by smtp.googlemail.com with ESMTPSA id l24sm396141lfe.272.2021.08.19.12.35.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Aug 2021 12:35:58 -0700 (PDT)
Subject: Re: [PATCH v8 01/34] opp: Add dev_pm_opp_sync() helper
To: Ulf Hansson <ulf.hansson@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver
 <pdeschrijver@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>,
 Peter Chen <peter.chen@kernel.org>, Mark Brown <broonie@kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lucas Stach <dev@lynxeye.de>,
 Stefan Agner <stefan@agner.ch>, Adrian Hunter <adrian.hunter@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Linux PM <linux-pm@vger.kernel.org>,
 Linux USB List <linux-usb@vger.kernel.org>, linux-staging@lists.linux.dev,
 linux-spi@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-mmc <linux-mmc@vger.kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 DTML <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>
References: <20210818043131.7klajx6drvvkftoc@vireshk-i7>
 <a2a3c41f-c5e4-ee7e-7d48-03af8bac8863@gmail.com>
 <20210818045307.4brb6cafkh3adjth@vireshk-i7>
 <080469b3-612b-3a34-86e5-7037a64de2fe@gmail.com>
 <20210818055849.ybfajzu75ecpdrbn@vireshk-i7>
 <f1c76f23-086d-ef36-54ea-0511b0ebe0e1@gmail.com>
 <20210818062723.dqamssfkf7lf7cf7@vireshk-i7>
 <CAPDyKFrZqWtZOp4MwDN6fShoLLbw5NM039bpE3-shB+fCEZOog@mail.gmail.com>
 <20210818091417.dvlnsxlgybdsn76x@vireshk-i7>
 <CAPDyKFrVxhrWGr2pKduehshpLFd_db2NTPGuD7fSqvuHeyzT4w@mail.gmail.com>
 <20210818095044.e2ntsm45h5cddk7s@vireshk-i7>
 <CAPDyKFrFF00xGDWPCQnPwF0_QkG4TB2UqggpuBpp8LY_CMKP-A@mail.gmail.com>
 <0354acbe-d856-4040-f453-8e8164102045@gmail.com>
 <CAPDyKFoQdn1rm91iFNJwZwpSYcKJBjDLqtJB4KZAkhgY1Grm-Q@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <87073fc2-d7b3-98f4-0067-29430ea2adef@gmail.com>
Date: Thu, 19 Aug 2021 22:35:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAPDyKFoQdn1rm91iFNJwZwpSYcKJBjDLqtJB4KZAkhgY1Grm-Q@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

19.08.2021 16:07, Ulf Hansson пишет:
> On Wed, 18 Aug 2021 at 17:43, Dmitry Osipenko <digetx@gmail.com> wrote:
>>
>> 18.08.2021 13:08, Ulf Hansson пишет:
>>> On Wed, 18 Aug 2021 at 11:50, Viresh Kumar <viresh.kumar@linaro.org> wrote:
>>>>
>>>> On 18-08-21, 11:41, Ulf Hansson wrote:
>>>>> On Wed, 18 Aug 2021 at 11:14, Viresh Kumar <viresh.kumar@linaro.org> wrote:
>>>>>> What we need here is just configure. So something like this then:
>>>>>>
>>>>>> - genpd->get_performance_state()
>>>>>>   -> dev_pm_opp_get_current_opp() //New API
>>>>>>   -> dev_pm_genpd_set_performance_state(dev, current_opp->pstate);
>>>>>>
>>>>>> This can be done just once from probe() then.
>>>>>
>>>>> How would dev_pm_opp_get_current_opp() work? Do you have a suggestion?
>>>>
>>>> The opp core already has a way of finding current OPP, that's what
>>>> Dmitry is trying to use here. It finds it using clk_get_rate(), if
>>>> that is zero, it picks the lowest freq possible.
>>>>
>>>>> I am sure I understand the problem. When a device is getting probed,
>>>>> it needs to consume power, how else can the corresponding driver
>>>>> successfully probe it?
>>>>
>>>> Dmitry can answer that better, but a device doesn't necessarily need
>>>> to consume energy in probe. It can consume bus clock, like APB we
>>>> have, but the more energy consuming stuff can be left disabled until
>>>> the time a user comes up. Probe will just end up registering the
>>>> driver and initializing it.
>>>
>>> That's perfectly fine, as then it's likely that it won't vote for an
>>> OPP, but can postpone that as well.
>>>
>>> Perhaps the problem is rather that the HW may already carry a non-zero
>>> vote made from a bootloader. If the consumer driver tries to clear
>>> that vote (calling dev_pm_opp_set_rate(dev, 0), for example), it would
>>> still not lead to any updates of the performance state in genpd,
>>> because genpd internally has initialized the performance-state to
>>> zero.
>>
>> We don't need to discover internal SoC devices because we use
>> device-tree on ARM. For most devices power isn't required at a probe
>> time because probe function doesn't touch h/w at all, thus devices are
>> left in suspended state after probe.
>>
>> We have three components comprising PM on Tegra:
>>
>> 1. Power gate
>> 2. Clock state
>> 3. Voltage state
>>
>> GENPD on/off represents the 'power gate'.
>>
>> Clock and reset are controlled by device drivers using clk and rst APIs.
>>
>> Voltage state is represented by GENPD's performance level.
>>
>> GENPD core assumes that at a first rpm-resume of a consumer device, its
>> genpd_performance=0. Not true for Tegra because h/w of the device is
>> preconfigured to a non-zero perf level initially, h/w may not support
>> zero level at all.
> 
> I think you may be misunderstanding genpd's behaviour around this, but
> let me elaborate.
> 
> In genpd_runtime_resume(), we try to restore the performance state for
> the device that genpd_runtime_suspend() *may* have dropped earlier.
> That means, if genpd_runtime_resume() is called prior
> genpd_runtime_suspend() for the first time, it means that
> genpd_runtime_resume() will *not* restore a performance state, but
> instead just leave the performance state as is for the device (see
> genpd_restore_performance_state()).
> 
> In other words, a consumer driver may use the following sequence to
> set an initial performance state for the device during ->probe():
> 
> ...
> rate = clk_get_rate()
> dev_pm_opp_set_rate(rate)
> 
> pm_runtime_enable()
> pm_runtime_resume_and_get()
> ...
> 
> Note that, it's the consumer driver's responsibility to manage device
> specific resources, in its ->runtime_suspend|resume() callbacks.
> Typically that means dealing with clock gating/ungating, for example.
> 
> In the other scenario where a consumer driver prefers to *not* call
> pm_runtime_resume_and_get() in its ->probe(), because it doesn't need
> to power on the device to complete probing, then we don't want to vote
> for an OPP at all - and we also want the performance state for the
> device in genpd to be set to zero. Correct?

Yes

> Is this the main problem you are trying to solve, because I think this
> doesn't work out of the box as of today?

The main problem is that the restored performance state is zero for the
first genpd_runtime_resume(), while it's not zero from the h/w perspective.

> There is another concern though, but perhaps it's not a problem after
> all. Viresh told us that dev_pm_opp_set_rate() may turn on resources
> like clock/regulators. That could certainly be problematic, in
> particular if the device and its genpd have OPP tables associated with
> it and the consumer driver wants to follow the above sequence in
> probe.

dev_pm_opp_set_rate() won't enable clocks and regulators, but it may
change the clock rate and voltage. This is also platform/driver specific
because it's up to OPP user how to configure OPP table. On Tegra we only
assign clock to OPP table, regulators are unused.

> Viresh, can you please chime in here and elaborate on some of the
> magic happening behind dev_pm_opp_set_rate() API - is there a problem
> here or not?
> 
>>
>> GENPD core assumes that consumer devices can work at any performance
>> level. Not true for Tegra because voltage needs to be set in accordance
>> to the clock rate before clock is enabled, otherwise h/w won't work
>> properly, perhaps clock may be unstable or h/w won't be latching.
> 
> Correct. Genpd relies on the callers to use the OPP framework if there
> are constraints like you describe above.
> 
> That said, it's not forbidden for a consumer driver to call
> dev_pm_genpd_set_performance_state() directly, but then it better
> knows exactly what it's doing.
> 
>>
>> Performance level should be set to 0 while device is suspended.
> 
> Do you mean system suspend or runtime suspend? Or both?

Runtime suspend.

>> Performance level needs to be bumped on rpm-resume of a device in
>> accordance to h/w state before hardware is enabled.
> 
> Assuming there was a performance state set for the device when
> genpd_runtime_suspend() was called, genpd_runtime_resume() will
> restore that state according to the sequence you described.

What do you think about adding API that will allow drivers to explicitly
set the restored performance state of a power domain?

Another option could be to change the GENPD core, making it to set the
rpm_pstate when dev_pm_genpd_set_performance_state(dev) is invoked and
device is rpm-suspended, instead of calling the
genpd->set_performance_state callback.

Then drivers will be able to sync the perf state at a probe time.

What do you think?

diff --git a/drivers/base/power/domain.c b/drivers/base/power/domain.c
index a934c679e6ce..cc15ab9eacc9 100644
--- a/drivers/base/power/domain.c
+++ b/drivers/base/power/domain.c
@@ -435,7 +435,7 @@ static void genpd_restore_performance_state(struct
device *dev,
 int dev_pm_genpd_set_performance_state(struct device *dev, unsigned int
state)
 {
 	struct generic_pm_domain *genpd;
-	int ret;
+	int ret = 0;

 	genpd = dev_to_genpd_safe(dev);
 	if (!genpd)
@@ -446,7 +446,10 @@ int dev_pm_genpd_set_performance_state(struct
device *dev, unsigned int state)
 		return -EINVAL;

 	genpd_lock(genpd);
-	ret = genpd_set_performance_state(dev, state);
+	if (pm_runtime_suspended(dev))
+		dev_gpd_data(dev)->rpm_pstate = state;
+	else
+		ret = genpd_set_performance_state(dev, state);
 	genpd_unlock(genpd);

 	return ret;


