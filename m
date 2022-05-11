Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 715B45237A7
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 17:47:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6D3410E8A3;
	Wed, 11 May 2022 15:47:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF35A10E8A3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 15:47:34 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id F0AC483EF0;
 Wed, 11 May 2022 17:47:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1652284052;
 bh=Eh242WRSKjD1gqKHRyGafEummwbuzGrJvF36ikqwlDA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=tO/VkOf01pnltk3jraNB3WOgRxxTUZbdfEVR7O14oRiR60YPCupwOuhkHcO5ewkb3
 6F0lWPsqVlC70HONE5Lp3uhSbgoI/FNH15FCMWNKRU3z4BQGZ3b5Paho4jzMg8QSz3
 ocEAVMs79nM8A8KwwHGcoBbEeRUIIZtDvNPSUovk6DFIa38TEEoU7mL8WvSsCgW4mf
 DPCsPi4h5MRQX2OEJbRUhuZYXfzJntmNp4QKxfXPqP1TtnWgaC1ij9361iSkGBt8aJ
 +Udem8HrlCWw73/ktQm8k71ZZpMKZTnt7/9X3obgyFdrAznyJeslDLRMrNLtvOGYg5
 59+4kbdE/2zgg==
Message-ID: <c94fceb7-20d6-b7e4-a8cd-6a2f459990d6@denx.de>
Date: Wed, 11 May 2022 17:47:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH V2 0/3] DSI host and peripheral initialisation ordering
Content-Language: en-US
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <cover.1646406653.git.dave.stevenson@raspberrypi.com>
 <CAPY8ntC-2Yij+a5wWEZ3BRBSh7bz+74coHCoB01ZhY550H+BDg@mail.gmail.com>
 <CGME20220405114402eucas1p1d139ce6825a481d1318f013cf27a5fe7@eucas1p1.samsung.com>
 <CAPY8ntAi1tM7BZEpKkMAasRH3R_+tJCUFY7k-yVBdtogvxQNRA@mail.gmail.com>
 <e96197f9-948a-997e-5453-9f9d179b5f5a@samsung.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <e96197f9-948a-997e-5453-9f9d179b5f5a@samsung.com>
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
Cc: Jagan Teki <jagan@amarulasolutions.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Raphael GALLAIS-POU - foss <raphael.gallais-pou@foss.st.com>,
 Jonas Karlman <jonas@kwiboo.se>, Douglas Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Andrzej Hajda <andrzej.hajda@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/11/22 16:58, Marek Szyprowski wrote:
> Hi Dave,
> 
> On 05.04.2022 13:43, Dave Stevenson wrote:
>> On Fri, 18 Mar 2022 at 12:25, Dave Stevenson
>> <dave.stevenson@raspberrypi.com>  wrote:
>>> On Fri, 4 Mar 2022 at 15:18, Dave Stevenson
>>> <dave.stevenson@raspberrypi.com>  wrote:
>>>> Hi All
>>> A gentle ping on this series. Any comments on the approach?
>>> Thanks.
>> I realise the merge window has just closed and therefore folks have
>> been busy, but no responses on this after a month?
>>
>> Do I give up and submit a patch to document that DSI is broken and no one cares?
> 
> Thanks for pointing this patchset in the 'drm: bridge: Add Samsung MIPI
> DSIM bridge' thread, otherwise I would miss it since I'm not involved
> much in the DRM development.
> 
> This resolves most of the issues in the Exynos DSI and its recent
> conversion to the drm bridge framework. I've added the needed
> prepare_upstream_first flags to the panels and everything works fine
> without the bridge chain order hacks.
> 
> Feel free to add:
> 
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> 
> 
> The only remaining thing to resolve is the moment of enabling DSI host.
> The proper sequence is:
> 
> 1. host power on, 2. device power on, 3. host init, 4. device init, 5.
> video enable.

+CC Raphael, STM32MP1 has similar topic.

> #1 is done in dsi's pre_enable, #2 is done in panel's prepare. #3 was so
> far done in the first host transfer call, which usually happens in
> panel's prepare, then the #4 happens. Then video enable is done in the
> enable callbacks.
> 
> Jagan wants to move it to the dsi host pre_enable() to let it work with
> DSI bridges controlled over different interfaces
> (https://lore.kernel.org/all/20220504114021.33265-6-jagan@amarulasolutions.com/
> ). This however fails on Exynos with DSI panels, because when dsi's
> pre_enable is called, the dsi device is not yet powered. I've discussed
> this with Andrzej Hajda and we came to the conclusion that this can be
> resolved by adding the init() callback to the struct mipi_dsi_host_ops.
> Then DSI client (next bridge or panel) would call it after powering self
> on, but before sending any DSI commands in its pre_enable/prepare functions.
> 
> I've prepared a prototype of such solution. This approach finally
> resolved all the initialization issues! The bridge chain finally matches
> the hardware, no hack are needed, and everything is controlled by the
> DRM core. This prototype also includes the Jagan's patches, which add
> IMX support to Samsung DSIM. If one is interested, here is my git repo
> with all the PoC patches:
> 
> https://github.com/mszyprow/linux/tree/v5.18-next-20220511-dsi-rework

Can you CC me on the iMX DSIM discussion/patches ? It seems I was left 
out of it all, even though I work with the iMX8M DRM stuff extensively.
