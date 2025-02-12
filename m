Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 940A1A32365
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 11:20:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B6EB10E83A;
	Wed, 12 Feb 2025 10:20:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="KsK+ceT1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8a0ujCXb";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EcXpRJg3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rh2aZY+y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 642AA10E83A
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 10:20:49 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 33C651FBB6;
 Wed, 12 Feb 2025 10:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1739355648; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=bcKVGME7ObyUBSRZfuesvle2+mZIA4/9UNce77M9CLY=;
 b=KsK+ceT1LVpbxQk1YGgWEaG7ghsJWwYMJvPxWaWRwUU/hUSGpeGStzN0bD6RgLQp0ZmyAZ
 wPXCCffdTG0b6gRwf7jnR+/WCNh6lfiRze1dccTSXAymXKwrsf4v91SGk3MPPUBzqEtNbZ
 lSR8cY9OCKNa+wp+dqaG45FlzAabKAQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1739355648;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=bcKVGME7ObyUBSRZfuesvle2+mZIA4/9UNce77M9CLY=;
 b=8a0ujCXb6+NBJl47aieyDPmYJ2M2q+hlz8KF1mAxgmz/mKs38KCVUxXG3FXATTyId5WoS4
 aWLfDzP9Xur2S1BQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1739355647; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=bcKVGME7ObyUBSRZfuesvle2+mZIA4/9UNce77M9CLY=;
 b=EcXpRJg3CQt2CI/Gds1mT9p/iwZuoinD1EB9w3XmN755eMRgjknd399xCHYTDbUrJa0rcU
 WO1Slw7s32x+FgzHEwaNz+MFPdPjbyfaAhQf64mBydJFxrekIdyFZMRddLaKKesAkmPE1K
 2iCNfrnfS7zL1U9N1eKsJJCkpJGr1+4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1739355647;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=bcKVGME7ObyUBSRZfuesvle2+mZIA4/9UNce77M9CLY=;
 b=rh2aZY+y3skrS0vzhg+AtA3owhmlWZfUDnJorIS3HATUEzcZgP1OZQZRFtuYKswkOxpfmd
 hTAOIHzNtMQcDTCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EB1ED13874;
 Wed, 12 Feb 2025 10:20:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id m04aOP51rGd+VgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 12 Feb 2025 10:20:46 +0000
Message-ID: <c6537153-d03b-4b9b-8fdf-ff437512404e@suse.de>
Date: Wed, 12 Feb 2025 11:20:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] accel/ivpu: Changes for 6.15 2025-02-04
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 maciej.falkowski@linux.intel.com, Simona Vetter <simona@ffwll.ch>,
 Dave Airlie <airlied@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>
References: <20250204084622.2422544-1-jacek.lawrynowicz@linux.intel.com>
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
In-Reply-To: <20250204084622.2422544-1-jacek.lawrynowicz@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-0.998]; MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; TAGGED_RCPT(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 TO_DN_EQ_ADDR_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCPT_COUNT_SEVEN(0.00)[9];
 MID_RHS_MATCH_FROM(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[gmail.com,quicinc.com,linux.intel.com,ffwll.ch,kernel.org]; 
 TO_DN_SOME(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
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

Hi,

here's a complaint about the lack of process and documentation in 
accel/, and ivpu specifically. I came across this series while preparing 
the weekly PR for drm-misc-next and found myself unable to extract much 
useful information to report. This is a problem for a development 
process that relies on transparency, accountability and collaboration. 
Other problematic examples are at [1] and [2]. IIRC I had similar issues 
in previous development cycles.

I cannot assess the quality of the code itself, but the process and 
documentation involved does not meet the requirements.

- 'Changes for <version>' is not an meaningful description for a patch 
series. It's not the submitter (or anyone else) deciding that this 
series gets merged into version so-and-so. The series gets merged when 
it is ready to be merged.

- Apparently this series contains 3 different things (buffer imports, 
locking, debugging); so it should be 3 series with each addressing one 
of these topics.

- The series' description just restates the patch descriptions briefly. 
It should rather give some indication of the problem being solved by the 
contained patches, and context on why this is worth solving. (I know 
that this is often complicated to state clearly to outsiders.)

- Review should be public. I understand that it's often only one dev 
team working on a specific driver, discussing issues internally. Still 
it makes sense to do the code reviews in public, so that others can 
follow what is going on in the driver. Public code reviews are also 
necessary to establish consent and institutional knowledge within the 
wider developer community. You miss that with internal reviews.

- These patches come with R-b tags pre-applied. Even for trivial 
changes, R-b tags should given in public. If the R-bs have been given 
elsewhere, please include a reference to that location. The tags (R-b, 
A-b, T-b, etc) are not just for verifying the code itself. They also 
establish trust in the development process involving each patch; and in 
the developers involved in that process. This needs to happen in public 
to be effective.

- The kernel's (or any FOSS') development is organized around 
individuals, not organizations. Having each developer send their changes 
individually would likely resolve most of the current problems.

I understand that accel is not graphics and can feel somewhat detached 
from the rest of DRM. Yet it is part of the DRM subsystem. This 
development cycles' ivpu series' made me go to IRC and ask for accel/ to 
be removed from the drm-misc tree. Luckily the other maintainer were 
more charitable. So I make these remarks in good faith and hope that we 
can improve the processes within accel/.

Best regards
Thomas

[1] https://patchwork.freedesktop.org/series/143182/
[2] https://patchwork.freedesktop.org/series/144101/


Am 04.02.25 um 09:46 schrieb Jacek Lawrynowicz:
> Add possibility to import single buffer into multiple contexts,
> fix locking when aborting contexts and add some debug features.
>
> Andrzej Kacprowski (2):
>    accel/ivpu: Add missing locks around mmu queues
>    accel/ivpu: Prevent runtime suspend during context abort work
>
> Karol Wachowski (3):
>    ccel/ivpu: Add debugfs interface for setting HWS priority bands
>    accel/ivpu: Add test modes to toggle clock relinquish disable
>    accel/ivpu: Implement D0i2 disable test modea
>
> Tomasz Rusinowicz (1):
>    accel/ivpu: Allow to import single buffer into multiple contexts
>
>   drivers/accel/ivpu/ivpu_debugfs.c | 84 +++++++++++++++++++++++++++++++
>   drivers/accel/ivpu/ivpu_drv.c     |  2 +-
>   drivers/accel/ivpu/ivpu_drv.h     |  4 ++
>   drivers/accel/ivpu/ivpu_fw.c      |  4 ++
>   drivers/accel/ivpu/ivpu_gem.c     | 43 ++++++++++++++++
>   drivers/accel/ivpu/ivpu_gem.h     |  1 +
>   drivers/accel/ivpu/ivpu_hw.c      | 31 ++++++++++++
>   drivers/accel/ivpu/ivpu_hw.h      |  5 ++
>   drivers/accel/ivpu/ivpu_job.c     | 10 +++-
>   drivers/accel/ivpu/ivpu_jsm_msg.c | 29 ++++-------
>   drivers/accel/ivpu/ivpu_mmu.c     |  9 ++++
>   11 files changed, 202 insertions(+), 20 deletions(-)
>
> --
> 2.45.1

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

