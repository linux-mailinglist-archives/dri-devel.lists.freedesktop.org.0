Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FECCAD2E46
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 09:04:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E40C210E265;
	Tue, 10 Jun 2025 07:04:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="x/0QXQfR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8595410E265
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 07:04:10 +0000 (UTC)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
 by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55A73t5B2211052;
 Tue, 10 Jun 2025 02:03:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1749539035;
 bh=qE2ucRlTiMewnM6Dcr2hgBP4unBdgUZP382mNak5L0I=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=x/0QXQfRF9SoFoocL2xBJL9Al4JMd5C4mOhljy2WOvZgPOmV0vcKWmeNgUBh/sY5z
 L5onBii+oFgkl27B7FQ7iaLvEGoPhAxdH6ixw7rCuCOxN4Oco98VmPaJzPLc713PW1
 8w4bfTgNgkmfNC9mZFmJDuPt1vjwQUGrnIWpjkAo=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
 by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55A73ta6074156
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Tue, 10 Jun 2025 02:03:55 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 10
 Jun 2025 02:03:55 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 10 Jun 2025 02:03:55 -0500
Received: from [172.24.227.14] (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com
 [172.24.227.14])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55A73ovm2518805;
 Tue, 10 Jun 2025 02:03:51 -0500
Message-ID: <9272e36e-e764-4007-9d9e-8e09b9c08d34@ti.com>
Date: Tue, 10 Jun 2025 12:33:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: fix REFCLK setting
To: Doug Anderson <dianders@chromium.org>, Michael Walle <mwalle@kernel.org>
CC: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20250528132148.1087890-1-mwalle@kernel.org>
 <CAD=FV=WfV1Kr5hFSqf=t0OS3qFSGfQ3_+LQ-57nMKHXRSYvZ-w@mail.gmail.com>
Content-Language: en-US
From: Jayesh Choudhary <j-choudhary@ti.com>
In-Reply-To: <CAD=FV=WfV1Kr5hFSqf=t0OS3qFSGfQ3_+LQ-57nMKHXRSYvZ-w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
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

Hello Michael, Doug,

On 10/06/25 03:59, Doug Anderson wrote:
> Hi,
> 
> On Wed, May 28, 2025 at 6:21 AM Michael Walle <mwalle@kernel.org> wrote:
>>
>> The bridge has three bootstrap pins which are sampled to determine the
>> frequency of the external reference clock. The driver will also
>> (over)write that setting. But it seems this is racy after the bridge is
>> enabled. It was observed that although the driver write the correct
>> value (by sniffing on the I2C bus), the register has the wrong value.
>> The datasheet states that the GPIO lines have to be stable for at least
>> 5us after asserting the EN signal. Thus, there seems to be some logic
>> which samples the GPIO lines and this logic appears to overwrite the
>> register value which was set by the driver. Waiting 20us after
>> asserting the EN line resolves this issue.
> 
> +Jayesh might have some insight?
> 
> 
> 
>> Signed-off-by: Michael Walle <mwalle@kernel.org>
>> ---
>> I couldn't find a good commit for a Fixes: tag and I'm not sure how
>> fixes are handled in drm.
>>
>>   drivers/gpu/drm/bridge/ti-sn65dsi86.c | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
>> index 60224f476e1d..fcef43154558 100644
>> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
>> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
>> @@ -386,6 +386,17 @@ static int __maybe_unused ti_sn65dsi86_resume(struct device *dev)
>>
>>          gpiod_set_value_cansleep(pdata->enable_gpio, 1);
>>
>> +       /*
>> +        * After EN is deasserted and an external clock is detected, the bridge
>> +        * will sample GPIO3:1 to determine its frequency. The driver will
>> +        * overwrite this setting. But this is racy. Thus we have to wait a
>> +        * couple of us. According to the datasheet the GPIO lines has to be
>> +        * stable at least 5 us (td5) but it seems that is not enough and the
>> +        * refclk frequency value is lost/overwritten by the bridge itself.
>> +        * Waiting for 20us seems to work.
>> +        */
>> +       usleep_range(20, 30);
> 
> It might be worth pointing at _where_ the driver overwrites this
> setting, or maybe at least pointing to something that makes it easy to
> find which exact bits you're talking about.
> 
> This looks reasonable to me, though.

I think we are talking about SN_DPPLL_SRC_REG[3:1] bits?
What exact mismatch are you observing in register value?

I am assuming that you have a clock at REFCLK pin. For that:

If refclk is described in devicetree node, then I see that
the driver modifies it in every resume call based solely on the
clock value in dts.

If refclk is not described in dts, then this register is modified by the
driver only when pre_enable() calls enable_comms(). Here also, the
value depends on crtc_mode and the refclk_rate often would not be equal
to the values in "ti_sn_bridge_dsiclk_lut" (supported frequencies), and
you would fallback to "001" register value.
Rest of time, I guess it depends on reading the status from GPIO and
changing the register.

Is the latter one your usecase?



- Jayesh

> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
