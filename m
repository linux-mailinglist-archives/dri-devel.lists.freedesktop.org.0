Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 322A5988703
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 16:22:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AB5110EC61;
	Fri, 27 Sep 2024 14:22:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="MAXtK4/u";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sDkmJrc2";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KNvZxABw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PVl0fXkw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD7C910EC61
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2024 14:22:53 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 396F01F82E;
 Fri, 27 Sep 2024 14:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727446972; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=LlrHwhrgWu8qEp6O915yWJY8U8Sw1HeTsAFv2qLzoBE=;
 b=MAXtK4/us7ZdVHaerwOfrFTXozRd2PjJ96fyu4f4JuvRajN+Ftcij+4J01D41wLYsMj9UC
 b8e1z/fsubi3uVzuseKYIs/7OLckdNJLQZivaqkBjSLBL2Jb7eGIzs9ViI2xmPFd82s24K
 tcEmZ9ouPT9hMXWGlOrxPPpiS+6kzTs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727446972;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=LlrHwhrgWu8qEp6O915yWJY8U8Sw1HeTsAFv2qLzoBE=;
 b=sDkmJrc2kSsUmgqJkoKb1c87KdHYkahPas7LYng2USlkz5CKxi+Y5bjebWpIngwLcvxWOs
 f6p9ER7RlexckiCg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727446971; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=LlrHwhrgWu8qEp6O915yWJY8U8Sw1HeTsAFv2qLzoBE=;
 b=KNvZxABwyi8yJ7RlENoayCsXIjyyGLRRjAbFEqYyALE1jJbEQLruMHJ3a814AN2U6kD+bg
 eROG/iWxlkuTKuCvFCtcVL5oOCQKG5ooYW36loHNihYjWSbwkfpKTWuikrCTRQ4PMj2dcy
 7RMUCJvsacwa+AcwfWy9/gBgQh3wC4U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727446971;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=LlrHwhrgWu8qEp6O915yWJY8U8Sw1HeTsAFv2qLzoBE=;
 b=PVl0fXkwuoybpKDJNzhGAT4nnMwX/yVvYociHVjtuqcn1SNmkwWoswUwxF160OMlkPdJfk
 qYv4foJ7yBg+1YCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EE84513A73;
 Fri, 27 Sep 2024 14:22:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id M4NVOLq/9mYbJQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 27 Sep 2024 14:22:50 +0000
Message-ID: <3df73e57-ee9d-45ba-88e2-bf010628187e@suse.de>
Date: Fri, 27 Sep 2024 16:22:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] drm/mgag200: vga-bmc: Transparently handle BMC
To: Jani Nikula <jani.nikula@linux.intel.com>, jfalempe@redhat.com,
 airlied@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
References: <20240805130622.63458-1-tzimmermann@suse.de>
 <20240805130622.63458-3-tzimmermann@suse.de> <87msjtxk8f.fsf@intel.com>
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
In-Reply-To: <87msjtxk8f.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_TO(0.00)[linux.intel.com,redhat.com,kernel.org,gmail.com,ffwll.ch];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 RCPT_COUNT_SEVEN(0.00)[8]; MIME_TRACE(0.00)[0:+];
 MID_RHS_MATCH_FROM(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo, suse.de:mid,
 suse.de:email, gitlab.freedesktop.org:url]
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

Am 27.09.24 um 16:08 schrieb Jani Nikula:
> On Mon, 05 Aug 2024, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>> The VGA-BMC connector selects the VGA output if a display has been
>> attached to the physical connector. Otherwise it selects the BMC
>> output. In any case, the connector status is set to 'detected', so
>> that the userspace compositor displays to it.
>>
>> Depending on the setting, the connector's display modes either come
>> from the VGA monitor's EDID or from an internal list of BMC-compatible
>> modes.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>   drivers/gpu/drm/mgag200/mgag200_vga_bmc.c | 50 ++++++++++++++++++++++-
>>   1 file changed, 48 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_vga_bmc.c b/drivers/gpu/drm/mgag200/mgag200_vga_bmc.c
>> index b6b90632b3c6..3a958c3587ac 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_vga_bmc.c
>> +++ b/drivers/gpu/drm/mgag200/mgag200_vga_bmc.c
>> @@ -1,6 +1,7 @@
>>   // SPDX-License-Identifier: GPL-2.0-only
>>   
>>   #include <drm/drm_atomic_helper.h>
>> +#include <drm/drm_edid.h>
>>   #include <drm/drm_modeset_helper_vtables.h>
>>   #include <drm/drm_probe_helper.h>
>>   
>> @@ -11,9 +12,54 @@ static const struct drm_encoder_funcs mgag200_dac_encoder_funcs = {
>>   	.destroy = drm_encoder_cleanup
>>   };
>>   
>> +static int mgag200_vga_bmc_connector_helper_get_modes(struct drm_connector *connector)
>> +{
>> +	struct mga_device *mdev = to_mga_device(connector->dev);
>> +	const struct mgag200_device_info *minfo = mdev->info;
>> +	int count;
>> +
>> +	count = drm_connector_helper_get_modes(connector);
>> +
>> +	if (!count) {
>> +		/*
>> +		 * There's no EDID data without a connected monitor. Set BMC-
>> +		 * compatible modes in this case. The XGA default resolution
>> +		 * should work well for all BMCs.
>> +		 */
>> +		count = drm_add_modes_noedid(connector, minfo->max_hdisplay, minfo->max_vdisplay);
>> +		if (count)
>> +			drm_set_preferred_mode(connector, 1024, 768);
>> +	}
>> +
>> +	return count;
>> +}
>> +
>> +/*
>> + * There's no monitor connected if the DDC did not return an EDID. Still
>> + * return 'connected' as there's always a BMC. Incrementing the connector's
>> + * epoch counter triggers an update of the related properties.
>> + */
>> +static int mgag200_vga_bmc_connector_helper_detect_ctx(struct drm_connector *connector,
>> +						       struct drm_modeset_acquire_ctx *ctx,
>> +						       bool force)
>> +{
>> +	enum drm_connector_status old_status, status;
>> +
>> +	if (connector->edid_blob_ptr)
> This is now the only place outside of drm_edid.c that uses edid_blob_ptr
> for anything.
>
> Seems like you're using it as a proxy for "had a display connected".
>
> I wish it could be kept private to the EDID code.

No problem. I'd also prefer to change this to work like in ast, [1] 
where that function tests for the connector's 'physical status'.

But I'd like to store the physical status in struct drm_connector and 
have an optional update helper that detects the actual (logical) status, 
as outlined at [2]. Can we talk about that?

Best regards
Thomas

[1] 
https://gitlab.freedesktop.org/drm/kernel/-/blob/ae2c6d8b3b88c176dff92028941a4023f1b4cb91/drivers/gpu/drm/ast/ast_vga.c#L29
[2] 
https://lore.kernel.org/dri-devel/1d16c1ae-2e27-4daa-b8a6-5eab179ef551@suse.de/

>
>
> BR,
> Jani.
>
>
>> +		old_status = connector_status_connected;
>> +	else
>> +		old_status = connector_status_disconnected;
>> +
>> +	status = drm_connector_helper_detect_from_ddc(connector, ctx, force);
>> +
>> +	if (status != old_status)
>> +		++connector->epoch_counter;
>> +	return connector_status_connected;
>> +}
>> +
>>   static const struct drm_connector_helper_funcs mgag200_vga_connector_helper_funcs = {
>> -	.get_modes = drm_connector_helper_get_modes,
>> -	.detect_ctx = drm_connector_helper_detect_from_ddc
>> +	.get_modes = mgag200_vga_bmc_connector_helper_get_modes,
>> +	.detect_ctx = mgag200_vga_bmc_connector_helper_detect_ctx,
>>   };
>>   
>>   static const struct drm_connector_funcs mgag200_vga_connector_funcs = {

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

