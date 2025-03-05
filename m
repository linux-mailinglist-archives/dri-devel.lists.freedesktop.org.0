Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60459A50513
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 17:37:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B45F88EA1;
	Wed,  5 Mar 2025 16:37:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="uwhWgibV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3Fq3pdVe";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uwhWgibV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3Fq3pdVe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEC7E88EA1
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 16:37:51 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A2B1A211D1;
 Wed,  5 Mar 2025 16:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1741192670; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=V7YE4l6QvGMtICsK1zBLWcptgXG3+9dOdoIJu/W2Epw=;
 b=uwhWgibVQoWe4VLwAq99QxpsWWrB6zL5ylahQgLmLqtcCaOdgTsZWPpR7zopqwfdqf1uM9
 HABfKpGyViqYqolO03pEbnjSnU1urcYdpmJc8Ti+dPemeEGK2p2MfT5lHFbsxDRZwNuDrc
 1o3szYddUsG/jAyhZJGzOZ6SRjJ4g7E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1741192670;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=V7YE4l6QvGMtICsK1zBLWcptgXG3+9dOdoIJu/W2Epw=;
 b=3Fq3pdVewqII+jR/YrIYGW1SJv8hMOiZ0X8Yv9GExHQM/huY10b/QCJdeSwQeOs3FmXl/s
 cVHdLFb409MRt+BA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1741192670; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=V7YE4l6QvGMtICsK1zBLWcptgXG3+9dOdoIJu/W2Epw=;
 b=uwhWgibVQoWe4VLwAq99QxpsWWrB6zL5ylahQgLmLqtcCaOdgTsZWPpR7zopqwfdqf1uM9
 HABfKpGyViqYqolO03pEbnjSnU1urcYdpmJc8Ti+dPemeEGK2p2MfT5lHFbsxDRZwNuDrc
 1o3szYddUsG/jAyhZJGzOZ6SRjJ4g7E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1741192670;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=V7YE4l6QvGMtICsK1zBLWcptgXG3+9dOdoIJu/W2Epw=;
 b=3Fq3pdVewqII+jR/YrIYGW1SJv8hMOiZ0X8Yv9GExHQM/huY10b/QCJdeSwQeOs3FmXl/s
 cVHdLFb409MRt+BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 52E5813939;
 Wed,  5 Mar 2025 16:37:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ZW4uEt59yGfSfgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 05 Mar 2025 16:37:50 +0000
Message-ID: <6fffc2b6-c43c-4029-8c15-62bda34278f9@suse.de>
Date: Wed, 5 Mar 2025 17:37:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/10] drm: Hide import_attach from GEM code and helpers
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 simona@ffwll.ch, javierm@redhat.com, airlied@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org
References: <20250226172457.217725-1-tzimmermann@suse.de>
 <f150286f-1609-4175-a431-ba5cad80717c@amd.com>
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
In-Reply-To: <f150286f-1609-4175-a431-ba5cad80717c@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-0.998]; MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_TO(0.00)[amd.com,ffwll.ch,redhat.com,gmail.com,linux.intel.com,kernel.org,linaro.org];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 RCPT_COUNT_SEVEN(0.00)[8]; MIME_TRACE(0.00)[0:+];
 MID_RHS_MATCH_FROM(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
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



Am 05.03.25 um 16:38 schrieb Christian König:
> Reviewed-by: Christian König <christian.koenig@amd.com> for the entire series.

Thanks. I have equivalent patches for drivers as well. I'll send them 
out once this series has propagated through the trees.

Best regards
Thomas

>
> Regards,
> Christian.
>
> Am 26.02.25 um 18:03 schrieb Thomas Zimmermann:
>> Do not use struct drm_gem_object.import_attach unnecessarily. The
>> field is set by the PRIME import helpers. GEM and other helpers use
>> it for testing for imported dma-bufs and retrieving the respective
>> dma-buf instance.
>>
>> Replace all tests for import_attach with the new GEM helper function
>> drm_gem_is_imported(). The helper avoids import_attach in favor of
>> testing the imported dma-buf's object against the provided GEM object.
>>
>> Also replace references to import_attach.dmabuf. The imported dma-buf
>> is also available in the GEM object's dma_buf field.
>>
>> This series cleans up the GEM core and helpers. Drivers also use
>> import_attach and should later be updated as well.
>>
>> There's a TODO item for making import_attach entirely optional. This
>> series is a first step towards this goal.
>>
>> Thomas Zimmermann (10):
>>    drm/gem: Test for imported GEM buffers with helper
>>    drm/gem-dma: Test for imported buffers with drm_gem_is_imported()
>>    drm/gem-dma: Use dma_buf from GEM object instance
>>    drm/gem-shmem: Test for imported buffers with drm_gem_is_imported()
>>    drm/gem-shmem: Use dma_buf from GEM object instance
>>    drm/gem-framebuffer: Test for imported buffers with
>>      drm_gem_is_imported()
>>    drm/gem-framebuffer: Use dma_buf from GEM object instance
>>    drm/fb-dma-helper: Test for imported buffers with
>>      drm_gem_is_imported()
>>    drm/mipi-dbi: Test for imported buffers with drm_gem_is_imported()
>>    drm/prime: Use dma_buf from GEM object instance
>>
>>   drivers/gpu/drm/drm_fb_dma_helper.c          |  2 +-
>>   drivers/gpu/drm/drm_gem.c                    |  4 +--
>>   drivers/gpu/drm/drm_gem_dma_helper.c         |  4 +--
>>   drivers/gpu/drm/drm_gem_framebuffer_helper.c | 12 +++-----
>>   drivers/gpu/drm/drm_gem_shmem_helper.c       | 30 ++++++++++----------
>>   drivers/gpu/drm/drm_mipi_dbi.c               |  2 +-
>>   drivers/gpu/drm/drm_prime.c                  |  8 +-----
>>   include/drm/drm_gem.h                        | 14 +++++++++
>>   include/drm/drm_gem_shmem_helper.h           |  2 +-
>>   9 files changed, 41 insertions(+), 37 deletions(-)
>>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

