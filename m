Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 375F5BEE843
	for <lists+dri-devel@lfdr.de>; Sun, 19 Oct 2025 17:07:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10AE710E14B;
	Sun, 19 Oct 2025 15:07:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="v7V3or0B";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="j8OjyoD5";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0J0rKgRg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lykONHPn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A84210E14B
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Oct 2025 15:07:04 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 98FFA1F45B;
 Sun, 19 Oct 2025 15:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1760886420; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Tuzz6GjzJPStM88stVJaAjq0mkclu2GwMBX1srqPs5g=;
 b=v7V3or0BJv6ImiK2tj8gkUUB+m2ahrtpS5J9Ghf8y7Qt+Lps6tecpntelnEme+iYHgJXuq
 4PxlRXyVxQPG0f0MgIi5szTISbEPQS7grszUT6+Airm/+CXjys4AUB4UUEIaNFx90bM8FZ
 /TloXoUbLWhMSksPmkRu3PqM5XlLs6Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1760886420;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Tuzz6GjzJPStM88stVJaAjq0mkclu2GwMBX1srqPs5g=;
 b=j8OjyoD5Ex0QE7JZMGwJeqIP+ox4bJsT9ucqwyVsRTcFlJgse4vpbdgmNXXW8d7bYUz6ts
 CVHyb2dmG7unO3AA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1760886416; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Tuzz6GjzJPStM88stVJaAjq0mkclu2GwMBX1srqPs5g=;
 b=0J0rKgRg7UqmmPdK6TONHhAhqkNFqo1dM/x40gRJlLkSOAMz3peB8DwGq15W4wnmsOTwiR
 iF8UpegWzG5la7iBkdhkrRg1vhMCC5ZeLnA/Ye04KISmg904ptHPLRbFq/bgn8sj+H2QmM
 t2w6PfQVEU5rwxLpOedB20MDV7YIGqA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1760886416;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Tuzz6GjzJPStM88stVJaAjq0mkclu2GwMBX1srqPs5g=;
 b=lykONHPnsbuEMMKgNbrf6mJ+nEvviPNaE/tbc+lS5TIlZgW4/xo7BJun/ii79UkkLXqmOa
 nRAFXNG83+/lm7Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 80F42139D8;
 Sun, 19 Oct 2025 15:06:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id WrKMHZD+9GhLLwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Sun, 19 Oct 2025 15:06:56 +0000
Message-ID: <280acc5a-fcc4-49bd-9444-9a951ad806da@suse.de>
Date: Sun, 19 Oct 2025 17:06:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH next] drm/sysfb: Fix a NULL vs IS_ERR() bug
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <aPJo1W5Dl4rmGX_P@stanley.mountain> <aPJrs7_u8KcalNsC@intel.com>
 <d8780a77-a888-4038-babc-6c78956f5bbf@suse.de>
Content-Language: en-US
Cc: dri-devel <dri-devel@lists.freedesktop.org>
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
In-Reply-To: <d8780a77-a888-4038-babc-6c78956f5bbf@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MID_RHS_MATCH_FROM(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 ARC_NA(0.00)[]; RCPT_COUNT_TWO(0.00)[2]; RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 TO_DN_ALL(0.00)[]; FROM_HAS_DN(0.00)[]; MIME_TRACE(0.00)[0:+];
 FROM_EQ_ENVFROM(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email]
X-Spam-Flag: NO
X-Spam-Score: -4.30
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

(cc dri-devel)

Am 19.10.25 um 17:06 schrieb Thomas Zimmermann:
> Hi
>
> Am 17.10.25 um 18:15 schrieb Ville Syrjälä:
>> On Fri, Oct 17, 2025 at 07:03:33PM +0300, Dan Carpenter wrote:
>>> The drm_atomic_get_crtc_state() function never returns NULL, it returns
>>> error pointers.  Update the error checking to match.
>>>
>>> Fixes: cb71de092553 ("drm/sysfb: Lookup blit function during atomic 
>>> check")
>>> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
>>> ---
>>>   drivers/gpu/drm/sysfb/drm_sysfb_modeset.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/sysfb/drm_sysfb_modeset.c 
>>> b/drivers/gpu/drm/sysfb/drm_sysfb_modeset.c
>>> index 8517c490e815..d2c4d8f3d4d0 100644
>>> --- a/drivers/gpu/drm/sysfb/drm_sysfb_modeset.c
>>> +++ b/drivers/gpu/drm/sysfb/drm_sysfb_modeset.c
>>> @@ -259,7 +259,7 @@ int 
>>> drm_sysfb_plane_helper_begin_fb_access(struct drm_plane *plane,
>>>       ret = -EINVAL;
>>>         crtc_state = drm_atomic_get_crtc_state(plane_state->state, 
>>> plane_state->crtc);
>> Looking at where this gets called, that should be
>> drm_atomic_get_new_crtc_state(). Either that or the
>> code is more seriously borked.
>
> Yes that should be get_new_crtc_state. Thanks for spotting the bug.
>
>>
>> I'll send out a patch that warns about invalid use of
>> *_get_state()...
>
> If that is possible, I'd welcome it very much. State handling seems 
> like one of the dark corners of the DRM framework.
>
> Best regards
> Thomas
>
>>
>>> -    if (drm_WARN_ON_ONCE(dev, !crtc_state))
>>> +    if (drm_WARN_ON_ONCE(dev, IS_ERR(crtc_state)))
>>>           goto err_drm_gem_end_shadow_fb_access;
>>>       sysfb_crtc_state = to_drm_sysfb_crtc_state(crtc_state);
>>>   --
>>> 2.51.0
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


