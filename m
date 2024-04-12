Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A43B38A293B
	for <lists+dri-devel@lfdr.de>; Fri, 12 Apr 2024 10:23:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C3EB10F158;
	Fri, 12 Apr 2024 08:23:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="H1C1N0z3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="J/4paNim";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="H1C1N0z3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="J/4paNim";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 074B010F158
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Apr 2024 08:23:43 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 71DF138059;
 Fri, 12 Apr 2024 08:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1712910222; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ymYgNmBCgYwZuS6zxx41BA9umstrWSICuHfhrRkl404=;
 b=H1C1N0z3cS1I/s+1SPT+wNJeNbZifGbw8QsFbzbDDdfu4XUgFkPvplc+mMM/zumgdZg1td
 wpPHTKkTqK2wZV9JlRzYDSDwX45WMW5fHC4bNA/NY88EJSoZ/IsU3vrc3xj+dGqJw7NfUK
 MvdUHzGOzbGAgTvOsuLOySupjN25UCM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1712910222;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ymYgNmBCgYwZuS6zxx41BA9umstrWSICuHfhrRkl404=;
 b=J/4paNimpFv4Xd212vpQEMlU9CwPDGehDcgFhrohvgSsHEjpVWxRFX4ovjVZhrDDBuoY6p
 g+sk5wBi1OBgW7DQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1712910222; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ymYgNmBCgYwZuS6zxx41BA9umstrWSICuHfhrRkl404=;
 b=H1C1N0z3cS1I/s+1SPT+wNJeNbZifGbw8QsFbzbDDdfu4XUgFkPvplc+mMM/zumgdZg1td
 wpPHTKkTqK2wZV9JlRzYDSDwX45WMW5fHC4bNA/NY88EJSoZ/IsU3vrc3xj+dGqJw7NfUK
 MvdUHzGOzbGAgTvOsuLOySupjN25UCM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1712910222;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ymYgNmBCgYwZuS6zxx41BA9umstrWSICuHfhrRkl404=;
 b=J/4paNimpFv4Xd212vpQEMlU9CwPDGehDcgFhrohvgSsHEjpVWxRFX4ovjVZhrDDBuoY6p
 g+sk5wBi1OBgW7DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5464F1368B;
 Fri, 12 Apr 2024 08:23:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id He1OE47vGGZkfAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 12 Apr 2024 08:23:42 +0000
Message-ID: <84e29479-90eb-4813-a6a0-fe2dbc56d7e6@suse.de>
Date: Fri, 12 Apr 2024 10:23:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/gma500: Check power status before accessing lid data
 in opregion
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: dri-devel@lists.freedesktop.org, Enrico Bartky <enrico.bartky@gmail.com>
References: <20240412072409.27650-1-patrik.r.jakobsson@gmail.com>
 <0e57d2c2-6206-4c05-8960-ea188892a857@suse.de>
 <CAMeQTsYywSAfAkbyqVZuj-_r5-L_pZwxv=UxRhD7pNbwW_sGGw@mail.gmail.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <CAMeQTsYywSAfAkbyqVZuj-_r5-L_pZwxv=UxRhD7pNbwW_sGGw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -4.29
X-Spam-Level: 
X-Spamd-Result: default: False [-4.29 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 XM_UA_NO_VERSION(0.01)[]; RCVD_TLS_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; TAGGED_RCPT(0.00)[];
 TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_TO(0.00)[gmail.com]; MID_RHS_MATCH_FROM(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[lists.freedesktop.org,gmail.com];
 RCPT_COUNT_THREE(0.00)[3]; FROM_EQ_ENVFROM(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email, imap1.dmz-prg2.suse.org:helo,
 imap1.dmz-prg2.suse.org:rdns]
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

Hi

Am 12.04.24 um 10:16 schrieb Patrik Jakobsson:
> On Fri, Apr 12, 2024 at 10:02 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>> Hi,
>>
>> the issue of hanging during boot is still resent.
> Thanks for testing. Then it cannot be that psb_lid_timer_func runs
> before initialization. The BUG from Enrico hints that the
> set_brightness function is called before initialization. That might be
> another place to look.

set_briggtness happens within psb_lid_timer_func() and within 
psb_intel_lvds_encoder_dpms()

I see this:

[   15.509688] gma500 0000:00:02.0: Backlight lvds set brightness 7a127a12
[   15.509791] gma500 0000:00:02.0: [drm] Skipping psb-bl backlight 
registration
[   15.523883] acpi device:0b: registered as cooling_device2
[   15.526252] [drm] Initialized gma500 1.0.0 20140314 for 0000:00:02.0 
on minor 0
[   15.613363] gma500 0000:00:02.0: Backlight lvds set brightness 7a127a12

before booting stops.

Best regards
Thomas

>
> I'll see if I can do some testing on my own.
>
>> Best regards
>> Thomas
>>
>> Am 12.04.24 um 09:24 schrieb Patrik Jakobsson:
>>> Due to changes in the order of initialization the psb_lid_timer_func
>>> could get called without the device being powered. Fix this by checking
>>> the power status before accessing the opregion.
>>>
>>> Cc: Enrico Bartky <enrico.bartky@gmail.com>
>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>> Signed-off-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
>>> ---
>>>    drivers/gpu/drm/gma500/psb_lid.c | 10 +++++++++-
>>>    1 file changed, 9 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/gma500/psb_lid.c b/drivers/gpu/drm/gma500/psb_lid.c
>>> index 58a7fe392636..eeb91d11336e 100644
>>> --- a/drivers/gpu/drm/gma500/psb_lid.c
>>> +++ b/drivers/gpu/drm/gma500/psb_lid.c
>>> @@ -10,6 +10,7 @@
>>>    #include "psb_drv.h"
>>>    #include "psb_intel_reg.h"
>>>    #include "psb_reg.h"
>>> +#include "power.h"
>>>
>>>    static void psb_lid_timer_func(struct timer_list *t)
>>>    {
>>> @@ -20,9 +21,12 @@ static void psb_lid_timer_func(struct timer_list *t)
>>>        u32 __iomem *lid_state = dev_priv->opregion.lid_state;
>>>        u32 pp_status;
>>>
>>> -     if (readl(lid_state) == dev_priv->lid_last_state)
>>> +     if (!gma_power_begin(dev, false))
>>>                goto lid_timer_schedule;
>>>
>>> +     if (readl(lid_state) == dev_priv->lid_last_state)
>>> +             goto power_end;
>>> +
>>>        if ((readl(lid_state)) & 0x01) {
>>>                /*lid state is open*/
>>>                REG_WRITE(PP_CONTROL, REG_READ(PP_CONTROL) | POWER_TARGET_ON);
>>> @@ -36,6 +40,7 @@ static void psb_lid_timer_func(struct timer_list *t)
>>>                        psb_intel_lvds_set_brightness(dev, 100);
>>>                } else {
>>>                        DRM_DEBUG("LVDS panel never powered up");
>>> +                     gma_power_end(dev);
>>>                        return;
>>>                }
>>>        } else {
>>> @@ -48,6 +53,9 @@ static void psb_lid_timer_func(struct timer_list *t)
>>>        }
>>>        dev_priv->lid_last_state =  readl(lid_state);
>>>
>>> +power_end:
>>> +     gma_power_end(dev);
>>> +
>>>    lid_timer_schedule:
>>>        spin_lock_irqsave(&dev_priv->lid_lock, irq_flags);
>>>        if (!timer_pending(lid_timer)) {
>> --
>> --
>> Thomas Zimmermann
>> Graphics Driver Developer
>> SUSE Software Solutions Germany GmbH
>> Frankenstrasse 146, 90461 Nuernberg, Germany
>> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
>> HRB 36809 (AG Nuernberg)
>>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

