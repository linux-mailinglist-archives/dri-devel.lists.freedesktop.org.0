Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CAECB9BFC
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 21:15:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D74210E762;
	Fri, 12 Dec 2025 20:15:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=exactco.de header.i=@exactco.de header.b="YEEcu9NZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from exactco.de (exactco.de [176.9.10.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89CB110E762
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Dec 2025 20:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=exactco.de; 
 s=x;
 h=Content-Transfer-Encoding:Content-Type:Mime-Version:References:
 In-Reply-To:From:Subject:Cc:To:Message-Id:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UucJppifjOiw//HWythi43F1s36mikV3pwDQAld9gcs=; b=YEEcu9NZ+ITS4hux4rRPqogfDF
 4F2S0GjqRGkg10sm+v2B8iL8R9I9ZYRPPChbw+mal+DVgQBMgYOP7kmojDD4SSk1duj54taWz4fMg
 ADQ3zkIsUNG8NhlIOKPDYmQ19EuRTBpOK62KUwovffiO8Rxm3lezotuIlbgdn7y0Cw9+/dtAEtMLd
 tvhH037UEAGZpc4xWPxUMkjggdDNcSbasExj+spvauSClzVczhx/ddUusE7ebyQ3PvOYnWRE4PYPk
 noQ/LpMlxe4OIRKrudInsy0t1ZVYSNKTyhFSzyQWKQn8MfsdtbUCQz0Zve8+cZL/If2g3Zlc4Zhvf
 b5LN0vyw==;
Date: Fri, 12 Dec 2025 21:15:58 +0100 (CET)
Message-Id: <20251212.211558.488710050851597114.rene@exactco.de>
To: tzimmermann@suse.de
Cc: tpearson@raptorengineering.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, airlied@redhat.com
Subject: Re: [PATCH] drm/ast: Fix big-endian support
From: =?iso-8859-1?Q?Ren=E9?= Rebe <rene@exactco.de>
In-Reply-To: <20251211.153101.411672428832661296.rene@exactco.de>
References: <20251211.134330.2200695829709887915.rene@exactco.de>
 <3e46c10b-79db-4c11-9047-cd33e94ff5e0@suse.de>
 <20251211.153101.411672428832661296.rene@exactco.de>
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

On Thu, 11 Dec 2025 15:31:01 +0100 (CET), René Rebe <rene@exactco.de> wrote:

> >  	/* write checksum + signature */
> > +	writel(swab32(csum), dst);
> > +	writel(swab32(width), dst + AST_HWC_SIGNATURE_SizeX);
> > +	writel(swab32(height), dst + AST_HWC_SIGNATURE_SizeY);
> > +	writel(swab32(0), dst + AST_HWC_SIGNATURE_HOTSPOTX);
> > +	writel(swab32(0), dst + AST_HWC_SIGNATURE_HOTSPOTY);
> > +#else
> > +	memcpy_toio(dst, src, AST_HWC_SIZE);
> >  	dst += AST_HWC_SIZE;
> > +
> > +	/* write checksum + signature */
> >  	writel(csum, dst);
> >  	writel(width, dst + AST_HWC_SIGNATURE_SizeX);
> >  	writel(height, dst + AST_HWC_SIGNATURE_SizeY);
> >  	writel(0, dst + AST_HWC_SIGNATURE_HOTSPOTX);
> >  	writel(0, dst + AST_HWC_SIGNATURE_HOTSPOTY);
> > +#endif
> 
> I'm pretty sure this will break the cursor, as the position was
> working correctly and I only had to swap the cursor image data. The
> csum will also not be identical anyway, as the checksum function
> computes it in native byte order. Theoretically that would have to be
> changed. However, I do not see where it is really used, maybe only
> some special remote desktop vendor protocol that I'm not using. Maybe
> the exact checksum does not even matter and is only used as
> optimization to not resend an unchanged cursor image.
> 
> I'll send a final version after validating it w/ HW later.

I just sent a more minimally tested V4 removing the superflous unused
fmt_cnv_state to ast_set_cursor_image you somehow had added.

As the additional writen cursor RDP service writes are untested, I
left them out.

There is still something suspect or buggy: the 2-bit X11 cursor is
filled with transparency, while the ARGB RGB channel work now. Modern
ARGB Xcursor theme also look strange. Not sure if that is just due to
loosing 4-bit precision and thus half of the dynamic range with all
the shadows. To me at least the 2-bit transparent X cursor looks like
a fmt conversion bug in some layer that we would need to continue
debugging another day. At least the framebuffer / installer text would
be more readble upstream now, too ;-)

Thanks,
	René

-- 
René Rebe, ExactCODE GmbH, Berlin, Germany
https://exactco.de • https://t2linux.com • https://patreon.com/renerebe
