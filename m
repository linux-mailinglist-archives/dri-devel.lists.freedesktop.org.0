Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A78F9857FE2
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 15:58:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A059F10E187;
	Fri, 16 Feb 2024 14:58:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="S3H2/R8G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D25C10E187
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 14:58:06 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id BA05087E28;
 Fri, 16 Feb 2024 15:57:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1708095482;
 bh=X3NbXL/gGHd/P6iqK+xeE/pRyvyOvGn9pk40pfqJSe8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=S3H2/R8GcAq1+/JXttv9uuc1Q8rCYjVr7aJWZ1L5G/m7LupsNCEMGBA1XGXvWuyvV
 Ol4UaoIrAo/slESxhd5vktlCDMaeZ122eTo/DXFkfw/h3OHfRHX9qhkn3RT4YjVhGG
 otrbJhdDl8LuYwJ/9niJdjioT8lVennzJBXlC5M8c6u/kMd3DuWBfrTD3Fggf26sqh
 MFGFaJdvSMPzu89BZBXPA+YCQF2QVTFQLW61QROaTgysg43qSQv6pO0rrICl29h4Dg
 fsq8jRbdMRkX8c4y4ME7Z+FMbsD0XPOMsn5D1SXNu501QW5PIXRnIkaRwBOFebzwVU
 WrdzX4vbpyKWA==
Message-ID: <bc96c6b5-a7f8-4ef3-a89b-bf577943f11c@denx.de>
Date: Fri, 16 Feb 2024 15:57:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] drm/bridge: tc358767: Fix
 DRM_BRIDGE_ATTACH_NO_CONNECTOR case
Content-Language: en-US
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Aradhya Bhatia <a-bhatia1@ti.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 Jan Kiszka <jan.kiszka@siemens.com>
Cc: linux-kernel@vger.kernel.org
References: <20231108-tc358767-v2-0-25c5f70a2159@ideasonboard.com>
 <f6af46e0-aadb-450a-9349-eec1337ea870@ti.com>
 <2f3bb86b-6f8c-4807-985e-344a0c47864c@siemens.com>
 <3277848.aeNJFYEL58@steina-w>
 <b2052bc9-b2da-489b-9e5b-3c9b4f6c1c99@ideasonboard.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <b2052bc9-b2da-489b-9e5b-3c9b4f6c1c99@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 2/16/24 10:10, Tomi Valkeinen wrote:
> On 15/02/2024 11:03, Alexander Stein wrote:
>> Hi everyone,
>>
>> Am Donnerstag, 15. Februar 2024, 09:53:54 CET schrieb Jan Kiszka:
>>> On 11.12.23 09:07, Aradhya Bhatia wrote:
>>>> On 06/12/23 17:41, Tomi Valkeinen wrote:
>>>>> Hi,
>>>>>
>>>>> On 08/11/2023 14:45, Alexander Stein wrote:
>>>>>> Hi Tomi,
>>>>>>
>>>>>> Am Mittwoch, 8. November 2023, 12:27:21 CET schrieb Tomi Valkeinen:
>>>>>>> These two patches are needed to make tc358767 work in the
>>>>>>> DRM_BRIDGE_ATTACH_NO_CONNECTOR case, at least when using a DP
>>>>>>> connector.
>>>>>>>
>>>>>>> I have tested this with TI AM654 EVM with a tc358767 add-on card
>>>>>>> connected to a DP monitor.
>>>>>>
>>>>>> Just a question regarding the usage of this DSI-DP bridge.
>>>>>> What is the state of the DSI lanes after the DSI host has been
>>>>>> initialized,
>>>>>> but before calling atomic_pre_enable? AFAIK this bridge requires 
>>>>>> LP-11
>>>>>> on DSI
>>>>>> at any time for accessing the AUX channel.
>>>>
>>>> + Marek
>>>>
>>>> Marek, Alexander,
>>>>
>>>> A quick grep tells me that you have added devicetree for tc358767 in 
>>>> DSI
>>>> to (e)DP mode on other platforms. Could you please test these patches
>>>> and report if you find any issue?
>>
>> Sorry, I can't provide any feedback here. I've yet to setup the DSI-DP
>> correctly.
> 
> Ok. Does anyone have a worry that these patches make the situation worse 
> for the DSI case than it was before? Afaics, if the DSI lanes are not 
> set up early enough by the DSI host, the driver would break with and 
> without these patches.
> 
> These do fix the driver for DRM_BRIDGE_ATTACH_NO_CONNECTOR and DPI, so 
> I'd like to merge these unless these cause a regression with the DSI case.

1/2 looks good to me, go ahead and apply .
