Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3671971C30
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 16:14:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ABFE10E58A;
	Mon,  9 Sep 2024 14:14:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="PUZHJEmh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="R+VMf+mn";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PUZHJEmh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="R+VMf+mn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA63C10E58A
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2024 14:14:34 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 40F0521A79;
 Mon,  9 Sep 2024 14:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1725891273; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=H+yw8+7OOFhqHoimGCFVdKWUlAcV1UbPpI3rPBjJgZw=;
 b=PUZHJEmhI2Ql1wy698fw2kg+iyu2rgv+cbqK5/ZzgEObzM3e5Ms6JJYu2cTtF0hK+AUHeD
 J64rgjz7i7XXmppoPCvEz/SuQba62PZVKd9USSOYMrOeZXKa5yMwlagCQNF/nyo16omz+t
 onqVdfRw+xnVS2YEFGkD3rWLTde4sS4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1725891273;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=H+yw8+7OOFhqHoimGCFVdKWUlAcV1UbPpI3rPBjJgZw=;
 b=R+VMf+mnN+xrRvjmZ5hG5MBnh+NuqVTsh6rV8+UZaywYPp1sw54tfeTrcrGvepA7+FvbdX
 ztQ4tmi3st7LUvAw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=PUZHJEmh;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=R+VMf+mn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1725891273; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=H+yw8+7OOFhqHoimGCFVdKWUlAcV1UbPpI3rPBjJgZw=;
 b=PUZHJEmhI2Ql1wy698fw2kg+iyu2rgv+cbqK5/ZzgEObzM3e5Ms6JJYu2cTtF0hK+AUHeD
 J64rgjz7i7XXmppoPCvEz/SuQba62PZVKd9USSOYMrOeZXKa5yMwlagCQNF/nyo16omz+t
 onqVdfRw+xnVS2YEFGkD3rWLTde4sS4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1725891273;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=H+yw8+7OOFhqHoimGCFVdKWUlAcV1UbPpI3rPBjJgZw=;
 b=R+VMf+mnN+xrRvjmZ5hG5MBnh+NuqVTsh6rV8+UZaywYPp1sw54tfeTrcrGvepA7+FvbdX
 ztQ4tmi3st7LUvAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 17AA713312;
 Mon,  9 Sep 2024 14:14:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id XVNjBMkC32ZodgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 09 Sep 2024 14:14:33 +0000
Message-ID: <3b5f4413-fe7d-413d-8c24-870f0456b2d6@suse.de>
Date: Mon, 9 Sep 2024 16:14:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/panthor: Display FW version information
To: Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>
Cc: dri-devel@lists.freedesktop.org, Christopher Healy <healych@amazon.com>
References: <20240906094025.638173-1-steven.price@arm.com>
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
In-Reply-To: <20240906094025.638173-1-steven.price@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 40F0521A79
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCPT_COUNT_FIVE(0.00)[5];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,collabora.com:email];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
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

Am 06.09.24 um 11:40 schrieb Steven Price:
> The version number output when loading the firmware is actually the
> interface version not the version of the firmware itself. Update the
> message to make this clearer.
>
> However, the firmware binary has a git SHA embedded into it which can be
> used to identify which firmware binary is being loaded. So output this
> as a drm_info() so that it's obvious from a dmesg log which firmware
> binary is being used.
>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> v2:
>   * Fix indentation
>   * Also update the FW interface message to include "using interface" to
>     make it clear it's not the FW version
>   * Add Reviewed-bys
>
>   drivers/gpu/drm/panthor/panthor_fw.c | 57 +++++++++++++++++++++++++++-
>   1 file changed, 56 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
> index 857f3f11258a..aea5dd9a4969 100644
> --- a/drivers/gpu/drm/panthor/panthor_fw.c
> +++ b/drivers/gpu/drm/panthor/panthor_fw.c
> @@ -78,6 +78,12 @@ enum panthor_fw_binary_entry_type {
>   
>   	/** @CSF_FW_BINARY_ENTRY_TYPE_TIMELINE_METADATA: Timeline metadata interface. */
>   	CSF_FW_BINARY_ENTRY_TYPE_TIMELINE_METADATA = 4,
> +
> +	/**
> +	 * @CSF_FW_BINARY_ENTRY_TYPE_BUILD_INFO_METADATA: Metadata about how
> +	 * the FW binary was built.
> +	 */
> +	CSF_FW_BINARY_ENTRY_TYPE_BUILD_INFO_METADATA = 6
>   };
>   
>   #define CSF_FW_BINARY_ENTRY_TYPE(ehdr)					((ehdr) & 0xff)
> @@ -132,6 +138,13 @@ struct panthor_fw_binary_section_entry_hdr {
>   	} data;
>   };
>   
> +struct panthor_fw_build_info_hdr {
> +	/** @meta_start: Offset of the build info data in the FW binary */
> +	u32 meta_start;
> +	/** @meta_size: Size of the build info data in the FW binary */
> +	u32 meta_size;
> +};
> +
>   /**
>    * struct panthor_fw_binary_iter - Firmware binary iterator
>    *
> @@ -628,6 +641,46 @@ static int panthor_fw_load_section_entry(struct panthor_device *ptdev,
>   	return 0;
>   }
>   
> +static int panthor_fw_read_build_info(struct panthor_device *ptdev,
> +				      const struct firmware *fw,
> +				      struct panthor_fw_binary_iter *iter,
> +				      u32 ehdr)
> +{
> +	struct panthor_fw_build_info_hdr hdr;
> +	char header[9];
> +	const char git_sha_header[sizeof(header)] = "git_sha: ";
> +	int ret;
> +
> +	ret = panthor_fw_binary_iter_read(ptdev, iter, &hdr, sizeof(hdr));
> +	if (ret)
> +		return ret;
> +
> +	if (hdr.meta_start > fw->size ||
> +	    hdr.meta_start + hdr.meta_size > fw->size) {
> +		drm_err(&ptdev->base, "Firmware build info corrupt\n");
> +		/* We don't need the build info, so continue */
> +		return 0;
> +	}
> +
> +	if (memcmp(git_sha_header, fw->data + hdr.meta_start,
> +		   sizeof(git_sha_header))) {
> +		/* Not the expected header, this isn't metadata we understand */
> +		return 0;
> +	}
> +
> +	/* Check that the git SHA is NULL terminated as expected */
> +	if (fw->data[hdr.meta_start + hdr.meta_size - 1] != '\0') {
> +		drm_warn(&ptdev->base, "Firmware's git sha is not NULL terminated\n");
> +		/* Don't treat as fatal */
> +		return 0;
> +	}
> +
> +	drm_info(&ptdev->base, "Firmware git sha: %s\n",
> +		 fw->data + hdr.meta_start + sizeof(git_sha_header));

Please consider making this debugging-only information. Printing takes 
time and the information is not essential unless for debugging.

> +
> +	return 0;
> +}
> +
>   static void
>   panthor_reload_fw_sections(struct panthor_device *ptdev, bool full_reload)
>   {
> @@ -672,6 +725,8 @@ static int panthor_fw_load_entry(struct panthor_device *ptdev,
>   	switch (CSF_FW_BINARY_ENTRY_TYPE(ehdr)) {
>   	case CSF_FW_BINARY_ENTRY_TYPE_IFACE:
>   		return panthor_fw_load_section_entry(ptdev, fw, &eiter, ehdr);
> +	case CSF_FW_BINARY_ENTRY_TYPE_BUILD_INFO_METADATA:
> +		return panthor_fw_read_build_info(ptdev, fw, &eiter, ehdr);
>   
>   	/* FIXME: handle those entry types? */
>   	case CSF_FW_BINARY_ENTRY_TYPE_CONFIG:
> @@ -921,7 +976,7 @@ static int panthor_fw_init_ifaces(struct panthor_device *ptdev)
>   			return ret;
>   	}
>   
> -	drm_info(&ptdev->base, "CSF FW v%d.%d.%d, Features %#x Instrumentation features %#x",
> +	drm_info(&ptdev->base, "CSF FW using interface v%d.%d.%d, Features %#x Instrumentation features %#x",
>   		 CSF_IFACE_VERSION_MAJOR(glb_iface->control->version),
>   		 CSF_IFACE_VERSION_MINOR(glb_iface->control->version),
>   		 CSF_IFACE_VERSION_PATCH(glb_iface->control->version),

Same.

Best regards
Thomas




-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

