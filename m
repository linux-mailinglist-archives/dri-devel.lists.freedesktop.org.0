Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E48B01B5A
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 14:01:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEA6710EA27;
	Fri, 11 Jul 2025 12:01:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="FEap3PrB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mf5azg8X";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FEap3PrB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mf5azg8X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EFAD10EA26
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 12:01:44 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D9E8721201;
 Fri, 11 Jul 2025 12:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1752235302; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=rGEIWdbZDrxzG+bK9a7yTnkybN2m75u5oUTyvqabk2M=;
 b=FEap3PrBgFauhwow1pjUerN45sK5wehIh+SK6DWPDeckDcK6kE8JjbdL2YMBoW9Xwa4RPt
 0hPxjMgl5Ie45ndT25w5xsLRsvI9p3vFnZXNouWOHGJAWXX8EtpqVH993ad7WsoluT/U2i
 JUrExS+jDFV9B1JdbBTH/r4yOm2Hc3E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1752235302;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=rGEIWdbZDrxzG+bK9a7yTnkybN2m75u5oUTyvqabk2M=;
 b=mf5azg8XUmvO9fJJfRdZZYbtCibN0EceE6gQa6H4VxEHja5vOc5v8Yaz1wHgrj45ltYjGX
 xeZpb50nm4NujsBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1752235302; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=rGEIWdbZDrxzG+bK9a7yTnkybN2m75u5oUTyvqabk2M=;
 b=FEap3PrBgFauhwow1pjUerN45sK5wehIh+SK6DWPDeckDcK6kE8JjbdL2YMBoW9Xwa4RPt
 0hPxjMgl5Ie45ndT25w5xsLRsvI9p3vFnZXNouWOHGJAWXX8EtpqVH993ad7WsoluT/U2i
 JUrExS+jDFV9B1JdbBTH/r4yOm2Hc3E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1752235302;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=rGEIWdbZDrxzG+bK9a7yTnkybN2m75u5oUTyvqabk2M=;
 b=mf5azg8XUmvO9fJJfRdZZYbtCibN0EceE6gQa6H4VxEHja5vOc5v8Yaz1wHgrj45ltYjGX
 xeZpb50nm4NujsBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5EE2F1388B;
 Fri, 11 Jul 2025 12:01:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id wX6/FSb9cGj9HwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 11 Jul 2025 12:01:42 +0000
Message-ID: <15333dc0-a1bc-469f-9af3-865e2c836e1c@suse.de>
Date: Fri, 11 Jul 2025 14:01:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] Revert "drm/virtio: Use dma_buf from GEM object
 instance"
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: simona@ffwll.ch, airlied@gmail.com, christian.koenig@amd.com,
 torvalds@linux-foundation.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, l.stach@pengutronix.de, linux+etnaviv@armlinux.org.uk,
 kraxel@redhat.com, christian.gmeiner@gmail.com, gurchetansingh@chromium.org,
 olvaffe@gmail.com, zack.rusin@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, virtualization@lists.linux.dev,
 intel-gfx@lists.freedesktop.org
References: <20250711093744.120962-1-tzimmermann@suse.de>
 <20250711093744.120962-4-tzimmermann@suse.de>
 <9058368a-0e5b-4cb5-a04f-6feaa80329a0@collabora.com>
 <aHD2LmTe238vh5BS@phenom.ffwll.local>
 <cf564056-ef21-409d-a37c-1a1f85c98a01@collabora.com>
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
In-Reply-To: <cf564056-ef21-409d-a37c-1a1f85c98a01@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 TAGGED_RCPT(0.00)[etnaviv];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 RCPT_COUNT_TWELVE(0.00)[20]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; RCVD_TLS_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; TO_DN_SOME(0.00)[];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[ffwll.ch,gmail.com,amd.com,linux-foundation.org,linux.intel.com,kernel.org,pengutronix.de,armlinux.org.uk,redhat.com,chromium.org,broadcom.com,lists.freedesktop.org,lists.linux.dev];
 MID_RHS_MATCH_FROM(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email, suse.de:mid,
 imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -2.80
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

Am 11.07.25 um 13:49 schrieb Dmitry Osipenko:
> On 7/11/25 14:31, Simona Vetter wrote:
>> On Fri, Jul 11, 2025 at 02:29:04PM +0300, Dmitry Osipenko wrote:
>>> On 7/11/25 12:35, Thomas Zimmermann wrote:
>>>> This reverts commit 415cb45895f43015515473fbc40563ca5eec9a7c.
>>>>
>>>> Reverting because the fix-up commits are suspected to cause regressions.
>>>>
>>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> Are the fixes and stable tags missing in the patches? AFAICT, the intent
>>> is to fix stable 6.15 kernel regression.
>> Yes, I'll add them when merging to drm-fixes.
> On a second look, I don't see the reverted commits in 6.15, so only
> 6.16-rc should be affected.
>
>>>> ---
>>>>   drivers/gpu/drm/virtio/virtgpu_prime.c | 5 +++--
>>>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/virtio/virtgpu_prime.c b/drivers/gpu/drm/virtio/virtgpu_prime.c
>>>> index 722cde5e2d86..97aaee26cb02 100644
>>>> --- a/drivers/gpu/drm/virtio/virtgpu_prime.c
>>>> +++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
>>>> @@ -204,15 +204,16 @@ static void virtgpu_dma_buf_free_obj(struct drm_gem_object *obj)
>>>>   {
>>>>   	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
>>>>   	struct virtio_gpu_device *vgdev = obj->dev->dev_private;
>>>> +	struct dma_buf_attachment *attach = obj->import_attach;
>>>>   
>>>>   	if (drm_gem_is_imported(obj)) {
>>>> -		struct dma_buf *dmabuf = bo->dma_buf;
>>>> +		struct dma_buf *dmabuf = attach->dmabuf;
>>> Nit: I'd write this as `dmabuf = obj->import_attach->dmabuf` for more
>>> consistency with drm_gem_is_imported()
>> Reverts shouldn't have any additional changes, even style nits imo, so
>> I'll leave it as-is.
> AFAICS, this patch is not a direct/clean revert, it reverts two commits
> with manual edit. There is 44b6535d8ace on top of the reverted
> 415cb45895f4 and final result isn't same as a revert of 415cb45895f4.

It's exactly the revert mentioned in the commit message. There was a 
conflict at

-		struct dma_buf *dmabuf = bo->dma_buf;
+		struct dma_buf *dmabuf = attach->dmabuf;


which I resolved.

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

