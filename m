Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D70B1212617
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 16:22:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F2C96E931;
	Thu,  2 Jul 2020 14:22:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A303E6E931
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 14:22:39 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200702142237euoutp0190df57de5bcb8be6f7ce9aedb2576975~d9Xxtxg9h0656706567euoutp01Z
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 14:22:37 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200702142237euoutp0190df57de5bcb8be6f7ce9aedb2576975~d9Xxtxg9h0656706567euoutp01Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1593699757;
 bh=0TC9lzz00Pgh6EaeVlIkNMDKfhIwvGXbfBxceN9EuQg=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=nuTws75Mv2MsFBRqaMh4AZan+ZL8nIgpDwbmGZPmp1PHKQ87fSrYiIvCjutZpaDzj
 GGnudedtQsyEswryhqRtgaSYCCvmsG0AMgk0aTW4fJ57cxTytnTp1bvCjsnB2Mf3pM
 r6oL6ikcvB7ZjrFEr++JgBxStIz+KP1eAPTB5Dfc=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200702142237eucas1p210080ddae3369ba308dd5433289470af~d9XxVizwR1429114291eucas1p2J;
 Thu,  2 Jul 2020 14:22:37 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 89.49.05997.DADEDFE5; Thu,  2
 Jul 2020 15:22:37 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200702142237eucas1p16bf2766ac688002ed987f8f1cab44839~d9Xw7fMv92922729227eucas1p1Q;
 Thu,  2 Jul 2020 14:22:37 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200702142237eusmtrp122603335e68892ea1e60cfc453da8b92~d9Xw6SRH92116621166eusmtrp1U;
 Thu,  2 Jul 2020 14:22:37 +0000 (GMT)
X-AuditID: cbfec7f4-677ff7000000176d-2c-5efdedade9de
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id E0.6C.06314.CADEDFE5; Thu,  2
 Jul 2020 15:22:37 +0100 (BST)
Received: from [106.210.85.205] (unknown [106.210.85.205]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200702142235eusmtip1d31189be107d0d70f6d9469db97a285c~d9Xvrsl4H0976009760eusmtip1Y;
 Thu,  2 Jul 2020 14:22:35 +0000 (GMT)
Subject: Re: [PATCH v3] drm/bridge: adv7511: Fix cec clock EPROBE_DEFER
 handling
To: Vincent Whitchurch <vincent.whitchurch@axis.com>,
 narmstrong@baylibre.com, Laurent.pinchart@ideasonboard.com
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <3d908cbc-f892-9c3f-06a7-93f03c7c177b@samsung.com>
Date: Thu, 2 Jul 2020 16:22:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200514113051.3567-1-vincent.whitchurch@axis.com>
Content-Language: pl
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEKsWRmVeSWpSXmKPExsWy7djPc7pr3/6NM/h/Ttbiytf3bBanJj9j
 srj6/SWzxck3V1ksPrWoWnROXMJucagv2uL8Nn8HDo/r6wI83t9oZfeY3TGT1ePEhEtMHve7
 jzN5HOidzOJx6utn9gD2KC6blNSczLLUIn27BK6M3b8OMBf021R8fXOIrYFxt2EXIweHhICJ
 xPu+qC5GLg4hgRWMElff3WaBcL4wSqy6uI8JwvnMKPFk2jpWmI5zL7kg4ssZJQ5/msIK4bxn
 lFiweQ9QByeHsECQxJRrDWwgtohAkcSxnp1gNrNAicTvyX9ZQGw2AU2Jv5tvsoEM5RWwk3i8
 VBskzCKgIrHn0E1GEFtUIE5i/cvtYCN5BQQlTs58wgJSzingIPGw2xJiorzE9rdzmCFsEYkb
 j1rAWiUEjrFLLFnrD2G7SEyaf4MFwhaWeHV8CzuELSNxenIPVLxe4v6KFmaQVyQEOhgltm7Y
 yQyRsJa4c+4X2JnMQCev36UPEXaUWNT7nB0SJHwSN94KQpzAJzFp23RmiDCvREebEES1osT9
 s1uhBopLLL3wlW0Co9IsJH/NQvLMLCTPzELYu4CRZRWjeGppcW56arFRXmq5XnFibnFpXrpe
 cn7uJkZgSjr97/iXHYy7/iQdYhTgYFTi4Z1w/G+cEGtiWXFl7iFGCQ5mJRFep7On44R4UxIr
 q1KL8uOLSnNSiw8xSnOwKInzGi96GSskkJ5YkpqdmlqQWgSTZeLglGpgFJpzmf/TjJ3TJznx
 9/B+f8S7xlbx7bIZRnrCIso8/+Ki+XrtQqTmcZbevvxTSSjWIshMyJE96dn9bb6bTcVuXolf
 VrHCt3lfmUfstE+fZ3JvUnj4M0jO5tMa8bbiuKrq8y4qd3fF3zp87W5OtPr9KXEPV34QEdhr
 6KjIe+S4SsaOHQHBAuEXlViKMxINtZiLihMBhdvQDEUDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRmVeSWpSXmKPExsVy+t/xu7pr3/6NM/i7kMniytf3bBanJj9j
 srj6/SWzxck3V1ksPrWoWnROXMJucagv2uL8Nn8HDo/r6wI83t9oZfeY3TGT1ePEhEtMHve7
 jzN5HOidzOJx6utn9gD2KD2bovzSklSFjPziElulaEMLIz1DSws9IxNLPUNj81grI1MlfTub
 lNSczLLUIn27BL2M3b8OMBf021R8fXOIrYFxt2EXIweHhICJxLmXXF2MXBxCAksZJeZ//sHa
 xcgJFBeX2D3/LTOELSzx51oXG0TRW0aJ9UuWgRUJCwRJTLnWwAZiiwgUSex7cpwdxGYWKJG4
 OOMnE0TDZEaJ/s/XwCaxCWhK/N18kw1kM6+AncTjpdogYRYBFYk9h24ygtiiAnESy7fMB5vD
 KyAocXLmExaQck4BB4mH3ZYQ480k5m1+yAxhy0tsfzsHyhaRuPGohXECo9AsJN2zkLTMQtIy
 C0nLAkaWVYwiqaXFuem5xYZ6xYm5xaV56XrJ+bmbGIGRuO3Yz807GC9tDD7EKMDBqMTDO+H4
 3zgh1sSy4srcQ4wSHMxKIrxOZ0/HCfGmJFZWpRblxxeV5qQWH2I0BfptIrOUaHI+MEnklcQb
 mhqaW1gamhubG5tZKInzdggcjBESSE8sSc1OTS1ILYLpY+LglGpg5DO/X8F/tabL++uMuHYG
 3k3uVs3ikwMFXad7Ol9Xf7RVae71GY+NwgTScyV2XL/cIG+v3GBTXSv6V0abIfLV//eB53rE
 JnhKXdHtK698prH0hcHz52KmHAcaVH8fdzjydtL3RzGz1Vym7019lsbtzliRJrLtVM+G6368
 umyhMhtt3x7hDpRQYinOSDTUYi4qTgQAKpmG2doCAAA=
X-CMS-MailID: 20200702142237eucas1p16bf2766ac688002ed987f8f1cab44839
X-Msg-Generator: CA
X-RootMTR: 20200515065426eucas1p259c666b8e182a12c87e4e0b575b397d0
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200515065426eucas1p259c666b8e182a12c87e4e0b575b397d0
References: <CGME20200515065426eucas1p259c666b8e182a12c87e4e0b575b397d0@eucas1p2.samsung.com>
 <20200514113051.3567-1-vincent.whitchurch@axis.com>
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
Cc: hverkuil@xs4all.nl, jernej.skrabec@siol.net, kernel@axis.com,
 dri-devel@lists.freedesktop.org, jonas@kwiboo.se
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 14.05.2020 13:30, Vincent Whitchurch wrote:
> If adv7511's devm_clk_get() for the cec clock returns -EPROBE_DEFER, we
> end up in an infinite probe loop.  This happens:
>
>   (1) adv7511's probe is called.
>
>   (2) adv7511's probe adds some secondary i2c devices which bind to the
>   dummy driver and thus call driver_deferred_probe_trigger() and
>   increment deferred_trigger_count (see driver_bound()).
>
>   (3) adv7511's probe returns -EPROBE_DEFER, and since the
>   deferred_trigger_count has changed during the probe call,
>   driver_deferred_probe_trigger() is called immediately (see
>   really_probe()) and adv7511's probe is scheduled.
>
>   (4) Goto step 1.
>
> [   61.972915] really_probe: bus: 'i2c': really_probe: probing driver adv7511 with device 0-0039
> [   61.992734] really_probe: bus: 'i2c': really_probe: probing driver dummy with device 0-003f
> [   61.993343] driver_bound: driver: 'dummy': driver_bound: bound to device '0-003f'
> [   61.993626] really_probe: bus: 'i2c': really_probe: bound device 0-003f to driver dummy
> [   61.995604] really_probe: bus: 'i2c': really_probe: probing driver dummy with device 0-0038
> [   61.996381] driver_bound: driver: 'dummy': driver_bound: bound to device '0-0038'
> [   61.996663] really_probe: bus: 'i2c': really_probe: bound device 0-0038 to driver dummy
> [   61.998651] really_probe: bus: 'i2c': really_probe: probing driver dummy with device 0-003c
> [   61.999222] driver_bound: driver: 'dummy': driver_bound: bound to device '0-003c'
> [   61.999496] really_probe: bus: 'i2c': really_probe: bound device 0-003c to driver dummy
> [   62.010050] really_probe: i2c 0-0039: Driver adv7511 requests probe deferral
> [   62.011380] really_probe: bus: 'platform': really_probe: probing driver pwm-clock with device clock-cec
> [   62.012812] really_probe: platform clock-cec: Driver pwm-clock requests probe deferral
> [   62.024679] really_probe: bus: 'i2c': really_probe: probing driver adv7511 with device 0-0039
>
> Fix this by calling devm_clk_get() before registering the secondary
> devices.
>
> Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>
> ---
> v3: Make adv7511_cec_init() return void.
> v2: Add devm_clk_put() in error path.
>
>   drivers/gpu/drm/bridge/adv7511/adv7511.h     |  5 ++-
>   drivers/gpu/drm/bridge/adv7511/adv7511_cec.c | 34 ++++++++------------
>   drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 15 ++++++---
>   3 files changed, 25 insertions(+), 29 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/bridge/adv7511/adv7511.h
> index a9bb734366ae..05a66149b186 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
> @@ -380,17 +380,16 @@ struct adv7511 {
>   };
>   
>   #ifdef CONFIG_DRM_I2C_ADV7511_CEC
> -int adv7511_cec_init(struct device *dev, struct adv7511 *adv7511);
> +void adv7511_cec_init(struct device *dev, struct adv7511 *adv7511);
>   void adv7511_cec_irq_process(struct adv7511 *adv7511, unsigned int irq1);
>   #else
> -static inline int adv7511_cec_init(struct device *dev, struct adv7511 *adv7511)
> +static inline void adv7511_cec_init(struct device *dev, struct adv7511 *adv7511)
>   {
>   	unsigned int offset = adv7511->type == ADV7533 ?
>   						ADV7533_REG_CEC_OFFSET : 0;
>   
>   	regmap_write(adv7511->regmap, ADV7511_REG_CEC_CTRL + offset,
>   		     ADV7511_CEC_CTRL_POWER_DOWN);
> -	return 0;
>   }
>   #endif
>   
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c b/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c
> index a20a45c0b353..ee0ed4fb67c1 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c
> @@ -286,28 +286,17 @@ static const struct cec_adap_ops adv7511_cec_adap_ops = {
>   	.adap_transmit = adv7511_cec_adap_transmit,
>   };
>   
> -static int adv7511_cec_parse_dt(struct device *dev, struct adv7511 *adv7511)
> -{
> -	adv7511->cec_clk = devm_clk_get(dev, "cec");
> -	if (IS_ERR(adv7511->cec_clk)) {
> -		int ret = PTR_ERR(adv7511->cec_clk);
> -
> -		adv7511->cec_clk = NULL;
> -		return ret;
> -	}
> -	clk_prepare_enable(adv7511->cec_clk);
> -	adv7511->cec_clk_freq = clk_get_rate(adv7511->cec_clk);
> -	return 0;
> -}
> -
> -int adv7511_cec_init(struct device *dev, struct adv7511 *adv7511)
> +void adv7511_cec_init(struct device *dev, struct adv7511 *adv7511)
>   {
>   	unsigned int offset = adv7511->type == ADV7533 ?
>   						ADV7533_REG_CEC_OFFSET : 0;
> -	int ret = adv7511_cec_parse_dt(dev, adv7511);
> +	int ret;
>   
> -	if (ret)
> -		goto err_cec_parse_dt;
> +	if (!adv7511->cec_clk)
> +		goto err_cec_no_clock;
> +
> +	clk_prepare_enable(adv7511->cec_clk);
> +	adv7511->cec_clk_freq = clk_get_rate(adv7511->cec_clk);
>   
>   	adv7511->cec_adap = cec_allocate_adapter(&adv7511_cec_adap_ops,
>   		adv7511, dev_name(dev), CEC_CAP_DEFAULTS, ADV7511_MAX_ADDRS);
> @@ -334,7 +323,7 @@ int adv7511_cec_init(struct device *dev, struct adv7511 *adv7511)
>   	ret = cec_register_adapter(adv7511->cec_adap, dev);
>   	if (ret)
>   		goto err_cec_register;
> -	return 0;
> +	return;
>   
>   err_cec_register:
>   	cec_delete_adapter(adv7511->cec_adap);
> @@ -342,8 +331,11 @@ int adv7511_cec_init(struct device *dev, struct adv7511 *adv7511)
>   err_cec_alloc:
>   	dev_info(dev, "Initializing CEC failed with error %d, disabling CEC\n",
>   		 ret);
> -err_cec_parse_dt:
> +	clk_disable_unprepare(adv7511->cec_clk);
> +	devm_clk_put(dev, adv7511->cec_clk);
> +	/* Ensure that adv7511_remove() doesn't attempt to disable it again. */
> +	adv7511->cec_clk = NULL;

Are you sure these three lines above are necessary? devm mechanism 
should free the clock and with failed probe remove should not be called.

Beside this:

Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>


Regards

Andrzej



> +err_cec_no_clock:
>   	regmap_write(adv7511->regmap, ADV7511_REG_CEC_CTRL + offset,
>   		     ADV7511_CEC_CTRL_POWER_DOWN);
> -	return ret == -EPROBE_DEFER ? ret : 0;
>   }
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> index 87b58c1acff4..8d8df6116082 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -1128,6 +1128,15 @@ static int adv7511_probe(struct i2c_client *i2c, const struct i2c_device_id *id)
>   	if (ret)
>   		return ret;
>   
> +	adv7511->cec_clk = devm_clk_get(dev, "cec");
> +	if (IS_ERR(adv7511->cec_clk)) {
> +		ret = PTR_ERR(adv7511->cec_clk);
> +		if (ret == -EPROBE_DEFER)
> +			return ret;
> +
> +		adv7511->cec_clk = NULL;
> +	}
> +
>   	ret = adv7511_init_regulators(adv7511);
>   	if (ret) {
>   		dev_err(dev, "failed to init regulators\n");
> @@ -1218,9 +1227,7 @@ static int adv7511_probe(struct i2c_client *i2c, const struct i2c_device_id *id)
>   	if (adv7511->type == ADV7511)
>   		adv7511_set_link_config(adv7511, &link_config);
>   
> -	ret = adv7511_cec_init(dev, adv7511);
> -	if (ret)
> -		goto err_unregister_cec;
> +	adv7511_cec_init(dev, adv7511);
>   
>   	adv7511->bridge.funcs = &adv7511_bridge_funcs;
>   	adv7511->bridge.of_node = dev->of_node;
> @@ -1232,8 +1239,6 @@ static int adv7511_probe(struct i2c_client *i2c, const struct i2c_device_id *id)
>   
>   err_unregister_cec:
>   	i2c_unregister_device(adv7511->i2c_cec);
> -	if (adv7511->cec_clk)
> -		clk_disable_unprepare(adv7511->cec_clk);
>   err_i2c_unregister_packet:
>   	i2c_unregister_device(adv7511->i2c_packet);
>   err_i2c_unregister_edid:
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
