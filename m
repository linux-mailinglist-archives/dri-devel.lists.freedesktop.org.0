Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C87763EC2C
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 10:18:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5B0710E588;
	Thu,  1 Dec 2022 09:18:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF44610E59F
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 09:17:56 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1p0fhX-0005A8-Fd; Thu, 01 Dec 2022 10:17:51 +0100
Message-ID: <cfe79acef967b26b6071ac712b42f28716aa4025.camel@pengutronix.de>
Subject: Re: [PATCH] drm/etnaviv: print MMU exception cause
From: Lucas Stach <l.stach@pengutronix.de>
To: Philipp Zabel <p.zabel@pengutronix.de>, etnaviv@lists.freedesktop.org, 
 Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Thu, 01 Dec 2022 10:17:50 +0100
In-Reply-To: <d5d5ef3c8e4a1ca075ced3af4eeab1da8d86c338.camel@pengutronix.de>
References: <20221130185303.2025810-1-l.stach@pengutronix.de>
 <d5d5ef3c8e4a1ca075ced3af4eeab1da8d86c338.camel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Russell King <linux+etnaviv@armlinux.org.uk>,
 dri-devel@lists.freedesktop.org, kernel@pengutronix.de,
 patchwork-lst@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Philipp,

Am Donnerstag, dem 01.12.2022 um 09:40 +0100 schrieb Philipp Zabel:
> On Mi, 2022-11-30 at 19:53 +0100, Lucas Stach wrote:
> From: Christian Gmeiner <christian.gmeiner@gmail.com>
> 
> The MMU tells us the fault status. While the raw register value is
> already printed, it's a bit more user friendly to translate the
> fault reasons into human readable format.
> 
> Signed-off-by: Christian Gmeiner <christian.gmeiner@gmail.com>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
> I've rewritten parts of the patch to properly cover multiple
> MMUs and squashed the reason into the existing message. Christian,
> please tell me if you are fine with having your name attached to
> this patch.
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 22 +++++++++++++++++++---
>  1 file changed, 19 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> index 37018bc55810..f79203b774d9 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> @@ -1426,6 +1426,15 @@ static void sync_point_worker(struct work_struct *work)
>  
> 
>  static void dump_mmu_fault(struct etnaviv_gpu *gpu)
>  {
> +	static const char *fault_reasons[] = {
> +		"slave not present",
> +		"page not present",
> +		"write violation",
> +		"out of bounds",
> +		"read security violation",
> +		"write security violation",
> +	};
> +
>  	u32 status_reg, status;
>  	int i;
>  
> 
> @@ -1438,18 +1447,25 @@ static void dump_mmu_fault(struct etnaviv_gpu *gpu)
>  	dev_err_ratelimited(gpu->dev, "MMU fault status 0x%08x\n", status);
>  
> 
>  	for (i = 0; i < 4; i++) {
> +		const char *reason = "unknown";
>  		u32 address_reg;
> +		u32 mmu_status;
>  
> 
> -		if (!(status & (VIVS_MMUv2_STATUS_EXCEPTION0__MASK << (i * 4))))
> +		mmu_status = (status >> (i * 4)) & VIVS_MMUv2_STATUS_EXCEPTION0__MASK;
> 
> VIVS_MMUv2_STATUS_EXCEPTION0__MASK is 0x3 ...
> 
> +		if (!mmu_status)
>  			continue;
>  
> 
> +		if ((mmu_status - 1) < ARRAY_SIZE(fault_reasons))
> +			reason = fault_reasons[mmu_status - 1];
> 
Your mail quoting seems to be broken, again.

> ... so (mmu_status - 1) can be 2 at most. This leaves me wondering how
> "out of bounds" and the "security violation" errors can be reached. I
> think this requires the exception bitfield masks to be extended to 0x7.

Good catch! That's a inconsistency in rnndb, where we claim to be able
to stuff the full exception enum into 2 bits. Will fix!

Regards,
Lucas

