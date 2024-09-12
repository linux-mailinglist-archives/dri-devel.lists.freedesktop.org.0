Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30037976554
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 11:18:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8243D10E1FF;
	Thu, 12 Sep 2024 09:18:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="QTJoWxLg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="n8R3xjgo";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Cd7+Tu/y";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="159hUFmc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AA0C10E1FF
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 09:18:49 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7A01D1F76C;
 Thu, 12 Sep 2024 09:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1726132727; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=kn6dikhq1SSERuKzRRXDJMSAhN3YN1fucw643Y596JY=;
 b=QTJoWxLgJBU+hbx8PH51rj7Fjxr0JMfPy04s6tdYpVbXCwHK8a5XCvt/eFAHn9BNh6hDE/
 BLJey3/2ztjRWs+RRHK8+qF5n6GluIrlVHopONYEEtUAgkpXZAEjtBk34+TMUVKgcrMERr
 yFSzYkfOISMgRyUmZL07ibornYdyO80=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1726132727;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=kn6dikhq1SSERuKzRRXDJMSAhN3YN1fucw643Y596JY=;
 b=n8R3xjgoE28p9qNEImIy6JvWXoBNaAfJU+1rUP/euxKg2DZx7I+gCxodMkUzdI0dMtIDhq
 G/KmkTThzHX1i9Dg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1726132726; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=kn6dikhq1SSERuKzRRXDJMSAhN3YN1fucw643Y596JY=;
 b=Cd7+Tu/ybzujfY2LZ2mxLb6LRivQuEFALaM5Ajj8c+JY+aZ4J5LXmts4MJeGLoqeQ/2mIo
 TMrv4o1p876NJ60xOx8Z0yklSyZu4Ffzbs347HlZdBdiSsIeE09YXgI3u+O42BEcHRrCLf
 3OEFJD9W0O//UYAkFlhyDX6IfzV2vLs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1726132726;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=kn6dikhq1SSERuKzRRXDJMSAhN3YN1fucw643Y596JY=;
 b=159hUFmc9MHxey5NtdxxbvbpGwjOR9HaTHhh7TmNzkN/ifrShZ9/lJkqFnrTauqxT7vrca
 b6ViZU8FI3PzZwDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2FEAA13A73;
 Thu, 12 Sep 2024 09:18:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id DA2LCfax4mY4HwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 12 Sep 2024 09:18:46 +0000
Message-ID: <42b27020-a68e-4c43-800e-61977324be78@suse.de>
Date: Thu, 12 Sep 2024 11:18:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/gma500: replace drm_detect_hdmi_monitor() with
 drm_display_info.is_hdmi
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Tejas Vipin <tejasvipin76@gmail.com>, Laurent.pinchart@ideasonboard.com,
 patrik.r.jakobsson@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240911180650.820598-1-tejasvipin76@gmail.com>
 <b0f77fcc-5d84-4727-9a17-9d1f1e2c5b76@suse.de> <87o74ti7g5.fsf@intel.com>
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
In-Reply-To: <87o74ti7g5.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_TO(0.00)[linux.intel.com,gmail.com,ideasonboard.com,kernel.org,ffwll.ch];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_TLS_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCPT_COUNT_SEVEN(0.00)[10]; MID_RHS_MATCH_FROM(0.00)[];
 TAGGED_RCPT(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:url, imap1.dmz-prg2.suse.org:helo,
 suse.de:mid, suse.de:email]
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

Am 12.09.24 um 10:48 schrieb Jani Nikula:
> On Thu, 12 Sep 2024, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>> Hi
>>
>> Am 11.09.24 um 20:06 schrieb Tejas Vipin:
>>> Replace drm_detect_hdmi_monitor() with drm_display_info.is_hdmi since
>>> monitor HDMI information is available after EDID is parsed. Additionally
>>> rewrite the code the code to have fewer indentation levels.
>> The problem is that the entire logic is outdated. The content
>> of cdv_hdmi_detect() should go into cdv_hdmi_get_modes(), the detect_ctx
>> callback should be set to drm_connector_helper_detect_from_ddc() and
>> cdv_hdmi_detect() should be deleted. The result is that ->detect_ctx
>> will detect the presence of a display and ->get_modes will update EDID
>> and other properties.
> I guess I didn't get the memo on this one.
>
> What's the problem with reading the EDID at detect? The subsequent
> drm_edid_connector_add_modes() called from .get_modes() does not need to
> read the EDID again.

With drm_connector_helper_detect_from_ddc() there is already a helper 
for detection. It makes sense to use it. And if we continue to update 
the properties in detect (instead of get_modes), what is the correct 
connector_status on errors? Right now and with the patch applied, detect 
returns status_disconnected on errors. But this isn't correct if there 
actually is a display. By separating detect and get_modes cleanly, we 
can detect the display reliably, but also handle errors better than we 
currently do in gma500. Get_modes is already expected to update the EDID 
property, [1] for detect it's not so clear AFAICT. I think that from a 
design perspective, it makes sense to have a read-only function that 
only detects the physical state of the connector and a read-write 
function that updates the connector's properties. Best regards Thomas 
[1] 
https://elixir.bootlin.com/linux/v6.10.9/source/include/drm/drm_modeset_helper_vtables.h#L865 

>
> I think it should be fine to do incremental refactors like the patch at
> hand (modulo some issues I mention below).
>
> BR,
> Jani.
>
>
>> Do you have  a device for testing such a change?
>>
>> Best regards
>> Thomas
>>
>>> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
>>> ---
>>> Changes in v2:
>>>       - Use drm_edid instead of edid
>>>
>>> Link to v1: https://lore.kernel.org/all/20240910051856.700210-1-tejasvipin76@gmail.com/
>>> ---
>>>    drivers/gpu/drm/gma500/cdv_intel_hdmi.c | 24 +++++++++++++-----------
>>>    1 file changed, 13 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/gma500/cdv_intel_hdmi.c b/drivers/gpu/drm/gma500/cdv_intel_hdmi.c
>>> index 2d95e0471291..701f8bbd5f2b 100644
>>> --- a/drivers/gpu/drm/gma500/cdv_intel_hdmi.c
>>> +++ b/drivers/gpu/drm/gma500/cdv_intel_hdmi.c
>>> @@ -128,23 +128,25 @@ static enum drm_connector_status cdv_hdmi_detect(
>>>    {
>>>    	struct gma_encoder *gma_encoder = gma_attached_encoder(connector);
>>>    	struct mid_intel_hdmi_priv *hdmi_priv = gma_encoder->dev_priv;
>>> -	struct edid *edid = NULL;
>>> +	const struct drm_edid *drm_edid;
>>> +	int ret;
>>>    	enum drm_connector_status status = connector_status_disconnected;
>>>    
>>> -	edid = drm_get_edid(connector, connector->ddc);
>>> +	drm_edid = drm_edid_read_ddc(connector, connector->ddc);
> Just drm_edid_read() is enough when you're using connector->ddc.
>
>>> +	ret = drm_edid_connector_update(connector, drm_edid);
>>>    
>>>    	hdmi_priv->has_hdmi_sink = false;
>>>    	hdmi_priv->has_hdmi_audio = false;
>>> -	if (edid) {
>>> -		if (edid->input & DRM_EDID_INPUT_DIGITAL) {
>>> -			status = connector_status_connected;
>>> -			hdmi_priv->has_hdmi_sink =
>>> -						drm_detect_hdmi_monitor(edid);
>>> -			hdmi_priv->has_hdmi_audio =
>>> -						drm_detect_monitor_audio(edid);
>>> -		}
>>> -		kfree(edid);
>>> +	if (ret)
> This error path leaks the EDID.
>
>>> +		return status;
>>> +
>>> +	if (drm_edid_is_digital(drm_edid)) {
>>> +		status = connector_status_connected;
>>> +		hdmi_priv->has_hdmi_sink = connector->display_info.is_hdmi;
>>> +		hdmi_priv->has_hdmi_audio = connector->display_info.has_audio;
>>>    	}
>>> +	drm_edid_free(drm_edid);
>>> +
>>>    	return status;
>>>    }
>>>    

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

