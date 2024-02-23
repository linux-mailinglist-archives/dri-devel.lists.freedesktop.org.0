Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C75860DDA
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 10:21:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E60D210EB4C;
	Fri, 23 Feb 2024 09:21:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="gwPWnVVq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mVZdmUOU";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gEVYnJHF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CkJJIhLA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4E2D10EB4A
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 09:21:03 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EF1401F7CE;
 Fri, 23 Feb 2024 09:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1708680062; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=grfKsBimZxMfv47mZK/EleQ0DP+M/go3GhvIQ0gisQM=;
 b=gwPWnVVq+38kKyxbU2tO9vAI1pOm3OlTr3zKTze66q5HPxr19BgpktI8rN7x7pcAjyFH6a
 b+NIp2/vmaGntNAp3VT58ORyyCJdBebU4Gf43ytxO06qjRHQjRJeFwHjtV17Q4ZbyV/ycz
 JNhLZ2zBMqH5qxIz+xH0uzPupOBSt2I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1708680062;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=grfKsBimZxMfv47mZK/EleQ0DP+M/go3GhvIQ0gisQM=;
 b=mVZdmUOUVy2SStkux6x8qU+uEyv77Q6bNtMFnv/6AUIeBbXN8IpedNEAjTsbhM/3Ms4p1M
 IN9/1nHsF8ujE8DQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1708680061; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=grfKsBimZxMfv47mZK/EleQ0DP+M/go3GhvIQ0gisQM=;
 b=gEVYnJHFZ98nDttdDyyO5mhcQLIB+rgBwBZRS+oQfYCnxW2gz5y+y2Wi0sa3D+Zxit78Id
 efYxzryf2AXVvj4Sl5IAgJTG/CHpyqYxDwhqxoQPV706Rj0X1k3b8kviyE2H7vG19POXzf
 rTZL93AQQpK/s3GJ2EtlC2h3XItxFrw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1708680061;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=grfKsBimZxMfv47mZK/EleQ0DP+M/go3GhvIQ0gisQM=;
 b=CkJJIhLAXeA8fcHqx3FeyB80jBgR4gIf6uJj/XVTwrulmRUkWvvt7tZavlRE25BdoHyVH6
 kdUorZl3pObTP9Dw==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 6C33C13776;
 Fri, 23 Feb 2024 09:21:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id O/30FX1j2GXNPgAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Fri, 23 Feb 2024 09:21:01 +0000
Message-ID: <97c10e28-7708-4449-823a-fbf835d2a280@suse.de>
Date: Fri, 23 Feb 2024 10:21:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Future handling of complex RGB devices on Linux v2
To: Pavel Machek <pavel@ucw.cz>, Pekka Paalanen <pekka.paalanen@haloniitty.fi>
Cc: Werner Sembach <wse@tuxedocomputers.com>,
 Hans de Goede <hdegoede@redhat.com>, Lee Jones <lee@kernel.org>,
 jikos@kernel.org, linux-kernel@vger.kernel.org,
 Jelle van der Waa <jelle@vdwaa.nl>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 linux-input@vger.kernel.org, ojeda@kernel.org, linux-leds@vger.kernel.org
References: <730bead8-6e1d-4d21-90d2-4ee73155887a@tuxedocomputers.com>
 <952409e1-2f0e-4d7a-a7a9-3b78f2eafec7@redhat.com>
 <9851a06d-956e-4b57-be63-e10ff1fce8b4@tuxedocomputers.com>
 <1bc6d6f0-a13d-4148-80cb-9c13dec7ed32@redhat.com>
 <b70b2ea8-abfd-4d41-b336-3e34e5bdb8c6@tuxedocomputers.com>
 <477d30ee-247e-47e6-bc74-515fd87fdc13@redhat.com>
 <e21a7d87-3059-4a51-af04-1062dac977d2@tuxedocomputers.com>
 <247b5dcd-fda8-45a7-9896-eabc46568281@tuxedocomputers.com>
 <ZdZ2kMASawJ9wdZj@duo.ucw.cz> <20240222110457.71618f27@eldfell>
 <ZdeGiMf2npmzJidU@duo.ucw.cz>
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
In-Reply-To: <ZdeGiMf2npmzJidU@duo.ucw.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [-1.59 / 50.00]; ARC_NA(0.00)[];
 TO_DN_EQ_ADDR_SOME(0.00)[]; XM_UA_NO_VERSION(0.01)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; TAGGED_RCPT(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; RCVD_VIA_SMTP_AUTH(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 BAYES_HAM(-3.00)[100.00%]; RCPT_COUNT_TWELVE(0.00)[13];
 DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url,laskakit.cz:url];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+];
 FREEMAIL_CC(0.00)[tuxedocomputers.com,redhat.com,kernel.org,vger.kernel.org,vdwaa.nl,gmail.com,lists.freedesktop.org];
 RCVD_TLS_ALL(0.00)[]; SUSPICIOUS_RECIPS(1.50)[]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -1.59
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

Am 22.02.24 um 18:38 schrieb Pavel Machek:
> Hi!
>
>>>> so after more feedback from the OpenRGB maintainers I came up with an even
>>>> more generic proposal:
>>>> https://gitlab.com/CalcProgrammer1/OpenRGB/-/issues/3916#note_1753072869
>>>>> evaluate-set-command ioctl taking:
>>>>> {
>>>>>      enum command                /* one of supported_commands */
>>>>>      union data
>>>>>      {
>>>>>          char raw[3072],
>>>>>          {
>>>>>              <input struct for command 0>
>>>>>          },
>>> Yeah, so ... this is not a interface. This is a backdoor to pass
>>> arbitrary data. That's not going to fly.
>>>
>>> For keyboards, we don't need complete new interface; we reasonable
>>> extensions over existing display APIs -- keyboards are clearly 2D.
>> I suppose they could be seen as *a* display, but if you are referring
>> to DRM KMS UAPI, then no, I don't see that fitting at all:
> So -- we already have very similar displays in
> drivers/auxdisplay. drivers/auxdisplay/cfag12864b.c is 128x64 display,
> 1-bit display for example.

Auxdisplay can be anything for everyone. It appears to be the rest that 
didn't clearly fit elsewhere. The core interface seems to be a custom 
char device. The fbdev code in cfag12864b is not representative.

>
>> - the "pixel grid" is not orthogonal, it's not a rectangle, and it
>>    might not be a grid at all
> It is quite close to orthogonal. I'd suggest simply pretending it is
> orthogonal grid with some pixels missing :-). We already have
> cellphone displays with rounded corners and holes in them, so I
> suspect handling of missing pixels will be neccessary anyway.
>
>> - Timings and video modes? DRM KMS has always been somewhat awkward for
>>    display devices that do not have an inherent scanout cycle and timings
>>    totally depend on the amount of pixels updated at a time
>>    (FB_DAMAGE_CLIPS), e.g. USB displays (not USB-C DP alt mode).
>>    They do work, but they are very different from the usual hardware
>>    involved with KMS, require special consideration in userspace, and
>>    they still are actual displays while what we're talking about here
>>    are not.
> As you say, there are other displays with similar problems.
>
>> - KMS has no concept of programmed autonomous animations, and likely
>>    never will. They are not useful with actual displays.
> Yep. We need some kind of extension here, and this is likely be quite
> vendor-specific, as animations will differ between vendors. I guess
> "please play pattern xyzzy with parametrs 3 and 5" might be enough for this.

The litmus test for DRM and fbdev is something like "would the user run 
the console, desktop, or any other meaningful output in this display". 
That is also what userspace (e.g., X, Wayland, gfx terminals) expects: a 
display to show the user's main output. Keyboard LEDs don't fit here.

Best regards
Thomas

>
>> - Userspace will try to light up KMS outputs automatically and extend
>>    the traditional desktop there. This was already a problem for
>>    head-mounted displays (HMD) where it made no sense. That was worked
>>    around with an in-kernel list of HMDs and some KMS property
>>    quirking.
> This will need fixing for cfag12864b.c, no? Perhaps userspace should
> simply ignore anything smaller than 240x160 or something...
>
>> Modern KMS UAPI very much aims to be a generic UAPI that abstracts
>> display devices. It already breaks down a little for things like USB
>> displays and virtual machines (e.g. qemu, vmware, especially with
>> remote viewers), which I find unfortunate. With HMDs the genericity
>> breaks down in other ways, but I'd claim HMDs are a better fit still
>> than full-featured VM virtual displays (cursor plane hijacking). With
>> non-displays like keyboards the genericity would be completely lost, as
>> they won't work at all the same way as displays. You cannot even show
>> proper images there, only coarse light patterns *IF* you actually know
>> the pixel layout. But the pixel layout is(?) hardware-specific which is
>> the opposite of generic.
>>
>> While you could dress keyboard lights etc. up with DRM KMS UAPI, the
>> userspace would have to be written from scratch for them, and you
>> somehow need to make existing KMS userspace to never touch those
>> devices. What's the point of using DRM KMS UAPI in the first place,
>> then?
> Well, at least we have good UAPI to work with. Other options were 100
> files in /sys/class/leds, pretending it is a linear array of leds,
> just passing raw data around, and pretending it is grid of RGB888
> data.
>
> Anyway, there are devices such as these: (8x8 LED display).
>
> https://www.laskakit.cz/8x8-led-matice-s-max7219-3mm-cervena/
>
> We should think about what interface we want for these, and then I
> believe we should make RGB keyboards use something similar.
>
> Best regards,
> 								Pavel

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

