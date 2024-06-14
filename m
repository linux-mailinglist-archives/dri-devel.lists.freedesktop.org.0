Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CED908D2A
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 16:17:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8974210ED64;
	Fri, 14 Jun 2024 14:17:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Z0RXPnLx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DhZirnX0";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Z0RXPnLx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DhZirnX0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9BF610ED4A;
 Fri, 14 Jun 2024 14:17:18 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BA30D338B4;
 Fri, 14 Jun 2024 14:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1718374636; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=nCJL1DevtGYJiI4t27twmBQhRm4pTinxyOUt2bmRg6M=;
 b=Z0RXPnLx55pqALECqbzvnXzuaIVny/BSbx4XVZu2Q6zTR86TzQnt0saZp/Im2EWx4AMlhM
 /w3ID+xl98i2l8DbJ75AgBNIkUashexu84++vVB0gyI6kvutDDryJt8wsG4HCsXKlRZVyv
 qoX+yI0uADz7scY718owAgUAVPVmJfE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1718374636;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=nCJL1DevtGYJiI4t27twmBQhRm4pTinxyOUt2bmRg6M=;
 b=DhZirnX0l6BhPw/o0U/Ih5BQmae2BBhMs/Xl0EWcfE9GqnTQ0eG/GCzdmBYPQbEwbvOJk1
 +Pxshs+r2kHiNXDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1718374636; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=nCJL1DevtGYJiI4t27twmBQhRm4pTinxyOUt2bmRg6M=;
 b=Z0RXPnLx55pqALECqbzvnXzuaIVny/BSbx4XVZu2Q6zTR86TzQnt0saZp/Im2EWx4AMlhM
 /w3ID+xl98i2l8DbJ75AgBNIkUashexu84++vVB0gyI6kvutDDryJt8wsG4HCsXKlRZVyv
 qoX+yI0uADz7scY718owAgUAVPVmJfE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1718374636;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=nCJL1DevtGYJiI4t27twmBQhRm4pTinxyOUt2bmRg6M=;
 b=DhZirnX0l6BhPw/o0U/Ih5BQmae2BBhMs/Xl0EWcfE9GqnTQ0eG/GCzdmBYPQbEwbvOJk1
 +Pxshs+r2kHiNXDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7399B13AAF;
 Fri, 14 Jun 2024 14:17:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id xfHaGuxQbGbZTAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 14 Jun 2024 14:17:16 +0000
Message-ID: <ec2b6450-2176-494c-a061-b21a08d657a2@suse.de>
Date: Fri, 14 Jun 2024 16:17:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/fb-helper: Detect when lid is closed during
 initialization
To: Mario Limonciello <mario.limonciello@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, amd-gfx@lists.freedesktop.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Chris Bainbridge <chris.bainbridge@gmail.com>
References: <20240613051700.1112-1-mario.limonciello@amd.com>
 <f5485db8-9e1d-4b95-a0ec-25ee8551795d@suse.de>
 <df7dc942-4e65-4e3a-8b10-6f4f0d1ef602@amd.com>
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
In-Reply-To: <df7dc942-4e65-4e3a-8b10-6f4f0d1ef602@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.79 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 XM_UA_NO_VERSION(0.01)[]; RCVD_TLS_ALL(0.00)[];
 TAGGED_RCPT(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 ARC_NA(0.00)[]; RCPT_COUNT_SEVEN(0.00)[10];
 MIME_TRACE(0.00)[0:+]; MID_RHS_MATCH_FROM(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
 TO_DN_SOME(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo, amd.com:email,
 gitlab.freedesktop.org:url]
X-Spam-Flag: NO
X-Spam-Score: -2.79
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

Am 14.06.24 um 15:47 schrieb Mario Limonciello:
> On 6/14/2024 03:15, Thomas Zimmermann wrote:
>> Hi Mario
>>
>> Am 13.06.24 um 07:17 schrieb Mario Limonciello:
>>> If the lid on a laptop is closed when eDP connectors are populated
>>> then it remains enabled when the initial framebuffer configuration
>>> is built.
>>>
>>> When creating the initial framebuffer configuration detect the
>>> lid status and if it's closed disable any eDP connectors.
>>>
>>> Also set up a workqueue to monitor for any future lid events.
>>
>> After reading through this patchset, I think fbdev emulation is not 
>> the right place for this code, as lid state is global.
>>
>> You could put this into drm_client_modeset.c and track lid state per 
>> client. drm_fb_helper_lid_work() would call the client's hotplug 
>> callback. But preferable, lid state should be tracked per DRM device 
>> in struct drm_mode_config and call drm_client_dev_hotplug() on each 
>> lid-state event. Thoughts? Best regards Thomas
>
> This is pretty similar to what I first did when moving from ACPI over 
> to generic input switch.
>
> It works for the initial configuration.  But I don't believe it makes 
> sense for the lid switch events because not all DRM clients will 
> "want" to respond to the lid switch events.  By leaving it up to the 
> client for everything except fbdev emulation they can also track the 
> lid switch and decide the policy.


All our current clients do fbdev emulation, possibly others would be the 
panic screen and a boot-up logo. A panic screen doesn't do actual mode 
setting, but any other client would most likely want enable and disable 
the display depending on the lid state. Having this code in the DRM 
client helpers make perfect sense. But as it's global state, it makes no 
sense to set this up per client. Hence the suggestion to manage this in 
per DRM device.

It would also make sense to try to integrate this into the probe 
helpers. When the lid state changes, the probe helpers would invoke the 
driver's regular hotplugging code.


>
> I also worry about what happens if the kernel does a hotplug callback 
> on lid events as well at the client choosing to do it. Don't we end up 
> with two modesets?  So then I would think you need a handshake of some 
> sort to decide whether to do it for a given client where fbdev 
> emulation would opt in and then all other clients can choose to opt in 
> or not.


What do you mean by the kernel does a hotplug event and the client does 
one? There should really only be one place to handle all of this. If we 
end up with two modesets, we'd get an additional flicker when the lid 
gets opened.


Best regards
Thomas

>
>>>
>>> Suggested-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>>> Reported-by: Chris Bainbridge <chris.bainbridge@gmail.com>
>>> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3349
>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>>> ---
>>> v2->v3:
>>>   * Use input device instead of ACPI device
>>>   * Detect lid open/close events
>>> ---
>>>   drivers/gpu/drm/drm_client_modeset.c |  29 ++++++
>>>   drivers/gpu/drm/drm_fb_helper.c      | 132 
>>> +++++++++++++++++++++++++++
>>>   include/drm/drm_device.h             |   6 ++
>>>   include/drm/drm_fb_helper.h          |   2 +
>>>   4 files changed, 169 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/drm_client_modeset.c 
>>> b/drivers/gpu/drm/drm_client_modeset.c
>>> index 31af5cf37a09..b8adfe87334b 100644
>>> --- a/drivers/gpu/drm/drm_client_modeset.c
>>> +++ b/drivers/gpu/drm/drm_client_modeset.c
>>> @@ -257,6 +257,34 @@ static void 
>>> drm_client_connectors_enabled(struct drm_connector **connectors,
>>>           enabled[i] = drm_connector_enabled(connectors[i], false);
>>>   }
>>> +static void drm_client_match_edp_lid(struct drm_device *dev,
>>> +                     struct drm_connector **connectors,
>>> +                     unsigned int connector_count,
>>> +                     bool *enabled)
>>> +{
>>> +    int i;
>>> +
>>> +    for (i = 0; i < connector_count; i++) {
>>> +        struct drm_connector *connector = connectors[i];
>>> +
>>> +        switch (connector->connector_type) {
>>> +        case DRM_MODE_CONNECTOR_LVDS:
>>> +        case DRM_MODE_CONNECTOR_eDP:
>>> +            if (!enabled[i])
>>> +                continue;
>>> +            break;
>>> +        default:
>>> +            continue;
>>> +        }
>>> +
>>> +        if (dev->lid_closed) {
>>> +            drm_dbg_kms(dev, "[CONNECTOR:%d:%s] lid is closed, 
>>> disabling\n",
>>> +                    connector->base.id, connector->name);
>>> +            enabled[i] = false;
>>> +        }
>>> +    }
>>> +}
>>> +
>>>   static bool drm_client_target_cloned(struct drm_device *dev,
>>>                        struct drm_connector **connectors,
>>>                        unsigned int connector_count,
>>> @@ -844,6 +872,7 @@ int drm_client_modeset_probe(struct 
>>> drm_client_dev *client, unsigned int width,
>>>           memset(crtcs, 0, connector_count * sizeof(*crtcs));
>>>           memset(offsets, 0, connector_count * sizeof(*offsets));
>>> +        drm_client_match_edp_lid(dev, connectors, connector_count, 
>>> enabled);
>>>           if (!drm_client_target_cloned(dev, connectors, 
>>> connector_count, modes,
>>>                             offsets, enabled, width, height) &&
>>>               !drm_client_target_preferred(dev, connectors, 
>>> connector_count, modes,
>>> diff --git a/drivers/gpu/drm/drm_fb_helper.c 
>>> b/drivers/gpu/drm/drm_fb_helper.c
>>> index d612133e2cf7..41dd5887599a 100644
>>> --- a/drivers/gpu/drm/drm_fb_helper.c
>>> +++ b/drivers/gpu/drm/drm_fb_helper.c
>>> @@ -30,6 +30,8 @@
>>>   #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>>>   #include <linux/console.h>
>>> +#include <linux/input.h>
>>> +#include <linux/mod_devicetable.h>
>>>   #include <linux/pci.h>
>>>   #include <linux/sysrq.h>
>>>   #include <linux/vga_switcheroo.h>
>>> @@ -413,6 +415,128 @@ static void drm_fb_helper_damage_work(struct 
>>> work_struct *work)
>>>       drm_fb_helper_fb_dirty(helper);
>>>   }
>>> +static void drm_fb_helper_lid_event(struct input_handle *handle, 
>>> unsigned int type,
>>> +                    unsigned int code, int value)
>>> +{
>>> +    if (type == EV_SW && code == SW_LID) {
>>> +        struct drm_fb_helper *fb_helper = handle->handler->private;
>>> +
>>> +        if (value != fb_helper->dev->lid_closed) {
>>> +            fb_helper->dev->lid_closed = value;
>>> +            queue_work(fb_helper->input_wq, &fb_helper->lid_work);
>>> +        }
>>> +    }
>>> +}
>>> +
>>> +struct drm_fb_lid {
>>> +    struct input_handle handle;
>>> +};
>>> +
>>> +static int drm_fb_helper_lid_connect(struct input_handler *handler,
>>> +                     struct input_dev *dev,
>>> +                     const struct input_device_id *id)
>>> +{
>>> +    struct drm_fb_helper *fb_helper = handler->private;
>>> +    struct drm_fb_lid *lid;
>>> +    char *name;
>>> +    int error;
>>> +
>>> +    lid = kzalloc(sizeof(*lid), GFP_KERNEL);
>>> +    if (!lid)
>>> +        return -ENOMEM;
>>> +
>>> +    name = kasprintf(GFP_KERNEL, "drm-fb-helper-lid-%s", 
>>> dev_name(&dev->dev));
>>> +    if (!name) {
>>> +        error = -ENOMEM;
>>> +        goto err_free_lid;
>>> +    }
>>> +
>>> +    lid->handle.dev = dev;
>>> +    lid->handle.handler = handler;
>>> +    lid->handle.name = name;
>>> +    lid->handle.private = lid;
>>> +
>>> +    error = input_register_handle(&lid->handle);
>>> +    if (error)
>>> +        goto err_free_name;
>>> +
>>> +    error = input_open_device(&lid->handle);
>>> +    if (error)
>>> +        goto err_unregister_handle;
>>> +
>>> +    fb_helper->dev->lid_closed = dev->sw[SW_LID];
>>> +    drm_dbg_kms(fb_helper->dev, "initial lid state is set to %d\n", 
>>> fb_helper->dev->lid_closed);
>>> +
>>> +    return 0;
>>> +
>>> +err_unregister_handle:
>>> +    input_unregister_handle(&lid->handle);
>>> +err_free_name:
>>> +    kfree(name);
>>> +err_free_lid:
>>> +    kfree(lid);
>>> +    return error;
>>> +}
>>> +
>>> +static void drm_fb_helper_lid_disconnect(struct input_handle *handle)
>>> +{
>>> +    struct drm_fb_lid *lid = handle->private;
>>> +
>>> +    input_close_device(handle);
>>> +    input_unregister_handle(handle);
>>> +
>>> +    kfree(handle->name);
>>> +    kfree(lid);
>>> +}
>>> +
>>> +static const struct input_device_id drm_fb_helper_lid_ids[] = {
>>> +    {
>>> +        .flags = INPUT_DEVICE_ID_MATCH_EVBIT | 
>>> INPUT_DEVICE_ID_MATCH_SWBIT,
>>> +        .evbit = { BIT_MASK(EV_SW) },
>>> +        .swbit = { [BIT_WORD(SW_LID)] = BIT_MASK(SW_LID) },
>>> +    },
>>> +    { },
>>> +};
>>> +
>>> +static struct input_handler drm_fb_helper_lid_handler = {
>>> +    .event =    drm_fb_helper_lid_event,
>>> +    .connect =    drm_fb_helper_lid_connect,
>>> +    .disconnect =    drm_fb_helper_lid_disconnect,
>>> +    .name =        "drm-fb-helper-lid",
>>> +    .id_table =    drm_fb_helper_lid_ids,
>>> +};
>>> +
>>> +static void drm_fb_helper_lid_work(struct work_struct *work)
>>> +{
>>> +    struct drm_fb_helper *fb_helper = container_of(work, struct 
>>> drm_fb_helper,
>>> +                               lid_work);
>>> +    drm_fb_helper_hotplug_event(fb_helper);
>>> +}
>>> +
>>> +static int drm_fb_helper_create_lid_handler(struct drm_fb_helper 
>>> *fb_helper)
>>> +{
>>> +    int ret = 0;
>>> +
>>> +    if (fb_helper->deferred_setup)
>>> +        return 0;
>>> +
>>> +    fb_helper->input_wq = create_singlethread_workqueue("drm-fb-lid");
>>> +    if (fb_helper->input_wq == NULL)
>>> +        return -ENOMEM;
>>> +
>>> +    drm_fb_helper_lid_handler.private = fb_helper;
>>> +    ret = input_register_handler(&drm_fb_helper_lid_handler);
>>> +    if (ret)
>>> +        goto remove_wq;
>>> +
>>> +    return 0;
>>> +
>>> +remove_wq:
>>> +    destroy_workqueue(fb_helper->input_wq);
>>> +    fb_helper->input_wq = NULL;
>>> +    return ret;
>>> +}
>>> +
>>>   /**
>>>    * drm_fb_helper_prepare - setup a drm_fb_helper structure
>>>    * @dev: DRM device
>>> @@ -445,6 +569,7 @@ void drm_fb_helper_prepare(struct drm_device 
>>> *dev, struct drm_fb_helper *helper,
>>>       spin_lock_init(&helper->damage_lock);
>>>       INIT_WORK(&helper->resume_work, drm_fb_helper_resume_worker);
>>>       INIT_WORK(&helper->damage_work, drm_fb_helper_damage_work);
>>> +    INIT_WORK(&helper->lid_work, drm_fb_helper_lid_work);
>>>       helper->damage_clip.x1 = helper->damage_clip.y1 = ~0;
>>>       mutex_init(&helper->lock);
>>>       helper->funcs = funcs;
>>> @@ -593,6 +718,9 @@ void drm_fb_helper_fini(struct drm_fb_helper 
>>> *fb_helper)
>>>       if (!drm_fbdev_emulation)
>>>           return;
>>> +    input_unregister_handler(&drm_fb_helper_lid_handler);
>>> +    destroy_workqueue(fb_helper->input_wq);
>>> +
>>>       cancel_work_sync(&fb_helper->resume_work);
>>>       cancel_work_sync(&fb_helper->damage_work);
>>> @@ -1842,6 +1970,10 @@ 
>>> __drm_fb_helper_initial_config_and_unlock(struct drm_fb_helper 
>>> *fb_helper)
>>>       width = dev->mode_config.max_width;
>>>       height = dev->mode_config.max_height;
>>> +    ret = drm_fb_helper_create_lid_handler(fb_helper);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>>       drm_client_modeset_probe(&fb_helper->client, width, height);
>>>       ret = drm_fb_helper_single_fb_probe(fb_helper);
>>>       if (ret < 0) {
>>> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
>>> index 63767cf24371..619af597784c 100644
>>> --- a/include/drm/drm_device.h
>>> +++ b/include/drm/drm_device.h
>>> @@ -316,6 +316,12 @@ struct drm_device {
>>>        * Root directory for debugfs files.
>>>        */
>>>       struct dentry *debugfs_root;
>>> +
>>> +    /**
>>> +     * @lid_closed: Flag to tell the lid switch state
>>> +     */
>>> +    bool lid_closed;
>>> +
>>>   };
>>>   #endif
>>> diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
>>> index 375737fd6c36..7fb36c10299d 100644
>>> --- a/include/drm/drm_fb_helper.h
>>> +++ b/include/drm/drm_fb_helper.h
>>> @@ -143,6 +143,8 @@ struct drm_fb_helper {
>>>       spinlock_t damage_lock;
>>>       struct work_struct damage_work;
>>>       struct work_struct resume_work;
>>> +    struct work_struct lid_work;
>>> +    struct workqueue_struct *input_wq;
>>>       /**
>>>        * @lock:
>>
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

