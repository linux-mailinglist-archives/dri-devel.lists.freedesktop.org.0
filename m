Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98EDD425C9D
	for <lists+dri-devel@lfdr.de>; Thu,  7 Oct 2021 21:51:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53AC96E826;
	Thu,  7 Oct 2021 19:51:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15ABC6E826
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Oct 2021 19:51:11 +0000 (UTC)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 0A8BA83538;
 Thu,  7 Oct 2021 21:51:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1633636269;
 bh=FNVZALavoTZ+0MnkkJDtTMLIpEmkTkpeoLl93/jVJ+M=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=sIPDzaTFANNWHn6v25ST8tBbPkdojnKfECYKXJanKUImKAlIEQYwDs2G7VVWWDcRh
 Pz5gvbxwLg9dlqxcO3ykQGk81p8DfKWB/ri5E1PbjND0MF8Mhrd+V7KPuQtc9n/s4l
 ig+h3xG1tER9vOfRLPAFMdgvX8wMVtW2A8TQCBVC7uTDcB2SIeGi7htFWl09jA50tY
 BbC8glBlvvPOmDtf7s85hglvAjlSOU6Gfw0WVzq3IeypT7ULIwXT0zj7VE6umDIqo8
 HlaA86vQ4OvVSsYOLHh0bLxd0fSAizKOzss+BldThu1y4w/p1eg1G+GpnfFltvgGtV
 o46/fyIjbz5YA==
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi83: Implement .detach callback
To: Robert Foss <robert.foss@linaro.org>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Linus Walleij <linus.walleij@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
References: <20210907024038.871299-1-marex@denx.de>
 <CAG3jFyv-dHKn1HmMSU25zT1wfU0Zur_u45kD47KXrsz_pPEu0Q@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <f28f9d1a-f2fe-8e04-a94e-acf940eda508@denx.de>
Date: Thu, 7 Oct 2021 21:51:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAG3jFyv-dHKn1HmMSU25zT1wfU0Zur_u45kD47KXrsz_pPEu0Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/6/21 11:47 AM, Robert Foss wrote:
>>
> On Tue, 7 Sept 2021 at 04:40, Marek Vasut <marex@denx.de> wrote:
>>
>> Move detach implementation from sn65dsi83_remove() to dedicated
>   .detach callback. There is no functional change to the code, but
>> that detach is now in the correct location.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> Cc: Jagan Teki <jagan@amarulasolutions.com>
>> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> Cc: Linus Walleij <linus.walleij@linaro.org>
>> Cc: Robert Foss <robert.foss@linaro.org>
>> Cc: Sam Ravnborg <sam@ravnborg.org>
>> Cc: dri-devel@lists.freedesktop.org
>> ---
>>   drivers/gpu/drm/bridge/ti-sn65dsi83.c | 17 ++++++++++++++---
>>   1 file changed, 14 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
>> index 4ea71d7f0bfbc..13ee313daba96 100644
>> --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
>> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
>> @@ -288,6 +288,19 @@ static int sn65dsi83_attach(struct drm_bridge *bridge,
>>          return ret;
>>   }
>>
>> +static void sn65dsi83_detach(struct drm_bridge *bridge)
>> +{
>> +       struct sn65dsi83 *ctx = bridge_to_sn65dsi83(bridge);
>> +
>> +       if (!ctx->dsi)
>> +               return;
>> +
>> +       mipi_dsi_detach(ctx->dsi);
>> +       mipi_dsi_device_unregister(ctx->dsi);
>> +       drm_bridge_remove(&ctx->bridge);
>> +       ctx->dsi = NULL;
> 
> Is this assignment necessary? I'm not seeing it in the other drivers.
> 
> WIth this cleared up feel free to add my r-b.
> Reviewed-by: Robert Foss <robert.foss@linaro.org>

It works in tandem with the if (!ctx->dsi) return; at the beginning to 
prevent crash in case the detach callback was called multiple times for 
whatever reason.
