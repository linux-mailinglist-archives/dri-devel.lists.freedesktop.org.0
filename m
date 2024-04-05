Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB248996A6
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 09:38:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AA0310E82B;
	Fri,  5 Apr 2024 07:38:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="sz0rokIC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fMvCgRd6";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ligE8O9c";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fyBtTzZS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F269210E860
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Apr 2024 07:38:12 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 02A2A1F76B;
 Fri,  5 Apr 2024 07:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1712302691; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=CMFrQlgcRK/BXECvmxZbcef4wB455OurM4ZftLnOTvw=;
 b=sz0rokIC9CH2hDAueu852d12P1EAnnkFaT2o7DgQWegpDKYyJ68Bz1Re9DS+3ESgXRyCp5
 5Dihup6nX6vozXYUQt6SXQ54JNTsI1GbNXS83uznLB2RbctKSYS8zKvkEI3YBoPojnZw1k
 Ry6fJVD7xfkUD3DlgOF5Gin/Ybint0M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1712302691;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=CMFrQlgcRK/BXECvmxZbcef4wB455OurM4ZftLnOTvw=;
 b=fMvCgRd6UYtQjRIVMrfkwPbUpLm1CGM7p+vn/12Ky/DG8NwP/p/vqR+IruwiwKdHMTMoB9
 cIK/6hKM4O0Ua2Bg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1712302690; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=CMFrQlgcRK/BXECvmxZbcef4wB455OurM4ZftLnOTvw=;
 b=ligE8O9cTt4xzrwM5Nt6TUM67UjNcnsecxFY8oYPUFz2NTiv0G1j1y6A4b3v/Q6VntaXLU
 ZKkHB5u6EesiogZ5TezybbcUyjPcBWeBPeSsBO4sGLhtxwy3SNMSBT8tpJJ9CZi0BrEN1c
 MqCtRfRabwD6eiC2kPi5rphPX0rrN84=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1712302690;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=CMFrQlgcRK/BXECvmxZbcef4wB455OurM4ZftLnOTvw=;
 b=fyBtTzZSoWSdScmAbxURv55wAdGAD1CvRfzhBNx6Z7DkJ606um6egRCEYqKsHPuBuidYYd
 uCPifdiFrX+EL+Bg==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id C6A53139F1;
 Fri,  5 Apr 2024 07:38:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id sDFbL2GqD2boMQAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Fri, 05 Apr 2024 07:38:09 +0000
Message-ID: <1edcc654-af7a-4ea1-8387-77e57d87a6bd@suse.de>
Date: Fri, 5 Apr 2024 09:38:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] drm/udl: Untangle .get_modes() and .detect_ctx()
To: Jani Nikula <jani.nikula@linux.intel.com>, javierm@redhat.com,
 airlied@redhat.com, sean@poorly.run
Cc: dri-devel@lists.freedesktop.org,
 Ville Syrjala <ville.syrjala@linux.intel.com>
References: <20240404150857.5520-1-tzimmermann@suse.de>
 <20240404150857.5520-7-tzimmermann@suse.de> <87cyr4cmkp.fsf@intel.com>
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
In-Reply-To: <87cyr4cmkp.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.29 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 XM_UA_NO_VERSION(0.01)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 MIME_TRACE(0.00)[0:+]; TO_DN_SOME(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]; ARC_NA(0.00)[];
 RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_FIVE(0.00)[6]; FROM_EQ_ENVFROM(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap2.dmz-prg2.suse.org:helo,
 imap2.dmz-prg2.suse.org:rdns, gitlab.freedesktop.org:url, bootlin.com:url,
 suse.de:email]
X-Spam-Score: -4.29
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

Am 05.04.24 um 09:09 schrieb Jani Nikula:
> On Thu, 04 Apr 2024, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>> Provide separate implementations of .get_modes() and .detect_ctx()
>> from struct drm_connector. Switch to struct drm_edid.
>>
>> Udl's .detect() helper used to fetch the EDID from the adapter and the
>> .get_modes() helper provided display modes from the data. Switching to
>> the new helpers around struct drm_edid separates both from each other. The
>> .get_modes() helper now fetches the EDID by itself and the .detect_ctx()
>> helper only tests for its presence.
> FWIW, this is what I had for UDL in my branch of various drm_edid
> conversions:
>
> https://gitlab.freedesktop.org/jani/linux/-/commit/c6357a778182eff7acfb1eb832809377f799edaf
>
> You seem to claim that there's inherent value in separating detect and
> get_modes hooks from each other, with the former not reading the full
> EDID.

Yes. If udl stores the EDID in struct udl_connector and later uses it in 
get_modes, the detect always has to run before get_modes. That logic is 
deeply hidden in the DRM probe helpers. So in any case, I want get_modes 
to read the EDID by itself.

In detect or detect_ctx, using drm_edid_read_custom() might do 
unnecessary USB transfers. Maybe not a problem per-se, but udl is 
already pushing the limits of its USB 2 bus. And the read function also 
leaves a warning about the all-zero EDID data in the kernel log every 
few seconds. Probably from [1].

[1] 
https://elixir.bootlin.com/linux/v6.8/source/drivers/gpu/drm/drm_edid.c#L2389

>
> If you do read the full EDID using drm_edid_read_custom() in detect,
> you'll get more validation of the EDID for free, with no need to add
> extra drm edid interfaces for probing with optional header validation.
>
> Some drivers need to use EDID contents for the purpose of detect
> too. Perhaps not UDL.
>
> Also let's look at the override/firmware EDID mechanism. If you have a
> completely broken EDID, the newly added drm_edid_probe_custom() will
> never detect connected. You'll need to use connector forcing, even if
> the DDC probe would have been enough.

The EDID probe helper can take this into account. If it's just the code 
at [2], it looks simple enough to re-use.

[2] 
https://elixir.bootlin.com/linux/v6.8/source/drivers/gpu/drm/drm_edid.c#L2373

Best regards
Thomas

>
> BR,
> Jani.
>
>> The patch does a number of things to implement this.
>>
>> - Move udl_get_edid_block() to udl_edid.c and rename it to
>> udl_read_edid_block(). Then use the helper to implement probing in
>> udl_probe_edid() and reading in udl_edid_read(). Both udl helpers
>> are build on top of DRM helpers.
>>
>> - Replace the existing code in .get_modes() and .detect() with udl's
>> new EDID helpers. The new code behaves like DRM's similar DDC-based
>> helpers. Instead of .detect(), udl now implements .detect_ctx().
>>
>> - Remove the edid data from struct udl_connector. The field cached
>> the EDID data between calls to .detect() and .get_modes(), but is now
>> unused.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>   drivers/gpu/drm/udl/Makefile      |  1 +
>>   drivers/gpu/drm/udl/udl_drv.h     |  2 -
>>   drivers/gpu/drm/udl/udl_edid.c    | 67 +++++++++++++++++++++++
>>   drivers/gpu/drm/udl/udl_edid.h    | 15 ++++++
>>   drivers/gpu/drm/udl/udl_modeset.c | 90 +++++++------------------------
>>   5 files changed, 102 insertions(+), 73 deletions(-)
>>   create mode 100644 drivers/gpu/drm/udl/udl_edid.c
>>   create mode 100644 drivers/gpu/drm/udl/udl_edid.h
>>
>> diff --git a/drivers/gpu/drm/udl/Makefile b/drivers/gpu/drm/udl/Makefile
>> index 00690741db376..43d69a16af183 100644
>> --- a/drivers/gpu/drm/udl/Makefile
>> +++ b/drivers/gpu/drm/udl/Makefile
>> @@ -2,6 +2,7 @@
>>   
>>   udl-y := \
>>   	udl_drv.o \
>> +	udl_edid.o \
>>   	udl_main.o \
>>   	udl_modeset.o \
>>   	udl_transfer.o
>> diff --git a/drivers/gpu/drm/udl/udl_drv.h b/drivers/gpu/drm/udl/udl_drv.h
>> index 282ebd6c02fda..f112cfb270f31 100644
>> --- a/drivers/gpu/drm/udl/udl_drv.h
>> +++ b/drivers/gpu/drm/udl/udl_drv.h
>> @@ -51,8 +51,6 @@ struct urb_list {
>>   
>>   struct udl_connector {
>>   	struct drm_connector connector;
>> -	/* last udl_detect edid */
>> -	struct edid *edid;
>>   };
>>   
>>   static inline struct udl_connector *to_udl_connector(struct drm_connector *connector)
>> diff --git a/drivers/gpu/drm/udl/udl_edid.c b/drivers/gpu/drm/udl/udl_edid.c
>> new file mode 100644
>> index 0000000000000..caa9641996e92
>> --- /dev/null
>> +++ b/drivers/gpu/drm/udl/udl_edid.c
>> @@ -0,0 +1,67 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +
>> +#include <drm/drm_drv.h>
>> +#include <drm/drm_edid.h>
>> +
>> +#include "udl_drv.h"
>> +#include "udl_edid.h"
>> +
>> +static int udl_read_edid_block(void *data, u8 *buf, unsigned int block, size_t len)
>> +{
>> +	struct udl_device *udl = data;
>> +	struct drm_device *dev = &udl->drm;
>> +	struct usb_device *udev = udl_to_usb_device(udl);
>> +	u8 *read_buff;
>> +	int idx, ret;
>> +	size_t i;
>> +
>> +	read_buff = kmalloc(2, GFP_KERNEL);
>> +	if (!read_buff)
>> +		return -ENOMEM;
>> +
>> +	if (!drm_dev_enter(dev, &idx)) {
>> +		ret = -ENODEV;
>> +		goto err_kfree;
>> +	}
>> +
>> +	for (i = 0; i < len; i++) {
>> +		int bval = (i + block * EDID_LENGTH) << 8;
>> +
>> +		ret = usb_control_msg(udev, usb_rcvctrlpipe(udev, 0),
>> +				      0x02, (0x80 | (0x02 << 5)), bval,
>> +				      0xA1, read_buff, 2, USB_CTRL_GET_TIMEOUT);
>> +		if (ret < 0) {
>> +			drm_err(dev, "Read EDID byte %zu failed err %x\n", i, ret);
>> +			goto err_drm_dev_exit;
>> +		} else if (ret < 1) {
>> +			ret = -EIO;
>> +			drm_err(dev, "Read EDID byte %zu failed\n", i);
>> +			goto err_drm_dev_exit;
>> +		}
>> +
>> +		buf[i] = read_buff[1];
>> +	}
>> +
>> +	drm_dev_exit(idx);
>> +	kfree(read_buff);
>> +
>> +	return 0;
>> +
>> +err_drm_dev_exit:
>> +	drm_dev_exit(idx);
>> +err_kfree:
>> +	kfree(read_buff);
>> +	return ret;
>> +}
>> +
>> +bool udl_probe_edid(struct udl_device *udl)
>> +{
>> +	return drm_edid_probe_custom(udl_read_edid_block, udl, true);
>> +}
>> +
>> +const struct drm_edid *udl_edid_read(struct drm_connector *connector)
>> +{
>> +	struct udl_device *udl = to_udl(connector->dev);
>> +
>> +	return drm_edid_read_custom(connector, udl_read_edid_block, udl);
>> +}
>> diff --git a/drivers/gpu/drm/udl/udl_edid.h b/drivers/gpu/drm/udl/udl_edid.h
>> new file mode 100644
>> index 0000000000000..fe15ff3752b7d
>> --- /dev/null
>> +++ b/drivers/gpu/drm/udl/udl_edid.h
>> @@ -0,0 +1,15 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +
>> +#ifndef UDL_EDID_H
>> +#define UDL_EDID_H
>> +
>> +#include <linux/types.h>
>> +
>> +struct drm_connector;
>> +struct drm_edid;
>> +struct udl_device;
>> +
>> +bool udl_probe_edid(struct udl_device *udl);
>> +const struct drm_edid *udl_edid_read(struct drm_connector *connector);
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_modeset.c
>> index 3df9fc38388b4..4236ce57f5945 100644
>> --- a/drivers/gpu/drm/udl/udl_modeset.c
>> +++ b/drivers/gpu/drm/udl/udl_modeset.c
>> @@ -25,6 +25,7 @@
>>   #include <drm/drm_vblank.h>
>>   
>>   #include "udl_drv.h"
>> +#include "udl_edid.h"
>>   #include "udl_proto.h"
>>   
>>   /*
>> @@ -415,97 +416,44 @@ static const struct drm_encoder_funcs udl_encoder_funcs = {
>>   
>>   static int udl_connector_helper_get_modes(struct drm_connector *connector)
>>   {
>> -	struct udl_connector *udl_connector = to_udl_connector(connector);
>> +	const struct drm_edid *drm_edid;
>> +	int count;
>>   
>> -	drm_connector_update_edid_property(connector, udl_connector->edid);
>> -	if (udl_connector->edid)
>> -		return drm_add_edid_modes(connector, udl_connector->edid);
>> +	drm_edid = udl_edid_read(connector);
>> +	drm_edid_connector_update(connector, drm_edid);
>> +	count = drm_edid_connector_add_modes(connector);
>> +	drm_edid_free(drm_edid);
>>   
>> -	return 0;
>> +	return count;
>>   }
>>   
>> -static const struct drm_connector_helper_funcs udl_connector_helper_funcs = {
>> -	.get_modes = udl_connector_helper_get_modes,
>> -};
>> -
>> -static int udl_get_edid_block(void *data, u8 *buf, unsigned int block, size_t len)
>> +static int udl_connector_helper_detect_ctx(struct drm_connector *connector,
>> +					   struct drm_modeset_acquire_ctx *ctx,
>> +					   bool force)
>>   {
>> -	struct udl_device *udl = data;
>> -	struct drm_device *dev = &udl->drm;
>> -	struct usb_device *udev = udl_to_usb_device(udl);
>> -	u8 *read_buff;
>> -	int idx, ret;
>> -	size_t i;
>> -
>> -	read_buff = kmalloc(2, GFP_KERNEL);
>> -	if (!read_buff)
>> -		return -ENOMEM;
>> +	struct udl_device *udl = to_udl(connector->dev);
>>   
>> -	if (!drm_dev_enter(dev, &idx)) {
>> -		ret = -ENODEV;
>> -		goto err_kfree;
>> -	}
>> -
>> -	for (i = 0; i < len; i++) {
>> -		int bval = (i + block * EDID_LENGTH) << 8;
>> -
>> -		ret = usb_control_msg(udev, usb_rcvctrlpipe(udev, 0),
>> -				      0x02, (0x80 | (0x02 << 5)), bval,
>> -				      0xA1, read_buff, 2, USB_CTRL_GET_TIMEOUT);
>> -		if (ret < 0) {
>> -			drm_err(dev, "Read EDID byte %zu failed err %x\n", i, ret);
>> -			goto err_drm_dev_exit;
>> -		} else if (ret < 1) {
>> -			ret = -EIO;
>> -			drm_err(dev, "Read EDID byte %zu failed\n", i);
>> -			goto err_drm_dev_exit;
>> -		}
>> -
>> -		buf[i] = read_buff[1];
>> -	}
>> +	if (udl_probe_edid(udl))
>> +		return connector_status_connected;
>>   
>> -	drm_dev_exit(idx);
>> -	kfree(read_buff);
>> -
>> -	return 0;
>> -
>> -err_drm_dev_exit:
>> -	drm_dev_exit(idx);
>> -err_kfree:
>> -	kfree(read_buff);
>> -	return ret;
>> +	return connector_status_disconnected;
>>   }
>>   
>> -static enum drm_connector_status udl_connector_detect(struct drm_connector *connector, bool force)
>> -{
>> -	struct drm_device *dev = connector->dev;
>> -	struct udl_device *udl = to_udl(dev);
>> -	struct udl_connector *udl_connector = to_udl_connector(connector);
>> -	enum drm_connector_status status = connector_status_disconnected;
>> -
>> -	/* cleanup previous EDID */
>> -	kfree(udl_connector->edid);
>> -	udl_connector->edid = NULL;
>> -
>> -	udl_connector->edid = drm_do_get_edid(connector, udl_get_edid_block, udl);
>> -	if (udl_connector->edid)
>> -		status = connector_status_connected;
>> -
>> -	return status;
>> -}
>> +static const struct drm_connector_helper_funcs udl_connector_helper_funcs = {
>> +	.get_modes = udl_connector_helper_get_modes,
>> +	.detect_ctx = udl_connector_helper_detect_ctx,
>> +};
>>   
>>   static void udl_connector_destroy(struct drm_connector *connector)
>>   {
>>   	struct udl_connector *udl_connector = to_udl_connector(connector);
>>   
>>   	drm_connector_cleanup(connector);
>> -	kfree(udl_connector->edid);
>>   	kfree(udl_connector);
>>   }
>>   
>>   static const struct drm_connector_funcs udl_connector_funcs = {
>>   	.reset = drm_atomic_helper_connector_reset,
>> -	.detect = udl_connector_detect,
>>   	.fill_modes = drm_helper_probe_single_connector_modes,
>>   	.destroy = udl_connector_destroy,
>>   	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

