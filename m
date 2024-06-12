Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6AD9904E45
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 10:37:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B882910E7DB;
	Wed, 12 Jun 2024 08:37:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="QWqbd73q";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ss2PGx4W";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QWqbd73q";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ss2PGx4W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6437410E7FA
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 08:37:17 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5F5D4340D7;
 Wed, 12 Jun 2024 08:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1718181435; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=SG66lCuTBtRrUcDZb/NXKExJ27Faq10AeO/CvMXqc+c=;
 b=QWqbd73qpVFEC24eoiMFB8dkAhOa5EdfpSLyzXHkZV8DMSuWk0TeQ/zaIRz/C4IkCE+vU4
 h3FeCFEcxm19judYElYiV9zRnkZ2qpOETD0FRxAUdow0aPTVBptnnn7ir5b4HHMd5uG59z
 ULPq1o8e8oNscIt3aan3SDkbomXSf80=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1718181435;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=SG66lCuTBtRrUcDZb/NXKExJ27Faq10AeO/CvMXqc+c=;
 b=ss2PGx4WTiYpq1x2RrndpdmQWX4jv+buaD7QkrkXi/fg0/cSAR9k1/vNvYzxd1ChoheqiJ
 NKngdBIFxTCSmZCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1718181435; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=SG66lCuTBtRrUcDZb/NXKExJ27Faq10AeO/CvMXqc+c=;
 b=QWqbd73qpVFEC24eoiMFB8dkAhOa5EdfpSLyzXHkZV8DMSuWk0TeQ/zaIRz/C4IkCE+vU4
 h3FeCFEcxm19judYElYiV9zRnkZ2qpOETD0FRxAUdow0aPTVBptnnn7ir5b4HHMd5uG59z
 ULPq1o8e8oNscIt3aan3SDkbomXSf80=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1718181435;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=SG66lCuTBtRrUcDZb/NXKExJ27Faq10AeO/CvMXqc+c=;
 b=ss2PGx4WTiYpq1x2RrndpdmQWX4jv+buaD7QkrkXi/fg0/cSAR9k1/vNvYzxd1ChoheqiJ
 NKngdBIFxTCSmZCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 280B01372E;
 Wed, 12 Jun 2024 08:37:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id pU4dCDteaWYrXwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 12 Jun 2024 08:37:15 +0000
Message-ID: <14a7c534-af3f-43b8-a24c-501a9af97936@suse.de>
Date: Wed, 12 Jun 2024 10:37:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/fbdev-dma: fix getting smem_start
To: Javier Martinez Canillas <javierm@redhat.com>,
 "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Peng Fan <peng.fan@nxp.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240604080328.4024838-1-peng.fan@oss.nxp.com>
 <8f4a6d80-dd3e-422f-88af-d26f50c973ff@suse.de>
 <e307fdc0-553d-4946-9017-ed3a28e9cae2@suse.de>
 <87cyomsiqt.fsf@minerva.mail-host-address-is-not-set>
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
In-Reply-To: <87cyomsiqt.fsf@minerva.mail-host-address-is-not-set>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.29 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 XM_UA_NO_VERSION(0.01)[];
 FREEMAIL_TO(0.00)[redhat.com,oss.nxp.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RCPT_COUNT_SEVEN(0.00)[9]; MIME_TRACE(0.00)[0:+];
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

Hi Javier

Am 12.06.24 um 09:49 schrieb Javier Martinez Canillas:
> Thomas Zimmermann <tzimmermann@suse.de> writes:
>
> Hello Thomas,
>
>> Hi
>>
>> Am 10.06.24 um 10:47 schrieb Thomas Zimmermann:
>>> Hi
>>>
>>> Am 04.06.24 um 10:03 schrieb Peng Fan (OSS):
>>>> From: Peng Fan <peng.fan@nxp.com>
>>>>
>>>> If 'info->screen_buffer' locates in vmalloc address space, virt_to_page
>>>> will not be able to get correct results. With CONFIG_DEBUG_VM and
>>>> CONFIG_DEBUG_VIRTUAL enabled on ARM64, there is dump below:
>>> Which graphics driver triggers this bug?
>>>
>>>> [    3.536043] ------------[ cut here ]------------
>>>> [    3.540716] virt_to_phys used for non-linear address:
>>>> 000000007fc4f540 (0xffff800086001000)
>>>> [    3.552628] WARNING: CPU: 4 PID: 61 at arch/arm64/mm/physaddr.c:12
>>>> __virt_to_phys+0x68/0x98
>>>> [    3.565455] Modules linked in:
>>>> [    3.568525] CPU: 4 PID: 61 Comm: kworker/u12:5 Not tainted
>>>> 6.6.23-06226-g4986cc3e1b75-dirty #250
>>>> [    3.577310] Hardware name: NXP i.MX95 19X19 board (DT)
>>>> [    3.582452] Workqueue: events_unbound deferred_probe_work_func
>>>> [    3.588291] pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS
>>>> BTYPE=--)
>>>> [    3.595233] pc : __virt_to_phys+0x68/0x98
>>>> [    3.599246] lr : __virt_to_phys+0x68/0x98
>>>> [    3.603276] sp : ffff800083603990
>>>> [    3.677939] Call trace:
>>>> [    3.680393]  __virt_to_phys+0x68/0x98
>>>> [    3.684067]  drm_fbdev_dma_helper_fb_probe+0x138/0x238
>>>> [    3.689214] __drm_fb_helper_initial_config_and_unlock+0x2b0/0x4c0
>>>> [    3.695385]  drm_fb_helper_initial_config+0x4c/0x68
>>>> [    3.700264]  drm_fbdev_dma_client_hotplug+0x8c/0xe0
>>>> [    3.705161]  drm_client_register+0x60/0xb0
>>>> [    3.709269]  drm_fbdev_dma_setup+0x94/0x148
>>>>
>>>> So add a check 'is_vmalloc_addr'.
>>>>
>>>> Fixes: b79fe9abd58b ("drm/fbdev-dma: Implement fbdev emulation for
>>>> GEM DMA helpers")
>>>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>>> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>> I'm taking back my r-b. The memory is expected to by be physically
>> contiguous and vmalloc() won't guarantee that.
>>
> Agreed.

These smem_ fields are clearly designed for PCI BARs of traditional 
graphics cards. So can we even assume contiguous memory for DMA? That 
was my assumption, but with IOMMUs it might not be the case. Fbdev-dma 
only sets smem_start to support a single old userspace driver. Maybe we 
should further restrict usage of this field by making it opt-in for each 
driver. Best regards Thomas
>
>> Best regards
>> Thomas
>>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

