Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D8D9E1FDB
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 15:44:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DE2910EA3F;
	Tue,  3 Dec 2024 14:44:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="AN4zMEnW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5QQlBB2J";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="AN4zMEnW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5QQlBB2J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F089810EA50
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 14:44:01 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6EC8E2116D;
 Tue,  3 Dec 2024 14:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1733237040; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=+Dp/cYvz1YDKgQrvytDlCSotCdsgiGGgYHG5RLei6oI=;
 b=AN4zMEnW0YltFzo88P1cZw/b8sDLGBZOR8hLNLvO8L5++Ph0E4/JwJ5qBWZIPtP77Ohwel
 cpiBKkZn4LZ9TPZly8ZRPG19pvz/uutxeH5PmtLHfP4PcmLmEN5yOZiBK8CZKWXabcvTqh
 e+VgdUlgOWgnWWTBjTdNvd8gxUPDlSo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1733237040;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=+Dp/cYvz1YDKgQrvytDlCSotCdsgiGGgYHG5RLei6oI=;
 b=5QQlBB2JHE5lqfqv63QZrRfVvmd1/Q+2GD1qZE8PHyvWVS5PPCyqvrrDRp6ZEcMebCDV7R
 rg/wqQeX6+Gt9iDQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1733237040; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=+Dp/cYvz1YDKgQrvytDlCSotCdsgiGGgYHG5RLei6oI=;
 b=AN4zMEnW0YltFzo88P1cZw/b8sDLGBZOR8hLNLvO8L5++Ph0E4/JwJ5qBWZIPtP77Ohwel
 cpiBKkZn4LZ9TPZly8ZRPG19pvz/uutxeH5PmtLHfP4PcmLmEN5yOZiBK8CZKWXabcvTqh
 e+VgdUlgOWgnWWTBjTdNvd8gxUPDlSo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1733237040;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=+Dp/cYvz1YDKgQrvytDlCSotCdsgiGGgYHG5RLei6oI=;
 b=5QQlBB2JHE5lqfqv63QZrRfVvmd1/Q+2GD1qZE8PHyvWVS5PPCyqvrrDRp6ZEcMebCDV7R
 rg/wqQeX6+Gt9iDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 58230139C2;
 Tue,  3 Dec 2024 14:44:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id BrNNFDAZT2fIOAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 03 Dec 2024 14:44:00 +0000
Message-ID: <b71926ec-ca5b-4db6-a72e-6ba539e165f3@suse.de>
Date: Tue, 3 Dec 2024 15:44:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/6] drm/panic: Move drawing functions to drm_draw
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org
References: <20241115142950.1758007-1-jfalempe@redhat.com>
 <20241115142950.1758007-2-jfalempe@redhat.com> <87y10x3u0x.fsf@intel.com>
 <a51f2945-4eff-411e-83ad-838e69daeb6a@redhat.com> <87ed2o506g.fsf@intel.com>
 <4f99d11e-7860-45f4-b366-e1ecf649914b@redhat.com>
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
In-Reply-To: <4f99d11e-7860-45f4-b366-e1ecf649914b@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+]; RCPT_COUNT_TWO(0.00)[2];
 RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Level: 
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


Am 03.12.24 um 15:19 schrieb Jocelyn Falempe:
> On 03/12/2024 15:08, Jani Nikula wrote:
>> On Tue, 03 Dec 2024, Jocelyn Falempe <jfalempe@redhat.com> wrote:
>>> On 03/12/2024 12:06, Jani Nikula wrote:
>>>> On Fri, 15 Nov 2024, Jocelyn Falempe <jfalempe@redhat.com> wrote:
>>>>> Move the color conversions, blit and fill functions to drm_draw.c,
>>>>> so that they can be re-used by drm_log.
>>>>> drm_draw is internal to the drm subsystem, and shouldn't be used by
>>>>> gpu drivers.
>>>>
>>>> I started looking at this in patch 2:
>>>>
>>>>> +#include "../drm_draw.h"
>>>>
>>>> I think we should avoid #includes with ../ like this.
>>>
>>> Sure, I've added it in v8, after the clients moved to drm/clients/, but
>>> I didn't think much about it.
>>>
>>>>
>>>> Either drm_draw.h belongs in include/drm, or maybe clients/Makefile
>>>> needs to add subdir-ccflags-y += -I$(src)/.. or something like that?
>>>>
>>>> If it's supposed to be internal, I guess the latter, but then the
>>>> current convention is to have _internal.h suffix. All drm headers 
>>>> under
>>>> drivers/ have that.
>>>
>>> ok, I can rename drm_draw.h to drm_draw_internal.h, and add the include
>>> in the Makefile.
>>>>
>>>> Is this the first drm subsystem internal thing that's a separate 
>>>> module?
>>>> Should we use EXPORT_SYMBOL_NS() and MODULE_IMPORT_NS() to enforce it
>>>> being internal?
>>>
>>> It's not really a separate module, as it's built in the core drm 
>>> module.
>>> (the reason is that it's used by drm_panic too, which must be in the
>>> core drm module).
>>
>> Right, sorry, I got confused and looked at this the other way round.
>>
>> drm_draw is part of drm.ko, drm log is part of drm_client_lib.ko, and
>> uses drm_draw, right?
> Yes, that's it.
>>
>> So is drm_draw really internal if drm client uses it?
>
> For me "internal" includes drm clients and kms helpers, but yes, it's 
> not really clear.
>
>>
>> I don't really deeply care either way, but it bugs me when it's
>> somewhere in between. :)
>>
>> Either include/drm/drm_draw.h or drivers/gpu/drm/drm_draw_internal.h,
>> the latter *possibly* with symbol namespace, but not a big deal.
>
> The other reason for "internal" is that we should find a way to merge 
> drm_draw, drm_format_helper, and some vkms conversion helper, that 
> does similar things. So the less users, the easier it will be.

Exactly. 'internal' definitely means not-drivers. And the last thing we 
want is DRM drivers that draw framebuffers by themselves. When we unify 
and harmonize the various blit and draw helpers, we can still loosen the 
requirements if necessary.

Best regards
Thomas

>
> Best regards,
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

