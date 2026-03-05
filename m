Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8La2Gh3NqGngxQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 01:23:57 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1EA520965A
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 01:23:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B569710E02D;
	Thu,  5 Mar 2026 00:23:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oU0MDVBS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A112410E02D
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 00:23:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B0F0B61339;
 Thu,  5 Mar 2026 00:23:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9B16C4CEF7;
 Thu,  5 Mar 2026 00:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772670231;
 bh=y7DfFca5BwGLTdsV10+azoOM3Jmj6MnCcT9JsOiC4js=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oU0MDVBSFI40hoL7TuiPn7pRpKDvN63IIns4tlIhDrF9471f+FD79YkOi41y/su8m
 tUZlLFvbRgnE0cfuOGSF5H2p8UwmLqSgKECfjnaVNXbPWVjP3nfmNnJQO0ZrKQbG5V
 ke+/XMBUtwVAVljl3jMEDfy+3WxWhM8aAJ5PuSBM+lI7d2xCmwFQIeMDtMh8ouwWHO
 l74M5rJUFIecGnt3iKpDwvRS+iG1lWW1jy6nCGw5eRmH2TcCl+So6R52OtyQFwIqoR
 krK1doizo4rk/803pysVogqTWxsdU6BQ/IXbd0PzKnw4QzRHCEAYuIXqIMCTf+w8Dr
 qgALiewXsskkg==
Date: Wed, 4 Mar 2026 17:23:47 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: gregkh@linuxfoundation.org, deller@gmx.de, sam@ravnborg.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 09/13] lib/fonts: Compare font data for equality with
 font_data_is_equal()
Message-ID: <20260305002347.GA4102761@ax162>
References: <20260302141255.518657-1-tzimmermann@suse.de>
 <20260302141255.518657-10-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302141255.518657-10-tzimmermann@suse.de>
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
X-Rspamd-Queue-Id: E1EA520965A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tzimmermann@suse.de,m:gregkh@linuxfoundation.org,m:deller@gmx.de,m:sam@ravnborg.org,m:linux-fbdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[nathan@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,gmx.de,ravnborg.org,vger.kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Hi Thomas,

On Mon, Mar 02, 2026 at 03:08:43PM +0100, Thomas Zimmermann wrote:
...
> diff --git a/lib/fonts/fonts.c b/lib/fonts/fonts.c
> index 8c9a6762061c..c9f6328d5dda 100644
> --- a/lib/fonts/fonts.c
> +++ b/lib/fonts/fonts.c
> @@ -12,18 +12,25 @@
>   * for more details.
>   */
>  
> +#include <linux/font.h>
>  #include <linux/module.h>
> -#include <linux/types.h>
>  #include <linux/string.h>
> +#include <linux/types.h>
> +
> +#include <asm/sections.h>
>  #if defined(__mc68000__)
>  #include <asm/setup.h>
>  #endif
> -#include <linux/font.h>
>  
>  /*
>   * Helpers for font_data_t
>   */
>  
> +static bool font_data_is_internal(font_data_t *fd)
> +{
> +	return is_kernel_rodata((unsigned long)fd);
> +}
> +
>  /**
>   * font_data_size - Return size of the font data in bytes
>   * @fd: Font data
> @@ -37,6 +44,32 @@ unsigned int font_data_size(font_data_t *fd)
>  }
>  EXPORT_SYMBOL_GPL(font_data_size);
>  
> +/**
> + * font_data_is_equal - Compares font data for equality
> + * @lhs: Left-hand side font data
> + * @rhs: Right-hand-size font data
> + *
> + * Font data is equal if is constain the same sequence of values. The
> + * helper also use the checksum, if both arguments contain it. Font data
> + * coming from different origins, internal or from user space, is never
> + * equal. Allowing this would break reference counting.
> + *
> + * Returns:
> + * True if the given font data is equal, false otherwise.
> + */
> +bool font_data_is_equal(font_data_t *lhs, font_data_t *rhs)
> +{
> +	if (font_data_is_internal(lhs) != font_data_is_internal(rhs))
> +		return false;

This breaks the build when CONFIG_FONT_SUPPORT is a module.

  $ cat allno.config
  CONFIG_MODULES=y
  CONFIG_DRM=m
  CONFIG_DRM_PANIC=y

  $ make -skj"$(nproc)" ARCH=x86_64 CROSS_COMPILE=x86_64-linux- KCONFIG_ALLCONFIG=1 allnoconfig all
  ERROR: modpost: "__end_rodata" [lib/fonts/font.ko] undefined!
  make[4]: *** [scripts/Makefile.modpost:147: Module.symvers] Error 1
  ...

  $ scripts/config -s FONT_SUPPORT
  m

Cheers,
Nathan

> +	if (font_data_size(lhs) != font_data_size(rhs))
> +		return false;
> +	if (FNTSUM(lhs) && FNTSUM(rhs) && FNTSUM(lhs) != FNTSUM(rhs))
> +		return false;
> +
> +	return !memcmp(lhs, rhs, FNTSIZE(lhs));
> +}
> +EXPORT_SYMBOL_GPL(font_data_is_equal);
> +
>  /*
>   * Font lookup
>   */
> -- 
> 2.53.0
> 
