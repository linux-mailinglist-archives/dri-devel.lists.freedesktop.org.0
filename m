Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 503F3CB97C8
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 18:55:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D006D10E0B6;
	Fri, 12 Dec 2025 17:54:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=exactco.de header.i=@exactco.de header.b="Djk1LHJT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from exactco.de (exactco.de [176.9.10.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8536D10E0B6
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Dec 2025 17:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=exactco.de; 
 s=x;
 h=Content-Transfer-Encoding:Content-Type:Mime-Version:References:
 In-Reply-To:From:Subject:Cc:To:Message-Id:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dqiMFrdkc5U0FzjnnTLNPvAlKeMBu4hHp4b5N+wKaCA=; b=Djk1LHJTT8jwwyDH2iTJgNuh4H
 XjiaEWKSLJoiFHZz5EFiVKyLA8gO+EF4l7FjWCPgTbUMc17C8hzd1WdjRA7uvLePLWUjTpYRtjnd4
 FUxi88QdyDQ8w3EUJ7KM9Vb0DDF1eleRZJrRRr2L0hsG3VlMByO2AnwEAizyY07Cq25vyq9EgtCoS
 CBX+m3ZxLKsZmph14NeSn1RFaiQKZHwFW5p2dfCu/qmc5zEDeQbgDzHSgf4PUSu1Dw9+/h6PpuWcq
 PxB0lEVaa0kTY6sZLGOE2QBV2b0KKHY82KNNhSGbXSuJr8XmMLYQim9FFTkeXY6tSJWBNK5LINS7R
 sTiTvt0Q==;
Date: Fri, 12 Dec 2025 18:54:59 +0100 (CET)
Message-Id: <20251212.185459.1251879850702117427.rene@exactco.de>
To: michel.daenzer@mailbox.org
Cc: tzimmermann@suse.de, tpearson@raptorengineering.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 airlied@redhat.com
Subject: Re: [PATCH] drm/ast: Fix big-endian support
From: =?iso-8859-1?Q?Ren=E9?= Rebe <rene@exactco.de>
In-Reply-To: <c5e4fd12-38d9-4169-88d1-115cc38ca409@mailbox.org>
References: <20251211.153101.411672428832661296.rene@exactco.de>
 <2e26a6e6-6f4b-4b48-8fd0-648372856dce@suse.de>
 <c5e4fd12-38d9-4169-88d1-115cc38ca409@mailbox.org>
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

On Fri, 12 Dec 2025 16:14:37 +0100, Michel Dänzer <michel.daenzer@mailbox.org> wrote:

> On 12/11/25 15:56, Thomas Zimmermann wrote:
> > Am 11.12.25 um 15:31 schrieb René Rebe:
> >> On Thu, 11 Dec 2025 15:03:48 +0100, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> >>
> >>>       /* write checksum + signature */
> >>> +    writel(swab32(csum), dst);
> >>> +    writel(swab32(width), dst + AST_HWC_SIGNATURE_SizeX);
> >>> +    writel(swab32(height), dst + AST_HWC_SIGNATURE_SizeY);
> >>> +    writel(swab32(0), dst + AST_HWC_SIGNATURE_HOTSPOTX);
> >>> +    writel(swab32(0), dst + AST_HWC_SIGNATURE_HOTSPOTY);
> >>> +#else
> >>> +    memcpy_toio(dst, src, AST_HWC_SIZE);
> >>>       dst += AST_HWC_SIZE;
> >>> +
> >>> +    /* write checksum + signature */
> >>>       writel(csum, dst);
> >>>       writel(width, dst + AST_HWC_SIGNATURE_SizeX);
> >>>       writel(height, dst + AST_HWC_SIGNATURE_SizeY);
> >>>       writel(0, dst + AST_HWC_SIGNATURE_HOTSPOTX);
> >>>       writel(0, dst + AST_HWC_SIGNATURE_HOTSPOTY);
> >>> +#endif
> >> I'm pretty sure this will break the cursor, as the position was
> >> working correctly and I only had to swap the cursor image data. The
> >> csum will also not be identical anyway, as the checksum function
> >> computes it in native byte order. Theoretically that would have to be
> >> changed. However, I do not see where it is really used, maybe only
> >> some special remote desktop vendor protocol that I'm not using. Maybe
> >> the exact checksum does not even matter and is only used as
> >> optimization to not resend an unchanged cursor image.
> > 
> > Oh well! I though that the bus does implicit byte swaps? Or does writel() already swap to little endian, which the AST chip expects? I'm confused.
> 
> FWIW, writel indeed converts from native byte order to little endian, see include/asm-generic/io.h.
> 
> Can't help with your other questions though.

It turns out this writes are not uses for VGA out, I suspect this is
only for a RDP thing. The VGA cursor control is in
ast_cursor_plane_helper_atomic_update [1].

I'm testing a final patch without that and will send it ASAP.

Thanks,
	René

[1] https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next/drivers/gpu/drm/ast/ast_cursor.c#L279

-- 
René Rebe, ExactCODE GmbH, Berlin, Germany
https://exactco.de • https://t2linux.com • https://patreon.com/renerebe
