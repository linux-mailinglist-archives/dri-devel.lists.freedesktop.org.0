Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E674695D095
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 17:00:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5506410EB85;
	Fri, 23 Aug 2024 15:00:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="UnevkPY6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mfWtYfhl";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UnevkPY6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mfWtYfhl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 710EC10EB85
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2024 15:00:45 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D3AEF20332;
 Fri, 23 Aug 2024 15:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724425243; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=vTspk2gAikZmRyLQ1m0bx++aTy1mWm3Fqij3vNC4bpg=;
 b=UnevkPY6n61EiheDJmLqV0X/ucZMDimtLcvHPHHAE0HP7BEYsFeB9i0C9MPZjCSFKhvKyw
 6o8KoF1JI+2bKcksxz49Edw8TMNYVIAcL/po6Rra346VZp6TT58AtnjBnNoEPnJjfrfqYm
 USbn34FM5MTZnG10mHMazz5AEWgC2U4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724425243;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=vTspk2gAikZmRyLQ1m0bx++aTy1mWm3Fqij3vNC4bpg=;
 b=mfWtYfhlo72IOsp28ks1LNSsS1Lfs4BjzoLUOh1WvR4XStro+j5MCZ/3sv0hFsnU/nC9LC
 6rzcAhr3JNBuWpDQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724425243; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=vTspk2gAikZmRyLQ1m0bx++aTy1mWm3Fqij3vNC4bpg=;
 b=UnevkPY6n61EiheDJmLqV0X/ucZMDimtLcvHPHHAE0HP7BEYsFeB9i0C9MPZjCSFKhvKyw
 6o8KoF1JI+2bKcksxz49Edw8TMNYVIAcL/po6Rra346VZp6TT58AtnjBnNoEPnJjfrfqYm
 USbn34FM5MTZnG10mHMazz5AEWgC2U4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724425243;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=vTspk2gAikZmRyLQ1m0bx++aTy1mWm3Fqij3vNC4bpg=;
 b=mfWtYfhlo72IOsp28ks1LNSsS1Lfs4BjzoLUOh1WvR4XStro+j5MCZ/3sv0hFsnU/nC9LC
 6rzcAhr3JNBuWpDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 995371333E;
 Fri, 23 Aug 2024 15:00:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id MxElIxukyGYZAgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 23 Aug 2024 15:00:43 +0000
Message-ID: <42389f21-1ddb-428d-8471-92eae5a5f45a@suse.de>
Date: Fri, 23 Aug 2024 17:00:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/10] rm/bochs: Modernize driver
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux.dev
References: <20240823124422.286989-1-tzimmermann@suse.de>
 <sksjddgidfrk4bvcxvb46khevp4a4nfvl2holgdw636wld7oov@vdbcvdf3ch6m>
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
In-Reply-To: <sksjddgidfrk4bvcxvb46khevp4a4nfvl2holgdw636wld7oov@vdbcvdf3ch6m>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_TLS_ALL(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 ARC_NA(0.00)[]; RCPT_COUNT_SEVEN(0.00)[7];
 MIME_TRACE(0.00)[0:+]; MID_RHS_MATCH_FROM(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[ffwll.ch,gmail.com,kernel.org,linux.intel.com,lists.freedesktop.org,lists.linux.dev];
 TO_DN_SOME(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Score: -4.30
X-Spam-Flag: NO
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

Am 23.08.24 um 16:34 schrieb Gerd Hoffmann:
>    Hi,
>
>> Patch 8 replaces GEM VRAM with GEM SHMEM. The new memory manager
>> is more reliable and allows for larger resolutions.
> Valid point.
>
>> Display updates were so slow that Gnome was unmanageable with a
>> flickering cursor and single FPS. The new memory management makes
>> Gnome at least useable.
> Hmm?  I'm wondering where this huge improvement comes from?
>
> With enough video memory VRAM performance should be ok.
>
> If video memory is tight and ttm is forced to shuffle around
> framebuffers between vram and system memory on each page flip (touching
> much of vram along the way which causes additional overhead on the qemu
> side), that is obviously very bad for performance.  One of the reasons
> why cirrus uses SHMEM + shadowing since years.
>
> Shadow buffering comes with some overhead too, so the switch isn't an
> obvious win (assuming enough vram).  Hiding the page flips from qemu
> might reduce the work qemu has to do though, especially if the shadowing
> uses dirty tracking and only touches the vram pages which have actually
> changed content.  So there is a fair chance that this outweighs the
> shadowing overhead and ends up being a net win.  I don't expect the
> difference being very big though.  Also different display usage patterns
> might yield different results (fbcon vs. gnome for example).
>
> So this probably makes sense, but I'd like to see a bit more background
> information ...

The difference is in damage handling.

The old code had two BOs in video memory and flipped between them. IDK 
the details of the old rendering, but from the massive flickering of the 
cursor, I assume that X11's internal either copies a full buffer during 
each redraw, or doesn't really handle damage well. It could also happen 
that X didn't use a shadow buffer for rendering. Bochs didn't request 
one. Without, drawing to I/O memory is really slow. If that applies to 
virtual I/O memory as well IDK.

The new driver code only copies areas that have been changed from 
rendering. The flickering is gone and the overall update performance is 
acceptable.

>
> On vram sizes:  The default qemu vram size (16M) should be fine for the
> default display resolution (1280x800).  For FullHD vram size should be
> doubled (-device VGA,vgamem_mb=32).

Right. Bochs never really tested that. So I saw something like 5k by 3k 
resolutions on my test setup with 16 MiB. Now that video-memory 
requirements for each mode can be calculated easily, we can sort out the 
invalid modes.

>
>
> Skimmed the other patches, looks sane overall, but I don't follow drm
> close enough any more to do an full review.  So I leave this here:
>
> Acked-by: Gerd Hoffmann <kraxel@redhat.com>

Thank you so much.

Best regards
Thomas

>
> take care,
>    Gerd
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

