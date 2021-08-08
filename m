Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CFF3E3CB2
	for <lists+dri-devel@lfdr.de>; Sun,  8 Aug 2021 22:23:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E735289A60;
	Sun,  8 Aug 2021 20:23:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp05.smtpout.orange.fr
 [80.12.242.127])
 by gabe.freedesktop.org (Postfix) with ESMTP id AC29189A60
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Aug 2021 20:22:59 +0000 (UTC)
Received: from [192.168.1.18] ([90.126.253.178]) by mwinf5d25 with ME
 id f8FT2500A3riaq2038FTyY; Sun, 08 Aug 2021 22:15:28 +0200
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 08 Aug 2021 22:15:28 +0200
X-ME-IP: 90.126.253.178
Subject: Re: [PATCH 3/8] drm/ingenic: Use standard
 drm_atomic_helper_commit_tail
To: Paul Cercueil <paul@crapouillou.net>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 "H . Nikolaus Schaller" <hns@goldelico.com>, Paul Boddie
 <paul@boddie.org.uk>, list@opendingux.net, Sam Ravnborg <sam@ravnborg.org>,
 linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20210808134526.119198-1-paul@crapouillou.net>
 <20210808134526.119198-4-paul@crapouillou.net>
 <f3b761ed-4e71-e8b8-f2b5-f4f7f1547fed@wanadoo.fr>
 <ENEJXQ.6TCYILUOPORD@crapouillou.net>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Message-ID: <0571e7f1-86b2-e673-6347-abf2d79da4c8@wanadoo.fr>
Date: Sun, 8 Aug 2021 22:15:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <ENEJXQ.6TCYILUOPORD@crapouillou.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

Le 08/08/2021 à 22:09, Paul Cercueil a écrit :
> Hi Christophe,
> 
> Le dim., août 8 2021 at 21:50:04 +0200, Christophe JAILLET 
> <christophe.jaillet@wanadoo.fr> a écrit :
>> Le 08/08/2021 à 15:45, Paul Cercueil a écrit :
>>> By making the CRTC's .vblank_enable() function return an error when it
>>> is known that the hardware won't deliver a VBLANK, we can drop the
>>> ingenic_drm_atomic_helper_commit_tail() function and use the standard
>>> drm_atomic_helper_commit_tail() function instead.
>>>
>>> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>> ---
>>>   drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 28 ++++-------------------
>>>   1 file changed, 4 insertions(+), 24 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c 
>>> b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>> index bc71ba44ccf4..3ed7c27a8dde 100644
>>> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>> @@ -706,29 +706,6 @@ static int 
>>> ingenic_drm_encoder_atomic_check(struct drm_encoder *encoder,
>>>       }
>>>   }
>>>   -static void ingenic_drm_atomic_helper_commit_tail(struct 
>>> drm_atomic_state *old_state)
>>> -{
>>> -    /*
>>> -     * Just your regular drm_atomic_helper_commit_tail(), but only 
>>> calls
>>> -     * drm_atomic_helper_wait_for_vblanks() if priv->no_vblank.
>>> -     */
>>> -    struct drm_device *dev = old_state->dev;
>>> -    struct ingenic_drm *priv = drm_device_get_priv(dev);
>>> -
>>> -    drm_atomic_helper_commit_modeset_disables(dev, old_state);
>>> -
>>> -    drm_atomic_helper_commit_planes(dev, old_state, 0);
>>> -
>>> -    drm_atomic_helper_commit_modeset_enables(dev, old_state);
>>> -
>>> -    drm_atomic_helper_commit_hw_done(old_state);
>>> -
>>> -    if (!priv->no_vblank)
>>> -        drm_atomic_helper_wait_for_vblanks(dev, old_state);
>>> -
>>> -    drm_atomic_helper_cleanup_planes(dev, old_state);
>>> -}
>>>
>>
>> Hi,
>> if this function is removed, shouldn't:
>>   static struct drm_mode_config_helper_funcs 
>> ingenic_drm_mode_config_helpers = {
>>       .atomic_commit_tail = ingenic_drm_atomic_helper_commit_tail,
>>   };
>> be updated as well?
>>
>> I've not seen it in the serie.
> 
> It is there though :) At the bottom of this very patch.
> 

My email client played me some tricks, apparently!
Sorry for the noise.

CJ

>> Just my 2v.
>> CJ
> 
> Cheers,
> -Paul
> 
> 
> 

