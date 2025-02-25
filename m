Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C57A4456C
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 17:06:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4E5A10E73B;
	Tue, 25 Feb 2025 16:06:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="U91wZWkO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5lKhvvo1";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0PYZTEJE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BPfxal5i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B8DB10E73A
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 16:06:44 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E40311F44F;
 Tue, 25 Feb 2025 16:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1740499598; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=lUpRmJZlbb+C01OZ0rTmq6DqVAVhTj5kdu3hGmrv0Cs=;
 b=U91wZWkORu6uV3NA/6CXnf9DF4uvFXBAn+U4xeX0Eyt62ixdlTNUcCNLmaBl3riXR/zqbs
 VoL9ensUAdi6UuQ7xdLU1pv5Y2WAtLe+0sdp5TDWXDN2OGO1whCvi0lsPUyLJIqEO1dbkr
 Rie2GzJPKMtAvlq+xcOM4biUnd+KCVk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1740499598;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=lUpRmJZlbb+C01OZ0rTmq6DqVAVhTj5kdu3hGmrv0Cs=;
 b=5lKhvvo1aSZ8XsuT2B10kBlUpMFET8B8WQiYsQUW6HVswACAg+hCYu1RR6+HKb3y/gfNU0
 yr+Q3kHrdEeGUHAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1740499597; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=lUpRmJZlbb+C01OZ0rTmq6DqVAVhTj5kdu3hGmrv0Cs=;
 b=0PYZTEJEq31V19+FzGWn7Qk1n6k67UgMsk8CGdvLkmzjP5ffJPAhq1fbhX84giAJPTyYnJ
 sk4DY6hm9yw6k4yAutaWhMbh4GegbF3XrF1G2cRleFFUwBwRvw4EoRm5hH2rvvGj+K2Hc+
 PUocmkln//gfCxN7dopwofEiGxjxxX8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1740499597;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=lUpRmJZlbb+C01OZ0rTmq6DqVAVhTj5kdu3hGmrv0Cs=;
 b=BPfxal5iPapyOjYUnN5Yh+Q1fOTBj3stY4I4BGIAIeNX7Ij0/4PJ4NsxRyU7QYZmiTjtnS
 9yX6w/2/42+FdnAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9507713888;
 Tue, 25 Feb 2025 16:06:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id IQbrIo3qvWdbNwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 25 Feb 2025 16:06:37 +0000
Message-ID: <28e67cc5-6932-48ac-84ef-93af893b2ed9@suse.de>
Date: Tue, 25 Feb 2025 17:06:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] drm/tiny: add driver for Apple Touch Bars in x86
 Macs
To: Aditya Garg <gargaditya08@live.com>
Cc: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch"
 <simona@ffwll.ch>, Kerem Karabay <kekrby@gmail.com>,
 Atharva Tiwari <evepolonium@gmail.com>, Aun-Ali Zaidi <admin@kodeit.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <3457BF95-0E50-4B70-86DE-EE5EE95D3ACE@live.com>
 <4D7C00B4-7B75-4715-8D37-0059B22C030D@live.com>
 <Z72chunE_vvxtjLQ@smile.fi.intel.com>
 <c0249cd8-68e4-4860-b5c3-e054df10ae30@suse.de>
 <PN3PR01MB9597287D0FFDBD11CC1F6167B8C32@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
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
In-Reply-To: <PN3PR01MB9597287D0FFDBD11CC1F6167B8C32@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 ARC_NA(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 MIME_TRACE(0.00)[0:+]; TO_DN_EQ_ADDR_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FREEMAIL_TO(0.00)[live.com];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,live.com];
 RCVD_TLS_ALL(0.00)[]; TO_DN_SOME(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,gmail.com,ffwll.ch,kodeit.net,vger.kernel.org,lists.freedesktop.org];
 RCVD_COUNT_TWO(0.00)[2]; RCPT_COUNT_SEVEN(0.00)[11];
 MID_RHS_MATCH_FROM(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo, bootlin.com:url,
 suse.de:mid]
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

Am 25.02.25 um 15:54 schrieb Aditya Garg:
[...]
>>>> +static int appletbdrm_probe(struct usb_interface *intf,
>>>> +                const struct usb_device_id *id)
>>>> +{
>>>> +    struct usb_endpoint_descriptor *bulk_in, *bulk_out;
>>>> +    struct device *dev = &intf->dev;
>>>> +    struct appletbdrm_device *adev;
>>>> +    struct drm_device *drm;
>>>> +    int ret;
>>>> +
>>>> +    ret = usb_find_common_endpoints(intf->cur_altsetting, &bulk_in, &bulk_out, NULL, NULL);
>>>> +    if (ret) {
>>>> +        drm_err(drm, "Failed to find bulk endpoints\n");
>>> This is simply wrong (and in this case even lead to crash in some circumstances).
>>> drm_err() may not be used here. That's my point in previous discussions.
>>> Independently on the subsystem the ->probe() for the sake of consistency and
>>> being informative should only rely on struct device *dev,
>> That's never going to work with DRM. There's so much code in a DRM probe function that uses the DRM error functions.
>>
>> This specific instance here is wrong, as the drm pointer hasn't been initialized. But as soon as it is, it's much better to use drm_err() and friends. It will do the right thing and give consistent output across drivers.
>>
> Ok so this is actually an interesting case, since I am trying to fix it. To initialise the drm pointer, we need to initialise adev, and to initialise adev, we need to run usb_find_common_endpoints first. So IMO, we cannot use drm_err here, but rather dev_err_probe can be used.

Maybe start reading those compiler warnings. They are there for a 
reason. Your compiler tells you that you are dereferencing an 
uninitialized pointer, right here:

https://elixir.bootlin.com/linux/v6.13.4/source/include/drm/drm_print.h#L586

Clearing that pointer to NULL will fix the error and make drm_err() work.

Best regards
Thomas

>>
>>>> +        return ret;
>>>> +    }
>>>> +
>>>> +    adev = devm_drm_dev_alloc(dev, &appletbdrm_drm_driver, struct appletbdrm_device, drm);
>>>> +    if (IS_ERR(adev))
>>>> +        return PTR_ERR(adev);
>>>> +
>>>> +    adev->in_ep = bulk_in->bEndpointAddress;
>>>> +    adev->out_ep = bulk_out->bEndpointAddress;
>>>> +    adev->dmadev = dev;
>>>> +
>>>> +    drm = &adev->drm;
>>>> +
>>>> +    usb_set_intfdata(intf, adev);
>>>> +
>>>> +    ret = appletbdrm_get_information(adev);
>>>> +    if (ret) {
>>>> +        drm_err(drm, "Failed to get display information\n");
>>>> +        return ret;
>>>> +    }
>>>> +
>>>> +    ret = appletbdrm_signal_readiness(adev);
>>>> +    if (ret) {
>>>> +        drm_err(drm, "Failed to signal readiness\n");
>>>> +        return ret;
>>>> +    }
>>>> +
>>>> +    ret = appletbdrm_setup_mode_config(adev);
>>>> +    if (ret) {
>>>> +        drm_err(drm, "Failed to setup mode config\n");
>>>> +        return ret;
>>>> +    }
>>>> +
>>>> +    ret = drm_dev_register(drm, 0);
>>>> +    if (ret) {
>>>> +        drm_err(drm, "Failed to register DRM device\n");
>>>> +        return ret;
>>>> +    }
>>>> +
>>>> +    ret = appletbdrm_clear_display(adev);
>>>> +    if (ret) {
>>>> +        drm_err(drm, "Failed to clear display\n");
>>>> +        return ret;
>>>> +    }
>>>> +
>>>> +    return 0;
>>>> +}
>> --
>> --
>> Thomas Zimmermann
>> Graphics Driver Developer
>> SUSE Software Solutions Germany GmbH
>> Frankenstrasse 146, 90461 Nuernberg, Germany
>> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
>> HRB 36809 (AG Nuernberg)
>>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

