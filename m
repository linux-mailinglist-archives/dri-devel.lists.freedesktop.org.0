Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5382F97A416
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2024 16:26:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91C9510E1A2;
	Mon, 16 Sep 2024 14:26:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="m2gKqMgj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="EKhfiyhS";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="m2gKqMgj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="EKhfiyhS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF05410E1A2;
 Mon, 16 Sep 2024 14:26:36 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6C73F1F8B3;
 Mon, 16 Sep 2024 14:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1726496795; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ULX/X/H4MvKux29L3rZwwsvXm/hVCb9CdayrIqYvNCU=;
 b=m2gKqMgj/AeSsWfUhsmC5wFkkOmR4WEkiwIoodkwu4aTV9poOfsXqIBTVFEx8rUPgCskN+
 hqA8BTA70rSe4aR4mnq1QkJPw7o+X1LMCX9NSyWIloXKvMmTLyH9DM+gWSaP6eAB/U2kUt
 WU701qgRAKTEosecGLpoIT7ENQAHi/Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1726496795;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ULX/X/H4MvKux29L3rZwwsvXm/hVCb9CdayrIqYvNCU=;
 b=EKhfiyhSws94l6Z7tpwVAb0mvpaWWTtQcna15VcFo0Ex48RfsFqw4AwnkQJOzMyTLeHMBc
 P1Bsjgxu023RZkBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1726496795; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ULX/X/H4MvKux29L3rZwwsvXm/hVCb9CdayrIqYvNCU=;
 b=m2gKqMgj/AeSsWfUhsmC5wFkkOmR4WEkiwIoodkwu4aTV9poOfsXqIBTVFEx8rUPgCskN+
 hqA8BTA70rSe4aR4mnq1QkJPw7o+X1LMCX9NSyWIloXKvMmTLyH9DM+gWSaP6eAB/U2kUt
 WU701qgRAKTEosecGLpoIT7ENQAHi/Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1726496795;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ULX/X/H4MvKux29L3rZwwsvXm/hVCb9CdayrIqYvNCU=;
 b=EKhfiyhSws94l6Z7tpwVAb0mvpaWWTtQcna15VcFo0Ex48RfsFqw4AwnkQJOzMyTLeHMBc
 P1Bsjgxu023RZkBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 152B5139CE;
 Mon, 16 Sep 2024 14:26:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id CRO6AxtA6Ga7MwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 16 Sep 2024 14:26:35 +0000
Message-ID: <510bd1a2-bccb-4f80-980f-1a6eed5b683e@suse.de>
Date: Mon, 16 Sep 2024 16:26:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] firmware: sysfb: Add a sysfb_handles_screen_info()
 helper function
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
Cc: Brian Norris <briannorris@chromium.org>, dri-devel@lists.freedesktop.org, 
 Borislav Petkov <bp@alien8.de>, Julius Werner <jwerner@chromium.org>,
 chrome-platform@lists.linux.dev, intel-gfx@lists.freedesktop.org,
 Hugues Bruant <hugues.bruant@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Dan Carpenter <dan.carpenter@linaro.org>, Helge Deller <deller@gmx.de>,
 Jani Nikula <jani.nikula@intel.com>
References: <20240916110040.1688511-1-javierm@redhat.com>
 <20240916110040.1688511-2-javierm@redhat.com>
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
In-Reply-To: <20240916110040.1688511-2-javierm@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_TLS_ALL(0.00)[]; TAGGED_RCPT(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCPT_COUNT_TWELVE(0.00)[13];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[chromium.org,lists.freedesktop.org,alien8.de,lists.linux.dev,gmail.com,amd.com,linaro.org,gmx.de,intel.com];
 TO_DN_SOME(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email, suse.de:mid,
 imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -2.80
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



Am 16.09.24 um 13:00 schrieb Javier Martinez Canillas:
> That can be used by drivers to check if the Generic System Framebuffers
> (sysfb) support can handle the data contained in the global screen_info.
>
> Drivers might need this information to know if have to setup the system
> framebuffer, or if they have to delegate this action to sysfb instead.
>
> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>
> Changes in v4:
> - New patch to add sysfb_handles_screen_info() helper (Thomas Zimmermann).
>
>   drivers/firmware/sysfb.c | 19 +++++++++++++++++++
>   include/linux/sysfb.h    |  7 +++++++
>   2 files changed, 26 insertions(+)
>
> diff --git a/drivers/firmware/sysfb.c b/drivers/firmware/sysfb.c
> index 02a07d3d0d40..770e74be14f3 100644
> --- a/drivers/firmware/sysfb.c
> +++ b/drivers/firmware/sysfb.c
> @@ -77,6 +77,25 @@ void sysfb_disable(struct device *dev)
>   }
>   EXPORT_SYMBOL_GPL(sysfb_disable);
>   
> +/**
> + * sysfb_handles_screen_info() - reports if sysfb handles the global screen_info
> + *
> + * Callers can use sysfb_handles_screen_info() to determine whether the Generic
> + * System Framebuffers (sysfb) can handle the global screen_info data structure
> + * or not. Drivers might need this information to know if they have to setup the
> + * system framebuffer, or if they have to delegate this action to sysfb instead.
> + *
> + * Returns:
> + * True if sysfb handles the global screen_info data structure.
> + */
> +bool sysfb_handles_screen_info(void)
> +{
> +	const struct screen_info *si = &screen_info;
> +
> +	return !!screen_info_video_type(si);
> +}
> +EXPORT_SYMBOL_GPL(sysfb_handles_screen_info);
> +
>   #if defined(CONFIG_PCI)
>   static bool sysfb_pci_dev_is_enabled(struct pci_dev *pdev)
>   {
> diff --git a/include/linux/sysfb.h b/include/linux/sysfb.h
> index bef5f06a91de..07cbab516942 100644
> --- a/include/linux/sysfb.h
> +++ b/include/linux/sysfb.h
> @@ -60,12 +60,19 @@ struct efifb_dmi_info {
>   
>   void sysfb_disable(struct device *dev);
>   
> +bool sysfb_handles_screen_info(void);
> +
>   #else /* CONFIG_SYSFB */
>   
>   static inline void sysfb_disable(struct device *dev)
>   {
>   }
>   
> +static inline bool sysfb_handles_screen_info(void)
> +{
> +	return false;
> +}
> +
>   #endif /* CONFIG_SYSFB */
>   
>   #ifdef CONFIG_EFI

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

