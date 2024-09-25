Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE4E985545
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 10:15:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3437610E0D2;
	Wed, 25 Sep 2024 08:15:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="SKTdptpV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PABCvlc6";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SKTdptpV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PABCvlc6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A876810E0D2
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 08:15:51 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A7CB121A68;
 Wed, 25 Sep 2024 08:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727252149; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=djb1Jikd3ILVC+blZyANmJM7HRQvNEw0JEIJAl75pTg=;
 b=SKTdptpVdONPfc+IRsryJKa7PSsWGHL5LTHEJN3883eWcfw7G8VedKdaTKzhUeN36Mc+78
 13RklXBOKFf/oaEo6h0hlAix5VG6SEvkK4XKHUfvM3qn8aO3DPSkcefokRnyKW2xzvhYGM
 xvQroRC4R3o0RfJtIjgWWDIpHHREKic=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727252149;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=djb1Jikd3ILVC+blZyANmJM7HRQvNEw0JEIJAl75pTg=;
 b=PABCvlc6lOrOyDdrMmAJQQIiJAAldZVDxrhxYkqPenzY8NW8Yw/nxRbkXYEc2EdSy9dYL3
 CWHrebEUGLTejzAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727252149; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=djb1Jikd3ILVC+blZyANmJM7HRQvNEw0JEIJAl75pTg=;
 b=SKTdptpVdONPfc+IRsryJKa7PSsWGHL5LTHEJN3883eWcfw7G8VedKdaTKzhUeN36Mc+78
 13RklXBOKFf/oaEo6h0hlAix5VG6SEvkK4XKHUfvM3qn8aO3DPSkcefokRnyKW2xzvhYGM
 xvQroRC4R3o0RfJtIjgWWDIpHHREKic=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727252149;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=djb1Jikd3ILVC+blZyANmJM7HRQvNEw0JEIJAl75pTg=;
 b=PABCvlc6lOrOyDdrMmAJQQIiJAAldZVDxrhxYkqPenzY8NW8Yw/nxRbkXYEc2EdSy9dYL3
 CWHrebEUGLTejzAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6E88F13A6A;
 Wed, 25 Sep 2024 08:15:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id HOisGbXG82Z4fAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 25 Sep 2024 08:15:49 +0000
Message-ID: <c5c1b947-bf7a-46c6-be8e-ddd52d90b707@suse.de>
Date: Wed, 25 Sep 2024 10:15:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/10] drm/bochs: Use helpers for struct drm_edid
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: kraxel@redhat.com, daniel@ffwll.ch, airlied@gmail.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev
References: <20240902105546.792625-1-tzimmermann@suse.de>
 <20240902105546.792625-3-tzimmermann@suse.de>
 <2fuwrqk4aeuflsxjr73zj6nyvvmpmiupam4oemw7oxfia22ila@5hehupmjzkhh>
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
In-Reply-To: <2fuwrqk4aeuflsxjr73zj6nyvvmpmiupam4oemw7oxfia22ila@5hehupmjzkhh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_TLS_ALL(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 ARC_NA(0.00)[]; RCPT_COUNT_SEVEN(0.00)[8];
 MIME_TRACE(0.00)[0:+]; MID_RHS_MATCH_FROM(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[redhat.com,ffwll.ch,gmail.com,kernel.org,linux.intel.com,lists.freedesktop.org,lists.linux.dev];
 TO_DN_SOME(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
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

Am 23.09.24 um 06:35 schrieb Dmitry Baryshkov:
> On Mon, Sep 02, 2024 at 12:53:40PM GMT, Thomas Zimmermann wrote:
>> Implement a read function for struct drm_edid and read the EDID data
>> with drm_edit_read_custom(). Update the connector data accordingly.
>>
>> The EDID data comes from the emulator itself and the connector stores
>> a copy in its EDID property. The drm_edid field in struct bochs_device
>> is therefore not required. Remove it.
>>
>> If qemu provides no EDID data, install default display modes as before.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Acked-by: Gerd Hoffmann <kraxel@redhat.com>
>> ---
>>   drivers/gpu/drm/tiny/bochs.c | 48 +++++++++++++++++-------------------
>>   1 file changed, 22 insertions(+), 26 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
>> index 47a45a14306c..197fc00b373f 100644
>> --- a/drivers/gpu/drm/tiny/bochs.c
>> +++ b/drivers/gpu/drm/tiny/bochs.c
>> @@ -85,7 +85,6 @@ struct bochs_device {
>>   	u16 yres_virtual;
>>   	u32 stride;
>>   	u32 bpp;
>> -	const struct drm_edid *drm_edid;
>>   
>>   	/* drm */
>>   	struct drm_device *dev;
>> @@ -172,12 +171,14 @@ static void bochs_hw_set_little_endian(struct bochs_device *bochs)
>>   #define bochs_hw_set_native_endian(_b) bochs_hw_set_little_endian(_b)
>>   #endif
>>   
>> -static int bochs_get_edid_block(void *data, u8 *buf,
>> -				unsigned int block, size_t len)
>> +static int bochs_get_edid_block(void *data, u8 *buf, unsigned int block, size_t len)
>>   {
>>   	struct bochs_device *bochs = data;
>>   	size_t i, start = block * EDID_LENGTH;
>>   
>> +	if (!bochs->mmio)
>> +		return -1;
>> +
>>   	if (start + len > 0x400 /* vga register offset */)
>>   		return -1;
>>   
>> @@ -187,25 +188,20 @@ static int bochs_get_edid_block(void *data, u8 *buf,
>>   	return 0;
>>   }
>>   
>> -static int bochs_hw_load_edid(struct bochs_device *bochs)
>> +static const struct drm_edid *bochs_hw_read_edid(struct drm_connector *connector)
>>   {
>> +	struct drm_device *dev = connector->dev;
>> +	struct bochs_device *bochs = dev->dev_private;
>>   	u8 header[8];
>>   
>> -	if (!bochs->mmio)
>> -		return -1;
>> -
>>   	/* check header to detect whenever edid support is enabled in qemu */
>>   	bochs_get_edid_block(bochs, header, 0, ARRAY_SIZE(header));
>>   	if (drm_edid_header_is_valid(header) != 8)
> I understand that you probably don't want to change the behaviour of the
> driver, but maybe it's better to check drm_edid_read_custom return
> value? Bochs, amdgpu and radeon are the only drivers that call
> drm_edid_header_is_valid().

The nearby comment indicates that EDID support might not be present in 
qemu. But drm_edid_read_custom() warns in this case, even though it's a 
legal state. Hence the test.

Best regards
Thomas

>
>> -		return -1;
>> +		return NULL;
>>   

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

