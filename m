Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFD27EF6BE
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 18:07:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0811C10E301;
	Fri, 17 Nov 2023 17:07:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5960610E0E7
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 17:07:03 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 817E3842D0;
 Fri, 17 Nov 2023 18:07:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1700240821;
 bh=X7nMSKrFJe2sRPOQBYlAl37GuSU+Z4H9smZAW4lHCuM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=hS3zZ6+8oATFLdLRUScOKdrLTTtpCCQvTg0t1idxHCFXQw5/gsd6saANcj9paSELk
 FIed+V31hokxxbkqc8gNl7mqetOcGZfr17zQrIuwR5Og1EYbIU735yGvvrkAB5szYb
 A1pz9Org7m3YjPm82ZXyYt3uvgupspm7aVB8WtBiByPNzxuFNMi9ggRGSQ9yh82XFI
 o1cr26nHVrAwgjpjWBanzPu1CI8+BcK0Ewoefobj+UzMbooOmOkgOQ0jfoN5D1VtWL
 kqNJ2LirYfEF9zWRnH68t2MmxEr3c86a2tBehnI6pAswfeofQuRAoa3Vh4BEvgGiNn
 8wvHuD0fKZ49A==
Message-ID: <03332417-2029-4a47-a655-0b7cb26828ee@denx.de>
Date: Fri, 17 Nov 2023 18:07:00 +0100
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

I do, I'm just not a big fan of applying my own patches, but since there 
is a RB, I will do that in a bit.
