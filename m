Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 144C78ACDA4
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 15:01:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55A52112889;
	Mon, 22 Apr 2024 13:01:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="K13OrbP5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A7DB112889
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 13:01:12 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 46CEB882F0;
 Mon, 22 Apr 2024 15:01:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1713790870;
 bh=Id/NSNaXyVXY6rBoqDKvTGFS4QH4FIlYm4f/5nPxJnw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=K13OrbP5qgRfQrO584HKME2f6P7aPXqk8CP/Dp6Aek6PqBDW3amI+gmIzxmjmB9gu
 DdKNNDDbReArJYtr59e8OTwDiYYQy6W/hpj865hr9il/rEexi2/jQ51yO99OTl8CPs
 OX6s1AU+xl9scUWb8nSGGRTvQpnXp+YLP8jiywO8r/6q+oImRLQKAJTestnWA/waoe
 6Oya8yTiWkmqiVIFJg7JGEzevkk+UAKdDtedvxzDckHirFCl/h0/nrmTOhgi4btWJ/
 C3x2xnWeU3RFWM8TQWcy46O9LQC+hWpsf15ngvepppVjeoAnbsDYk+xwmi/eRi6kFx
 MZq4w8QyTEC+w==
Message-ID: <47b26a19-9aba-4380-9d05-f06bd8bc20b1@denx.de>
Date: Mon, 22 Apr 2024 14:30:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/2] drm/bridge: samsung-dsim: Fix porch calcalcuation
 rounding
To: Adam Ford <aford173@gmail.com>
Cc: dri-devel@lists.freedesktop.org, aford@beaconembedded.com,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Marco Felsch <m.felsch@pengutronix.de>,
 Michael Tretter <m.tretter@pengutronix.de>, linux-kernel@vger.kernel.org
References: <20240211230931.188194-1-aford173@gmail.com>
 <20240211230931.188194-2-aford173@gmail.com>
 <6111fe04-4ecb-428e-9a0c-dc02cadfe3e7@denx.de>
 <CAHCN7x+DwSSabhGYZ1dnZzwRe+BJfz2H-AXbxjUQWytrq3OMpQ@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAHCN7x+DwSSabhGYZ1dnZzwRe+BJfz2H-AXbxjUQWytrq3OMpQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
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

On 4/22/24 2:09 PM, Adam Ford wrote:
> On Sun, Apr 21, 2024 at 9:36 AM Marek Vasut <marex@denx.de> wrote:
>>
>> On 2/12/24 12:09 AM, Adam Ford wrote:
>>> When using video sync pulses, the HFP, HBP, and HSA are divided between
>>> the available lanes if there is more than one lane.  For certain
>>> timings and lane configurations, the HFP may not be evenly divisible.
>>> If the HFP is rounded down, it ends up being too small which can cause
>>> some monitors to not sync properly. In these instances, adjust htotal
>>> and hsync to round the HFP up, and recalculate the htotal.
>>>
>>> Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de> # Kontron BL i.MX8MM with HDMI monitor
>>> Signed-off-by: Adam Ford <aford173@gmail.com>
>>> ---
>>> V2:  No changes
>>>
>>> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
>>> index 8476650c477c..52939211fe93 100644
>>> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
>>> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
>>> @@ -1606,6 +1606,27 @@ static int samsung_dsim_atomic_check(struct drm_bridge *bridge,
>>>                adjusted_mode->flags |= (DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
>>>        }
>>>
>>> +     /*
>>> +      * When using video sync pulses, the HFP, HBP, and HSA are divided between
>>> +      * the available lanes if there is more than one lane.  For certain
>>> +      * timings and lane configurations, the HFP may not be evenly divisible.
>>> +      * If the HFP is rounded down, it ends up being too small which can cause
>>> +      * some monitors to not sync properly. In these instances, adjust htotal
>>> +      * and hsync to round the HFP up, and recalculate the htotal. Through trial
>>> +      * and error, it appears that the HBP and HSA do not appearto need the same
>>> +      * correction that HFP does.
>>> +      */
>>> +     if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE && dsi->lanes > 1) {
>>
>> Does this also apply to mode with sync events (I suspect it does), so
>> the condition here should likely be if (!...burst mode) , right ?
> 
> Thanks for the review!
> 
> I was only able to test it with the DSI->ADV6535 bridge, and I'll
> admit I don't know a lot about DSI interface since I don't have a copy
> of the spec to read.
> 
> Are you proposing this should be:
> 
>   if (!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST) && dsi->lanes > 1) {
> 
> I just want to make sure I understand what you're requesting.

Yes, exactly this.
