Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C86959FFE
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 16:34:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C3D410E62D;
	Wed, 21 Aug 2024 14:34:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="E9oiG+Rs";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Cpg6VBAg";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="E9oiG+Rs";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Cpg6VBAg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9658210E62D;
 Wed, 21 Aug 2024 14:34:10 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 51080222E6;
 Wed, 21 Aug 2024 14:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724250849; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=25+uF/JcR+iqPVNtdWzLihU56nDnZ5Fq9xdATnbMRxY=;
 b=E9oiG+Rsf9wiQkxAObbhPGz1b14WScEI7DTV8ZEpoitlpYce6xDf2wR+ephpuRli89cjLz
 qwIxFqz0Yz0Qzf3UWp5MC7asxcSW4z4j27Rl/RaGeaZN4e0XT0ujsvCvAbNmYYT6d06TOq
 IggAR8mAhdjgl5IDhSwp72BuT//w8Yc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724250849;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=25+uF/JcR+iqPVNtdWzLihU56nDnZ5Fq9xdATnbMRxY=;
 b=Cpg6VBAgJ03H17UDO24KYTky0NmtDxv3d/bhTUtjMWPXN2YcF+5AdriZdoCktTyW1GniNk
 vT6ka/8UF07bTLBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724250849; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=25+uF/JcR+iqPVNtdWzLihU56nDnZ5Fq9xdATnbMRxY=;
 b=E9oiG+Rsf9wiQkxAObbhPGz1b14WScEI7DTV8ZEpoitlpYce6xDf2wR+ephpuRli89cjLz
 qwIxFqz0Yz0Qzf3UWp5MC7asxcSW4z4j27Rl/RaGeaZN4e0XT0ujsvCvAbNmYYT6d06TOq
 IggAR8mAhdjgl5IDhSwp72BuT//w8Yc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724250849;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=25+uF/JcR+iqPVNtdWzLihU56nDnZ5Fq9xdATnbMRxY=;
 b=Cpg6VBAgJ03H17UDO24KYTky0NmtDxv3d/bhTUtjMWPXN2YcF+5AdriZdoCktTyW1GniNk
 vT6ka/8UF07bTLBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 149F013770;
 Wed, 21 Aug 2024 14:34:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id a3GUA+H6xWaPNwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 21 Aug 2024 14:34:09 +0000
Message-ID: <6a5b7487-c93b-43ef-97ff-39069a9b7ddd@suse.de>
Date: Wed, 21 Aug 2024 16:34:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Support 'nomodeset' kernel command-line option
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20240821135750.102117-1-tzimmermann@suse.de>
 <62hvxo7qppsitmpdu4vvkk6raafd5a744hagwskhedeyc2euqe@xme24eje5a2m>
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
In-Reply-To: <62hvxo7qppsitmpdu4vvkk6raafd5a744hagwskhedeyc2euqe@xme24eje5a2m>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_TLS_ALL(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 ARC_NA(0.00)[]; RCPT_COUNT_SEVEN(0.00)[9];
 MIME_TRACE(0.00)[0:+]; MID_RHS_MATCH_FROM(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[linux.intel.com,intel.com,kernel.org,gmail.com,ffwll.ch,lists.freedesktop.org];
 TO_DN_SOME(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email, suse.de:mid,
 imap1.dmz-prg2.suse.org:helo, intel.com:email]
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

Am 21.08.24 um 16:24 schrieb Lucas De Marchi:
> On Wed, Aug 21, 2024 at 03:56:59PM GMT, Thomas Zimmermann wrote:
>> Setting 'nomodeset' on the kernel command line disables all graphics
>> drivers with modesetting capabilities; leaving only firmware drivers,
>> such as simpledrm or efifb.
>>
>> Most DRM drivers automatically support 'nomodeset' via DRM's module
>> helper macros. In xe, which uses regular module_init(), manually call
>> drm_firmware_drivers_only() to test for 'nomodeset'. Do not register
>> the driver if set.
>
> I see some drivers like i915 and radeon using an additional 'modeset'
> parameter... probably to be able to avoid modeset for that specific
> driver while still allowing for others?

These old per-module parameters are deprecated. We decided to keep them 
around as there's external blogs and documentation that refer to them.

>
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>> drivers/gpu/drm/xe/xe_module.c | 5 +++++
>> 1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_module.c 
>> b/drivers/gpu/drm/xe/xe_module.c
>> index 923460119cec..60fb7dd26903 100644
>> --- a/drivers/gpu/drm/xe/xe_module.c
>> +++ b/drivers/gpu/drm/xe/xe_module.c
>> @@ -8,6 +8,8 @@
>> #include <linux/init.h>
>> #include <linux/module.h>
>>
>> +#include <drm/drm_module.h>
>> +
>> #include "xe_drv.h"
>> #include "xe_hw_fence.h"
>> #include "xe_pci.h"
>> @@ -92,6 +94,9 @@ static int __init xe_init(void)
>> {
>>     int err, i;
>>
>> +    if (drm_firmware_drivers_only())
>> +        return -ENODEV;
>
> nit: being the first, without an .exit may be equivalent, but probably
> better for parity with i915 to use a xe_check_modeset() and add it as
> the first one in the table. We'd need to check for exit != NULL, though.

OK, sure. That's also how i915 works.

Best regards
Thomas

>
> Anyway,
>
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
> thanks
> Lucas De Marchi
>
>> +
>>     for (i = 0; i < ARRAY_SIZE(init_funcs); i++) {
>>         err = init_funcs[i].init();
>>         if (err) {
>> -- 
>> 2.46.0
>>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

