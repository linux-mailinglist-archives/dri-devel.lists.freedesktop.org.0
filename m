Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A839489BC
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 09:06:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3309510E2FC;
	Tue,  6 Aug 2024 07:06:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Dx67oUfz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="euqclg82";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Y3a09XDN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="V1QNgYAu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FF7510E2F4;
 Tue,  6 Aug 2024 07:06:54 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E64651F814;
 Tue,  6 Aug 2024 07:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1722928012; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=bTdvG57nPdxzycvSyLhrDwSpSmQWN0CPQORd1PyZkWA=;
 b=Dx67oUfz0BA55/uZFxST4JMaJonCpvno45o137tsNYbPw33m0TCE4VC1UXD2ABHKXUWxkR
 HeayOAtDET8Lx2MZYHJ1zWXRH7N0J+AkQYqV/sQ1aV+NnKtkHQ9hLKpDXzVOp3aENNAqVu
 ANgkFwm9Xivb5JXRCcl14oKmhz36BYM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1722928012;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=bTdvG57nPdxzycvSyLhrDwSpSmQWN0CPQORd1PyZkWA=;
 b=euqclg82bO/9o3YKVvdfIJ4Si8uIcq0+xQfQHmvtXHn+N2cmSt35EzFEVCgLHH6ZXlsJ1X
 XLmJShwpwzC8dMAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1722928011; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=bTdvG57nPdxzycvSyLhrDwSpSmQWN0CPQORd1PyZkWA=;
 b=Y3a09XDNZSgCayv4gzWBEcfq2m7ulmAlUlb3yHOxGt1KZIk3riBwU7NTVZeGbkqLOjHnGc
 Hib2jYSXT7yjzRqqA1fjcix9SKpUezfl0KfIfFMDZaJEhfDa5Hhfwo1wWp02kaC1hiV6RM
 X1CxzEY+dNtRh5lfumXT+v2+V+K7BBU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1722928011;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=bTdvG57nPdxzycvSyLhrDwSpSmQWN0CPQORd1PyZkWA=;
 b=V1QNgYAuzhgXAQGaHxjdxzqU1mKdJjO955YkHnB3mEtVC43ttMGF3pQ66Y68SUU7VHUEPH
 XGZ8FfIFuCvWgJAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9985313981;
 Tue,  6 Aug 2024 07:06:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 420AJIvLsWZiVAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 06 Aug 2024 07:06:51 +0000
Message-ID: <6156f386-9316-4777-8cdb-f46ca3a9c183@suse.de>
Date: Tue, 6 Aug 2024 09:06:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] drm/amdgpu: Use backlight power constants
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "airlied@gmail.com" <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>
References: <20240731122311.1143153-1-tzimmermann@suse.de>
 <20240731122311.1143153-2-tzimmermann@suse.de>
 <BL1PR12MB514410E846FEB773DC0CAEEFF7BE2@BL1PR12MB5144.namprd12.prod.outlook.com>
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
In-Reply-To: <BL1PR12MB514410E846FEB773DC0CAEEFF7BE2@BL1PR12MB5144.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.29 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 XM_UA_NO_VERSION(0.01)[]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_TO(0.00)[amd.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 TO_DN_EQ_ADDR_SOME(0.00)[]; ARC_NA(0.00)[];
 RCPT_COUNT_SEVEN(0.00)[11]; RCVD_VIA_SMTP_AUTH(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email]
X-Spam-Score: -4.29
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

Am 05.08.24 um 21:00 schrieb Deucher, Alexander:
> [Public]
>
>> -----Original Message-----
>> From: Thomas Zimmermann <tzimmermann@suse.de>
>> Sent: Wednesday, July 31, 2024 8:17 AM
>> To: maarten.lankhorst@linux.intel.com; mripard@kernel.org;
>> airlied@gmail.com; daniel@ffwll.ch
>> Cc: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; intel-
>> gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org; Thomas
>> Zimmermann <tzimmermann@suse.de>; Deucher, Alexander
>> <Alexander.Deucher@amd.com>; Koenig, Christian
>> <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>
>> Subject: [PATCH 1/9] drm/amdgpu: Use backlight power constants
>>
>> Replace FB_BLANK_ constants with their counterparts from the backlight
>> subsystem. The values are identical, so there's no change in functionality or
>> semantics.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: Alex Deucher <alexander.deucher@amd.com>
>> Cc: "Christian König" <christian.koenig@amd.com>
>> Cc: Xinhui Pan <Xinhui.Pan@amd.com>
> This patch and the radeon patch are:
> Acked-by: Alex Deucher <alexander.deucher@amd.com>
>
> Feel free to take them via whatever tree makes sense if you are trying to keep the patches together, or let me know if you want me to pick them up.

Thank you for the reviews. Please pick up both patches into the rsp AMD 
trees. The i915 patch already went into Intel trees and the rest of the 
series will go into drm-misc.

Best regards
Thomas

>
> Thanks,
>
> Alex
>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/atombios_encoders.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
>> b/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
>> index 25feab188dfe..650ec95bb40a 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
>> @@ -215,7 +215,7 @@ void
>> amdgpu_atombios_encoder_init_backlight(struct amdgpu_encoder
>> *amdgpu_encode
>>        dig->bl_dev = bd;
>>
>>        bd->props.brightness =
>> amdgpu_atombios_encoder_get_backlight_brightness(bd);
>> -     bd->props.power = FB_BLANK_UNBLANK;
>> +     bd->props.power = BACKLIGHT_POWER_ON;
>>        backlight_update_status(bd);
>>
>>        DRM_INFO("amdgpu atom DIG backlight initialized\n");
>> --
>> 2.45.2

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

