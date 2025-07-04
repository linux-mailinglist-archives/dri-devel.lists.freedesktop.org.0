Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56607AF8BC7
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 10:33:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB90210E981;
	Fri,  4 Jul 2025 08:33:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="BMu11a/A";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="d0/71qpe";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="feLox8AO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SnWJdn9V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E049510E981
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jul 2025 08:33:34 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 04F4B1F38A;
 Fri,  4 Jul 2025 08:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1751618013; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Oq5M/ptnZLMJczsHINhGjNn6mukAceeD1v2DY+Bk5Ls=;
 b=BMu11a/AGWivWw71Vh18MsvBDxk+lGfeEgJhqVNp4RyDfiOp/+pZczBN0ZeIZy65mrrwLx
 WWeQmbo9EqB6IfSqLxi2+2xDSACVnJneH9vHxZREGfA7D1lFTcX+7xLM2WrqdZsZkfVAk3
 bnqwANqTMN2Dv/h8BmwQ3miWMlN5IK8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1751618013;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Oq5M/ptnZLMJczsHINhGjNn6mukAceeD1v2DY+Bk5Ls=;
 b=d0/71qpeVhbE6nsXHgrC+gqUe8v7qwuupW2jfbINDErsFfBKnvysy/P4hQLjFpfFiSzjRX
 p+MyYmW77GKpu6BA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1751618012; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Oq5M/ptnZLMJczsHINhGjNn6mukAceeD1v2DY+Bk5Ls=;
 b=feLox8AOJ5HAm0ObnToGDdlOW8M8aLOH/KwTwhpBnmmyUm118p6Vcv2UDlnDMMt77udme2
 bNl6zdtAhzoFxzvPn8yLJ4f9gtJe3vO5CBhvHqlzYptzotC+lGAngkWw6k7brgFCATK4Mq
 brP4k9L3hYfMM767Quc8cZ5HTGirG4Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1751618012;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Oq5M/ptnZLMJczsHINhGjNn6mukAceeD1v2DY+Bk5Ls=;
 b=SnWJdn9VAfJA4C5YkPw1E6jfCogXQsDQKEDRNLc3hzCcv4y5Yhb7tYDaOJzyN/hhy+gnQp
 CN1o8NIhe26WwNDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B11AB13A71;
 Fri,  4 Jul 2025 08:33:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 6irqKduRZ2i8FAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 04 Jul 2025 08:33:31 +0000
Message-ID: <a2dad7b6-3798-4f01-a05b-e0cc72bda100@suse.de>
Date: Fri, 4 Jul 2025 10:33:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Warnings in next-20250703 caused by commit 582111e630f5
To: Bert Karwatzki <spasswolf@web.de>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
 Anusha Srivatsa <asrivats@redhat.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org
References: <20250703115915.3096-1-spasswolf@web.de>
 <75abf5c1-aa1a-4405-aae4-a2efccbc3bcb@suse.de>
 <7a56d95dc2b15fa2dac0c8a4dd20f0e253bf414f.camel@web.de>
 <c17428b3-6f04-4eb7-9140-92c7f27eae4f@suse.de>
 <7be4f337df6f882ac53a47db851ae92d7a2d1dc0.camel@web.de>
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
In-Reply-To: <7be4f337df6f882ac53a47db851ae92d7a2d1dc0.camel@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-0.999]; MIME_GOOD(-0.10)[text/plain];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_TRACE(0.00)[0:+]; FREEMAIL_TO(0.00)[web.de];
 RCVD_TLS_ALL(0.00)[]; FREEMAIL_ENVRCPT(0.00)[web.de];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; RCPT_COUNT_SEVEN(0.00)[11];
 MID_RHS_MATCH_FROM(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -4.30
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

Am 04.07.25 um 10:21 schrieb Bert Karwatzki:
> Am Freitag, dem 04.07.2025 um 09:51 +0200 schrieb Thomas Zimmermann:
>> Hi
>>
>> Am 03.07.25 um 19:23 schrieb Bert Karwatzki:
>>> Am Donnerstag, dem 03.07.2025 um 18:09 +0200 schrieb Thomas Zimmermann:
>>>> Hi,
>>>>
>>>> before I give up on the issue, could you please test the attached patch?
>>>>
>>>> Best regards
>>>> Thomas
>>>>
>>>>
>>>> --
>>>> Thomas Zimmermann
>>>> Graphics Driver Developer
>>>> SUSE Software Solutions Germany GmbH
>>>> Frankenstrasse 146, 90461 Nuernberg, Germany
>>>> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
>>>> HRB 36809 (AG Nuernberg)
>>> I applied the patch on top of next-20250703
>>>
>>> $ git log --oneline
>>> 18ee3ed3cb60 (HEAD -> drm_gem_object_handle_put) drm/amdgpu: Provide custom framebuffer destroy function
>>> 8d6c58332c7a (tag: next-20250703, origin/master, origin/HEAD, master) Add linux-next specific files for 20250703
>>>
>>> and it solves the issue for me (i.e. no warnings).
>> Great, thanks for testing. If nothing else, that's the minimal workaround.
>>
>> Here's another patch, which should solve the problem for all drivers.
>> Could you please revert the old fix and apply the new one and test again?
>>
>> Best regards
>> Thomas
>>
>>
>>> Bert Karwatzki
> Applied your patch after reverting:
>
> $ git log --oneline
> f4e557e3ae37 (HEAD -> drm_gem_object_handle_put) drm/framebuffer: Acquire internal references on GEM handles
> 49f9aa27dc15 Revert "drm/amdgpu: Provide custom framebuffer destroy function"
> 18ee3ed3cb60 drm/amdgpu: Provide custom framebuffer destroy function
> 8d6c58332c7a (tag: next-20250703, origin/master, origin/HEAD, master) Add linux-next specific files for 20250703
>
> again everything works without warning.

Thanks again. I'll submit this patch for review then.

Best regards
Thomas

>
> Bert Karwatzki

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

