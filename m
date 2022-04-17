Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB785045F3
	for <lists+dri-devel@lfdr.de>; Sun, 17 Apr 2022 03:44:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22D2310E04F;
	Sun, 17 Apr 2022 01:44:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12BEF10E04F
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Apr 2022 01:44:30 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id C2D9983DD4;
 Sun, 17 Apr 2022 03:44:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1650159868;
 bh=51zChSEyEIY05h2nvXl45XVNr+9ry2CLlIU/z+CEWew=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=fl/UNHHFgJhTQrcAmq3DMAnZvyPIFpFbBCvv4UzQjrqw1K56Tu2BDkstaTPOzOF25
 dOYXesHFFFi/Bg9lyj3lTKk5MEtmsuf1T9kpfRwsticPwNvsu3AcfNxCBnOvH8HHR5
 nmqDa8B4KEvrcrZLLlDvSQFclpIc6Mt9Lsw/WjyeFzuWr5CMfcRs/YjRQFuR6JhGsC
 p1BUmuK+F2+JwTeeTNtDrvBCfQ5oM0c/+tqHzrsC4AFz+91HOOL0ETxD3o70OZQ+na
 YpGNpQ7/353R+Ew3Z/yhzJYxvDJtPggrmNBrEOzCEOqsIRxd0AgLa0p/wFluAGHYD2
 mMUzCefwqZyPw==
Message-ID: <72cc674e-4bb3-6b14-aad8-f7d12cd5913e@denx.de>
Date: Sun, 17 Apr 2022 03:44:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 2/2] drm: lcdif: Add support for i.MX8MP LCDIF variant
Content-Language: en-US
To: Lucas Stach <l.stach@pengutronix.de>, dri-devel@lists.freedesktop.org
References: <20220322142853.125880-1-marex@denx.de>
 <20220322142853.125880-2-marex@denx.de>
 <97d0ed7496a65d70a79afed174a777d7d7abb4ae.camel@pengutronix.de>
 <0ba4a237-e8ac-485f-5291-5c23398ba6d7@denx.de>
 <41a531191aaaa880b9a44096b8e4c366f50d1f77.camel@pengutronix.de>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <41a531191aaaa880b9a44096b8e4c366f50d1f77.camel@pengutronix.de>
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
Cc: Peng Fan <peng.fan@nxp.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/7/22 10:48, Lucas Stach wrote:

[...]

>>>> +static void lcdif_set_mode(struct lcdif_drm_private *lcdif, u32 bus_flags)
>>>> +{
>>>> +	struct drm_display_mode *m = &lcdif->crtc.state->adjusted_mode;
>>>> +	u32 ctrl = 0;
>>>> +
>>>> +	if (m->flags & DRM_MODE_FLAG_PHSYNC)
>>>> +		ctrl |= CTRL_INV_HS;
>>>> +	if (m->flags & DRM_MODE_FLAG_PVSYNC)
>>>> +		ctrl |= CTRL_INV_VS;
>>>> +	/* Make sure Data Enable is high active by default */
>>>> +	if (!(bus_flags & DRM_BUS_FLAG_DE_LOW))
>>>> +		ctrl |= CTRL_INV_DE;
>>>
>>> The above three controls seems to have the wrong polarity. Bit set
>>> means low active according to the register documentation and the PVI in
>>> the HDMI path, which has configurable input signal polarity, seems to
>>> agree with that.
>>
>> I seem to recall seeing something about DE polarity being inverted in
>> odd way in the NXP downstream driver, and differently for each LCDIF
>> instance. Isn't that what you're seeing with HDMI ?
>>
> Yes, there seems to be some funky business going on here. I guess for
> the MIPI DSI path it's the same as on the i.MX8MM where the DSI core
> always expects the sync to be low active IIRC. In the HDMI path there
> is a block called PVI, which can be configured on what sync polarity to
> expect on the input. My experiments show that if I program the PVI for
> high active sync signals, the CTRL_INV_* bits must not be set in the
> LCDIF for the PVI to pick up the signal, which is consistent with the
> documentation of those bits in the LCDIF register map.

In terms of DE invert, the downstream driver indicates it is needed for 
both HDMI and DSI and not for LDB, and I already tested the later two 
(DSI and LDB). Maybe the HDMI bridge driver needs DE polarity inverted 
in one of the atomic callbacks ?
