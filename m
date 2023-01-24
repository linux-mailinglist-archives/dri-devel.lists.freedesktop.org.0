Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FBD679C69
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 15:48:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FB6510E049;
	Tue, 24 Jan 2023 14:48:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86E8410E049
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 14:48:35 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id DAD2E8563B;
 Tue, 24 Jan 2023 15:48:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1674571713;
 bh=Y5gd2EDZ3Kk/gz4KuqyqTDq9f2L0geBvWTECbmKRxN0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=VuZHofmifGRfHdEG7Cdxz2Mu0ebPR7yzH4o9dCwFx27waZvyKcKpiQXSllJeBJH2Z
 ammntn4sLK8BdzUnAsfiGa6Zhe3IPqqu0qSleVMA3vwe2aWVn7EYCeT6eCHu4lx0/t
 oKSb68hlsCr20gfOc83UwatA4QWY3NYKbAWWVHcLnhM2rnF/gs4TMi3HE05ReDGWSY
 lMkzVrI+Gv4hPSfmiIlvmX2cUbi3DUW9Qftk+yaL6UFiL2w8qmXvbl5zorAe5AXW8U
 k4x+DHSkFtd3dmtPLovLfoji+XbbElt8Z5eR+e2YLIOh47GbMZmOqD1OGmTMib/CjG
 uRVXjw6Z2Rwjg==
Message-ID: <25ff9e4d-0a9f-59fc-902a-5b68cf7200b9@denx.de>
Date: Tue, 24 Jan 2023 15:47:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 2/2] drm: lcdif: Add i.MX93 LCDIF support
Content-Language: en-US
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Liu Ying <victor.liu@nxp.com>
References: <20230123072358.1060670-1-victor.liu@nxp.com>
 <ace76615-533a-9295-8271-95262859d287@denx.de>
 <7ac57bc28da40df054c81fd74f69207af66ad97b.camel@nxp.com>
 <13189854.uLZWGnKmhe@steina-w>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <13189854.uLZWGnKmhe@steina-w>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
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
Cc: krzysztof.kozlowski+dt@linaro.org, s.hauer@pengutronix.de,
 robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de,
 shawnguo@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/24/23 12:15, Alexander Stein wrote:
> Hi,

Hi,

> Am Dienstag, 24. Januar 2023, 08:59:39 CET schrieb Liu Ying:
>> On Mon, 2023-01-23 at 16:57 +0100, Marek Vasut wrote:
>>> On 1/23/23 08:23, Liu Ying wrote:
>>>> The LCDIF embedded in i.MX93 SoC is essentially the same to those
>>>> in i.MX8mp SoC.  However, i.MX93 LCDIF may connect with MIPI DSI
>>>> controller through LCDIF cross line pattern(controlled by mediamix
>>>> blk-ctrl) or connect with LVDS display bridge(LDB) directly or a
>>>> parallel display(also through mediamix blk-ctrl), so add multiple
>>>> encoders(with DRM_MODE_ENCODER_NONE encoder type) support in the
>>>> LCDIF DRM driver and find a bridge to attach the relevant encoder's
>>>> chain when needed.  While at it, derive lcdif_crtc_state structure
>>>> from drm_crtc_state structure to introduce bus_format and bus_flags
>>>> states so that the next downstream bridges may use consistent bus
>>>> format and bus flags.
>>>
>>> Would it be possible to split this patch into preparatory clean up
>>> and
>>> i.MX93 addition ? It seems like the patch is doing two things
>>> according
>>> to the commit message.
>>
>> IMHO, all the patch does is for i.MX93 addition, not for clean up.
>> Note that the single LCDIF embedded in i.MX93 SoC may connect with MIPI
>> DSI/LVDS/parallel related bridges to drive triple displays
>> _simultaneously_ in theory, while the three LCDIF instances embedded in
>> i.MX8mp SoC connect with MIPI DSI/LVDS/HDMI displays respectively(one
>> LCDIF maps to one display).  The multiple encoders addition and the new
>> checks for consistent bus format and bus flags are only for i.MX93
>> LCDIF, not for i.MX8mp LCDIF.  Also, I think the multiple encoders
>> addition and the new checks should be done together - if the new checks
>> come first, then the new checks do not make sense(no multiple displays
>> driven by LCDIF);
> 
> You are right on this one, but on the other hand there are lot of preparing
> patches already. Even if it is useless by itself, having the bus format & flag
> checks in a separate patch, it is easier to review, IMHO.

I agree on the ease of review.

[...]
