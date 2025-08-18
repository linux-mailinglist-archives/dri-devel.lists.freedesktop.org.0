Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85018B29A88
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 09:09:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3C7210E3D3;
	Mon, 18 Aug 2025 07:09:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Fqe6KbI0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oipOcqni";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Fqe6KbI0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oipOcqni";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDC3310E3D3
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 07:09:42 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6ED11211CF;
 Mon, 18 Aug 2025 07:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1755500981; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=r1SKe6v7lQrzDTTSi58N3HMliy6+S9Vce6+IGxrmE3Y=;
 b=Fqe6KbI0dUMWb2RMAr7KwcMgkYuPVUlp7dQNOzFQ+A4uAWTPtnKA4f1rt6zh+mekZiJnBf
 WfInhiuXJWT09n5ze4cpEcqnbcxsedISlNBvQegYTGyMoHsGnI1n5u3wslIfXg7m25V7Zo
 vPaD8t9iE2YoXJxZj8EAbqzXD3vDe68=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1755500981;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=r1SKe6v7lQrzDTTSi58N3HMliy6+S9Vce6+IGxrmE3Y=;
 b=oipOcqniIcbMVQ5ph0g8M9r1anfO7omqNrdgo5PX/oStj+ffyYZsVjXj5Lwh9fXP3YJmLr
 5pKEH2igLsNJTDBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1755500981; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=r1SKe6v7lQrzDTTSi58N3HMliy6+S9Vce6+IGxrmE3Y=;
 b=Fqe6KbI0dUMWb2RMAr7KwcMgkYuPVUlp7dQNOzFQ+A4uAWTPtnKA4f1rt6zh+mekZiJnBf
 WfInhiuXJWT09n5ze4cpEcqnbcxsedISlNBvQegYTGyMoHsGnI1n5u3wslIfXg7m25V7Zo
 vPaD8t9iE2YoXJxZj8EAbqzXD3vDe68=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1755500981;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=r1SKe6v7lQrzDTTSi58N3HMliy6+S9Vce6+IGxrmE3Y=;
 b=oipOcqniIcbMVQ5ph0g8M9r1anfO7omqNrdgo5PX/oStj+ffyYZsVjXj5Lwh9fXP3YJmLr
 5pKEH2igLsNJTDBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 28D4013A55;
 Mon, 18 Aug 2025 07:09:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id CWVICLXRomgXDgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 18 Aug 2025 07:09:41 +0000
Message-ID: <f94151b4-893a-4758-a118-153076a20d3c@suse.de>
Date: Mon, 18 Aug 2025 09:09:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpu/drm: Replace the deprecated logging functions in
 drm_gem* files
To: Athul Raj Kollareth <krathul3152@gmail.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, skhan@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel-mentees@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250816152604.14667-1-krathul3152@gmail.com>
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
In-Reply-To: <20250816152604.14667-1-krathul3152@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_TRACE(0.00)[0:+];
 FREEMAIL_TO(0.00)[gmail.com,linux.intel.com,kernel.org,ffwll.ch,linuxfoundation.org];
 RCVD_TLS_ALL(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; RCPT_COUNT_SEVEN(0.00)[9];
 MID_RHS_MATCH_FROM(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -4.30
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

Am 16.08.25 um 17:26 schrieb Athul Raj Kollareth:
> Replace the deprecated logging functions used in drm_gem* helper files
> with their appropriate ones specified in drm_print.h.
>
> Signed-off-by: Athul Raj Kollareth <krathul3152@gmail.com>
> ---
>   drivers/gpu/drm/drm_gem.c            | 4 ++--
>   drivers/gpu/drm/drm_gem_dma_helper.c | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 4a89b6acb6af..91f528d8900f 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -102,7 +102,7 @@ drm_gem_init(struct drm_device *dev)
>   	vma_offset_manager = drmm_kzalloc(dev, sizeof(*vma_offset_manager),
>   					  GFP_KERNEL);
>   	if (!vma_offset_manager) {
> -		DRM_ERROR("out of memory\n");
> +		drm_err(dev, "out of memory\n");
>   		return -ENOMEM;
>   	}
>   
> @@ -805,7 +805,7 @@ int drm_gem_objects_lookup(struct drm_file *filp, void __user *bo_handles,
>   
>   	if (copy_from_user(handles, bo_handles, count * sizeof(u32))) {
>   		ret = -EFAULT;
> -		DRM_DEBUG("Failed to copy in GEM handles\n");
> +		drm_dbg_core(NULL, "Failed to copy in GEM handles\n");

Passing NULL here is somewhat unfortunate. I think you could pass the 
dev from the callers to drm_gem_objects_lookup() and use it here. There 
are only 3 cases AFAICT. [1]

[1] 
https://elixir.bootlin.com/linux/v6.17-rc1/C/ident/drm_gem_objects_lookup

Best regards
Thomas

>   		goto out;
>   	}
>   
> diff --git a/drivers/gpu/drm/drm_gem_dma_helper.c b/drivers/gpu/drm/drm_gem_dma_helper.c
> index 4f0320df858f..a507cf517015 100644
> --- a/drivers/gpu/drm/drm_gem_dma_helper.c
> +++ b/drivers/gpu/drm/drm_gem_dma_helper.c
> @@ -582,7 +582,7 @@ drm_gem_dma_prime_import_sg_table_vmap(struct drm_device *dev,
>   
>   	ret = dma_buf_vmap_unlocked(attach->dmabuf, &map);
>   	if (ret) {
> -		DRM_ERROR("Failed to vmap PRIME buffer\n");
> +		drm_err(dev, "Failed to vmap PRIME buffer\n");
>   		return ERR_PTR(ret);
>   	}
>   

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


