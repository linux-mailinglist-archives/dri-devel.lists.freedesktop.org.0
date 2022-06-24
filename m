Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E265596F0
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 11:44:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F26E210E04F;
	Fri, 24 Jun 2022 09:44:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5785B10E477
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 09:44:31 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1o4frX-00052V-LX; Fri, 24 Jun 2022 11:44:27 +0200
Message-ID: <2d475e77dca2395ee5b6fcff0e1d3ade2b0a36ef.camel@pengutronix.de>
Subject: Re: [PATCH v2 4/4] drm/etnaviv: export loadavg via perfmon
From: Lucas Stach <l.stach@pengutronix.de>
To: Christian Gmeiner <christian.gmeiner@gmail.com>, 
 linux-kernel@vger.kernel.org
Date: Fri, 24 Jun 2022 11:44:26 +0200
In-Reply-To: <20220621072050.76229-5-christian.gmeiner@gmail.com>
References: <20220621072050.76229-1-christian.gmeiner@gmail.com>
 <20220621072050.76229-5-christian.gmeiner@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
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
Cc: David Airlie <airlied@linux.ie>, "moderated list:DRM DRIVERS FOR VIVANTE
 GPU IP" <etnaviv@lists.freedesktop.org>, "open list:DRM DRIVERS FOR VIVANTE
 GPU IP" <dri-devel@lists.freedesktop.org>,
 Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Dienstag, dem 21.06.2022 um 09:20 +0200 schrieb Christian Gmeiner:
> Make it possible to access the sub-GPU component load value from
> user space with the perfmon infrastructure.
> 
You need to explain a bit more how you intend to use those.

Contrary to all other perfmon values, where we go to great lengths to
only count the load put onto the GPU by the specific process requesting
the perfmon, the loadavg values also include the load caused by other
submits. Due to this difference in behavior I fear that those new
counters might be confusing to use. But maybe you have a use-case in
mind that I don't see right now.

Regards,
Lucas

> Signed-off-by: Christian Gmeiner <christian.gmeiner@gmail.com>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_perfmon.c | 79 +++++++++++++++++++++++
>  1 file changed, 79 insertions(+)
> 
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c b/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
> index bafdfe49c1d8..d65d9af3a74a 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
> @@ -120,6 +120,19 @@ static u32 hi_total_idle_cycle_read(struct etnaviv_gpu *gpu,
>  	return gpu_read(gpu, reg);
>  }
>  
> +static u32 load_read(struct etnaviv_gpu *gpu,
> +	const struct etnaviv_pm_domain *domain,
> +	const struct etnaviv_pm_signal *signal)
> +{
> +	u32 load;
> +
> +	spin_lock_bh(&gpu->loadavg_spinlock);
> +	load = gpu->loadavg_percentage[signal->data];
> +	spin_unlock_bh(&gpu->loadavg_spinlock);
> +
> +	return load;
> +}
> +
>  static const struct etnaviv_pm_domain doms_3d[] = {
>  	{
>  		.name = "HI",
> @@ -419,6 +432,72 @@ static const struct etnaviv_pm_domain doms_3d[] = {
>  				&perf_reg_read
>  			}
>  		}
> +	},
> +	{
> +		.name = "LOAD",
> +		.nr_signals = 12,
> +		.signal = (const struct etnaviv_pm_signal[]) {
> +			{
> +				"FE",
> +				0,
> +				&load_read
> +			},
> +			{
> +				"DE",
> +				1,
> +				&load_read
> +			},
> +			{
> +				"PE",
> +				2,
> +				&load_read
> +			},
> +			{
> +				"SH",
> +				3,
> +				&load_read
> +			},
> +			{
> +				"PA",
> +				4,
> +				&load_read
> +			},
> +			{
> +				"SE",
> +				5,
> +				&load_read
> +			},
> +			{
> +				"RA",
> +				6,
> +				&load_read
> +			},
> +			{
> +				"TX",
> +				7,
> +				&load_read
> +			},
> +			{
> +				"VG",
> +				8,
> +				&load_read
> +			},
> +			{
> +				"IM",
> +				9,
> +				&load_read
> +			},
> +			{
> +				"FP",
> +				10,
> +				&load_read
> +			},
> +			{
> +				"TS",
> +				11,
> +				&load_read
> +			}
> +		}
>  	}
>  };
>  


