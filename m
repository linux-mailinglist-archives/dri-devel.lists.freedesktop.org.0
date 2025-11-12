Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C3DC533E9
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 17:01:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3841910E769;
	Wed, 12 Nov 2025 16:01:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="f2r9ScL8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lxGWhxIF";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="b2jvlKID";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="B/HUpE8R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CBC910E769
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 16:01:26 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 57B151F45B;
 Wed, 12 Nov 2025 16:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1762963280; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=aGpsdK4cbfcvoQbBbowkqnr8HZN1s8bh7dTTaEiq06I=;
 b=f2r9ScL8rwjJvhA2sSptbBG49cg2E/rOjNFOtXcMzrraRXHPDOGHeDGdyYeMyi6gfD8UOY
 GggAgcyTxmLRsVJNAzWL95q16O1a3E68k63ijsjECA1NM8Ra1QBp+243XlsE/HRHzVnZ9s
 pIo+sFJewvdPDsWDw8C4et7RDpLmU9I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1762963280;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=aGpsdK4cbfcvoQbBbowkqnr8HZN1s8bh7dTTaEiq06I=;
 b=lxGWhxIF7xczJyjmLQ+4WsAhqkjLviuZfvmWM7P8+wkS+DzTuQaSx8HxlztsvuFSvkSwBO
 AcAkXBxrcuo/9zAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1762963276; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=aGpsdK4cbfcvoQbBbowkqnr8HZN1s8bh7dTTaEiq06I=;
 b=b2jvlKIDxYRAlN+0YREO+SP+jyPSHmpMEBFGuVPvATnOuda0sXRzi7suy0Q5q8Ba1g2bj1
 F5hrU5TnMAhYEl1MadYZMo5Sw4b4qYLeslmepXJWt2Zwu72149m6jcncyImO0IqwhjZ7Mv
 1xUZvORSOBm3t0fgkprmn8ckqE2Bv3I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1762963276;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=aGpsdK4cbfcvoQbBbowkqnr8HZN1s8bh7dTTaEiq06I=;
 b=B/HUpE8RUSWxwB3EpAYDcGSAx0pM1dsitxg/YZ0jvdDgBWB+4y+om0KZ9XR88XQviYDrV6
 5TXHrQeZvHgaOyDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3388F3EA61;
 Wed, 12 Nov 2025 16:01:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 4XVjC0yvFGkNEQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 12 Nov 2025 16:01:16 +0000
Message-ID: <6ddb8b5b-5648-4df1-b566-75f0db884709@suse.de>
Date: Wed, 12 Nov 2025 17:01:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/24] drm/vblank: pass vblank to drm_wait_vblank_reply()
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 ville.syrjala@linux.intel.com
References: <cover.1762791343.git.jani.nikula@intel.com>
 <ccb6e73a7d02b475b8ec57b0f6b5f525b110e699.1762791343.git.jani.nikula@intel.com>
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
In-Reply-To: <ccb6e73a7d02b475b8ec57b0f6b5f525b110e699.1762791343.git.jani.nikula@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-0.999]; MIME_GOOD(-0.10)[text/plain];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_FIVE(0.00)[5];
 FROM_EQ_ENVFROM(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo, intel.com:email,
 suse.com:url]
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



Am 10.11.25 um 17:17 schrieb Jani Nikula:
> Use the vblank pointer instead of a dev, pipe pair to simplify code.
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

See my comment below.

> ---
>   drivers/gpu/drm/drm_vblank.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> index 5880c43e19a0..e33b7fa6f19a 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c
> @@ -1702,7 +1702,7 @@ static u64 widen_32_to_64(u32 narrow, u64 near)
>   	return near + (s32) (narrow - near);
>   }
>   
> -static void drm_wait_vblank_reply(struct drm_device *dev, unsigned int pipe,
> +static void drm_wait_vblank_reply(struct drm_vblank_crtc *vblank,
>   				  struct drm_wait_vblank_reply *reply)
>   {
>   	ktime_t now;
> @@ -1713,7 +1713,7 @@ static void drm_wait_vblank_reply(struct drm_device *dev, unsigned int pipe,
>   	 * to store the seconds. This is safe as we always use monotonic
>   	 * timestamps since linux-4.15.
>   	 */
> -	reply->sequence = drm_vblank_count_and_time(dev, pipe, &now);
> +	reply->sequence = drm_vblank_count_and_time(vblank->dev, vblank->pipe, &now);

Did you intentionally miss converting drm_vblank_count_and_time()?

>   	ts = ktime_to_timespec64(now);
>   	reply->tval_sec = (u32)ts.tv_sec;
>   	reply->tval_usec = ts.tv_nsec / 1000;
> @@ -1785,7 +1785,7 @@ int drm_wait_vblank_ioctl(struct drm_device *dev, void *data,
>   	if (vblank->config.disable_immediate &&
>   	    drm_wait_vblank_is_query(vblwait) &&
>   	    READ_ONCE(vblank->enabled)) {
> -		drm_wait_vblank_reply(dev, pipe, &vblwait->reply);
> +		drm_wait_vblank_reply(vblank, &vblwait->reply);
>   		return 0;
>   	}
>   
> @@ -1852,7 +1852,7 @@ int drm_wait_vblank_ioctl(struct drm_device *dev, void *data,
>   	}
>   
>   	if (ret != -EINTR) {
> -		drm_wait_vblank_reply(dev, pipe, &vblwait->reply);
> +		drm_wait_vblank_reply(vblank, &vblwait->reply);
>   
>   		drm_dbg_core(dev, "crtc %d returning %u to client\n",
>   			     pipe, vblwait->reply.sequence);

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


