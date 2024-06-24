Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29625914F27
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 15:51:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A67D10E44A;
	Mon, 24 Jun 2024 13:51:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="eZY9j/30";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8D0C10E44A
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 13:51:50 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 04E4588405;
 Mon, 24 Jun 2024 15:51:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1719237108;
 bh=VLtud6pTyV/LBm2oJMXCE9JZgDDVma/emrUfDonAicw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=eZY9j/30nf6ipDIqdRMgbFA9kyf/Dn0/PMI+vPGMcKyIxYNZd42LvOZo8Hx/iNzU3
 h1dxOIwEFYcdBFzGFTznrYH6nFgZRilNzRWZOUdz7Tc8c2LM+um+vP7JaEnoKU3c9G
 fh6ml+VlObwA/+jsTtxh89EyfUvwKRy/I7Q4Vrc4K+0EpMMjkEVNxYDowB29zPK1Lz
 yr4qt+rkI6VRafeq4VpBp6Q/7yShN5nQV1wqTj4WoDwhcqpDGfK066pDXeDofkWLZm
 1EUmlBCGfDQYNOwWV9/390TUYKtR8lfe6g0DQu5rfObFPF/Yq2yVahIyoF4zhT7SRY
 q/l/myxrZBSnA==
Message-ID: <1cafb9f4-ad2d-46a5-9bf4-8f699678ee85@denx.de>
Date: Mon, 24 Jun 2024 15:41:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [1/2] drm: bridge: samsung-dsim: Initialize bridge on attach
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org, Michael Walle <mwalle@kernel.org>
Cc: Adam Ford <aford173@gmail.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, kernel@dh-electronics.com
References: <20240513021849.129136-1-marex@denx.de>
 <2199187.Mh6RI2rZIc@steina-w>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <2199187.Mh6RI2rZIc@steina-w>
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

On 6/24/24 11:26 AM, Alexander Stein wrote:

Hello Alexander,

> Am Montag, 13. Mai 2024, 04:16:27 CEST schrieb Marek Vasut:
>> Initialize the bridge on attach already, to force lanes into LP11
>> state, since attach does trigger attach of downstream bridges which
>> may trigger (e)DP AUX channel mode read.
>>
>> This fixes a corner case where DSIM with TC9595 attached to it fails
>> to operate the DP AUX channel, because the TC9595 enters some debug
>> mode when it is released from reset without lanes in LP11 mode. By
>> ensuring the DSIM lanes are in LP11, the TC9595 (tc358767.c driver)
>> can be reset in its attach callback called from DSIM attach callback,
>> and recovered out of the debug mode just before TC9595 performs first
>> AUX channel access later in its attach callback.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
> 
> This does the trick on my hardware as well.
> Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Thank you. I still have to address your previous comment on 1/2, I 
didn't get to that one yet, sorry.

Also, I am not sure if this should be applied as-is, it is a borderline 
workaround and there was some discussion about fixing the LP11 lane mode 
switch properly. Michael ?
