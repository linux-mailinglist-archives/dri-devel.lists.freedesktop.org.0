Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D389B40190
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 14:58:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C510610E6D0;
	Tue,  2 Sep 2025 12:58:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="xn9DO4es";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1yNU2dBs";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YDEJbZcp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7bZhpkgN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72A2E10E6D0
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 12:58:06 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D0DB31F38A;
 Tue,  2 Sep 2025 12:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1756817885; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=27gbnPp/6osghY/uJgUFibUP56mTYE1hActgxKY+rew=;
 b=xn9DO4esSXnTBejL21D2HiS0XbKwlfwls6rn75RRblRR3uL09VeSl8lEvYuEmvnM8iLzFQ
 LjBp0I/uvSNVpVTXx+vEEyr2ztDex3r70LamLLajC8plovfLKXU5zEElo+/Fk0zrPXaFkq
 e9xMeOFPkXqCqOPJDUGYNF4jG4mZ+2w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1756817885;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=27gbnPp/6osghY/uJgUFibUP56mTYE1hActgxKY+rew=;
 b=1yNU2dBsUjENvd9rDV8ljkWiytSJXKfy/jig9udgbBkDD9Y7UKvC+A9A3b0VOPpP7LnBjB
 dbWel2yDCq/ECkCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1756817884; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=27gbnPp/6osghY/uJgUFibUP56mTYE1hActgxKY+rew=;
 b=YDEJbZcp364Psa5M2RaJsAvUQilmRFOboi3O0bxShuf0hSG9Uc0xmaBaPLYjGoLB4YCHDn
 T+12AsYSFh1igLm/3x7LWv9UJbYpKfx9n3fC640UbdlJRDj/hMixv4tqpFkFRP7WicojaL
 UCamPcInX5QtiNC9iFYy39NdMmqXU5Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1756817884;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=27gbnPp/6osghY/uJgUFibUP56mTYE1hActgxKY+rew=;
 b=7bZhpkgN084ig1UkHSjFwkGyZLD3z53pvK6fRaMqYjU5AscMdXJ8o671iEsPEL4W9qD7bf
 sw/TjDS1IcY3wbDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BD37413888;
 Tue,  2 Sep 2025 12:58:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id q23ILNvptmjRUQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 02 Sep 2025 12:58:03 +0000
Message-ID: <5cd7f22d-e39a-4d37-8286-0194d6c9a818@suse.de>
Date: Tue, 2 Sep 2025 14:58:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] drm/hypervdrm: Use vblank timer
To: Javier Martinez Canillas <javierm@redhat.com>, louis.chauvet@bootlin.com, 
 drawat.floss@gmail.com, hamohammed.sa@gmail.com, melissa.srw@gmail.com,
 mhklinux@outlook.com, simona@ffwll.ch, airlied@gmail.com,
 maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org
References: <20250901111241.233875-1-tzimmermann@suse.de>
 <20250901111241.233875-5-tzimmermann@suse.de>
 <87a53dfe87.fsf@minerva.mail-host-address-is-not-set>
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
In-Reply-To: <87a53dfe87.fsf@minerva.mail-host-address-is-not-set>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_TO(0.00)[redhat.com,bootlin.com,gmail.com,outlook.com,ffwll.ch,linux.intel.com];
 TAGGED_RCPT(0.00)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 RCPT_COUNT_SEVEN(0.00)[11]; MIME_TRACE(0.00)[0:+];
 MID_RHS_MATCH_FROM(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,outlook.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 URIBL_BLOCKED(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo, suse.de:mid,
 suse.de:email]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.80
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

Am 02.09.25 um 10:30 schrieb Javier Martinez Canillas:
> Thomas Zimmermann <tzimmermann@suse.de> writes:
>
>> HyperV's virtual hardware does not provide vblank interrupts. Use a
>> vblank timer to simulate the interrupt. Rate-limits the display's
>> update frequency to the display-mode settings. Avoids excessive CPU
>> overhead with compositors that do not rate-limit their output.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
>
> [...]
>
>>   
>> @@ -111,11 +113,15 @@ static void hyperv_crtc_helper_atomic_enable(struct drm_crtc *crtc,
>>   				crtc_state->mode.hdisplay,
>>   				crtc_state->mode.vdisplay,
>>   				plane_state->fb->pitches[0]);
>> +
>> +	drm_crtc_vblank_on(crtc);
>>   }
>>   
>>   static const struct drm_crtc_helper_funcs hyperv_crtc_helper_funcs = {
>>   	.atomic_check = drm_crtc_helper_atomic_check,
>> +	.atomic_flush = drm_crtc_vblank_atomic_flush,
>>   	.atomic_enable = hyperv_crtc_helper_atomic_enable,
>> +	.atomic_disable = drm_crtc_vblank_atomic_disable,
>>   };
>>   
> I think your patch is correct due the driver not having an .atomic_disable
> callback. But looking at the driver, I see that its .atomic_enable does:
>
> static void hyperv_crtc_helper_atomic_enable(struct drm_crtc *crtc,
>                                               struct drm_atomic_state *state)
> {
> ...
>          hyperv_update_situation(hv->hdev, 1,  hv->screen_depth,
>                                  crtc_state->mode.hdisplay,
>                                  crtc_state->mode.vdisplay,
>                                  plane_state->fb->pitches[0]);
> }
>
> and this function in turn does:
>
> int hyperv_update_situation(struct hv_device *hdev, u8 active, u32 bpp,
>                              u32 w, u32 h, u32 pitch)
> {
> ...
>          msg.situ.video_output[0].active = active;
> ...
> }
>
> So I wonder if it should instead have a custom .atomic_disable that calls:
>
>          hyperv_update_situation(hv->hdev, 0,  hv->screen_depth,
>                                  crtc_state->mode.hdisplay,
>                                  crtc_state->mode.vdisplay,
>                                  plane_state->fb->pitches[0]);
>
> I'm not familiar with hyperv to know whether is a problem or not for the
> host to not be notified that the guest display is disabled. But I thought
> that should raise this question for the folks familiar with it.

The feedback I got at 
https://lore.kernel.org/dri-devel/SN6PR02MB4157F630284939E084486AFED46FA@SN6PR02MB4157.namprd02.prod.outlook.com/ 
is that the vblank timer solves the problem of excessive CPU consumption 
on hypervdrm. Ans that's also the observation I had with other drivers. 
I guess, telling the host about the disabled display would still make sense.

Best regards
Thomas


>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


