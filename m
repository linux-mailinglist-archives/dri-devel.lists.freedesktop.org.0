Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5235F92A367
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2024 15:02:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0637910E351;
	Mon,  8 Jul 2024 13:02:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="pFh5l4Uz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="k+sriyS1";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pFh5l4Uz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="k+sriyS1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3377C10E351
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2024 13:02:51 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 78D5321A17;
 Mon,  8 Jul 2024 13:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1720443769; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=//OyM6WXhxeBXq9mX4zuyHJL3Nn1GlAXBN2aGMV5Qs0=;
 b=pFh5l4UzM/YsDJPX2qV9gq0f/Np1/HUgO1GxYvkc8aCmW7FZO2Lvo59yuq8CyEL4+YwA3a
 8/BtG9SxaHl3wlVQqfHJ+1mssxQKEaVA+6UdLmAdVTZnbdJIuVOXHOY4yxpvuOEyUFx0qT
 GKToOvqiqAF+S+LWaC161ZtK3c1wsVA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1720443769;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=//OyM6WXhxeBXq9mX4zuyHJL3Nn1GlAXBN2aGMV5Qs0=;
 b=k+sriyS1si+wgGzoVtuS1q/O/nG+vokPpkT6gD7crMMCl6bPeatfsZbHTHKzG0oIL0KLFw
 iOjPiXlF5xsU3OBQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=pFh5l4Uz;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=k+sriyS1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1720443769; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=//OyM6WXhxeBXq9mX4zuyHJL3Nn1GlAXBN2aGMV5Qs0=;
 b=pFh5l4UzM/YsDJPX2qV9gq0f/Np1/HUgO1GxYvkc8aCmW7FZO2Lvo59yuq8CyEL4+YwA3a
 8/BtG9SxaHl3wlVQqfHJ+1mssxQKEaVA+6UdLmAdVTZnbdJIuVOXHOY4yxpvuOEyUFx0qT
 GKToOvqiqAF+S+LWaC161ZtK3c1wsVA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1720443769;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=//OyM6WXhxeBXq9mX4zuyHJL3Nn1GlAXBN2aGMV5Qs0=;
 b=k+sriyS1si+wgGzoVtuS1q/O/nG+vokPpkT6gD7crMMCl6bPeatfsZbHTHKzG0oIL0KLFw
 iOjPiXlF5xsU3OBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 342971396E;
 Mon,  8 Jul 2024 13:02:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id VmSBC3nji2ZUdgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 08 Jul 2024 13:02:49 +0000
Message-ID: <3e100a03-e4ea-4a0d-9e4c-e92e79cfe259@suse.de>
Date: Mon, 8 Jul 2024 15:02:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/7] drm/mgag200: Add vblank support
To: Jocelyn Falempe <jfalempe@redhat.com>, airlied@redhat.com,
 sam@ravnborg.org, emil.l.velikov@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, Gerd Hoffmann <kraxel@redhat.com>
References: <20240705114900.572-1-tzimmermann@suse.de>
 <20240705114900.572-7-tzimmermann@suse.de>
 <1ff58346-c5cb-4fcf-9583-e048422fe7f7@redhat.com>
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
In-Reply-To: <1ff58346-c5cb-4fcf-9583-e048422fe7f7@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 78D5321A17
X-Spam-Score: -3.00
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.00 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 XM_UA_NO_VERSION(0.01)[]; MX_GOOD(-0.01)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 TO_DN_SOME(0.00)[];
 FREEMAIL_TO(0.00)[redhat.com,ravnborg.org,gmail.com,linux.intel.com,kernel.org,ffwll.ch];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; RCVD_TLS_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]; RCVD_COUNT_TWO(0.00)[2];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 MID_RHS_MATCH_FROM(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCPT_COUNT_SEVEN(0.00)[10]; RCVD_VIA_SMTP_AUTH(0.00)[];
 TAGGED_RCPT(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,
 imap1.dmz-prg2.suse.org:rdns, suse.de:dkim]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
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

Hi Jocelyn

Am 08.07.24 um 14:46 schrieb Jocelyn Falempe:
>
>
> On 05/07/2024 13:47, Thomas Zimmermann wrote:
>> There's no VBLANK interrupt on Matrox chipsets. The workaround that is
>> being used here and in other free Matrox drivers is to program 
>> <linecomp>
>> to the value of <vblkstr> and enable the VLINE interrupt. This triggers
>> an interrupt at the time when VBLANK begins.
>>
>> VLINE uses separate registers for enabling and clearing pending 
>> interrupts.
>> No extra synchronization between irq handler and the rest of the 
>> driver is
>> required.
>
> Thanks for this patch, I have a few comments below:

They make sense. I'll implement them.

[...]
>>   #define    MGAREG_IEN        0x1e1c
>> +#define MGAREG_IEN_VLINEIEN    BIT(5)
>>     #define    MGAREG_VCOUNT        0x1e20
>
>
> Do you know what happens if the IRQ doesn't work (ie not receiving any 
> IRQ)?

We'd miss the vblank timeout and the display would be slow or static.

> When testing the DMA, I remember that on a few machines, I never get 
> the Softrap IRQ. I don't know if it was a DMA engine problem, or if 
> it's the mgag200 IRQ that was not connected properly.

What to do depends. Not having an IRQ assigned is a problem in the BIOS 
configuration. All other DRM drivers expect the IRQ to be present and 
mgag200 would not be any different here. Users should assign an IRQ in 
BIOS. If there's really a hardware problem on some Matrox chips, we'd 
have to revert the patch. There's little use in handling separate vblank 
and non-vblank code paths. Most other patches in this patchset would 
still remain useful, I think.

OTOH other Matrox drivers have implemented vblank support since forever. 
I'd expect (well, hope at least :) that this simply isn't a problem.

>
> I will try to find this machine, and test this series on it.
>

Thanks a lot.

Best regards
Thomas

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

