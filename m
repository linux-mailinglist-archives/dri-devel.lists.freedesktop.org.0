Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DAF9A21CE7
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 13:01:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF72810E7DA;
	Wed, 29 Jan 2025 12:01:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="jC3t9/Jy";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rPrXtOuT";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jC3t9/Jy";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rPrXtOuT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0558510E7DA
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 12:01:29 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 919962110B;
 Wed, 29 Jan 2025 12:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1738152087; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=u9IgwYfc7yuCsOswmAcF05Wi0LeiZ3irV/DqdXvDu3M=;
 b=jC3t9/Jy8R5wT9cHRpFABuJm++qb0PfYe9mNQfbl4hWuuJ+MDdxmlRb1x1qNrAVh67TX7R
 Ze4v0wNZBz1AOrJaWs15hHm1BFLlNfP4HIOBr67b3p2VNx4mH/F3NTjzlIi1DG29eMEfrR
 X+ej51oOMumoB9Gnah0wuMjQFmhh454=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1738152087;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=u9IgwYfc7yuCsOswmAcF05Wi0LeiZ3irV/DqdXvDu3M=;
 b=rPrXtOuT8AAhw4bPZuA1fiKtjZLEz+B5mZcTN2KTh8RJMLk2C+UffdStIHzZu9vMv452/8
 H/yzl0s1lw5VNoAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1738152087; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=u9IgwYfc7yuCsOswmAcF05Wi0LeiZ3irV/DqdXvDu3M=;
 b=jC3t9/Jy8R5wT9cHRpFABuJm++qb0PfYe9mNQfbl4hWuuJ+MDdxmlRb1x1qNrAVh67TX7R
 Ze4v0wNZBz1AOrJaWs15hHm1BFLlNfP4HIOBr67b3p2VNx4mH/F3NTjzlIi1DG29eMEfrR
 X+ej51oOMumoB9Gnah0wuMjQFmhh454=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1738152087;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=u9IgwYfc7yuCsOswmAcF05Wi0LeiZ3irV/DqdXvDu3M=;
 b=rPrXtOuT8AAhw4bPZuA1fiKtjZLEz+B5mZcTN2KTh8RJMLk2C+UffdStIHzZu9vMv452/8
 H/yzl0s1lw5VNoAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 73868137DB;
 Wed, 29 Jan 2025 12:01:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id cMb0GpcYmmfnFQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 29 Jan 2025 12:01:27 +0000
Message-ID: <bc902ac5-ab1e-4d16-bc27-163123cb2d3f@suse.de>
Date: Wed, 29 Jan 2025 13:01:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/16] drm/ast: astdp: Look up mode index from table
To: Jocelyn Falempe <jfalempe@redhat.com>, airlied@redhat.com,
 dri-devel@lists.freedesktop.org
References: <20250129095840.20629-1-tzimmermann@suse.de>
 <20250129095840.20629-15-tzimmermann@suse.de>
 <b824e913-0d2f-4a09-b1fa-da89375b47e4@redhat.com>
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
In-Reply-To: <b824e913-0d2f-4a09-b1fa-da89375b47e4@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-0.996]; MIME_GOOD(-0.10)[text/plain];
 MID_RHS_MATCH_FROM(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[]; TO_DN_SOME(0.00)[];
 RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_THREE(0.00)[3]; FROM_EQ_ENVFROM(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
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


Am 29.01.25 um 12:27 schrieb Jocelyn Falempe:
> On 29/01/2025 10:55, Thomas Zimmermann wrote:
>> Replace the large switch statement with a look-up table when selecting
>> the mode index. Makes the code easier to read. The table is sorted by
>> resolutions; if run-time overhead from traversal becomes significant,
>> binary search would be a possible optimization.
>>
>> The mode index requires a refresh-rate index to be added or subtracted,
>> which still requires a minimal switch.
>>
> I think there is a problem in the mode_index/refresh_index 
> calculation, see below:
>
>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Suggested-by: Jocelyn Falempe <jfalempe@redhat.com>
>> ---
>>   drivers/gpu/drm/ast/ast_dp.c | 116 +++++++++++++++++------------------
>>   1 file changed, 55 insertions(+), 61 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
>> index e1ca012e639be..70fa754432bca 100644
>> --- a/drivers/gpu/drm/ast/ast_dp.c
>> +++ b/drivers/gpu/drm/ast/ast_dp.c
>> @@ -14,80 +14,74 @@
>>   #include "ast_drv.h"
>>   #include "ast_vbios.h"
>>   +struct ast_astdp_mode_index_table_entry {
>> +    unsigned int hdisplay;
>> +    unsigned int vdisplay;
>> +    unsigned int mode_index;
>> +};
>> +
>> +/* FIXME: Do refresh rate and flags actually matter? */
>> +static const struct ast_astdp_mode_index_table_entry 
>> ast_astdp_mode_index_table[] = {
>> +    {  320,  240, ASTDP_320x240_60 },
>> +    {  400,  300, ASTDP_400x300_60 },
>> +    {  512,  384, ASTDP_512x384_60 },
>> +    {  640,  480, ASTDP_640x480_60 },
>> +    {  800,  600, ASTDP_800x600_56 },
>> +    { 1024,  768, ASTDP_1024x768_60 },
>> +    { 1152,  864, ASTDP_1152x864_75 },
>> +    { 1280,  800, ASTDP_1280x800_60_RB },
>> +    { 1280, 1024, ASTDP_1280x1024_60 },
>> +    { 1360,  768, ASTDP_1366x768_60 }, // same as 1366x786
>> +    { 1366,  768, ASTDP_1366x768_60 },
>> +    { 1440,  900, ASTDP_1440x900_60_RB },
>> +    { 1600,  900, ASTDP_1600x900_60_RB },
>> +    { 1600, 1200, ASTDP_1600x1200_60 },
>> +    { 1680, 1050, ASTDP_1680x1050_60_RB },
>> +    { 1920, 1080, ASTDP_1920x1080_60 },
>> +    { 1920, 1200, ASTDP_1920x1200_60 },
>> +    { 0 }
>> +};
>> +
>> +static int __ast_astdp_get_mode_index(unsigned int hdisplay, 
>> unsigned int vdisplay)
>> +{
>> +    const struct ast_astdp_mode_index_table_entry *entry = 
>> ast_astdp_mode_index_table;
>> +
>> +    while (entry->hdisplay && entry->vdisplay) {
>> +        if (entry->hdisplay == hdisplay && entry->vdisplay == vdisplay)
>> +            return entry->mode_index;
>> +        ++entry;
>> +    }
>> +
>> +    return -EINVAL;
>> +}
>> +
>>   static int ast_astdp_get_mode_index(const struct ast_vbios_enhtable 
>> *vmode)
>>   {
>> +    int mode_index;
>>       u8 refresh_rate_index;
>>   +    mode_index = __ast_astdp_get_mode_index(vmode->hde, vmode->vde);
>> +    if (mode_index < 0)
>> +        return mode_index;
>> +
>>       if (vmode->refresh_rate_index < 1 || vmode->refresh_rate_index 
>> > 255)
>>           return -EINVAL;
>> -
>>       refresh_rate_index = vmode->refresh_rate_index - 1;
>>   -    switch (vmode->hde) {
>> -    case 320:
>> -        if (vmode->vde == 240)
>> -            return ASTDP_320x240_60;
>> -        break;
>> -    case 400:
>> -        if (vmode->vde == 300)
>> -            return ASTDP_400x300_60;
>> -        break;
>> -    case 512:
>> -        if (vmode->vde == 384)
>> -            return ASTDP_512x384_60;
>> -        break;
>> -    case 640:
>> -        if (vmode->vde == 480)
>> -            return (u8)(ASTDP_640x480_60 + (u8)refresh_rate_index);
>> -        break;
>> -    case 800:
>> -        if (vmode->vde == 600)
>> -            return (u8)(ASTDP_800x600_56 + (u8)refresh_rate_index);
>> -        break;
>> -    case 1024:
>> -        if (vmode->vde == 768)
>> -            return (u8)(ASTDP_1024x768_60 + (u8)refresh_rate_index);
>> -        break;
>> -    case 1152:
>> -        if (vmode->vde == 864)
>> -            return ASTDP_1152x864_75;
>> -        break;
>> -    case 1280:
>> -        if (vmode->vde == 800)
>> -            return (u8)(ASTDP_1280x800_60_RB - (u8)refresh_rate_index);
>> -        if (vmode->vde == 1024)
>> -            return (u8)(ASTDP_1280x1024_60 + (u8)refresh_rate_index);
>> -        break;
>> -    case 1360:
>> -    case 1366:
>> -        if (vmode->vde == 768)
>> -            return ASTDP_1366x768_60;
>> -        break;
>> -    case 1440:
>> -        if (vmode->vde == 900)
>> -            return (u8)(ASTDP_1440x900_60_RB - (u8)refresh_rate_index);
>> -        break;
>> -    case 1600:
>> -        if (vmode->vde == 900)
>> -            return (u8)(ASTDP_1600x900_60_RB - (u8)refresh_rate_index);
>> -        if (vmode->vde == 1200)
>
>> -        break;
>> -    case 1680:
>> -        if (vmode->vde == 1050)
>> -            return (u8)(ASTDP_1680x1050_60_RB - 
>> (u8)refresh_rate_index);
>> -        break;
>> -    case 1920:
>> -        if (vmode->vde == 1080)
>> -            return ASTDP_1920x1080_60;
>> -        if (vmode->vde == 1200)
>> -            return ASTDP_1920x1200_60;
>> +    /* FIXME: Why are we doing this? */
>> +    switch (mode_index) {
>> +    case ASTDP_1280x800_60_RB:
>> +    case ASTDP_1440x900_60_RB:
>> +    case ASTDP_1600x900_60_RB:
>> +    case ASTDP_1680x1050_60_RB:
>> +        mode_index = (u8)(mode_index - (u8)refresh_rate_index);
>>           break;
> I think you should add this to do the same as before:

It's intentional. The refresh-rate index stored 
in vmode->refresh_rate_index is at least one. The function then 
subtracts 1 to compute refresh_rate_index, so we have 0 by default. And 
that's what we always used for cases that did not explicitly add 
refresh_rate_index before. I guess I should add this to the commit 
message's second paragraph.

Apart from that, I honestly don't understand the purpose of this 
computation.

Best regards
Thomas

>
>     case ASTDP_640x480_60:
>     case ASTDP_800x600_56:
>     case ASTDP_1024x768_60:
>     case ASTDP_1280x1024_60:
>         mode_index = (u8)(mode_index + (u8)refresh_rate_index);
>           break;
>     default:
>         break;
>
>>       default:
>> +        mode_index = (u8)(mode_index + (u8)refresh_rate_index);
>>           break;
>>       }
>>   -    return -EINVAL;
>> +    return mode_index;
>>   }
>>     static bool ast_astdp_is_connected(struct ast_device *ast)
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

