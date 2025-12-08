Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6BFCAD3B4
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 14:21:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D97A10E14E;
	Mon,  8 Dec 2025 13:21:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="BogQ9Po3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uy14lm7B";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BogQ9Po3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uy14lm7B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98A7410E14E
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Dec 2025 13:21:07 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 49724338E2;
 Mon,  8 Dec 2025 13:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1765200066; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=7IFDFM8Go0rGaM7Xnzb3acVwgFDyTudwRmQxNsmq4lU=;
 b=BogQ9Po3qTkh0SAMHu96gs2YLjsy0Tt5VmuMlnkLPwkKQ2cOLn2tZwkNpsIJKw3sHlHSoN
 9knTn49esZDCDaSYOOf3Im81Vn3p1GScGAm5m/U7nu1OUl+tA2Gi4dLCpMRbzXQQ/9um89
 NDEk/mL1L4895fuDtZg3mOKFs36IP9I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1765200066;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=7IFDFM8Go0rGaM7Xnzb3acVwgFDyTudwRmQxNsmq4lU=;
 b=uy14lm7Bj50DuydyBMo4SE7D+59gqZwgQb1xKp8Akv7VGntmEACNSUxu5vvHsV4pzYBcMc
 kD9VFQCBgqWfscAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1765200066; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=7IFDFM8Go0rGaM7Xnzb3acVwgFDyTudwRmQxNsmq4lU=;
 b=BogQ9Po3qTkh0SAMHu96gs2YLjsy0Tt5VmuMlnkLPwkKQ2cOLn2tZwkNpsIJKw3sHlHSoN
 9knTn49esZDCDaSYOOf3Im81Vn3p1GScGAm5m/U7nu1OUl+tA2Gi4dLCpMRbzXQQ/9um89
 NDEk/mL1L4895fuDtZg3mOKFs36IP9I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1765200066;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=7IFDFM8Go0rGaM7Xnzb3acVwgFDyTudwRmQxNsmq4lU=;
 b=uy14lm7Bj50DuydyBMo4SE7D+59gqZwgQb1xKp8Akv7VGntmEACNSUxu5vvHsV4pzYBcMc
 kD9VFQCBgqWfscAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2949A3EA63;
 Mon,  8 Dec 2025 13:21:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id TmrjCMLQNmmZdgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 08 Dec 2025 13:21:06 +0000
Message-ID: <d81983aa-05ae-43d6-82c8-d1b80cdff0a6@suse.de>
Date: Mon, 8 Dec 2025 14:21:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3] drm/mgag200: Fix big-endian support
To: =?UTF-8?Q?Ren=C3=A9_Rebe?= <rene@exactco.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Dave Airlie <airlied@redhat.com>
References: <20251208.141827.965103015954471168.rene@exactco.de>
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
In-Reply-To: <20251208.141827.965103015954471168.rene@exactco.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.29 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.19)[-0.940]; MIME_GOOD(-0.10)[text/plain];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_THREE(0.00)[4]; RCVD_COUNT_TWO(0.00)[2];
 URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email,suse.com:url,exactco.de:email];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo, suse.de:mid,
 suse.de:email, exactco.de:email, suse.com:url]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -4.29
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

Am 08.12.25 um 14:18 schrieb René Rebe:
> Unlike the original, deleted Matrox mga driver, the new mgag200 driver
> has the XRGB frame-buffer byte swapped on big-endian "RISC"
> systems. Fix by enabling byte swapping "PowerPC" OPMODE for any
> __BIG_ENDIAN config.
>
> Fixes: 414c45310625 ("mgag200: initial g200se driver (v2)")
> Signed-off-by: René Rebe <rene@exactco.de>
> Cc: stable@kernel.org

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks again for the patch. I'll get it into upstream ASAP

Best regards
Thomas

> ---
> V3: move to func, mask prev reg content
> V2: move to atomic_update
> V3 was only compile tested, while V1/2 were tested on IBM 43p w/ T2/Linux.
> ---
>   drivers/gpu/drm/mgag200/mgag200_mode.c | 24 ++++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
>
> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
> index 951d715dea30..191037ce1029 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
> @@ -161,6 +161,29 @@ static void mgag200_set_startadd(struct mga_device *mdev,
>   	WREG_ECRT(0x00, crtcext0);
>   }
>   
> +/*
> + * Set the opmode for the hardware swapper for Big-Endian processor
> + * support for the frame buffer aperture and DMAWIN space.
> + */
> +static void mgag200_set_datasiz(struct mga_device *mdev, u32 format)
> +{
> +#if __BIG_ENDIAN
> +	u32 opmode = RREG32(MGAREG_OPMODE);
> +	opmode &= ~(GENMASK(17, 16) | GENMASK(9, 8) | GENMASK(3, 2));
> +
> +	/* Big-endian byte-swapping */
> +	switch (format) {
> +	case DRM_FORMAT_RGB565:
> +		opmode |= 0x10100;
> +		break;
> +	case DRM_FORMAT_XRGB8888:
> +		opmode |= 0x20200;
> +		break;
> +	}
> +	WREG32(MGAREG_OPMODE, opmode);
> +#endif
> +}
> +
>   void mgag200_init_registers(struct mga_device *mdev)
>   {
>   	u8 crtc11, misc;
> @@ -496,6 +519,7 @@ void mgag200_primary_plane_helper_atomic_update(struct drm_plane *plane,
>   	struct drm_atomic_helper_damage_iter iter;
>   	struct drm_rect damage;
>   
> +	mgag200_set_datasiz(mdev, fb->format->format);
>   	drm_atomic_helper_damage_iter_init(&iter, old_plane_state, plane_state);
>   	drm_atomic_for_each_plane_damage(&iter, &damage) {
>   		mgag200_handle_damage(mdev, shadow_plane_state->data, fb, &damage);

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


