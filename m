Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC6812DEE8
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jan 2020 13:55:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B429F898B6;
	Wed,  1 Jan 2020 12:55:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4AA48898B6
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jan 2020 12:55:47 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 952F831B;
 Wed,  1 Jan 2020 04:55:46 -0800 (PST)
Received: from [192.168.1.123] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BDD9E3F68F;
 Wed,  1 Jan 2020 04:55:44 -0800 (PST)
Subject: Re: [RFC v2 1/1] drm/lima: Add optional devfreq support
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20191227173707.20413-1-martin.blumenstingl@googlemail.com>
 <20191227173707.20413-2-martin.blumenstingl@googlemail.com>
 <dd38ff5c-6a14-bb6a-4df5-d706f99234e9@arm.com>
 <CAFBinCDs3a8TJcQKgHUkDvssMR6Y2Kys38p50P0q=2KOiDTNHg@mail.gmail.com>
 <fe45f4f8-8c67-ded2-90bf-8d5fd6874876@arm.com>
 <CAFBinCByzLLdVTL0v=eC-TbZQnwnDY7cBLf4jyWq7N4PA1rr+A@mail.gmail.com>
 <ff2bdd26-3c34-63db-beb5-8f7c9fc7e790@arm.com>
 <CAFBinCAgzHJQpcf1WVQPkNXOq1ziXp7nx=ZAU9_2-VzA9hg-Yw@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <629205c8-68c5-5895-d926-75984110dd49@arm.com>
Date: Wed, 1 Jan 2020 12:55:44 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <CAFBinCAgzHJQpcf1WVQPkNXOq1ziXp7nx=ZAU9_2-VzA9hg-Yw@mail.gmail.com>
Content-Language: en-GB
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
Cc: tomeu.vizoso@collabora.com, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, steven.price@arm.com,
 linux-rockchip@lists.infradead.org, wens@csie.org, yuq825@gmail.com,
 linux-amlogic@lists.infradead.org, alyssa.rosenzweig@collabora.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2019-12-31 4:47 pm, Martin Blumenstingl wrote:
> Hi Robin,
> 
> On Tue, Dec 31, 2019 at 5:40 PM Robin Murphy <robin.murphy@arm.com> wrote:
>>
>> On 2019-12-31 2:17 pm, Martin Blumenstingl wrote:
>>> Hi Robin,
>>>
>>> On Mon, Dec 30, 2019 at 1:47 AM Robin Murphy <robin.murphy@arm.com> wrote:
>>>>
>>>> On 2019-12-29 11:19 pm, Martin Blumenstingl wrote:
>>>>> Hi Robin,
>>>>>
>>>>> On Sun, Dec 29, 2019 at 11:58 PM Robin Murphy <robin.murphy@arm.com> wrote:
>>>>>>
>>>>>> Hi Martin,
>>>>>>
>>>>>> On 2019-12-27 5:37 pm, Martin Blumenstingl wrote:
>>>>>>> Most platforms with a Mali-400 or Mali-450 GPU also have support for
>>>>>>> changing the GPU clock frequency. Add devfreq support so the GPU clock
>>>>>>> rate is updated based on the actual GPU usage when the
>>>>>>> "operating-points-v2" property is present in the board.dts.
>>>>>>>
>>>>>>> The actual devfreq code is taken from panfrost_devfreq.c and modified so
>>>>>>> it matches what the lima hardware needs:
>>>>>>> - a call to dev_pm_opp_set_clkname() during initialization because there
>>>>>>>       are two clocks on Mali-4x0 IPs. "core" is the one that actually clocks
>>>>>>>       the GPU so we need to control it using devfreq.
>>>>>>> - locking when reading or writing the devfreq statistics because (unlike
>>>>>>>       than panfrost) we have multiple PP and GP IRQs which may finish jobs
>>>>>>>       concurrently.
>>>>>>
>>>>>> I gave this a quick try on my RK3328, and the clock scaling indeed kicks
>>>>>> in nicely on the glmark2 scenes that struggle, however something appears
>>>>>> to be missing in terms of regulator association, as the appropriate OPP
>>>>>> voltages aren't reflected in the GPU supply (fortunately the initial
>>>>>> voltage seems close enough to that of the highest OPP not to cause major
>>>>>> problems, on my box at least). With panfrost on RK3399 I do see the
>>>>>> supply voltage scaling accordingly, but I don't know my way around
>>>>>> devfreq well enough to know what matters in the difference :/
>>>>> first of all: thank you for trying this out! :-)
>>>>>
>>>>> does your kernel include commit 221bc77914cbcc ("drm/panfrost: Use
>>>>> generic code for devfreq") for your panfrost test?
>>>>> if I understand the devfreq API correct then I suspect with that
>>>>> commit panfrost also won't change the voltage anymore.
>>>>
>>>> Oh, you're quite right - I was already considering that change as
>>>> ancient history, but indeed it's only in 5.5-rc, while that board is
>>>> still on 5.4.y release kernels. No wonder I couldn't make sense of how
>>>> the (current) code could possibly be working :)
>>>>
>>>> I'll try the latest -rc kernel tomorrow to confirm (now that PCIe is
>>>> hopefully fixed), but I'm already fairly confident you've called it
>>>> correctly.
>>> I just tested it with the lima driver (by undervolting the GPU by
>>> 0.05V) and it seems that dev_pm_opp_set_regulators is really needed.
>>> I'll fix this in the next version of this patch and also submit a fix
>>> for panfrost (I won't be able to test that though, so help is
>>> appreciated in terms of testing :))
>>
>> Yeah, I started hacking something up for panfrost yesterday, but at the
>> point of realising the core OPP code wants refactoring to actually
>> handle optional regulators without spewing errors, decided that was
>> crossing the line into "work" and thus could wait until next week :D
> I'm not sure what you mean, dev_pm_opp_set_regulators uses
> regulator_get_optional.
> doesn't that mean that it is optional already?

Indeed it does call regulator_get_optional(), but it then goes on to 
treat the absence of a supposedly-optional regulator as a hard failure. 
It doesn't seem very useful having a nice abstracted interface if users 
still end up have to dance around and duplicate half the parsing in 
order to work out whether it's worth calling or not - far better IMO if 
it could just successfully set/put zero regulators in the cases where 
the OPPs are behind a firmware/mailbox DVFS interface rather than 
explicit in-kernel clock/regulator control.

That said, given that I think the current lima/panfrost users should all 
be relatively simple with either 0 or 1 regulator, you could probably 
just special-case -ENODEV and accept a spurious error message sometimes 
for the sake of an immediate fix, then we can make general improvements 
to the interface separately afterwards.

Robin.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
