Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A04A0BC79
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 16:47:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E93BF10E6E9;
	Mon, 13 Jan 2025 15:47:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="j+9TEcVx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 492 seconds by postgrey-1.36 at gabe;
 Mon, 13 Jan 2025 15:47:36 UTC
Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com
 [91.218.175.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FC9010E6E9
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 15:47:36 +0000 (UTC)
Message-ID: <79fc67a5-ac2a-48e2-b3ae-b96b6c29191e@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1736782760;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MGvG/Yi9xh4ppTUb/m1qTWmSdT6LKdkk3jorzGjjGzY=;
 b=j+9TEcVx84J/zKIt9w9O2gF4sn5QKSBovGoK/KBhmxnWvkcdxaBOu4uaM9n42gCvy7yWeq
 oqflZDPnK5bLx2qAi4ISXLe23ESuDR0qCmawWSK+ekFhlbXZXi6QmmXZHyaEJwBrnjA+wM
 /hSwkUtuPGB7/qi9s1apXFNZZbc/wRc=
Date: Mon, 13 Jan 2025 21:09:11 +0530
MIME-Version: 1.0
Subject: Re: [PATCH v6 03/12] drm/bridge: cdns-dsi: Fix phy de-init and flag
 it so
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Devarsh Thakkar <devarsht@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
 Udit Kumar <u-kumar1@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>
References: <20250111192738.308889-1-aradhya.bhatia@linux.dev>
 <20250111192738.308889-4-aradhya.bhatia@linux.dev>
 <dqmzdxhgnabfq6zzbd424ajfd734gza5aitmk5bfswff52d76r@2swxl627az3d>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
In-Reply-To: <dqmzdxhgnabfq6zzbd424ajfd734gza5aitmk5bfswff52d76r@2swxl627az3d>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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

Thank you for reviewing the patches, Dmitry.

On 1/13/25 15:10, Dmitry Baryshkov wrote:
> On Sun, Jan 12, 2025 at 12:57:29AM +0530, Aradhya Bhatia wrote:
>> From: Aradhya Bhatia <a-bhatia1@ti.com>
>>
>> The driver code doesn't have a de-initialization path as yet, and so it
>> does not clear the phy_initialized flag while suspending. This is a
>> problem because after resume the driver looks at this flag to determine
>> if a Phy re-initialization is required or not. It is in fact required
>> because the hardware is resuming from a suspend, but the driver does not
>> carry out any re-initialization causing the D-Phy to not work at all.
>>
>> Add the counterpart of phy_power_on(), that is phy_power_off() from the
>> _bridge_disable() and clear the flags so that the Phy can be initialized
>> again when required.
>>
>> Move the Phy initialization from _bridge_enable() to _resume(), and
>> de-initialize during the _suspend() - so that the phy_{init, exit}()
>> take place once every resume/suspend cycle.
> 
> Is it okay to call phy_init() before writing MCTL_DPHY_CFG0 ?

The phy_init() is a no-op when we look at the D-Phy driver, which does
not implement the _init() hook at all. So, in this case, all phy_init()
call ever manages to do is book-keeping. Book-keeping that isn't
required to be done every time we do a bridge enable/disable.

But despite the no-op nature of the call, I guess it would still not
make sense to call it before the reset assert done in MCTL_DPHY_CFG0.

Instead of moving it to resume(), I can keep phy_init() as is, and add
phy_exit() in the bridge disable path, instead of the suspend path.


Regards
Aradhya

> 
>>
>> The order of calls still remains the same. phy_init() needs to be called
>> before phy_power_on() - which happens still. What this patch changes is
>> the frequency of the phy_init() call. Instead of it being called once
>> every bridge enable/disable cycle, it is now being called once every
>> resume/suspend cycle. This move has been considered safe after numerous
>> tests with the hardware.
>>
>> Fixes: fced5a364dee ("drm/bridge: cdns: Convert to phy framework")
>> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
>> Signed-off-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
>> ---
>>  drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 10 ++++++++--
>>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
