Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8285878FBC
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 09:31:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 075A410FDDD;
	Tue, 12 Mar 2024 08:31:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="YfcvIilb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hxfe/spn";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YfcvIilb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hxfe/spn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B0C310FDDD
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 08:31:04 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BC71737445;
 Tue, 12 Mar 2024 08:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1710232262; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=AGlnmPv0lfHidIIxXfv+Erf5+8tGkP3JSrqEGw4oP1A=;
 b=YfcvIilbTMo8ef5MDXFlmsFz7gBMonVqoOBj0zokzExnKaymTYvIQvFM7nP4pnd7qX9MaC
 1bdpDWGK2HQAA6iQ5s+LYtvz3jqupqb+7vtRKJ1JAnAfFTO3wqlQWjboq143M7263P3jLD
 eg5BOV1AaaH3/brRXmFfvGgG2a62X2Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1710232262;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=AGlnmPv0lfHidIIxXfv+Erf5+8tGkP3JSrqEGw4oP1A=;
 b=hxfe/spn6lQH8DRZz4Q0QDcDAXSEtnkjYuDOZoxV7KMijJbUFG4DMCmTxLz+t9P/+67OWi
 Rq+N6hLd9NH3hKBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1710232262; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=AGlnmPv0lfHidIIxXfv+Erf5+8tGkP3JSrqEGw4oP1A=;
 b=YfcvIilbTMo8ef5MDXFlmsFz7gBMonVqoOBj0zokzExnKaymTYvIQvFM7nP4pnd7qX9MaC
 1bdpDWGK2HQAA6iQ5s+LYtvz3jqupqb+7vtRKJ1JAnAfFTO3wqlQWjboq143M7263P3jLD
 eg5BOV1AaaH3/brRXmFfvGgG2a62X2Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1710232262;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=AGlnmPv0lfHidIIxXfv+Erf5+8tGkP3JSrqEGw4oP1A=;
 b=hxfe/spn6lQH8DRZz4Q0QDcDAXSEtnkjYuDOZoxV7KMijJbUFG4DMCmTxLz+t9P/+67OWi
 Rq+N6hLd9NH3hKBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5C6B713795;
 Tue, 12 Mar 2024 08:31:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id umMCFcYS8GXmIgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 12 Mar 2024 08:31:02 +0000
Message-ID: <6921cc7a-93c6-49a5-bf87-a166f4fcdce7@suse.de>
Date: Tue, 12 Mar 2024 09:31:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: Don't return unsupported formats in
 drm_mode_legacy_fb_format
To: Frej Drejhammar <frej.drejhammar@gmail.com>
Cc: dri-devel@lists.freedesktop.org, Russell King <linux@armlinux.org.uk>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20240310152803.3315-1-frej.drejhammar@gmail.com>
 <c3203f70-0e8c-493b-813e-1dff93a28323@suse.de> <ko7bky33d.fsf@gmail.com>
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
In-Reply-To: <ko7bky33d.fsf@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [-1.59 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; XM_UA_NO_VERSION(0.01)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; TAGGED_RCPT(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; MID_RHS_MATCH_FROM(0.00)[];
 URIBL_BLOCKED(0.00)[suse.de:email,bootlin.com:url];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 BAYES_HAM(-3.00)[100.00%]; RCPT_COUNT_TWELVE(0.00)[16];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
 FREEMAIL_TO(0.00)[gmail.com]; FUZZY_BLOCKED(0.00)[rspamd.com];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_CC(0.00)[lists.freedesktop.org,armlinux.org.uk,gmail.com,ffwll.ch,linux.intel.com,kernel.org,linaro.org,quicinc.com,ideasonboard.com,redhat.com,igalia.com];
 RCVD_TLS_ALL(0.00)[]; SUSPICIOUS_RECIPS(1.50)[]
X-Spam-Score: -1.59
X-Spam-Flag: NO
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

Am 11.03.24 um 20:34 schrieb Frej Drejhammar:
> Hi Thomas,
>
> Thanks for the review and suggestions. My experience with the drm parts
> of the kernel is limited to some weekends trying to fix the regression,
> so I'm afraid I have some questions to check my understanding before
> making a v2 of the patch.
>
> Thomas Zimmermann <tzimmermann@suse.de> writes:
>
>> I suggest to switch all fbdev code over to drm_driver_legacy_fb_format
>> <https://elixir.bootlin.com/linux/latest/C/ident/drm_driver_legacy_fb_format>()
>> first and then modify the format indrm_driver_legacy_fb_format
>> <https://elixir.bootlin.com/linux/latest/C/ident/drm_driver_legacy_fb_format>()
>> after reading it from drm_fb_legacy_fb_format().
> I see how doing the format massaging in drm_driver_legacy_fb_format()
> would fix the original regression (starting with the format returned by
> drm_mode_legacy_fb_format(), drm_fb_legacy_fb_format() is a typo,
> right?).

Yeah, a typo.

>   As drm_driver_legacy_fb_format() has only two callers,
> drm_mode_addfb() and __drm_fb_helper_find_sizes() that change is
> probably less likely to do something unintended. As far as I can tell,
> drm_driver_legacy_fb_format() is only used when userland hasn't
> specified a format or the kernel is initializing and have no format
> information. For these code paths it's clear that only formats which are
> actually supported by the hardware are meaningful.

Right.

>
> What I can't really see is what "switch all fbdev code over to
> drm_driver_legacy_fb_format" would entail and what the benefit would
> be. How do I determine when drm_mode_legacy_fb_format() should be
> replaced with drm_driver_legacy_fb_format()? I have already mistakenly
> considered the change to drm_mode_legacy_fb_format() as harmless and
> broken ofdrm... Shouldn't it be enough to make
> drm_driver_legacy_fb_format() select a format which is supported by the
> driver?

Your patch modifies drm_mode_legacy_fb_format() in a number of 
*_fbdev_*.c files. In those instances, the code could certainly use 
drm_driver_legacy_fb_format() instead.

The fbdev files provide the base for the kernel framebuffer console and 
should behave like DRM clients in userspace; just that they are 
implemented in the kernel. As userspace ioctls use 
drm_driver_legacy_fb_format(), converting the in-kernel clients makes 
sense. And that's it. We keep drm_mode_legacy_fb_format(), but call 
drm_driver_legacy_fb_format() where necessary.

About tilcdc: it uses fbdev-dma, which sets up an XRGB format [1]. 
Shouldn't this already fail? Do you see a framebuffer console?

[1] 
https://elixir.bootlin.com/linux/v6.8/source/drivers/gpu/drm/drm_fbdev_dma.c#L93



>
> Best regards,
>
> Frej
>
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

