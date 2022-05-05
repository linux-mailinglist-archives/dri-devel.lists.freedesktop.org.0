Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E8651CD05
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 01:56:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E15010E1A0;
	Thu,  5 May 2022 23:56:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BECA10E1A0
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 23:56:00 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 9AC91811D8;
 Fri,  6 May 2022 01:55:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1651794958;
 bh=cyWfd8Cjd/s3k7TOWl6ellcf/4MqlfvtOjQ/4F2Wpas=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=lTVDodGlm8sUWZetYCh4gKesIlRSgnKZzSqG263P4F5YNHfgkA8FI1OJ08eS89DSR
 Z5/Z3u7QPkRq87AbzgjeTaPWkNR1/alqpbRGpdEtfkEtR0BIc1cfO+nFIgErPAhz93
 zfH6nPcqiNRymeK9WkENyx2RiZjWc0IHFkPhfCFL8RpNQE1ih0aXb6f5wOasI56MyC
 4I+btMaUoBP63f+rmhh+rYNq7BE0YmI+dGJE8+kLqpYlstrIHGd9qoUCmU86O6wW2G
 XMd612TSmbpz5jC0AaE3lln0Kp/G9wgBjIqGUlNeI6Zsywvy5XLRhPEUkwF90KV7yn
 6YjHySEVgsQMg==
Message-ID: <bd0d10a9-e065-d3cf-e7f7-c1b656b892f1@denx.de>
Date: Fri, 6 May 2022 01:55:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: (subset) [PATCH 1/2] [RFC] regmap: Add bulk read/write callbacks
 into regmap_config
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20220430025145.640305-1-marex@denx.de>
 <165176353878.543269.16463883419414078766.b4-ty@kernel.org>
 <88edf09b-fca9-26b1-1366-94976c6ce2a0@denx.de>
 <YnQ8uqMBFJc+LV4l@sirena.org.uk>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <YnQ8uqMBFJc+LV4l@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: dri-devel@lists.freedesktop.org, robert.foss@linaro.org,
 jagan@amarulasolutions.com, tzimmermann@suse.de, sam@ravnborg.org,
 maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/5/22 23:08, Mark Brown wrote:
> On Thu, May 05, 2022 at 07:32:23PM +0200, Marek Vasut wrote:
>> On 5/5/22 17:12, Mark Brown wrote:
>>> On Sat, 30 Apr 2022 04:51:44 +0200, Marek Vasut wrote:
> 
>>>> Currently the regmap_config structure only allows the user to implement
>>>> single element register read/write using .reg_read/.reg_write callbacks.
> 
>>> [1/2] regmap: Add bulk read/write callbacks into regmap_config
>>>         commit: d77e745613680c54708470402e2b623dcd769681
> 
>> I was really hoping this would get a lot more review / comments before this
>> is applied.
> 
> I can easily punt for this release, though TBH I'm not anticipating huge
> numbers of comments on a regmap patch unless it breaks things for
> people, they tend to be very quiet.

In that case, let's wait and see ...

> I did go through it and didn't spot
> any issues so it seemed like the testing coverage would be useful here.
> Are there specific things you're worried about that you'd like feedback
> on?

Plumbing on core code is worrying.
