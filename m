Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD64B92B0DE
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 09:11:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E40910E130;
	Tue,  9 Jul 2024 07:11:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="pfZs4z/e";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MelSmZl2";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jBn0EmP8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yecd4x65";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC51110E130
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2024 07:11:04 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B8BD91F79B;
 Tue,  9 Jul 2024 07:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1720509063; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=8nq7CxDCnJxvaCPnzb5Z3ceGIdLaECWsBrpxDghw45A=;
 b=pfZs4z/eUEhS539zo/kmq0v1vXM+U77h5brXz3tIofowtID9hgwD69Y0iIYhqaAmzJL1Eu
 IJa9Scf51MshQ2dtpweCjHOC9qxjNigMo7dlV9Nz3TbHHy6ghEsB4YKOZ/0rzNgW3geQyF
 ERpOOWR9Eif6uxO8YjGyA2qOxWsX+Ok=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1720509063;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=8nq7CxDCnJxvaCPnzb5Z3ceGIdLaECWsBrpxDghw45A=;
 b=MelSmZl2dL3wPN3HAk6R4H9DPKiOS6FWZIjnQy8e+/fuKnjNRqvzvNhob3tVSLiBDiVQiN
 X1zjBww8wzac5IDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1720509062; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=8nq7CxDCnJxvaCPnzb5Z3ceGIdLaECWsBrpxDghw45A=;
 b=jBn0EmP8dlqd62EszEZRAJQIT4enQk5c9slyr3CDrQoMOlurg29s9wQPWvdgF41j8CQlLz
 hKAwGnlkCcANM6ZSIWnjbxYwOn692Q4lAXqjGrml7E/m2wjMfG5txSvjvjVl0bAa7NY29W
 +J02yp9sZ8Wcz8X3RFDJmpoPqt7fMK4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1720509062;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=8nq7CxDCnJxvaCPnzb5Z3ceGIdLaECWsBrpxDghw45A=;
 b=yecd4x65JvYIEqXoixtEticNUq/0sNvFHU2amOe6DIlTJTauZE+EV5hXUGbcwMnLpNJsRl
 mnhZ/ruGWKhlQQCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6D2DB1396E;
 Tue,  9 Jul 2024 07:11:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id B204GYbijGYeEAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 09 Jul 2024 07:11:02 +0000
Message-ID: <bbd92547-f915-4c92-813c-10bbaf6c4c12@suse.de>
Date: Tue, 9 Jul 2024 09:11:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/format-helper: Add conversion from XRGB8888 to BGR888
To: Aditya Garg <gargaditya08@live.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "airlied@gmail.com" <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>
Cc: Orlando Chamberlain <orlandoch.dev@gmail.com>,
 Kerem Karabay <kekrby@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <4C98332B-4E56-4314-8BDA-709AD3974899@live.com>
 <37c0df72-498b-44ad-9a47-d69f0515edd7@suse.de>
 <MA0P287MB0217A11382BDB18F82A7D442B8DB2@MA0P287MB0217.INDP287.PROD.OUTLOOK.COM>
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
In-Reply-To: <MA0P287MB0217A11382BDB18F82A7D442B8DB2@MA0P287MB0217.INDP287.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.79 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 XM_UA_NO_VERSION(0.01)[]; RCVD_TLS_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,live.com]; ARC_NA(0.00)[];
 TO_DN_EQ_ADDR_SOME(0.00)[]; TO_DN_SOME(0.00)[];
 TAGGED_RCPT(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 FREEMAIL_TO(0.00)[live.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 MID_RHS_MATCH_FROM(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[gmail.com,lists.freedesktop.org,vger.kernel.org];
 RCPT_COUNT_SEVEN(0.00)[9]; FROM_EQ_ENVFROM(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,suse.de:email]
X-Spam-Flag: NO
X-Spam-Score: -2.79
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

Am 09.07.24 um 08:10 schrieb Aditya Garg:
> Hi Thomas
>
> I found upstreamed drivers which may be using this routine.
>
> https://elixir.bootlin.com/linux/latest/A/ident/DRM_FORMAT_BGR888

These drivers support BGR888 in hardware. They don't convert pixel 
format on the fly.

>
> I guess the same logic was used to upstream all these:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/gpu/drm/drm_format_helper.c?h=v6.10-rc7&id=10cd592e639edcea50d781a07edcf3470d1f222e
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/gpu/drm/drm_format_helper.c?h=v6.10-rc7&id=56119bfb39142090fb84ac08a3f14dd48410e961
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/gpu/drm/drm_format_helper.c?h=v6.10-rc7&id=175073d694cd9db4c4ca97c978a447acc6b5cb33
>
>
> My apologies if I am wrong somewhere.

No worries.

Best regards
Thomas

>
> ________________________________________
> From: Thomas Zimmermann <tzimmermann@suse.de>
> Sent: 08 July 2024 13:00
> To: Aditya Garg; maarten.lankhorst@linux.intel.com; mripard@kernel.org; airlied@gmail.com; daniel@ffwll.ch
> Cc: Orlando Chamberlain; Kerem Karabay; dri-devel@lists.freedesktop.org; Linux Kernel Mailing List
> Subject: Re: [PATCH] drm/format-helper: Add conversion from XRGB8888 to BGR888
>
> Hi
>
> Am 05.07.24 um 13:38 schrieb Aditya Garg:
>> From: Kerem Karabay <kekrby@gmail.com>
>>
>> Add XRGB8888 emulation helper for devices that only support BGR888.
> Nothing wrong with that, but it needs a caller. Do you have a driver
> that uses this routine?
>
> Best regards
> Thomas
>
>> Signed-off-by: Kerem Karabay <kekrby@gmail.com>
>> Signed-off-by: Aditya Garg <gargaditya08@live.com>
>> ---
>>    drivers/gpu/drm/drm_format_helper.c           | 54 +++++++++++++
>>    .../gpu/drm/tests/drm_format_helper_test.c    | 81 +++++++++++++++++++
>>    include/drm/drm_format_helper.h               |  3 +
>>    3 files changed, 138 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
>> index b1be458ed..28c0e76a1 100644
>> --- a/drivers/gpu/drm/drm_format_helper.c
>> +++ b/drivers/gpu/drm/drm_format_helper.c
>> @@ -702,6 +702,57 @@ void drm_fb_xrgb8888_to_rgb888(struct iosys_map *dst, const unsigned int *dst_pi
>>    }
>>    EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb888);
>>
>> +static void drm_fb_xrgb8888_to_bgr888_line(void *dbuf, const void *sbuf, unsigned int pixels)
>> +{
>> +     u8 *dbuf8 = dbuf;
>> +     const __le32 *sbuf32 = sbuf;
>> +     unsigned int x;
>> +     u32 pix;
>> +
>> +     for (x = 0; x < pixels; x++) {
>> +             pix = le32_to_cpu(sbuf32[x]);
>> +             /* write red-green-blue to output in little endianness */
>> +             *dbuf8++ = (pix & 0x00FF0000) >> 16;
>> +             *dbuf8++ = (pix & 0x0000FF00) >> 8;
>> +             *dbuf8++ = (pix & 0x000000FF) >> 0;
>> +     }
>> +}
>> +
>> +/**
>> + * drm_fb_xrgb8888_to_bgr888 - Convert XRGB8888 to BGR888 clip buffer
>> + * @dst: Array of BGR888 destination buffers
>> + * @dst_pitch: Array of numbers of bytes between the start of two consecutive scanlines
>> + *             within @dst; can be NULL if scanlines are stored next to each other.
>> + * @src: Array of XRGB8888 source buffers
>> + * @fb: DRM framebuffer
>> + * @clip: Clip rectangle area to copy
>> + * @state: Transform and conversion state
>> + *
>> + * This function copies parts of a framebuffer to display memory and converts the
>> + * color format during the process. Destination and framebuffer formats must match. The
>> + * parameters @dst, @dst_pitch and @src refer to arrays. Each array must have at
>> + * least as many entries as there are planes in @fb's format. Each entry stores the
>> + * value for the format's respective color plane at the same index.
>> + *
>> + * This function does not apply clipping on @dst (i.e. the destination is at the
>> + * top-left corner).
>> + *
>> + * Drivers can use this function for BGR888 devices that don't natively
>> + * support XRGB8888.
>> + */
>> +void drm_fb_xrgb8888_to_bgr888(struct iosys_map *dst, const unsigned int *dst_pitch,
>> +                            const struct iosys_map *src, const struct drm_framebuffer *fb,
>> +                            const struct drm_rect *clip, struct drm_format_conv_state *state)
>> +{
>> +     static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
>> +             3,
>> +     };
>> +
>> +     drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false, state,
>> +                 drm_fb_xrgb8888_to_bgr888_line);
>> +}
>> +EXPORT_SYMBOL(drm_fb_xrgb8888_to_bgr888);
>> +
>>    static void drm_fb_xrgb8888_to_argb8888_line(void *dbuf, const void *sbuf, unsigned int pixels)
>>    {
>>        __le32 *dbuf32 = dbuf;
>> @@ -1035,6 +1086,9 @@ int drm_fb_blit(struct iosys_map *dst, const unsigned int *dst_pitch, uint32_t d
>>                } else if (dst_format == DRM_FORMAT_RGB888) {
>>                        drm_fb_xrgb8888_to_rgb888(dst, dst_pitch, src, fb, clip, state);
>>                        return 0;
>> +             } else if (dst_format == DRM_FORMAT_BGR888) {
>> +                     drm_fb_xrgb8888_to_bgr888(dst, dst_pitch, src, fb, clip, state);
>> +                     return 0;
>>                } else if (dst_format == DRM_FORMAT_ARGB8888) {
>>                        drm_fb_xrgb8888_to_argb8888(dst, dst_pitch, src, fb, clip, state);
>>                        return 0;
>> diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
>> index 08992636e..e54f0f6e7 100644
>> --- a/drivers/gpu/drm/tests/drm_format_helper_test.c
>> +++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
>> @@ -60,6 +60,11 @@ struct convert_to_rgb888_result {
>>        const u8 expected[TEST_BUF_SIZE];
>>    };
>>
>> +struct convert_to_bgr888_result {
>> +     unsigned int dst_pitch;
>> +     const u8 expected[TEST_BUF_SIZE];
>> +};
>> +
>>    struct convert_to_argb8888_result {
>>        unsigned int dst_pitch;
>>        const u32 expected[TEST_BUF_SIZE];
>> @@ -107,6 +112,7 @@ struct convert_xrgb8888_case {
>>        struct convert_to_argb1555_result argb1555_result;
>>        struct convert_to_rgba5551_result rgba5551_result;
>>        struct convert_to_rgb888_result rgb888_result;
>> +     struct convert_to_bgr888_result bgr888_result;
>>        struct convert_to_argb8888_result argb8888_result;
>>        struct convert_to_xrgb2101010_result xrgb2101010_result;
>>        struct convert_to_argb2101010_result argb2101010_result;
>> @@ -151,6 +157,10 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
>>                        .dst_pitch = TEST_USE_DEFAULT_PITCH,
>>                        .expected = { 0x00, 0x00, 0xFF },
>>                },
>> +             .bgr888_result = {
>> +                     .dst_pitch = TEST_USE_DEFAULT_PITCH,
>> +                     .expected = { 0xFF, 0x00, 0x00 },
>> +             },
>>                .argb8888_result = {
>>                        .dst_pitch = TEST_USE_DEFAULT_PITCH,
>>                        .expected = { 0xFFFF0000 },
>> @@ -217,6 +227,10 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
>>                        .dst_pitch = TEST_USE_DEFAULT_PITCH,
>>                        .expected = { 0x00, 0x00, 0xFF },
>>                },
>> +             .bgr888_result = {
>> +                     .dst_pitch = TEST_USE_DEFAULT_PITCH,
>> +                     .expected = { 0xFF, 0x00, 0x00 },
>> +             },
>>                .argb8888_result = {
>>                        .dst_pitch = TEST_USE_DEFAULT_PITCH,
>>                        .expected = { 0xFFFF0000 },
>> @@ -330,6 +344,15 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
>>                                0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0x00,
>>                        },
>>                },
>> +             .bgr888_result = {
>> +                     .dst_pitch = TEST_USE_DEFAULT_PITCH,
>> +                     .expected = {
>> +                             0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00,
>> +                             0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00,
>> +                             0x00, 0x00, 0xFF, 0xFF, 0x00, 0xFF,
>> +                             0xFF, 0xFF, 0x00, 0x00, 0xFF, 0xFF,
>> +                     },
>> +             },
>>                .argb8888_result = {
>>                        .dst_pitch = TEST_USE_DEFAULT_PITCH,
>>                        .expected = {
>> @@ -468,6 +491,17 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
>>                                0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
>>                        },
>>                },
>> +             .bgr888_result = {
>> +                     .dst_pitch = 15,
>> +                     .expected = {
>> +                             0x0E, 0x44, 0x9C, 0x11, 0x4D, 0x05, 0xA8, 0xF3, 0x03,
>> +                             0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
>> +                             0x6C, 0xF0, 0x73, 0x0E, 0x44, 0x9C, 0x11, 0x4D, 0x05,
>> +                             0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
>> +                             0xA8, 0x03, 0x03, 0x6C, 0xF0, 0x73, 0x0E, 0x44, 0x9C,
>> +                             0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
>> +                     },
>> +             },
>>                .argb8888_result = {
>>                        .dst_pitch = 20,
>>                        .expected = {
>> @@ -914,6 +948,52 @@ static void drm_test_fb_xrgb8888_to_rgb888(struct kunit *test)
>>        KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
>>    }
>>
>> +static void drm_test_fb_xrgb8888_to_bgr888(struct kunit *test)
>> +{
>> +     const struct convert_xrgb8888_case *params = test->param_value;
>> +     const struct convert_to_bgr888_result *result = &params->bgr888_result;
>> +     size_t dst_size;
>> +     u8 *buf = NULL;
>> +     __le32 *xrgb8888 = NULL;
>> +     struct iosys_map dst, src;
>> +
>> +     struct drm_framebuffer fb = {
>> +             .format = drm_format_info(DRM_FORMAT_XRGB8888),
>> +             .pitches = { params->pitch, 0, 0 },
>> +     };
>> +
>> +     dst_size = conversion_buf_size(DRM_FORMAT_BGR888, result->dst_pitch,
>> +                                    &params->clip, 0);
>> +     KUNIT_ASSERT_GT(test, dst_size, 0);
>> +
>> +     buf = kunit_kzalloc(test, dst_size, GFP_KERNEL);
>> +     KUNIT_ASSERT_NOT_ERR_OR_NULL(test, buf);
>> +     iosys_map_set_vaddr(&dst, buf);
>> +
>> +     xrgb8888 = cpubuf_to_le32(test, params->xrgb8888, TEST_BUF_SIZE);
>> +     KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xrgb8888);
>> +     iosys_map_set_vaddr(&src, xrgb8888);
>> +
>> +     /*
>> +      * BGR888 expected results are already in little-endian
>> +      * order, so there's no need to convert the test output.
>> +      */
>> +     drm_fb_xrgb8888_to_bgr888(&dst, &result->dst_pitch, &src, &fb, &params->clip,
>> +                               &fmtcnv_state);
>> +     KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
>> +
>> +     buf = dst.vaddr; /* restore original value of buf */
>> +     memset(buf, 0, dst_size);
>> +
>> +     int blit_result = 0;
>> +
>> +     blit_result = drm_fb_blit(&dst, &result->dst_pitch, DRM_FORMAT_BGR888, &src, &fb, &params->clip,
>> +                               &fmtcnv_state);
>> +
>> +     KUNIT_EXPECT_FALSE(test, blit_result);
>> +     KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
>> +}
>> +
>>    static void drm_test_fb_xrgb8888_to_argb8888(struct kunit *test)
>>    {
>>        const struct convert_xrgb8888_case *params = test->param_value;
>> @@ -1851,6 +1931,7 @@ static struct kunit_case drm_format_helper_test_cases[] = {
>>        KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_argb1555, convert_xrgb8888_gen_params),
>>        KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_rgba5551, convert_xrgb8888_gen_params),
>>        KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_rgb888, convert_xrgb8888_gen_params),
>> +     KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_bgr888, convert_xrgb8888_gen_params),
>>        KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_argb8888, convert_xrgb8888_gen_params),
>>        KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_xrgb2101010, convert_xrgb8888_gen_params),
>>        KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_argb2101010, convert_xrgb8888_gen_params),
>> diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
>> index f13b34e0b..b53cf85ca 100644
>> --- a/include/drm/drm_format_helper.h
>> +++ b/include/drm/drm_format_helper.h
>> @@ -95,6 +95,9 @@ void drm_fb_xrgb8888_to_rgba5551(struct iosys_map *dst, const unsigned int *dst_
>>    void drm_fb_xrgb8888_to_rgb888(struct iosys_map *dst, const unsigned int *dst_pitch,
>>                               const struct iosys_map *src, const struct drm_framebuffer *fb,
>>                               const struct drm_rect *clip, struct drm_format_conv_state *state);
>> +void drm_fb_xrgb8888_to_bgr888(struct iosys_map *dst, const unsigned int *dst_pitch,
>> +                            const struct iosys_map *src, const struct drm_framebuffer *fb,
>> +                            const struct drm_rect *clip, struct drm_format_conv_state *state);
>>    void drm_fb_xrgb8888_to_argb8888(struct iosys_map *dst, const unsigned int *dst_pitch,
>>                                 const struct iosys_map *src, const struct drm_framebuffer *fb,
>>                                 const struct drm_rect *clip, struct drm_format_conv_state *state);
> --
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

