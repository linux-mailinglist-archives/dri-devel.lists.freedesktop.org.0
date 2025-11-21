Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC354C77C6C
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 09:00:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 743DB10E822;
	Fri, 21 Nov 2025 08:00:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="exu1v4zq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4awr4iVr";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bbokZlJl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NNeopXin";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96F3410E7F0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 08:00:03 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C61B720EC5;
 Fri, 21 Nov 2025 08:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1763712002; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=F+T32ts4Ys4w3XSCZ7lzkLpHAeqj+ekfTc434WzErEw=;
 b=exu1v4zqGs4p1c2fgYiMLiAmvgm55WFuW0btK81NI7ZEuPBDOneHwW0wnAU/d69k6ciHRq
 8EIjKueHyOEVTXjQ06GhvXgp1aZJXMN9jH1hJM4fAGHXdgfXhyNXuU0AUOCSPJtuBBR70a
 xCSDIvDVSBMg5VLsiqrrnjEDH/ySqIo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1763712002;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=F+T32ts4Ys4w3XSCZ7lzkLpHAeqj+ekfTc434WzErEw=;
 b=4awr4iVrUfhEsEntHBH5tu2CEcCCesTlJU/8CcTtU7+K6KQ83blKu6yqwBTNDQlWtCADLx
 iNhxr3eIQbrlFgDQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1763712001; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=F+T32ts4Ys4w3XSCZ7lzkLpHAeqj+ekfTc434WzErEw=;
 b=bbokZlJlvH5VtvnOOHz4i/FSSJouMPM8vkrOmZv67Mx3pvKJFzR5mhozM6gsHtwV3EjS/K
 X4b1ZJ7cdlk5Cg60mEzhLmlHcXFMLJcxZYbfPR6Rxxq5OGnHBkoa/CCJkP6ph8Q5GDqcGm
 RojmEd1UZsUuLExVdJmzY9fokJiSoh8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1763712001;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=F+T32ts4Ys4w3XSCZ7lzkLpHAeqj+ekfTc434WzErEw=;
 b=NNeopXinmwaDLSsUh9mdfoyLtOqe5mDdwZYksJoslhspN5w7H6b+FAmhjktAb5rGDyTDUL
 lB4n/s/2W+nuUgDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A02533EA61;
 Fri, 21 Nov 2025 08:00:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id fgvQJQEcIGnuHgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 21 Nov 2025 08:00:01 +0000
Message-ID: <23ef60cd-d17e-4070-bbf5-41dce6439fb1@suse.de>
Date: Fri, 21 Nov 2025 09:00:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] PCI: Add CONFIG_PCI_ARCH_ENDIAN_AUTOSWAP
To: Timothy Pearson <tpearson@raptorengineering.com>,
 Dave Airlie <airlied@redhat.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
References: <407388289.1798972.1760725035958.JavaMail.zimbra@raptorengineeringinc.com>
 <705534604.1798975.1760725076596.JavaMail.zimbra@raptorengineeringinc.com>
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
In-Reply-To: <705534604.1798975.1760725076596.JavaMail.zimbra@raptorengineeringinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; ARC_NA(0.00)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; TO_DN_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[4];
 MIME_TRACE(0.00)[0:+]; FROM_EQ_ENVFROM(0.00)[];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid, suse.com:url,
 gitlab.freedesktop.org:url, imap1.dmz-prg2.suse.org:helo,
 raptorengineering.com:email]
X-Spam-Flag: NO
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

Hi,

sorry for the delay in reviewing. I've wondered for some time what to 
make of this series.

Am 17.10.25 um 20:17 schrieb Timothy Pearson:
> Certain hardware devices, such as the IBM POWER9 CPU, transparently swap PCI
> bus MMIO data endianness when running in big endian mode.  This transparent
> data swapping presents issues for certain types of BARs, for example little
> endian framebuffers, where the device driver needs to be aware the PCI BAR
> is now appearing as big endian from the host's perspective.
>
> Introduce CONFIG_PCI_ARCH_ENDIAN_AUTOSWAP and enable on ppc64 systems.

I would not want a config option. In the latest version of the driver, 
we have a struct to describe device quirks. [1] I think we should detect 
this scenario in the driver and set the quirk if necessary. The 
detection can be at compile time though.

If this problem affects many graphics drivers, we can re-evaluate.

[1] 
https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next-2025-11-14/drivers/gpu/drm/ast/ast_drv.h?ref_type=tags#L167

Best regards
Thomas

>
> Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
> ---
>   arch/powerpc/Kconfig | 1 +
>   drivers/pci/Kconfig  | 4 ++++
>   2 files changed, 5 insertions(+)
>
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index e24f4d88885a..0e75fe570389 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -314,6 +314,7 @@ config PPC
>   	select OF_EARLY_FLATTREE
>   	select OLD_SIGACTION			if PPC32
>   	select OLD_SIGSUSPEND
> +	select PCI_ARCH_ENDIAN_AUTOSWAP		if PCI && PPC64
>   	select PCI_DOMAINS			if PCI
>   	select PCI_MSI_ARCH_FALLBACKS		if PCI_MSI
>   	select PCI_SYSCALL			if PCI
> diff --git a/drivers/pci/Kconfig b/drivers/pci/Kconfig
> index 7065a8e5f9b1..fccc01110763 100644
> --- a/drivers/pci/Kconfig
> +++ b/drivers/pci/Kconfig
> @@ -40,6 +40,10 @@ config PCI_DOMAINS_GENERIC
>   config PCI_SYSCALL
>   	bool
>   
> +config PCI_ARCH_ENDIAN_AUTOSWAP
> +	bool
> +	depends on PCI
> +
>   source "drivers/pci/pcie/Kconfig"
>   
>   config PCI_MSI

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


