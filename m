Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F667F08A6
	for <lists+dri-devel@lfdr.de>; Sun, 19 Nov 2023 20:50:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96E4410E0E2;
	Sun, 19 Nov 2023 19:50:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01C0E10E0E2
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Nov 2023 19:50:32 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 57CAF87208;
 Sun, 19 Nov 2023 20:50:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1700423431;
 bh=n2dd4jEtaguUwoQrk85SLYg7amBJ2fX16HiMWPNZ6+A=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=wabnwlZeaqsSfO0LJmPUcGxQbHekMBd3HjHqflE88W69k1OoTN5Y6SDLmp6q8o7VL
 a4G7vT6VSY+lnTPG3IJcPd2pSygoMJ3fojPf5FF5mjpNFFHiSPIRZgugtGGMhRm5oI
 puhW0h9E2JG6864iynI8TWqBN7v16Lt8WBC9fTgzFF7Ls/7P4pq7aTVIy7lZzkUqP0
 Bz8qGbFcwSyKaTeV4kxWGucY1tQQlW44FgKzYnpXfmsoP6HbRn4++1EI5b+CKd71bW
 17euZwt2yr0SZiFzQ5GlLP/2rKF8g8LXY7Bns7bsJ+IIrOibXX9PCzjhJfgAMF3Xb9
 cz9mzQCj+WpBw==
Message-ID: <ed4b33fb-403c-4c1d-b1a4-f63b765c38cf@denx.de>
Date: Sun, 19 Nov 2023 20:50:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panel: simple: Fix Innolux G101ICE-L01 bus flags
Content-Language: en-US
To: Maxime Ripard <mripard@kernel.org>
References: <20231008223315.279215-1-marex@denx.de>
 <ea0e3550-83ca-4006-819a-64780589d687@linaro.org>
 <5481d74f-4b58-4527-987a-562e1b213a6b@denx.de>
 <oe2rcrep4rukf7k3aqc6grfbp2hh4syehtmxivbjx746u46lg2@74v2bl526mpm>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <oe2rcrep4rukf7k3aqc6grfbp2hh4syehtmxivbjx746u46lg2@74v2bl526mpm>
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
Cc: neil.armstrong@linaro.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/17/23 09:40, Maxime Ripard wrote:
> On Thu, Nov 16, 2023 at 10:15:31PM +0100, Marek Vasut wrote:
>> On 10/9/23 10:58, Neil Armstrong wrote:
>>> On 09/10/2023 00:33, Marek Vasut wrote:
>>>> Add missing .bus_flags = DRM_BUS_FLAG_DE_HIGH to this panel description,
>>>> ones which match both the datasheet and the panel display_timing flags .
>>>>
>>>> Fixes: 1e29b840af9f ("drm/panel: simple: Add Innolux G101ICE-L01 panel")
>>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>>> ---
>>>> Cc: Daniel Vetter <daniel@ffwll.ch>
>>>> Cc: David Airlie <airlied@gmail.com>
>>>> Cc: Jessica Zhang <quic_jesszhan@quicinc.com>
>>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>>> Cc: Maxime Ripard <mripard@kernel.org>
>>>> Cc: Neil Armstrong <neil.armstrong@linaro.org>
>>>> Cc: Sam Ravnborg <sam@ravnborg.org>
>>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>>> Cc: dri-devel@lists.freedesktop.org
>>>> ---
>>>>    drivers/gpu/drm/panel/panel-simple.c | 1 +
>>>>    1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/panel/panel-simple.c
>>>> b/drivers/gpu/drm/panel/panel-simple.c
>>>> index 44c11c418cd56..8e4ea15f0e1e5 100644
>>>> --- a/drivers/gpu/drm/panel/panel-simple.c
>>>> +++ b/drivers/gpu/drm/panel/panel-simple.c
>>>> @@ -2318,6 +2318,7 @@ static const struct panel_desc
>>>> innolux_g101ice_l01 = {
>>>>            .disable = 200,
>>>>        },
>>>>        .bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
>>>> +    .bus_flags = DRM_BUS_FLAG_DE_HIGH,
>>>>        .connector_type = DRM_MODE_CONNECTOR_LVDS,
>>>>    };
>>>
>>> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
>>
>> Maybe it is time to apply ?
> 
> The expectation is that you would kind of apply it yourself. Do you have
> a drm-misc committer account? If not, you should apply for one, you
> definitely qualify.

Applied to drm-misc/fixes
