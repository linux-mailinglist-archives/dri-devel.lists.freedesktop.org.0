Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8D8B9FAB8
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 15:53:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 433F010E2BE;
	Thu, 25 Sep 2025 13:53:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="Z2jnGeKn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 824C210E2BE
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 13:53:13 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cXZtG1Czxz9sbX;
 Thu, 25 Sep 2025 15:53:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1758808390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FAUWvNEGwTrS1d/ZAgvY+yoUNM0DnzZllEjx/sqMi0I=;
 b=Z2jnGeKnHpoLB783jGuiZdmFUwvC0RLzDnmkQ2Nf8tBGI9iLF/DrDgZb8t20wVc5gS2m9c
 86tn21hJjeXQ2eAXRa4WSKU7Q5hIQLt8icpxL51aYbbF1hEhQtrIMF3oQ5gDQjjbCA4PF9
 5s+tdAJOJ4ImZ0IHx5XsbRgpBTEEXT1X23RqQSMdGlPXauTP2tBncS17lNpRJyugqUv/HP
 UjUU/Ggpg1AcPqv7UrHhVDG/IaUU5QBa+jlVh9d665w/9CuyHdqNTDcuwsaRdDx4xvJ7ya
 x5mzUL5GUmjA0gh+asUaN2JFi+sIEWFRLy+bPoaFT8uQLiHA+uZ0dteG45wH0g==
Message-ID: <5cac35a3-80f4-43ab-b8f8-7b9217740083@mailbox.org>
Date: Thu, 25 Sep 2025 15:53:05 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] drm/panel: sitronix-st7789v: fix sync flags for
 t28cp45tn89
To: Sebastian Reichel <sre@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Michael Riesch <michael.riesch@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
References: <20250924-t28cp45tn89-fix-v1-1-8e8f52239c84@collabora.com>
 <6e50e9fb-10f5-48e6-bc04-ec66ca90a626@mailbox.org>
 <hktw42pbb4rk3azapasigphhlbndkh5pmcm6fucdvk3ukoiull@dpoh7amjyymh>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <hktw42pbb4rk3azapasigphhlbndkh5pmcm6fucdvk3ukoiull@dpoh7amjyymh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: fjoy1ce7tsnn91b7e78dp3d8fjm3z3jg
X-MBO-RS-ID: 0adee058fcd22b63828
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

On 9/25/25 2:48 PM, Sebastian Reichel wrote:

Hello Sebastian,

> On Thu, Sep 25, 2025 at 02:15:41AM +0200, Marek Vasut wrote:
>> On 9/24/25 11:46 PM, Sebastian Reichel wrote:
>>> From: Sebastian Reichel <sebastian.reichel@collabora.com>
>>>
>>> I planned to set the polarity of horizontal and vertical sync, but
>>> accidentally described vertical sync twice with different polarity
>>> instead.
>>>
>>> Note, that there is no functional change, because the driver only
>>> makes use of DRM_MODE_FLAG_P[HV]SYNC to divert from the default
>>> active-low polarity.
>>>
>>> Reported-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>>> Closes: https://lore.kernel.org/all/20250923132616.GH20765@pendragon.ideasonboard.com/
>>> Fixes: a411558cc143 ("drm/panel: sitronix-st7789v: add Inanbo T28CP45TN89 support")
>>> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
>>> ---
>>>    drivers/gpu/drm/panel/panel-sitronix-st7789v.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
>>> index 04d91929eedda092b966b8cffdef5b267748f190..dedf0a390a88dd45a8179e2d22e872128c87cfda 100644
>>> --- a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
>>> +++ b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
>>> @@ -261,7 +261,7 @@ static const struct drm_display_mode t28cp45tn89_mode = {
>>>    	.vtotal = 320 + 8 + 4 + 4,
>>>    	.width_mm = 43,
>>>    	.height_mm = 57,
>>> -	.flags = DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_NVSYNC,
>>> +	.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_PVSYNC,
>> Is this panel somehow special with its NHSYNC / PVSYNC , compared to the
>> other supported panels, which all use PHSYNC / PVSYNC ? I would expect all
>> of these DSI TCON to use the same polarity, how come this one needs NHSYNC ?
> 
> I wrote this based on reverse engineering incl. quite a bit try-and-error and
> don't have very good data about the panel. Using DRM_MODE_FLAG_PHSYNC like all
> the other panels results in garbage data on the display.
Interesting.

Can you please add that information as a code comment in V2 and also add 
to V2 my

Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thank you
