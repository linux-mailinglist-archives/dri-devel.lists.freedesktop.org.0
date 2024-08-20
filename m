Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5ADB957F53
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 09:22:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08DAD10E122;
	Tue, 20 Aug 2024 07:22:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="YibhQQl+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JRN2rAB8";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EWB+akhd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mOr89Axg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C71810E11F;
 Tue, 20 Aug 2024 07:22:39 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E9A17225A1;
 Tue, 20 Aug 2024 07:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724138558; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=nxM7gUEPJonsLj0wa0Ff9i77ggfnpBC1XbLXbz5KL5Y=;
 b=YibhQQl+FZUTi7j25YKgbxVB2ssPdcR0wwq6ahr4YmGz4vJxfO+I89fjbxANXeS2KW3AbK
 KNJkfxfZtV+pRMl96vmxt+fhKNhJgPuZ8nxabiKglD/QjqNTNOi2wOJoHmOdu+28zlbxF5
 YPP6/NaE7gkiDAD8iwy51ss9NlgPsHk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724138558;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=nxM7gUEPJonsLj0wa0Ff9i77ggfnpBC1XbLXbz5KL5Y=;
 b=JRN2rAB8q/LZqBm6FKi6w+8RT3fJ4Qef2RVkoom1ONCbTYI3v4XbDE4ddYrxu4Do5amtKy
 Qqv5pBXyMMqnrgCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724138556; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=nxM7gUEPJonsLj0wa0Ff9i77ggfnpBC1XbLXbz5KL5Y=;
 b=EWB+akhdb/GasL3y8Qw6RVjOtNrPMYHtGDFY54m3VKwRBUm/BMBvE0ejoH7SiLP3Cf30uD
 ScvAXIqHU85DGAvAa1TFCw3OlHeIuLROw4oOXEe8fJD9S5Eqg6f6JJdgXE1qVehY0Q9M5t
 AE60uikV1KLHiOQ7dNnBSKCQmpZQopk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724138556;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=nxM7gUEPJonsLj0wa0Ff9i77ggfnpBC1XbLXbz5KL5Y=;
 b=mOr89Axgng8lyIZnBpPjjvYPU6N3S2w9uBFkmqSm6hGOKOCzCan7owFnsaQlC936dxH4CS
 BfWPsod40dpS6cBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A110C13770;
 Tue, 20 Aug 2024 07:22:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id Dn+DJTxExGYJGQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 20 Aug 2024 07:22:36 +0000
Message-ID: <b82cb17f-4da7-4e7c-ad92-3c7c9abb45ee@suse.de>
Date: Tue, 20 Aug 2024 09:22:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/86] drm: Add client-agnostic setup helper
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: daniel@ffwll.ch, airlied@gmail.com, jfalempe@redhat.com,
 javierm@redhat.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, nouveau@lists.freedesktop.org
References: <20240816125408.310253-1-tzimmermann@suse.de>
 <20240816125408.310253-5-tzimmermann@suse.de>
 <20240818200735.GB729@pendragon.ideasonboard.com>
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
In-Reply-To: <20240818200735.GB729@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_CC(0.00)[ffwll.ch,gmail.com,redhat.com,lists.freedesktop.org];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_TLS_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCPT_COUNT_SEVEN(0.00)[10]; MID_RHS_MATCH_FROM(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid, suse.de:email,
 imap1.dmz-prg2.suse.org:helo, ideasonboard.com:email]
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

Am 18.08.24 um 22:07 schrieb Laurent Pinchart:
> Hi Thomas,
>
> Thank you for the patch.
>
> On Fri, Aug 16, 2024 at 02:22:30PM +0200, Thomas Zimmermann wrote:
>> DRM may support multiple in-kernel clients that run as soon as a DRM
>> driver has been registered. To select the client(s) in a single place,
>> introduce drm_client_setup().
>>
>> Drivers that call the new helper automatically instantiate the kernel's
>> configured default clients. Only fbdev emulation is currently supported.
>> Later versions can add support for DRM-based logging, a boot logo or even
>> a console.
> I really like the direction this is taking :-)
>
>> Some drivers handle the color mode for clients internally. Provide the
>> helper drm_client_setup_with_color_mode() for them.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>   drivers/gpu/drm/Makefile           |  1 +
>>   drivers/gpu/drm/drm_client_setup.c | 55 ++++++++++++++++++++++++++++++
>>   include/drm/drm_client_setup.h     | 12 +++++++
>>   3 files changed, 68 insertions(+)
>>   create mode 100644 drivers/gpu/drm/drm_client_setup.c
>>   create mode 100644 include/drm/drm_client_setup.h
>>
>> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
>> index 0beb55d028a8..e7fc77d1d573 100644
>> --- a/drivers/gpu/drm/Makefile
>> +++ b/drivers/gpu/drm/Makefile
>> @@ -129,6 +129,7 @@ drm_kms_helper-y := \
>>   	drm_atomic_helper.o \
>>   	drm_atomic_state_helper.o \
>>   	drm_bridge_connector.o \
>> +	drm_client_setup.o \
>>   	drm_crtc_helper.o \
>>   	drm_damage_helper.o \
>>   	drm_encoder_slave.o \
>> diff --git a/drivers/gpu/drm/drm_client_setup.c b/drivers/gpu/drm/drm_client_setup.c
>> new file mode 100644
>> index 000000000000..2e3315f5c3e2
>> --- /dev/null
>> +++ b/drivers/gpu/drm/drm_client_setup.c
>> @@ -0,0 +1,55 @@
>> +// SPDX-License-Identifier: MIT
>> +
>> +#include <drm/drm_client_setup.h>
>> +#include <drm/drm_device.h>
>> +#include <drm/drm_fbdev_client.h>
>> +#include <drm/drm_fourcc.h>
>> +#include <drm/drm_print.h>
>> +
>> +/**
>> + * drm_client_setup() - Setup in-kernel DRM clients
>> + * @dev: DRM device
>> + * @format: Preferred color format for the device. Use NULL, unless
> s/color format/pixel format/

Ah, ok.

>
>> + *          there is clearly a driver-preferred format.
>> + *
>> + * This function sets up the in-kernel DRM clients. Restore, hotplug
>> + * events and teardown are all taken care of.
>> + *
>> + * Drivers should call drm_client_setup() after registering the new
>> + * DRM device with drm_dev_register(). This function is safe to call
>> + * even when there are no connectors present. Setup will be retried
>> + * on the next hotplug event.
>> + *
>> + * The clients are destroyed by drm_dev_unregister().
>> + */
>> +void drm_client_setup(struct drm_device *dev, const struct drm_format_info *format)
>> +{
>> +	int ret;
>> +
>> +	if (!format)
>> +		format = drm_format_info(DRM_FORMAT_XRGB8888);
>> +
>> +	ret = drm_fbdev_client_setup(dev, format);
>> +	if (ret)
>> +		drm_warn(dev, "Failed to set up DRM client; error %d\n", ret);
>> +}
>> +EXPORT_SYMBOL(drm_client_setup);
>> +
>> +/**
>> + * drm_client_setup_with_color_mode() - Setup in-kernel DRM clients for color mode
>> + * @dev: DRM device
>> + * @color_mode: Preferred color mode for the device
>> + *
>> + * This function sets up the in-kernel DRM clients. It is equivalent
>> + * to drm_client_setup(), but expects a color mode as second argument.
>> + *
>> + * Do not use this function in new drivers. Prefer drm_client_setup() with a
>> + * format of NULL.
>> + */
>> +void drm_client_setup_with_color_mode(struct drm_device *dev, unsigned int color_mode)
>> +{
>> +	uint32_t fmt = drm_driver_color_mode_format(dev, color_mode);
>> +
>> +	drm_client_setup(dev, drm_format_info(fmt));
>> +}
>> +EXPORT_SYMBOL(drm_client_setup_with_color_mode);
>> diff --git a/include/drm/drm_client_setup.h b/include/drm/drm_client_setup.h
>> new file mode 100644
>> index 000000000000..f5fd1fabd4b1
>> --- /dev/null
>> +++ b/include/drm/drm_client_setup.h
>> @@ -0,0 +1,12 @@
>> +/* SPDX-License-Identifier: MIT */
>> +
>> +#ifndef DRM_CLIENT_SETUP_H
>> +#define DRM_CLIENT_SETUP_H
>> +
>> +struct drm_device;
>> +struct drm_format_info;
>> +
>> +void drm_client_setup(struct drm_device *dev, const struct drm_format_info *format);
>> +void drm_client_setup_with_color_mode(struct drm_device *dev, unsigned int color_mode);
> This is not common in DRM, so we may not want to introduce it here, but
> _Generic() gives a nice function overloading syntax:
>
> void drm_client_setup_with_format(struct drm_device *dev, const struct drm_format_info *format);
> void drm_client_setup_with_color_mode(struct drm_device *dev, unsigned int color_mode);
>
> #define drm_client_setup_(dev, format_or_color_mode)							 \
> 	_Generic(format_or_color_mode,									 \
> 		const struct drm_format_info *: drm_client_setup_with_format(dev, format_or_color_mode), \
> 		unsigned int: drm_client_setup_with_color_mode(dev, format_or_color_mode)		 \
> 	)
>
> Up to you.

The color format is really a user interface. I'd rather like to remove 
it from the implementation where possible.

Best regards
Thomas

>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>
>> +
>> +#endif

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

