Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 122FDB53823
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 17:48:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA30310EB6C;
	Thu, 11 Sep 2025 15:48:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="0jQ8nyKP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1506510EB6C
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 15:48:07 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id BBFE64E40C7A;
 Thu, 11 Sep 2025 15:48:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8E4B460638;
 Thu, 11 Sep 2025 15:48:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6101F102F2906; 
 Thu, 11 Sep 2025 17:47:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1757605684; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=HdFDI1Zt4qmZyY2/ODcY5Tj0bjK1ieTRUu9lzaLuW8I=;
 b=0jQ8nyKPqSLy6yMyxtzn0i1pE7xvquZ56BuiAgAKXKI56Kd+C1wE64HxNKu3NabXnnnAsk
 qK5Aur62HdPoJgLNgsTqYG0YB92Dr14m8ByQZPFLBCigWw61XZsa1cQaeyFwipnB5z3Utm
 xw/AEbkf+sZVQ99MOc+AgTPll/rV+w4PncpZQ5RfsNtbQHwDkQGQ+nh9E163WTiJAdIPs9
 3fUNHmWZ4NHqO7EekYXreubUIVJf6E/51JUh3v/gNoiOKqBQBpXtqX1/94WDxDmPw6Ymc3
 H1bHa040x4bFCDI8+WGE/DsjN9CO6w05wfDENdPV/2FF/9psqmTuU91NNfdJyQ==
Message-ID: <21f80397-be9c-49bd-b814-ea5f0eb5fdc8@bootlin.com>
Date: Thu, 11 Sep 2025 17:47:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/bridge: ite-it66121: Add drm_connector support
From: Miguel Gazquez <miguel.gazquez@bootlin.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Maxime Ripard <mripard@kernel.org>, Phong LE <ple@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
 miquel.raynal@bootlin.com, kory.maincent@bootlin.com,
 romain.gantois@bootlin.com, praneeth@ti.com,
 Aradhya Bhatia <a-bhatia1@ti.com>
References: <20250909-it66121-fix-v1-1-bc79ca83df17@bootlin.com>
 <do5zciwcanpiciy52zj3nn6igmwlgmbcfdwbibv2ijxm2fif5s@ib6jhzi5h2jo>
 <6164422a-6265-4726-8da5-68bb8eafb9e6@bootlin.com>
 <20250911-innocent-daffodil-macaque-797f13@houat>
 <012046ab-d866-4b3a-8c8a-e130bc2b9628@bootlin.com>
 <2l5kp4ojrcsg2apcpv7mzeeypwynecyfesenks6zzvnst3qkbt@4yhbosy2zhah>
 <e6af5c37-d18a-423e-b822-367441a48f86@bootlin.com>
Content-Language: en-US
In-Reply-To: <e6af5c37-d18a-423e-b822-367441a48f86@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
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



Le 11/09/2025 à 17:40, Miguel Gazquez a écrit :
> 
> 
> Le 11/09/2025 à 15:09, Dmitry Baryshkov a écrit :
>> On Thu, Sep 11, 2025 at 02:49:59PM +0200, Miguel Gazquez wrote:
>>>
>>>
>>> Le 11/09/2025 à 11:50, Maxime Ripard a écrit :
>>>> On Thu, Sep 11, 2025 at 10:51:06AM +0200, Miguel Gazquez wrote:
>>>>>
>>>>>
>>>>> Le 10/09/2025 à 04:28, Dmitry Baryshkov a écrit :
>>>>>> On Tue, Sep 09, 2025 at 06:16:43PM +0200, Miguel Gazquez wrote:
>>>>>>> From: Aradhya Bhatia <a-bhatia1@ti.com>
>>>>>>>
>>>>>>> Add support for DRM connector and make the driver support the older
>>>>>>> format of attaching connectors onto the encoder->bridge->connector
>>>>>>> chain.
>>>>>>> This makes the driver compatible with display controller that only
>>>>>>> supports the old format.
>>>>>>>
>>>>>>> [Miguel Gazquez: Rebased + made driver work with or without
>>>>>>> DRM_BRIDGE_ATTACH_NO_CONNECTOR]
>>>>>>
>>>>>> What is the use case for not using DRM_BRIDGE_ATTACH_NO_CONNECTOR?
>>>>>
>>>>> Some display controller drivers (like the tilcdc) call 
>>>>> drm_bridge_attach
>>>>> without DRM_BRIDGE_ATTACH_NO_CONNECTOR, so the bridge must support 
>>>>> both with
>>>>> and without DRM_BRIDGE_ATTACH_NO_CONNECTOR to be compatible with 
>>>>> all display
>>>>> controllers.
>>>>
>>>> I'd rather convert tilcdc to use DRM_BRIDGE_ATTACH_NO_CONNECTOR then.
>>>
>>> The problem is that doing that break devicetrees using the tilcdc and a
>>> bridge who doesn't support DRM_BRIDGE_ATTACH_NO_CONNECTOR (there are
>>> multiple bridges that don't support DRM_BRIDGE_ATTACH_NO_CONNECTOR), 
>>> and if
>>> my understanding is correct breaking devicetrees is not allowed.
>>
>> How does it break devicetree? The drm_bridge_connector isn't a part of
>> DT.
> 
> 
> In the current situation, a board could have the tilcdc linked with a 
> bridge that does not support DRM_BRIDGE_ATTACH_NO_CONNECTOR (for 
> example, the analogix-anx6345) , and everything will work fine.
> If we convert the tilcdc to always use DRM_BRIDGE_ATTACH_NO_CONNECTOR, 
> that same configuration will stop working.
> 
> When I said "breaking devicetree" I meant that a devicetree describing 
> this setup would no longer produce a working system, not that the DT 
> files or bindings themselves are incorrect.
> I didn't find any upstream dts with this configuration, but maybe there 
> is some out-of-tree dts which would be affected.
> As far as I understand, we should avoid that.
> 

If I can rephrase myself, is my understanding correct ? Do we care about 
breaking out-of-tree dts ?

-- 
Miguel Gazquez, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

