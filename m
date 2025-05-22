Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9336AC0B12
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 14:05:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AF5010E997;
	Thu, 22 May 2025 12:05:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="jO8SPTal";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="EHSiWKXw";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jO8SPTal";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="EHSiWKXw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DC4010EA0A
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 12:05:10 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B72701F46E;
 Thu, 22 May 2025 12:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1747915500; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=jB4ROLoYahmMoJ9M6g8d5ieFRG77/2ad3N4BfNFkFJE=;
 b=jO8SPTalWOPimjSA3gTLrZNV55D/JCrpyoARlnG4UszWyEHO6ef06/ckQbf8gda2VdXnfw
 nn90oj2d9Yuz6AQzoMQde1mIBo3gy9tCeD1/sBg/JR9uj+zqSd3WW7jHIGzJtnx0BuL691
 BNvkcTjOPGPRSiFedUVmh9zzNACOe2Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1747915500;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=jB4ROLoYahmMoJ9M6g8d5ieFRG77/2ad3N4BfNFkFJE=;
 b=EHSiWKXwYRCRXFxt2W4MdA0XgztY8C1q33F5FtWS7AcmnFGkgftdVZPJvtI1t9s0Mf9VEZ
 xRANL/8h7yZCmKDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1747915500; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=jB4ROLoYahmMoJ9M6g8d5ieFRG77/2ad3N4BfNFkFJE=;
 b=jO8SPTalWOPimjSA3gTLrZNV55D/JCrpyoARlnG4UszWyEHO6ef06/ckQbf8gda2VdXnfw
 nn90oj2d9Yuz6AQzoMQde1mIBo3gy9tCeD1/sBg/JR9uj+zqSd3WW7jHIGzJtnx0BuL691
 BNvkcTjOPGPRSiFedUVmh9zzNACOe2Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1747915500;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=jB4ROLoYahmMoJ9M6g8d5ieFRG77/2ad3N4BfNFkFJE=;
 b=EHSiWKXwYRCRXFxt2W4MdA0XgztY8C1q33F5FtWS7AcmnFGkgftdVZPJvtI1t9s0Mf9VEZ
 xRANL/8h7yZCmKDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 96481137B8;
 Thu, 22 May 2025 12:05:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id c9PeI+wSL2jGZwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 22 May 2025 12:05:00 +0000
Message-ID: <73d63285-f9c8-4306-b269-901faa2031ee@suse.de>
Date: Thu, 22 May 2025 14:05:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] iosys: hide internal details of implementation.
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
References: <20250522065519.318013-1-airlied@gmail.com>
 <20250522065519.318013-9-airlied@gmail.com>
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
In-Reply-To: <20250522065519.318013-9-airlied@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -1.30
X-Spamd-Result: default: False [-1.30 / 50.00]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 FREEMAIL_TO(0.00)[gmail.com,lists.freedesktop.org];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[]; TO_DN_SOME(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCPT_COUNT_THREE(0.00)[3];
 MID_RHS_MATCH_FROM(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCVD_TLS_ALL(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
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

Am 22.05.25 um 08:52 schrieb Dave Airlie:
> From: Dave Airlie <airlied@redhat.com>
>
> Now hide the current implementation details, to catch any new
> users entering the tree and trying to trick us up.
>
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>   include/linux/iosys-map.h | 48 +++++++++++++++++++--------------------
>   1 file changed, 24 insertions(+), 24 deletions(-)
>
> diff --git a/include/linux/iosys-map.h b/include/linux/iosys-map.h
> index 5ce5df1db60a..a6c2cc9ca756 100644
> --- a/include/linux/iosys-map.h
> +++ b/include/linux/iosys-map.h
> @@ -108,25 +108,25 @@
>    */
>   struct iosys_map {

Instead of renaming, can we simply add a /* private: */ comment like in 
[1]? This could be done in patch 1.

Best regards
Thomas


[1] 
https://elixir.bootlin.com/linux/v6.14.7/source/include/drm/drm_mm.h#L164

>   	union {
> -		void __iomem *vaddr_iomem;
> -		void *vaddr;
> +		void __iomem *_vaddr_iomem;
> +		void *_vaddr;
>   	};
> -	bool is_iomem;
> +	bool _is_iomem;
>   };
>   
>   static inline bool iosys_map_is_iomem(const struct iosys_map *map)
>   {
> -	return map->is_iomem;
> +	return map->_is_iomem;
>   }
>   
>   static inline void __iomem *iosys_map_ioptr(const struct iosys_map *map)
>   {
> -	return map->vaddr_iomem;
> +	return map->_vaddr_iomem;
>   }
>   
>   static inline void *iosys_map_ptr(const struct iosys_map *map)
>   {
> -       return map->vaddr;
> +       return map->_vaddr;
>   }
>   
>   /**
> @@ -135,8 +135,8 @@ static inline void *iosys_map_ptr(const struct iosys_map *map)
>    */
>   #define IOSYS_MAP_INIT_VADDR(vaddr_)	\
>   	{				\
> -		.vaddr = (vaddr_),	\
> -		.is_iomem = false,	\
> +		._vaddr = (vaddr_),	\
> +		._is_iomem = false,	\
>   	}
>   
>   /**
> @@ -145,8 +145,8 @@ static inline void *iosys_map_ptr(const struct iosys_map *map)
>    */
>   #define IOSYS_MAP_INIT_VADDR_IOMEM(vaddr_iomem_)	\
>   	{						\
> -		.vaddr_iomem = (vaddr_iomem_),		\
> -		.is_iomem = true,			\
> +		._vaddr_iomem = (vaddr_iomem_),		\
> +		._is_iomem = true,			\
>   	}
>   
>   /**
> @@ -197,8 +197,8 @@ static inline void *iosys_map_ptr(const struct iosys_map *map)
>    */
>   static inline void iosys_map_set_vaddr(struct iosys_map *map, void *vaddr)
>   {
> -	map->vaddr = vaddr;
> -	map->is_iomem = false;
> +	map->_vaddr = vaddr;
> +	map->_is_iomem = false;
>   }
>   
>   /**
> @@ -211,8 +211,8 @@ static inline void iosys_map_set_vaddr(struct iosys_map *map, void *vaddr)
>   static inline void iosys_map_set_vaddr_iomem(struct iosys_map *map,
>   					     void __iomem *vaddr_iomem)
>   {
> -	map->vaddr_iomem = vaddr_iomem;
> -	map->is_iomem = true;
> +	map->_vaddr_iomem = vaddr_iomem;
> +	map->_is_iomem = true;
>   }
>   
>   /**
> @@ -229,12 +229,12 @@ static inline void iosys_map_set_vaddr_iomem(struct iosys_map *map,
>   static inline bool iosys_map_is_equal(const struct iosys_map *lhs,
>   				      const struct iosys_map *rhs)
>   {
> -	if (lhs->is_iomem != rhs->is_iomem)
> +	if (lhs->_is_iomem != rhs->_is_iomem)
>   		return false;
> -	else if (lhs->is_iomem)
> -		return lhs->vaddr_iomem == rhs->vaddr_iomem;
> +	else if (lhs->_is_iomem)
> +		return lhs->_vaddr_iomem == rhs->_vaddr_iomem;
>   	else
> -		return lhs->vaddr == rhs->vaddr;
> +		return lhs->_vaddr == rhs->_vaddr;
>   }
>   
>   /**
> @@ -279,11 +279,11 @@ static inline bool iosys_map_is_set(const struct iosys_map *map)
>    */
>   static inline void iosys_map_clear(struct iosys_map *map)
>   {
> -	if (map->is_iomem) {
> -		map->vaddr_iomem = NULL;
> -		map->is_iomem = false;
> +	if (map->_is_iomem) {
> +		map->_vaddr_iomem = NULL;
> +		map->_is_iomem = false;
>   	} else {
> -		map->vaddr = NULL;
> +		map->_vaddr = NULL;
>   	}
>   }
>   
> @@ -338,9 +338,9 @@ static inline void iosys_map_memcpy_from(void *dst, const struct iosys_map *src,
>   static inline void iosys_map_incr(struct iosys_map *map, size_t incr)
>   {
>   	if (iosys_map_is_iomem(map))
> -		map->vaddr_iomem += incr;
> +		map->_vaddr_iomem += incr;
>   	else
> -		map->vaddr += incr;
> +		map->_vaddr += incr;
>   }
>   
>   /**

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

