Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C289037CA
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2024 11:30:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3E1110E061;
	Tue, 11 Jun 2024 09:30:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="AaByh0sr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AiMsvu2C";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="AaByh0sr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AiMsvu2C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66F9110E02B
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 09:30:01 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9170822E1F;
 Tue, 11 Jun 2024 09:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1718098199; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=s/o7VjVdqSKyQbEH+helGX2BBAgyr/42owpuqUXceM0=;
 b=AaByh0srZuo09sSn0VzAJHHjwggDxW+xTBhD8+R5edDdbvE1QuAyu8dO8CMxyvqPNjE67n
 w2FaNLWwFCnO3UTstj9JEh+1Fz5t4DvPjShtWfEXmgfqxnkyeVCnIC6vD2KwgcdEXgDC8Z
 2QTqBaUTWr5EOWRPjeaRbmYs07UexB0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1718098199;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=s/o7VjVdqSKyQbEH+helGX2BBAgyr/42owpuqUXceM0=;
 b=AiMsvu2CXcGwvNRRk2YapVJJSfp0YAhg+3aQZ+elkwqZGzEPDZfpTC+/RAoiOOLhrB+NUl
 ofsAQXm3eKfqTXDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1718098199; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=s/o7VjVdqSKyQbEH+helGX2BBAgyr/42owpuqUXceM0=;
 b=AaByh0srZuo09sSn0VzAJHHjwggDxW+xTBhD8+R5edDdbvE1QuAyu8dO8CMxyvqPNjE67n
 w2FaNLWwFCnO3UTstj9JEh+1Fz5t4DvPjShtWfEXmgfqxnkyeVCnIC6vD2KwgcdEXgDC8Z
 2QTqBaUTWr5EOWRPjeaRbmYs07UexB0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1718098199;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=s/o7VjVdqSKyQbEH+helGX2BBAgyr/42owpuqUXceM0=;
 b=AiMsvu2CXcGwvNRRk2YapVJJSfp0YAhg+3aQZ+elkwqZGzEPDZfpTC+/RAoiOOLhrB+NUl
 ofsAQXm3eKfqTXDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5249A13A55;
 Tue, 11 Jun 2024 09:29:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id JI2iEhcZaGYkcwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 11 Jun 2024 09:29:59 +0000
Message-ID: <6c01bee4-c3f5-496e-8b4f-a29c97954808@suse.de>
Date: Tue, 11 Jun 2024 11:29:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/fbdev-dma: fix getting smem_start
To: Peng Fan <peng.fan@nxp.com>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20240604080328.4024838-1-peng.fan@oss.nxp.com>
 <8f4a6d80-dd3e-422f-88af-d26f50c973ff@suse.de>
 <AM6PR04MB59415B3F01D02024A255BFB988C72@AM6PR04MB5941.eurprd04.prod.outlook.com>
 <766908de-922c-4d71-bb04-29dbe4d1d64d@suse.de>
 <AM6PR04MB5941216A69AE325A79689C5888C72@AM6PR04MB5941.eurprd04.prod.outlook.com>
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
In-Reply-To: <AM6PR04MB5941216A69AE325A79689C5888C72@AM6PR04MB5941.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.29 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 XM_UA_NO_VERSION(0.01)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_TO(0.00)[nxp.com,oss.nxp.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch,redhat.com];
 TO_DN_EQ_ADDR_SOME(0.00)[]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_TLS_ALL(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCPT_COUNT_SEVEN(0.00)[9]; MID_RHS_MATCH_FROM(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -4.29
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

Am 11.06.24 um 10:23 schrieb Peng Fan:
>> Subject: Re: [PATCH] drm/fbdev-dma: fix getting smem_start
>>
>> Hi
>>
>> Am 11.06.24 um 03:00 schrieb Peng Fan:
>>>> Subject: Re: [PATCH] drm/fbdev-dma: fix getting smem_start
>>>>
>>>> Hi
>>>>
>>>> Am 04.06.24 um 10:03 schrieb Peng Fan (OSS):
>>>>> From: Peng Fan <peng.fan@nxp.com>
>>>>>
>>>>> If 'info->screen_buffer' locates in vmalloc address space,
>>>>> virt_to_page will not be able to get correct results. With
>>>>> CONFIG_DEBUG_VM and CONFIG_DEBUG_VIRTUAL enabled on ARM64,
>>>> there is dump below:
>>>>
>>>> Which graphics driver triggers this bug?
>>> It is NXP i.MX95 DPU driver which is still in NXP downstream repo.
>> Which DRM memory manager does that driver use?
> DRM_GEM_DMA_DRIVER_OPS

So fbdev-dma would be correct. But with the gem-dma allocator, wouldn't 
you allocate from one of these dma_alloc_() calls at [1] ? How does the 
drivers end up with vmalloc'd fbdev memory? Specifically in the light of 
the docs at [2].

[1] 
https://elixir.bootlin.com/linux/v6.9/source/drivers/gpu/drm/drm_gem_dma_helper.c#L146
[2] 
https://elixir.bootlin.com/linux/v6.9/source/Documentation/core-api/dma-api-howto.rst#L124

Best regards
Thomas

>
>> I'm asking because if the driver allocates BOs via vmalloc(), should it really
>> use fbdev-dma?
> We use it for fbdev emulation. If drm_kms_helper.fbdev_emulation is 0,
> fbdev emulation could be disabled.
>
> Thanks
> Peng
>> Best regards
>> Thomas
>>
>>> Thanks,
>>> Peng.
>> --
>> --
>> Thomas Zimmermann
>> Graphics Driver Developer
>> SUSE Software Solutions Germany GmbH
>> Frankenstrasse 146, 90461 Nuernberg, Germany
>> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman HRB
>> 36809 (AG Nuernberg)

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

