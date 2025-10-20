Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E31A6BF1CD5
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 16:20:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A56310E452;
	Mon, 20 Oct 2025 14:20:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="YaksNdhd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Yfzcjgq/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iPtVhfJC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XkyJX9FS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9720C10E452
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 14:20:00 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D82F51F445;
 Mon, 20 Oct 2025 14:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1760969995; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=6VujmBoZ/wpS0cluGqxYFA8ibDzlnOmPpqfAdyS2DHY=;
 b=YaksNdhdJFPHRAhWPwb7MzXrGDy9eoWT89GAo9yZddbD88WLvYgCdjltoFPuXDi+wJRVlo
 OwABPfyiGy4vd1x7ouhzQwKcrd1zHOxIWipnkvpGDJPKX6Kdz4bdM2OZgqczjai/hjCGaV
 a60f5lnlkncYo67eAoYGo9uPS2V6P1s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1760969995;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=6VujmBoZ/wpS0cluGqxYFA8ibDzlnOmPpqfAdyS2DHY=;
 b=Yfzcjgq/U36ZuxL+Oxb9aUjKhN7BqU9oyNIzmhv/ovMqU4GN4X35EYDBSRY9pkjrmUwbgQ
 4rpXBEiPAtejLYAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1760969990; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=6VujmBoZ/wpS0cluGqxYFA8ibDzlnOmPpqfAdyS2DHY=;
 b=iPtVhfJCTO/x0hsnbswQMjUiHGtaCbqR7HsDJ5aDQgRS48JPzU9U/bbT1j6+q86w84Wp4B
 g+5kEYpuj11mJo5XhjKjk8W5B5fq3N7cfEPPSIY2oqj2RiXnfdC8CUuIvhglrXwlqqf1bv
 f8BnJfLzSvRWqu/1wGO9YolYRrglMIQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1760969990;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=6VujmBoZ/wpS0cluGqxYFA8ibDzlnOmPpqfAdyS2DHY=;
 b=XkyJX9FSurNfBMhgpZg7mewttv8Ll4Ptds3px6hJ3bieDFlBIvkTZ7SgdKNVwB/TaST8/6
 9Aysa1yA3OjMxoBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A431713A8E;
 Mon, 20 Oct 2025 14:19:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id gaClJgZF9mhkGwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 20 Oct 2025 14:19:50 +0000
Message-ID: <dd443c76-b68d-4a1c-9b36-d88dd6c95998@suse.de>
Date: Mon, 20 Oct 2025 16:19:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/gud: rearrange gud_probe() to prepare for function
 splitting
To: Ruben Wauters <rubenru09@aol.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251019185642.14266-2-rubenru09.ref@aol.com>
 <20251019185642.14266-2-rubenru09@aol.com>
 <cde9304a-5ab8-4f13-841c-c5679d55b502@suse.de>
 <57f201bb938b14a13b4b7ecf8173612232486669.camel@aol.com>
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
In-Reply-To: <57f201bb938b14a13b4b7ecf8173612232486669.camel@aol.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_TO(0.00)[aol.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 RCPT_COUNT_SEVEN(0.00)[7]; MIME_TRACE(0.00)[0:+];
 MID_RHS_MATCH_FROM(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[aol.com,gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:url, imap1.dmz-prg2.suse.org:helo,
 suse.de:mid]
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

Hi

Am 20.10.25 um 15:45 schrieb Ruben Wauters:
> On Mon, 2025-10-20 at 09:00 +0200, Thomas Zimmermann wrote:
>> Hi
>>
>> Am 19.10.25 um 20:53 schrieb Ruben Wauters:
>>> gud_prove() is currently very large and does many things, including
>> 'gud_probe'
> Unfortunate typo that I only realised after sending
>>> pipeline setup and feature detection, as well as having USB functions.
>>>
>>> This patch re-orders the code in gud_probe() to make it more organised
>>> and easier to split apart in the future.
>>>
>>> Signed-off-by: Ruben Wauters <rubenru09@aol.com>
>>> ---
>>> I wanted to move mode config to just before pipeline init, however mode
>>> config is edited in feature detection so I was unsure how to go about it
>>> exactly.
>>> Further untangling of this may be required before splitting it out
>>> ---
>>>    drivers/gpu/drm/gud/gud_drv.c | 31 +++++++++++++++++--------------
>>>    1 file changed, 17 insertions(+), 14 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/gud/gud_drv.c b/drivers/gpu/drm/gud/gud_drv.c
>>> index b7345c8d823d..583f7f8f4c00 100644
>>> --- a/drivers/gpu/drm/gud/gud_drv.c
>>> +++ b/drivers/gpu/drm/gud/gud_drv.c
>>> @@ -463,10 +463,6 @@ static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id)
>>>    		return PTR_ERR(gdrm);
>>>    
>>>    	drm = &gdrm->drm;
>>> -	drm->mode_config.funcs = &gud_mode_config_funcs;
>>> -	ret = drmm_mode_config_init(drm);
>>> -	if (ret)
>>> -		return ret;
>>>    
>>>    	gdrm->flags = le32_to_cpu(desc.flags);
>>>    	gdrm->compression = desc.compression & GUD_COMPRESSION_LZ4;
>>> @@ -483,11 +479,18 @@ static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id)
>>>    	if (ret)
>>>    		return ret;
>>>    
>>> +	/* Mode config init*/
>>> +	ret = drmm_mode_config_init(drm);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>>    	drm->mode_config.min_width = le32_to_cpu(desc.min_width);
>>>    	drm->mode_config.max_width = le32_to_cpu(desc.max_width);
>>>    	drm->mode_config.min_height = le32_to_cpu(desc.min_height);
>>>    	drm->mode_config.max_height = le32_to_cpu(desc.max_height);
>>> +	drm->mode_config.funcs = &gud_mode_config_funcs;
>>>    
>>> +	/*Format init*/
>>>    	formats_dev = devm_kmalloc(dev, GUD_FORMATS_MAX_NUM, GFP_KERNEL);
>>>    	/* Add room for emulated XRGB8888 */
>>>    	formats = devm_kmalloc_array(dev, GUD_FORMATS_MAX_NUM + 1, sizeof(*formats), GFP_KERNEL);
>>> @@ -587,6 +590,7 @@ static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id)
>>>    			return -ENOMEM;
>>>    	}
>>>    
>>> +	/*Pipeline init*/
>>>    	ret = drm_universal_plane_init(drm, &gdrm->plane, 0,
>>>    				       &gud_plane_funcs,
>>>    				       formats, num_formats,
>>> @@ -598,15 +602,6 @@ static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id)
>>>    	drm_plane_helper_add(&gdrm->plane, &gud_plane_helper_funcs);
>>>    	drm_plane_enable_fb_damage_clips(&gdrm->plane);
>>>    
>>> -	devm_kfree(dev, formats);
>>> -	devm_kfree(dev, formats_dev);
>>> -
>>> -	ret = gud_get_properties(gdrm);
>>> -	if (ret) {
>>> -		dev_err(dev, "Failed to get properties (error=%d)\n", ret);
>>> -		return ret;
>>> -	}
>>> -
>>>    	ret = drm_crtc_init_with_planes(drm, &gdrm->crtc, &gdrm->plane, NULL,
>>>    					&gud_crtc_funcs, NULL);
>>>    	if (ret)
>>> @@ -621,6 +616,13 @@ static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id)
>>>    	}
>>>    
>>>    	drm_mode_config_reset(drm);
>>> +	drm_kms_helper_poll_init(drm);
>>> +
>>> +	ret = gud_get_properties(gdrm);
>> This function installs plane properties. So it need to be in its old
>> location after drm_universal_plane_init() and before
>> drm_mode_config_reset(). It should be renamed to
>> gud_plane_add_properties(). See [1] for the connector equivalent
> This does make sense, though I do wonder why it worked on testing,
> either way, will change it.

It could be that you can add it afterwards, but that certainly creates 
timing issues with user space. There's a related note at [1].

[1] 
https://elixir.bootlin.com/linux/v6.17.3/source/drivers/gpu/drm/drm_mode_object.c#L231

Best regards
Thomas

>> [1]
>> https://elixir.bootlin.com/linux/v6.18-rc1/source/drivers/gpu/drm/gud/gud_connector.c#L474
>>
>>> +	if (ret) {
>>> +		dev_err(dev, "Failed to get properties (error=%d)\n", ret);
>>> +		return ret;
>>> +	}
>>>    
>>>    	usb_set_intfdata(intf, gdrm);
>> After you've called drm_kms_helper_poll_init(), DRM could query the
>> connector for attached displays at any time. This might require the usb
>> interface to point to the gud device. And the DRM driver also needs to
>> know about the DMA device.  I quick look through the driver code suggest
>> that it works without, but better not count on it.
>>
>> Best would be to move this line and the block with the DMA setup [2]
>> just after where the gud device got allocated with devmdrm_dev_alloc(). [3]
>>
>> [2]
>> https://elixir.bootlin.com/linux/v6.18-rc1/source/drivers/gpu/drm/gud/gud_drv.c#L627
>> [3]
>> https://elixir.bootlin.com/linux/v6.18-rc1/source/drivers/gpu/drm/gud/gud_drv.c#L464
> Will do, I'll send a v2 patch with the requested changes.
>> Best regards
>> Thomas
>>
>>>    
>>> @@ -638,7 +640,8 @@ static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id)
>>>    	if (ret)
>>>    		return ret;
>>>    
>>> -	drm_kms_helper_poll_init(drm);
>>> +	devm_kfree(dev, formats);
>>> +	devm_kfree(dev, formats_dev);
>>>    
>>>    	drm_client_setup(drm, NULL);
>>>    

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


