Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F88C55AB53
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jun 2022 17:36:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C082214A425;
	Sat, 25 Jun 2022 15:36:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27D3814A425
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jun 2022 15:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656171401;
 bh=yHSGyILwZVObpSffYaxFoiSNbweHuDe0tBxMr2X51ZQ=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=BHkYv+uxkRmw2O73gs6ydvHNjKVM5A8qRA521IeahQusQKQ3jP1ZpACY8Vd40BioG
 r6njMIP/yzqkBp81peUxRvMeQhi53Hr927QTQ+33F/QfsHcLLu+ithhZGUqjtmvWKK
 WjCl8tVs9GTjUz5WWLP3LFHMLo+UDwiCYmYZLOXc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.162.44]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MN5iZ-1oLQCa2tIT-00J4d8; Sat, 25
 Jun 2022 17:36:41 +0200
Message-ID: <607ba7e2-c827-bd40-d635-5216c9874c3a@gmx.de>
Date: Sat, 25 Jun 2022 17:36:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 3/4] fbmem: Fix input parameter checks for
 user-provided screen resolution changes
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>
References: <20220625122502.68095-1-deller@gmx.de>
 <20220625122502.68095-4-deller@gmx.de> <YrcGCkHuWHv3I6Fx@phenom.ffwll.local>
 <YrcG80jK2e44LCtb@phenom.ffwll.local>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <YrcG80jK2e44LCtb@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Dps29rPore0+TrXaFuO45Jj77Ahy1tyTaUms0TXYZ5LV2E0RSX7
 NroYL3+pbGMJq0h4w7K4pz+HRLsJv2Zf8aRDBCRAiWoMD/+bIX+2suw+e8aIrBXJpo/iw/L
 NDPMO9u9aEYELmUwybgatwmYajMEUUglKr3wGqaiVaMapZHQhYUkZeE4/3Aw+a1mqHtoZlf
 aaJ0Qj2RcKt51Ulm+tAAQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:SCZbAOuLuuI=:tqTyFGoIODoOqpJy7stT0W
 VJAUVQG2Rfg0COoyxsKbXqKjyqcyo3LnAPJ0x88NAkvyYUZd9H7O3+uvXop85Xd2pN3twK4Fn
 IMv9JBZVLLlYdfF9wa6ORLjeP/1UYFHLbJXCgRlm+iIRU975/4eM2FZdm+eq2N7WRLBHoyEa/
 vHdnx5VpnMlT+IX6DZC2Ony9RLt2cbMj8/ChKs7aI591U85FjW2KGE9MmQDFNVrlKEUZZT/sS
 Mz+XAeX64g1VO+SZcjlA3Qwab/MaAigdcJqfbFUeaBLTw2ieqnrG/qd58S4zh6Iij8qd46ULk
 qnNCis67RbNoB+Re9/Jr3mpljjNIxUMu/mXdrYVHAWtQPAxD87BxBAdAkllFgsxTJb9ZLrE8d
 yOPghyOBg3KX6V4nAKZobraMduEVGZC6vFmDv/DuIqs69HLhrYnN2imWSGOAf4e42CzY4oo/a
 0a7vlqvYrlJY5pf8MmDTgd6oS9+ZL+e0gBHrphaiYfVE2dJEHjpDYOtRZ0oU2Xj6DvfatEg0A
 iOKkGNVM0IGq6XnGuIOJIDK0Djsm+WRaIEGHeO85CAOMnXdgGdXB4aj3eJLJyiWFjX5Yd2V9l
 22QC00Hg1190lCAuof/e4CSurqSTEGEbkxcsWyQYbCZ7vnqTNe9uZmcPzVmp87gyHc3SHG8is
 XHzZyRh/GFtmUhUQ1FRPY5uSXj2yJj5OfS5oD0ShaJqkDI8sr4GKxTWaIJvVCmXuFTh3RuXtX
 Ywo0Tk4vO9gQtqv1ACWj3qtUQoCzliO3DRzk2C0kzzTldbPJYv1nEAgqcd/uMdpTYmXTKwhdX
 GAGRDgWTVvO0qDIvAKuSfwkJzLQlnVOTGNYonE1JYh/aYUCQI+hYAeyTdq510j82ymznZOQiV
 wpDPVH0sNIlC5jP7+oEZiw3gKtob6DXekaFIJ1bljauSi9izZh0DSUjAcG8MeiY3R1ryx1sJJ
 dtd+AJBckzkndHDtjPuSVWCx8r3LoVkzJ1c/g1MwUPWykeeVlJ6SbZ7OzNOuXEhZ/+ynTPE5w
 StQZta2G0bnzr+AntxjSp43d0XvE/5oYhrxeB/l4BumXy1TxViSQlECsFWWgtsufrUZxAkzw7
 2+fBwhJhWs8PwiMaAKC96fLV9BQrHYxEZAkSDlWnWtWaQsQuQ0fR1yQUA==
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
Cc: daniel.vetter@ffwll.ch, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/25/22 15:00, Daniel Vetter wrote:
> On Sat, Jun 25, 2022 at 02:56:42PM +0200, Daniel Vetter wrote:
>> On Sat, Jun 25, 2022 at 02:25:01PM +0200, Helge Deller wrote:
>>> Enhance the checks in the FBIOPUT_VSCREENINFO ioctl handler to verify
>>> the user-provided new screen size for:
>>>
>>> a) virtual screen size >=3D physical screen size, and
>>>
>>> b) new screen size is bigger than currently configured console font si=
ze.
>>>
>>> Return -EINVAL on invalid input.
>>>
>>> Signed-off-by: Helge Deller <deller@gmx.de>
>>> Cc: stable@vger.kernel.org # v5.4+
>>
>> Imo squash this into the previous one please. Doesn't make sense to spl=
it
>> the patch which adds a function from it's callsite.
>
> Correction. The part to add the fbcon_modechange_possible call should be
> squashed into the previos patch.

Ok... based on my last mail, I then suggest to split that part out as anot=
her
follow-up patch. :-)

> The check for x/yres_virtaul < x/yres should imo be moved into fb_set_va=
r,
> next to the other existing checks that have been added over time.

That was exactly the way I had coded it in the first round.
But you then suggested to move it to the ioctl code path...

I can easily change it back accordingly, but then we need to drop the
WARN_ON() [which means to drop PATCH 4] because otherwise you possibly
trigger the WARN_ON() if the user calls with wrong input values.
So, insted of
        if (WARN_ON(var->xres_virtual < var->xres)) ...
it will become:
        if (var->xres_virtual < var->xres) ...

I'll leave it up to you to decide...

Helge


> -Daniel
>
>> -Daniel
>>
>>> ---
>>>  drivers/video/fbdev/core/fbmem.c | 8 +++++++-
>>>  1 file changed, 7 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/co=
re/fbmem.c
>>> index afa2863670f3..50fb66b954d6 100644
>>> --- a/drivers/video/fbdev/core/fbmem.c
>>> +++ b/drivers/video/fbdev/core/fbmem.c
>>> @@ -1106,7 +1106,13 @@ static long do_fb_ioctl(struct fb_info *info, u=
nsigned int cmd,
>>>  			return -EFAULT;
>>>  		console_lock();
>>>  		lock_fb_info(info);
>>> -		ret =3D fb_set_var(info, &var);
>>> +		if (var.xres_virtual < var.xres ||
>>> +		    var.yres_virtual < var.yres)
>>> +			ret =3D -EINVAL;
>>> +		if (!ret)
>>> +			ret =3D fbcon_modechange_possible(info, &var);
>>> +		if (!ret)
>>> +			ret =3D fb_set_var(info, &var);
>>>  		if (!ret)
>>>  			fbcon_update_vcs(info, var.activate & FB_ACTIVATE_ALL);
>>>  		unlock_fb_info(info);
>>> --
>>> 2.35.3
>>>
>>
>> --
>> Daniel Vetter
>> Software Engineer, Intel Corporation
>> http://blog.ffwll.ch
>

