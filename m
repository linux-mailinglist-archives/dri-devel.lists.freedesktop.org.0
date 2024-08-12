Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2614994E629
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 07:35:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F98F10E02B;
	Mon, 12 Aug 2024 05:35:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="o75YNYcs";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/302KZYv";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UbyLc634";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pMz4q7t7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBCE410E02B
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 05:35:04 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6A8472249B;
 Mon, 12 Aug 2024 05:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1723440903; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=9fPhA3Mhguzt87NwzNRfDuCVskfrjtQ0j5pDVwcDzAg=;
 b=o75YNYcskvTCJVeOBNPFDBiXFFhd7dAuPAKlqLDp1FXhVGutJ4/QK4rISapX7FZK7vQJ3q
 XepEIViKt3dy/6JWG0/NqH1KEbGegFaiFNtKLx+hr9v+FEeNNCFb18HW+xMEBfOTCw4KcD
 Sd/4PgITnEVZGt/vZjxhcIltmLVlc90=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1723440903;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=9fPhA3Mhguzt87NwzNRfDuCVskfrjtQ0j5pDVwcDzAg=;
 b=/302KZYveb5EoVMD9xqHBvoqanbn6SAEiHRj5TqUpsJSGeZesUUSCiEz7DitIIndLAfImN
 XUu1Ilc8POHKjHCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1723440902; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=9fPhA3Mhguzt87NwzNRfDuCVskfrjtQ0j5pDVwcDzAg=;
 b=UbyLc634uSjrjru9duUPaqBKJ1ZK9rBgAuw6Km+MMUUbpEI8Y4KLVE02s7+LhlZ3mey/Lh
 R/AApzyiBHWzbJEOkFjPfwfNu3bmE/nCWuggrsYt/FOxEeDyfeufI2TwzQn5Uzd+eSO+ZY
 rHlkLjNEcZU+DLdmBIuDBnCHUManuBQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1723440902;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=9fPhA3Mhguzt87NwzNRfDuCVskfrjtQ0j5pDVwcDzAg=;
 b=pMz4q7t7yo9m8DBEVcz3YQHMwcCFhWfDuXMA4F/sJJadCWVb5tUZQGmuvakiMeY3lnbwmk
 88sKb/FnnzzhgKBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 18D1B137BA;
 Mon, 12 Aug 2024 05:35:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id YapLBAafuWbZbAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 12 Aug 2024 05:35:02 +0000
Message-ID: <945ccdcd-81ad-40de-8b56-749458f68702@suse.de>
Date: Mon, 12 Aug 2024 07:35:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ast: astdp: fix pre-op vs post-op bug
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Jani Nikula <jani.nikula@linux.intel.com>
Cc: Dave Airlie <airlied@redhat.com>, Jocelyn Falempe <jfalempe@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <f7790a38-6b72-44dd-aaeb-550d2de14cf2@stanley.mountain>
 <57cea156-1abc-4860-9a6a-0a5fdb4a2971@suse.de> <87h6bt3j6w.fsf@intel.com>
 <359e5aa5-5908-44d3-8359-4605aac3f5d5@stanley.mountain>
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
In-Reply-To: <359e5aa5-5908-44d3-8359-4605aac3f5d5@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-1.29 / 50.00]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 XM_UA_NO_VERSION(0.01)[]; RCVD_TLS_ALL(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 RCPT_COUNT_SEVEN(0.00)[11]; MIME_TRACE(0.00)[0:+];
 MID_RHS_MATCH_FROM(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
 TO_DN_SOME(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -1.29
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

Am 09.08.24 um 19:06 schrieb Dan Carpenter:
> On Fri, Aug 09, 2024 at 04:43:51PM +0300, Jani Nikula wrote:
>> On Fri, 09 Aug 2024, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>>> Hi,
>>>
>>> thanks a lot for the bugfix.
>>>
>>> Am 09.08.24 um 14:33 schrieb Dan Carpenter:
>>>> The test for "Link training failed" expect the loop to exit with "i"
>>>> set to zero but it exits when "i" is set to -1.  Change this from a
>>>> post-op to a pre-op so that it exits with "i" set to zero.  This
>>>> changes the number of iterations from 10 to 9 but probably that's
>>>> okay.
>>> Yes, that's ok.
>>>
>>>> Fixes: 2281475168d2 ("drm/ast: astdp: Perform link training during atomic_enable")
>>>> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
>>>> ---
>>>>    drivers/gpu/drm/ast/ast_dp.c | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
>>>> index 5d07678b502c..4329ab680f62 100644
>>>> --- a/drivers/gpu/drm/ast/ast_dp.c
>>>> +++ b/drivers/gpu/drm/ast/ast_dp.c
>>>> @@ -148,7 +148,7 @@ void ast_dp_link_training(struct ast_device *ast)
>>>>    	struct drm_device *dev = &ast->base;
>>>>    	unsigned int i = 10;
>>>>    
>>>> -	while (i--) {
>>>> +	while (--i) {
>>> If this loop ever starts with i = 0, it would break again. Can we use
>>>
>>> while (i) {
>>>     --i;
>>>      ...
>>> }
>>>
>>> instead?
>> FWIW, I personally *always* use for loops when there isn't a compelling
>> reason to do otherwise. You know at a glance that
>>
>> 	for (i = 0; i < N; i++)
>>
>> gets run N times and what i is going to be afterwards.
>>
>> Sure, you may have to restructure other things, but I think it's almost
>> always worth it.
> A for statement works here.  I need to resend the patch anyway because
> the if (i) msleep() code doesn't make sense now.

Why? The loop counts downwards and does not wait if the final iteration 
(i == 0) fails.

Personally, I prefer while for counting downwards. But if you do the for 
loop as mentioned, you have to adapt the loop body.

Best regards
Thomas

>
> regards,
> dan carpenter
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

