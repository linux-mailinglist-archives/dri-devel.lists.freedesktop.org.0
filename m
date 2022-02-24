Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F7B4C3689
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 21:07:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A3C210E5F0;
	Thu, 24 Feb 2022 20:07:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02E5410E5F0
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 20:07:21 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 180A983CCE;
 Thu, 24 Feb 2022 21:07:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1645733240;
 bh=GcCXKskWC2clX9uqU4ifdEpbCKhdmi5uJnZelQ2/BTI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=FJMGVK28IAyPW3qhOZpUi3+Eobhc/0ubzZZVxteiTeu73FmGYkUood9pR2gIzX0Hv
 vrHt6XdaR6346MaVNdihqj3Bo+GsYLStVdxH2uXmXT4EHC3Xb2uojba5b9N1asdD0B
 AkCWagd7yBdjkKZciCEAfXKZEFMYttxAsW3HS9Hdj4qogOp0GLyfG+G4r6dtpIJ+U1
 mGMVjtCQgM0MT8dRfVpyLhueQ3WXgYvPOxLSxoP3dBUH1kqMKsBo87iE4FoMjKbKdx
 pnBi8HcWBre0y73BpUABORkcf8DiC4xQNp7ZDQMKWwrmpkZZ8xQWIH4B5QaT2yVl9P
 astUmzMmrPslA==
Message-ID: <0cc9da51-d94d-82be-69ef-80f8dc0544fd@denx.de>
Date: Thu, 24 Feb 2022 21:07:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 3/7] drm/bridge: Extend struct drm_bus_cfg with clock field
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>
References: <20220219002844.362157-1-marex@denx.de>
 <20220219002844.362157-4-marex@denx.de>
 <20220224151902.4qdgdxdufvmhwezm@houat>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20220224151902.4qdgdxdufvmhwezm@houat>
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
Cc: Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/24/22 16:19, Maxime Ripard wrote:
> Hi,

Hi,

> On Sat, Feb 19, 2022 at 01:28:40AM +0100, Marek Vasut wrote:
>> diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
>> index 1701c2128a5cb..32455cf28f0bc 100644
>> --- a/include/drm/drm_atomic.h
>> +++ b/include/drm/drm_atomic.h
>> @@ -1077,6 +1077,11 @@ struct drm_bus_cfg {
>>   	 * @flags: DRM_BUS_* flags used on this bus
>>   	 */
>>   	u32 flags;
>> +
>> +	/**
>> +	 * @clock: Clock frequency in kHz used on this bus
>> +	 */
>> +	u32 clock;
>>   };
> 
> This is fairly vague. You were mentioning DSI: is it the pixel clock?

DSI HS clock is the one I need.

I hope we can flesh out what exactly should be in here.

> The HS clock rate?

Yes

> With or without counting the lanes? What about the

Without

> burst mode: would it be the lane or pixel rate?

Still the HS clock rate.

> It would be just as confusing for HDMI: is it the the TMDS character
> rate? The TMDS bit rate ? TMDS Clock rate?

For HDMI I would expect 148.5 MHz here , and if HDMI needs additional 
extras, they might have to be added to struct drm_bus_cfg as extra fields ?
