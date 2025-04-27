Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10CD0A9E427
	for <lists+dri-devel@lfdr.de>; Sun, 27 Apr 2025 20:16:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4DD010E168;
	Sun, 27 Apr 2025 18:16:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="o1oC1KPl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A70B10E168
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Apr 2025 18:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oOp6JjE1KZO09/VU6qzNCwl2fuAmGNH2bQ434dB2dYU=; b=o1oC1KPlAbmycOQ7LS3gkDNs3w
 JUAK0/38O+iluhV1LWJJumki/+TiMwmrv3Uja9NrZIUAookzRIyAZooxqgBms70e8wpv9RPAQBgME
 9Ee5TsvAJnaODl5huGY60rjGElyubm8VUNDJW3hl6n5CUry9xq5U2w7+m464MBDW6FD6BfLrr37u2
 97UCCiy72YOpTIebYn+5hsM/cJEBNbRHCmT05zwLX8byz6qQ2+rJ4XfqnUnpmvyPbBI1PRaBlSbQd
 ZAx0IDFUPtUs8CHgzEdXyFZsaqxOvrEvoGol0TJjv4w0qJIuMc594f+Hf47S56FUJTxwOsThJVnoC
 C32R+Ylw==;
Received: from [189.7.87.174] (helo=[192.168.0.224])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1u96Y2-009Spi-DK; Sun, 27 Apr 2025 20:16:14 +0200
Message-ID: <c3e4e3e6-51b4-4cad-b81f-5841e74ae659@igalia.com>
Date: Sun, 27 Apr 2025 15:16:07 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/v3d: fix client obtained from axi_ids on V3D
 4.1
To: Jose Maria Casanova Crespo <jmcasanova@igalia.com>,
 Melissa Wen <mwen@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com
References: <20250425122522.18425-1-jmcasanova@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20250425122522.18425-1-jmcasanova@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Hi Chema,

On 25/04/25 09:25, Jose Maria Casanova Crespo wrote:
> In the case of MMU errors caused by the TFU unit, the
> client that causes the MMU error is expected to be reported.
> But in the case of MMU TFU errors, a non existing client was
> being reported. This happened because the client calculation
> was taking into account more than the bits 0-7 from the
> axi_id that were representing the client.
> 
> [   27.845132] v3d fec00000.v3d: MMU error from client ? (13) at 0x3bb1000, pte invalid
> 
> Masking the bits and using the correct exi_id ranges fixes the

I changed s/exi_id/axi_id before pushing the patch.

> calculation to report the real guilty client on V3D 4.1 and 4.2.
> 
> Make the MMU error print axi_id with hexadecimal as used in the
> ranges.
> 
> Fixes: 38c2c7917adc ("drm/v3d: Fix and extend MMU error handling.")
> Signed-off-by: Jose Maria Casanova Crespo <jmcasanova@igalia.com>

Applied both patches to misc/kernel.git (drm-misc-next).

Thanks for your patches!

Best Regards,
- Maíra

> ---
>   drivers/gpu/drm/v3d/v3d_irq.c | 37 +++++++++++++++++++++++------------
>   1 file changed, 24 insertions(+), 13 deletions(-)
> 
> Changes in v2:
> - Now axi_id is showed in hexadecimal in error message (Maira Canal)
> - Improved commit log description with error example. (Maira Canal)
> - Fixed typos in commit log (Maira Canal)
> 
> diff --git a/drivers/gpu/drm/v3d/v3d_irq.c b/drivers/gpu/drm/v3d/v3d_irq.c
> index 29f63f572d35..d6ce1324905d 100644
> --- a/drivers/gpu/drm/v3d/v3d_irq.c
> +++ b/drivers/gpu/drm/v3d/v3d_irq.c
> @@ -186,27 +186,38 @@ v3d_hub_irq(int irq, void *arg)
>   		u32 axi_id = V3D_READ(V3D_MMU_VIO_ID);
>   		u64 vio_addr = ((u64)V3D_READ(V3D_MMU_VIO_ADDR) <<
>   				(v3d->va_width - 32));
> -		static const char *const v3d41_axi_ids[] = {
> -			"L2T",
> -			"PTB",
> -			"PSE",
> -			"TLB",
> -			"CLE",
> -			"TFU",
> -			"MMU",
> -			"GMP",
> +		static const struct {
> +			u32 begin;
> +			u32 end;
> +			const char *client;
> +		} v3d41_axi_ids[] = {
> +			{0x00, 0x20, "L2T"},
> +			{0x20, 0x21, "PTB"},
> +			{0x40, 0x41, "PSE"},
> +			{0x60, 0x80, "TLB"},
> +			{0x80, 0x88, "CLE"},
> +			{0xA0, 0xA1, "TFU"},
> +			{0xC0, 0xE0, "MMU"},
> +			{0xE0, 0xE1, "GMP"},
>   		};
>   		const char *client = "?";
>   
>   		V3D_WRITE(V3D_MMU_CTL, V3D_READ(V3D_MMU_CTL));
>   
>   		if (v3d->ver >= V3D_GEN_41) {
> -			axi_id = axi_id >> 5;
> -			if (axi_id < ARRAY_SIZE(v3d41_axi_ids))
> -				client = v3d41_axi_ids[axi_id];
> +			size_t i;
> +
> +			axi_id = axi_id & 0xFF;
> +			for (i = 0; i < ARRAY_SIZE(v3d41_axi_ids); i++) {
> +				if (axi_id >= v3d41_axi_ids[i].begin &&
> +				    axi_id < v3d41_axi_ids[i].end) {
> +					client = v3d41_axi_ids[i].client;
> +					break;
> +				}
> +			}
>   		}
>   
> -		dev_err(v3d->drm.dev, "MMU error from client %s (%d) at 0x%llx%s%s%s\n",
> +		dev_err(v3d->drm.dev, "MMU error from client %s (0x%x) at 0x%llx%s%s%s\n",
>   			client, axi_id, (long long)vio_addr,
>   			((intsts & V3D_HUB_INT_MMU_WRV) ?
>   			 ", write violation" : ""),

