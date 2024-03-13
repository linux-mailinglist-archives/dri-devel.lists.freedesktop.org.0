Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A562687A41A
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 09:30:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FBBB10E801;
	Wed, 13 Mar 2024 08:30:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="03MWhONd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2MxIstKL";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pMqtDZPO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="o/7X7Noi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7511010E801
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 08:30:48 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CA1FB21C9B;
 Wed, 13 Mar 2024 08:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1710318647; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=amCJkCQx10WF/61L23LvW8yBBzXXKFmrhM70x3Ir3Jc=;
 b=03MWhONd8gK7BIkDWFptVnDZYtqx2rt/oULpXXoFfw7NOwcodCVS1ouE1cvFZh5XiC1cLf
 0Fp6mR+JBLaZfTU2wnocuElRGfzBdxHQugbFRvSN7aMXHVoQOIQ9yxzOADFFkYIq5GuhwT
 Y7xcOwXJWOdYb1m+SmtujMnWJ7GeWqM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1710318647;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=amCJkCQx10WF/61L23LvW8yBBzXXKFmrhM70x3Ir3Jc=;
 b=2MxIstKLYG8/oQNJJpG8AggSFK3BHsmPodR5DtibPceq2ZHmVr5NXtXHCpcKnEcqpzW4VD
 6LlhfkVf2llLizDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1710318646; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=amCJkCQx10WF/61L23LvW8yBBzXXKFmrhM70x3Ir3Jc=;
 b=pMqtDZPOTbOBxmeYJzlpnlkufduAsWYW/5msm0pC3IdPLSsIKUq1htd50T4O9UQp0ZZfjj
 t7bT0AtudF91pugYMDvkpYNlCXiO7VG52a5coEIPUiTyYgNLPwhKS4hRm7kYtQho31wXxg
 IQVuE+RCG3DsW0O25CXOqv83DpTNBwE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1710318646;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=amCJkCQx10WF/61L23LvW8yBBzXXKFmrhM70x3Ir3Jc=;
 b=o/7X7NoicIOgmP4jxjnZxBpvE9nOVpH0GWndsO7PBdkdtvFa9tl8pe+ZeBGfVWkmInuRrx
 2HKLUbmaRuljAyBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 92A8813977;
 Wed, 13 Mar 2024 08:30:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id G357IjZk8WWLYgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 13 Mar 2024 08:30:46 +0000
Message-ID: <12c6a92d-d3f5-4884-8b6d-ce20a3ade01e@suse.de>
Date: Wed, 13 Mar 2024 09:30:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 29/43] drm/renesas/rz-du: Use fbdev-dma
Content-Language: en-US
To: Biju Das <biju.das.jz@bp.renesas.com>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>, "airlied@gmail.com" <airlied@gmail.com>,
 "deller@gmx.de" <deller@gmx.de>, "javierm@redhat.com" <javierm@redhat.com>
Cc: "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20240312154834.26178-1-tzimmermann@suse.de>
 <20240312154834.26178-30-tzimmermann@suse.de>
 <OSBPR01MB1592F28EBCB531481479673C862B2@OSBPR01MB1592.jpnprd01.prod.outlook.com>
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
In-Reply-To: <OSBPR01MB1592F28EBCB531481479673C862B2@OSBPR01MB1592.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -4.29
X-Spamd-Result: default: False [-4.29 / 50.00]; ARC_NA(0.00)[];
 TO_DN_EQ_ADDR_SOME(0.00)[]; XM_UA_NO_VERSION(0.01)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; RCPT_COUNT_SEVEN(0.00)[7];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
 FREEMAIL_TO(0.00)[bp.renesas.com,ffwll.ch,gmail.com,gmx.de,redhat.com];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]
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

Am 12.03.24 um 20:14 schrieb Biju Das:
> Hi Thomas,
>
>> -----Original Message-----
>> From: Thomas Zimmermann <tzimmermann@suse.de>
>> Sent: Tuesday, March 12, 2024 3:45 PM
>> To: daniel@ffwll.ch; airlied@gmail.com; deller@gmx.de; javierm@redhat.com
>> Cc: linux-fbdev@vger.kernel.org; dri-devel@lists.freedesktop.org; Thomas Zimmermann
>> <tzimmermann@suse.de>; Biju Das <biju.das.jz@bp.renesas.com>
>> Subject: [PATCH 29/43] drm/renesas/rz-du: Use fbdev-dma
>>
>> Implement fbdev emulation with fbdev-dma. Fbdev-dma now supports damage handling, which is required by
>> rz-du. Avoids the overhead of fbdev-generic's additional shadow buffering. No functional changes.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>
> Tested-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks a lot.

I just noticed that the drivers under renesas/ don't require damage 
handling, so the commit message needs a change.

Best regards
Thomas

>
> Cheers,
> Biju
>
>> Cc: Biju Das <biju.das.jz@bp.renesas.com>
>> ---
>>   drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c b/drivers/gpu/drm/renesas/rz-
>> du/rzg2l_du_drv.c
>> index 470d34da1d6c4..e5eca8691a331 100644
>> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
>> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
>> @@ -14,7 +14,7 @@
>>
>>   #include <drm/drm_atomic_helper.h>
>>   #include <drm/drm_drv.h>
>> -#include <drm/drm_fbdev_generic.h>
>> +#include <drm/drm_fbdev_dma.h>
>>   #include <drm/drm_gem_dma_helper.h>
>>   #include <drm/drm_probe_helper.h>
>>
>> @@ -149,7 +149,7 @@ static int rzg2l_du_probe(struct platform_device *pdev)
>>
>>   	drm_info(&rcdu->ddev, "Device %s probed\n", dev_name(&pdev->dev));
>>
>> -	drm_fbdev_generic_setup(&rcdu->ddev, 32);
>> +	drm_fbdev_dma_setup(&rcdu->ddev, 32);
>>
>>   	return 0;
>>
>> --
>> 2.44.0

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

