Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D40CB4F89
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 08:22:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D135910E0D0;
	Thu, 11 Dec 2025 07:22:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="VEBzGG7z";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="T2oGVBy4";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="aYQhcjBK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sZ9uaSQZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDEFD10E0D0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 07:22:15 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 717CD33713;
 Thu, 11 Dec 2025 07:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1765437734; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=VDodHkJpS//TQCUmE1rWNNuE8/seTv18v4fNY9rJLHc=;
 b=VEBzGG7z1jC+i+7MesluRmXvCmm9luR/5q7aQLXcDYFIslHoADRUSr4Wu2XmAxSNEHZ6D4
 gizhC9JUet0wRwNFcue3ZefePAlA3EKaIfbs1RIGOAoQzjUa5WUHRRjMfi7QyR1LPsGcVH
 6v8mP2K8UjesES2r4xdY/x9wKC3Ae1g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1765437734;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=VDodHkJpS//TQCUmE1rWNNuE8/seTv18v4fNY9rJLHc=;
 b=T2oGVBy4FhBnZZHJ6hMjGoM4EeJXKhyJtqdnsRTaclWSmPkH5wXltBvVy7uE+mOwcht1is
 zx0iAyRiplAr3OCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1765437733; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=VDodHkJpS//TQCUmE1rWNNuE8/seTv18v4fNY9rJLHc=;
 b=aYQhcjBKat1BctI7A40AjAS/3VN5wQIAnrKLuVWNrtsc70wB75ZiJyIgE4j8t82jQFVoSv
 y29Q7RPXezzcyKTGYh2KdkVNJxjBnX+k/+ONSL3DSparmDolbNGst3pQnnMf7xPPHv0B4z
 XxytQRYToxxjCwOVE4ESsU+kULLKQNw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1765437733;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=VDodHkJpS//TQCUmE1rWNNuE8/seTv18v4fNY9rJLHc=;
 b=sZ9uaSQZefvkIsJyoHHhVXDGzXAl4s4kJJJZKPAMoZi7aavgr7bgf1av4KtAGwOXD/XCT+
 6kE2/7InUd6JxXCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3CD693EA63;
 Thu, 11 Dec 2025 07:22:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id UvacDSVxOmmDCQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 11 Dec 2025 07:22:13 +0000
Message-ID: <34cce8e3-51c5-4d44-8f6e-592a5943aec8@suse.de>
Date: Thu, 11 Dec 2025 08:22:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ast: Fix big-endian support
To: =?UTF-8?Q?Ren=C3=A9_Rebe?= <rene@exactco.de>
Cc: tpearson@raptorengineering.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, airlied@redhat.com
References: <a4243932-5878-4b37-b1f0-fb0c706ed1f2@suse.de>
 <20251210.163344.1485666712792595073.rene@exactco.de>
 <dda9846d-3893-43ab-9cce-12a7f41fb974@suse.de>
 <20251210.175635.1285090497167018958.rene@exactco.de>
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
In-Reply-To: <20251210.175635.1285090497167018958.rene@exactco.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -4.28
X-Spam-Level: 
X-Spamd-Result: default: False [-4.28 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.18)[-0.891]; MIME_GOOD(-0.10)[text/plain];
 FROM_HAS_DN(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_TLS_ALL(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 RCPT_COUNT_FIVE(0.00)[5]; RCVD_COUNT_TWO(0.00)[2];
 MID_RHS_MATCH_FROM(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:url, suse.de:email, suse.de:mid,
 xcode_sparc_t4_1:email, imap1.dmz-prg2.suse.org:helo]
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

Am 10.12.25 um 17:56 schrieb René Rebe:
> Hi,
>
> On Wed, 10 Dec 2025 16:41:50 +0100, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
>> Hi
>>
>> Am 10.12.25 um 16:33 schrieb René Rebe:
>>> Hallo,
>>>
>>> On Wed, 10 Dec 2025 09:55:50 +0100, Thomas Zimmermann
>>> <tzimmermann@suse.de> wrote:
>>> ...
>>>>>> Does that fix the color corruption?
>>>>> Following your suggestions conversion does not want to just work:
>>>>>
>>>>> root@XCODE_SPARC_T4_1:~# dmesg  | tail
>>>>> [  105.444761] ast 0000:0a:00.0: AST 2200 detected
>>>>> [ 105.444947] ast 0000:0a:00.0: [drm] dram MCLK=266 Mhz type=2
>>>>> bus_width=32
>>>>> [  105.444963] ast 0000:0a:00.0: [drm] Using analog VGA
>>>>> [  105.445470] [drm] Initialized ast 0.1.0 for 0000:0a:00.0 on minor 0
>>>>> [ 105.673289] ast 0000:0a:00.0: [drm] format BX24 little-endian
>>>>> (0x34325842) not supported
>>>>> [  105.673302] ast 0000:0a:00.0: [drm] No compatible format found
>>>>> [ 105.673348] ast 0000:0a:00.0: [drm] *ERROR* fbdev: Failed to setup
>>>>> emulation (ret=-22)
>>>>> [ 105.901306] ast 0000:0a:00.0: [drm] format BX24 little-endian
>>>>> (0x34325842) not supported
>>>>> [  105.901319] ast 0000:0a:00.0: [drm] No compatible format found
>>>>> [ 105.901350] ast 0000:0a:00.0: [drm] *ERROR* fbdev: Failed to setup
>>>>> emulation (ret=-22)
>>>> Oh well...
>>>>
>>>> There's a very simple patch attach. Does it fix the problem?
>>> Yes, only leaving the hardcoded swapping from my patch liek this fixes
>>> the byte-swapped output as expected on the sparc64 Sun T4.
>> Great.
>>
>>> How would you like me to go from here? Just use the chip_id to force
>>> swapping and enable hw swapper for pre-AST2400 chips or fix the
>>> generic format selection to work as you had suggested?
>>>
>>> Does the ast_primary_plane_formats need to byte swapped formats for it
>>> to work?
>> I'll send out a full patch that implements the byte swapping. Once
>> reviewed, it can be merged quickly. Can I add your Tested-by tag to
>> the patch?
> I'd be happy to finish my work.

Of course, no problem.

The code for the primary plane should be fine now. But we also need 
something for the cursor plane as well. There's a ast_set_cursor_image() 
with a memcpy_toio() [1] and several additional writes. IIUC they all 
have to be swapped as well.

[1] 
https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next/drivers/gpu/drm/ast/ast_cursor.c#L101

Best regards
Thomas

>   But if you want to put the last touch
> on it now you can add Co-developed-by, too ... and I'll test the final
> version.
>
>     René
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


