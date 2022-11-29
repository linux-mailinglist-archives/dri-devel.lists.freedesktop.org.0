Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC53163BF46
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 12:46:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B9C010E3BC;
	Tue, 29 Nov 2022 11:46:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8744710E3BC
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 11:46:03 +0000 (UTC)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi
 [91.154.32.225])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6EF437F8;
 Tue, 29 Nov 2022 12:46:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1669722362;
 bh=Ovz0LB8la76yzk7QtN0fJ3MeKeUVniHAK4oNq/JmhdU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=cLGhsYUKh9UxJ+SJCJ77f75GAT+BO/2VeNTJDLA6jN0v0YKY0s6duz4qL0jE4gETV
 legWS57dkl03uxvEbeD/Ctk3fty413sM5R65EsIBYcpaLrbWxM6+7zffRmfvHHs87O
 vSovZANSTSvoqL5M2HILleRXIVk472OCzyI5f4eA=
Message-ID: <34c2e9c8-9e3d-129c-8295-18ff440f1f84@ideasonboard.com>
Date: Tue, 29 Nov 2022 13:45:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: Fix output polarity setting bug
Content-Language: en-US
To: Doug Anderson <dianders@chromium.org>,
 Qiqi Zhang <eddy.zhang@rock-chips.com>
References: <20221125104558.84616-1-eddy.zhang@rock-chips.com>
 <CAD=FV=XAU8qQ1tFV9_4FF9Rd7ouT5ORzt6JUnQ4KqJgRsEXqHw@mail.gmail.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <CAD=FV=XAU8qQ1tFV9_4FF9Rd7ouT5ORzt6JUnQ4KqJgRsEXqHw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: neil.armstrong@linaro.org, jonas@kwiboo.se, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, jernej.skrabec@gmail.com, robert.foss@linaro.org,
 andrzej.hajda@intel.com, Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29/11/2022 03:13, Doug Anderson wrote:
> Hi,
> 
> On Fri, Nov 25, 2022 at 2:54 AM Qiqi Zhang <eddy.zhang@rock-chips.com> wrote:
>>
>> According to the description in ti-sn65dsi86's datasheet:
>>
>> CHA_HSYNC_POLARITY:
>> 0 = Active High Pulse. Synchronization signal is high for the sync
>> pulse width. (default)
>> 1 = Active Low Pulse. Synchronization signal is low for the sync
>> pulse width.
>>
>> CHA_VSYNC_POLARITY:
>> 0 = Active High Pulse. Synchronization signal is high for the sync
>> pulse width. (Default)
>> 1 = Active Low Pulse. Synchronization signal is low for the sync
>> pulse width.
>>
>> We should only set these bits when the polarity is negative.
>> Signed-off-by: Qiqi Zhang <eddy.zhang@rock-chips.com>
>> ---
>>   drivers/gpu/drm/bridge/ti-sn65dsi86.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
>> index 3c3561942eb6..eb24322df721 100644
>> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
>> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
>> @@ -931,9 +931,9 @@ static void ti_sn_bridge_set_video_timings(struct ti_sn65dsi86 *pdata)
>>                  &pdata->bridge.encoder->crtc->state->adjusted_mode;
>>          u8 hsync_polarity = 0, vsync_polarity = 0;
>>
>> -       if (mode->flags & DRM_MODE_FLAG_PHSYNC)
>> +       if (mode->flags & DRM_MODE_FLAG_NHSYNC)
>>                  hsync_polarity = CHA_HSYNC_POLARITY;
>> -       if (mode->flags & DRM_MODE_FLAG_PVSYNC)
>> +       if (mode->flags & DRM_MODE_FLAG_NVSYNC)
>>                  vsync_polarity = CHA_VSYNC_POLARITY;
> 
> Looks right to me.
> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> 
> I've never seen the polarity matter for any eDP panels I've worked
> with, which presumably explains why this was wrong for so long. As far

Afaik, DP doesn't have sync polarity as such (neither does DSI), and the 
sync polarity is just "metadata". So if you're in full-DP domain, I 
don't see why it would matter. I guess it becomes relevant when you 
convert from DP to some other bus format.

> as I can tell, it's been wrong since the start. Probably you should
> have:
> 
> Fixes: a095f15c00e2 ("drm/bridge: add support for sn65dsi86 bridge driver")
> 
> I put this on a sc7180-trogdor-lazor device and it didn't make
> anything worse. Since the sync polarity never mattered to begin with,
> I guess this isn't a surprise. ...so I guess that's a weak tested-by:
> 
> Tested-by: Douglas Anderson <dianders@chromium.org>
> 
> I'm happy to land this patch, but sounds like we're hoping to get
> extra testing so I'll hold off for now.

Looks fine to me and works for me with my DP monitor.

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi

