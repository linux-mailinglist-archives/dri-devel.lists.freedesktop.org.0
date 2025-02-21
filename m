Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E79A3F167
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 11:08:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 045D810E231;
	Fri, 21 Feb 2025 10:08:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="LQF5AnVY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WLcapchc";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lKrGFb/s";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Oulub/yC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B4A810E194
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 10:08:22 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EBE8C1F78A;
 Fri, 21 Feb 2025 10:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1740132501; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=M2e6KH/BHcFK6w9SYbHcPx6nqA1qpuxt618HD/sPm9I=;
 b=LQF5AnVYcLPwoUAaF2Bux+O59hCHAg6pl0zqiienZa7pQ4gvMY1PpgPpjwuZVrF8ZDKKpf
 LjOteY2AeuwSxMSm1St3s7ejjMGetWwS66KGBEGLl6z5snb3SAsox8bmKkKYu8xbUpOlBJ
 13eVsZCCqwC2ZqgfhDzxXWYmlFTZ0zo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1740132501;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=M2e6KH/BHcFK6w9SYbHcPx6nqA1qpuxt618HD/sPm9I=;
 b=WLcapchcQAQV8ZOFP+V3hwPjvdEPgPjJgGK+oZwFKvo+c3s2ayOg9oH8N7jbf3H7oR3eou
 4NxoU8q4tY+j4BAA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1740132499; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=M2e6KH/BHcFK6w9SYbHcPx6nqA1qpuxt618HD/sPm9I=;
 b=lKrGFb/skhwoYPPUVwSDcJW0EBjnr2uy+nfYrcyElx4exsS5CnMWZrAHIeQaS2BxLRzSTH
 LRhrkqsBRDfwgbOjbZ+zLPS2INLgWtN1L/nPh51l6Cps3I/LPfxVyC6WAPQqpTRm3vrsEp
 4gh0h4aiWJXnVu93NI8oLcHmwg2Ypkc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1740132499;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=M2e6KH/BHcFK6w9SYbHcPx6nqA1qpuxt618HD/sPm9I=;
 b=Oulub/yCIhXM878lgyw9zPHPgLLNUSxAK7kXdKfRRv6S9EWcIdOxS23F73zZol16noWM+X
 DGDIsV61UNIiQ5Dw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 74CDB136AD;
 Fri, 21 Feb 2025 10:08:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id sywjG5NQuGd7MwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 21 Feb 2025 10:08:19 +0000
Message-ID: <cde8b955-a846-4be9-942b-64ca05550368@suse.de>
Date: Fri, 21 Feb 2025 11:08:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/25] drm/dumb-buffers: Provide helper to set pitch
 and size
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, imx@lists.linux.dev,
 linux-samsung-soc@vger.kernel.org, nouveau@lists.freedesktop.org,
 virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-tegra@vger.kernel.org, intel-xe@lists.freedesktop.org,
 xen-devel@lists.xenproject.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20250218142542.438557-1-tzimmermann@suse.de>
 <20250218142542.438557-3-tzimmermann@suse.de>
 <dcd59a75-7945-4a2e-99f9-3abbb3e9de14@ideasonboard.com>
 <355ed315-61fa-4a9d-b72b-8d5bc7b5a16c@suse.de>
 <596b960e-71f8-4c2c-9abe-058206df1dfb@ideasonboard.com>
 <87ca2b81-a67a-468b-ae2b-30d02a3a64bc@suse.de>
 <CAMuHMdVnZTj-8bqsbbZdhp0H7Bwib8GkEuXPcKNZjdo_jRRXgg@mail.gmail.com>
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
In-Reply-To: <CAMuHMdVnZTj-8bqsbbZdhp0H7Bwib8GkEuXPcKNZjdo_jRRXgg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_TLS_ALL(0.00)[]; RCPT_COUNT_TWELVE(0.00)[21];
 MIME_TRACE(0.00)[0:+]; RCVD_VIA_SMTP_AUTH(0.00)[];
 ARC_NA(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[ideasonboard.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch,lists.freedesktop.org,lists.infradead.org,vger.kernel.org,lists.linux.dev,lists.xenproject.org];
 TO_DN_SOME(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo, suse.de:mid,
 suse.de:email]
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

Am 21.02.25 um 10:57 schrieb Geert Uytterhoeven:
> Hi Thomas,
>
> On Fri, 21 Feb 2025 at 10:19, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>> Am 20.02.25 um 11:53 schrieb Tomi Valkeinen:
>>> This change also first calls the drm_driver_color_mode_format(), which
>>> could change the behavior even more, but afaics at the moment does not.
>> Because currently each driver does its own thing, it can be hard to
>> write user space that reliably allocates on all drivers. That's why it's
>> important that parameters are not just raw numbers, but have
>> well-defined semantics. The raw bpp is meaningless; it's also important
>> to know which formats are associated with each value. Otherwise, you
>> might get a dumb buffer with a bpp of 15, but it will be displayed
>> incorrectly. This patch series finally implements this and clearly
>> documents the assumptions behind the interfaces. The assumptions
>> themselves have always existed.
>>
>> The color modes in drm_driver_color_mode_format() are set in stone and
>> will not change incompatibly. It's already a user interface. I've taken
>> care that the results do not change incompatibly compared to what the
>> dumb-buffer ioctl currently assumes. (C1-C4 are special, see below.)
>>
>>> Although, maybe some platform does width * DIV_ROUND_UP(bpp, 8) even
>>> for bpp < 8, and then this series changes it for 1, 2 and 4 bpps (but
>>> not for 3, 5, 6, 7, if I'm not mistaken).
>> True. 1, 2 and 4 would currently over-allocate significantly on some
>> drivers and the series will reduce this to actual requirements. Yet our
>> most common memory managers, gem-dma and gem-shmem, compute the sizes
>> correctly.
>>
>> But there are currently no drivers that support C4, C2 or C1 formats;
>> hence there's likely no user space either. I know that Geert is
>> interested in making a driver that uses these formats on very low-end
>> hardware (something Atari or Amiga IIRC). Over-allocating on such
>> hardware is likely not an option.
> Note that the gud and ssd130x drivers do support R1, and I believe
> work is underway to add grayscale formats to ssd130x.

Nice find. Both use gem-shmem, which allocates without much overhead. So 
any possible userspace should already be prepared for this scenario.

>
>> The other values (3, 5, 6, 7) have no meaning I know of. 6 could be
>> XRGB2222, but I not aware of anything using that. We don't even have a
>> format constant for this.
> Yeah, e.g. Amiga supports 3, 5, 6, and 7 bpp, but that is using
> bitplanes.  There is already some sort of consensus to not expose
> bitplanes to userspace in DRM, so limiting to 1, 2, 4, and 8 bpp
> (which can be converted from C[1248]) is fine.

There's been discussion about a new dumb-buffer ioctl that receives a 
format constant and returns individual buffers for each plane. This 
would allow for these use cases.

Best regards
Thomas

>
> Gr{oetje,eeting}s,
>
>                          Geert
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

