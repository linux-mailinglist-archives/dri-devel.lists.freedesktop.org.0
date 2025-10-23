Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A17BFFB5A
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 09:51:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 117B910E8BB;
	Thu, 23 Oct 2025 07:51:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="XdTyzEaC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2eaYDE6s";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wpRNCXkM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yPd+PriJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA08810E8BB
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 07:51:16 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3FAA71F445;
 Thu, 23 Oct 2025 07:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1761205871; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ZMNp2nOpN1XxaXWWIFL4YPLeaCGKanFBJUZI99Z/v0g=;
 b=XdTyzEaCWS2zDUF+Lc2f1sMTxgzmsaNZ1kUKT4/Pb/zBLpk0TQr10I6IHRM1AbWhbU8cy5
 RylBGbm4crac9k/xtijILnx+xZiqSf/5MRN2a7UwYqk5Q1AUj3RN83wyAw9dUBJEzGhqwt
 BMZOhRZf/cXFRGRguFKB+0wiNQwSUlQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1761205871;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ZMNp2nOpN1XxaXWWIFL4YPLeaCGKanFBJUZI99Z/v0g=;
 b=2eaYDE6sHgQ3vmkc91N7TQG0Njuto48D8QuSlVOEJnjoa4ZlL8p/yGpRXMomNlM30Jbj47
 z/826XfdUCS3t8Cg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1761205867; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ZMNp2nOpN1XxaXWWIFL4YPLeaCGKanFBJUZI99Z/v0g=;
 b=wpRNCXkMZioSnM/BRuZ8Segg7HdwttbAosM+ECful/zltkOGNtq6JjiOltm2M/T8bAlS6t
 VpfcKJh8Vlw7IrTa4VnZuYuHMOe7nuLzyM4/Vk98UH1zLa5Dl6Vd+oSf/2Uov8Ch3Na4iJ
 2gnCg/WfF72yrUZq+QRnlE/GwMvjPOk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1761205867;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ZMNp2nOpN1XxaXWWIFL4YPLeaCGKanFBJUZI99Z/v0g=;
 b=yPd+PriJqShk7m9RM9linS+Zc4AmVQZdPdbxBPyApa30REinu5jtEWyIi3E8TBGuvXqWbV
 P5LmlRZW6EbXAaDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C893E13285;
 Thu, 23 Oct 2025 07:51:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 94HPLmre+WhaYQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 23 Oct 2025 07:51:06 +0000
Message-ID: <afefc748-c466-4697-b8e6-7791b9ebbfed@suse.de>
Date: Thu, 23 Oct 2025 09:51:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/vblank: downgrade vblank wait timeout from WARN to
 error
To: Chintan Patel <chintanlike@gmail.com>, maarten.lankhorst@linux.intel.com, 
 maxime.ripard@kernel.org, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 syzbot+147ba789658184f0ce04@syzkaller.appspotmail.com
References: <20251003032303.16518-1-chintanlike@gmail.com>
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
In-Reply-To: <20251003032303.16518-1-chintanlike@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCPT_COUNT_SEVEN(0.00)[8];
 FREEMAIL_TO(0.00)[gmail.com,linux.intel.com,kernel.org,ffwll.ch];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 TAGGED_RCPT(0.00)[147ba789658184f0ce04];
 MID_RHS_MATCH_FROM(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo, suse.de:mid,
 suse.de:email]
X-Spam-Flag: NO
X-Spam-Score: -2.80
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

Am 03.10.25 um 05:23 schrieb Chintan Patel:
> When wait_event_timeout() in drm_wait_one_vblank() times out, the
> current WARN can cause unnecessary kernel panics in environments
> with panic_on_warn set (e.g. CI, fuzzing). These timeouts can happen
> under heavy scheduling pressure or in rare cases of delayed vblank
> handling, and are not always a kernel bug.
>
> Replace the WARN with drm_err() messages that report the timeout
> without crashing the system. Developers can still enable drm.debug
> to diagnose genuine problems.
>
> Reported-by: syzbot+147ba789658184f0ce04@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=147ba789658184f0ce04
> Tested-by: syzbot+147ba789658184f0ce04@syzkaller.appspotmail.com
> Signed-off-by: Chintan Patel <chintanlike@gmail.com>

 From my side

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

See [1] for another such report

[1] 
https://lore.kernel.org/virtualization/202510221555.8c60c069-lkp@intel.com/T/#u

If there's also a way to raise priority of the vblank timer, we should 
explore that as well.

Best regards
Thomas

>
> v2:
>   - Drop unnecessary in-code comment (suggested by Thomas Zimmermann)
>   - Remove else branch, only log timeout case
>
> v3:
>   - Use drm_err() instead of drm_dbg_kms() (suggested by Ville Syrjälä)
>   - Remove unnecessary curr = drm_vblank_count() (suggested by Thomas Zimmermann)
>   - Fix commit message wording (“invalid userspace calls” → “delayed vblank handling”)
> ---
>   drivers/gpu/drm/drm_vblank.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> index 46f59883183d..0664aea1b924 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c
> @@ -1305,7 +1305,8 @@ void drm_wait_one_vblank(struct drm_device *dev, unsigned int pipe)
>   				 last != drm_vblank_count(dev, pipe),
>   				 msecs_to_jiffies(100));
>   
> -	drm_WARN(dev, ret == 0, "vblank wait timed out on crtc %i\n", pipe);
> +	if (!ret)
> +		drm_err(dev, "vblank wait timed out on crtc %i\n", pipe);
>   
>   	drm_vblank_put(dev, pipe);
>   }

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


