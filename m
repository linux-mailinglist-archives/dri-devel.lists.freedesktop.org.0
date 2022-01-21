Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0E1495FC1
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jan 2022 14:28:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57F1210EB10;
	Fri, 21 Jan 2022 13:28:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA8C710EB0A
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jan 2022 13:28:47 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 6755B80FE1;
 Fri, 21 Jan 2022 14:28:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1642771726;
 bh=+vQdfU2JkINR+WOEonZ1XBYtiZUhavjnNuh9FSJugW8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=tpppOmobNR7k1qnWsY9x+K3cV8HaUVAnsVMWtZZtPonJKRjJdp8Y2uek1gPqWv4vi
 v+Y1i8pg+Z3ttVZ3gRwZneiOC523B4G4rPKw54cC2xbkRfzL/DqDJatJ62pUl4xR64
 lI+bjCK9hf9UKbes15yvpmhQ+O17RZoQiTGIVbUSqITRNHsIXERH6KLaTv3aUyrbrA
 98Jx5+B+q8zFNlWgks1g5/YZyollMDfJb4i3G5+HQsOd21SKM1NKE/5E3t9p2VTGiB
 qGgrvuIvSMZ+0fNQ1mXERudBGduGpYjj/Xg0UmwSlohlK2IKc7myPhwFfncYtQ/VBG
 TwYC/TraIjfiw==
Message-ID: <9b71782f-a54f-9323-ffd8-141dfe5e875e@denx.de>
Date: Fri, 21 Jan 2022 14:28:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: (EXT) Re: [PATCH 1/1] drm: mxsfb: Fix NULL pointer dereference
Content-Language: en-US
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Stefan Agner <stefan@agner.ch>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20220121131238.507567-1-alexander.stein@ew.tq-group.com>
 <4d3654b5-9a87-1c02-f2d9-d0974e628c20@denx.de> <2361278.ElGaqSPkdT@steina-w>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <2361278.ElGaqSPkdT@steina-w>
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
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/21/22 14:24, Alexander Stein wrote:
> Am Freitag, 21. Januar 2022, 14:14:01 CET schrieb Marek Vasut:
>> On 1/21/22 14:12, Alexander Stein wrote:
>>> Do not deference the NULL pointer if the bridge does not return a
>>> bridge state. Assume a fixed format instead.
>>>
>>> Fixes: commit b776b0f00f24 ("drm: mxsfb: Use bus_format from the nearest
>>> bridge if present") Signed-off-by: Alexander Stein
>>> <alexander.stein@ew.tq-group.com>
>>> ---
>>> This can happen if a "ti,sn75lvds83", "lvds-encoder" bridge is attached
>>> to it. atomic_get_input_bus_fmts is only implemented for the
>>> lvds-decoder case.
>>>
>>>    drivers/gpu/drm/mxsfb/mxsfb_kms.c | 6 +++++-
>>>    1 file changed, 5 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
>>> b/drivers/gpu/drm/mxsfb/mxsfb_kms.c index 0655582ae8ed..4cfb6c001679
>>> 100644
>>> --- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
>>> +++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
>>> @@ -361,7 +361,11 @@ static void mxsfb_crtc_atomic_enable(struct drm_crtc
>>> *crtc,>
>>>    		bridge_state =
>>>    		
>>>    			drm_atomic_get_new_bridge_state(state,
>>>    			
>>>    							
> mxsfb->bridge);
>>>
>>> -		bus_format = bridge_state->input_bus_cfg.format;
>>> +		if (!bridge_state)
>>> +			bus_format = MEDIA_BUS_FMT_FIXED;
>>> +		else
>>> +			bus_format = bridge_state-
>> input_bus_cfg.format;
>>> +
>>>
>>>    		if (bus_format == MEDIA_BUS_FMT_FIXED) {
>>>    		
>>>    			dev_warn_once(drm->dev,
>>>    			
>>>    				      "Bridge does not provide bus
> format, assuming
>>>    				      MEDIA_BUS_FMT_RGB888_1X24.
> \n"
>>
>> Shouldn't this be fixed on the bridge driver side instead ?
>>
>> Which bridge driver do you use ?
> 
> It's drivers/gpu/drm/bridge/lvds-codec.c. I thought naming the compatibles
> would suffice. I consider a patch for the bridge driver as a separate issue,
> hence the warning from mxsfb. Although I'm unsure how/what to implement.
> Similar to the encode case where the bus format is specified in DT?

I'm sorry, I missed the lvds-codec part. Laurent is already on CC.

> Anyway, mxsfb should not never dereference the NULL pointer which
> drm_atomic_get_new_bridge_state is allowed to return.

That line ^ should be in the commit message.
