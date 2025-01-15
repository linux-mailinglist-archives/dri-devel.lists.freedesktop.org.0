Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D348DA123D4
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 13:34:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C553C10E658;
	Wed, 15 Jan 2025 12:34:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="fgWXXkrF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="y94aRJ3h";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fgWXXkrF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="y94aRJ3h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AFA610E351;
 Wed, 15 Jan 2025 12:34:44 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0911921268;
 Wed, 15 Jan 2025 12:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1736944453; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=6rF2/Nds9jaSABjY+tPpNsWja3s7il8oCoGTgAQg7zI=;
 b=fgWXXkrFkmGejWhD5fjTSv1Ssa3J0/Rq3i+ng8TxEKD1eRYuiFNmbUfuajMGofr3s/t2eZ
 KUgh6Bm/awPn8TV8uJkhGaXDHQR6CWgT/hcaXY1q2efHMbV/wmhjhMEy29fROVqCvSDkdz
 6tQTVjC5fOWCKOgJQRgT1JzzUj6MBJw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1736944453;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=6rF2/Nds9jaSABjY+tPpNsWja3s7il8oCoGTgAQg7zI=;
 b=y94aRJ3hTl+xAqZyjbuOx6P3Fm9fL5u2Qm278Eu98uKnVjQZVMuFhA5M1heZuojCir6spI
 Y/ZF6lkgng5FbRAA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1736944453; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=6rF2/Nds9jaSABjY+tPpNsWja3s7il8oCoGTgAQg7zI=;
 b=fgWXXkrFkmGejWhD5fjTSv1Ssa3J0/Rq3i+ng8TxEKD1eRYuiFNmbUfuajMGofr3s/t2eZ
 KUgh6Bm/awPn8TV8uJkhGaXDHQR6CWgT/hcaXY1q2efHMbV/wmhjhMEy29fROVqCvSDkdz
 6tQTVjC5fOWCKOgJQRgT1JzzUj6MBJw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1736944453;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=6rF2/Nds9jaSABjY+tPpNsWja3s7il8oCoGTgAQg7zI=;
 b=y94aRJ3hTl+xAqZyjbuOx6P3Fm9fL5u2Qm278Eu98uKnVjQZVMuFhA5M1heZuojCir6spI
 Y/ZF6lkgng5FbRAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 767F4139CB;
 Wed, 15 Jan 2025 12:34:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id E28IG0Srh2cCTwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 15 Jan 2025 12:34:12 +0000
Message-ID: <0ea6be58-0e04-4172-87cd-064a3e4a43bc@suse.de>
Date: Wed, 15 Jan 2025 13:34:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 25/25] drm/xlnx: Compute dumb-buffer sizes with
 drm_mode_size_dumb()
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 nouveau@lists.freedesktop.org, virtualization@lists.linux.dev,
 spice-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
 intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andy Yan <andyshrk@163.com>
References: <20250109150310.219442-1-tzimmermann@suse.de>
 <20250109150310.219442-26-tzimmermann@suse.de>
 <cdbe483d-0895-47aa-8c83-1c28220f4a02@ideasonboard.com>
 <bc97b92e-7f8a-4b92-af8a-20fa165ead55@suse.de>
 <f3ba05c7-6e49-4641-a3f9-ba418ebdb7c3@ideasonboard.com>
 <c6735280-7c32-4319-8ca9-a7305d8117c3@suse.de>
 <d67adb03-5cd0-4ac9-af58-cf4446dacee3@ideasonboard.com>
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
In-Reply-To: <d67adb03-5cd0-4ac9-af58-cf4446dacee3@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-0.999]; MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_TO(0.00)[ideasonboard.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 RCPT_COUNT_TWELVE(0.00)[21]; MIME_TRACE(0.00)[0:+];
 RCVD_TLS_ALL(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 ARC_NA(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[163.com,gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[lists.freedesktop.org,lists.infradead.org,vger.kernel.org,lists.linux.dev,lists.xenproject.org,ideasonboard.com,163.com];
 TO_DN_SOME(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
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


Am 15.01.25 um 13:06 schrieb Tomi Valkeinen:
> Hi,
>
> On 15/01/2025 13:37, Thomas Zimmermann wrote:
>> Hi
>>
>>
>> Am 15.01.25 um 11:58 schrieb Tomi Valkeinen:
>> [...]
>>>> These are all good points. Did you read my discussion with Andy on 
>>>> patch 2? I think it resolves all the points you have. The current 
>>>> CREATE_DUMB 
>>>
>>> I had missed the discussion, and, indeed, the patch you attached 
>>> fixes the problem on Xilinx.
>>
>> Great. Thanks for testing.
>>
>>>
>>>> ioctl is unsuited for anything but the simple RGB formats. The bpp 
>>>
>>> It's a bit difficult to use, but is it really unsuited? 
>>> bitsperpixel, width and height do give an exact pitch and size, do 
>>> they not? It does require the userspace to handle the subsampling 
>>> and planes, though, so far from perfect.
>>
>> The bpp value sets the number of bits per pixel; except for bpp==15 
>> (XRGB1555), where it sets the color depth. OR bpp is the color depth; 
>> except for bpp==32 (XRGB8888), where it is the number of bits per 
>> pixel. It's therefore best to interpret it like a color-mode enum.
>
> Ah, right... That's horrible =).
>
> And I assume it's not really possible to define the bpp to mean bits 
> per pixel, except for a few special cases like 15?
>
> Why do we even really care about color depth here? We're just 
> allocating memory. Doesn't DIV_ROUND_UP(args->bpp, SZ_8) work fine for 
> XRGB1555 too?

Drivers always did that, but it does not work correctly for (bpp < 8). 
As we already have helpers to deal with bpp, it makes sense to use 
them.  This also aligns dumb buffers with the kernel's video= parameter, 
which as the same odd semantics. The fallback that uses bpp directly 
will hopefully be the exception.

>
>>> So, I'm all for a new ioctl, but I don't right away see why the 
>>> current ioctl couldn't be used. Which makes me wonder about the 
>>> drm_warn() in your patch, and the "userspace throws in arbitrary 
>>> values for bpp and relies on the kernel to figure it out". Maybe I'm 
>>> missing something here.
>>
>> I was unsure about the drm_warn() as well. It's not really wrong to 
>> have odd bpp values, but handing in an unknown bpp value might point 
>> to a user-space error. At least there should be a drm_dbg().
>>
>>>
>>>> parameter is not very precise. The solution would be a new ioctl 
>>>> call that receives the DRM format and returns a buffer for each 
>>>> individual plane.
>>>
>>> Yes, I think that makes sense. That's a long road, though =). So my 
>>> question is, is CREATE_DUMB really unsuitable for other than simple 
>>> RGB formats, or can it be suitable if we just define how the 
>>> userspace should use it for multiplanar, subsampled formats?
>>
>> That would duplicate format and hardware information in user-space. Some 
>
> But we already have that, don't we? We have drivers and userspace that 
> support, say, NV12 via dumb buffers. But (correct me if I'm wrong) we 
> don't document how CREATE_DUMB has to be used to allocate multiplanar 
> subsampled buffers, so the userspace devs have to "guess".

Yeah, there are constrains in the scanline and buffer alignments and 
orientation. And if we say that bpp==12 means NV12, it will be a problem 
for all other cases where bpp==12 makes sense.

Best regards
Thomas

>
>> hardware might have odd per-plane limitations that only the driver 
>> knows about. For example, there's another discussion on dri-devel 
>> about pitch- alignment requirements of DRM_FORMAT_MOD_LINEAR on 
>> various hardware. That affects dumb buffers as well. I don't think 
>> that there's an immediate need for a CREATE_DUMB2, but it seems worth 
>> to keep in mind.
>
> Yes, the current CREATE_DUMB can't cover all the hardware. We do need 
> CREATE_DUMB2, sooner or later. I just hope we can define and document 
> a set of rules that allows using CREATE_DUMB for the cases where it 
> sensibly works (and is already being used).
>
>  Tomi
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

