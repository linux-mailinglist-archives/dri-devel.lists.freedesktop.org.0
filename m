Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3DDEBBE81B
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 17:37:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1D6A10E318;
	Mon,  6 Oct 2025 15:37:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="Fe/cNu0r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 426 seconds by postgrey-1.36 at gabe;
 Mon, 06 Oct 2025 15:37:33 UTC
Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com
 [91.218.175.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C962010E318
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Oct 2025 15:37:33 +0000 (UTC)
Message-ID: <ff21cbd1-dc77-43ae-85a8-dc6a56a1cefa@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1759764625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nXyoKN4j7tjDil/ht3RE4A/98xpfn+XOg18nSC63YxI=;
 b=Fe/cNu0rr623OU3+9Ti9ilVTCZn9uAu/4R9seUwKi1wiqTULHwiFAtmOQfNqBi/s98yzjN
 GERZwA4JTt8odBfVuDE6VeHz2PmiluWbhv/obSptS1gcMUx/ZcQ3Us/dAVtmGn5r5OyVHg
 0z4dog6KEnfJc3NI3xAgiS/dd3DYNyA=
Date: Mon, 6 Oct 2025 16:30:19 +0100
MIME-Version: 1.0
Subject: Re: [PATCH v13 3/4] drm/atomic-helper: Re-order bridge chain
 pre-enable and post-disable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
To: Vicente Bergas <vicencb@gmail.com>
Cc: Laurent.pinchart@ideasonboard.com, airlied@gmail.com,
 alexander.sverdlin@siemens.com, andrzej.hajda@intel.com, devarsht@ti.com,
 dri-devel <dri-devel@lists.freedesktop.org>, jernej.skrabec@gmail.com,
 Jonas Karlman <jonas@kwiboo.se>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, lumag@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 neil.armstrong@linaro.org, nm@ti.com, rfoss@kernel.org, simona@ffwll.ch,
 tomi.valkeinen@ideasonboard.com, tzimmermann@suse.de, vigneshr@ti.com,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Douglas Anderson <dianders@chromium.org>,
 Damon Ding <damon.ding@rock-chips.com>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Linux Rockchip Support List <linux-rockchip@lists.infradead.org>,
 Devarsh Thakkar <devarsht@ti.com>
References: <CAAMcf8BfxMJx+5ttEXx0kONP2OYWSLFqEYF6rfVBKoRg5TKZzQ@mail.gmail.com>
 <bea50d14-2311-46ad-bb30-9d60a4c5e3a2@linux.dev>
Content-Language: en-US
In-Reply-To: <bea50d14-2311-46ad-bb30-9d60a4c5e3a2@linux.dev>
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

+rockchip maintainers

Hi Vicente, all,


I went through the drivers and the affected areas in the gru-kevin
chromebook pipeline last week, but nothing has stood out.


Pipeline:

rockchip,display-subsystem / rk3399-vop (Big/Lite) (CRTC) ->
rk3399-edp (Encoder) -> analogix_dp_core (Bridge) ->
sharp,lq123p (edp-panel)

I am unable to debug this further since I do not have the hardware.

I could use some help, especially from folks who understand the hardware
requirements better.


On 11/09/25 09:01, Aradhya Bhatia wrote:
> Hi Vicente,
> 
> Thank you for the bisection and reporting the issue.
> 
> On 10/09/25 16:17, Vicente Bergas wrote:
>> Hi,
>> this patch causes a regression. It has been reported in
>> https://bugzilla.kernel.org/show_bug.cgi?id=220554
>>
>> It affects the gru/kevin platform (arm64,RK3399) with the Panfrost DRM driver.
> 
> I believe the Panfrost DRM driver may only be for the GPU.
> 
> Based on the dts files in arm64/rockchip/, this is the pipeline of the
> gru-kevin setup that I understand.
> 
> 	rk3399-vop (Big/Lite) -> rk3399-edp -> sharp,lq123p (edp-panel)
> 
> The setup seems to be using the drm/rockchip drivers for the display
> controller and for the bridge.
> 
>>
>> When it boots in console mode, the blinking of the cursor keeps the display on.
>> If it is turned off via /sys/class/graphics/fbcon/cursor_blink, then
>> the display briefly shows each key press presented on screen for less
>> than one second and then powers off.
>>
>> When starting the graphical mode (wayland), if there are no
>> applications drawing on the screen, the only way to keep the display
>> on is by continuously moving the mouse.
>>
> 
> Okay!
> 
> I will have a look through the drivers. In the meanwhile, please do
> report back if you find any other observations.
> 
> 

-- 
Regards
Aradhya

