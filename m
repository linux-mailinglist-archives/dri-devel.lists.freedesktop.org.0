Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6C095A056
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 16:48:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6314710E647;
	Wed, 21 Aug 2024 14:48:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="knC3vJ1i";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IyjTAS8b";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="knC3vJ1i";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IyjTAS8b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86EDE10E647;
 Wed, 21 Aug 2024 14:48:25 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2E8A420097;
 Wed, 21 Aug 2024 14:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724251704; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Njwnh70NiXwAexlb1G1nLuzn0Snw9bjqOKx37SY2BsM=;
 b=knC3vJ1iIadWvC3tECuOCxv/+tdVz18vVcL5RpKhN7IXqmFYCW59WPonUTDi4OhDR47sCH
 3RxmgRN+PjlrOjsAxvDTBa005swiVJG5KbVM9qp4geU7XFhgg61U7QhtxZMsuILGBqP9Vi
 96m8MvQt6QLAtM7FJ5Sbm2VPk+1HImI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724251704;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Njwnh70NiXwAexlb1G1nLuzn0Snw9bjqOKx37SY2BsM=;
 b=IyjTAS8bVx9kQqyk/by/HtkJPx0EVCTos2qrPRZg7DlHrr6xpZUin7sASpmKVNgaWjEPnx
 FZ2OrgX4MGNsymAA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724251704; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Njwnh70NiXwAexlb1G1nLuzn0Snw9bjqOKx37SY2BsM=;
 b=knC3vJ1iIadWvC3tECuOCxv/+tdVz18vVcL5RpKhN7IXqmFYCW59WPonUTDi4OhDR47sCH
 3RxmgRN+PjlrOjsAxvDTBa005swiVJG5KbVM9qp4geU7XFhgg61U7QhtxZMsuILGBqP9Vi
 96m8MvQt6QLAtM7FJ5Sbm2VPk+1HImI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724251704;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Njwnh70NiXwAexlb1G1nLuzn0Snw9bjqOKx37SY2BsM=;
 b=IyjTAS8bVx9kQqyk/by/HtkJPx0EVCTos2qrPRZg7DlHrr6xpZUin7sASpmKVNgaWjEPnx
 FZ2OrgX4MGNsymAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D4C1613770;
 Wed, 21 Aug 2024 14:48:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id OuSmMjf+xWZHPAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 21 Aug 2024 14:48:23 +0000
Message-ID: <35a03177-28a8-4d8f-9e56-d48298a4edab@suse.de>
Date: Wed, 21 Aug 2024 16:48:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Support 'nomodeset' kernel command-line option
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>, airlied@gmail.com, daniel@ffwll.ch,
 lucas.demarchi@intel.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20240821135750.102117-1-tzimmermann@suse.de>
 <172424976000.2071.18125280900868355577@gjsousa-mobl2>
 <87plq23q6m.fsf@intel.com>
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
In-Reply-To: <87plq23q6m.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-0.999]; MIME_GOOD(-0.10)[text/plain];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_TO(0.00)[linux.intel.com,intel.com,gmail.com,ffwll.ch,kernel.org];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[]; RCPT_COUNT_TWELVE(0.00)[12];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_TLS_ALL(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email, imap1.dmz-prg2.suse.org:helo,
 suse.de:email, suse.de:mid]
X-Spam-Score: -4.30
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

Am 21.08.24 um 16:29 schrieb Jani Nikula:
> On Wed, 21 Aug 2024, Gustavo Sousa <gustavo.sousa@intel.com> wrote:
>> Quoting Thomas Zimmermann (2024-08-21 10:56:59-03:00)
>>> Setting 'nomodeset' on the kernel command line disables all graphics
>>> drivers with modesetting capabilities; leaving only firmware drivers,
>>> such as simpledrm or efifb.
>>>
>>> Most DRM drivers automatically support 'nomodeset' via DRM's module
>>> helper macros. In xe, which uses regular module_init(), manually call
>>> drm_firmware_drivers_only() to test for 'nomodeset'. Do not register
>>> the driver if set.
>>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> ---
>>> drivers/gpu/drm/xe/xe_module.c | 5 +++++
>>> 1 file changed, 5 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
>>> index 923460119cec..60fb7dd26903 100644
>>> --- a/drivers/gpu/drm/xe/xe_module.c
>>> +++ b/drivers/gpu/drm/xe/xe_module.c
>>> @@ -8,6 +8,8 @@
>>> #include <linux/init.h>
>>> #include <linux/module.h>
>>>
>>> +#include <drm/drm_module.h>
>>> +
>>> #include "xe_drv.h"
>>> #include "xe_hw_fence.h"
>>> #include "xe_pci.h"
>>> @@ -92,6 +94,9 @@ static int __init xe_init(void)
>>> {
>>>          int err, i;
>>>
>>> +        if (drm_firmware_drivers_only())
>>> +                return -ENODEV;
>>> +
>> Hm... But what if xe is to be used only for compute or render? Shouldn't
>> we handle this somewhere else?
> The question becomes, what does "nomodeset" really mean here?

That function's name 'firmware drivers only' says it better than the 
option's name. We used 'nomodeset', because it was there already and had 
the correct semantics.

>
> See what i915 does in i915_module.c.

i915 and the other drivers for PCI-based hardware don't load at all. 
Drivers for external displays (e.g., SPI, USB) ignore nomodeset, as 
these displays are not initialized by firmware.

Best regards
Thomas

>
> Cc: Sima.
>
> BR,
> Jani.
>
>
>
>> Taking a quick look, xe_display_probe() might be a good candidate?
>>
>> --
>> Gustavo Sousa
>>
>>>          for (i = 0; i < ARRAY_SIZE(init_funcs); i++) {
>>>                  err = init_funcs[i].init();
>>>                  if (err) {
>>> -- 
>>> 2.46.0
>>>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

