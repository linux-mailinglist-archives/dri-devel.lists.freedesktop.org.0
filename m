Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 218571344D1
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2020 15:20:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06D9489BDB;
	Wed,  8 Jan 2020 14:20:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id B313A89BDB
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2020 14:20:24 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8F23B31B;
 Wed,  8 Jan 2020 06:20:24 -0800 (PST)
Received: from [10.1.196.37] (e121345-lin.cambridge.arm.com [10.1.196.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0E4533F703;
 Wed,  8 Jan 2020 06:20:22 -0800 (PST)
Subject: Re: [PATCH RFT v1 1/3] drm/panfrost: enable devfreq based the
 "operating-points-v2" property
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20200107230626.885451-1-martin.blumenstingl@googlemail.com>
 <20200107230626.885451-2-martin.blumenstingl@googlemail.com>
 <a85f2063-f412-9762-58d1-47fdffb24af9@arm.com>
 <CAFBinCBYrNC+ULV6Y=77qogowkDZwM+H0bxOqPN4sT6q3krGfw@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <be59a20b-af08-5b55-fa69-f87d5aa9f277@arm.com>
Date: Wed, 8 Jan 2020 14:20:21 +0000
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAFBinCBYrNC+ULV6Y=77qogowkDZwM+H0bxOqPN4sT6q3krGfw@mail.gmail.com>
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
 linux-rockchip@lists.infradead.org, Sudeep Holla <sudeep.holla@arm.com>,
 linux-amlogic@lists.infradead.org, alyssa@rosenzweig.io
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[ +Sudeep ]

On 08/01/2020 12:38 pm, Martin Blumenstingl wrote:
> Hi Robin,
> 
> On Wed, Jan 8, 2020 at 12:18 PM Robin Murphy <robin.murphy@arm.com> wrote:
>>
>> On 07/01/2020 11:06 pm, Martin Blumenstingl wrote:
>>> Decouple the check to see whether we want to enable devfreq for the GPU
>>> from dev_pm_opp_set_regulators(). This is preparation work for adding
>>> back support for regulator control (which means we need to call
>>> dev_pm_opp_set_regulators() before dev_pm_opp_of_add_table(), which
>>> means having a check for "is devfreq enabled" that is not tied to
>>> dev_pm_opp_of_add_table() makes things easier).
>>
>> Hmm, what about cases like the SCMI DVFS protocol where the OPPs are
>> dynamically discovered rather than statically defined in DT?
> where can I find such an example (Amlogic SoCs use SCPI instead of
> SCMI, so I don't think that I have any board with SCMI support) or
> some documentation?
> (I could only find SCPI clock and CPU DVFS implementations, but no
> generic "OPPs for any device" implementation)

On closer inspection I think this applies to the SCPI DVFS protocol 
too[1]. AIUI the fact that neither is wired up to a devfreq driver yet 
is merely due to lack of demand and suitable systems to develop/test on 
so far - the panfrost devfreq code is only now looking like the first 
viable upstream use-case ;)

Robin.

[1] http://infocenter.arm.com/help/topic/com.arm.doc.dui0922g/BABFEBCD.html
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
