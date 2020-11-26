Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C882C52D7
	for <lists+dri-devel@lfdr.de>; Thu, 26 Nov 2020 12:21:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 989066E8BD;
	Thu, 26 Nov 2020 11:21:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 385 seconds by postgrey-1.36 at gabe;
 Thu, 26 Nov 2020 11:21:19 UTC
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7408F6E8BD
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Nov 2020 11:21:19 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id B613D5C220A;
 Thu, 26 Nov 2020 12:14:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
 t=1606389292;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XfUb7o2CWGb9TUNVKWRt4YCacLm3XdCUoSf5OBlT5VY=;
 b=bT1242Xq6nlGJncw2Dy41stuGBIje2qiUu4hawwr5v5DeoLHfaSiMfHoXo2DnNZFo/Wa+S
 +HHC6RpGi3xZ6tmfvR7JRJYhX37A4flNmkdqMq+wzc1jurTbqP/YdlmHZ93zGc4zfMcUUI
 lz7/TId3snDSOURU4WiWmXOo7awP66o=
MIME-Version: 1.0
Date: Thu, 26 Nov 2020 12:14:52 +0100
From: Stefan Agner <stefan@agner.ch>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH] drm: mxsfb: fix fence synchronization
In-Reply-To: <27cd40e629113290db88f38900d2eb4367490f49.camel@pengutronix.de>
References: <20201120211306.325841-1-l.stach@pengutronix.de>
 <27cd40e629113290db88f38900d2eb4367490f49.camel@pengutronix.de>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <4f882ad909549268c1cdb5f0d36b30be@agner.ch>
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
Cc: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, kernel@pengutronix.de,
 patchwork-lst@pengutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-11-26 11:18, Lucas Stach wrote:
> On Fr, 2020-11-20 at 22:13 +0100, Lucas Stach wrote:
>> The conversion away from the simple display pipeline helper missed
>> to convert the prepare_fb plane callback, so no fences are attached to
>> the atomic state, breaking synchronization with other devices. Fix
>> this by plugging in the drm_gem_fb_prepare_fb helper function.
> 
> This is a regression in the 5.10 release series, so I would appreciate
> if someone could review/ack this patch so I can smash it into
> drm-misc-fixes.

Reviewed-by: Stefan Agner <stefan@agner.ch>

I'll push it today.

--
Stefan

> 
> Regards,
> Lucas
> 
>> Fixes: ae1ed009328 (drm: mxsfb: Stop using DRM simple display pipeline helper)
>> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
>> ---
>>  drivers/gpu/drm/mxsfb/mxsfb_kms.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
>> index b721b8b262ce..4d556532281a 100644
>> --- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
>> +++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
>> @@ -22,6 +22,7 @@
>>  #include <drm/drm_fb_cma_helper.h>
>>  #include <drm/drm_fourcc.h>
>>  #include <drm/drm_gem_cma_helper.h>
>> +#include <drm/drm_gem_framebuffer_helper.h>
>>  #include <drm/drm_plane.h>
>>  #include <drm/drm_plane_helper.h>
>>  #include <drm/drm_vblank.h>
>> @@ -485,11 +486,13 @@ static void mxsfb_plane_overlay_atomic_update(struct drm_plane *plane,
>>  }
>>
>>  static const struct drm_plane_helper_funcs mxsfb_plane_primary_helper_funcs = {
>> +	.prepare_fb = drm_gem_fb_prepare_fb,
>>  	.atomic_check = mxsfb_plane_atomic_check,
>>  	.atomic_update = mxsfb_plane_primary_atomic_update,
>>  };
>>
>>  static const struct drm_plane_helper_funcs mxsfb_plane_overlay_helper_funcs = {
>> +	.prepare_fb = drm_gem_fb_prepare_fb,
>>  	.atomic_check = mxsfb_plane_atomic_check,
>>  	.atomic_update = mxsfb_plane_overlay_atomic_update,
>>  };
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
