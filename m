Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B15960293
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 08:57:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 788A510E2A4;
	Tue, 27 Aug 2024 06:57:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="vMWSWPjU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AJnLOK7P";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vMWSWPjU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AJnLOK7P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 856B010E2A4;
 Tue, 27 Aug 2024 06:57:17 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2F85821AFB;
 Tue, 27 Aug 2024 06:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724741836; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=hYBWBuGQGVoIMqDsVDjCgCorhqQl1NYnS/tP5hD7rWo=;
 b=vMWSWPjUvjGgC2rOZ2synym9zQ+jABAmUnujcYRwm8InRbXrp5dfjFZaNx4gbF3G+7sELU
 T4faF7f0t9VBsOLBaNVzi5RN3RmzJ54VOaSYFWt1MjcAvFAZTEQgYTiHYYor1VtJxaeSDT
 PN6HjBzFqFsAhdIW7N5tdv1WuHbzj2U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724741836;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=hYBWBuGQGVoIMqDsVDjCgCorhqQl1NYnS/tP5hD7rWo=;
 b=AJnLOK7P/jbX7yB3Mf2jyP4k37pdU90wmElAGGic9Id0GJ0kEWpq3LPXwNWtIwVP6K/S0U
 JP0c/t4JPOylTSCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724741836; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=hYBWBuGQGVoIMqDsVDjCgCorhqQl1NYnS/tP5hD7rWo=;
 b=vMWSWPjUvjGgC2rOZ2synym9zQ+jABAmUnujcYRwm8InRbXrp5dfjFZaNx4gbF3G+7sELU
 T4faF7f0t9VBsOLBaNVzi5RN3RmzJ54VOaSYFWt1MjcAvFAZTEQgYTiHYYor1VtJxaeSDT
 PN6HjBzFqFsAhdIW7N5tdv1WuHbzj2U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724741836;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=hYBWBuGQGVoIMqDsVDjCgCorhqQl1NYnS/tP5hD7rWo=;
 b=AJnLOK7P/jbX7yB3Mf2jyP4k37pdU90wmElAGGic9Id0GJ0kEWpq3LPXwNWtIwVP6K/S0U
 JP0c/t4JPOylTSCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AA81C13724;
 Tue, 27 Aug 2024 06:57:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id cSBYKMt4zWZycAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 27 Aug 2024 06:57:15 +0000
Message-ID: <c9c9e482-f80c-4158-8dc4-695f8e0c62cd@suse.de>
Date: Tue, 27 Aug 2024 08:57:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: Fix kerneldoc for "Returns" section
To: Andi Shyti <andi.shyti@linux.intel.com>, renjun wang <renjunw0@foxmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com, 
 daniel@ffwll.ch, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 tursulin@ursulin.net, lyude@redhat.com, imre.deak@intel.com,
 Wayne.Lin@amd.com, ville.syrjala@linux.intel.com, vidya.srinivas@intel.com,
 jouni.hogander@intel.com, janusz.krzysztofik@linux.intel.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org
References: <tencent_37A873672B5CD20DECAF99DEDAC5E45C3106@qq.com>
 <Zsz9pwQ3m9zHrjo-@ashyti-mobl2.lan>
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
In-Reply-To: <Zsz9pwQ3m9zHrjo-@ashyti-mobl2.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_TLS_ALL(0.00)[]; ARC_NA(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[foxmail.com,gmail.com];
 MIME_TRACE(0.00)[0:+]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RCPT_COUNT_TWELVE(0.00)[20]; TO_DN_SOME(0.00)[];
 FREEMAIL_TO(0.00)[linux.intel.com,foxmail.com];
 MID_RHS_MATCH_FROM(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,gmail.com,ffwll.ch,intel.com,ursulin.net,redhat.com,amd.com,lists.freedesktop.org,vger.kernel.org];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
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

Am 27.08.24 um 00:11 schrieb Andi Shyti:
> Hi Renjun,
>
> On Sat, Aug 24, 2024 at 04:36:34PM +0800, renjun wang wrote:
>> The blank line between title "Returns:" and detail description is not
>> allowed, otherwise the title will goes under the description block in
>> generated .html file after running `make htmldocs`.
>>
>> There are a few examples for current kerneldoc:
>> https://www.kernel.org/doc/html/latest/gpu/drm-kms.html#c.drm_crtc_commit_wait
>> https://www.kernel.org/doc/html/latest/gpu/drm-kms.html#c.drm_atomic_get_crtc_state
>> https://www.kernel.org/doc/html/latest/gpu/i915.html#c.i915_vma_pin_fence
>>
>> Signed-off-by: renjun wang <renjunw0@foxmail.com>
>> ---
>>   drivers/gpu/drm/display/drm_dp_mst_topology.c | 4 ----
>>   drivers/gpu/drm/drm_atomic.c                  | 6 ------
>>   drivers/gpu/drm/drm_atomic_helper.c           | 2 --
>>   drivers/gpu/drm/drm_file.c                    | 7 -------
>>   drivers/gpu/drm/drm_gem.c                     | 7 ++-----
>>   drivers/gpu/drm/drm_modes.c                   | 1 -
>>   drivers/gpu/drm/drm_rect.c                    | 1 -
>>   drivers/gpu/drm/drm_vblank.c                  | 2 --
>>   drivers/gpu/drm/i915/gem/i915_gem_object.h    | 1 -
>>   drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c  | 1 -
>>   drivers/gpu/drm/i915/i915_vma.h               | 1 -
>>   11 files changed, 2 insertions(+), 31 deletions(-)
> next time, please, split the series so that each component goes
> to the right branch.

My fault. Apologies if I crossed a line by just merging it into 
drm-misc. It's just doc syntax, so I didn't think it was a big deal.

Best regards
Thomas

>
> Andi

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

