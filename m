Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6AD725170
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 03:17:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45BE110E3FD;
	Wed,  7 Jun 2023 01:17:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.nfschina.com (unknown [42.101.60.195])
 by gabe.freedesktop.org (Postfix) with SMTP id C245E10E3FD
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 01:17:30 +0000 (UTC)
Received: from [172.30.38.103] (unknown [180.167.10.98])
 by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPSA id 1C8101800F838B; 
 Wed,  7 Jun 2023 09:17:21 +0800 (CST)
Message-ID: <126ba315-196d-ee1e-a781-bf8b510f1ddb@nfschina.com>
Date: Wed, 7 Jun 2023 09:17:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: Avoid possible buffer overflow
Content-Language: en-US
To: Doug Anderson <dianders@chromium.org>
X-MD-Sfrom: suhui@nfschina.com
X-MD-Bcc: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
In-Reply-To: <CAD=FV=X_n4Si3k4iQ0yRJZRqX2DuhGF2pjPqEzbiKqBY3ZCNHg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: dri-devel@lists.freedesktop.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 andersson@kernel.org, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, u.kleine-koenig@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2023/6/6 23:28, Doug Anderson wrote:
> Hi,
>
> On Tue, Jun 6, 2023 at 12:56 AM Su Hui <suhui@nfschina.com> wrote:
>> Smatch error:buffer overflow 'ti_sn_bridge_refclk_lut' 5 <= 5.
>>
>> Fixes: cea86c5bb442 ("drm/bridge: ti-sn65dsi86: Implement the pwm_chip")
>> Signed-off-by: Su Hui <suhui@nfschina.com>
>> ---
>>   drivers/gpu/drm/bridge/ti-sn65dsi86.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
>> index 7a748785c545..952aae4221e7 100644
>> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
>> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
>> @@ -305,7 +305,8 @@ static void ti_sn_bridge_set_refclk_freq(struct ti_sn65dsi86 *pdata)
>>           * The PWM refclk is based on the value written to SN_DPPLL_SRC_REG,
>>           * regardless of its actual sourcing.
>>           */
>> -       pdata->pwm_refclk_freq = ti_sn_bridge_refclk_lut[i];
>> +       if (i < refclk_lut_size)
>> +               pdata->pwm_refclk_freq = ti_sn_bridge_refclk_lut[i];
> I don't think this is quite the right fix. I don't think we can just
> skip assigning "pdata->pwm_refclk_freq". In general I think we're in
> pretty bad shape if we ever fail to match a refclk from the table and
> I'm not quite sure how the bridge chip could work at all in this case.
> Probably that at least deserves a warning message in the logs. There's
> no place to return an error though, so I guess the warning is the best
> we can do and then we can do our best to do something reasonable.
>
> In this case, I think "reasonable" might be that if the for loop exits
> and "i == refclk_lut_size" that we should set "i" to 1. According to
> the datasheet [1] setting a value of 5 (which the existing code does)
> is the same as setting a value of 1 (the default) and if it's 1 then
> we'll be able to look this up in the table.
I think you are right, set i to 1 if i >= refclk_lut_size. I will resend 
this patch soon.
Thanks for your reply!

Su Hui

>
> [1] https://www.ti.com/lit/gpn/sn65dsi86
>
> -Doug
