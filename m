Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF011AD68EE
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 09:25:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04A5010E19E;
	Thu, 12 Jun 2025 07:25:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="qjHdRBmR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CMMSupme";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qjHdRBmR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CMMSupme";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 780FE10E759
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 07:25:08 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 24601211D0;
 Thu, 12 Jun 2025 07:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749713107; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=OIFIbc2scGPWIlpVurAYWkEZOyPLXw9LExgLq86DRAo=;
 b=qjHdRBmRxnhUwh7+X0EdINyLt2jJwiW7NNeIP70Sc2UA4gYS3JXXUMip8oKSnw4d/7oWn8
 XzH1kfo162/VJfQHeR7M2FC7EbUB7Ql5qR8OulMMz1GZo5NlsSedOV7SX5rFX9JtJdbhrE
 wW5HiNl+7pDlgA0PkKxb0saignEoxGw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749713107;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=OIFIbc2scGPWIlpVurAYWkEZOyPLXw9LExgLq86DRAo=;
 b=CMMSupmeFjHp1XgbAgaYoRKEBgHLBhd2BU3lcTyt4IopnW5PW7m/Jvy4t4HPhOg+CicP/s
 Dks+nNZFqumN5CAA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749713107; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=OIFIbc2scGPWIlpVurAYWkEZOyPLXw9LExgLq86DRAo=;
 b=qjHdRBmRxnhUwh7+X0EdINyLt2jJwiW7NNeIP70Sc2UA4gYS3JXXUMip8oKSnw4d/7oWn8
 XzH1kfo162/VJfQHeR7M2FC7EbUB7Ql5qR8OulMMz1GZo5NlsSedOV7SX5rFX9JtJdbhrE
 wW5HiNl+7pDlgA0PkKxb0saignEoxGw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749713107;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=OIFIbc2scGPWIlpVurAYWkEZOyPLXw9LExgLq86DRAo=;
 b=CMMSupmeFjHp1XgbAgaYoRKEBgHLBhd2BU3lcTyt4IopnW5PW7m/Jvy4t4HPhOg+CicP/s
 Dks+nNZFqumN5CAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A8C78139E2;
 Thu, 12 Jun 2025 07:25:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 8gIMKNKASmgYGgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 12 Jun 2025 07:25:06 +0000
Message-ID: <370634b8-b872-4bdb-8514-4f011a4a1a46@suse.de>
Date: Thu, 12 Jun 2025 09:25:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] fbdev/deferred-io: Support contiguous kernel
 memory framebuffers
To: Michael Kelley <mhklinux@outlook.com>,
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: David Hildenbrand <david@redhat.com>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "deller@gmx.de" <deller@gmx.de>,
 "haiyangz@microsoft.com" <haiyangz@microsoft.com>,
 "kys@microsoft.com" <kys@microsoft.com>,
 "wei.liu@kernel.org" <wei.liu@kernel.org>,
 "decui@microsoft.com" <decui@microsoft.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "weh@microsoft.com" <weh@microsoft.com>, "hch@lst.de" <hch@lst.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>
References: <20250523161522.409504-1-mhklinux@outlook.com>
 <20250523161522.409504-4-mhklinux@outlook.com>
 <de0f2cb8-aed6-436f-b55e-d3f7b3fe6d81@redhat.com>
 <SN6PR02MB41573C075152ECD8428CAF5ED46DA@SN6PR02MB4157.namprd02.prod.outlook.com>
 <c0b91a50-d3e7-44f9-b9c5-9c3b29639428@suse.de>
 <SN6PR02MB4157871127ED95AD24EDF96DD46DA@SN6PR02MB4157.namprd02.prod.outlook.com>
 <9a93813c-4d7c-45ef-b5a2-0ad37e7a078a@suse.de>
 <aEBcCjMWZJgbsRas@phenom.ffwll.local>
 <SN6PR02MB415702B00D6D52B0EE962C98D46CA@SN6PR02MB4157.namprd02.prod.outlook.com>
 <154aa365-0e27-458c-b801-62fd1cbfa169@suse.de>
 <SN6PR02MB4157F630284939E084486AFED46FA@SN6PR02MB4157.namprd02.prod.outlook.com>
 <SN6PR02MB41579713B557A32674252865D475A@SN6PR02MB4157.namprd02.prod.outlook.com>
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
In-Reply-To: <SN6PR02MB41579713B557A32674252865D475A@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Flag: NO
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_ENVRCPT(0.00)[gmx.de,outlook.com];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_TO(0.00)[outlook.com,ffwll.ch]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+]; TO_DN_EQ_ADDR_SOME(0.00)[];
 RCPT_COUNT_TWELVE(0.00)[17]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_CC(0.00)[redhat.com,ffwll.ch,gmx.de,microsoft.com,kernel.org,linux-foundation.org,lst.de,lists.freedesktop.org,vger.kernel.org,kvack.org];
 RCVD_TLS_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; RCVD_VIA_SMTP_AUTH(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo, suse.de:mid,
 suse.de:email]
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

Am 12.06.25 um 01:18 schrieb Michael Kelley:
> From: Michael Kelley Sent: Thursday, June 5, 2025 10:39 AM
>> From: Thomas Zimmermann <tzimmermann@suse.de> Sent: Thursday, June 5, 2025
>> 8:36 AM
>>> Hi
>>>
>>> Am 04.06.25 um 23:43 schrieb Michael Kelley:
>>> [...]
>>>> Nonetheless, there's an underlying issue. A main cause of the difference
>>>> is the number of messages to Hyper-V to update dirty regions. With
>>>> hyperv_fb using deferred I/O, the messages are limited 20/second, so
>>>> the total number of messages to Hyper-V is about 480. But hyperv_drm
>>>> appears to send 3 messages to Hyper-V for each line of output, or a total of
>>>> about 3,000,000 messages (~90K/second). That's a lot of additional load
>>>> on the Hyper-V host, and it adds the 10 seconds of additional elapsed
>>>> time seen in the guest. There also this ugly output in dmesg because the
>>>> ring buffer for sending messages to the Hyper-V host gets full -- Hyper-V
>>>> doesn't always keep up, at least not on my local laptop where I'm
>>>> testing:
>>>>
>>>> [12574.327615] hyperv_drm 5620e0c7-8062-4dce-aeb7-520c7ef76171: [drm]
>>> *ERROR* Unable to send packet via vmbus; error -11
>>>> [12574.327684] hyperv_drm 5620e0c7-8062-4dce-aeb7-520c7ef76171: [drm]
>>> *ERROR* Unable to send packet via vmbus; error -11
>>>> [12574.327760] hyperv_drm 5620e0c7-8062-4dce-aeb7-520c7ef76171: [drm]
>>> *ERROR* Unable to send packet via vmbus; error -11
>>>> [12574.327841] hyperv_drm 5620e0c7-8062-4dce-aeb7-520c7ef76171: [drm]
>>> *ERROR* Unable to send packet via vmbus; error -11
>>>> [12597.016128] hyperv_sendpacket: 6211 callbacks suppressed
>>>> [12597.016133] hyperv_drm 5620e0c7-8062-4dce-aeb7-520c7ef76171: [drm]
>>> *ERROR* Unable to send packet via vmbus; error -11
>>>> [12597.016172] hyperv_drm 5620e0c7-8062-4dce-aeb7-520c7ef76171: [drm]
>>> *ERROR* Unable to send packet via vmbus; error -11
>>>> [12597.016220] hyperv_drm 5620e0c7-8062-4dce-aeb7-520c7ef76171: [drm]
>>> *ERROR* Unable to send packet via vmbus; error -11
>>>> [12597.016267] hyperv_drm 5620e0c7-8062-4dce-aeb7-520c7ef76171: [drm]
>>> *ERROR* Unable to send packet via vmbus; error -11
>>>> hyperv_drm could be fixed to not output the ugly messages, but there's
>>>> still the underlying issue of overrunning the ring buffer, and excessively
>>>> hammering on the host. If we could get hyperv_drm doing deferred I/O, I
>>>> would feel much better about going full-on with deprecating hyperv_fb.
>>> I try to address the problem with the patches at
>>>
>>> https://lore.kernel.org/dri-devel/20250605152637.98493-1-
>> tzimmermann@suse.de/
>>> Testing and feedback is much appreciated.
>>>
>> Nice!
>>
>> I ran the same test case with your patches, and everything works well. The
>> hyperv_drm numbers are now pretty much the same as the hyperv_fb
>> numbers for both elapsed time and system CPU time -- within a few percent.
>> For hyperv_drm, there's no longer a gap in the elapsed time and system
>> CPU time. No errors due to the guest-to-host ring buffer being full. Total
>> messages to Hyper-V for hyperv_drm are now a few hundred instead of 3M.
>> The hyperv_drm message count is still a little higher than for hyperv_fb,
>> presumably because the simulated vblank rate in hyperv_drm is higher than
>> the 20 Hz rate used by hyperv_fb deferred I/O. But the overall numbers are
>> small enough that the difference is in the noise. Question: what is the default
>> value for the simulated vblank rate? Just curious ...
>>
> FYI, I'm seeing this message occasionally when running with your simulated
> vblank code and hyperv_drm:
>
> [90920.128278] hyperv_drm 5620e0c7-8062-4dce-aeb7-520c7ef76171: [drm] vblank timer overrun
>
> "Occasionally" is about a dozen occurrences over the last day or so. I can't
> yet correlate to any particular activity in the VM. The graphics console has
> not been very busy.

Thanks for the report. It can happen that the vblank timer is handled 
late. It's not strictly an error as the whole thing is best-effort 
anyway. Maybe the timeout could be adjusted.

Best regards
Thomas

>
> Michael
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

