Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FEA96DA7D
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 15:37:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0E5510E8BB;
	Thu,  5 Sep 2024 13:37:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="vv6NZGY/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KYyMEJWW";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vv6NZGY/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KYyMEJWW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C54210E8BB
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2024 13:37:11 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 722EF1F7D4;
 Thu,  5 Sep 2024 13:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1725543429; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=o2BozEM+SZwYk+/eM1Y46tsnu0ABNExojFMX2//sO6w=;
 b=vv6NZGY/6zjx5/4dJNZsKdUcr560DgUbZ4eIpRPOwWPsOXi7sR0AN8q/XqWYFV3BBShOpI
 SjozVD27sNc2Z+ellJ0vLtpsestoDQv/oFYe/k5cgmCcx2V+mjFgeBkwQa1aSFxEGUYH6A
 8PjyL0fzZ/f2IAFfpswnNbMMq1M+DhQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1725543429;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=o2BozEM+SZwYk+/eM1Y46tsnu0ABNExojFMX2//sO6w=;
 b=KYyMEJWWtbKaxBaMqtzywRWCF+qzRiKrhOE+fCHrvBJPe3d9bCwOeSG1QjKANPmPMUwJca
 O0KfMFxmeTVWKABA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1725543429; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=o2BozEM+SZwYk+/eM1Y46tsnu0ABNExojFMX2//sO6w=;
 b=vv6NZGY/6zjx5/4dJNZsKdUcr560DgUbZ4eIpRPOwWPsOXi7sR0AN8q/XqWYFV3BBShOpI
 SjozVD27sNc2Z+ellJ0vLtpsestoDQv/oFYe/k5cgmCcx2V+mjFgeBkwQa1aSFxEGUYH6A
 8PjyL0fzZ/f2IAFfpswnNbMMq1M+DhQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1725543429;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=o2BozEM+SZwYk+/eM1Y46tsnu0ABNExojFMX2//sO6w=;
 b=KYyMEJWWtbKaxBaMqtzywRWCF+qzRiKrhOE+fCHrvBJPe3d9bCwOeSG1QjKANPmPMUwJca
 O0KfMFxmeTVWKABA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 114CA13419;
 Thu,  5 Sep 2024 13:37:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id BH7hAgW02WY+CQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 05 Sep 2024 13:37:09 +0000
Message-ID: <26ce4869-d635-4808-a458-521004194a0f@suse.de>
Date: Thu, 5 Sep 2024 15:37:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/28] backlight: lcd: Remove fbdev dependencies
To: lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 deller@gmx.de, bonbons@linux-vserver.org, jikos@kernel.org,
 bentiss@kernel.org, shc_work@mail.ru, s.hauer@pengutronix.de,
 kernel@pengutronix.de, shawnguo@kernel.org, festevam@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-omap@vger.kernel.org
References: <20240820093452.68270-1-tzimmermann@suse.de>
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
In-Reply-To: <20240820093452.68270-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,gmx.de,linux-vserver.org,mail.ru,pengutronix.de];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de,mail.ru];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_TWELVE(0.00)[15];
 RCVD_TLS_ALL(0.00)[]; TO_DN_NONE(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
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

Helge, you might want to look through the fbdev patches in this series.

Am 20.08.24 um 11:22 schrieb Thomas Zimmermann:
> This series removes most dependencies on fbdev from the lcd subsystem
> and its drivers.
>
> Patches 1 to 3 rework the fbdev notifier, the fbdev's fb_info can
> now refer to a dedicated lcd device, and lcd defines constants for
> power states. These changes resemble similar changes to the backlight
> code.
>
> Patches 4 to 19 update lcd drivers to the new interfaces and perform
> minor cleanups during the process. Patches 20 to 24 update fbdev
> drivers and patch 25 updates the picolcd driver from the hid subsystem.
>
> Patches 25 to 28 finally clean up various lcd interfaces and files.
>
> This patchset is part of a larger effort to implement the lcd code
> without depending on fbdev. Similar patches have been sent out for
> the backlight subsystem, such as in [1] and [2].
>
> Hopefully this series can be merged at once through the lcd tree.
>
> [1] https://patchwork.freedesktop.org/series/129782/
> [2] https://patchwork.freedesktop.org/series/134718/
>
> Thomas Zimmermann (28):
>    backlight: lcd: Rearrange code in fb_notifier_callback()
>    backlight: lcd: Test against struct fb_info.lcd_dev
>    backlight: lcd: Add LCD_POWER_ constants for power states
>    backlight: corgi_lcd: Use lcd power constants
>    backlight: hx8357: Use lcd power constants
>    backlight: ili922x: Use lcd power constants
>    backlight: ili9320: Use lcd power constants
>    backlight: jornada720_lcd: Include <linux/io.h> for IOMEM() macro
>    backlight: jornada720_lcd: Use lcd power constants
>    backlight: l4f00242t03: Use lcd power constants
>    backlight: lms283gf05: Use lcd power constants
>    backlight: lms501kf03: Remove unnecessary include of
>      <linux/backlight.h>
>    backlight: lms501kf03: Use lcd power constants
>    backlight: ltv350qv: Use lcd power constants
>    backlight: otm3225a: Use lcd power constants
>    backlight: platform_lcd: Remove include statement for
>      <linux/backlight.h>
>    backlight: platform_lcd: Remove match_fb from struct plat_lcd_data
>    backlight: platform_lcd: Use lcd power constants
>    backlight: tdo24m: Use lcd power constants
>    fbdev: clps711x-fb: Replace check_fb in favor of struct
>      fb_info.lcd_dev
>    fbdev: clps711x-fb: Use lcd power constants
>    fbdev: imxfb: Replace check_fb in favor of struct fb_info.lcd_dev
>    fbdev: imxfb: Use lcd power constants
>    fbdev: omap: Use lcd power constants
>    HID: picoLCD: Replace check_fb in favor of struct fb_info.lcd_dev
>    backlight: lcd: Replace check_fb with controls_device
>    backlight: lcd: Remove struct fb_videomode from set_mode callback
>    backlight: lcd: Do not include <linux/fb.h> in lcd header
>
>   drivers/hid/hid-picolcd_fb.c             |  4 ++
>   drivers/hid/hid-picolcd_lcd.c            |  6 ---
>   drivers/video/backlight/corgi_lcd.c      | 17 ++++----
>   drivers/video/backlight/hx8357.c         |  2 +-
>   drivers/video/backlight/ili922x.c        |  7 ++--
>   drivers/video/backlight/ili9320.c        | 15 ++++----
>   drivers/video/backlight/jornada720_lcd.c | 10 ++---
>   drivers/video/backlight/l4f00242t03.c    | 32 ++++++++--------
>   drivers/video/backlight/lcd.c            | 49 +++++++++++++++++++-----
>   drivers/video/backlight/lms283gf05.c     |  2 +-
>   drivers/video/backlight/lms501kf03.c     | 24 ++++++------
>   drivers/video/backlight/ltv350qv.c       | 15 ++++----
>   drivers/video/backlight/otm3225a.c       |  2 +-
>   drivers/video/backlight/platform_lcd.c   | 20 ++++------
>   drivers/video/backlight/tdo24m.c         | 19 +++++----
>   drivers/video/fbdev/clps711x-fb.c        | 29 +++++++-------
>   drivers/video/fbdev/imxfb.c              | 32 ++++++----------
>   drivers/video/fbdev/omap/lcd_ams_delta.c |  8 ++--
>   include/linux/fb.h                       | 13 +++++++
>   include/linux/lcd.h                      | 29 ++++++++++----
>   include/video/platform_lcd.h             |  3 --
>   21 files changed, 182 insertions(+), 156 deletions(-)
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

