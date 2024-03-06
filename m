Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4BD873A65
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 16:12:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7A3D1131B3;
	Wed,  6 Mar 2024 15:11:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="DaqG7OJw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LmYXCuku";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DaqG7OJw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LmYXCuku";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C1CC11325D;
 Wed,  6 Mar 2024 15:11:57 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 79D876B809;
 Wed,  6 Mar 2024 15:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1709737915; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=xSHZJFgJ6t6OPb0WJLKwK70uS4BJMetdUpY9bID4bsI=;
 b=DaqG7OJw0bplBCpHuR3snpRiIMCO7SnheE9Bhh5fGRLs+7CZtEngntgIfHMBaJBxuLsZHK
 mIhLC+FuMo4jyd8nnATFzzuoavaqZSro8cxEm+zirnCVvye6EBaEfReC/Qd3aZ3mNL6FwB
 AehEJaSKETIDslbWQv/OsO0jdGPHt/M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1709737915;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=xSHZJFgJ6t6OPb0WJLKwK70uS4BJMetdUpY9bID4bsI=;
 b=LmYXCukuzvG1GMrhqTV2vYunHai0CdvnJeqG+s1VSXrvzoAxIq02HM1wFX8wxTJz5SSK+l
 NozqgCdhGS3QBPBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1709737915; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=xSHZJFgJ6t6OPb0WJLKwK70uS4BJMetdUpY9bID4bsI=;
 b=DaqG7OJw0bplBCpHuR3snpRiIMCO7SnheE9Bhh5fGRLs+7CZtEngntgIfHMBaJBxuLsZHK
 mIhLC+FuMo4jyd8nnATFzzuoavaqZSro8cxEm+zirnCVvye6EBaEfReC/Qd3aZ3mNL6FwB
 AehEJaSKETIDslbWQv/OsO0jdGPHt/M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1709737915;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=xSHZJFgJ6t6OPb0WJLKwK70uS4BJMetdUpY9bID4bsI=;
 b=LmYXCukuzvG1GMrhqTV2vYunHai0CdvnJeqG+s1VSXrvzoAxIq02HM1wFX8wxTJz5SSK+l
 NozqgCdhGS3QBPBQ==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id F41B013A79;
 Wed,  6 Mar 2024 15:11:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id /I4IOrqH6GXKdQAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Wed, 06 Mar 2024 15:11:54 +0000
Message-ID: <a562fc9c-7e11-4149-b20c-f65347fa8032@suse.de>
Date: Wed, 6 Mar 2024 16:11:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/6] drm/i915: Unregister in-kernel clients
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: joonas.lahtinen@linux.intel.com, tvrtko.ursulin@linux.intel.com,
 ville.syrjala@linux.intel.com, imre.deak@intel.com,
 tejas.upadhyay@intel.com, jouni.hogander@intel.com, javierm@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch, lucas.demarchi@intel.com,
 ogabbay@kernel.org, thomas.hellstrom@linux.intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
References: <20240301134448.31289-1-tzimmermann@suse.de>
 <20240301134448.31289-3-tzimmermann@suse.de> <ZedDHPupthhNWte8@intel.com>
 <878r2w1w93.fsf@intel.com>
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
In-Reply-To: <878r2w1w93.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=DaqG7OJw;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=LmYXCuku
X-Spamd-Result: default: False [-5.30 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 XM_UA_NO_VERSION(0.01)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 DWL_DNSWL_MED(-2.00)[suse.de:dkim]; BAYES_HAM(-3.00)[100.00%];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]; MX_GOOD(-0.01)[];
 RCPT_COUNT_TWELVE(0.00)[17];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,intel.com:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+];
 FREEMAIL_CC(0.00)[linux.intel.com,intel.com,redhat.com,gmail.com,ffwll.ch,kernel.org,lists.freedesktop.org];
 RCVD_TLS_ALL(0.00)[]; MID_RHS_MATCH_FROM(0.00)[]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 79D876B809
X-Spam-Level: 
X-Spam-Score: -5.30
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

Am 05.03.24 um 17:25 schrieb Jani Nikula:
> On Tue, 05 Mar 2024, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
>> On Fri, Mar 01, 2024 at 02:42:55PM +0100, Thomas Zimmermann wrote:
>>> Unregister all in-kernel clients before unloading the i915 driver. For
>>> other drivers, drm_dev_unregister() does this automatically. As i915
>>> does not use this helper, it has to perform the call by itself. For xe,
>>> do the same in xe_device_remove()
>>>
>>> Note that there are currently no in-kernel clients in i915 or xe. The
>>> patch prepares the drivers for a related update of their fbdev support.
>>>
>>> v7:
>>> 	* update xe driver
>>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> ---
>>>   drivers/gpu/drm/i915/i915_driver.c | 3 +++
>>>   drivers/gpu/drm/xe/xe_device.c     | 3 +++
>>>   2 files changed, 6 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
>>> index 9ee902d5b72c4..97910a85e3917 100644
>>> --- a/drivers/gpu/drm/i915/i915_driver.c
>>> +++ b/drivers/gpu/drm/i915/i915_driver.c
>>> @@ -41,6 +41,7 @@
>>>   
>>>   #include <drm/drm_aperture.h>
>>>   #include <drm/drm_atomic_helper.h>
>>> +#include <drm/drm_client.h>
>>>   #include <drm/drm_ioctl.h>
>>>   #include <drm/drm_managed.h>
>>>   #include <drm/drm_probe_helper.h>
>>> @@ -852,6 +853,8 @@ void i915_driver_remove(struct drm_i915_private *i915)
>>>   {
>>>   	intel_wakeref_t wakeref;
>>>   
>>> +	drm_client_dev_unregister(&i915->drm);
>>> +
>>>   	wakeref = intel_runtime_pm_get(&i915->runtime_pm);
>>>   
>>>   	i915_driver_unregister(i915);
>>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>>> index 919ad88f0495a..7f41f0ec819f0 100644
>>> --- a/drivers/gpu/drm/xe/xe_device.c
>>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> probably deserves a separate patch since this is one here is named 'drm/i915:'
> Or do this for both in intel_display_driver_unregister()?

Ok, sure. I'll update this. I also have to update i915 and xe in patches 
5 and 6. I don't see how I can change them individually. How would I 
best log against both of them? drm/{i915,xe}? or drm/intel?

Best regards
Thomas

>
> BR,
> Jani.
>
>
>>> @@ -9,6 +9,7 @@
>>>   
>>>   #include <drm/drm_aperture.h>
>>>   #include <drm/drm_atomic_helper.h>
>>> +#include <drm/drm_client.h>
>>>   #include <drm/drm_gem_ttm_helper.h>
>>>   #include <drm/drm_ioctl.h>
>>>   #include <drm/drm_managed.h>
>>> @@ -614,6 +615,8 @@ void xe_device_remove(struct xe_device *xe)
>>>   	struct xe_gt *gt;
>>>   	u8 id;
>>>   
>>> +	drm_client_dev_unregister(&xe->drm);
>>> +
>>>   	xe_device_remove_display(xe);
>>>   
>>>   	xe_display_fini(xe);
>>> -- 
>>> 2.43.2
>>>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

