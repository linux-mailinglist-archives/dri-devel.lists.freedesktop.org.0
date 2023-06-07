Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C8772585C
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 10:46:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 552D810E47F;
	Wed,  7 Jun 2023 08:45:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 611 seconds by postgrey-1.36 at gabe;
 Wed, 07 Jun 2023 01:00:50 UTC
Received: from smtp.tom.com (smtprz25.163.net [106.38.219.110])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62A4D10E3FD
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 01:00:50 +0000 (UTC)
Received: from my-app02.tom.com (my-app02.tom.com [127.0.0.1])
 by freemail02.tom.com (Postfix) with ESMTP id B5232B00D45
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 08:50:35 +0800 (CST)
Received: from my-app02.tom.com (HELO smtp.tom.com) ([127.0.0.1])
 by my-app02 (TOM SMTP Server) with SMTP ID 1945390657
 for <dri-devel@lists.freedesktop.org>;
 Wed, 07 Jun 2023 08:50:35 +0800 (CST)
Received: from antispam1.tom.com (unknown [172.25.16.55])
 by freemail02.tom.com (Postfix) with ESMTP id A2B5FB00CBF
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 08:50:34 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tom.com; s=201807;
 t=1686099035; bh=QsFM4uyy5VZQwk9mEzKAccKlevD3TSVUAfLJgnmLgyU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=GeWkcCSocYpAIfjS1zXhLvob49Q3HRhMPXc6qXDllzN07hUYC4C5YMUtDBE6JLw6N
 NKfue4T4hfe6z4JIyPlS/DUaTraGT7nuj9vZB9alVIojirtSubISpwYZCzTETdhCVA
 xvrS1ETseqqcP5cHJAZPkcXzE+qaQ42uCpQ++mNE=
Received: from antispam1.tom.com (antispam1.tom.com [127.0.0.1])
 by antispam1.tom.com (Postfix) with ESMTP id 4ABBCD41A3A
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 08:50:34 +0800 (CST)
X-Virus-Scanned: Debian amavisd-new at antispam1.tom.com
Received: from antispam1.tom.com ([127.0.0.1])
 by antispam1.tom.com (antispam1.tom.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id byNKfc_GrcMW for <dri-devel@lists.freedesktop.org>;
 Wed,  7 Jun 2023 08:50:26 +0800 (CST)
Received: from [172.30.38.103] (unknown [180.167.10.98])
 by antispam1.tom.com (Postfix) with ESMTPA id 3D3ACD4170C;
 Wed,  7 Jun 2023 08:50:24 +0800 (CST)
Message-ID: <928cc71e-7b66-9cb0-7751-ce1f65489360@tom.com>
Date: Wed, 7 Jun 2023 08:50:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: Avoid possible buffer overflow
Content-Language: en-US
To: Doug Anderson <dianders@chromium.org>
References: <20230606075527.155346-1-suhui@nfschina.com>
 <CAD=FV=X_n4Si3k4iQ0yRJZRqX2DuhGF2pjPqEzbiKqBY3ZCNHg@mail.gmail.com>
From: Longsuhui <Jack_sun@tom.com>
In-Reply-To: <CAD=FV=X_n4Si3k4iQ0yRJZRqX2DuhGF2pjPqEzbiKqBY3ZCNHg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 07 Jun 2023 08:45:26 +0000
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
I think you are right. And " if ( i >= refclk_lut_size) i=1" is a 
suitable change.
I will send patch v2 a litter latter.
Thanks for your suggestion.

Su Hui

>
> [1] https://www.ti.com/lit/gpn/sn65dsi86
>
> -Doug
