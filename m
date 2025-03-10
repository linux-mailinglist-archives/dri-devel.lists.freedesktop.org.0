Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D6BA59043
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 10:50:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56F4910E3D6;
	Mon, 10 Mar 2025 09:50:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="eS7tOX0Y";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KGnu+jTa";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="eS7tOX0Y";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KGnu+jTa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9AEF10E3D6
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 09:50:51 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 027321F38A;
 Mon, 10 Mar 2025 09:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1741600248; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=YeuMKNi5qQd0/LTMAFMojcqAae/eFm7/Ig1mkwHk57o=;
 b=eS7tOX0Y3o1mv24y0UFucLHkkuweDwGWVIGll7nyXTHIbOT2N/bH/ViauqnPIfOZnTDvPQ
 WXO1RE5weEe90V5v4TmGIsHvx0fJnIHWT+ZVuS37N2hJzD/fWb/Ze2QRO0IUz24sBE4p0q
 yE3gIXeG79b4w5jvsrFrckl/7POEVeM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1741600248;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=YeuMKNi5qQd0/LTMAFMojcqAae/eFm7/Ig1mkwHk57o=;
 b=KGnu+jTaDMpNLQj4vcnA3jabTJNpZuphKWjcpPVcNLOPuNJVkhYv7rYKqmH1F6Qfka8xAd
 +WWySkUbmdOhiEBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1741600248; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=YeuMKNi5qQd0/LTMAFMojcqAae/eFm7/Ig1mkwHk57o=;
 b=eS7tOX0Y3o1mv24y0UFucLHkkuweDwGWVIGll7nyXTHIbOT2N/bH/ViauqnPIfOZnTDvPQ
 WXO1RE5weEe90V5v4TmGIsHvx0fJnIHWT+ZVuS37N2hJzD/fWb/Ze2QRO0IUz24sBE4p0q
 yE3gIXeG79b4w5jvsrFrckl/7POEVeM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1741600248;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=YeuMKNi5qQd0/LTMAFMojcqAae/eFm7/Ig1mkwHk57o=;
 b=KGnu+jTaDMpNLQj4vcnA3jabTJNpZuphKWjcpPVcNLOPuNJVkhYv7rYKqmH1F6Qfka8xAd
 +WWySkUbmdOhiEBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9ACE21399F;
 Mon, 10 Mar 2025 09:50:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id +v93JPe1zmfCXAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 10 Mar 2025 09:50:47 +0000
Message-ID: <864f2d0e-083e-480f-b15a-263ac5f11360@suse.de>
Date: Mon, 10 Mar 2025 10:50:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] drm: Provide a dedicated DMA device for PRIME
 import
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: simona@ffwll.ch, javierm@redhat.com, airlied@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, hdegoede@redhat.com,
 airlied@redhat.com, sean@poorly.run, sumit.semwal@linaro.org,
 christian.koenig@amd.com, admin@kodeit.net, gargaditya08@live.com,
 jani.nikula@intel.com, dri-devel@lists.freedesktop.org
References: <20250307080836.42848-1-tzimmermann@suse.de>
 <Z8r1Ymc0RzoHEUpG@phenom.ffwll.local>
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
In-Reply-To: <Z8r1Ymc0RzoHEUpG@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-0.999]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 RCPT_COUNT_TWELVE(0.00)[15]; MID_RHS_MATCH_FROM(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,live.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[ffwll.ch,redhat.com,gmail.com,linux.intel.com,kernel.org,poorly.run,linaro.org,amd.com,kodeit.net,live.com,intel.com,lists.freedesktop.org];
 TO_DN_SOME(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -4.30
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

Am 07.03.25 um 14:32 schrieb Simona Vetter:
> On Fri, Mar 07, 2025 at 09:03:58AM +0100, Thomas Zimmermann wrote:
>> Importing dma-bufs via PRIME requires a DMA-capable hardware device.
>> This is not the case for USB, where DMA is performed entirely by the
>> USB controller instead of the USB devices.
>>
>> Drivers for USB-based hardware maintain their own workarounds for this
>> problem. The original idea to resolve this was to provide different
>> PRIME helpers for such devices, but the dma-buf code internally assumes
>> DMA functionality as well. So that ideas is not realistic.
> So dma-buf without dma is doable, but you have to avoid dma_buf_attach.
> And that is a lot of surgery in the current prime helpers, since those
> assume that an attachment always exists. But dma-buf itself is entirely
> fine with cpu-only access through either userspace mmap or kernel vmap.

Right. That's roughly how far I got in this direction. The field 
import_attach, set up by dma_buf_attach(), is currently used throughout 
the DRM code and drivers. Hence this series and the other one that 
replaced some of the uses of import_attach. Once this has all been 
resolved, there will be a few users of the field left, which might be 
uncritical.

Best regards
Thomas

>
> I think as an interim step this is still good, since it makes the current
> hacks easier to find because at least it's all common now.
> -Sima
>
>> Let's instead turn the current workaround into a feature. Patch 1 adds a
>> dma_dev field to struct drm_device and makes the PRIME code use it. Patches
>> 2 to 5 replace related driver code.
>>
>> It will also be useful in other code. The exynos and mediatek drivers
>> already maintain a dedicated DMA device for non-PRIME code. They could
>> likely use dma_dev as well. GEM-DMA helpers currently allocate DMA
>> memory with the regular parent device. They should support the dma_dev
>> settings as well.
>>
>> Tested with udl.
>>
>> v2:
>> - maintain reference on dma_dev (Jani)
>> - improve docs (Maxime)
>> - update appletbdrm
>>
>> Thomas Zimmermann (5):
>>    drm/prime: Support dedicated DMA device for dma-buf imports
>>    drm/appletbdrm: Set struct drm_device.dma_dev
>>    drm/gm12u320: Set struct drm_device.dma_dev
>>    drm/gud: Set struct drm_device.dma_dev
>>    drm/udl: Set struct drm_device.dma_dev
>>
>>   drivers/gpu/drm/drm_drv.c          | 21 ++++++++++++++
>>   drivers/gpu/drm/drm_prime.c        |  2 +-
>>   drivers/gpu/drm/gud/gud_drv.c      | 33 ++++++---------------
>>   drivers/gpu/drm/gud/gud_internal.h |  1 -
>>   drivers/gpu/drm/tiny/appletbdrm.c  | 27 +++++++-----------
>>   drivers/gpu/drm/tiny/gm12u320.c    | 46 +++++++++---------------------
>>   drivers/gpu/drm/udl/udl_drv.c      | 17 -----------
>>   drivers/gpu/drm/udl/udl_drv.h      |  1 -
>>   drivers/gpu/drm/udl/udl_main.c     | 14 ++++-----
>>   include/drm/drm_device.h           | 41 ++++++++++++++++++++++++++
>>   10 files changed, 102 insertions(+), 101 deletions(-)
>>
>> -- 
>> 2.48.1
>>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

