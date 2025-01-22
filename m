Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D82A18CD1
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2025 08:37:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 531E610E673;
	Wed, 22 Jan 2025 07:37:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="qIkLkWyi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="I0k/gsSb";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gk11kqyV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BPExbGLR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E45B10E673
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2025 07:37:55 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 553E71F7BA;
 Wed, 22 Jan 2025 07:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1737531473; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=1QTwX8vjDNCGGyLUtw1U+8vX8MhnV7EpcqHPEvWgfMU=;
 b=qIkLkWyixGQHk4I6Fc6mt+HL8s2mH7sBJB9GGM5ZRDW0xFqYnK+1qPgV4USZbvCRQ3t4bi
 Gdn7xq9DhW7PtkFJH/7KFTEV5Dl52j0lIRWRnYo04lmrMZPysMfNxZeSssiAKrU8s/yH7M
 ZqPihT1twiDv/dXRAL2WF151+TGUSag=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1737531473;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=1QTwX8vjDNCGGyLUtw1U+8vX8MhnV7EpcqHPEvWgfMU=;
 b=I0k/gsSbOTeoUih0yBnwrPWtF0JlZolhDKmrW/GZx060FZiIm8L/9M8Q4QaEdosuWQ75Qr
 4TwGR0Fw27Gm6/Dg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1737531472; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=1QTwX8vjDNCGGyLUtw1U+8vX8MhnV7EpcqHPEvWgfMU=;
 b=gk11kqyVu9J1YMGjdqiFRmuFCD09PI1JgkwIsPg6ZKyL5a5QaajlXa+zLnrs1SNdC/5rI8
 9tNTZV+c31kpR/tTQH7tNtuX9UvzX0oEdfZ9OufMN3TwWEw+yx6HDMqAUsA9Q1LKGLt5Zm
 t9oAyP6JN3VYIqUhQ2gUqN5HP2Gof9I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1737531472;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=1QTwX8vjDNCGGyLUtw1U+8vX8MhnV7EpcqHPEvWgfMU=;
 b=BPExbGLRGbY8EyqerfbktMutStPTSPP/JKy0/H42hHI2MogFtNGcZhzBFuX4bYivK5uoGr
 JXClMhHHp3svGwDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 01ACC1397D;
 Wed, 22 Jan 2025 07:37:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id cpAIOk+gkGePSQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 22 Jan 2025 07:37:51 +0000
Message-ID: <9dadd98a-7c3c-4e2c-8332-fd0f5a96b670@suse.de>
Date: Wed, 22 Jan 2025 08:37:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/bochs: Do not put DRM device in PCI remove callback
To: kraxel@redhat.com, dave@treblig.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev
References: <20250103095615.231162-1-tzimmermann@suse.de>
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
In-Reply-To: <20250103095615.231162-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-0.997]; MIME_GOOD(-0.10)[text/plain];
 MID_RHS_MATCH_FROM(0.00)[]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; RCPT_COUNT_SEVEN(0.00)[8];
 FREEMAIL_TO(0.00)[redhat.com,treblig.org,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCVD_TLS_ALL(0.00)[]; TO_DN_NONE(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email, suse.de:mid, qemu.org:url,
 linux.dev:email, treblig.org:email, imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -4.30
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

another friendly ping for a review of this patch


Am 03.01.25 um 10:55 schrieb Thomas Zimmermann:
> Removing the bochs PCI device should mark the DRM device as unplugged
> without removing it. Hence clear the respective call to drm_dev_put()
> from bochs_pci_remove().
>
> Fixes a double unref in devm_drm_dev_init_release(). An example error
> message is shown below:
>
> [   32.958338] BUG: KASAN: use-after-free in drm_dev_put.part.0+0x1b/0x90
> [   32.958850] Write of size 4 at addr ffff888152134004 by task (udev-worker)/591
> [   32.959574] CPU: 3 UID: 0 PID: 591 Comm: (udev-worker) Tainted: G            E      6.13.0-rc2-1-default+ #3417
> [   32.960316] Tainted: [E]=UNSIGNED_MODULE
> [   32.960637] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.16.3-2-gc13ff2cd-prebuilt.qemu.org 04/01/2014
> [   32.961429] Call Trace:
> [   32.961433]  <TASK>
> [   32.961439]  dump_stack_lvl+0x68/0x90
> [   32.961452]  print_address_description.constprop.0+0x88/0x330
> [   32.961461]  ? preempt_count_sub+0x14/0xc0
> [   32.961473]  print_report+0xe2/0x1d0
> [   32.961479]  ? srso_alias_return_thunk+0x5/0xfbef5
> [   32.963725]  ? __virt_addr_valid+0x143/0x320
> [   32.964077]  ? srso_alias_return_thunk+0x5/0xfbef5
> [   32.964463]  ? drm_dev_put.part.0+0x1b/0x90
> [   32.964817]  kasan_report+0xce/0x1a0
> [   32.965123]  ? drm_dev_put.part.0+0x1b/0x90
> [   32.965474]  kasan_check_range+0xff/0x1c0
> [   32.965806]  drm_dev_put.part.0+0x1b/0x90
> [   32.966138]  release_nodes+0x84/0xc0
> [   32.966447]  devres_release_all+0xd2/0x110
> [   32.966788]  ? __pfx_devres_release_all+0x10/0x10
> [   32.967177]  ? preempt_count_sub+0x14/0xc0
> [   32.967523]  device_unbind_cleanup+0x16/0xc0
> [   32.967886]  really_probe+0x1b7/0x570
> [   32.968207]  __driver_probe_device+0xca/0x1b0
> [   32.968568]  driver_probe_device+0x4a/0xf0
> [   32.968907]  __driver_attach+0x10b/0x290
> [   32.969239]  ? __pfx___driver_attach+0x10/0x10
> [   32.969598]  bus_for_each_dev+0xc0/0x110
> [   32.969923]  ? __pfx_bus_for_each_dev+0x10/0x10
> [   32.970291]  ? bus_add_driver+0x17a/0x2b0
> [   32.970622]  ? srso_alias_return_thunk+0x5/0xfbef5
> [   32.971011]  bus_add_driver+0x19a/0x2b0
> [   32.971335]  driver_register+0xd8/0x160
> [   32.971671]  ? __pfx_bochs_pci_driver_init+0x10/0x10 [bochs]
> [   32.972130]  do_one_initcall+0xba/0x390
> [...]
>
> After unplugging the DRM device, clients will close their references.
> Closing the final reference will also release the DRM device.
>
> Reported-by: Dr. David Alan Gilbert <dave@treblig.org>
> Closes: https://lore.kernel.org/lkml/Z18dbfDAiFadsSdg@gallifrey/
> Fixes: 04826f588682 ("drm/bochs: Allocate DRM device in struct bochs_device")
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: virtualization@lists.linux.dev
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/tiny/bochs.c | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
> index 89a699370a59..c67e1f906785 100644
> --- a/drivers/gpu/drm/tiny/bochs.c
> +++ b/drivers/gpu/drm/tiny/bochs.c
> @@ -757,7 +757,6 @@ static void bochs_pci_remove(struct pci_dev *pdev)
>   
>   	drm_dev_unplug(dev);
>   	drm_atomic_helper_shutdown(dev);
> -	drm_dev_put(dev);
>   }
>   
>   static void bochs_pci_shutdown(struct pci_dev *pdev)

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

