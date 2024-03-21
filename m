Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A87898856F3
	for <lists+dri-devel@lfdr.de>; Thu, 21 Mar 2024 10:57:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 136E510E11F;
	Thu, 21 Mar 2024 09:57:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="jMWrXyDI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oHLBBNOv";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vc/+K5sR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XzqzLt2/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCD9E10E11F
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Mar 2024 09:57:29 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E9BA45CBE0;
 Thu, 21 Mar 2024 09:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1711015048; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=lWmdLGjpIXLyNdeAWLWGz45cXcEJeKhdr86bgS9ZAg8=;
 b=jMWrXyDIPd/kqHui6rh/uiobomvYGMIONpFBfBt2oBzamqym5TxRZf+vfnY0F7AtOLz/Y0
 QTdodWuCIM5LuTkF4EtLmbJxVvPIb58RZrKC18HZOmxcIRiwLzVrPWteqlPaRObo+vN6Lz
 WiZzNpl+rcrFLW++ibu5EXFl6a8U80Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1711015048;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=lWmdLGjpIXLyNdeAWLWGz45cXcEJeKhdr86bgS9ZAg8=;
 b=oHLBBNOvd6+dDZULaxdb6NrG3uPrmdRJtyaHWAoqWNwAjUL8sq9do2l6oEnKv5cwoXODak
 CuHhU5WY4njBSGBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1711015047; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=lWmdLGjpIXLyNdeAWLWGz45cXcEJeKhdr86bgS9ZAg8=;
 b=vc/+K5sREIrsPn+WN7m7zMLAH57lL+JQg2C+zc/57Li2Q42heY22S7ZgKnuXkdJLWiTFpu
 3FsdjnEYwgaCjxsubh+78M17VbouskiI5PPwUEBMOACJxfUFNbQccf7NVSmgPjYgMyGQtu
 diTaMBlcS8AzMxILtB3q2SZrRJDnYfM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1711015047;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=lWmdLGjpIXLyNdeAWLWGz45cXcEJeKhdr86bgS9ZAg8=;
 b=XzqzLt2/GTDXk11OFwRHMTMjky/vMrKRZFtSGi7kDzZUyb+KajN/RxL0TXwYKLCPhYQxDE
 i2tomx4fWC/ICLCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A734F13976;
 Thu, 21 Mar 2024 09:57:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 8IyeJ4cE/GVDEwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 21 Mar 2024 09:57:27 +0000
Message-ID: <bb4d0bda-1b4a-471f-8e0b-431f116f2331@suse.de>
Date: Thu, 21 Mar 2024 10:57:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v5,13/13] drm/ast: Automatically clean up poll helper
Content-Language: en-US
To: Sui Jingfeng <sui.jingfeng@linux.dev>, airlied@redhat.com,
 jfalempe@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 jani.nikula@linux.intel.com, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
References: <20240320093738.6341-14-tzimmermann@suse.de>
 <0860e0b9-1218-412c-92d3-6999f2983266@linux.dev>
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
In-Reply-To: <0860e0b9-1218-412c-92d3-6999f2983266@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b="vc/+K5sR";
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="XzqzLt2/"
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-8.00 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 XM_UA_NO_VERSION(0.01)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 DWL_DNSWL_HI(-3.50)[suse.de:dkim];
 NEURAL_HAM_LONG(-1.00)[-1.000]; BAYES_HAM(-3.00)[100.00%];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]; MX_GOOD(-0.01)[];
 RCPT_COUNT_SEVEN(0.00)[9];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,linux.dev:email];
 FREEMAIL_TO(0.00)[linux.dev,redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 RCVD_TLS_ALL(0.00)[]; MID_RHS_MATCH_FROM(0.00)[]
X-Spam-Score: -8.00
X-Rspamd-Queue-Id: E9BA45CBE0
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

Am 21.03.24 um 10:00 schrieb Sui Jingfeng:
> Hi,
>
>
> On 2024/3/20 17:34, Thomas Zimmermann wrote:
>> Automatically clean up the conncetor-poll thread as part of the DRM
>> device release. The new helper drmm_kms_helper_poll_init() provides
>> a shared implementation for all drivers.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>
>
> Nice feature!
>
> It seems that drm/loongson forget to calldrm_kms_helper_poll_fini() on 
> driver leave, Opps.

Indeed. I'm surprised that this never blew up with ast. Without _fini(), 
the polling thread would likely run on a stale DRM device. We only 
release the device during shutdown and I guess it doesn't make 
difference then.

Best regards
Thomas

>
>
> Acked-by: Sui Jingfeng <sui.jingfeng@linux.dev>
>
>
>
>> ---
>>   drivers/gpu/drm/ast/ast_mode.c     |  4 +++-
>>   drivers/gpu/drm/drm_probe_helper.c | 27 +++++++++++++++++++++++++++
>>   include/drm/drm_probe_helper.h     |  2 ++
>>   3 files changed, 32 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/ast/ast_mode.c 
>> b/drivers/gpu/drm/ast/ast_mode.c
>> index a42a0956c51de..7e56a77bed635 100644
>> --- a/drivers/gpu/drm/ast/ast_mode.c
>> +++ b/drivers/gpu/drm/ast/ast_mode.c
>> @@ -1905,7 +1905,9 @@ int ast_mode_config_init(struct ast_device *ast)
>>         drm_mode_config_reset(dev);
>>   -    drm_kms_helper_poll_init(dev);
>> +    ret = drmm_kms_helper_poll_init(dev);
>> +    if (ret)
>> +        return ret;
>>         return 0;
>>   }
>> diff --git a/drivers/gpu/drm/drm_probe_helper.c 
>> b/drivers/gpu/drm/drm_probe_helper.c
>> index b06dcc6c614e8..a39c98ceac68a 100644
>> --- a/drivers/gpu/drm/drm_probe_helper.c
>> +++ b/drivers/gpu/drm/drm_probe_helper.c
>> @@ -37,6 +37,7 @@
>>   #include <drm/drm_crtc.h>
>>   #include <drm/drm_edid.h>
>>   #include <drm/drm_fourcc.h>
>> +#include <drm/drm_managed.h>
>>   #include <drm/drm_modeset_helper_vtables.h>
>>   #include <drm/drm_print.h>
>>   #include <drm/drm_probe_helper.h>
>> @@ -944,6 +945,32 @@ void drm_kms_helper_poll_fini(struct drm_device 
>> *dev)
>>   }
>>   EXPORT_SYMBOL(drm_kms_helper_poll_fini);
>>   +static void drm_kms_helper_poll_init_release(struct drm_device 
>> *dev, void *res)
>> +{
>> +    drm_kms_helper_poll_fini(dev);
>> +}
>> +
>> +/**
>> + * devm_drm_kms_helper_poll_init - initialize and enable output polling
>> + * @dev: drm_device
>> + *
>> + * This function initializes and then also enables output polling 
>> support for
>> + * @dev similar to drm_kms_helper_poll_init(). Polling will 
>> automatically be
>> + * cleaned up when the DRM device goes away.
>> + *
>> + * See drm_kms_helper_poll_init() for more information.
>> + *
>> + * Returns:
>> + * 0 on success, or a negative errno code otherwise.
>> + */
>> +int drmm_kms_helper_poll_init(struct drm_device *dev)
>> +{
>> +    drm_kms_helper_poll_init(dev);
>> +
>> +    return drmm_add_action_or_reset(dev, 
>> drm_kms_helper_poll_init_release, dev);
>> +}
>> +EXPORT_SYMBOL(drmm_kms_helper_poll_init);
>> +
>>   static bool check_connector_changed(struct drm_connector *connector)
>>   {
>>       struct drm_device *dev = connector->dev;
>> diff --git a/include/drm/drm_probe_helper.h 
>> b/include/drm/drm_probe_helper.h
>> index 031b044528c89..9925cff749296 100644
>> --- a/include/drm/drm_probe_helper.h
>> +++ b/include/drm/drm_probe_helper.h
>> @@ -16,6 +16,8 @@ int drm_helper_probe_single_connector_modes(struct 
>> drm_connector
>>   int drm_helper_probe_detect(struct drm_connector *connector,
>>                   struct drm_modeset_acquire_ctx *ctx,
>>                   bool force);
>> +
>> +int drmm_kms_helper_poll_init(struct drm_device *dev);
>>   void drm_kms_helper_poll_init(struct drm_device *dev);
>>   void drm_kms_helper_poll_fini(struct drm_device *dev);
>>   bool drm_helper_hpd_irq_event(struct drm_device *dev);
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

