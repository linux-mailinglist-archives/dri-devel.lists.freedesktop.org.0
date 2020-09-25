Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D50C92784B7
	for <lists+dri-devel@lfdr.de>; Fri, 25 Sep 2020 12:08:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DF788946E;
	Fri, 25 Sep 2020 10:08:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17C1E882D0
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Sep 2020 10:08:32 +0000 (UTC)
Received: from [2a0a:edc0:0:900:6245:cbff:fea0:1793]
 (helo=kresse.office.stw.pengutronix.de)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1kLkeS-0004eN-W7; Fri, 25 Sep 2020 12:08:29 +0200
Message-ID: <9e6560a23a6b02fd9c041983bf2d843de1f7618e.camel@pengutronix.de>
From: Lucas Stach <l.stach@pengutronix.de>
To: Christian Gmeiner <christian.gmeiner@gmail.com>, 
 linux-kernel@vger.kernel.org
Date: Fri, 25 Sep 2020 12:08:27 +0200
In-Reply-To: <20200814090512.151416-4-christian.gmeiner@gmail.com>
References: <20200814090512.151416-1-christian.gmeiner@gmail.com>
 <20200814090512.151416-4-christian.gmeiner@gmail.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:6245:cbff:fea0:1793
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
 metis.ext.pengutronix.de
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=4.0 tests=AWL,BAYES_00,RDNS_NONE,
 SPF_HELO_NONE,SPF_SOFTFAIL autolearn=no autolearn_force=no
 version=3.4.2
Subject: Re: [PATCH 3/4] drm/etnaviv: add total hi bandwidth perfcounter
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on metis.ext.pengutronix.de)
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
Cc: David Airlie <airlied@linux.ie>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Russell King <linux+etnaviv@armlinux.org.uk>,
 cphealy@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fr, 2020-08-14 at 11:05 +0200, Christian Gmeiner wrote:
> These two perf counters represent the total read and write
> GPU bandwidth in terms of 64bits.
> 
> The used sequence was taken from Vivante kernel driver.
> 
> Signed-off-by: Christian Gmeiner <christian.gmeiner@gmail.com>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_perfmon.c | 35 ++++++++++++++++++++++-
>  1 file changed, 34 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c b/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
> index 782732e6ce72..b37459f022d7 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
> @@ -69,6 +69,29 @@ static u32 pipe_perf_reg_read(struct etnaviv_gpu *gpu,
>  	return value;
>  }
>  
> +static u32 pipe_reg_read(struct etnaviv_gpu *gpu,
> +	const struct etnaviv_pm_domain *domain,
> +	const struct etnaviv_pm_signal *signal)
> +{
> +	u32 clock = gpu_read(gpu, VIVS_HI_CLOCK_CONTROL);
> +	u32 value = 0;
> +	unsigned i;
> +
> +	for (i = 0; i < gpu->identity.pixel_pipes; i++) {
> +		clock &= ~(VIVS_HI_CLOCK_CONTROL_DEBUG_PIXEL_PIPE__MASK);
> +		clock |= VIVS_HI_CLOCK_CONTROL_DEBUG_PIXEL_PIPE(i);
> +		gpu_write(gpu, VIVS_HI_CLOCK_CONTROL, clock);
> +		value += gpu_read(gpu, signal->data);
> +	}
> +
> +	/* switch back to pixel pipe 0 to prevent GPU hang */
> +	clock &= ~(VIVS_HI_CLOCK_CONTROL_DEBUG_PIXEL_PIPE__MASK);
> +	clock |= VIVS_HI_CLOCK_CONTROL_DEBUG_PIXEL_PIPE(0);
> +	gpu_write(gpu, VIVS_HI_CLOCK_CONTROL, clock);
> +
> +	return value;
> +}
> +
>  static u32 hi_total_cycle_read(struct etnaviv_gpu *gpu,
>  	const struct etnaviv_pm_domain *domain,
>  	const struct etnaviv_pm_signal *signal)
> @@ -102,8 +125,18 @@ static const struct etnaviv_pm_domain doms_3d[] = {
>  		.name = "HI",
>  		.profile_read = VIVS_MC_PROFILE_HI_READ,
>  		.profile_config = VIVS_MC_PROFILE_CONFIG2,
> -		.nr_signals = 5,
> +		.nr_signals = 7,

I've tripped across this part. It's something I don't particularly
like, as this value has a risk of getting inconsistent with the actual
array. Maybe we could split out signal array from this initialization,
so we could then use the ARRAY_SIZE macro to initialize this value?

But that's not really related to this patch and can be done in a
follow-up cleanup.

Regards,
Lucas

>  		.signal = (const struct etnaviv_pm_signal[]) {
> +			{
> +				"TOTAL_READ_BYTES8",
> +				VIVS_HI_PROFILE_READ_BYTES8,
> +				&pipe_reg_read,
> +			},
> +			{
> +				"TOTAL_WRITE_BYTES8",
> +				VIVS_HI_PROFILE_WRITE_BYTES8,
> +				&pipe_reg_read,
> +			},
>  			{
>  				"TOTAL_CYCLES",
>  				0,

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
