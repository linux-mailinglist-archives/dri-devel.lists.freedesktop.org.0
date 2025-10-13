Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F08DEBD222B
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 10:47:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C0AA10E17A;
	Mon, 13 Oct 2025 08:47:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="ykUWDXDN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="De74Pm6y";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MRaUtP8/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FXtQYl8y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 820CD10E17A
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 08:47:43 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id ECEA51F7A4;
 Mon, 13 Oct 2025 08:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1760345262; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=TF7qh+PKIyRmpfuLCkplecAnACUERHhOZoW8vLIMefk=;
 b=ykUWDXDNnqpd27gdaJtbLZnGKRV/6zcgWIcv7poMIJgnlKhSFtCfZAp+AptpyndO2DAgnK
 4UFXySlljDaXmn9wpaA3QbUgOL/+SOIusjA9qqmRVTn5kG7gSYFPzRoSnK3CgNke/7286/
 pa9VS1+pyYLXuDNrvUE2OEL+J08LOZU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1760345262;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=TF7qh+PKIyRmpfuLCkplecAnACUERHhOZoW8vLIMefk=;
 b=De74Pm6yXnQxOGar3Z4T3ghAHTMzcHX32K2Vf48VD7UerCiFERErqimA1ZwzcY1MDxwXjD
 Uls7k53TF27DzGAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1760345261; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=TF7qh+PKIyRmpfuLCkplecAnACUERHhOZoW8vLIMefk=;
 b=MRaUtP8/iKb3e4IHaRfSM8V9XppdZPu1YPc0MIiK6FFxvEYBskc4GZpZWhn+goFDDoRjo1
 sGBSC3V1YYKNNiT45rVCLdxOIRIPnF9w8rv45KlZJseo2yKqa+vIhViH40C3MHEGCA46kF
 smHpCWnjAWhNV0ldza8dE3iMWOjOMK4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1760345261;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=TF7qh+PKIyRmpfuLCkplecAnACUERHhOZoW8vLIMefk=;
 b=FXtQYl8ywHdXE1ZR11FD8t5urLMmrmptsU9AaU+g86ZzBnZHS+7PsEJff5QrPvZ76v8q00
 BPzzob/Vgecam6Ag==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CDF601374A;
 Mon, 13 Oct 2025 08:47:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id yg3IMK287GhsQgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 13 Oct 2025 08:47:41 +0000
Message-ID: <171570ba-29b5-4793-8586-208fe2ad85e0@suse.de>
Date: Mon, 13 Oct 2025 10:47:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Adding EDID support to simpledrm on top of the EFI sysfb ?
To: Javier Martinez Canillas <javierm@redhat.com>,
 Hans de Goede <hansg@kernel.org>, nickblack@linux.com
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <301d7da1-5101-4f16-90cd-5bb4ac41c87b@kernel.org>
 <b99e3a32-6d3e-48a0-9936-a67999354a44@suse.de>
 <871pn7i5xf.fsf@ocarina.mail-host-address-is-not-set>
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
In-Reply-To: <871pn7i5xf.fsf@ocarina.mail-host-address-is-not-set>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUBJECT_ENDS_QUESTION(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+]; TO_DN_SOME(0.00)[];
 TO_DN_EQ_ADDR_SOME(0.00)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; RCVD_TLS_ALL(0.00)[];
 RCPT_COUNT_THREE(0.00)[4]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 RCVD_COUNT_TWO(0.00)[2];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid, suse.de:email,
 imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.30
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

Am 13.10.25 um 10:04 schrieb Javier Martinez Canillas:
> Thomas Zimmermann <tzimmermann@suse.de> writes:
>
> Hello Hans,
>
>> Hi Hans
>>
>> Am 11.10.25 um 12:02 schrieb Hans de Goede:
>>> Hi,
>>>
>>> A while ago I did a blogpost about not having the native GPU drivers in
>>> the initrd: https://hansdegoede.dreamwidth.org/28291.html
>>>
>>> With the Fedora /boot partition size increase there has been renewed
>>> interest in this and as a result I got an interesting comment on
>>> the blog post pointing out that there are EFI protocols to get EDID
>>> info for the monitor (presumably for the one the GOP has lit up).
>>>
>>> It would be useful to see if we can hook this up so that the simpledrm
>>> device can report the physical dimensions of the screen and the boot
>>> splash does not need to guess the DPI and thus does not need to guess
>>> whether to do hiDPI scaling or not. The comment is here:
>>>
>>> https://hansdegoede.dreamwidth.org/28291.html?thread=14467#cmt14467
>>>
>>> and it points to:
>>>
>>> https://uefi.org/sites/default/files/resources/2_-_AMD_UEFI_Plugfest_EDID_Spring2012.pdf
>>> https://uefi.org/specs/UEFI/2.9_A/12_Protocols_Console_Support.html
>>>
>>> Unfortunately I do not have time to work on this myself, hence this
>>> email in the hope that someone else can pick this idea up.
>> There are now efidrm and vesadrm, which support specifically the
>> features that we get from the rsp. standards, hardware  and bootloader.
>> For VESA and EFI the EDID can be transferred from grub via bootparams. A
>> patch [1] is on its way into upstream grub. The Linux kernel stores that
>> data in edid_info, from where it is picked up by efidrm and vesadrm.  If
>> the EFI framebuffer comes directly from the EFI calls, we need to
>> implement this in the kernel, but the principle is the same. I also have
>> ideas for making this work on Coreboot.
>>
>> For simpledrm, I'd rather strip if from the ability to use EFI/VESA
>> framebuffers and focus on simple-framebuffer DT nodes. These sometimes
>> come with DPI information. Maybe we could extend the DT to support EDID
>> as well.
>>
>> [1] https://lists.gnu.org/archive/html/grub-devel/2025-10/msg00043.html
>>
>> I have long been working on all this and it is now slowly coming together.
>>
> I agree with Thomas.
>
> We are still not enabling these DRM drivers in Fedora though, but maybe it
> is time to do that and just disable CONFIG_SYSFB_SIMPLEFB. I can propose a
> change request for Fedora 44 to do this.

Sounds good. FYI I plan to enable efidrm/vesadrm in openSUSE Tumbleweed 
now that v6.18-rc1 is out. If things go well, they should reach users 
within two months. I regularly improve support for various features 
(EDID, color modes).

Best regards
Thomas

>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


