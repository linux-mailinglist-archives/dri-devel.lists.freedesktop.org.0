Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D428A58F4
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 19:17:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14159112724;
	Mon, 15 Apr 2024 17:17:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="s6rN87AU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7528A112724
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 17:17:06 +0000 (UTC)
Received: from [192.168.88.20] (91-154-34-181.elisa-laajakaista.fi
 [91.154.34.181])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 37CE65B2;
 Mon, 15 Apr 2024 19:16:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1713201379;
 bh=4BkJwkl/uYopsa8E8PWG5WHDYPiwLD4WoLbgqd2ThUE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=s6rN87AUn6cOji1XlKyMu6z9FpL2GzwtHGjJAYNKjOrvT335v8CJWrvu1T+SFZi7m
 kEygJwSj86PXuHYxDsWmoh8QlzwbeIW6eQc9APQH1C5Tlnt6Vz1+D+UgjZZaZbWwDI
 yNQPHBEK4g+Q/9xNCd367QWjAh9V7mHrqNUbaZ8E=
Message-ID: <d4cd0323-4792-49b0-a4e2-0bc92068e7f0@ideasonboard.com>
Date: Mon, 15 Apr 2024 20:17:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/2] pmdomain: ti-sci: Support retaining PD boot time
 state
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>, Dave Gerlach <d-gerlach@ti.com>,
 J Keerthy <j-keerthy@ti.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Santosh Shilimkar <santosh.shilimkar@oracle.com>,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Devarsh Thakkar <devarsht@ti.com>
References: <20240415-ti-sci-pd-v1-0-a0e56b8ad897@ideasonboard.com>
 <20240415-ti-sci-pd-v1-2-a0e56b8ad897@ideasonboard.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20240415-ti-sci-pd-v1-2-a0e56b8ad897@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 15/04/2024 19:00, Tomi Valkeinen wrote:
> Add a new flag, TI_SCI_PD_KEEP_BOOT_STATE, which can be set in the dts
> when referring to power domains. When this flag is set, the ti-sci
> driver will check if the PD is currently enabled in the HW, and if so,
> set the GENPD_FLAG_ALWAYS_ON flag so that the PD will stay enabled.
> 
> The main issue I'm trying to solve here is this:
> 
> If the Display Subsystem (DSS) has been enabled by the bootloader, the
> related PD has also been enabled in the HW. When the tidss driver
> probes, the driver framework will automatically enable the PD. While
> executing the probe function it is very common for the probe to return
> EPROBE_DEFER, and, in rarer cases, an actual error. When this happens
> (probe() returns an error), the driver framework will automatically
> disable the related PD.
> 
> Powering off the PD while the DSS is enabled and displaying a picture
> will cause the DSS HW to enter a bad state, from which (afaik) it can't
> be woken up except with full power-cycle. Trying to access the DSS in
> this state (e.g. when retrying the probe) will usually cause the board
> to hang sooner or later.
> 
> Even if we wouldn't have this board-hangs issue, it's nice to be able to
> keep the DSS PD enabled: we want to keep the DSS enabled when the
> bootloader has enabled the screen. If, instead, we disable the PD at the
> first EPROBE_DEFER, the screen will (probably) go black.

A few things occurred to me. The driver is supposed to clear the 
GENPD_FLAG_ALWAYS_ON when the driver has probed successfully. There are 
two possible issues with that:

- Afaics, there's no API to do that, and currently I just clear the bit 
in genpd->flags. There's a clear race there, so some locking would be 
required.

- This uses the GENPD_FLAG_ALWAYS_ON flag to say "PD is always on, until 
the driver has started". If the PD would have GENPD_FLAG_ALWAYS_ON set 
for other reasons, the driver would still go and clear the flag, which 
might break things.

Also, unrelated to the above and not a problem in practice at the very 
moment, but I think clocks should also be dealt with somehow. Something, 
at early-ish boot stage, should mark the relevant clocks as in use, so 
that there's no chance they would be turned off when the main kernel has 
started (the main display driver is often a module).

It would be nice to deal with all the above in a single place. I wonder 
if the tidss driver itself could somehow be split into two parts, an 
early part that would probe with minimal dependencies, mainly to reserve 
the core resources without doing any kind of DRM init. And a main part 
which would (somehow) finish the initialization at a later point, when 
we have the filesystem (for firmware) and the other bridge/panel drivers 
have probed.

That can be somewhat achieved with simplefb or simpledrm, though, but we 
can't do any TI DSS specific things there, and it also creates a 
requirement to have either of those drivers built-in, and the related DT 
nodes to be added.

  Tomi

> Another option here would perhaps be to change the driver framework
> (drivers/base/platform.c) which attaches and detaches the PD, and make
> it somehow optional, allowing the driver the manage the PD. That option
> has two downsides: 1) the driver _has_ to manage the PD, which would
> rule out the use of simplefb and simpledrm, and 2) it would leave the PD
> in off state from Linux's perspective until a driver enables the PD, and
> that might mean that the PD gets actually disabled as part of normal
> system wide power management (disabling unused resources).
> 
> Yet another option would be to do this outside the ti_sci_pm_domains
> driver: a piece of code that would somehow be ran after the
> ti_sci_pm_domains driver has probed (so that we have the PDs), but
> before tidss/simplefb/simpledrm probes. The problem here is the
> "somehow" part. Also, this would partly have the same issue 2) as
> mentioned above.
> 
> TODO: If this approach is ok, sci-pm-domain.yaml needs to be extended.
> Also, it sounds a bit like the cell value is not a bit-mask, so maybe
> adding TI_SCI_PD_KEEP_BOOT_STATE flag this way is not fine.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>   drivers/pmdomain/ti/ti_sci_pm_domains.c    | 27 +++++++++++++++++++++++++--
>   include/dt-bindings/soc/ti,sci_pm_domain.h |  1 +
>   2 files changed, 26 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pmdomain/ti/ti_sci_pm_domains.c b/drivers/pmdomain/ti/ti_sci_pm_domains.c
> index 1510d5ddae3d..b71b390aaa39 100644
> --- a/drivers/pmdomain/ti/ti_sci_pm_domains.c
> +++ b/drivers/pmdomain/ti/ti_sci_pm_domains.c
> @@ -103,7 +103,7 @@ static struct generic_pm_domain *ti_sci_pd_xlate(
>   		return ERR_PTR(-ENOENT);
>   
>   	genpd_to_ti_sci_pd(genpd_data->domains[idx])->exclusive =
> -		genpdspec->args[1];
> +		genpdspec->args[1] & TI_SCI_PD_EXCLUSIVE;
>   
>   	return genpd_data->domains[idx];
>   }
> @@ -161,6 +161,8 @@ static int ti_sci_pm_domain_probe(struct platform_device *pdev)
>   				break;
>   
>   			if (args.args_count >= 1 && args.np == dev->of_node) {
> +				bool is_on = false;
> +
>   				if (args.args[0] > max_id) {
>   					max_id = args.args[0];
>   				} else {
> @@ -189,7 +191,28 @@ static int ti_sci_pm_domain_probe(struct platform_device *pdev)
>   				pd->idx = args.args[0];
>   				pd->parent = pd_provider;
>   
> -				pm_genpd_init(&pd->pd, NULL, true);
> +				/*
> +				 * If TI_SCI_PD_KEEP_BOOT_STATE is set and the
> +				 * PD has been enabled by the bootloader, set
> +				 * the PD to GENPD_FLAG_ALWAYS_ON. This will
> +				 * make sure the PD stays enabled until a driver
> +				 * takes over and clears the GENPD_FLAG_ALWAYS_ON
> +				 * flag.
> +				 */
> +				if (args.args_count > 1 &&
> +				    args.args[1] & TI_SCI_PD_KEEP_BOOT_STATE) {
> +					/*
> +					 * We ignore any error here, and in case
> +					 * of error just assume the PD is off.
> +					 */
> +					pd_provider->ti_sci->ops.dev_ops.is_on(pd_provider->ti_sci,
> +						pd->idx, NULL, &is_on);
> +
> +					if (is_on)
> +						pd->pd.flags |= GENPD_FLAG_ALWAYS_ON;
> +				}
> +
> +				pm_genpd_init(&pd->pd, NULL, !is_on);
>   
>   				list_add(&pd->node, &pd_provider->pd_list);
>   			}
> diff --git a/include/dt-bindings/soc/ti,sci_pm_domain.h b/include/dt-bindings/soc/ti,sci_pm_domain.h
> index 8f2a7360b65e..af610208e3a3 100644
> --- a/include/dt-bindings/soc/ti,sci_pm_domain.h
> +++ b/include/dt-bindings/soc/ti,sci_pm_domain.h
> @@ -3,6 +3,7 @@
>   #ifndef __DT_BINDINGS_TI_SCI_PM_DOMAIN_H
>   #define __DT_BINDINGS_TI_SCI_PM_DOMAIN_H
>   
> +#define TI_SCI_PD_KEEP_BOOT_STATE 2
>   #define TI_SCI_PD_EXCLUSIVE	1
>   #define TI_SCI_PD_SHARED	0
>   
> 

