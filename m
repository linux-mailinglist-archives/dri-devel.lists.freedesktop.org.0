Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDCB2A2E797
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 10:24:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3409710E4CD;
	Mon, 10 Feb 2025 09:24:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="ZAkt0eos";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4viZoKU7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZI1ci0Mc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4eMq+nmF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E61810E4CD
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 09:24:35 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 74E511F38F;
 Mon, 10 Feb 2025 09:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1739179473; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=6GMnFZTed3LWi7FrjeawM5AnnfqGpHZ6w0QkYc1dZhc=;
 b=ZAkt0eosVvcuvZ2JldSb7M7rUqgeJHxnxUXrr+21Xv5VgU40bliDb/rDQZmFWj9fRVFzCQ
 jSJzVFUqUXXxmnuQcVmJZFBumvPgYsPJ3pT1aD8ZwR188vMYnrGf87K7/VxdY/IuzpV9qA
 +vTz0Ya8jptZnRX3wD1XOdSSCUSTa20=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1739179473;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=6GMnFZTed3LWi7FrjeawM5AnnfqGpHZ6w0QkYc1dZhc=;
 b=4viZoKU7qLfLPNG7oIwq5NwIPSq8FhKdmVtxFO38eLhVvRAB7Rsecvcu6TPZpIwXspcXw3
 yRitJKqc5QsNUkAA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1739179472; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=6GMnFZTed3LWi7FrjeawM5AnnfqGpHZ6w0QkYc1dZhc=;
 b=ZI1ci0McmOXN/BO5ejMRgEoXFBiZPDyJ4hQ7HlOHjASNUIZmFygsR//BnTa7/1g8NF45py
 MOuytZGR7M/bRHFAbvkAx+2We+cOqxvp6u25WBaIiqShoJxi5ZqnHTIBphCmGJWGg6FlKf
 6XWfC8UxFTgug8JmTXQ0SV4f4HZzQiY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1739179472;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=6GMnFZTed3LWi7FrjeawM5AnnfqGpHZ6w0QkYc1dZhc=;
 b=4eMq+nmFTvY6tVSp5DkVOfTZ/LhRlZK95ZVRyQ7RLsaL5/PXUqq3YI0ZrpCfsJPEJNg78L
 I2zhplI28dieZSCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4408A13A62;
 Mon, 10 Feb 2025 09:24:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id Uj4dD9DFqWe9NQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 10 Feb 2025 09:24:32 +0000
Message-ID: <e07fbd60-e362-482d-8233-409a366c9b2f@suse.de>
Date: Mon, 10 Feb 2025 10:24:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 00/13] fbdev: core: Deduplicate cfb/sys drawing
 fbops
To: =?UTF-8?Q?Kajt=C3=A1r_Zsolt?= <soci@c64.rulez.org>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20250207041818.4031-1-soci@c64.rulez.org>
 <c4db73a2-12a7-41f4-a175-332c44f51bc4@suse.de>
 <8c0aa1f0-27f8-befa-2b27-76e9faf7fc6d@c64.rulez.org>
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
In-Reply-To: <8c0aa1f0-27f8-befa-2b27-76e9faf7fc6d@c64.rulez.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-0.998]; MIME_GOOD(-0.10)[text/plain];
 MID_RHS_MATCH_FROM(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[]; TO_DN_SOME(0.00)[];
 RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_THREE(0.00)[3]; FROM_EQ_ENVFROM(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo, suse.de:mid,
 bootlin.com:url]
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

Am 08.02.25 um 01:51 schrieb Kajtár Zsolt:
> Hello Thomas!
>
>> No it's not. Major code abstractions behind preprocessor tokens are
>> terrible to maintain.
> Hmm, don't get me wrong but I'm not sure if the changes were really
> checked in detail. At first sight it might look like I'm adding tons of
> new macro ridden code in those header files replacing cleaner code.
>
> While actually that's just how the I/O version currently is, copied and
> white space cleaned (as it was requested) plus comment style matched
> with sys.
>
> The only new thing which hides the mentioned abstraction a little more
> is FB_MEM, which replaced __iomem. But that's a tradeoff to be able to
> use the same source for system as well.
>
> Or the concern is that now system memory specific code might get mixed
> in there by mistake?
>
> It was not planned as the final version, the current maintainer asked
> for addressing some pre-existing quality issues with further patches but
> otherwise accepted the taken approach.
>
>> It's also technically not possible to switch between system and I/O
>> memory at will. These are very different things.
> Yes, there are architectures where these two don't mix at all, I'm aware
> of that. I need that on x86 only (for old hw), and there it seems
> doable. Depending on the resolution either the aperture or the defio
> memory is mapped. If the framebuffer is not remapped after a mode change
> that's an application bug. Otherwise it's harmless as both are always
> there and don't change.
>
> I'd better like to find out problems sooner than later, so if you or
> anyone else could share any concerns that'd be really helpful!

First of all, commit 779121e9f175 ("fbdev: Support for byte-reversed 
framebuffer formats") isn't super complicated AFAICT. I can be 
implemented in the sys_ helpers as well. It seems like you initially did 
that.

About the series at hand: generating code by macro expansion is good for 
simple cases. I've done that in several places within fbdev myself, such 
as [1]. But if the generated code requires Turing-completeness, it 
becomes much harder to see through the macros and understand what is 
going on. This makes code undiscoverable; and discoverability is a 
requirement for maintenance.

[1] https://elixir.bootlin.com/linux/v6.13.1/source/include/linux/fb.h#L700

Then there's type-safety and type-casting. The current series defeats it 
by casting various pointers to whatever the macros define. For example, 
looking at the copyarea patches, they use screen_base [2] from struct 
fb_info. The thing is, using screen_base is wrong for sys_copyarea(). 
The function should use 'screen_buffer' instead. It works because both 
fields share the same bits of a union. Using screen_base is a bug in the 
current implementation that should be fixed, while this patch series 
would set it in stone.

[2] 
https://elixir.bootlin.com/linux/v6.13.1/source/drivers/video/fbdev/core/syscopyarea.c#L340

Next, if you look through the commit history, you'll find that there are 
several commits with performance improvements. Memory access in the sys 
variants is not guaranteed to be 32-bit aligned by default. The compiler 
has to assume unaligned access, which results in slower code. Hence, 
some manual intervention has to be done. It's too easy to accidentally 
mess this up by using nontransparent macros for access.


If you want to do meaningful work here, please do actual refactoring 
instead of throwing unrelated code together. First of all, never use 
macros, but functions. You can supply callback functions to access the 
framebuffer. Each callback should know whether it operates on 
screen_base or screen_buffer.

But using callbacks for individual reads and writes can have runtime 
overhead. It's better to operate on complete scanlines. The current 
helpers are already organized that way. Again, from the copyarea helper:

sys_copyarea()
{
     // first prepare

     // then go through the scanlines
     while (height) {
         do_something_for_the_current_scanline().
     }
}

The inner helper do_something_...() has to be written for various cfb 
and sys cases and can be given as function pointer to a generic helper.

Best regards
Thomas


>
>> If you want that pixel-reversing feature in sys_ helpers, please
>> implement it there.
> Actually that's what I did first. Then did it once more by adapting the
> I/O version as that gave me more confidence that it'll work exactly the
> same and there's less room for error.

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

