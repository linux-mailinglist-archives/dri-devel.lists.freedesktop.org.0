Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D56E8ABFA0
	for <lists+dri-devel@lfdr.de>; Sun, 21 Apr 2024 16:36:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35AE211249A;
	Sun, 21 Apr 2024 14:36:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="VnQuc3mi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4969E11249A
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Apr 2024 14:36:38 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 7166888276;
 Sun, 21 Apr 2024 16:36:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1713710197;
 bh=qN/AyrbP3w0CH/0SM3qG6WDHoGfkio3UiZLbi7y6Udc=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=VnQuc3miSCXSguOH/iRYdeYU0fsDvh4xLPXcewr4tSaojRZco3vySrGQnGtVameHV
 b94pYJPd7NaXk4l3npnPH765JZmXBZY1Vsk+3vT3d0XcvsvE6j1954A1bQleR8O3Ac
 YQK+yIn4rwMVy73fkJ/y13X9WXAXCtSaPUjDkcZekTQnvs6KO0/bGQLH1Pil+Vr5n4
 y/BSaAs3j2pb6IZvKhdcjbToTKA8tAoryxnD60vTDlt+LnVxk2auCJCcS1vZCrhzvc
 faUjIjAsYMv/WKRWHfxYfS/+3vqHh69l3MpPLqlY/Qr4JA18tiWfIddM6zmQmqM/FB
 /Hmi1kPgerL6w==
Message-ID: <4da75f3b-16a7-46f4-97d9-6f51a54fbe7e@denx.de>
Date: Sun, 21 Apr 2024 16:25:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH] drm: bridge: dw-mipi-dsi: Call modeset in modeset
 callback
To: =?UTF-8?Q?Ond=C5=99ej_Jirman?= <megi@xff.cz>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Douglas Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Liu Ying <victor.liu@nxp.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Robert Foss <rfoss@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
References: <20240421002330.172723-1-marex@denx.de>
 <t3dkuckbko5lmkfezhdtcwrynnbcs4yfn5mtmdyirnktellc5a@ktab3j6rvf3u>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <t3dkuckbko5lmkfezhdtcwrynnbcs4yfn5mtmdyirnktellc5a@ktab3j6rvf3u>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/21/24 1:09 PM, Ondřej Jirman wrote:
> Hi,

Hi,

> On Sun, Apr 21, 2024 at 02:22:35AM GMT, Marek Vasut wrote:
>> Doing modeset in .atomic_pre_enable callback instead of dedicated .mode_set
>> callback does not seem right. Undo this change, which was added as part of
> 
> Actually no. If anything, mode_set callback should be dropped entirely:
> 
> See https://elixir.bootlin.com/linux/latest/source/include/drm/drm_bridge.h#L231
> 
> It's deprecated, and enable callback should just use adjusted_mode:
> 
>      This is deprecated, do not use! New drivers shall set their mode in the
>      &drm_bridge_funcs.atomic_enable operation.

This mentions new drivers ?

>> commit 05aa61334592 ("drm: bridge: dw-mipi-dsi: Fix enable/disable of DSI
>> controller") as it breaks STM32MP15xx LTDC scanout (DSI)->TC358762 DSI-to-DPI
>> bridge->PT800480 DPI panel pipeline. The original fix for HX8394 panel likely
>> requires HX8394 panel side fix instead.
> 
> There's nothing wrong with the panel driver. And that commit is not fixing issue
> with the panel driver, just like the subject hints at. Look at the referenced
> commit, at "Before:" sequence specifically.
> 
> dw_mipi_dsi_mode_set may be named *_mode_set or whatever, but it's basically
> an enable function that turns on clocks, initalizes phy, etc. etc.
> 
> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c#L998
> 
> And if you check "Before:" sequence, you'll see that .mode_set callback is just
> called once at boot and never again. And it's atomic(_pre)_enable/atomic(_post)_disable
> callbacks that actually are called in ballanced way to enable/disable the
> controller repeatedly ever after.
> 
> Function dw_mipi_dsi_bridge_post_atomic_disable is the inverse of
> dw_mipi_dsi_mode_set, it undoes everything that dw_mipi_dsi_mode_set does.
> 
> You need to find root cause for your issue on STM32MP15xx instead of reverting
> fixes for resource use bugs in this driver.

Actually, reverting commit 05aa61334592 ("drm: bridge: dw-mipi-dsi: Fix 
enable/disable of DSI controller") makes the STM32MP15xx work again like 
it used to since Linux 5.10 or so, so that commit breaks existing 
working use case.

It seems it is sufficient to revert only this part of the commit to make 
the STM32MP15xx work as it used to, do you have any idea why ?
