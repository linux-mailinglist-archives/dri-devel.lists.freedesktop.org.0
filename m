Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8EECB62F4
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 15:31:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2178810E138;
	Thu, 11 Dec 2025 14:31:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=exactco.de header.i=@exactco.de header.b="EjkOTOPp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from exactco.de (exactco.de [176.9.10.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 960E410E138
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 14:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=exactco.de; 
 s=x;
 h=Content-Transfer-Encoding:Content-Type:Mime-Version:References:
 In-Reply-To:From:Subject:Cc:To:Message-Id:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aDlOPjaYpBdb6xcfa3La03/Dil/oWp988F+0LXwTtkY=; b=EjkOTOPpImN9gNbgMVcWEfmJAn
 DMagpoVOm1uNx1ioi0BPixWSF8ykKiW2sGjucnhl0xBYmDs3BE0Y6JpLGKndLMujuV8rGvZS8xXhj
 LFOyAspB/zQwGwQVhuBzzhRjznyYFfSZ4QQiuNLgbev4aAVIwMvMQ3z3YdjIalVjLGWJpcvTrTYaw
 yAfvPcns3v3q8Khnn3HOYWtqav+j/xYVkuWagnDCCMIDfEYWCmfn9+6QCcDpv/Q7/At+cD5hk0sqx
 rPc4/woJbaxmXeaz2VgpJ/CTAglk74K19Kq3egzfw4/mXN32VuwZdHI6ZP4SLUAG8Nzirk1sTk2pv
 89++4IdA==;
Date: Thu, 11 Dec 2025 15:31:01 +0100 (CET)
Message-Id: <20251211.153101.411672428832661296.rene@exactco.de>
To: tzimmermann@suse.de
Cc: tpearson@raptorengineering.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, airlied@redhat.com
Subject: Re: [PATCH] drm/ast: Fix big-endian support
From: =?iso-8859-1?Q?Ren=E9?= Rebe <rene@exactco.de>
In-Reply-To: <3e46c10b-79db-4c11-9047-cd33e94ff5e0@suse.de>
References: <34cce8e3-51c5-4d44-8f6e-592a5943aec8@suse.de>
 <20251211.134330.2200695829709887915.rene@exactco.de>
 <3e46c10b-79db-4c11-9047-cd33e94ff5e0@suse.de>
X-Mailer: Mew version 6.10 on Emacs 30.2
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: 8bit
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

On Thu, 11 Dec 2025 15:03:48 +0100, Thomas Zimmermann <tzimmermann@suse.de> wrote:

> Hi,
> 
> Am 11.12.25 um 13:43 schrieb René Rebe:
> [...]
> >> The code for the primary plane should be fine now. But we also need
> >> something for the cursor plane as well. There's a
> >> ast_set_cursor_image() with a memcpy_toio() [1] and several additional
> >> writes. IIUC they all have to be swapped as well.
> > Of course, any obvious style issue or endianess swapping linux-kernel
> > would like to see differently? You did not answer if I should just
> > conditionalize on the chip id. I used a bool to avoid intermangled
> > #ifdef conditionals to hopefully match kernel style.
> > Btw. checkpatch.pl warns:
> >
> > WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
> >
> > I could add this if desired while at it.
> >
> > Only compile tested, will do a final hw test once patch is approved in
> > general.
> 
> It's all a bit excessive. There's a patch attached that will hopefully
> fix the issues.
> 
> If you could test it, I'll send it out for official review. The
> easiest way of testing cursor support is to run Xorg and see if the
> cursor looks correct.
> 
> The Co-developed-by tag requires your Signed-off-by.

Ok, so you are not a fan of using the hw swapping. I think I asked two
emails ago if having both pathes is acceptable. To be honest this
driver is for some reason already annoyingly slow. Buf of course we
can just keep the sw swapping for now.

>  	/* write checksum + signature */
> +	writel(swab32(csum), dst);
> +	writel(swab32(width), dst + AST_HWC_SIGNATURE_SizeX);
> +	writel(swab32(height), dst + AST_HWC_SIGNATURE_SizeY);
> +	writel(swab32(0), dst + AST_HWC_SIGNATURE_HOTSPOTX);
> +	writel(swab32(0), dst + AST_HWC_SIGNATURE_HOTSPOTY);
> +#else
> +	memcpy_toio(dst, src, AST_HWC_SIZE);
>  	dst += AST_HWC_SIZE;
> +
> +	/* write checksum + signature */
>  	writel(csum, dst);
>  	writel(width, dst + AST_HWC_SIGNATURE_SizeX);
>  	writel(height, dst + AST_HWC_SIGNATURE_SizeY);
>  	writel(0, dst + AST_HWC_SIGNATURE_HOTSPOTX);
>  	writel(0, dst + AST_HWC_SIGNATURE_HOTSPOTY);
> +#endif

I'm pretty sure this will break the cursor, as the position was
working correctly and I only had to swap the cursor image data. The
csum will also not be identical anyway, as the checksum function
computes it in native byte order. Theoretically that would have to be
changed. However, I do not see where it is really used, maybe only
some special remote desktop vendor protocol that I'm not using. Maybe
the exact checksum does not even matter and is only used as
optimization to not resend an unchanged cursor image.

I'll send a final version after validating it w/ HW later.

Thanks,
	René

-- 
René Rebe, ExactCODE GmbH, Berlin, Germany
https://exactco.de • https://t2linux.com • https://patreon.com/renerebe
