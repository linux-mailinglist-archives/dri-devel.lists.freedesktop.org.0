Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4C8945A93
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2024 11:12:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AE5110E093;
	Fri,  2 Aug 2024 09:12:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="rhqwrICK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BY6fnDUV";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rhqwrICK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BY6fnDUV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3176B10E093
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2024 09:12:21 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 91DDD2192D;
 Fri,  2 Aug 2024 09:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1722589939; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=bznCfuv+KRc9pwXqVR4X3wPwRA+KPcR9qcX0c3PNuzY=;
 b=rhqwrICKv4Bc7I+akZOt8j+RZtqh7hlp8T9k7VtWacCFg/8BNydyPrYHIqHeTKFdFAR++o
 ElSb4rW7q/dZKlR/WzE6sEfUxUDy2tu7wOlI+xyVxlo9BxcD252Nv0nHxRAAalRU1tGvr4
 tZRf+Tn97KPieG1sfA4YzEU854MojpY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1722589939;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=bznCfuv+KRc9pwXqVR4X3wPwRA+KPcR9qcX0c3PNuzY=;
 b=BY6fnDUVDkUcOmOQQOT0bDs445tRKAKT/raQotyggJar0YrkpQ4tYdGvkRRpByhXkh+C5r
 MsH8pWNnP4UTXwAA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=rhqwrICK;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=BY6fnDUV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1722589939; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=bznCfuv+KRc9pwXqVR4X3wPwRA+KPcR9qcX0c3PNuzY=;
 b=rhqwrICKv4Bc7I+akZOt8j+RZtqh7hlp8T9k7VtWacCFg/8BNydyPrYHIqHeTKFdFAR++o
 ElSb4rW7q/dZKlR/WzE6sEfUxUDy2tu7wOlI+xyVxlo9BxcD252Nv0nHxRAAalRU1tGvr4
 tZRf+Tn97KPieG1sfA4YzEU854MojpY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1722589939;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=bznCfuv+KRc9pwXqVR4X3wPwRA+KPcR9qcX0c3PNuzY=;
 b=BY6fnDUVDkUcOmOQQOT0bDs445tRKAKT/raQotyggJar0YrkpQ4tYdGvkRRpByhXkh+C5r
 MsH8pWNnP4UTXwAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5ADD713999;
 Fri,  2 Aug 2024 09:12:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id JUfWFPOirGZ4JAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 02 Aug 2024 09:12:19 +0000
Message-ID: <267474ce-d158-46c5-aeb8-8d839b3b4322@suse.de>
Date: Fri, 2 Aug 2024 11:12:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/client: Use common display mode for cloned outputs
To: Jani Nikula <jani.nikula@linux.intel.com>, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org
References: <20240801130449.104645-1-tzimmermann@suse.de>
 <878qxf73mg.fsf@intel.com>
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
In-Reply-To: <878qxf73mg.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 91DDD2192D
X-Spam-Score: -4.30
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_GOOD(-0.10)[text/plain]; XM_UA_NO_VERSION(0.01)[];
 MX_GOOD(-0.01)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_TO(0.00)[linux.intel.com,ffwll.ch,gmail.com,kernel.org];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_TLS_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_FIVE(0.00)[6];
 MID_RHS_MATCH_FROM(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
 DKIM_TRACE(0.00)[suse.de:+]; RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim]
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

Am 02.08.24 um 10:03 schrieb Jani Nikula:
> On Thu, 01 Aug 2024, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>> For cloned outputs, don't pick a default resolution of 1024x768 as
>> most hardware can do better. Instead look through the modes of all
>> connectors to find a common mode for all of them.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>   drivers/gpu/drm/drm_client_modeset.c | 54 +++++++++++++++++-----------
>>   1 file changed, 34 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
>> index 31af5cf37a09..67b422dc8e7f 100644
>> --- a/drivers/gpu/drm/drm_client_modeset.c
>> +++ b/drivers/gpu/drm/drm_client_modeset.c
>> @@ -266,7 +266,7 @@ static bool drm_client_target_cloned(struct drm_device *dev,
>>   {
>>   	int count, i, j;
>>   	bool can_clone = false;
>> -	struct drm_display_mode *dmt_mode, *mode;
>> +	struct drm_display_mode *mode, *common_mode = NULL;
>>   
>>   	/* only contemplate cloning in the single crtc case */
>>   	if (dev->mode_config.num_crtc > 1)
>> @@ -309,35 +309,49 @@ static bool drm_client_target_cloned(struct drm_device *dev,
>>   		return true;
>>   	}
>>   
>> -	/* try and find a 1024x768 mode on each connector */
>> -	can_clone = true;
>> -	dmt_mode = drm_mode_find_dmt(dev, 1024, 768, 60, false);
>> -
>> -	if (!dmt_mode)
>> -		goto fail;
>> +	/* try and find a mode common among connectors */
>>   
>> +	can_clone = false;
>>   	for (i = 0; i < connector_count; i++) {
>>   		if (!enabled[i])
>>   			continue;
>>   
>> -		list_for_each_entry(mode, &connectors[i]->modes, head) {
>> -			if (drm_mode_match(mode, dmt_mode,
>> -					   DRM_MODE_MATCH_TIMINGS |
>> -					   DRM_MODE_MATCH_CLOCK |
>> -					   DRM_MODE_MATCH_FLAGS |
>> -					   DRM_MODE_MATCH_3D_FLAGS))
>> -				modes[i] = mode;
>> +		list_for_each_entry(common_mode, &connectors[i]->modes, head) {
>> +			can_clone = true;
>> +
>> +			for (j = 1; j < connector_count; j++) {
> Should this start from i instead of 1?

Right, it would make sense.

>
> Anyway, I have a hard time wrapping my head around this whole thing. I
> think it would greatly benefit from a helper function to search for a
> mode from an array of connectors.

That's what it does. Here, the outer-most loop tries to find the first 
enabled connector. For each of its modes, the inner loops test if that 
mode is also present on all other enabled connectors.

All of the client's mode-selection code is fairly obscure. I don't 
really dare touching it.

Best regards
Thomas

>
> BR,
> Jani.
>
>
>> +				if (!enabled[i])
>> +					continue;
>> +
>> +				can_clone = false;
>> +				list_for_each_entry(mode, &connectors[j]->modes, head) {
>> +					can_clone = drm_mode_match(common_mode, mode,
>> +								   DRM_MODE_MATCH_TIMINGS |
>> +							    DRM_MODE_MATCH_CLOCK |
>> +							    DRM_MODE_MATCH_FLAGS |
>> +							    DRM_MODE_MATCH_3D_FLAGS);
>> +					if (can_clone)
>> +						break; // found common mode on connector
>> +				}
>> +				if (!can_clone)
>> +					break; // try next common mode
>> +			}
>> +			if (can_clone)
>> +				break; // found common mode among all connectors
>>   		}
>> -		if (!modes[i])
>> -			can_clone = false;
>> +		break;
>>   	}
>> -	kfree(dmt_mode);
>> -
>>   	if (can_clone) {
>> -		drm_dbg_kms(dev, "can clone using 1024x768\n");
>> +		for (i = 0; i < connector_count; i++) {
>> +			if (!enabled[i])
>> +				continue;
>> +			modes[i] = common_mode;
>> +
>> +		}
>> +		drm_dbg_kms(dev, "can clone using" DRM_MODE_FMT "\n", DRM_MODE_ARG(common_mode));
>>   		return true;
>>   	}
>> -fail:
>> +
>>   	drm_info(dev, "kms: can't enable cloning when we probably wanted to.\n");
>>   	return false;
>>   }

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

