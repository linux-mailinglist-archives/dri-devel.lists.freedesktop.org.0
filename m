Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE03DB22854
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 15:26:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDFF910E3E9;
	Tue, 12 Aug 2025 13:26:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RCFcR9DU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8552510E3E9
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 13:26:32 +0000 (UTC)
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id F07AA4A4;
 Tue, 12 Aug 2025 15:25:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1755005138;
 bh=HKTIzEbm9VZ611BJuW1cZTV2wSjQpH8ngXfCgbt7xA0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=RCFcR9DUL7Q4S3Q4CmWLz/cdPGVIamPKLmguDcDQmPyEhrVbdrHuR4mQBfy55zBk4
 YqcJ5mnCBp9wbxZeBsRI1Im/GNFXfaqjn8zqtrxCad0T+Hs5gow9f8TIKMm6SLeYjL
 WLLkOMxaMymNGk5mPzMPAbjmP96xRdXDtlgPhBfg=
Message-ID: <bc31d938-847d-46a5-af1e-29de3ac21504@ideasonboard.com>
Date: Tue, 12 Aug 2025 16:26:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/rcar-du: dsi: Convert register bits to BIT() macro
To: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-renesas-soc@vger.kernel.org
References: <20250608142636.54033-1-marek.vasut+renesas@mailbox.org>
 <20250608142636.54033-2-marek.vasut+renesas@mailbox.org>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <20250608142636.54033-2-marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset=UTF-8
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

Hi,

On 08/06/2025 17:24, Marek Vasut wrote:
> Convert register bits to BIT() macro where applicable. This is done
> automatically using regex 's@(1 << \([0-9]\+\))@BIT(\1)', except for
> two BPP_18 macros which are not bits, but bitfields, and which are
> not modified.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: David Airlie <airlied@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>  .../drm/renesas/rcar-du/rcar_mipi_dsi_regs.h  | 92 +++++++++----------
>  1 file changed, 46 insertions(+), 46 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
> index a6b276f1d6ee..b3e57217ae63 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
> @@ -9,38 +9,38 @@
>  #define __RCAR_MIPI_DSI_REGS_H__
>  
>  #define LINKSR				0x010
> -#define LINKSR_LPBUSY			(1 << 1)
> -#define LINKSR_HSBUSY			(1 << 0)
> +#define LINKSR_LPBUSY			BIT(1)
> +#define LINKSR_HSBUSY			BIT(0)
>  
>  /*
>   * Video Mode Register
>   */
>  #define TXVMSETR			0x180
>  #define TXVMSETR_SYNSEQ_PULSES		(0 << 16)
> -#define TXVMSETR_SYNSEQ_EVENTS		(1 << 16)
> -#define TXVMSETR_VSTPM			(1 << 15)
> -#define TXVMSETR_PIXWDTH		(1 << 8)
> -#define TXVMSETR_VSEN_EN		(1 << 4)
> +#define TXVMSETR_SYNSEQ_EVENTS		BIT(16)
> +#define TXVMSETR_VSTPM			BIT(15)
> +#define TXVMSETR_PIXWDTH		BIT(8)
> +#define TXVMSETR_VSEN_EN		BIT(4)
>  #define TXVMSETR_VSEN_DIS		(0 << 4)
> -#define TXVMSETR_HFPBPEN_EN		(1 << 2)
> +#define TXVMSETR_HFPBPEN_EN		BIT(2)
>  #define TXVMSETR_HFPBPEN_DIS		(0 << 2)
> -#define TXVMSETR_HBPBPEN_EN		(1 << 1)
> +#define TXVMSETR_HBPBPEN_EN		BIT(1)
>  #define TXVMSETR_HBPBPEN_DIS		(0 << 1)
> -#define TXVMSETR_HSABPEN_EN		(1 << 0)
> +#define TXVMSETR_HSABPEN_EN		BIT(0)
>  #define TXVMSETR_HSABPEN_DIS		(0 << 0)
>  
>  #define TXVMCR				0x190
> -#define TXVMCR_VFCLR			(1 << 12)
> -#define TXVMCR_EN_VIDEO			(1 << 0)
> +#define TXVMCR_VFCLR			BIT(12)
> +#define TXVMCR_EN_VIDEO			BIT(0)
>  
>  #define TXVMSR				0x1a0
> -#define TXVMSR_STR			(1 << 16)
> -#define TXVMSR_VFRDY			(1 << 12)
> -#define TXVMSR_ACT			(1 << 8)
> -#define TXVMSR_RDY			(1 << 0)
> +#define TXVMSR_STR			BIT(16)
> +#define TXVMSR_VFRDY			BIT(12)
> +#define TXVMSR_ACT			BIT(8)
> +#define TXVMSR_RDY			BIT(0)
>  
>  #define TXVMSCR				0x1a4
> -#define TXVMSCR_STR			(1 << 16)
> +#define TXVMSCR_STR			BIT(16)
>  
>  #define TXVMPSPHSETR			0x1c0
>  #define TXVMPSPHSETR_DT_RGB16		(0x0e << 16)
> @@ -51,11 +51,11 @@
>  
>  #define TXVMVPRMSET0R			0x1d0
>  #define TXVMVPRMSET0R_HSPOL_HIG		(0 << 17)
> -#define TXVMVPRMSET0R_HSPOL_LOW		(1 << 17)
> +#define TXVMVPRMSET0R_HSPOL_LOW		BIT(17)

I'm not sure about this (and below). We have two defines for the HSPOL,
high and low. If one of them is (x << y), shouldn't the other one be of
that style too?

>  #define TXVMVPRMSET0R_VSPOL_HIG		(0 << 16)
> -#define TXVMVPRMSET0R_VSPOL_LOW		(1 << 16)
> +#define TXVMVPRMSET0R_VSPOL_LOW		BIT(16)
>  #define TXVMVPRMSET0R_CSPC_RGB		(0 << 4)
> -#define TXVMVPRMSET0R_CSPC_YCbCr	(1 << 4)
> +#define TXVMVPRMSET0R_CSPC_YCbCr	BIT(4)

This looks like a value, not a bit.

>  #define TXVMVPRMSET0R_BPP_16		(0 << 0)
>  #define TXVMVPRMSET0R_BPP_18		(1 << 0)
>  #define TXVMVPRMSET0R_BPP_24		(2 << 0)
> @@ -84,21 +84,21 @@
>  #define PPISETR_DLEN_1			(0x3 << 0)
>  #define PPISETR_DLEN_2			(0x7 << 0)
>  #define PPISETR_DLEN_3			(0xf << 0)
> -#define PPISETR_CLEN			(1 << 8)
> +#define PPISETR_CLEN			BIT(8)
>  
>  #define PPICLCR				0x710
> -#define PPICLCR_TXREQHS			(1 << 8)
> -#define PPICLCR_TXULPSEXT		(1 << 1)
> -#define PPICLCR_TXULPSCLK		(1 << 0)
> +#define PPICLCR_TXREQHS			BIT(8)
> +#define PPICLCR_TXULPSEXT		BIT(1)
> +#define PPICLCR_TXULPSCLK		BIT(0)
>  
>  #define PPICLSR				0x720
> -#define PPICLSR_HSTOLP			(1 << 27)
> -#define PPICLSR_TOHS			(1 << 26)
> -#define PPICLSR_STPST			(1 << 0)
> +#define PPICLSR_HSTOLP			BIT(27)
> +#define PPICLSR_TOHS			BIT(26)
> +#define PPICLSR_STPST			BIT(0)
>  
>  #define PPICLSCR			0x724
> -#define PPICLSCR_HSTOLP			(1 << 27)
> -#define PPICLSCR_TOHS			(1 << 26)
> +#define PPICLSCR_HSTOLP			BIT(27)
> +#define PPICLSCR_TOHS			BIT(26)
>  
>  #define PPIDLSR				0x760
>  #define PPIDLSR_STPST			(0xf << 0)
> @@ -107,21 +107,21 @@
>   * Clocks registers
>   */
>  #define LPCLKSET			0x1000
> -#define LPCLKSET_CKEN			(1 << 8)
> +#define LPCLKSET_CKEN			BIT(8)
>  #define LPCLKSET_LPCLKDIV(x)		(((x) & 0x3f) << 0)
>  
>  #define CFGCLKSET			0x1004
> -#define CFGCLKSET_CKEN			(1 << 8)
> +#define CFGCLKSET_CKEN			BIT(8)
>  #define CFGCLKSET_CFGCLKDIV(x)		(((x) & 0x3f) << 0)
>  
>  #define DOTCLKDIV			0x1008
> -#define DOTCLKDIV_CKEN			(1 << 8)
> +#define DOTCLKDIV_CKEN			BIT(8)
>  #define DOTCLKDIV_DOTCLKDIV(x)		(((x) & 0x3f) << 0)
>  
>  #define VCLKSET				0x100c
> -#define VCLKSET_CKEN			(1 << 16)
> +#define VCLKSET_CKEN			BIT(16)
>  #define VCLKSET_COLOR_RGB		(0 << 8)
> -#define VCLKSET_COLOR_YCC		(1 << 8)
> +#define VCLKSET_COLOR_YCC		BIT(8)

And this.

>  #define VCLKSET_DIV_V3U(x)		(((x) & 0x3) << 4)
>  #define VCLKSET_DIV_V4H(x)		(((x) & 0x7) << 4)
>  #define VCLKSET_BPP_16			(0 << 2)
> @@ -131,23 +131,23 @@
>  #define VCLKSET_LANE(x)			(((x) & 0x3) << 0)
>  
>  #define VCLKEN				0x1010
> -#define VCLKEN_CKEN			(1 << 0)
> +#define VCLKEN_CKEN			BIT(0)
>  
>  #define PHYSETUP			0x1014
>  #define PHYSETUP_HSFREQRANGE(x)		(((x) & 0x7f) << 16)
>  #define PHYSETUP_HSFREQRANGE_MASK	(0x7f << 16)
>  #define PHYSETUP_CFGCLKFREQRANGE(x)	(((x) & 0x3f) << 8)
> -#define PHYSETUP_SHUTDOWNZ		(1 << 1)
> -#define PHYSETUP_RSTZ			(1 << 0)
> +#define PHYSETUP_SHUTDOWNZ		BIT(1)
> +#define PHYSETUP_RSTZ			BIT(0)
>  
>  #define CLOCKSET1			0x101c
> -#define CLOCKSET1_LOCK_PHY		(1 << 17)
> -#define CLOCKSET1_CLKSEL		(1 << 8)
> +#define CLOCKSET1_LOCK_PHY		BIT(17)
> +#define CLOCKSET1_CLKSEL		BIT(8)
>  #define CLOCKSET1_CLKINSEL_EXTAL	(0 << 2)
> -#define CLOCKSET1_CLKINSEL_DIG		(1 << 2)
> -#define CLOCKSET1_CLKINSEL_DU		(1 << 3)

And this (although the shift by 3 is confusing with CLOCKSET1_CLKINSEL_DU).

> -#define CLOCKSET1_SHADOW_CLEAR		(1 << 1)
> -#define CLOCKSET1_UPDATEPLL		(1 << 0)
> +#define CLOCKSET1_CLKINSEL_DIG		BIT(2)
> +#define CLOCKSET1_CLKINSEL_DU		BIT(3)
> +#define CLOCKSET1_SHADOW_CLEAR		BIT(1)
> +#define CLOCKSET1_UPDATEPLL		BIT(0)
>  
>  #define CLOCKSET2			0x1020
>  #define CLOCKSET2_M(x)			(((x) & 0xfff) << 16)
> @@ -161,15 +161,15 @@
>  #define CLOCKSET3_GMP_CNTRL(x)		(((x) & 0x3) << 0)
>  
>  #define PHTW				0x1034
> -#define PHTW_DWEN			(1 << 24)
> +#define PHTW_DWEN			BIT(24)
>  #define PHTW_TESTDIN_DATA(x)		(((x) & 0xff) << 16)
> -#define PHTW_CWEN			(1 << 8)
> +#define PHTW_CWEN			BIT(8)
>  #define PHTW_TESTDIN_CODE(x)		(((x) & 0xff) << 0)
>  
>  #define PHTR				0x1038
> -#define PHTR_TEST			(1 << 16)
> +#define PHTR_TEST			BIT(16)
>  
>  #define PHTC				0x103c
> -#define PHTC_TESTCLR			(1 << 0)
> +#define PHTC_TESTCLR			BIT(0)
>  
>  #endif /* __RCAR_MIPI_DSI_REGS_H__ */

