Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECC79C1C76
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2024 12:54:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E249D10E249;
	Fri,  8 Nov 2024 11:54:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6650210E249
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2024 11:54:03 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 94034339;
 Fri,  8 Nov 2024 03:54:32 -0800 (PST)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 678283F528;
 Fri,  8 Nov 2024 03:54:00 -0800 (PST)
Date: Fri, 8 Nov 2024 11:53:57 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: John Watts <contact@jookia.org>
Cc: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Samuel Holland <samuel@sholland.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/sun4i: Workaround TCON TOP conflict between DE0 and
 DE1
Message-ID: <20241108115357.691b77b0@donnerap.manchester.arm.com>
In-Reply-To: <20241108-tcon_fix-v1-1-616218cc0d5f@jookia.org>
References: <20241108-tcon_fix-v1-1-616218cc0d5f@jookia.org>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Fri, 08 Nov 2024 12:40:16 +1100
John Watts <contact@jookia.org> wrote:

Hi John,

thanks for taking care and sending a patch!

> On the D1 and T113 the TCON TOP cannot handle setting both DEs to a
> single output, even if the outputs are disabled. As a workaround assign
> DE1 to TVE0 by default.

Can you say *why* this patch is needed? Is there something broken that
needs fixing? Where does this show and why wasn't this a problem before?

> A full fix for this would include logic that makes sure both DEs never
> share the same output.

To be honest, given the isolation on this patch, I'd rather wait for this
full fledged solution, especially if there is no pressing need (see above).

> Signed-off-by: John Watts <contact@jookia.org>
> ---
>  drivers/gpu/drm/sun4i/sun8i_tcon_top.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/sun4i/sun8i_tcon_top.c b/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
> index a1ca3916f42bcc63b9ac7643e788d962ef360ca8..543311ffb1509face3fbfd069ded10933f254b9d 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
> @@ -179,7 +179,7 @@ static int sun8i_tcon_top_bind(struct device *dev, struct device *master,
>  	 * At least on H6, some registers have some bits set by default
>  	 * which may cause issues. Clear them here.
>  	 */
> -	writel(0, regs + TCON_TOP_PORT_SEL_REG);
> +	writel(0x20, regs + TCON_TOP_PORT_SEL_REG);

Sorry, but that looks weird:
First, please explain the 0x20. Is it bit 5? If yes, what does that bit
mean? The commit message suggests you know that?

And second: the comment above clearly states that those two writes just
*clear* some registers, to have some sane base line. So please adjust this
comment, and copy in some of the rationale from the commit message.
Explaining things in the commit message is good (so thanks for that!), but
having at least some terse technical explanations near the code, in a
comment, is better.

Cheers,
Andre

>  	writel(0, regs + TCON_TOP_GATE_SRC_REG);
>  
>  	/*
> 
> ---
> base-commit: 98f7e32f20d28ec452afb208f9cffc08448a2652
> change-id: 20241108-tcon_fix-f0585ac9bae0
> 
> Best regards,

