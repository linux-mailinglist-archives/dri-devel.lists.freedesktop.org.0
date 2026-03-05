Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OGG1OLXjqWl1HAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 21:12:37 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 722702180B3
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 21:12:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C036A10E8AE;
	Thu,  5 Mar 2026 20:12:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LTvd9k5g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4069B10E8AE
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 20:12:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 45B4760053;
 Thu,  5 Mar 2026 20:12:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FE2FC116C6;
 Thu,  5 Mar 2026 20:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772741552;
 bh=hbIbkllAiEN/fkhFtcDGuL0eZPTE8FI1rQITQKYrNMM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LTvd9k5gb4QD6iUdWeDhfx0tGr1FH6uinyHepfoDFhCaSmdWQKPj9v0vjfhqLoBSQ
 Yn3NuiHYYp8tce/aT0f0ZmW6l1N6Jnm8m/VwmprfA5Oq8w/1/HGjBb8OPUv6e2KuKx
 VHReeF6+zdP4zJ4GOw+kSe/bICrHMPiFI19Kgp2a4VsTLkqBLkkgUVDw9i/Nr917jc
 FUosSFPSUK18chpuQ/nv28BycJzu3251vOuiJ1OYLrmMP1G/B6k1cQm0jiMgKBscPF
 Z4hH95r7JNArvYzHp9JThUSMs1XBiIVIYqbhfVhGQ3gnxG4sMr5RgBi65QruPjltTF
 zZbUWYRH2HAlw==
Date: Thu, 5 Mar 2026 13:12:27 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: gregkh@linuxfoundation.org, deller@gmx.de, sam@ravnborg.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 09/13] lib/fonts: Compare font data for equality with
 font_data_is_equal()
Message-ID: <20260305201227.GA2200688@ax162>
References: <20260302141255.518657-1-tzimmermann@suse.de>
 <20260302141255.518657-10-tzimmermann@suse.de>
 <20260305002347.GA4102761@ax162>
 <4acb921b-6bce-4bbf-a607-cc3e991dfc3a@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4acb921b-6bce-4bbf-a607-cc3e991dfc3a@suse.de>
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
X-Rspamd-Queue-Id: 722702180B3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[nathan@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:tzimmermann@suse.de,m:gregkh@linuxfoundation.org,m:deller@gmx.de,m:sam@ravnborg.org,m:linux-fbdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[linuxfoundation.org,gmx.de,ravnborg.org,vger.kernel.org,lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
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
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Action: no action

On Thu, Mar 05, 2026 at 10:31:13AM +0100, Thomas Zimmermann wrote:
> Thanks for testing. The attached patch fixes the problem for me. Could you
> please test?

Yeah, that appears to work for me as well.

Tested-by: Nathan Chancellor <nathan@kernel.org> # build

It seems like the asm/sections.h include can be dropped as well, since
that was only included for is_kernel_rodata() AFAICT.

> From 8dc48d2e676d1437584794f4df3dd20d08878655 Mon Sep 17 00:00:00 2001
> From: Thomas Zimmermann <tzimmermann@suse.de>
> Date: Thu, 5 Mar 2026 09:28:28 +0100
> Subject: [PATCH] test for internal fonts by refcount
> 
> Internal font data is 'static const'. Hence test against the refcount
> being zero.
> ---
>  lib/fonts/fonts.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/lib/fonts/fonts.c b/lib/fonts/fonts.c
> index 198aae869be2..b73d74b977ec 100644
> --- a/lib/fonts/fonts.c
> +++ b/lib/fonts/fonts.c
> @@ -45,14 +45,11 @@ static struct font_data *to_font_data_struct(font_data_t *fd)
>  
>  static bool font_data_is_internal(font_data_t *fd)
>  {
> -	return is_kernel_rodata((unsigned long)fd);
> +	return !REFCOUNT(fd); /* internal fonts have no reference counting */
>  }
>  
>  static void font_data_free(font_data_t *fd)
>  {
> -	if (WARN_ON(font_data_is_internal(fd)))
> -		return;
> -
>  	kfree(to_font_data_struct(fd));
>  }
>  
> -- 
> 2.53.0
> 

