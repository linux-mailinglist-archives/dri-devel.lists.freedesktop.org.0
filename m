Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2811E59F0
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 09:56:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E5F26E4B3;
	Thu, 28 May 2020 07:56:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 273C16E46C
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 07:56:39 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 1516A5C21A9;
 Thu, 28 May 2020 09:56:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
 t=1590652596;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0m6DCkNJigFgdctZfTg4koHIN9qilDIV5zyAFu7UANk=;
 b=ZxUC8YSj8HosGbCCpwbO9vKJo/LuRKMai4rWEYhA2TIcIKaYfttOrkk4WXUT4E7TaYIVBl
 l5h/MdScKX6wPyPh+5r8IFvmYuEHm1pb8m5YwLZTC9JA0Bete8H9e6pTT1lmHZcccDSFWA
 cmBT8G5iQfcAXCwl6QKlzjfhK+0DvR4=
MIME-Version: 1.0
Date: Thu, 28 May 2020 09:56:36 +0200
From: Stefan Agner <stefan@agner.ch>
To: Daniel Vetter <daniel@ffwll.ch>, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH 1/2] drm/mxsfb: Call drm_crtc_vblank_on/off
In-Reply-To: <20200528054643.GQ206103@phenom.ffwll.local>
References: <20200527094757.1414174-1-daniel.vetter@ffwll.ch>
 <20200528054643.GQ206103@phenom.ffwll.local>
User-Agent: Roundcube Webmail/1.4.1
Message-ID: <7911368105b92200b661f0fed39f5642@agner.ch>
X-Sender: stefan@agner.ch
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
Cc: Marek Vasut <marex@denx.de>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

On 2020-05-28 07:46, Daniel Vetter wrote:
> On Wed, May 27, 2020 at 11:47:56AM +0200, Daniel Vetter wrote:
>> mxsfb has vblank support, is atomic, but doesn't call
>> drm_crtc_vblank_on/off as it should. Not good.
>>
>> With my next patch to add the drm_crtc_vblank_reset to helpers this
>> means not even the very first crtc enabling will vblanks work anymore,
>> since they'll just stay off forever.
>>
>> Since mxsfb doesn't have any vblank waits of its own in the
>> enable/disable flow, nor an enable/disable_vblank callback we can do
>> the on/off as the first respectively last operation, and it should all
>> work.
>>
>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>> Cc: Marek Vasut <marex@denx.de>
>> Cc: Stefan Agner <stefan@agner.ch>
>> Cc: Shawn Guo <shawnguo@kernel.org>
>> Cc: Sascha Hauer <s.hauer@pengutronix.de>
>> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
>> Cc: Fabio Estevam <festevam@gmail.com>
>> Cc: NXP Linux Team <linux-imx@nxp.com>
>> Cc: linux-arm-kernel@lists.infradead.org
> 
> Ping for some ack/review on this one here, it's holding up the subsystem
> wide fix in patch 2.

Sorry for the delay.

I guess that has the same effect as patch 14 in Laurent's patchset would
have:
https://lore.kernel.org/dri-devel/20200309195216.31042-15-laurent.pinchart@ideasonboard.com/

But should be rather trivial to rebase. So until Laurent's patchset is
ready, we can go with this fix.

Acked-by: Stefan Agner <stefan@agner.ch>

--
Stefan

> 
> Thanks, Daniel
> 
>> ---
>>  drivers/gpu/drm/mxsfb/mxsfb_drv.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
>> index 497cf443a9af..1891cd6deb2f 100644
>> --- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
>> +++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
>> @@ -124,6 +124,7 @@ static void mxsfb_pipe_enable(struct drm_simple_display_pipe *pipe,
>>  	drm_panel_prepare(mxsfb->panel);
>>  	mxsfb_crtc_enable(mxsfb);
>>  	drm_panel_enable(mxsfb->panel);
>> +	drm_crtc_vblank_on(&pipe->crtc);
>>  }
>>
>>  static void mxsfb_pipe_disable(struct drm_simple_display_pipe *pipe)
>> @@ -133,6 +134,7 @@ static void mxsfb_pipe_disable(struct drm_simple_display_pipe *pipe)
>>  	struct drm_crtc *crtc = &pipe->crtc;
>>  	struct drm_pending_vblank_event *event;
>>
>> +	drm_crtc_vblank_off(&pipe->crtc);
>>  	drm_panel_disable(mxsfb->panel);
>>  	mxsfb_crtc_disable(mxsfb);
>>  	drm_panel_unprepare(mxsfb->panel);
>> --
>> 2.26.2
>>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
