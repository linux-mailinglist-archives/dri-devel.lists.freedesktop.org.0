Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5590A5814FB
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 16:19:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EA448B17C;
	Tue, 26 Jul 2022 14:19:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ACE48AF18
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 14:19:56 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 995428407F;
 Tue, 26 Jul 2022 16:19:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1658845194;
 bh=8/sQ6HvH7LnfuskkqhftSoL4fQ2nzDeejxmnGOBdHl8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=xQ9E4lcfoDHDdF2+S/cyiqQMMhwvsWDrqDK1BW87gxZDgkB/JGirNmghQOiECRT/1
 N+nulWSq2kXuH97XbvCzGWEp2bOVLOXxCAuiyor1yEFXYY1sjS+NhJFOwc8Xnv55rg
 /SdHjt/JwRVYbkBf3aEBifEk0KRNBiVCqfHhADc8q5vgJ1suR7zlbMLPbI34dQVvT1
 T3or4ZJ9y8A9901l3ahCd4Doe7boArGuOGrYYBmSjd8q9d00A8Jgrz0VWaBxgVyYg/
 S+ZEw9wF8cAF63Ue2UXkBbE3gRCokkW7tdvxbx25wuKSqKXfn0e5U4L5gTVIBySP8T
 0Ll/5O1x8O1IQ==
Message-ID: <28dc6dfd-08a2-a207-4644-074fb7fee2f1@denx.de>
Date: Tue, 26 Jul 2022 16:19:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] drm: lcdif: change burst size to 256B
Content-Language: en-US
To: Marco Felsch <m.felsch@pengutronix.de>, stefan@agner.ch,
 airlied@linux.ie, daniel@ffwll.ch, sam@ravnborg.org
References: <20220726094302.2859456-1-m.felsch@pengutronix.de>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20220726094302.2859456-1-m.felsch@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: dri-devel@lists.freedesktop.org, linux-imx@nxp.com, kernel@pengutronix.de,
 Liu Ying <victor.liu@oss.nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/26/22 11:43, Marco Felsch wrote:
> FIFO underruns are seen if a AXI bus master with a higher priority do a
> lot of memory access. Increase the burst size to 256B to avoid such
> underruns and to improve the memory access efficiency.

Sigh, this again ...

> diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> index 1bec1279c8b5..1f22ea5896d5 100644
> --- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> +++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> @@ -143,8 +143,20 @@ static void lcdif_set_mode(struct lcdif_drm_private *lcdif, u32 bus_flags)
>   	       CTRLDESCL0_1_WIDTH(m->crtc_hdisplay),
>   	       lcdif->base + LCDC_V8_CTRLDESCL0_1);
>   
> -	writel(CTRLDESCL0_3_PITCH(lcdif->crtc.primary->state->fb->pitches[0]),
> -	       lcdif->base + LCDC_V8_CTRLDESCL0_3);
> +	/*
> +	 * Undocumented P_SIZE and T_SIZE bit fields but according the
> +	 * downstream kernel they control the AXI burst size. As of now there
> +	 * are two known values:
> +	 *  1 - 128Byte
> +	 *  2 - 256Byte
> +	 *
> +	 * Downstream has set the burst size to 256Byte to improve the memory
> +	 * efficiency so set it here too. This also reduces the FIFO underrun
> +	 * possibility.
> +	 */
> +	ctrl = CTRLDESCL0_3_P_SIZE(2) | CTRLDESCL0_3_T_SIZE(2) |
> +	       CTRLDESCL0_3_PITCH(lcdif->crtc.primary->state->fb->pitches[0]);
> +	writel(ctrl, lcdif->base + LCDC_V8_CTRLDESCL0_3);
>   }

Sometimes I wonder whether this might be some successor of MXSFB 
LCDIF_CTRL2n OUTSTANDING_REQS and BURST_LEN_B fields.

+CC Liu, who seems to have a lot of knowledge about this IP.

Reviewed-by: Marek Vasut <marex@denx.de>
