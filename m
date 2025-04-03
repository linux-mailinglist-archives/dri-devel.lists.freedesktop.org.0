Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B126AA79CF4
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 09:28:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8DC310E912;
	Thu,  3 Apr 2025 07:28:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="IQ+zAjty";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PvjOi4qQ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IQ+zAjty";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PvjOi4qQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59DF010E912
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Apr 2025 07:28:12 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 061DC1F385;
 Thu,  3 Apr 2025 07:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1743665291; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=At9CPnlv3Dc5Dwf9vP+EOpTynfMJ3E70NZvD15Ky6JY=;
 b=IQ+zAjtyuaCSl6QD4XDpPcEneZGraj42o6zULgHMnaxdu2Va9hVmo84uopWDDS/3VDEyG7
 rjKA2iY6c3lB62vNSZS1MDrIg4kdkNafb5pkDuP98lyXgqIeddJztlRjSmCJCAVf0pPPQY
 tf/IUftgdRNehMeSG17UWthoCtB2qno=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1743665291;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=At9CPnlv3Dc5Dwf9vP+EOpTynfMJ3E70NZvD15Ky6JY=;
 b=PvjOi4qQ2IhywfDsmHaePiRBfKGWABp/8iuam3xBvt9Eujpas6ZmloYQ2GC8tcYRTLjfN3
 eoLmWrwmfB+u37BA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1743665291; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=At9CPnlv3Dc5Dwf9vP+EOpTynfMJ3E70NZvD15Ky6JY=;
 b=IQ+zAjtyuaCSl6QD4XDpPcEneZGraj42o6zULgHMnaxdu2Va9hVmo84uopWDDS/3VDEyG7
 rjKA2iY6c3lB62vNSZS1MDrIg4kdkNafb5pkDuP98lyXgqIeddJztlRjSmCJCAVf0pPPQY
 tf/IUftgdRNehMeSG17UWthoCtB2qno=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1743665291;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=At9CPnlv3Dc5Dwf9vP+EOpTynfMJ3E70NZvD15Ky6JY=;
 b=PvjOi4qQ2IhywfDsmHaePiRBfKGWABp/8iuam3xBvt9Eujpas6ZmloYQ2GC8tcYRTLjfN3
 eoLmWrwmfB+u37BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DA08A13A2C;
 Thu,  3 Apr 2025 07:28:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id VoHcM4o47mdoRgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 03 Apr 2025 07:28:10 +0000
Message-ID: <6452ce55-b237-47b1-8893-15eceeeb4371@suse.de>
Date: Thu, 3 Apr 2025 09:28:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] drm/udl: Return error if vendor descriptor is too
 short
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: airlied@redhat.com, sean@poorly.run, dri-devel@lists.freedesktop.org
References: <20250401161929.283244-1-tzimmermann@suse.de>
 <20250401161929.283244-7-tzimmermann@suse.de>
 <CAMeQTsYcxHyFVn_BHUpxrfMsXZUX07Unm1rBmMYo6i1SMgj3VA@mail.gmail.com>
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
In-Reply-To: <CAMeQTsYcxHyFVn_BHUpxrfMsXZUX07Unm1rBmMYo6i1SMgj3VA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_TO(0.00)[gmail.com]; TAGGED_RCPT(0.00)[];
 MIME_TRACE(0.00)[0:+]; TO_DN_SOME(0.00)[]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_THREE(0.00)[4]; RCVD_TLS_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email]
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

Am 02.04.25 um 15:16 schrieb Patrik Jakobsson:
> On Tue, Apr 1, 2025 at 6:23 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>> There need to be least 5 bytes in the vendor descriptor. Return
>> an error otherwise. Also change the branching to early-out on
>> the error. Adjust indention of the rest of the parser function.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>   drivers/gpu/drm/udl/udl_main.c | 72 +++++++++++++++++-----------------
>>   1 file changed, 36 insertions(+), 36 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/udl/udl_main.c b/drivers/gpu/drm/udl/udl_main.c
>> index 4291ddb7158c4..58d6065589d3a 100644
>> --- a/drivers/gpu/drm/udl/udl_main.c
>> +++ b/drivers/gpu/drm/udl/udl_main.c
>> @@ -45,43 +45,43 @@ static int udl_parse_vendor_descriptor(struct udl_device *udl)
>>                  goto unrecognized;
>>          len = ret;
>>
>> -       if (len > 5) {
>> -               DRM_INFO("vendor descriptor length: %u data:%11ph\n",
>> -                        len, desc);
>> -
>> -               if ((desc[0] != len) ||    /* descriptor length */
>> -                   (desc[1] != 0x5f) ||   /* vendor descriptor type */
>> -                   (desc[2] != 0x01) ||   /* version (2 bytes) */
>> -                   (desc[3] != 0x00) ||
>> -                   (desc[4] != len - 2))  /* length after type */
>> -                       goto unrecognized;
>> -
>> -               desc_end = desc + len;
>> -               desc += 5; /* the fixed header we've already parsed */
>> -
>> -               while (desc < desc_end) {
>> -                       u8 length;
>> -                       u16 key;
>> -
>> -                       key = le16_to_cpu(*((u16 *) desc));
>> -                       desc += sizeof(u16);
>> -                       length = *desc;
>> -                       desc++;
>> -
>> -                       switch (key) {
>> -                       case 0x0200: { /* max_area */
>> -                               u32 max_area;
>> -                               max_area = le32_to_cpu(*((u32 *)desc));
>> -                               DRM_DEBUG("DL chip limited to %d pixel modes\n",
>> -                                       max_area);
>> -                               udl->sku_pixel_limit = max_area;
>> -                               break;
>> -                       }
>> -                       default:
>> -                               break;
>> -                       }
>> -                       desc += length;
>> +       if (len < 5)
> Hi Thomas,
>
> Shouldn't this be if (len <= 5)? The old code only parsed if the
> descriptor returned at least 6 bytes.

Right, I also noticed that. But I though it was a mistake. The header is 
5 bytes and if there are no key-value pairs it's still a valid 
descriptor AFAICT. Patch 9 of the series sets a default for the pixel 
limit and the adapter would be usable. I rather not change the new 
logic, but add an explanation to the commit description. Ok?

Best regards
Thomas

>
> -Patrik
>
>> +               goto unrecognized;
>> +
>> +       DRM_INFO("vendor descriptor length: %u data:%11ph\n", len, desc);
>> +
>> +       if ((desc[0] != len) ||    /* descriptor length */
>> +           (desc[1] != 0x5f) ||   /* vendor descriptor type */
>> +           (desc[2] != 0x01) ||   /* version (2 bytes) */
>> +           (desc[3] != 0x00) ||
>> +           (desc[4] != len - 2))  /* length after type */
>> +               goto unrecognized;
>> +
>> +       desc_end = desc + len;
>> +       desc += 5; /* the fixed header we've already parsed */
>> +
>> +       while (desc < desc_end) {
>> +               u8 length;
>> +               u16 key;
>> +
>> +               key = le16_to_cpu(*((u16 *)desc));
>> +               desc += sizeof(u16);
>> +               length = *desc;
>> +               desc++;
>> +
>> +               switch (key) {
>> +               case 0x0200: { /* max_area */
>> +                       u32 max_area = le32_to_cpu(*((u32 *)desc));
>> +
>> +                       DRM_DEBUG("DL chip limited to %d pixel modes\n",
>> +                                 max_area);
>> +                       udl->sku_pixel_limit = max_area;
>> +                       break;
>> +               }
>> +               default:
>> +                       break;
>>                  }
>> +               desc += length;
>>          }
>>
>>          goto success;
>> --
>> 2.49.0
>>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

