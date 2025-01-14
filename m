Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C382A107B4
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 14:25:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77AE410E2C8;
	Tue, 14 Jan 2025 13:25:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="cs4sQ4C2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Xb3vs8Mz";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cs4sQ4C2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Xb3vs8Mz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BA8510E230
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 13:25:46 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 078DD21151;
 Tue, 14 Jan 2025 13:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1736861115; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=PBvpX9n0Ksw/7AqQlU4fyNfCSjkLsS1EZf3943f4W9w=;
 b=cs4sQ4C2CwBEHSe00UxzeoX9KV2E35oHtWoJU6G9ZPmhPDitjotA6UHelb0ZV95vlUg6id
 Hf7uSdJzbAwTqCaFIoFj6QCYcfyR63jjfXsgkQOPMlP5BodB42rt7t67aQ9Jnd7ZwR2fdy
 YfbwifVaQdK43D2p+5IXkUwBlJhAPTA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1736861115;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=PBvpX9n0Ksw/7AqQlU4fyNfCSjkLsS1EZf3943f4W9w=;
 b=Xb3vs8MzSxAdsg50AzeHh18DAs2wnxAxtQD7+9P+9vjOZZF3KAUMEaGz2l1cJibT+kID79
 bm1OvxDBOM2ujeAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1736861115; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=PBvpX9n0Ksw/7AqQlU4fyNfCSjkLsS1EZf3943f4W9w=;
 b=cs4sQ4C2CwBEHSe00UxzeoX9KV2E35oHtWoJU6G9ZPmhPDitjotA6UHelb0ZV95vlUg6id
 Hf7uSdJzbAwTqCaFIoFj6QCYcfyR63jjfXsgkQOPMlP5BodB42rt7t67aQ9Jnd7ZwR2fdy
 YfbwifVaQdK43D2p+5IXkUwBlJhAPTA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1736861115;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=PBvpX9n0Ksw/7AqQlU4fyNfCSjkLsS1EZf3943f4W9w=;
 b=Xb3vs8MzSxAdsg50AzeHh18DAs2wnxAxtQD7+9P+9vjOZZF3KAUMEaGz2l1cJibT+kID79
 bm1OvxDBOM2ujeAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8C9C9139CB;
 Tue, 14 Jan 2025 13:25:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id kVkdIbplhmdfRQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 14 Jan 2025 13:25:14 +0000
Message-ID: <aa787d6d-5195-4f1f-8df1-5b9fcd51e6d4@suse.de>
Date: Tue, 14 Jan 2025 14:25:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/7] drm/vkms: Switch to managed for crtc
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mairacanal@riseup.net>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net,
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
 seanpaul@google.com, nicolejadeyee@google.com,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
References: <20250113-google-vkms-managed-v7-0-4f81d1893e0b@bootlin.com>
 <20250113-google-vkms-managed-v7-3-4f81d1893e0b@bootlin.com>
 <e876c254-e107-4e8d-bd9e-9b42f844a187@suse.de>
 <Z4ZkfK5p--NMTSKo@louis-chauvet-laptop>
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
In-Reply-To: <Z4ZkfK5p--NMTSKo@louis-chauvet-laptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_TO(0.00)[gmail.com,riseup.net,linux.intel.com,kernel.org,ffwll.ch,lists.freedesktop.org,vger.kernel.org,bootlin.com,google.com,igalia.com];
 TAGGED_RCPT(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCPT_COUNT_TWELVE(0.00)[18]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,bootlin.com:email]
X-Spam-Score: -2.80
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


Am 14.01.25 um 14:19 schrieb Louis Chauvet:
> On 14/01/25 - 10:06, Thomas Zimmermann wrote:
>> Hi
>>
>>
>> Am 13.01.25 um 18:09 schrieb Louis Chauvet:
>>> The current VKMS driver uses managed function to create crtc, but
>>> don't use it to properly clean the crtc workqueue. It is not an
>>> issue yet, but in order to support multiple devices easily,
>>> convert this code to use drm and device managed helpers.
>>>
>>> Reviewed-by: Maxime Ripard <mripard@kernel.org>
>>> Reviewed-by: Maíra Canal <mcanal@igalia.com>
>>> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
>>> ---
>>>    drivers/gpu/drm/vkms/vkms_crtc.c | 14 ++++++++++++++
>>>    drivers/gpu/drm/vkms/vkms_drv.c  |  9 ---------
>>>    2 files changed, 14 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
>>> index 28a57ae109fcc05af3fe74f94518c462c09119e3..ace8d293f7da611110c1e117b6cf2f3c9e9b4381 100644
>>> --- a/drivers/gpu/drm/vkms/vkms_crtc.c
>>> +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
>>> @@ -6,6 +6,7 @@
>>>    #include <drm/drm_atomic_helper.h>
>>>    #include <drm/drm_probe_helper.h>
>>>    #include <drm/drm_vblank.h>
>>> +#include <drm/drm_managed.h>
>> Alphabetical order please.
>>
>>>    #include "vkms_drv.h"
>>> @@ -270,6 +271,14 @@ static const struct drm_crtc_helper_funcs vkms_crtc_helper_funcs = {
>>>    	.atomic_disable	= vkms_crtc_atomic_disable,
>>>    };
>>> +static void vkms_crtc_destroy_workqueue(struct drm_device *dev,
>>> +					void *raw_vkms_out)
>>> +{
>>> +	struct vkms_output *vkms_out = raw_vkms_out;
>>> +
>>> +	destroy_workqueue(vkms_out->composer_workq);
>>> +}
>>> +
>> This could be implemented in drm_managed.c. drmm_alloc_ordered_workqueue()
>> would call alloc_ordered_workqueue() and set up the managed callback as
>> well.
> Hello Thomas,
>
> Thanks for this review. For the next iteration, I will add the macro
> drmm_alloc_ordered_workqueue:
>
> void __drmm_destroy_workqueue(struct drm_device *device, void* res)
> {
> 	struct workqueue_struct *wq = res;
>
> 	destroy_workqueue(wq);
> }
> EXPORT_SYMBOL(__drmm_destroy_workqueue);
>
> #define drmm_alloc_ordered_workqueue(dev, fmt, flags, args...)					\
> 	({											\
> 		struct workqueue_struct *wq = alloc_ordered_workqueue(fmt, flags, ##args);	\
> 		wq ? ({										\
> 			int ret = drmm_add_action_or_reset(dev, __drmm_destroy_workqueue, wq);	\
> 			ret ? ERR_PTR(ret) : wq;						\
> 		}) :										\
> 			wq;									\
> 	})

Great. There are quite a few work queues in DRM drivers. Hopefully 
soemone else will find this useful. With this change and the fixed 
include sorting, you can add my R-b to this patch.

>
> Besides this, is there anything else you noticed that I should change
> for the next iteration in the remaining patches?

I've looked through the other patches and they look good to me. Feel 
free to add Acked-by: Thomas Zimmermann <tzimmermann@suse.de> to patches 
4 to 7.

Best regards
Thomas

>
> Thanks,
> Louis Chauvet
>
>> Best regards
>> Thomas
>>
>>>    int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
>>>    		   struct drm_plane *primary, struct drm_plane *cursor)
>>>    {
>>> @@ -300,5 +309,10 @@ int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
>>>    	if (!vkms_out->composer_workq)
>>>    		return -ENOMEM;
>>> +	ret = drmm_add_action_or_reset(dev, vkms_crtc_destroy_workqueue,
>>> +				       vkms_out);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>>    	return ret;
>>>    }
>>> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
>>> index e0409aba93496932b32a130ebb608ee53b1a9c59..7c142bfc3bd9de9556621db3e7f570dc0a4fab3a 100644
>>> --- a/drivers/gpu/drm/vkms/vkms_drv.c
>>> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
>>> @@ -53,14 +53,6 @@ MODULE_PARM_DESC(enable_overlay, "Enable/Disable overlay support");
>>>    DEFINE_DRM_GEM_FOPS(vkms_driver_fops);
>>> -static void vkms_release(struct drm_device *dev)
>>> -{
>>> -	struct vkms_device *vkms = drm_device_to_vkms_device(dev);
>>> -
>>> -	if (vkms->output.composer_workq)
>>> -		destroy_workqueue(vkms->output.composer_workq);
>>> -}
>>> -
>>>    static void vkms_atomic_commit_tail(struct drm_atomic_state *old_state)
>>>    {
>>>    	struct drm_device *dev = old_state->dev;
>>> @@ -108,7 +100,6 @@ static const struct drm_debugfs_info vkms_config_debugfs_list[] = {
>>>    static const struct drm_driver vkms_driver = {
>>>    	.driver_features	= DRIVER_MODESET | DRIVER_ATOMIC | DRIVER_GEM,
>>> -	.release		= vkms_release,
>>>    	.fops			= &vkms_driver_fops,
>>>    	DRM_GEM_SHMEM_DRIVER_OPS,
>>>    	DRM_FBDEV_SHMEM_DRIVER_OPS,
>>>
>> -- 
>> --
>> Thomas Zimmermann
>> Graphics Driver Developer
>> SUSE Software Solutions Germany GmbH
>> Frankenstrasse 146, 90461 Nuernberg, Germany
>> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
>> HRB 36809 (AG Nuernberg)
>>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

