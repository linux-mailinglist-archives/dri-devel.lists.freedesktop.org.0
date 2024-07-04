Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9BD927675
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2024 14:53:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83FDE10EAD8;
	Thu,  4 Jul 2024 12:53:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="mubB1nxH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iLwERUOH";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mubB1nxH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iLwERUOH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE68710EAD8
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2024 12:53:18 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 698D821BC5;
 Thu,  4 Jul 2024 12:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1720097597; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=q0O0pEEbtISfOf3KeYpIta7ObYKGm+2Eh4YsSdASzU4=;
 b=mubB1nxHnalef4Svp0jEdRJdwM/pTWuNoXJP5+3YvhAKc2D9K3I9dGbW4vxiIguuMQSlwr
 1Kv2qz7b/1sPZyKxy0q5N88ZfNMNAO+Ycyl87zY+zvqHXg2gNgzrCuY9isJBk6EUHSAWMD
 SB7XxvLciS/C+/1lzJw05E1kXALK5C0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1720097597;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=q0O0pEEbtISfOf3KeYpIta7ObYKGm+2Eh4YsSdASzU4=;
 b=iLwERUOH/KU34oZZi9o98yFwEtmQ0zMc87gagFu/DJjdHvjebcImf5mbF4y9xJckUZRBCG
 8TgUdvevaU3ImSCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1720097597; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=q0O0pEEbtISfOf3KeYpIta7ObYKGm+2Eh4YsSdASzU4=;
 b=mubB1nxHnalef4Svp0jEdRJdwM/pTWuNoXJP5+3YvhAKc2D9K3I9dGbW4vxiIguuMQSlwr
 1Kv2qz7b/1sPZyKxy0q5N88ZfNMNAO+Ycyl87zY+zvqHXg2gNgzrCuY9isJBk6EUHSAWMD
 SB7XxvLciS/C+/1lzJw05E1kXALK5C0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1720097597;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=q0O0pEEbtISfOf3KeYpIta7ObYKGm+2Eh4YsSdASzU4=;
 b=iLwERUOH/KU34oZZi9o98yFwEtmQ0zMc87gagFu/DJjdHvjebcImf5mbF4y9xJckUZRBCG
 8TgUdvevaU3ImSCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3279B13889;
 Thu,  4 Jul 2024 12:53:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id vbDzCj2bhmZRFQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 04 Jul 2024 12:53:17 +0000
Message-ID: <c86bc706-07ed-440e-bc16-6072d3d9141b@suse.de>
Date: Thu, 4 Jul 2024 14:53:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] drm/mgag200: Start/stop BMC scanout in BMC encoder
 helpers
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jocelyn Falempe <jfalempe@redhat.com>, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
References: <20240703135502.29190-1-tzimmermann@suse.de>
 <20240703135502.29190-3-tzimmermann@suse.de>
 <61aa2068-c513-42da-a563-acd9d1db4d06@redhat.com>
 <bb747779-0c69-4db9-8302-515259728496@suse.de>
Content-Language: en-US
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
In-Reply-To: <bb747779-0c69-4db9-8302-515259728496@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Score: -4.29
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-4.29 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-0.976]; MIME_GOOD(-0.10)[text/plain];
 XM_UA_NO_VERSION(0.01)[];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RCPT_COUNT_SEVEN(0.00)[7]; MIME_TRACE(0.00)[0:+];
 MID_RHS_MATCH_FROM(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo]
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



Am 04.07.24 um 14:23 schrieb Thomas Zimmermann:
> Hi
>
> Am 04.07.24 um 14:13 schrieb Jocelyn Falempe:
>>
>>
>> On 03/07/2024 15:40, Thomas Zimmermann wrote:
>>> Start and stop the BMC scanout from the BMC encoder's atomic_enable
>>> and atomic_disable helpers. The BMC stops scanning out at the beginning
>>> of a modeset operation and restarts the scanout at the end of the
>>> modeset.
>>>
>>> Only G200EW3 and G200WB require this procedure. Drop the original
>>> vidrst callbacks for these model's support, as they are now obsolete.
>>
>> Thanks, that makes the BMC connector more useful.
>>
>> I'm just wondering, in case you use both a VGA output and the BMC, 
>> before this patch, vidrst would be enabled, and after, as the BMC 
>> connector is "unconnected" it should be disabled ?
>>
>> Will that have a visible impact for users ?
>
> Oh, I didn't think of this case. That could likely be a problem. 
> Thanks for pointing this out.
>
> Let's drop patches 2 to 4 for now. I'd still like to take patch 1, as 
> it works on it own and makes sense.

Or maybe I'll send out something different. I'd like the BMC and CRTC to 
be more independent from each other. But apparently the CRTC really has 
to do all the work here.

Best regards
Thomas


>
> Best regards
> Thomas
>
>>
>>
>>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> ---
>>>   drivers/gpu/drm/mgag200/mgag200_bmc.c     | 24 
>>> +++++++++++++++++++++--
>>>   drivers/gpu/drm/mgag200/mgag200_drv.h     |  4 +---
>>>   drivers/gpu/drm/mgag200/mgag200_g200ew3.c |  2 --
>>>   drivers/gpu/drm/mgag200/mgag200_g200wb.c  |  2 --
>>>   4 files changed, 23 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/mgag200/mgag200_bmc.c 
>>> b/drivers/gpu/drm/mgag200/mgag200_bmc.c
>>> index cb5400333862..74feb6d8db45 100644
>>> --- a/drivers/gpu/drm/mgag200/mgag200_bmc.c
>>> +++ b/drivers/gpu/drm/mgag200/mgag200_bmc.c
>>> @@ -14,7 +14,7 @@ static struct mgag200_bmc_connector 
>>> *to_mgag200_bmc_connector(struct drm_connect
>>>       return container_of(connector, struct mgag200_bmc_connector, 
>>> base);
>>>   }
>>>   -void mgag200_bmc_disable_vidrst(struct mga_device *mdev)
>>> +static void mgag200_bmc_disable_vidrst(struct mga_device *mdev)
>>>   {
>>>       u8 tmp;
>>>       int iter_max;
>>> @@ -73,7 +73,16 @@ void mgag200_bmc_disable_vidrst(struct mga_device 
>>> *mdev)
>>>       }
>>>   }
>>>   -void mgag200_bmc_enable_vidrst(struct mga_device *mdev)
>>> +static void mgag200_bmc_encoder_helper_atomic_disable(struct 
>>> drm_encoder *encoder,
>>> +                              struct drm_atomic_state *state)
>>> +{
>>> +    struct mga_device *mdev = to_mga_device(encoder->dev);
>>> +
>>> +    if (mdev->info->has_vidrst)
>>> +        mgag200_bmc_disable_vidrst(mdev);
>>> +}
>>> +
>>> +static void mgag200_bmc_enable_vidrst(struct mga_device *mdev)
>>>   {
>>>       u8 tmp;
>>>   @@ -103,6 +112,15 @@ void mgag200_bmc_enable_vidrst(struct 
>>> mga_device *mdev)
>>>       WREG_DAC(MGA1064_GEN_IO_DATA, tmp);
>>>   }
>>>   +static void mgag200_bmc_encoder_helper_atomic_enable(struct 
>>> drm_encoder *encoder,
>>> +                             struct drm_atomic_state *state)
>>> +{
>>> +    struct mga_device *mdev = to_mga_device(encoder->dev);
>>> +
>>> +    if (mdev->info->has_vidrst)
>>> +        mgag200_bmc_enable_vidrst(mdev);
>>> +}
>>> +
>>>   static int mgag200_bmc_encoder_helper_atomic_check(struct 
>>> drm_encoder *encoder,
>>>                              struct drm_crtc_state *crtc_state,
>>>                              struct drm_connector_state *conn_state)
>>> @@ -119,6 +137,8 @@ static int 
>>> mgag200_bmc_encoder_helper_atomic_check(struct drm_encoder *encoder,
>>>   }
>>>     static const struct drm_encoder_helper_funcs 
>>> mgag200_bmc_encoder_helper_funcs = {
>>> +    .atomic_disable = mgag200_bmc_encoder_helper_atomic_disable,
>>> +    .atomic_enable = mgag200_bmc_encoder_helper_atomic_enable,
>>>       .atomic_check = mgag200_bmc_encoder_helper_atomic_check,
>>>   };
>>>   diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h 
>>> b/drivers/gpu/drm/mgag200/mgag200_drv.h
>>> index 4b75613de882..b1365795234b 100644
>>> --- a/drivers/gpu/drm/mgag200/mgag200_drv.h
>>> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
>>> @@ -442,9 +442,7 @@ int mgag200_mode_config_init(struct mga_device 
>>> *mdev, resource_size_t vram_avail
>>>   /* mgag200_vga.c */
>>>   int mgag200_vga_output_init(struct mga_device *mdev);
>>>   -                /* mgag200_bmc.c */
>>> -void mgag200_bmc_disable_vidrst(struct mga_device *mdev);
>>> -void mgag200_bmc_enable_vidrst(struct mga_device *mdev);
>>> +/* mgag200_bmc.c */
>>>   int mgag200_bmc_output_init(struct mga_device *mdev, struct 
>>> drm_connector *physical_connector);
>>>     #endif                /* __MGAG200_DRV_H__ */
>>> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200ew3.c 
>>> b/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
>>> index 839401e8b465..265f3e95830a 100644
>>> --- a/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
>>> +++ b/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
>>> @@ -146,8 +146,6 @@ static const struct mgag200_device_info 
>>> mgag200_g200ew3_device_info =
>>>       MGAG200_DEVICE_INFO_INIT(2048, 2048, 0, true, 0, 1, false);
>>>     static const struct mgag200_device_funcs 
>>> mgag200_g200ew3_device_funcs = {
>>> -    .disable_vidrst = mgag200_bmc_disable_vidrst,
>>> -    .enable_vidrst = mgag200_bmc_enable_vidrst,
>>>       .pixpllc_atomic_check = mgag200_g200ew3_pixpllc_atomic_check,
>>>       .pixpllc_atomic_update = mgag200_g200wb_pixpllc_atomic_update, 
>>> // same as G200WB
>>>   };
>>> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200wb.c 
>>> b/drivers/gpu/drm/mgag200/mgag200_g200wb.c
>>> index 835df0f4fc13..e25477347c3e 100644
>>> --- a/drivers/gpu/drm/mgag200/mgag200_g200wb.c
>>> +++ b/drivers/gpu/drm/mgag200/mgag200_g200wb.c
>>> @@ -280,8 +280,6 @@ static const struct mgag200_device_info 
>>> mgag200_g200wb_device_info =
>>>       MGAG200_DEVICE_INFO_INIT(1280, 1024, 31877, true, 0, 1, false);
>>>     static const struct mgag200_device_funcs 
>>> mgag200_g200wb_device_funcs = {
>>> -    .disable_vidrst = mgag200_bmc_disable_vidrst,
>>> -    .enable_vidrst = mgag200_bmc_enable_vidrst,
>>>       .pixpllc_atomic_check = mgag200_g200wb_pixpllc_atomic_check,
>>>       .pixpllc_atomic_update = mgag200_g200wb_pixpllc_atomic_update,
>>>   };
>>
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

