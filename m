Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 350D4BAF5A7
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 09:06:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7566610E0B7;
	Wed,  1 Oct 2025 07:06:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="nu7oe/ke";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="J5qgauTu";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nu7oe/ke";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="J5qgauTu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7901C10E0B7
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 07:06:28 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D8FF51F7C1;
 Wed,  1 Oct 2025 07:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1759302386; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=v/Sq/hMRs9lW5pGrE1UTXj9Tcba3cKS5UpaXIA2CGaw=;
 b=nu7oe/ke/UQW7tzomiRIBDpJVSSIS3zpUt0I9JJ4WbX8eDnDTC2Juxr2BNk6Ura9ComsdK
 UUEueLdUsA5hcfmFd35geL9bu6h7XKHPyLpuVJxOAxbYvUwcXygVEEYgk2OASZULCrZVla
 Kll0GUPv1s/hEjyRjtQUgw3VPWKKeXk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1759302386;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=v/Sq/hMRs9lW5pGrE1UTXj9Tcba3cKS5UpaXIA2CGaw=;
 b=J5qgauTuXkQAjUzu7wE+ZMCWbynCtBYnLWdKTww0zHLyfHZJUlMB3vs6pxYThkcm6o07Jz
 2Q0lB2eJ4nO4wEBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1759302386; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=v/Sq/hMRs9lW5pGrE1UTXj9Tcba3cKS5UpaXIA2CGaw=;
 b=nu7oe/ke/UQW7tzomiRIBDpJVSSIS3zpUt0I9JJ4WbX8eDnDTC2Juxr2BNk6Ura9ComsdK
 UUEueLdUsA5hcfmFd35geL9bu6h7XKHPyLpuVJxOAxbYvUwcXygVEEYgk2OASZULCrZVla
 Kll0GUPv1s/hEjyRjtQUgw3VPWKKeXk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1759302386;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=v/Sq/hMRs9lW5pGrE1UTXj9Tcba3cKS5UpaXIA2CGaw=;
 b=J5qgauTuXkQAjUzu7wE+ZMCWbynCtBYnLWdKTww0zHLyfHZJUlMB3vs6pxYThkcm6o07Jz
 2Q0lB2eJ4nO4wEBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 877C813ADE;
 Wed,  1 Oct 2025 07:06:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id E/ncH/LS3GghFwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 01 Oct 2025 07:06:26 +0000
Message-ID: <c53b49cd-8e92-4a7e-90fa-b02770baf708@suse.de>
Date: Wed, 1 Oct 2025 09:06:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] drm: Add vblank timers for devices without
 interrupts
To: Michael Kelley <mhklinux@outlook.com>,
 "louis.chauvet@bootlin.com" <louis.chauvet@bootlin.com>,
 "drawat.floss@gmail.com" <drawat.floss@gmail.com>,
 "hamohammed.sa@gmail.com" <hamohammed.sa@gmail.com>,
 "melissa.srw@gmail.com" <melissa.srw@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "airlied@gmail.com"
 <airlied@gmail.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "lyude@redhat.com" <lyude@redhat.com>,
 "javierm@redhat.com" <javierm@redhat.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>
References: <20250904145806.430568-1-tzimmermann@suse.de>
 <SN6PR02MB4157E793515BE2B63615AD92D403A@SN6PR02MB4157.namprd02.prod.outlook.com>
 <BN7PR02MB4148E80C13605F6EAD2B0A03D40FA@BN7PR02MB4148.namprd02.prod.outlook.com>
 <c6ef1912-84b8-4f01-85cc-2fb18f1ad1ed@suse.de>
 <SN6PR02MB41575149CA466B89283B920DD414A@SN6PR02MB4157.namprd02.prod.outlook.com>
 <b2a15b41-7f20-46ac-9f62-d5e48c597760@suse.de>
 <SN6PR02MB415712C780B051175BCD8B32D41AA@SN6PR02MB4157.namprd02.prod.outlook.com>
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
In-Reply-To: <SN6PR02MB415712C780B051175BCD8B32D41AA@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 TAGGED_RCPT(0.00)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 TO_DN_EQ_ADDR_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FREEMAIL_TO(0.00)[outlook.com,bootlin.com,gmail.com,ffwll.ch,linux.intel.com,redhat.com];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,outlook.com];
 RCPT_COUNT_TWELVE(0.00)[13]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 TO_DN_SOME(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80
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

Am 30.09.25 um 17:18 schrieb Michael Kelley:
> From: Thomas Zimmermann <tzimmermann@suse.de> Sent: Tuesday, September 30, 2025 8:04 AM
>> Hi
>>
>> Am 16.09.25 um 17:00 schrieb Michael Kelley:
>>> From: Thomas Zimmermann <tzimmermann@suse.de> Sent: Tuesday, September 16, 2025 1:31 AM
>>>> Hi
>>>>
>>>> Am 09.09.25 um 05:29 schrieb Michael Kelley:
>>>>> From: Michael Kelley Sent: Thursday, September 4, 2025 10:36 PM
>>>>>> From: Thomas Zimmermann <tzimmermann@suse.de> Sent: Thursday, September 4, 2025 7:56 AM
>>>>>>> Compositors often depend on vblanks to limit their display-update
>>>>>>> rate. Without, they see vblank events ASAP, which breaks the rate-
>>>>>>> limit feature. This creates high CPU overhead. It is especially a
>>>>>>> problem with virtual devices with fast framebuffer access.
>>>>>>>
>>>>>>> The series moves vkms' vblank timer to DRM and converts the hyperv
>>>>>>> DRM driver. An earlier version of this series contains examples of
>>>>>>> other updated drivers. In principle, any DRM driver without vblank
>>>>>>> hardware can use the timer.
>>>>>> I've tested this patch set in a Hyper-V guest against the linux-next20250829
>>>>>> kernel. All looks good. Results and perf are the same as reported here [4].
>>>>>> So far I haven't seen the "vblank timer overrun" error, which is consistent
>>>>>> with the changes you made since my earlier testing. I'll keep running this
>>>>>> test kernel for a while to see if anything anomalous occurs.
>>>>> As I continued to run with this patch set, I got a single occurrence of this
>>>>> WARN_ON. I can't associate it with any particular action as I didn't notice
>>>>> it until well after it occurred.
>>>> I've investigated. The stack trace comes from the kernel console's
>>>> display update. It runs concurrently to the vblank timeout. What likely
>>>> happens here is that the update code reads two values and in between,
>>>> the vblank timeout updates them. So the update then compares an old and
>>>> a new value; leading to an incorrect result with triggers the warning.
>>>>
>>>> I'll include a fix in the series' next iteration. But I also think that
>>>> it's not critical. DRM's vblank helpers can usually deal with such problems.
>>> Thanks! I'm giving your v4 series a try now. Good that the underlying
>>> problem is not critical. But I was seeing the WARN_ON() output in
>>> dmesg every few days (a total of 4 times now), and that's not really
>>> acceptable even if everything continues to work correctly.
>> So it's probably a good sign that I haven't heard from you recently. :)
>> If you haven't seen any warnings with v4, I'd like to merge the series soon.
>>
>> Best regards
>> Thomas
>>
> Yes, all is good. I was delayed a bit due to some travel, but the test
> system has been running for a week now with no warnings or other
> issues. From my standpoint, the patch series is good to merge.

That's great news. I've now added the series to our drm-misc-next branch 
and it should reach upstream in v6.19.

Best regards
Thomas

>
> Michael

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


