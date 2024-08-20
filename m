Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FFA957FB5
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 09:33:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DACC010E276;
	Tue, 20 Aug 2024 07:33:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="z3xirlH+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qs1/+UBR";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XhGY3Kb6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ybdljJeF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56C0810E22A;
 Tue, 20 Aug 2024 07:33:38 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D4FA21FD09;
 Tue, 20 Aug 2024 07:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724139217; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=eJzgZwYYrszKJntHGLXWq3Sv/YMR8P1l2O4ow8wQa6I=;
 b=z3xirlH+IbiUDwdNCYIPnPjOJ0XzCfT4WTbcHQn2t7lCme0917THSqwvGvrRDJDvONVB4E
 IYqDC+TmYYpxh0gBGf6uY7D3gGHxNyHSrxOUpM2HH3Hr2PC4bzCFUYfPpr87wkOzxAfThD
 0AnA87+DJmUaO2inouXG9C4nHbHFH4w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724139217;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=eJzgZwYYrszKJntHGLXWq3Sv/YMR8P1l2O4ow8wQa6I=;
 b=qs1/+UBRhAUMorOFYsSE3MwP05t2f4bPC3KmD1WZCvo/5yhYoVm7Ykz880S/aSMeAvZsuJ
 5HsAgFDX2rNet7AQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724139215; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=eJzgZwYYrszKJntHGLXWq3Sv/YMR8P1l2O4ow8wQa6I=;
 b=XhGY3Kb6T8idST8BH19ztLE6dAFOVHIV0B6x6t9/Qpjn+UPz3rOSCt3iUmLKGIOuB3zIIL
 VRmI3UhALGiAlwViWql2TS/azSK5y5OOfDqw+0rdJ6XYrTD9TJRbt7f6DRFc6BTSNkgcX3
 74Bm8dsBcxZ0nxWPE/oG10zP5Svdk7w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724139215;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=eJzgZwYYrszKJntHGLXWq3Sv/YMR8P1l2O4ow8wQa6I=;
 b=ybdljJeFYoPpkLCiseM/vnm60WdbiRsolryHkHyLe0cZpzZyJs8FuRL0J4pX9svam95cbj
 gZ+PB4Nt5GYQRjBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 89ACF13770;
 Tue, 20 Aug 2024 07:33:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 4c1aIM9GxGaDHAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 20 Aug 2024 07:33:35 +0000
Message-ID: <2ce4d243-b8bc-4629-97b6-eb808657b2ba@suse.de>
Date: Tue, 20 Aug 2024 09:33:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 31/86] drm/panel/ili9341: Run DRM default client setup
To: neil.armstrong@linaro.org, daniel@ffwll.ch, airlied@gmail.com,
 jfalempe@redhat.com, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Jessica Zhang <quic_jesszhan@quicinc.com>
References: <20240816125408.310253-1-tzimmermann@suse.de>
 <20240816125408.310253-32-tzimmermann@suse.de>
 <7369663f-b2e6-404f-8b1c-f4d6628f3e1c@linaro.org>
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
In-Reply-To: <7369663f-b2e6-404f-8b1c-f4d6628f3e1c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_TO(0.00)[linaro.org,ffwll.ch,gmail.com,redhat.com];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 RCPT_COUNT_SEVEN(0.00)[11]; MIME_TRACE(0.00)[0:+];
 MID_RHS_MATCH_FROM(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email, imap1.dmz-prg2.suse.org:helo,
 linaro.org:email, suse.de:mid, suse.de:email]
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

Am 19.08.24 um 17:39 schrieb Neil Armstrong:
> On 16/08/2024 14:22, Thomas Zimmermann wrote:
>> Call drm_client_setup() to run the kernel's default client setup
>> for DRM. Set fbdev_probe in struct drm_driver, so that the client
>> setup can start the common fbdev client.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: Neil Armstrong <neil.armstrong@linaro.org>
>> Cc: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   drivers/gpu/drm/panel/panel-ilitek-ili9341.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c 
>> b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
>> index 775d5d5e828c..0ef9f7b59ccb 100644
>> --- a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
>> +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
>> @@ -31,6 +31,7 @@
>>   #include <video/mipi_display.h>
>>     #include <drm/drm_atomic_helper.h>
>> +#include <drm/drm_client_setup.h>
>>   #include <drm/drm_drv.h>
>>   #include <drm/drm_fbdev_dma.h>
>>   #include <drm/drm_gem_atomic_helper.h>
>> @@ -591,6 +592,7 @@ static struct drm_driver ili9341_dbi_driver = {
>>       .driver_features    = DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
>>       .fops            = &ili9341_dbi_fops,
>>       DRM_GEM_DMA_DRIVER_OPS_VMAP,
>> +    DRM_FBDEV_DMA_DRIVER_OPS,
>>       .debugfs_init        = mipi_dbi_debugfs_init,
>>       .name            = "ili9341",
>>       .desc            = "Ilitek ILI9341",
>> @@ -651,7 +653,7 @@ static int ili9341_dbi_probe(struct spi_device 
>> *spi, struct gpio_desc *dc,
>>         spi_set_drvdata(spi, drm);
>>   -    drm_fbdev_dma_setup(drm, 0);
>> +    drm_client_setup(drm, NULL);
>>         return 0;
>>   }
>
> So which one is right, this one or :
> https://lore.kernel.org/all/20240813091258.1625646-1-andriy.shevchenko@linux.intel.com/ 
>
> ?

There's long been talk about removing some duplicated drivers. IDK which 
is the correct or best one. I'll patch the panel driver if it will still 
be there.

Best regards
Thomas

>
> Neil

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

