Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9356B903FC4
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2024 17:10:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8C3710E0E5;
	Tue, 11 Jun 2024 15:10:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Bo++Y1m6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SFxOYZr0";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Bo++Y1m6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SFxOYZr0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94BC410E680
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 15:10:49 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8873C20813;
 Tue, 11 Jun 2024 15:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1718118647; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=gtrSnCt5VrITf5xKT+PsiOkLOUkHhw0bKnl8iMJJjAk=;
 b=Bo++Y1m6cXxJkTmxV2RlUI55BdAzth/iPnRsiN7omJ8IvxHm7C8Efg0pjJm9AF39mKxEfk
 UyeaM7CXOxmoidwdv2HoeRct4Uz42WIRUEZ9ZLb4D1fUQSXYNNPAHdxrBwKn8FSKl2UXeA
 H0N5gHnlFay0TV0uf9CfzGupfT8oxfE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1718118647;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=gtrSnCt5VrITf5xKT+PsiOkLOUkHhw0bKnl8iMJJjAk=;
 b=SFxOYZr0vsIKvx+QAKmrdcYfO/llQBolbqS/qwrGmTjNn3kDZoS70GeJYCKXwx4fmN+7xb
 UOYU1YPShCBQC+Cg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1718118647; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=gtrSnCt5VrITf5xKT+PsiOkLOUkHhw0bKnl8iMJJjAk=;
 b=Bo++Y1m6cXxJkTmxV2RlUI55BdAzth/iPnRsiN7omJ8IvxHm7C8Efg0pjJm9AF39mKxEfk
 UyeaM7CXOxmoidwdv2HoeRct4Uz42WIRUEZ9ZLb4D1fUQSXYNNPAHdxrBwKn8FSKl2UXeA
 H0N5gHnlFay0TV0uf9CfzGupfT8oxfE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1718118647;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=gtrSnCt5VrITf5xKT+PsiOkLOUkHhw0bKnl8iMJJjAk=;
 b=SFxOYZr0vsIKvx+QAKmrdcYfO/llQBolbqS/qwrGmTjNn3kDZoS70GeJYCKXwx4fmN+7xb
 UOYU1YPShCBQC+Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5759E137DF;
 Tue, 11 Jun 2024 15:10:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 8YIBFPdoaGZLXQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 11 Jun 2024 15:10:47 +0000
Message-ID: <701a8ee3-5959-4d2c-a313-6f021039afdc@suse.de>
Date: Tue, 11 Jun 2024 17:10:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] drm/mgag200: Set .detect_ctx() and enable
 connector polling
To: Jocelyn Falempe <jfalempe@redhat.com>, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
References: <20240610141141.29527-1-tzimmermann@suse.de>
 <20240610141141.29527-4-tzimmermann@suse.de>
 <7b92e719-3187-4470-92b9-d017c729ddac@redhat.com>
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
In-Reply-To: <7b92e719-3187-4470-92b9-d017c729ddac@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.29 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 XM_UA_NO_VERSION(0.01)[];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RCPT_COUNT_SEVEN(0.00)[7]; MIME_TRACE(0.00)[0:+];
 MID_RHS_MATCH_FROM(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -4.29
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

Hi Jocelyn

Am 11.06.24 um 16:41 schrieb Jocelyn Falempe:
>
>
> On 10/06/2024 16:06, Thomas Zimmermann wrote:
>> Set .detect_ctx() in struct drm_connector_helper_funcs to the
>> common helper drm_connector_helper_detect_from_ddc() and enable
>> polling for the connector. Mgag200 will now test for the monitor's
>> presence by probing the DDC in regular intervals.
>>
> I've tested this series on two servers, one with physical VGA plugged, 
> and one remote system, and it works as intended.
>
> Thanks a lot for this work.
>
> Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

Great, thanks a lot for reviewing and testing quickly.

Best regards
Thomas

>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>   drivers/gpu/drm/mgag200/mgag200_g200.c    | 1 +
>>   drivers/gpu/drm/mgag200/mgag200_g200eh.c  | 1 +
>>   drivers/gpu/drm/mgag200/mgag200_g200eh3.c | 1 +
>>   drivers/gpu/drm/mgag200/mgag200_g200er.c  | 1 +
>>   drivers/gpu/drm/mgag200/mgag200_g200ev.c  | 1 +
>>   drivers/gpu/drm/mgag200/mgag200_g200ew3.c | 1 +
>>   drivers/gpu/drm/mgag200/mgag200_g200se.c  | 1 +
>>   drivers/gpu/drm/mgag200/mgag200_g200wb.c  | 1 +
>>   drivers/gpu/drm/mgag200/mgag200_vga.c     | 6 +++++-
>>   9 files changed, 13 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200.c 
>> b/drivers/gpu/drm/mgag200/mgag200_g200.c
>> index ff467b0f9cbf3..f874e29498409 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_g200.c
>> +++ b/drivers/gpu/drm/mgag200/mgag200_g200.c
>> @@ -401,6 +401,7 @@ struct mga_device 
>> *mgag200_g200_device_create(struct pci_dev *pdev, const struct
>>           return ERR_PTR(ret);
>>         drm_mode_config_reset(dev);
>> +    drm_kms_helper_poll_init(dev);
>>         return mdev;
>>   }
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200eh.c 
>> b/drivers/gpu/drm/mgag200/mgag200_g200eh.c
>> index 6f31c5249f0b1..52bf49ead5c50 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_g200eh.c
>> +++ b/drivers/gpu/drm/mgag200/mgag200_g200eh.c
>> @@ -277,6 +277,7 @@ struct mga_device 
>> *mgag200_g200eh_device_create(struct pci_dev *pdev, const stru
>>           return ERR_PTR(ret);
>>         drm_mode_config_reset(dev);
>> +    drm_kms_helper_poll_init(dev);
>>         return mdev;
>>   }
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200eh3.c 
>> b/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
>> index 5befe8da4beb2..e7f89b2a59fd0 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
>> +++ b/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
>> @@ -182,6 +182,7 @@ struct mga_device 
>> *mgag200_g200eh3_device_create(struct pci_dev *pdev,
>>           return ERR_PTR(ret);
>>         drm_mode_config_reset(dev);
>> +    drm_kms_helper_poll_init(dev);
>>         return mdev;
>>   }
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200er.c 
>> b/drivers/gpu/drm/mgag200/mgag200_g200er.c
>> index 55c275180cde2..4e8a1756138d7 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_g200er.c
>> +++ b/drivers/gpu/drm/mgag200/mgag200_g200er.c
>> @@ -316,6 +316,7 @@ struct mga_device 
>> *mgag200_g200er_device_create(struct pci_dev *pdev, const stru
>>           return ERR_PTR(ret);
>>         drm_mode_config_reset(dev);
>> +    drm_kms_helper_poll_init(dev);
>>         return mdev;
>>   }
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200ev.c 
>> b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
>> index 2466126140db6..d884f3cb0ec79 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_g200ev.c
>> +++ b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
>> @@ -321,6 +321,7 @@ struct mga_device 
>> *mgag200_g200ev_device_create(struct pci_dev *pdev, const stru
>>           return ERR_PTR(ret);
>>         drm_mode_config_reset(dev);
>> +    drm_kms_helper_poll_init(dev);
>>         return mdev;
>>   }
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200ew3.c 
>> b/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
>> index a52e60609c3de..839401e8b4654 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
>> +++ b/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
>> @@ -202,6 +202,7 @@ struct mga_device 
>> *mgag200_g200ew3_device_create(struct pci_dev *pdev,
>>           return ERR_PTR(ret);
>>         drm_mode_config_reset(dev);
>> +    drm_kms_helper_poll_init(dev);
>>         return mdev;
>>   }
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200se.c 
>> b/drivers/gpu/drm/mgag200/mgag200_g200se.c
>> index 212770acdd477..a824bb8ad5791 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_g200se.c
>> +++ b/drivers/gpu/drm/mgag200/mgag200_g200se.c
>> @@ -521,6 +521,7 @@ struct mga_device 
>> *mgag200_g200se_device_create(struct pci_dev *pdev, const stru
>>           return ERR_PTR(ret);
>>         drm_mode_config_reset(dev);
>> +    drm_kms_helper_poll_init(dev);
>>         return mdev;
>>   }
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200wb.c 
>> b/drivers/gpu/drm/mgag200/mgag200_g200wb.c
>> index cb6daa0426fbc..835df0f4fc13d 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_g200wb.c
>> +++ b/drivers/gpu/drm/mgag200/mgag200_g200wb.c
>> @@ -326,6 +326,7 @@ struct mga_device 
>> *mgag200_g200wb_device_create(struct pci_dev *pdev, const stru
>>           return ERR_PTR(ret);
>>         drm_mode_config_reset(dev);
>> +    drm_kms_helper_poll_init(dev);
>>         return mdev;
>>   }
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_vga.c 
>> b/drivers/gpu/drm/mgag200/mgag200_vga.c
>> index 6d8982990c2c3..60568f32736dd 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_vga.c
>> +++ b/drivers/gpu/drm/mgag200/mgag200_vga.c
>> @@ -12,7 +12,8 @@ static const struct drm_encoder_funcs 
>> mgag200_dac_encoder_funcs = {
>>   };
>>     static const struct drm_connector_helper_funcs 
>> mgag200_vga_connector_helper_funcs = {
>> -    .get_modes = drm_connector_helper_get_modes
>> +    .get_modes = drm_connector_helper_get_modes,
>> +    .detect_ctx = drm_connector_helper_detect_from_ddc
>>   };
>>     static const struct drm_connector_funcs 
>> mgag200_vga_connector_funcs = {
>> @@ -58,6 +59,9 @@ int mgag200_vga_output_init(struct mga_device *mdev)
>>       }
>>       drm_connector_helper_add(connector, 
>> &mgag200_vga_connector_helper_funcs);
>>   +    connector->polled = DRM_CONNECTOR_POLL_CONNECT |
>> +                DRM_CONNECTOR_POLL_DISCONNECT;
>> +
>>       ret = drm_connector_attach_encoder(connector, encoder);
>>       if (ret) {
>>           drm_err(dev, "drm_connector_attach_encoder() failed: %d\n", 
>> ret);
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

