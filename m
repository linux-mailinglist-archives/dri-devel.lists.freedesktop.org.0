Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 010EC63D146
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 10:00:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 215F610E42E;
	Wed, 30 Nov 2022 09:00:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m11880.qiye.163.com (mail-m11880.qiye.163.com
 [115.236.118.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77C2310E28A
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 05:46:56 +0000 (UTC)
Received: from localhost.localdomain (unknown [103.29.142.67])
 by mail-m11880.qiye.163.com (Hmail) with ESMTPA id BB3AE202EB;
 Wed, 30 Nov 2022 13:46:44 +0800 (CST)
From: Qiqi Zhang <eddy.zhang@rock-chips.com>
To: tomi.valkeinen@ideasonboard.com,
	dianders@chromium.org
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: Fix output polarity setting bug
Date: Wed, 30 Nov 2022 13:45:51 +0800
Message-Id: <20221130054551.112944-1-eddy.zhang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <34c2e9c8-9e3d-129c-8295-18ff440f1f84@ideasonboard.com>
References: <34c2e9c8-9e3d-129c-8295-18ff440f1f84@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZHUlKVkhKTUodGB0fSBgfQlUTARMWGhIXJBQOD1
 lXWRgSC1lBWUpLSFVJQlVKT0lVTUxZV1kWGg8SFR0UWUFZT0tIVUpKS0hKQ1VKS0tVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MVE6ERw6Aj0tNBIJHQo9OAIQ
 GAEaFBhVSlVKTU1CTENMSUtNSk5CVTMWGhIXVR4fHwJVARMaFRw7CRQYEFYYExILCFUYFBZFWVdZ
 EgtZQVlKS0hVSUJVSk9JVU1MWVdZCAFZQU9MTE83Bg++
X-HM-Tid: 0a84c712bfdc2eb6kusnbb3ae202eb
X-Mailman-Approved-At: Wed, 30 Nov 2022 08:58:34 +0000
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
Cc: neil.armstrong@linaro.org, andrzej.hajda@intel.com, jonas@kwiboo.se,
 robert.foss@linaro.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, jernej.skrabec@gmail.com,
 Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

on Nov. 29, 2022, 11:45 a.m. Tomi wrote:
>On 29/11/2022 03:13, Doug Anderson wrote:
>> Hi,
>>
>> On Fri, Nov 25, 2022 at 2:54 AM Qiqi Zhang <eddy.zhang@rock-chips.com> wrote:
>>>
>>> According to the description in ti-sn65dsi86's datasheet:
>>>
>>> CHA_HSYNC_POLARITY:
>>> 0 = Active High Pulse. Synchronization signal is high for the sync
>>> pulse width. (default)
>>> 1 = Active Low Pulse. Synchronization signal is low for the sync
>>> pulse width.
>>>
>>> CHA_VSYNC_POLARITY:
>>> 0 = Active High Pulse. Synchronization signal is high for the sync
>>> pulse width. (Default)
>>> 1 = Active Low Pulse. Synchronization signal is low for the sync
>>> pulse width.
>>>
>>> We should only set these bits when the polarity is negative.
>>> Signed-off-by: Qiqi Zhang <eddy.zhang@rock-chips.com>
>>> ---
>>>   drivers/gpu/drm/bridge/ti-sn65dsi86.c | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
>>> index 3c3561942eb6..eb24322df721 100644
>>> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
>>> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
>>> @@ -931,9 +931,9 @@ static void ti_sn_bridge_set_video_timings(struct ti_sn65dsi86 *pdata)
>>>                  &pdata->bridge.encoder->crtc->state->adjusted_mode;
>>>          u8 hsync_polarity = 0, vsync_polarity = 0;
>>>
>>> -       if (mode->flags & DRM_MODE_FLAG_PHSYNC)
>>> +       if (mode->flags & DRM_MODE_FLAG_NHSYNC)
>>>                  hsync_polarity = CHA_HSYNC_POLARITY;
>>> -       if (mode->flags & DRM_MODE_FLAG_PVSYNC)
>>> +       if (mode->flags & DRM_MODE_FLAG_NVSYNC)
>>>                  vsync_polarity = CHA_VSYNC_POLARITY;
>>
>> Looks right to me.
>>
>> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>>
>> I've never seen the polarity matter for any eDP panels I've worked
>> with, which presumably explains why this was wrong for so long. As far
>
>Afaik, DP doesn't have sync polarity as such (neither does DSI), and the
>sync polarity is just "metadata". So if you're in full-DP domain, I
>don't see why it would matter. I guess it becomes relevant when you
>convert from DP to some other bus format.

Just like Tomi said, the wrong polarity worked fine on my eDP panel(LP079QX1)
and standard DP monitor, I didn't notice the polarity configuration problem
here until my customer used the following solution and got a abnormal display:
GPU->mipi->eDP->DP->lvds->panel.

>> as I can tell, it's been wrong since the start. Probably you should
>> have:
>>
>> Fixes: a095f15c00e2 ("drm/bridge: add support for sn65dsi86 bridge driver")

Doug you mean I need to update my commit message? It's my first time using
kernel list and I'm a little confused about this.

>>
>> I put this on a sc7180-trogdor-lazor device and it didn't make
>> anything worse. Since the sync polarity never mattered to begin with,
>> I guess this isn't a surprise. ...so I guess that's a weak tested-by:
>>
>> Tested-by: Douglas Anderson <dianders@chromium.org>
>>
>> I'm happy to land this patch, but sounds like we're hoping to get
>> extra testing so I'll hold off for now.
>
>Looks fine to me and works for me with my DP monitor.
>
>Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

-Eddy
