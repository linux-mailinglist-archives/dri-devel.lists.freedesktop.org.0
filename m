Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5942D7395
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 11:13:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C949B6ED72;
	Fri, 11 Dec 2020 10:13:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B82A6ED72;
 Fri, 11 Dec 2020 10:13:39 +0000 (UTC)
IronPort-SDR: MzJ5Trzegq3ePm1vhF/uo/Qm09Clx97WBQrNcSZhkG98rza56k8rWH7xvDtG8PXGiufPw8QTEH
 9NkxkRf9T5Zg==
X-IronPort-AV: E=McAfee;i="6000,8403,9831"; a="171845608"
X-IronPort-AV: E=Sophos;i="5.78,411,1599548400"; d="scan'208";a="171845608"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2020 02:13:38 -0800
IronPort-SDR: RsQ7lmI/Ay9vaPccFC88f8JfxCXrqcVSXV/MMPaui8twEB+RtpNdJLZX44RdUN4vBcYtBFso8b
 xcHG9HzNR9pw==
X-IronPort-AV: E=Sophos;i="5.78,411,1599548400"; d="scan'208";a="321689328"
Received: from ynaki-mobl1.ger.corp.intel.com (HELO [10.214.252.46])
 ([10.214.252.46])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2020 02:13:24 -0800
Subject: Re: [patch 14/30] drm/i915/pmu: Replace open coded kstat_irqs() copy
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
References: <20201210192536.118432146@linutronix.de>
 <20201210194043.957046529@linutronix.de>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <ad05af1a-5463-2a80-0887-7629721d6863@linux.intel.com>
Date: Fri, 11 Dec 2020 10:13:21 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201210194043.957046529@linutronix.de>
Content-Language: en-US
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 netdev@vger.kernel.org, Will Deacon <will@kernel.org>,
 Michal Simek <michal.simek@xilinx.com>, linux-s390@vger.kernel.org,
 afzal mohammed <afzal.mohd.ma@gmail.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Dave Jiang <dave.jiang@intel.com>, xen-devel@lists.xenproject.org,
 Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>, Helge Deller <deller@gmx.de>,
 Russell King <linux@armlinux.org.uk>,
 Christian Borntraeger <borntraeger@de.ibm.com>, linux-pci@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
 Wambui Karuga <wambui.karugax@gmail.com>, Allen Hubbe <allenbh@gmail.com>,
 Juergen Gross <jgross@suse.com>, intel-gfx@lists.freedesktop.org,
 linux-gpio@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, David Airlie <airlied@linux.ie>,
 linux-parisc@vger.kernel.org,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, Tariq Toukan <tariqt@nvidia.com>,
 Jon Mason <jdmason@kudzu.us>, linux-ntb@googlegroups.com,
 Saeed Mahameed <saeedm@nvidia.com>, "David S. Miller" <davem@davemloft.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 10/12/2020 19:25, Thomas Gleixner wrote:
> Driver code has no business with the internals of the irq descriptor.
> 
> Aside of that the count is per interrupt line and therefore takes
> interrupts from other devices into account which share the interrupt line
> and are not handled by the graphics driver.
> 
> Replace it with a pmu private count which only counts interrupts which
> originate from the graphics card.
> 
> To avoid atomics or heuristics of some sort make the counter field
> 'unsigned long'. That limits the count to 4e9 on 32bit which is a lot and
> postprocessing can easily deal with the occasional wraparound.

After my failed hasty sketch from last night I had a different one which 
was kind of heuristics based (re-reading the upper dword and retrying if 
it changed on 32-bit). But you are right - it is okay to at least start 
like this today and if later there is a need we can either do that or 
deal with wrap at PMU read time.

So thanks for dealing with it, some small comments below but overall it 
is fine.

> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: intel-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> ---
>   drivers/gpu/drm/i915/i915_irq.c |   34 ++++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/i915/i915_pmu.c |   18 +-----------------
>   drivers/gpu/drm/i915/i915_pmu.h |    8 ++++++++
>   3 files changed, 43 insertions(+), 17 deletions(-)
> 
> --- a/drivers/gpu/drm/i915/i915_irq.c
> +++ b/drivers/gpu/drm/i915/i915_irq.c
> @@ -60,6 +60,24 @@
>    * and related files, but that will be described in separate chapters.
>    */
>   
> +/*
> + * Interrupt statistic for PMU. Increments the counter only if the
> + * interrupt originated from the the GPU so interrupts from a device which
> + * shares the interrupt line are not accounted.
> + */
> +static inline void pmu_irq_stats(struct drm_i915_private *priv,

We never use priv as a local name, it should be either i915 or dev_priv.

> +				 irqreturn_t res)
> +{
> +	if (unlikely(res != IRQ_HANDLED))
> +		return;
> +
> +	/*
> +	 * A clever compiler translates that into INC. A not so clever one
> +	 * should at least prevent store tearing.
> +	 */
> +	WRITE_ONCE(priv->pmu.irq_count, priv->pmu.irq_count + 1);

Curious, probably more educational for me - given x86_32 and x86_64, and 
the context of it getting called, what is the difference from just doing 
irq_count++?

> +}
> +
>   typedef bool (*long_pulse_detect_func)(enum hpd_pin pin, u32 val);
>   
>   static const u32 hpd_ilk[HPD_NUM_PINS] = {
> @@ -1599,6 +1617,8 @@ static irqreturn_t valleyview_irq_handle
>   		valleyview_pipestat_irq_handler(dev_priv, pipe_stats);
>   	} while (0);
>   
> +	pmu_irq_stats(dev_priv, ret);
> +
>   	enable_rpm_wakeref_asserts(&dev_priv->runtime_pm);
>   
>   	return ret;
> @@ -1676,6 +1696,8 @@ static irqreturn_t cherryview_irq_handle
>   		valleyview_pipestat_irq_handler(dev_priv, pipe_stats);
>   	} while (0);
>   
> +	pmu_irq_stats(dev_priv, ret);
> +
>   	enable_rpm_wakeref_asserts(&dev_priv->runtime_pm);
>   
>   	return ret;
> @@ -2103,6 +2125,8 @@ static irqreturn_t ilk_irq_handler(int i
>   	if (sde_ier)
>   		raw_reg_write(regs, SDEIER, sde_ier);
>   
> +	pmu_irq_stats(i915, ret);
> +
>   	/* IRQs are synced during runtime_suspend, we don't require a wakeref */
>   	enable_rpm_wakeref_asserts(&i915->runtime_pm);
>   
> @@ -2419,6 +2443,8 @@ static irqreturn_t gen8_irq_handler(int
>   
>   	gen8_master_intr_enable(regs);
>   
> +	pmu_irq_stats(dev_priv, IRQ_HANDLED);
> +
>   	return IRQ_HANDLED;
>   }
>   
> @@ -2514,6 +2540,8 @@ static __always_inline irqreturn_t
>   
>   	gen11_gu_misc_irq_handler(gt, gu_misc_iir);
>   
> +	pmu_irq_stats(i915, IRQ_HANDLED);
> +
>   	return IRQ_HANDLED;
>   }
>   
> @@ -3688,6 +3716,8 @@ static irqreturn_t i8xx_irq_handler(int
>   		i8xx_pipestat_irq_handler(dev_priv, iir, pipe_stats);
>   	} while (0);
>   
> +	pmu_irq_stats(dev_priv, ret);
> +
>   	enable_rpm_wakeref_asserts(&dev_priv->runtime_pm);
>   
>   	return ret;
> @@ -3796,6 +3826,8 @@ static irqreturn_t i915_irq_handler(int
>   		i915_pipestat_irq_handler(dev_priv, iir, pipe_stats);
>   	} while (0);
>   
> +	pmu_irq_stats(dev_priv, ret);
> +
>   	enable_rpm_wakeref_asserts(&dev_priv->runtime_pm);
>   
>   	return ret;
> @@ -3941,6 +3973,8 @@ static irqreturn_t i965_irq_handler(int
>   		i965_pipestat_irq_handler(dev_priv, iir, pipe_stats);
>   	} while (0);
>   
> +	pmu_irq_stats(dev_priv, IRQ_HANDLED);
> +
>   	enable_rpm_wakeref_asserts(&dev_priv->runtime_pm);
>   
>   	return ret;
> --- a/drivers/gpu/drm/i915/i915_pmu.c
> +++ b/drivers/gpu/drm/i915/i915_pmu.c
> @@ -423,22 +423,6 @@ static enum hrtimer_restart i915_sample(
>   	return HRTIMER_RESTART;
>   }

In this file you can also drop the #include <linux/irq.h> line.

>   
> -static u64 count_interrupts(struct drm_i915_private *i915)
> -{
> -	/* open-coded kstat_irqs() */
> -	struct irq_desc *desc = irq_to_desc(i915->drm.pdev->irq);
> -	u64 sum = 0;
> -	int cpu;
> -
> -	if (!desc || !desc->kstat_irqs)
> -		return 0;
> -
> -	for_each_possible_cpu(cpu)
> -		sum += *per_cpu_ptr(desc->kstat_irqs, cpu);
> -
> -	return sum;
> -}
> -
>   static void i915_pmu_event_destroy(struct perf_event *event)
>   {
>   	struct drm_i915_private *i915 =
> @@ -581,7 +565,7 @@ static u64 __i915_pmu_event_read(struct
>   				   USEC_PER_SEC /* to MHz */);
>   			break;
>   		case I915_PMU_INTERRUPTS:
> -			val = count_interrupts(i915);
> +			val = READ_ONCE(pmu->irq_count);

I guess same curiosity about READ_ONCE like in the increment site.

>   			break;
>   		case I915_PMU_RC6_RESIDENCY:
>   			val = get_rc6(&i915->gt);
> --- a/drivers/gpu/drm/i915/i915_pmu.h
> +++ b/drivers/gpu/drm/i915/i915_pmu.h
> @@ -108,6 +108,14 @@ struct i915_pmu {
>   	 */
>   	ktime_t sleep_last;
>   	/**
> +	 * @irq_count: Number of interrupts
> +	 *
> +	 * Intentionally unsigned long to avoid atomics or heuristics on 32bit.
> +	 * 4e9 interrupts are a lot and postprocessing can really deal with an
> +	 * occasional wraparound easily. It's 32bit after all.
> +	 */
> +	unsigned long irq_count;
> +	/**
>   	 * @events_attr_group: Device events attribute group.
>   	 */
>   	struct attribute_group events_attr_group;
> 

Regards,

Tvrtko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
