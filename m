Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E587C4C510
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 09:15:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4F7910E4FE;
	Tue, 11 Nov 2025 08:15:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="ZL3RqOdI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UF3rdVgj";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zHisbUky";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9Yu1l3jp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 978F110E4FE
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Nov 2025 08:15:25 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id F3E372191A;
 Tue, 11 Nov 2025 08:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1762848924; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=hdLZgHY0/h2Qy/iL5GltA3Uazbn7GEeiuIDoIwRysjE=;
 b=ZL3RqOdIKZ97HKb0TzjfapUdODH6Dju0AjK6XpQc0OvkUBJny1dPvgPw4aoi38rTTxWPJf
 gIrIgBLApsWVg7SbXHhO702FUYknOpmU3JVWjtA5hyZdBuXNqQo9KgCYJTGfYIRPGsztF1
 iBgF1qYq6FrleT0z2HHR+85PlBjzFa0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1762848924;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=hdLZgHY0/h2Qy/iL5GltA3Uazbn7GEeiuIDoIwRysjE=;
 b=UF3rdVgjiFZYOZMgGZMWKZiNT72eZzHyUuMU8dgj1jfK6Qa2deMufd7Z5F/9VvV++Xw3WV
 75MBlzZFSHyXbaBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1762848923; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=hdLZgHY0/h2Qy/iL5GltA3Uazbn7GEeiuIDoIwRysjE=;
 b=zHisbUkynO9KOixp6si3Q1p8Q9VgWZQ+2dp4pcxP0P7uwhiMGGKm6bRKZfrL1oN8eea5mB
 r9TECRSaDEdtItnfsbGOSxNSFFHxtsrFElX0V/353g7YSXg3tUH1vuVUV/FoEHaiqxUmhW
 lpHhLdRK9+L4adbsvdXmDjc/Wat5i7s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1762848923;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=hdLZgHY0/h2Qy/iL5GltA3Uazbn7GEeiuIDoIwRysjE=;
 b=9Yu1l3jp2kStMSyQlKobbdTDyLIkuSVEesiHaPSpItO/cyHFvwViJPXUchsRw9udifkMOj
 m0noLbh5x/mktmBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C6ADC14862;
 Tue, 11 Nov 2025 08:15:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id AymnLpvwEmnQJAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 11 Nov 2025 08:15:23 +0000
Message-ID: <11692ab0-7ef1-4cfc-84dc-0e55dfd7d364@suse.de>
Date: Tue, 11 Nov 2025 09:14:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/24] drm/vblank: Unexport drm_wait_one_vblank()
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 ville.syrjala@linux.intel.com
References: <cover.1762791343.git.jani.nikula@intel.com>
 <006a8dcc17c710a889a0a0e2ede5ebc2c13698e1.1762791343.git.jani.nikula@intel.com>
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
In-Reply-To: <006a8dcc17c710a889a0a0e2ede5ebc2c13698e1.1762791343.git.jani.nikula@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_FIVE(0.00)[5];
 FROM_EQ_ENVFROM(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email, suse.com:url, suse.de:email,
 suse.de:mid, imap1.dmz-prg2.suse.org:helo]
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
> From: Thomas Zimmermann <tzimmermann@suse.de>
>
> Make drm_wait_on_vblank() static. The function is an internal interface
> and not invoked directly by drivers.

I forgot about that patch. Thanks for picking it up.

>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>   drivers/gpu/drm/drm_vblank.c | 14 +-------------
>   include/drm/drm_vblank.h     |  1 -
>   2 files changed, 1 insertion(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> index 32d013c5c8fc..c15d6d9d0082 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c
> @@ -1286,18 +1286,7 @@ void drm_crtc_vblank_put(struct drm_crtc *crtc)
>   }
>   EXPORT_SYMBOL(drm_crtc_vblank_put);
>   
> -/**
> - * drm_wait_one_vblank - wait for one vblank
> - * @dev: DRM device
> - * @pipe: CRTC index
> - *
> - * This waits for one vblank to pass on @pipe, using the irq driver interfaces.
> - * It is a failure to call this when the vblank irq for @pipe is disabled, e.g.
> - * due to lack of driver support or because the crtc is off.
> - *
> - * This is the legacy version of drm_crtc_wait_one_vblank().
> - */
> -void drm_wait_one_vblank(struct drm_device *dev, unsigned int pipe)
> +static void drm_wait_one_vblank(struct drm_device *dev, unsigned int pipe)
>   {
>   	struct drm_vblank_crtc *vblank = drm_vblank_crtc(dev, pipe);
>   	int ret;
> @@ -1321,7 +1310,6 @@ void drm_wait_one_vblank(struct drm_device *dev, unsigned int pipe)
>   
>   	drm_vblank_put(dev, pipe);
>   }
> -EXPORT_SYMBOL(drm_wait_one_vblank);
>   
>   /**
>    * drm_crtc_wait_one_vblank - wait for one vblank
> diff --git a/include/drm/drm_vblank.h b/include/drm/drm_vblank.h
> index ffa564d79638..94ee09b48895 100644
> --- a/include/drm/drm_vblank.h
> +++ b/include/drm/drm_vblank.h
> @@ -302,7 +302,6 @@ bool drm_handle_vblank(struct drm_device *dev, unsigned int pipe);
>   bool drm_crtc_handle_vblank(struct drm_crtc *crtc);
>   int drm_crtc_vblank_get(struct drm_crtc *crtc);
>   void drm_crtc_vblank_put(struct drm_crtc *crtc);
> -void drm_wait_one_vblank(struct drm_device *dev, unsigned int pipe);
>   void drm_crtc_wait_one_vblank(struct drm_crtc *crtc);
>   void drm_crtc_vblank_off(struct drm_crtc *crtc);
>   void drm_crtc_vblank_reset(struct drm_crtc *crtc);

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


