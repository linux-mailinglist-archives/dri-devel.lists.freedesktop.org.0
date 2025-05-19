Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5166ABB864
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 11:12:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CAEF10E212;
	Mon, 19 May 2025 09:12:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="BWPcKpg9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tM1p0OIv";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="l7XNFP3/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VK75ClBa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A493910E212
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 09:12:32 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B8F582026F;
 Mon, 19 May 2025 09:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1747645951; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=CxQ89a9q28JTurhDVDxMqnAC8LAbCOepjWefrVxQTkY=;
 b=BWPcKpg9p6IRKguFfdBOSwzNb4pkYJsyFagIVipJz100ykQ6Gk6W8GXx7jbVsFPKBSloWD
 spfRgBjk6FC+T/C98q7UnvuOPabDqoFCC+X8xFF6KSCuP6wo2zPWEpJRJk428HCIJrsIph
 kXkQsXb7GyMZz1Ssnx8vdueXDiLfKDc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1747645951;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=CxQ89a9q28JTurhDVDxMqnAC8LAbCOepjWefrVxQTkY=;
 b=tM1p0OIvhTm8krEgzW8x2kQjfiobi1OSRcjOjhLjiSox/nWUbTl95bwpEles6KJZ7cH0vQ
 Vrr13ZYOTlOPBPDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1747645950; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=CxQ89a9q28JTurhDVDxMqnAC8LAbCOepjWefrVxQTkY=;
 b=l7XNFP3/sEjhh2tO+iZsKl7jV1UOPf3m7VW/+pzQ8pcLlaFPon9p3xcgoJzr0ApCwBQJMT
 lSY6+N9cGKIzS7jsD5zekotPrGUJW4ySTRxg/woUjooZD8dU7i/YGMq+eI79wTWmfr/7mv
 cJ+ygDD9y3V+i5HBTL2P/AcZybWVmbQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1747645950;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=CxQ89a9q28JTurhDVDxMqnAC8LAbCOepjWefrVxQTkY=;
 b=VK75ClBa3QOoerGkYdkyn4ldKcOGOhBu2tdKTcIzZjn3oY357PZTwQftaXpShxSgr43F20
 FvIFy9cftu7eDsAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 806401372E;
 Mon, 19 May 2025 09:12:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id biT7Hf71KmgKaAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 19 May 2025 09:12:30 +0000
Message-ID: <ab7c28cf-0c00-46b6-a2eb-97cee71b5e5c@suse.de>
Date: Mon, 19 May 2025 11:12:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dummycon: Trigger redraw when switching consoles with
 deferred takeover
To: Javier Martinez Canillas <javierm@redhat.com>,
 gregkh@linuxfoundation.org, hdegoede@redhat.com, arvidjaar@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20250519071026.11133-1-tzimmermann@suse.de>
 <874ixhotss.fsf@minerva.mail-host-address-is-not-set>
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
In-Reply-To: <874ixhotss.fsf@minerva.mail-host-address-is-not-set>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -1.30
X-Spamd-Result: default: False [-1.30 / 50.00]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCPT_COUNT_SEVEN(0.00)[8];
 FREEMAIL_TO(0.00)[redhat.com,linuxfoundation.org,gmail.com];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCVD_TLS_ALL(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2];
 URIBL_BLOCKED(0.00)[suse.de:email,suse.de:mid,suse.com:url,lists.freedesktop.org:email,imap1.dmz-prg2.suse.org:helo];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,
 lists.freedesktop.org:email, suse.com:url, suse.de:email, suse.de:mid]
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



Am 19.05.25 um 11:04 schrieb Javier Martinez Canillas:
> Thomas Zimmermann <tzimmermann@suse.de> writes:
>
> Hello Thomas,
>
>> Signal vt subsystem to redraw console when switching to dummycon
>> with deferred takeover enabled. Makes the console switch to fbcon
>> and displays the available output.
>>
>> With deferred takeover enabled, dummycon acts as the placeholder
>> until the first output to the console happens. At that point, fbcon
>> takes over. If the output happens while dummycon is not active, it
>> cannot inform fbcon. This is the case if the vt subsystem runs in
>> graphics mode.
>>
>> A typical graphical boot starts plymouth, a display manager and a
>> compositor; all while leaving out dummycon. Switching to a text-mode
>> console leaves the console with dummycon even if a getty terminal
>> has been started.
>>
>> Returning true from dummycon's con_switch helper signals the vt
>> subsystem to redraw the screen. If there's output available dummycon's
>> con_putc{s} helpers trigger deferred takeover of fbcon, which sets a
>> display mode and displays the output. If no output is available,
>> dummycon remains active.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Reported-by: Andrei Borzenkov <arvidjaar@gmail.com>
>> Closes: https://bugzilla.suse.com/show_bug.cgi?id=1242191
>> Tested-by: Andrei Borzenkov <arvidjaar@gmail.com>
>> Fixes: 83d83bebf401 ("console/fbcon: Add support for deferred console takeover")
>> Cc: Hans de Goede <hdegoede@redhat.com>
>> Cc: linux-fbdev@vger.kernel.org
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: <stable@vger.kernel.org> # v4.19+
>> ---
>>   drivers/video/console/dummycon.c | 15 ++++++++++-----
>>   1 file changed, 10 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/video/console/dummycon.c b/drivers/video/console/dummycon.c
>> index 139049368fdc..afb8e4d2fc34 100644
>> --- a/drivers/video/console/dummycon.c
>> +++ b/drivers/video/console/dummycon.c
>> @@ -85,6 +85,12 @@ static bool dummycon_blank(struct vc_data *vc, enum vesa_blank_mode blank,
>>   	/* Redraw, so that we get putc(s) for output done while blanked */
>>   	return true;
>>   }
>> +
>> +static bool dummycon_switch(struct vc_data *vc)
>> +{
>> +	/* Redraw, so that we get putc(s) for output done while switched away */
> Maybe this comment could be a little bit more verbose about why this is needed
> for the framebuffer console deferred takeover case? It doesn't have to be as
> elaborated as how you have it in the commit message, but more information would
> be nice IMO.

I copied that from dummycon_blank(), as I assumed that the relevant 
people know why. But yeah, I can elaborate a bit more. Best regards Thomas
>
>> +	return true;
>> +}
> Acked-by: Javier Martinez Canillas <javierm@redhat.com>
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

