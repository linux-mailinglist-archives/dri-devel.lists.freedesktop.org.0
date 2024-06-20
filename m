Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC1A90FCD6
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 08:40:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9684510E4BF;
	Thu, 20 Jun 2024 06:40:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="fV6QC1Ce";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0tVsN7dp";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fV6QC1Ce";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0tVsN7dp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47F7E10E4BF
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 06:40:07 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1B7691F795;
 Thu, 20 Jun 2024 06:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1718865605; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=UH1n0fI6xXK4E7uTAmr/28rp7by9nn20YzAJ8qbVhK8=;
 b=fV6QC1CeF7UbqAzubGDeEXlUXsbp+3g/ZnRwSMVdjIohKL1Zn61GeJpurDF+EPNe+H9E2A
 m3mxOX4FATu5l6YzM7/vF2VVfLal3aOvo8iesvgEpoFU9RqlrpkCOEyIc+Bhu2YV7u1nP8
 hysnRxugkJpjx56sj+olLLcFDKkp/XY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1718865605;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=UH1n0fI6xXK4E7uTAmr/28rp7by9nn20YzAJ8qbVhK8=;
 b=0tVsN7dpjh5fnAOd7T/z9I47GkTnatN/vINiWzsWNGjlW4RXmAAw2KO/LTs3/yYzXJJMUs
 qulX5yIirp0UHJDQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1718865605; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=UH1n0fI6xXK4E7uTAmr/28rp7by9nn20YzAJ8qbVhK8=;
 b=fV6QC1CeF7UbqAzubGDeEXlUXsbp+3g/ZnRwSMVdjIohKL1Zn61GeJpurDF+EPNe+H9E2A
 m3mxOX4FATu5l6YzM7/vF2VVfLal3aOvo8iesvgEpoFU9RqlrpkCOEyIc+Bhu2YV7u1nP8
 hysnRxugkJpjx56sj+olLLcFDKkp/XY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1718865605;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=UH1n0fI6xXK4E7uTAmr/28rp7by9nn20YzAJ8qbVhK8=;
 b=0tVsN7dpjh5fnAOd7T/z9I47GkTnatN/vINiWzsWNGjlW4RXmAAw2KO/LTs3/yYzXJJMUs
 qulX5yIirp0UHJDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CCD3F1369F;
 Thu, 20 Jun 2024 06:40:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id Fc0pMMTOc2ZQPwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 20 Jun 2024 06:40:04 +0000
Message-ID: <8cab29df-6490-4a5e-999f-0e734e396303@suse.de>
Date: Thu, 20 Jun 2024 08:40:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: "firmware/sysfb: Set firmware-framebuffer parent device" breaks
 lightdm on Ubuntu 22.04 using amdgpu
To: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Cc: javierm@redhat.com, pjones@redhat.com, deller@gmx.de, ardb@kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>, linux-fbdev@vger.kernel.org,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <CAAxE2A7qK1-b5g1RR-GJ+QTLEr_OxEr9vcZGEOkZY9yLOFLb5w@mail.gmail.com>
 <5f4c828c-8564-4e4e-a418-3250fadb660a@suse.de>
 <CAAxE2A4QBteFPpYgd9N+D+TPdjvHDmtLBf5YsaNw9xB09CtAYQ@mail.gmail.com>
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
In-Reply-To: <CAAxE2A4QBteFPpYgd9N+D+TPdjvHDmtLBf5YsaNw9xB09CtAYQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Score: -4.29
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-4.29 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 XM_UA_NO_VERSION(0.01)[]; TO_DN_SOME(0.00)[];
 FREEMAIL_TO(0.00)[gmail.com]; RCVD_VIA_SMTP_AUTH(0.00)[];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 RCPT_COUNT_SEVEN(0.00)[9];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[redhat.com,gmx.de,kernel.org,lists.freedesktop.org,vger.kernel.org,amd.com];
 MID_RHS_MATCH_FROM(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email]
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

Am 19.06.24 um 20:40 schrieb Marek Olšák:
> Attached is the revert commit that works for me. Tested with Radeon
> 6800 and Radeon 7900XTX.

Thanks. That's the same revert that I did. Let's see if my bisecting 
turns up something.

Best regards
Thomas

>
> Marek
>
>
> Marek
>
> On Wed, Jun 19, 2024 at 9:50 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>> Hi
>>
>> Am 13.06.24 um 07:59 schrieb Marek Olšák:
>>> Hi Thomas,
>>>
>>> Commit 9eac534db0013aff9b9124985dab114600df9081 as per the title
>>> breaks (crashes?) lightdm (login screen) such that all I get is the
>>> terminal. It's also reproducible with tag v6.9 where the commit is
>>> present.
>> I was able to reproduce the problem with Ubutu 22.04 and later under
>> qemu plus qxl, sort of. I login via gdm3 and then the quest machine
>> switches off entirely.
>>
>>> Reverting the commit fixes lightdm. A workaround is to bypass lightdm
>>> by triggering auto-login. This is a bug report.
>> The problem is that reverting the commit doesn't fix the issue for me.
>> I'll try to do my own bisecting.
>>
>> Best regards
>> Thomas
>>
>>> (For AMD folks: It's also reproducible with amd-staging-drm-next.)
>>>
>>> Marek
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

