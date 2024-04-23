Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDAF88AE76D
	for <lists+dri-devel@lfdr.de>; Tue, 23 Apr 2024 15:08:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19EE410F7CB;
	Tue, 23 Apr 2024 13:07:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="qmKMFT0m";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9nRhQWg3";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qmKMFT0m";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9nRhQWg3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DC9210F7CB
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 13:07:57 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6778F37F9F;
 Tue, 23 Apr 2024 13:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1713877676; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=1Id41yHvdTscUsFAax+DNoLOYykqRWumjAUWJN9I2VY=;
 b=qmKMFT0mlZ5lMemlzm3IMqpOJgMMdFt7iU2esq1/LeqFi9+L+zuwXWN8NLBj3YLBcJcqyp
 NLxQi+wz7v5+y/etBqCdyehMvdlqGLm1/cljwq9XN9lDdXQnztGYvnJ8PTbjMLDZzn5NHb
 tuWwNQHLLnl5BYFeZaUGklviJgswXyc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1713877676;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=1Id41yHvdTscUsFAax+DNoLOYykqRWumjAUWJN9I2VY=;
 b=9nRhQWg3Lddeb3Ejm5yfTgZXrZNOJ8ErCcBzqxhu11oVqyX0ubIOBNgAVW1iCAc1maYNLz
 CM5qwk08G/5TIPAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1713877676; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=1Id41yHvdTscUsFAax+DNoLOYykqRWumjAUWJN9I2VY=;
 b=qmKMFT0mlZ5lMemlzm3IMqpOJgMMdFt7iU2esq1/LeqFi9+L+zuwXWN8NLBj3YLBcJcqyp
 NLxQi+wz7v5+y/etBqCdyehMvdlqGLm1/cljwq9XN9lDdXQnztGYvnJ8PTbjMLDZzn5NHb
 tuWwNQHLLnl5BYFeZaUGklviJgswXyc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1713877676;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=1Id41yHvdTscUsFAax+DNoLOYykqRWumjAUWJN9I2VY=;
 b=9nRhQWg3Lddeb3Ejm5yfTgZXrZNOJ8ErCcBzqxhu11oVqyX0ubIOBNgAVW1iCAc1maYNLz
 CM5qwk08G/5TIPAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 162F013894;
 Tue, 23 Apr 2024 13:07:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 7DhbBKyyJ2btXwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 23 Apr 2024 13:07:56 +0000
Message-ID: <1722c1b6-59a5-429d-905c-bc1951a68a68@suse.de>
Date: Tue, 23 Apr 2024 15:07:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] fbdev: fix incorrect address computation in deferred IO
To: Nam Cao <namcao@linutronix.de>, Jaya Kumar <jayalk@intworks.biz>,
 Daniel Vetter <daniel@ffwll.ch>, Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: tiwai@suse.de, bigeasy@linutronix.de, patrik.r.jakobsson@gmail.com,
 Vegard Nossum <vegard.nossum@oracle.com>,
 George Kennedy <george.kennedy@oracle.com>,
 Darren Kenny <darren.kenny@oracle.com>, chuansheng.liu@intel.com,
 Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
 stable@vger.kernel.org
References: <20240423115053.4490-1-namcao@linutronix.de>
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
In-Reply-To: <20240423115053.4490-1-namcao@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.79 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 XM_UA_NO_VERSION(0.01)[]; RCVD_TLS_ALL(0.00)[]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 TAGGED_RCPT(0.00)[]; RCPT_COUNT_TWELVE(0.00)[17];
 FREEMAIL_TO(0.00)[linutronix.de,intworks.biz,ffwll.ch,gmx.de,redhat.com,vger.kernel.org,lists.freedesktop.org];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]; TO_DN_SOME(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[suse.de,linutronix.de,gmail.com,oracle.com,intel.com,vger.kernel.org];
 MID_RHS_MATCH_FROM(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_COUNT_TWO(0.00)[2];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,
 imap1.dmz-prg2.suse.org:rdns, suse.de:email]
X-Spam-Score: -2.79
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

Am 23.04.24 um 13:50 schrieb Nam Cao:
> With deferred IO enabled, a page fault happens when data is written to the
> framebuffer device. Then driver determines which page is being updated by
> calculating the offset of the written virtual address within the virtual
> memory area, and uses this offset to get the updated page within the
> internal buffer. This page is later copied to hardware (thus the name
> "deferred IO").
>
> This offset calculation is only correct if the virtual memory area is
> mapped to the beginning of the internal buffer. Otherwise this is wrong.
> For example, if users do:
>      mmap(ptr, 4096, PROT_WRITE, MAP_FIXED | MAP_SHARED, fd, 0xff000);
>
> Then the virtual memory area will mapped at offset 0xff000 within the
> internal buffer. This offset 0xff000 is not accounted for, and wrong page
> is updated.
>
> Correct the calculation by using vmf->pgoff instead. With this change, the
> variable "offset" will no longer hold the exact offset value, but it is
> rounded down to multiples of PAGE_SIZE. But this is still correct, because
> this variable is only used to calculate the page offset.
>
> Reported-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
> Closes: https://lore.kernel.org/linux-fbdev/271372d6-e665-4e7f-b088-dee5f4ab341a@oracle.com
> Fixes: 56c134f7f1b5 ("fbdev: Track deferred-I/O pages in pageref struct")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Nam Cao <namcao@linutronix.de>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

Thank you so much. I'll take care of merging the patch later this week.

Best regards
Thomas

> ---
> v2:
>    - simplify the patch by using vfg->pgoff
>    - remove tested-by tag, as the patch is now different
>
>   drivers/video/fbdev/core/fb_defio.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/video/fbdev/core/fb_defio.c b/drivers/video/fbdev/core/fb_defio.c
> index 1ae1d35a5942..b9607d5a370d 100644
> --- a/drivers/video/fbdev/core/fb_defio.c
> +++ b/drivers/video/fbdev/core/fb_defio.c
> @@ -196,7 +196,7 @@ static vm_fault_t fb_deferred_io_track_page(struct fb_info *info, unsigned long
>    */
>   static vm_fault_t fb_deferred_io_page_mkwrite(struct fb_info *info, struct vm_fault *vmf)
>   {
> -	unsigned long offset = vmf->address - vmf->vma->vm_start;
> +	unsigned long offset = vmf->pgoff << PAGE_SHIFT;
>   	struct page *page = vmf->page;
>   
>   	file_update_time(vmf->vma->vm_file);

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

