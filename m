Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6F08C43C0
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 17:07:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3713010E7FA;
	Mon, 13 May 2024 15:06:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="rgzf0fje";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3A9710E7FA
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 15:06:57 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 3E2A587E50;
 Mon, 13 May 2024 17:06:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1715612815;
 bh=+NchTC/lKdBIhbDu2L47JmCFrKaD8lp6R6zORDtJasA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=rgzf0fjekckrepCqpox0NeNod0Zy4ZkYK4rA0vW7I7ASzAGg2+g+fgfwDumEnqn6H
 aH7Te/m2ogQV406L9O9f3hr+TpGYGKWyZYv4b399AiSo02njHjZ+tJrz9tMfzr4CcC
 0j8ocyBIoYHAKmbftMOeptixi2nhBJS6IARSK8Rj9glMZ+S0rD+wB2xtX5JkDpD8Ri
 M2py9NiE8ewFAKa53Fo/fk1u6Nw3XWE1jYDCMtIG3s/HduBmvgxCkiJsZ2/OsLmqj6
 dSMGbKIFiwejgonLyw+5stsnBooayybK0eF75dmY5QfUcCxR8ZdkdILtbQyZow82p5
 l8cCdABPBPhGw==
Message-ID: <b6368650-4bbf-4f86-bdb1-817c7ddb0290@denx.de>
Date: Mon, 13 May 2024 16:55:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm: bridge: samsung-dsim: Initialize bridge on attach
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 dri-devel@lists.freedesktop.org
Cc: Adam Ford <aford173@gmail.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, kernel@dh-electronics.com
References: <CGME20240513021916eucas1p127a78946a07fa16a85e588a726ed9243@eucas1p1.samsung.com>
 <20240513021849.129136-1-marex@denx.de>
 <2283cbdf-e480-4d10-ab4e-d10dd772ef5d@samsung.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <2283cbdf-e480-4d10-ab4e-d10dd772ef5d@samsung.com>
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

On 5/13/24 9:57 AM, Marek Szyprowski wrote:
> 
> On 13.05.2024 04:16, Marek Vasut wrote:
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
> This patch breaks driver operation on Samsung TM2e board with S6E3HF2
> DSI panel. The initialization procedure is very fragile and it looks
> that the changes must be done very carefully. We discussed this many
> times when converting this driver from Exynos DSI to generic Samsung DSI
> used on IMX and other SoCs.

Clearly we need to find a way to support both use cases .

What options do we have ?

Does the panel require DSI lanes in some specific state when it is 
released from reset ?
