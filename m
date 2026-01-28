Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6InhON/QeWlCzwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 10:03:27 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A019E9A4
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 10:03:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9B1B10E62A;
	Wed, 28 Jan 2026 09:03:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="xJUzDWmL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2565010E62A
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 09:03:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 96DC840E2A;
 Wed, 28 Jan 2026 09:03:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15CE8C4CEF1;
 Wed, 28 Jan 2026 09:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1769591003;
 bh=ZvAupvvr/WMYU+hMmFixA0h6HMFEsrs2ahj7ED07S8Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=xJUzDWmLpQ0qEvTYAWlP7N6JSHh75wMJM+pT2Ev2av9hTUaZHxBiexo8mZKpRTYay
 ik2SNxfKJ4TVeplA7ga4oMmIpykCYMtsr2jBpmnqMMuuc6zzNY6+3WtIsXhY44nhJN
 1hQ0isvuV+2+n0LAyzjQUwDSLdJxDrn+lG5jejjU=
Date: Wed, 28 Jan 2026 10:03:20 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Waffle0823 <csshin9928@gmail.com>
Cc: andy@kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] fbtft: Improve damage_range to mark only changed rows
Message-ID: <2026012804-pentagram-emote-d443@gregkh>
References: <20260128085720.862399-1-csshin9928@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128085720.862399-1-csshin9928@gmail.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.19 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:csshin9928@gmail.com,m:andy@kernel.org,m:linux-fbdev@vger.kernel.org,m:linux-staging@lists.linux.dev,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[gregkh@linuxfoundation.org,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: 65A019E9A4
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 05:57:20PM +0900, Waffle0823 wrote:
> Instead of marking the entire display as dirty, calculate
> start_row and end_row based on off/len and mark only those rows.
> This improves performance for partial framebuffer updates.
> 
> Signed-off-by: Waffle0283 csshin9928@gmail.com
> ---
>  drivers/staging/fbtft/fbtft-core.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
> index 8a5ccc8ae0a1..0fbdfdaaa94d 100644
> --- a/drivers/staging/fbtft/fbtft-core.c
> +++ b/drivers/staging/fbtft/fbtft-core.c
> @@ -415,8 +415,11 @@ static void fbtft_ops_damage_range(struct fb_info *info, off_t off, size_t len)
>  {
>  	struct fbtft_par *par = info->par;
>  
> -	/* TODO: only mark changed area update all for now */
> -	par->fbtftops.mkdirty(info, -1, 0);
> +	__u32 width = info->var.xres;
> +	__u32 start_row = off / width;
> +	__u32 end_row = (off + len - 1) / width;
> +
> +	par->fbtftops.mkdirty(info, start_row, end_row);
>  }
>  
>  static void fbtft_ops_damage_area(struct fb_info *info, u32 x, u32 y, u32 width, u32 height)
> -- 
> 2.52.0
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- It looks like you did not use your "real" name for the patch on either
  the Signed-off-by: line, or the From: line (both of which have to
  match).  Please read the kernel file,
  Documentation/process/submitting-patches.rst for how to do this
  correctly.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
