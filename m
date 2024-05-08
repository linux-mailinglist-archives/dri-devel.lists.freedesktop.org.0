Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 230D98BF5DC
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 08:00:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B83B81133BA;
	Wed,  8 May 2024 06:00:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="oJBUSnqZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LALyyqtM";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="oJBUSnqZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LALyyqtM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E55E1127FA;
 Wed,  8 May 2024 06:00:29 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1710921A3C;
 Wed,  8 May 2024 06:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1715148027; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Is1QIooOcsSsCqTmiQyMmRHwJK9pqSAkls0yrv548qo=;
 b=oJBUSnqZI7EMjfLSBFZJVb44HlHinhbFGw6fI8Dnc2xpkzBYD1XKpxGf4uifFmvRoG61rt
 QVRqUSBQqc6vOTInrJu0yU9OsgNIHL2uesL+75THSxQBwLxd66hkPtvOfRTKTqRCOUmcjB
 nGNVx0QMAAlgqx1J23NlvRc1IK42+CI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1715148027;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Is1QIooOcsSsCqTmiQyMmRHwJK9pqSAkls0yrv548qo=;
 b=LALyyqtMas/4qlYZtcYxHdHGH9G64b4tNDkdXEw/W00Ws0sioAsIy89uQ0NBT0eoGUf4tT
 NYE1i0b7yLQda9AQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1715148027; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Is1QIooOcsSsCqTmiQyMmRHwJK9pqSAkls0yrv548qo=;
 b=oJBUSnqZI7EMjfLSBFZJVb44HlHinhbFGw6fI8Dnc2xpkzBYD1XKpxGf4uifFmvRoG61rt
 QVRqUSBQqc6vOTInrJu0yU9OsgNIHL2uesL+75THSxQBwLxd66hkPtvOfRTKTqRCOUmcjB
 nGNVx0QMAAlgqx1J23NlvRc1IK42+CI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1715148027;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Is1QIooOcsSsCqTmiQyMmRHwJK9pqSAkls0yrv548qo=;
 b=LALyyqtMas/4qlYZtcYxHdHGH9G64b4tNDkdXEw/W00Ws0sioAsIy89uQ0NBT0eoGUf4tT
 NYE1i0b7yLQda9AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C879F1386E;
 Wed,  8 May 2024 06:00:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id abWuL/kUO2bdVQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 08 May 2024 06:00:25 +0000
Message-ID: <2b464f50-15e0-4df3-a846-21417a103ed6@suse.de>
Date: Wed, 8 May 2024 08:00:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/11] drm/tegra: Use fbdev client helpers
To: Felix Kuehling <felix.kuehling@amd.com>, javierm@redhat.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 inki.dae@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com,
 linux@armlinux.org.uk, krzk@kernel.org, alim.akhtar@samsung.com,
 patrik.r.jakobsson@gmail.com, jani.nikula@linux.intel.com,
 rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net, robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run, marijn.suijten@somainline.org,
 tomi.valkeinen@ideasonboard.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, thierry.reding@gmail.com,
 mperttunen@nvidia.com, jonathanh@nvidia.com
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20240507120422.25492-1-tzimmermann@suse.de>
 <20240507120422.25492-12-tzimmermann@suse.de>
 <b463d432-669c-43a4-933a-cafef000f7da@amd.com>
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
In-Reply-To: <b463d432-669c-43a4-933a-cafef000f7da@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.79
X-Spam-Level: 
X-Spamd-Result: default: False [-2.79 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 XM_UA_NO_VERSION(0.01)[]; TAGGED_RCPT(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+];
 FREEMAIL_TO(0.00)[amd.com,redhat.com,ffwll.ch,linux.intel.com,kernel.org,samsung.com,armlinux.org.uk,gmail.com,intel.com,ursulin.net,quicinc.com,linaro.org,poorly.run,somainline.org,ideasonboard.com,nvidia.com];
 RCPT_COUNT_TWELVE(0.00)[31]; MID_RHS_MATCH_FROM(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,
 imap1.dmz-prg2.suse.org:rdns, suse.de:email]
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

Am 07.05.24 um 23:03 schrieb Felix Kuehling:
>
> On 2024-05-07 07:58, Thomas Zimmermann wrote:
>> Implement struct drm_client_funcs with the respective helpers and
>> remove the custom code from the emulation. The generic helpers are
>> equivalent in functionality.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>   drivers/gpu/drm/radeon/radeon_fbdev.c | 66 ++-------------------------
>
> Was radeon meant to be a separate patch?

Indeed. It also _was_ a separate patch. This looks like a mistake during 
rebasing. Thanks for noticing. I'll fix that in v2.

Best regards
Thomas

>
> Regards,
>   Felix
>
>
>>   drivers/gpu/drm/tegra/fbdev.c         | 58 ++---------------------
>>   2 files changed, 6 insertions(+), 118 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/radeon/radeon_fbdev.c 
>> b/drivers/gpu/drm/radeon/radeon_fbdev.c
>> index 02bf25759059a..cf790922174ea 100644
>> --- a/drivers/gpu/drm/radeon/radeon_fbdev.c
>> +++ b/drivers/gpu/drm/radeon/radeon_fbdev.c
>> @@ -29,7 +29,6 @@
>>   #include <linux/pm_runtime.h>
>>   #include <linux/vga_switcheroo.h>
>>   -#include <drm/drm_crtc_helper.h>
>>   #include <drm/drm_drv.h>
>>   #include <drm/drm_fb_helper.h>
>>   #include <drm/drm_fourcc.h>
>> @@ -293,71 +292,12 @@ static const struct drm_fb_helper_funcs 
>> radeon_fbdev_fb_helper_funcs = {
>>   };
>>     /*
>> - * Fbdev client and struct drm_client_funcs
>> + * struct drm_client_funcs
>>    */
>>   -static void radeon_fbdev_client_unregister(struct drm_client_dev 
>> *client)
>> -{
>> -    struct drm_fb_helper *fb_helper = 
>> drm_fb_helper_from_client(client);
>> -    struct drm_device *dev = fb_helper->dev;
>> -    struct radeon_device *rdev = dev->dev_private;
>> -
>> -    if (fb_helper->info) {
>> -        vga_switcheroo_client_fb_set(rdev->pdev, NULL);
>> -        drm_helper_force_disable_all(dev);
>> -        drm_fb_helper_unregister_info(fb_helper);
>> -    } else {
>> -        drm_client_release(&fb_helper->client);
>> -        drm_fb_helper_unprepare(fb_helper);
>> -        kfree(fb_helper);
>> -    }
>> -}
>> -
>> -static int radeon_fbdev_client_restore(struct drm_client_dev *client)
>> -{
>> -    drm_fb_helper_lastclose(client->dev);
>> -    vga_switcheroo_process_delayed_switch();
>> -
>> -    return 0;
>> -}
>> -
>> -static int radeon_fbdev_client_hotplug(struct drm_client_dev *client)
>> -{
>> -    struct drm_fb_helper *fb_helper = 
>> drm_fb_helper_from_client(client);
>> -    struct drm_device *dev = client->dev;
>> -    struct radeon_device *rdev = dev->dev_private;
>> -    int ret;
>> -
>> -    if (dev->fb_helper)
>> -        return drm_fb_helper_hotplug_event(dev->fb_helper);
>> -
>> -    ret = drm_fb_helper_init(dev, fb_helper);
>> -    if (ret)
>> -        goto err_drm_err;
>> -
>> -    if (!drm_drv_uses_atomic_modeset(dev))
>> -        drm_helper_disable_unused_functions(dev);
>> -
>> -    ret = drm_fb_helper_initial_config(fb_helper);
>> -    if (ret)
>> -        goto err_drm_fb_helper_fini;
>> -
>> -    vga_switcheroo_client_fb_set(rdev->pdev, fb_helper->info);
>> -
>> -    return 0;
>> -
>> -err_drm_fb_helper_fini:
>> -    drm_fb_helper_fini(fb_helper);
>> -err_drm_err:
>> -    drm_err(dev, "Failed to setup radeon fbdev emulation 
>> (ret=%d)\n", ret);
>> -    return ret;
>> -}
>> -
>>   static const struct drm_client_funcs radeon_fbdev_client_funcs = {
>> -    .owner        = THIS_MODULE,
>> -    .unregister    = radeon_fbdev_client_unregister,
>> -    .restore    = radeon_fbdev_client_restore,
>> -    .hotplug    = radeon_fbdev_client_hotplug,
>> +    .owner = THIS_MODULE,
>> +    DRM_FBDEV_HELPER_CLIENT_FUNCS,
>>   };
>>     void radeon_fbdev_setup(struct radeon_device *rdev)
>> diff --git a/drivers/gpu/drm/tegra/fbdev.c 
>> b/drivers/gpu/drm/tegra/fbdev.c
>> index db6eaac3d30e6..f9cc365cfed94 100644
>> --- a/drivers/gpu/drm/tegra/fbdev.c
>> +++ b/drivers/gpu/drm/tegra/fbdev.c
>> @@ -12,7 +12,6 @@
>>   #include <linux/vmalloc.h>
>>     #include <drm/drm_drv.h>
>> -#include <drm/drm_crtc_helper.h>
>>   #include <drm/drm_fb_helper.h>
>>   #include <drm/drm_fourcc.h>
>>   #include <drm/drm_framebuffer.h>
>> @@ -150,63 +149,12 @@ static const struct drm_fb_helper_funcs 
>> tegra_fb_helper_funcs = {
>>   };
>>     /*
>> - * struct drm_client
>> + * struct drm_client_funcs
>>    */
>>   -static void tegra_fbdev_client_unregister(struct drm_client_dev 
>> *client)
>> -{
>> -    struct drm_fb_helper *fb_helper = 
>> drm_fb_helper_from_client(client);
>> -
>> -    if (fb_helper->info) {
>> -        drm_fb_helper_unregister_info(fb_helper);
>> -    } else {
>> -        drm_client_release(&fb_helper->client);
>> -        drm_fb_helper_unprepare(fb_helper);
>> -        kfree(fb_helper);
>> -    }
>> -}
>> -
>> -static int tegra_fbdev_client_restore(struct drm_client_dev *client)
>> -{
>> -    drm_fb_helper_lastclose(client->dev);
>> -
>> -    return 0;
>> -}
>> -
>> -static int tegra_fbdev_client_hotplug(struct drm_client_dev *client)
>> -{
>> -    struct drm_fb_helper *fb_helper = 
>> drm_fb_helper_from_client(client);
>> -    struct drm_device *dev = client->dev;
>> -    int ret;
>> -
>> -    if (dev->fb_helper)
>> -        return drm_fb_helper_hotplug_event(dev->fb_helper);
>> -
>> -    ret = drm_fb_helper_init(dev, fb_helper);
>> -    if (ret)
>> -        goto err_drm_err;
>> -
>> -    if (!drm_drv_uses_atomic_modeset(dev))
>> -        drm_helper_disable_unused_functions(dev);
>> -
>> -    ret = drm_fb_helper_initial_config(fb_helper);
>> -    if (ret)
>> -        goto err_drm_fb_helper_fini;
>> -
>> -    return 0;
>> -
>> -err_drm_fb_helper_fini:
>> -    drm_fb_helper_fini(fb_helper);
>> -err_drm_err:
>> -    drm_err(dev, "Failed to setup fbdev emulation (ret=%d)\n", ret);
>> -    return ret;
>> -}
>> -
>>   static const struct drm_client_funcs tegra_fbdev_client_funcs = {
>> -    .owner        = THIS_MODULE,
>> -    .unregister    = tegra_fbdev_client_unregister,
>> -    .restore    = tegra_fbdev_client_restore,
>> -    .hotplug    = tegra_fbdev_client_hotplug,
>> +    .owner = THIS_MODULE,
>> +    DRM_FBDEV_HELPER_CLIENT_FUNCS,
>>   };
>>     void tegra_fbdev_setup(struct drm_device *dev)

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

