Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yI4yA6CZc2nNxQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 16:54:08 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5245D78029
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 16:54:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2CD610EB1B;
	Fri, 23 Jan 2026 15:54:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="axQ51w+d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0320C10EB1B
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 15:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dW9/0tBN5jAvwYtpDYY7p1ibxUc8E72Y4HQJ/Y/HtFs=; b=axQ51w+dnX1yxIL8Yt8kdtOWYw
 EaIbsLhSoM1OMip7WP80sa9bxArnL3poTkjBeucDjj2u1dYqXfoYcuYk1nKf2pa+yEY3WghpgKAiF
 Pf8mrt1gPUkT9FfJZptXMOgsvXhhp2zw+wwnPGinvGKZzUEBQvDRVqAx3/BS1K8CKz18LWI1DgmtD
 5NWk1Q9ysAXkxteVfmfXF5wka2z8Jzc+mr+ih4I8DH4iU1mq5ybHQQTWedetCV3rxUrOYOiFZCMQ0
 rMiLAJMokIXiI0WHl6D7C87GKsHWvnLLEqQqWgdBVRcTX5GB2mkePJXoi+TifHnwaY95zyW+v0EEA
 2vALT8GQ==;
Received: from [189.89.57.42] (helo=[192.168.18.14])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vjJTr-008xc2-0o; Fri, 23 Jan 2026 16:53:51 +0100
Message-ID: <b652e476-af2f-4af7-aa95-3b987f6e1bde@igalia.com>
Date: Fri, 23 Jan 2026 12:53:45 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] drm/v3d: Allocate all resources before enabling
 the clock
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Stefan Wahren <wahrenst@gmx.net>, Maxime Ripard <mripard@kernel.org>,
 Iago Toral Quiroga <itoral@igalia.com>,
 Chema Casanova <jmcasanova@igalia.com>, Dom Cobley <popcornmix@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, kernel-dev@igalia.com
References: <20260116-v3d-power-management-v3-0-4e1874e81dd6@igalia.com>
 <20260116-v3d-power-management-v3-3-4e1874e81dd6@igalia.com>
Content-Language: en-US
From: Melissa Wen <mwen@igalia.com>
In-Reply-To: <20260116-v3d-power-management-v3-3-4e1874e81dd6@igalia.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.49 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:mcanal@igalia.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:nsaenz@kernel.org,m:florian.fainelli@broadcom.com,m:wahrenst@gmx.net,m:mripard@kernel.org,m:itoral@igalia.com,m:jmcasanova@igalia.com,m:popcornmix@gmail.com,m:dave.stevenson@raspberrypi.com,m:p.zabel@pengutronix.de,m:linux-clk@vger.kernel.org,m:linux-rpi-kernel@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:bcm-kernel-feedback-list@broadcom.com,m:kernel-dev@igalia.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[igalia.com,baylibre.com,kernel.org,broadcom.com,gmx.net,gmail.com,raspberrypi.com,pengutronix.de];
	FORGED_SENDER(0.00)[mwen@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[mwen@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	NEURAL_HAM(-0.00)[-0.193];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,igalia.com:mid,igalia.com:email,pengutronix.de:email]
X-Rspamd-Queue-Id: 5245D78029
X-Rspamd-Action: no action



On 16/01/2026 17:19, Maíra Canal wrote:
> Move all resource allocation operations before actually enabling the
> clock, as those operations don't require the GPU to be powered on.
What are the benefits of doing it?
>
> While here, use devm_reset_control_get_optional_exclusive() instead of
> open-code it.
Overall LGTM. But I think this patch could be split into smaller units.
Maybe something like:
1. remove open-coded part
2. split gem resource allocation from initialization
3. move all resource allocation

Melissa

>
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
>   drivers/gpu/drm/v3d/v3d_drv.c | 93 +++++++++++++++++++++----------------------
>   drivers/gpu/drm/v3d/v3d_drv.h |  3 +-
>   drivers/gpu/drm/v3d/v3d_gem.c | 14 +++++--
>   drivers/gpu/drm/v3d/v3d_irq.c | 15 +++----
>   4 files changed, 64 insertions(+), 61 deletions(-)
>
> diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
> index a11ca276061a8462977ed3d837ffcc96b2f444f6..cb12d17cce2bf9e49432e3d3dddef1afdc4d93a0 100644
> --- a/drivers/gpu/drm/v3d/v3d_drv.c
> +++ b/drivers/gpu/drm/v3d/v3d_drv.c
> @@ -360,14 +360,50 @@ static int v3d_platform_drm_probe(struct platform_device *pdev)
>   			return ret;
>   	}
>   
> +	if (v3d->ver < V3D_GEN_41) {
> +		ret = map_regs(v3d, &v3d->gca_regs, "gca");
> +		if (ret)
> +			return ret;
> +	}
> +
> +	v3d->reset = devm_reset_control_get_optional_exclusive(dev, NULL);
> +	if (IS_ERR(v3d->reset))
> +		return dev_err_probe(dev, PTR_ERR(v3d->reset),
> +				     "Failed to get reset control\n");
> +
> +	if (!v3d->reset) {
> +		ret = map_regs(v3d, &v3d->bridge_regs, "bridge");
> +		if (ret) {
> +			dev_err(dev, "Failed to get bridge registers\n");
> +			return ret;
> +		}
> +	}
> +
>   	v3d->clk = devm_clk_get_optional(dev, NULL);
>   	if (IS_ERR(v3d->clk))
>   		return dev_err_probe(dev, PTR_ERR(v3d->clk), "Failed to get V3D clock\n");
>   
> +	ret = v3d_irq_init(v3d);
> +	if (ret)
> +		return ret;
> +
> +	v3d_perfmon_init(v3d);
> +
> +	v3d->mmu_scratch = dma_alloc_wc(dev, 4096, &v3d->mmu_scratch_paddr,
> +					GFP_KERNEL | __GFP_NOWARN | __GFP_ZERO);
> +	if (!v3d->mmu_scratch) {
> +		dev_err(dev, "Failed to allocate MMU scratch page\n");
> +		return -ENOMEM;
> +	}
> +
> +	ret = v3d_gem_allocate(drm);
> +	if (ret)
> +		goto dma_free;
> +
>   	ret = clk_prepare_enable(v3d->clk);
>   	if (ret) {
>   		dev_err(&pdev->dev, "Couldn't enable the V3D clock\n");
> -		return ret;
> +		goto gem_destroy;
>   	}
>   
>   	v3d_idle_sms(v3d);
> @@ -396,45 +432,8 @@ static int v3d_platform_drm_probe(struct platform_device *pdev)
>   	ident3 = V3D_READ(V3D_HUB_IDENT3);
>   	v3d->rev = V3D_GET_FIELD(ident3, V3D_HUB_IDENT3_IPREV);
>   
> -	v3d_perfmon_init(v3d);
> -
> -	v3d->reset = devm_reset_control_get_exclusive(dev, NULL);
> -	if (IS_ERR(v3d->reset)) {
> -		ret = PTR_ERR(v3d->reset);
> -
> -		if (ret == -EPROBE_DEFER)
> -			goto clk_disable;
> -
> -		v3d->reset = NULL;
> -		ret = map_regs(v3d, &v3d->bridge_regs, "bridge");
> -		if (ret) {
> -			dev_err(dev,
> -				"Failed to get reset control or bridge regs\n");
> -			goto clk_disable;
> -		}
> -	}
> -
> -	if (v3d->ver < V3D_GEN_41) {
> -		ret = map_regs(v3d, &v3d->gca_regs, "gca");
> -		if (ret)
> -			goto clk_disable;
> -	}
> -
> -	v3d->mmu_scratch = dma_alloc_wc(dev, 4096, &v3d->mmu_scratch_paddr,
> -					GFP_KERNEL | __GFP_NOWARN | __GFP_ZERO);
> -	if (!v3d->mmu_scratch) {
> -		dev_err(dev, "Failed to allocate MMU scratch page\n");
> -		ret = -ENOMEM;
> -		goto clk_disable;
> -	}
> -
> -	ret = v3d_gem_init(drm);
> -	if (ret)
> -		goto dma_free;
> -
> -	ret = v3d_irq_init(v3d);
> -	if (ret)
> -		goto gem_destroy;
> +	v3d_gem_init(drm);
> +	v3d_irq_enable(v3d);
>   
>   	ret = drm_dev_register(drm, 0);
>   	if (ret)
> @@ -450,12 +449,13 @@ static int v3d_platform_drm_probe(struct platform_device *pdev)
>   	drm_dev_unregister(drm);
>   irq_disable:
>   	v3d_irq_disable(v3d);
> +clk_disable:
> +	v3d_power_off_sms(v3d);
> +	clk_disable_unprepare(v3d->clk);
>   gem_destroy:
>   	v3d_gem_destroy(drm);
>   dma_free:
>   	dma_free_wc(dev, 4096, v3d->mmu_scratch, v3d->mmu_scratch_paddr);
> -clk_disable:
> -	clk_disable_unprepare(v3d->clk);
>   	return ret;
>   }
>   
> @@ -469,14 +469,13 @@ static void v3d_platform_drm_remove(struct platform_device *pdev)
>   
>   	drm_dev_unregister(drm);
>   
> -	v3d_gem_destroy(drm);
> -
> -	dma_free_wc(v3d->drm.dev, 4096, v3d->mmu_scratch,
> -		    v3d->mmu_scratch_paddr);
> -
>   	v3d_power_off_sms(v3d);
>   
>   	clk_disable_unprepare(v3d->clk);
> +
> +	v3d_gem_destroy(drm);
> +
> +	dma_free_wc(dev, 4096, v3d->mmu_scratch, v3d->mmu_scratch_paddr);
>   }
>   
>   static struct platform_driver v3d_platform_driver = {
> diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
> index 99a39329bb85b10aec990ea1c7ad2a780a6dad07..738a09351c306db33078db1e053cd133d55d2138 100644
> --- a/drivers/gpu/drm/v3d/v3d_drv.h
> +++ b/drivers/gpu/drm/v3d/v3d_drv.h
> @@ -565,7 +565,8 @@ struct dma_fence *v3d_fence_create(struct v3d_dev *v3d, enum v3d_queue q);
>   
>   /* v3d_gem.c */
>   extern bool super_pages;
> -int v3d_gem_init(struct drm_device *dev);
> +int v3d_gem_allocate(struct drm_device *dev);
> +void v3d_gem_init(struct drm_device *dev);
>   void v3d_gem_destroy(struct drm_device *dev);
>   void v3d_reset_sms(struct v3d_dev *v3d);
>   void v3d_reset(struct v3d_dev *v3d);
> diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
> index 697b0b3ca92cf8f4cc7910a2a7b01ea43c79fe11..1f532030c3883257810877c75da38636bf25f58e 100644
> --- a/drivers/gpu/drm/v3d/v3d_gem.c
> +++ b/drivers/gpu/drm/v3d/v3d_gem.c
> @@ -278,7 +278,7 @@ v3d_huge_mnt_init(struct v3d_dev *v3d)
>   }
>   
>   int
> -v3d_gem_init(struct drm_device *dev)
> +v3d_gem_allocate(struct drm_device *dev)
>   {
>   	struct v3d_dev *v3d = to_v3d_dev(dev);
>   	u32 pt_size = 4096 * 1024;
> @@ -325,9 +325,6 @@ v3d_gem_init(struct drm_device *dev)
>   		return -ENOMEM;
>   	}
>   
> -	v3d_init_hw_state(v3d);
> -	v3d_mmu_set_page_table(v3d);
> -
>   	v3d_huge_mnt_init(v3d);
>   
>   	ret = v3d_sched_init(v3d);
> @@ -341,6 +338,15 @@ v3d_gem_init(struct drm_device *dev)
>   	return 0;
>   }
>   
> +void
> +v3d_gem_init(struct drm_device *dev)
> +{
> +	struct v3d_dev *v3d = to_v3d_dev(dev);
> +
> +	v3d_init_hw_state(v3d);
> +	v3d_mmu_set_page_table(v3d);
> +}
> +
>   void
>   v3d_gem_destroy(struct drm_device *dev)
>   {
> diff --git a/drivers/gpu/drm/v3d/v3d_irq.c b/drivers/gpu/drm/v3d/v3d_irq.c
> index b55880fd6c508bd47a27c15db3fd8d21ded2dbd1..b901d416c9d6145f7b162cdeadc40e67e75fdffb 100644
> --- a/drivers/gpu/drm/v3d/v3d_irq.c
> +++ b/drivers/gpu/drm/v3d/v3d_irq.c
> @@ -248,17 +248,10 @@ v3d_hub_irq(int irq, void *arg)
>   int
>   v3d_irq_init(struct v3d_dev *v3d)
>   {
> -	int irq, ret, core;
> +	int irq, ret;
>   
>   	INIT_WORK(&v3d->overflow_mem_work, v3d_overflow_mem_work);
>   
> -	/* Clear any pending interrupts someone might have left around
> -	 * for us.
> -	 */
> -	for (core = 0; core < v3d->cores; core++)
> -		V3D_CORE_WRITE(core, V3D_CTL_INT_CLR, V3D_CORE_IRQS(v3d->ver));
> -	V3D_WRITE(V3D_HUB_INT_CLR, V3D_HUB_IRQS(v3d->ver));
> -
>   	irq = platform_get_irq_optional(v3d_to_pdev(v3d), 1);
>   	if (irq == -EPROBE_DEFER)
>   		return irq;
> @@ -296,7 +289,6 @@ v3d_irq_init(struct v3d_dev *v3d)
>   			goto fail;
>   	}
>   
> -	v3d_irq_enable(v3d);
>   	return 0;
>   
>   fail:
> @@ -310,6 +302,11 @@ v3d_irq_enable(struct v3d_dev *v3d)
>   {
>   	int core;
>   
> +	/* Clear any pending interrupts someone might have left around for us. */
> +	for (core = 0; core < v3d->cores; core++)
> +		V3D_CORE_WRITE(core, V3D_CTL_INT_CLR, V3D_CORE_IRQS(v3d->ver));
> +	V3D_WRITE(V3D_HUB_INT_CLR, V3D_HUB_IRQS(v3d->ver));
> +
>   	/* Enable our set of interrupts, masking out any others. */
>   	for (core = 0; core < v3d->cores; core++) {
>   		V3D_CORE_WRITE(core, V3D_CTL_INT_MSK_SET, ~V3D_CORE_IRQS(v3d->ver));
>

