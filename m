Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 313B09B350E
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 16:38:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 317F910E4F7;
	Mon, 28 Oct 2024 15:38:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="aB0OraB1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D76B610E4FC
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 15:38:42 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id C380688D06;
 Mon, 28 Oct 2024 16:38:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1730129921;
 bh=6XbJkeIa3iLwKBXFzr8b4G+oAY5+6vfUzf/eFUGme14=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=aB0OraB1C39n7VIdst2KqQvnjeHhYTqCLt09iV2LL5wePYEt2/SujwSqCJd2MQio0
 bcseKVq/zkxFocl9Y7wzaOz4gU97bVEELRCU+VVnpZ+XjZBMehQcszJmqRBkleaISz
 V7DRvI1jJkxGP4jJRj6WJKi2bXO7HlMl4tSCkheaBqkZyI0S5EzMRoXDsXWyXxAWAL
 Yd90pn7oEPz3qKUxVLUyQVPJCVCv/9vnppDkY3n+IuLWq2hhXHRuyuO0lQ49WkgcO/
 4lZMBgqvlWhLQJ/h0XR9Lv3kdRc9L/6UYMGrGdeGE+JzuGLJEeFDUwH+eNlbRO83ui
 S9czEDYBpKimA==
Message-ID: <c9c5064e-e780-4bfe-b85d-7930df7a5443@denx.de>
Date: Mon, 28 Oct 2024 15:47:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm: bridge: ti-sn65dsi83: Add error recovery
 mechanism
To: Herve Codina <herve.codina@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Michael Walle <mwalle@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241024095539.1637280-1-herve.codina@bootlin.com>
 <20241024095539.1637280-3-herve.codina@bootlin.com>
 <78a09625-6bad-4fda-8ee5-92b8dd0de381@denx.de>
 <20241028090220.1fd803ff@bootlin.com>
 <16edb769-a608-4b6a-9391-a63a69df8c8d@denx.de>
 <20241028145259.5d520445@bootlin.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20241028145259.5d520445@bootlin.com>
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

On 10/28/24 2:52 PM, Herve Codina wrote:
> Hi Marek,

Hi,

>>> On Sat, 26 Oct 2024 00:53:51 +0200
>>> Marek Vasut <marex@denx.de> wrote:
>>>    
>>>> On 10/24/24 11:55 AM, Herve Codina wrote:
>>>>> In some cases observed during ESD tests, the TI SN65DSI83 cannot recover
>>>>> from errors by itself. A full restart of the bridge is needed in those
>>>>> cases to have the bridge output LVDS signals again.
>>>>
>>>> I have seen the bridge being flaky sometimes, do you have any more
>>>> details of what is going on when this irrecoverable error occurs ?
>>>
>>> The panel attached to the bridge goes and stays black. That's the behavior.
>>> A full reset brings the panel back displaying frames.
>> Is there some noticeable change in 0xe0/0xe1/0xe5 registers, esp. 0xe5,
>> do they indicate the error occurred somehow ?
> 
> 0xe5 register can signal any DSI errors (depending on when the ESD affects
> the DSI bus) even PLL unlock bit was observed set but we didn't see any
> relationship between the bits set in 0xe5 register and the recoverable or
> unrecoverable behavior.
> 
> Also, in some cases, reading the register was not even possible (i2c
> transaction nacked).
Oh, wow, I haven't seen that one before. But this is really useful 
information, can you please add it into the commit message for V2 ?

Thank you
