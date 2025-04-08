Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 088CFA80D11
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 15:57:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C8D410E6B6;
	Tue,  8 Apr 2025 13:57:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="SqYZq+dZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VP6rSTAk";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SqYZq+dZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VP6rSTAk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6F0C10E6B6
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 13:57:24 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6E5241F388;
 Tue,  8 Apr 2025 13:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744120643; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=kunqwfddltftsnmUGSlI33X8P64ad4/J6Vw9Ian+Eo0=;
 b=SqYZq+dZ8ouwZX0Dr94LxcGgWkRJb+48XdmwF6KR5SnDhZPsaop01qTbgtZgqfN1haFJiL
 9ABr2APArJ1O/ukOAWSUPAFm/1HacrltJvB+A6gkQD12cVxD1R6N9Y9pmpNRHZymKZoPhm
 /a2g0QS7up8kZRpl139e3zNm2EJ+/Uc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744120643;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=kunqwfddltftsnmUGSlI33X8P64ad4/J6Vw9Ian+Eo0=;
 b=VP6rSTAknTqlAyprqO2Jze+7x9fa+q1yhTNwagZpv+wRYBQyMNYaPaimIJZHYCKLu9pDSZ
 /ZYSvH0kloivdgDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744120643; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=kunqwfddltftsnmUGSlI33X8P64ad4/J6Vw9Ian+Eo0=;
 b=SqYZq+dZ8ouwZX0Dr94LxcGgWkRJb+48XdmwF6KR5SnDhZPsaop01qTbgtZgqfN1haFJiL
 9ABr2APArJ1O/ukOAWSUPAFm/1HacrltJvB+A6gkQD12cVxD1R6N9Y9pmpNRHZymKZoPhm
 /a2g0QS7up8kZRpl139e3zNm2EJ+/Uc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744120643;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=kunqwfddltftsnmUGSlI33X8P64ad4/J6Vw9Ian+Eo0=;
 b=VP6rSTAknTqlAyprqO2Jze+7x9fa+q1yhTNwagZpv+wRYBQyMNYaPaimIJZHYCKLu9pDSZ
 /ZYSvH0kloivdgDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1475213A1E;
 Tue,  8 Apr 2025 13:57:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id fcXMA0Mr9WdbPAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 08 Apr 2025 13:57:23 +0000
Message-ID: <05fa4ac7-db09-401d-8680-0d71112d2239@suse.de>
Date: Tue, 8 Apr 2025 15:57:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] drm/st7571-i2c: add support for Sitronix ST7571
 LCD controller
To: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmrmann@suse.de>
References: <20250408-st7571-v3-0-200693efec57@gmail.com>
 <20250408-st7571-v3-2-200693efec57@gmail.com>
 <87cydn9bkx.fsf@minerva.mail-host-address-is-not-set>
 <Z_Uin2dvmbantQU4@gmail.com>
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
In-Reply-To: <Z_Uin2dvmbantQU4@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 TAGGED_RCPT(0.00)[dt]; FREEMAIL_TO(0.00)[gmail.com,redhat.com];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCVD_VIA_SMTP_AUTH(0.00)[]; RCPT_COUNT_TWELVE(0.00)[13];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; MID_RHS_MATCH_FROM(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,linux.intel.com,kernel.org,lists.freedesktop.org,vger.kernel.org,suse.de];
 TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_SOME(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; RCVD_TLS_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
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

Am 08.04.25 um 15:20 schrieb Marcus Folkesson:
[...]
>>
>>> +static int st7571_set_pixel_format(struct st7571_device *st7571,
>>> +				   u32 pixel_format)
>>> +{
>>> +	switch (pixel_format) {
>>> +	case DRM_FORMAT_C1:
>>> +		return st7571_set_color_mode(st7571, ST7571_COLOR_MODE_BLACKWHITE);
>>> +	case DRM_FORMAT_C2:
>>> +		return st7571_set_color_mode(st7571, ST7571_COLOR_MODE_GRAY);
>>> +	default:
>>> +		return -EINVAL;
>>> +	}
>> These should be DRM_FORMAT_R1 and DRM_FORMAT_R2 and not C{1,2}. The former
>> is for displays have a single color (i.e: grey) while the latter is when a
>> pixel can have different color, whose values are defined by a CLUT table.
>>
> I see.
> Does fbdev only works with CLUT formats? I get this error when I switch
> to DRM_FORMAT_R{1,2}:
>
> [drm] Initialized st7571 1.0.0 for 0-003f on minor 0
> st7571 0-003f: [drm] format C1   little-endian (0x20203143) not supported
> st7571 0-003f: [drm] No compatible format found
> st7571 0-003f: [drm] *ERROR* fbdev: Failed to setup emulation (ret=-22)

For testing purposes, you can add the _R formats to the switch case at

https://elixir.bootlin.com/linux/v6.13.7/source/drivers/gpu/drm/drm_fb_helper.c#L1246

and see how it goes.

Best regards
Thomas

>
>
>> ...
>>
>>> +
>>> +static const uint32_t st7571_primary_plane_formats[] = {
>>> +	DRM_FORMAT_C1,
>>> +	DRM_FORMAT_C2,
>>> +};
>>> +
>> I would add a DRM_FORMAT_XRGB8888 format. This will allow your display to
>> be compatible with any user-space. Your st7571_fb_blit_rect() can then do
>> a pixel format conversion from XRGB8888 to the native pixel format.
> This were discussed in v2, but there were limitations in the helper
> functions that we currently have.
>
> I will look into how this could be implemented in a generic way, but maybe that is
> something for a follow up patch?
>
>
> [...]
>>> +
>>> +static const struct drm_plane_helper_funcs st7571_primary_plane_helper_funcs = {
>>> +	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
>>> +	.atomic_check = st7571_primary_plane_helper_atomic_check,
>>> +	.atomic_update = st7571_primary_plane_helper_atomic_update,
>>> +};
>> Maybe you want an .atomic_disable callback that clears your screen ?
> Good point, yes, I will add that.
>
>>
>>> +
>>> +/*
>>> + * CRTC
>>> + */
>>> +
>>> +static const struct drm_crtc_helper_funcs st7571_crtc_helper_funcs = {
>>> +	.atomic_check = drm_crtc_helper_atomic_check,
>> I think you could have an .mode_valid callback that just checks the fixed mode.
> Got it.
>
>>> +/*
>>> + * Encoder
>>> + */
>>> +
>>> +static const struct drm_encoder_funcs st7571_encoder_funcs = {
>>> +	.destroy = drm_encoder_cleanup,
>>> +};
>> I recommend to have an encoder .atomic_{en,dis}able callbacks to init and turn
>> off your display respectively. That way, the driver can call st7571_lcd_init()
>> only when the display is going to be used instead of at probe time.
> I will look into this as well.
>
>> ...
>>
>>> +static enum drm_mode_status st7571_mode_config_mode_valid(struct drm_device *dev,
>>> +						       const struct drm_display_mode *mode)
>>> +{
>>> +	struct st7571_device *st7571 = drm_to_st7571(dev);
>>> +
>>> +	return drm_crtc_helper_mode_valid_fixed(&st7571->crtc, mode, &st7571->mode);
>>> +}
>> The fact that you are calling a drm_crtc_helper here is an indication that probably
>> this should be done in a struct drm_crtc_helper_funcs .mode_valid callback instead,
>> as mentioned above.
> I will move it to drm_crtc_helper_funcs.
>
>>> +
>>> +static const struct drm_mode_config_funcs st7571_mode_config_funcs = {
>>> +	.fb_create = drm_gem_fb_create_with_dirty,
>>> +	.mode_valid = st7571_mode_config_mode_valid,
>> And that way you could just drop this handler.
> Yep, thanks.
>
>>> +	.atomic_check = drm_atomic_helper_check,
>>> +	.atomic_commit = drm_atomic_helper_commit,
>>> +};
>>> +
>> ...
>>
>>> +static int st7571_probe(struct i2c_client *client)
>>> +{
>>> +	struct st7571_device *st7571;
>>> +	struct drm_device *dev;
>>> +	int ret;
>>> +
>>> +	st7571 = devm_drm_dev_alloc(&client->dev, &st7571_driver,
>>> +				    struct st7571_device, dev);
>>> +	if (IS_ERR(st7571))
>>> +		return PTR_ERR(st7571);
>>> +
>>> +	dev = &st7571->dev;
>>> +	st7571->client = client;
>>> +	i2c_set_clientdata(client, st7571);
>>> +
>>> +	ret = st7571_parse_dt(st7571);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	st7571->mode = st7571_mode(st7571);
>>> +
>>> +	/*
>>> +	 * The chip nacks some messages but still works as expected.
>>> +	 * If the adapter does not support protocol mangling do
>>> +	 * not set the I2C_M_IGNORE_NAK flag at the expense * of possible
>>> +	 * cruft in the logs.
>>> +	 */
>>> +	if (i2c_check_functionality(client->adapter, I2C_FUNC_PROTOCOL_MANGLING))
>>> +		st7571->ignore_nak = true;
>>> +
>>> +	st7571->regmap = devm_regmap_init(&client->dev, &st7571_regmap_bus,
>>> +					   client, &st7571_regmap_config);
>>> +	if (IS_ERR(st7571->regmap)) {
>>> +		dev_err(&client->dev, "Failed to initialize regmap\n");
>> If you use dev_err_probe(), you can give some indication to users about
>> what failed. It prints messages in the /sys/kernel/debug/devices_deferred
>> debugfs entry.
> Got it, thanks.
>
>>> +
>>> +static void st7571_remove(struct i2c_client *client)
>>> +{
>>> +	struct st7571_device *st7571 = i2c_get_clientdata(client);
>>> +
>>> +	drm_dev_unplug(&st7571->dev);
>> I think you are missing a drm_atomic_helper_shutdown() here.
> This is a change for v3. As the device has been unplugged already, it
> won't do anything, so I removed it.
>
> Isn't it right to do so?
>
>
>> And also a struct i2c_driver .shutdown callback to call to
>> drm_atomic_helper_shutdown() as well.
>>
>> -- 
>> Best regards,
>>
>> Javier Martinez Canillas
>> Core Platforms
>> Red Hat
>>
> Best regards,
> Marcus Folkesson

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

