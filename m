Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F723CAC892
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 09:44:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 463F910E11A;
	Mon,  8 Dec 2025 08:44:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="0wZMPQnI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Bx068MLm";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GDSeoujN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="siQ/ZTFk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A662310E11A
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Dec 2025 08:44:26 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EACD25BE9E;
 Mon,  8 Dec 2025 08:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1765183465; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Su4EQHn7qRQkDGlUFTgJv+NfBew8N5yzjupi7NWvyKI=;
 b=0wZMPQnIC4r+hY4B2eg+GLFPtG6jg8ELBDX7E/P0fKEoWgK22edVxkRNGb9bRJVoYgPzKp
 80NjPr1S5+rr9EMa1okCpmlSjWjq8DyRSDex7O32gBBcy91wvMWNSz9re4GkrVxnWZ6M9C
 wRibmmFMgejTbHyZ3YG1LiBh3p/cSZY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1765183465;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Su4EQHn7qRQkDGlUFTgJv+NfBew8N5yzjupi7NWvyKI=;
 b=Bx068MLmmwyjQhL4zaci6JYAXF+Tzd1PDcbY4QmXx0J0xYIEqDXeGjzIoQDKh0VlTdSjt0
 mzOl8kjG5m+7H5CQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1765183463; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Su4EQHn7qRQkDGlUFTgJv+NfBew8N5yzjupi7NWvyKI=;
 b=GDSeoujNNutl7THNbxd6aez2S/UZy+p8K7aNWJ9w5A2+qKC47v5RDnVnVAFp8XrRSWmg3E
 9JsARQYuBi9bav6PXrwRVzsxmVHxYzE1ItU4Sa7jiFPPNZ5JY41m5Y0wBa2Xr5LBB8SVy9
 H7I7yJA6TGAPIfhuEhlGb9cjTCLWgcQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1765183463;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Su4EQHn7qRQkDGlUFTgJv+NfBew8N5yzjupi7NWvyKI=;
 b=siQ/ZTFkFN1dgt235FbgqU7IScK9b3KVhsRWnY0ZNulD8UeE0uvS2Ra13s9NDIkuTeQaCJ
 5TuQ99bTmSyKPVAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C1E573EA63;
 Mon,  8 Dec 2025 08:44:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id BGXqLeePNmnPcAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 08 Dec 2025 08:44:23 +0000
Message-ID: <12407aa9-a084-46a1-98cb-9649e7f24098@suse.de>
Date: Mon, 8 Dec 2025 09:44:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ast: Fix big-endian support
To: =?UTF-8?Q?Ren=C3=A9_Rebe?= <rene@exactco.de>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Dave Airlie <airlied@redhat.com>
References: <20251202.170626.2134482663677806825.rene@exactco.de>
 <e0f4a33f-9d36-4b7b-a1f8-1acc7434969c@suse.de>
 <20251205.161459.1654100040521559754.rene@exactco.de>
 <758090394.145092.1764959517083.JavaMail.zimbra@raptorengineeringinc.com>
 <9191ea89-81ce-4200-a356-39fa4a155062@suse.de>
 <A0A92AB8-FA61-4AAC-96C9-00BE93E3F6D6@exactco.de>
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
In-Reply-To: <A0A92AB8-FA61-4AAC-96C9-00BE93E3F6D6@exactco.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -4.27
X-Spam-Level: 
X-Spamd-Result: default: False [-4.27 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.17)[-0.842]; MIME_GOOD(-0.10)[text/plain];
 URIBL_BLOCKED(0.00)[suse.de:email,suse.de:mid,bootlin.com:url,imap1.dmz-prg2.suse.org:helo,suse.com:url,exactco.de:email];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 TO_DN_ALL(0.00)[]; MIME_TRACE(0.00)[0:+];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FROM_HAS_DN(0.00)[];
 RCVD_TLS_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 RCPT_COUNT_FIVE(0.00)[5]; RCVD_COUNT_TWO(0.00)[2];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:email,
 gitlab.freedesktop.org:url, bootlin.com:url, imap1.dmz-prg2.suse.org:helo,
 suse.com:url, suse.de:email, suse.de:mid, raptorengineering.com:email,
 exactco.de:email]
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

Am 05.12.25 um 20:50 schrieb René Rebe:
> Hi,
>
>> On 5. Dec 2025, at 20:46, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>>
>> Hi
>>
>> Am 05.12.25 um 19:31 schrieb Timothy Pearson:
>>> ----- Original Message -----
>>>> From: "René Rebe" <rene@exactco.de>
>>>> To: tzimmermann@suse.de
>>>> Cc: "dri-devel" <dri-devel@lists.freedesktop.org>, "linux-kernel" <linux-kernel@vger.kernel.org>, "Dave Airlie"
>>>> <airlied@redhat.com>, "Timothy Pearson" <tpearson@raptorengineering.com>
>>>> Sent: Friday, December 5, 2025 9:14:59 AM
>>>> Subject: Re: [PATCH] drm/ast: Fix big-endian support
>>>> Hello Thomas,
>>>>
>>>> On Wed, 3 Dec 2025 10:40:17 +0100, Thomas Zimmermann <tzimmermann@suse.de>
>>>> wrote:
>>>>
>>>>> [2]
>>>>> https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next-2025-12-01-1/drivers/gpu/drm/ast/ast_mode.c?ref_type=tags#L559
>>>>> [3]
>>>>> https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next-2025-12-01-1/drivers/gpu/drm/ast/ast_cursor.c?ref_type=tags#L209
>>>>>
>>>>>> + case DRM_FORMAT_RGB565:
>>>>>> + ast_set_index_reg_mask(ast, AST_IO_VGACRI, AST_IO_VGACRA2, 0x3f,
>>>>>> 0x40);
>>>>>> + break;
>>>>>> + case DRM_FORMAT_XRGB8888
>>>> While working on it I discovered that the Big-Endian byte-swapping
>>>> bits do apparently not just-work on a newer AST2400 in our Power 8
>>>> while my initial patch did work as tested with an AST2200 in the Sun
>>>> T4-1 :-/
>> In the upcoming v6.19-rc1, ast will support per-chip quirks. So we can control this by chip version, if necessary
>>
>>>> Maybe that is what Timothy meant with "This is due to a ppc64 hardware
>>>> quirk, which when combined with a hardware design fault in the AST2500
>>>> VGA controller results in a need to use software-based red-blue
>>>> channel swapping." [1]
>>>>
>>>> Is there a way to simply specify the frame-buffer as BGRX8888? In a
>>>> quick test the drm layer complaint about "not supported" and "no
>>>> compatible format found"?
>>> I've been all around that loop.  You can't do that -- the fb code has no idea how to drive such a framebuffer, and elsewhere in the kernel it's made clear that the GPU driver *must* provide a RGBX8888 linear framebuffer if the Linux fb code is going to be able to display a console.
>>>
>>> Does the Sun T4 CPU perform automatic byte swapping on PCI[e] data transactions?  That might be the difference; POWER performs the byte swapping, and since the ASpeed device is broken in BE mode we can't swap back by setting the BE register bit in the AST GPU hardware.
>>>
>>> Fun fact -- it'll sorta work on the framebuffer side, but we lose the entire control BAR in the process.  ASpeed seems OK with this, they just say something along the lines of "oh, BE is not supported despite our documentation" :facepalm:
>> On the 2400-and-onwards models, ast could set drm_device.mode_config.quirk_addfb_prefer_host_byte_order. If set, the format lookup will select a different format on BE machines. [1] For example requesting XRGB8888 returns BGRX8888 instead. If ast later sees such a format in the atomic_update code, it could transparently swap bytes when writing out pixels to the video memory.  IIRC this works transparently to DRM clients and fbcon.  I think this would be the preferred way of fixing the issue.
> Uff, I get better than nothing ;-)

Well, you can set the quirk in mode config. And then in 
ast_handle_damage(), you'll require a switch for the big-endian formats. [1]

ast_handle_damage(...)
{
     ...

     switch (fb->format->format) {
         default:
             drm_fb_memcyp()
             break;
         case DRM_FORMAT_BGRX8888:
         case DRM_FORMAT_RGB565 | DRM_FORMAT_BIG_ENDIAN:
             /* Swap bytes on big-endian formats */
             drm_fb_swab(dst, fb->pitches, src, fb, clip, false, 
fmtcnv_state);
             break;
     }
}

You can get that final argument fmtcnv_state from the DMR shadow-plane 
state. [2]

[1] 
https://elixir.bootlin.com/linux/v6.18/source/drivers/gpu/drm/ast/ast_mode.c#L549
[2] 
https://elixir.bootlin.com/linux/v6.18/source/drivers/gpu/drm/ast/ast_mode.c#L558

Does that fix the color corruption?

>
>> [1] https://elixir.bootlin.com/linux/v6.18/source/drivers/gpu/drm/drm_fourcc.c#L123
>>
>> For the pre-2400 chips, I suggest to fix this problem with the hardware byte swapping if possible. That seems like the correct approach.
> I had re-done the code as you suggested, should I send a v2 as tested on the sparc64 t4-1 and we quirk later, non working chips or ppc64 later?

Not sure what you mean. If splitting by chip model is too complicated, 
we can also do only the software variant that works with all chips.

Thanks for sticking with it.

Best regards
Thomas

>
> 	René
>
>> Best regards
>> Thomas

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


