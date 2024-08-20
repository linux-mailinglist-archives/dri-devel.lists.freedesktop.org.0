Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CC59587D5
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 15:26:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 107E310E129;
	Tue, 20 Aug 2024 13:26:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="kX1d74CT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lP0iJCeP";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kX1d74CT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lP0iJCeP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A54EB10E7D3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 13:26:01 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C5F951F83C;
 Tue, 20 Aug 2024 13:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724160359; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=UvNwgjta5GO0j0z4dnTenFFJz//uOp/E2WaQhkMWT4A=;
 b=kX1d74CTWKS6onuotU5oaERApySkv7MpMlqMsxtctkOYCVePPKtb+pTuowMVcQJrzWuPfw
 IGByhQcFKU3JNFn/ty5/+wfkD+RMQTFn7OvDDAJzXl/rsgVJqmdyDTV4EbYH+btYpNTyxw
 vx+3/dc5jkqMOtdJh+Mddu6JAIWljgQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724160359;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=UvNwgjta5GO0j0z4dnTenFFJz//uOp/E2WaQhkMWT4A=;
 b=lP0iJCePyYjoYvs+EQ9UuLI72x53mQlNC5voqU+v2RpHwD9lYWTtKtwBNv1mkgaoF21sCG
 EzR4H8HLzzJVg0DQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724160359; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=UvNwgjta5GO0j0z4dnTenFFJz//uOp/E2WaQhkMWT4A=;
 b=kX1d74CTWKS6onuotU5oaERApySkv7MpMlqMsxtctkOYCVePPKtb+pTuowMVcQJrzWuPfw
 IGByhQcFKU3JNFn/ty5/+wfkD+RMQTFn7OvDDAJzXl/rsgVJqmdyDTV4EbYH+btYpNTyxw
 vx+3/dc5jkqMOtdJh+Mddu6JAIWljgQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724160359;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=UvNwgjta5GO0j0z4dnTenFFJz//uOp/E2WaQhkMWT4A=;
 b=lP0iJCePyYjoYvs+EQ9UuLI72x53mQlNC5voqU+v2RpHwD9lYWTtKtwBNv1mkgaoF21sCG
 EzR4H8HLzzJVg0DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7DBCA13770;
 Tue, 20 Aug 2024 13:25:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id UTFmHWeZxGaKDgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 20 Aug 2024 13:25:59 +0000
Message-ID: <d2a4bf58-ce00-4ddd-a566-50a36db95cd3@suse.de>
Date: Tue, 20 Aug 2024 15:25:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/virtio: Fix host color format for big endian
 guests
To: Jocelyn Falempe <jfalempe@redhat.com>, David Airlie <airlied@redhat.com>, 
 Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev
Cc: Javier Martinez Canillas <javierm@redhat.com>
References: <20240820090908.151042-1-jfalempe@redhat.com>
 <20240820090908.151042-2-jfalempe@redhat.com>
 <efe083ed-b83b-45e8-a418-1861f535e31f@suse.de>
 <ddd41844-1d3e-4755-9013-9ae4e751c501@redhat.com>
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
In-Reply-To: <ddd41844-1d3e-4755-9013-9ae4e751c501@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Score: -4.28
X-Spamd-Result: default: False [-4.28 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.18)[-0.908]; MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_TO(0.00)[redhat.com,chromium.org,gmail.com,linux.intel.com,kernel.org,ffwll.ch,lists.freedesktop.org,lists.linux.dev];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 RCPT_COUNT_SEVEN(0.00)[11]; MIME_TRACE(0.00)[0:+];
 MID_RHS_MATCH_FROM(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
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

Am 20.08.24 um 14:55 schrieb Jocelyn Falempe:
> On 20/08/2024 14:48, Thomas Zimmermann wrote:
>> Hi
>>
>> Am 20.08.24 um 11:07 schrieb Jocelyn Falempe:
>>> The colors are inverted when testing a s390x VM on a s390x host.
>>> Changing the conversion from DRM_FORMAT -> VIRTIO_GPU_FORMAT on big
>>> endian guests fixes the colors. But it may break big-endian guest on
>>> little-endian host. In this case, the fix should be in qemu, because
>>> the host endianess is not known in the guest VM.
>>>
>>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>>> Acked-by: Javier Martinez Canillas <javierm@redhat.com>
>>> ---
>>>   drivers/gpu/drm/virtio/virtgpu_plane.c | 12 ++++++++++--
>>>   1 file changed, 10 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c 
>>> b/drivers/gpu/drm/virtio/virtgpu_plane.c
>>> index 860b5757ec3fc..0ec6ecc96eb13 100644
>>> --- a/drivers/gpu/drm/virtio/virtgpu_plane.c
>>> +++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
>>> @@ -37,16 +37,24 @@ static const uint32_t 
>>> virtio_gpu_cursor_formats[] = {
>>>       DRM_FORMAT_ARGB8888,
>>>   };
>>> +#ifdef __BIG_ENDIAN
>>> +#define VIRTIO_GPU_HOST_XRGB8888 VIRTIO_GPU_FORMAT_X8R8G8B8_UNORM
>>> +#define VIRTIO_GPU_HOST_ARGB8888 VIRTIO_GPU_FORMAT_A8R8G8B8_UNORM
>>> +#else
>>> +#define VIRTIO_GPU_HOST_XRGB8888 VIRTIO_GPU_FORMAT_B8G8R8X8_UNORM
>>> +#define VIRTIO_GPU_HOST_ARGB8888 VIRTIO_GPU_FORMAT_B8G8R8A8_UNORM
>>> +#endif
>>
>> As these defines are only used here, would it be beneficial to put 
>> the __BIG_ENDIAN branch directly around the switch statement?
>
> That was my first version, but I found it difficult to read, when I 
> mix #ifdef in a switch case.
>
>
> or maybe something like the following would be better ?
>
>
>      switch (drm_fourcc) {
> #ifdef _BIG_ENDIAN
>      case DRM_FORMAT_XRGB8888:
>         format = VIRTIO_GPU_FORMAT_X8R8G8B8_UNORM;
>          break;
>      case DRM_FORMAT_ARGB8888:
>         format = VIRTIO_GPU_FORMAT_A8R8G8B8_UNORM;
>          break;
> #else
>      case DRM_FORMAT_XRGB8888:
>         format = VIRTIO_GPU_FORMAT_B8G8R8X8_UNORM;
>          break;
>      case DRM_FORMAT_ARGB8888:
>         format = VIRTIO_GPU_FORMAT_B8G8R8A8_UNORM;
>          break;
> #endif

I have no preference. Maybe the virtio devs can comment.

Best regards
Thomas

>>
>> Best regards
>> Thomas
>>
>>> +
>>>   uint32_t virtio_gpu_translate_format(uint32_t drm_fourcc)
>>>   {
>>>       uint32_t format;
>>>       switch (drm_fourcc) {
>>>       case DRM_FORMAT_XRGB8888:
>>> -        format = VIRTIO_GPU_FORMAT_B8G8R8X8_UNORM;
>>> +        format = VIRTIO_GPU_HOST_XRGB8888;
>>>           break;
>>>       case DRM_FORMAT_ARGB8888:
>>> -        format = VIRTIO_GPU_FORMAT_B8G8R8A8_UNORM;
>>> +        format = VIRTIO_GPU_HOST_ARGB8888;
>>>           break;
>>>       default:
>>>           /*
>>
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

