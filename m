Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE36AF0D90
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 10:12:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CB8A10E080;
	Wed,  2 Jul 2025 08:12:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="t3wcZVkp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hKf8P/Aa";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fKitWYC1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1BBED3i3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 402D510E080
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jul 2025 08:12:14 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DA55221175;
 Wed,  2 Jul 2025 08:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1751443932; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=XMusER8bbzla3LK0PhIib8SXlNxMhayP7yraWeoIwjc=;
 b=t3wcZVkpjh7O3POO1ztTU2jJcqJ/locBR6tZRXbBUZpiWZOE9pKug/xFclAfcgW3HIKRTr
 ICo75CzV5ISvVba/nNJgrYSG0TycfO09QTQ8lEq/qYtqGOtomRitT0dbPvyyNSoY8LdA+b
 kN/ij77BCIuB/XaHT+YUxgFGibG8vrI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1751443932;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=XMusER8bbzla3LK0PhIib8SXlNxMhayP7yraWeoIwjc=;
 b=hKf8P/AaPzt+N3mToh37AInvicCTlYsKISzJpsu5Ixa0Z3Lxlj9QUx7CihckmhDeRKUfVf
 sTTWk4GS9r4/D2Bw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1751443931; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=XMusER8bbzla3LK0PhIib8SXlNxMhayP7yraWeoIwjc=;
 b=fKitWYC1P1BdeGL91OmLXXws4PttDj/kWigyDBZssapFojWmtmre1CJIPq9oNtYXuW6+tV
 SJbtnBqKaw/pmcJBs2/8hbp42UOVDjONI94ozJt1w3A19ccJImIaoUBWuoQMK0JToc6xPt
 cdJNwOlA/IIqB8idIGsATcLkyZNRDU0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1751443931;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=XMusER8bbzla3LK0PhIib8SXlNxMhayP7yraWeoIwjc=;
 b=1BBED3i3lnNGB1Bl3ld7xMtKXakgH0kwvBM5rLY5QVrvLjpbQ0EcwHoCHpQnnr43MiCEy+
 OCUq5Ur7B3Q97QDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8D9D613A24;
 Wed,  2 Jul 2025 08:12:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id rYcrIdvpZGhsSAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 02 Jul 2025 08:12:11 +0000
Message-ID: <48b36219-3344-4cac-8e47-318e7da46c1b@suse.de>
Date: Wed, 2 Jul 2025 10:12:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/tests: Fix endian warning
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com, 
 simona@ffwll.ch, lumag@kernel.org, cristian.ciocaltea@collabora.com,
 gcarlos@disroot.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250630090054.353246-1-jose.exposito89@gmail.com>
 <6c2e44cc-c01a-4331-b139-152ccdbd0401@mailbox.org> <aGQQjTUrG8-p8qAC@fedora>
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
In-Reply-To: <aGQQjTUrG8-p8qAC@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 ARC_NA(0.00)[]; FREEMAIL_TO(0.00)[gmail.com,mailbox.org];
 MIME_TRACE(0.00)[0:+];
 FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,gmail.com,ffwll.ch,collabora.com,disroot.org,lists.freedesktop.org,vger.kernel.org];
 RCVD_TLS_ALL(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCPT_COUNT_SEVEN(0.00)[11]; MID_RHS_MATCH_FROM(0.00)[];
 TAGGED_RCPT(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
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

Am 01.07.25 um 18:45 schrieb José Expósito:
> Hey Michel,
>
> Thanks for looking into this.
>
> On Tue, Jul 01, 2025 at 10:22:13AM +0200, Michel Dänzer wrote:
>> On 30.06.25 11:00, José Expósito wrote:
>>> When compiling with sparse enabled, this warning is thrown:
>>>
>>>    warning: incorrect type in argument 2 (different base types)
>>>       expected restricted __le32 const [usertype] *buf
>>>       got unsigned int [usertype] *[assigned] buf
>>>
>>> Add a cast to fix it.
>>>
>>> Fixes: 453114319699 ("drm/format-helper: Add KUnit tests for drm_fb_xrgb8888_to_xrgb2101010()")
>>> Signed-off-by: José Expósito <jose.exposito89@gmail.com>
>>> ---
>>>   drivers/gpu/drm/tests/drm_format_helper_test.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
>>> index 7299fa8971ce..86829e1cb7f0 100644
>>> --- a/drivers/gpu/drm/tests/drm_format_helper_test.c
>>> +++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
>>> @@ -1033,7 +1033,7 @@ static void drm_test_fb_xrgb8888_to_xrgb2101010(struct kunit *test)
>>>   		NULL : &result->dst_pitch;
>>>   
>>>   	drm_fb_xrgb8888_to_xrgb2101010(&dst, dst_pitch, &src, &fb, &params->clip, &fmtcnv_state);
>>> -	buf = le32buf_to_cpu(test, buf, dst_size / sizeof(u32));
>>> +	buf = le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / sizeof(u32));
>>>   	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
>>>   
>>>   	buf = dst.vaddr; /* restore original value of buf */
>> It might be cleaner to use two separate variables instead of using "buf" as both little endian and host byte order. (Same for patch 2)
> Yes, however, the same pattern is repeated 10 times in this file.
>
> What do you think about fixing it in a follow up? I don't think it
> should block fixing the KUnit tests.

Before doing this, you should consider storing the test data in 
little-endian. That would save all the endianess conversion in the code.

Best regards
Thomas

>
> Jose
>
>> -- 
>> Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
>> https://redhat.com             \               Libre software enthusiast

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

