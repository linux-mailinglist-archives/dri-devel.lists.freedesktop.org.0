Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 474E12D7324
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 10:54:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 536F36ED0F;
	Fri, 11 Dec 2020 09:54:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D89DD6ED0F;
 Fri, 11 Dec 2020 09:54:23 +0000 (UTC)
IronPort-SDR: R4NDtCItVT4Xjr+gtk1GOD6T9+rTOQdgkT/J8ZnUzKDfEgTRKi+FltGZlXIgHrMg90uhxhq7U5
 GvLl/7OcKzoQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9831"; a="154215757"
X-IronPort-AV: E=Sophos;i="5.78,411,1599548400"; d="scan'208";a="154215757"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2020 01:54:23 -0800
IronPort-SDR: /ufv3vGNGQifQf4WI2wmyr1gYEo9JLcct/eEa85fh974wAfL2ugGQDoLz9o6bLFhFYPLXeOH+B
 J5isAR9V2pBA==
X-IronPort-AV: E=Sophos;i="5.78,411,1599548400"; d="scan'208";a="333982962"
Received: from dkreft-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.158.206])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2020 01:54:06 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [patch 14/30] drm/i915/pmu: Replace open coded kstat_irqs() copy
In-Reply-To: <20201210194043.957046529@linutronix.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20201210192536.118432146@linutronix.de>
 <20201210194043.957046529@linutronix.de>
Date: Fri, 11 Dec 2020 11:54:03 +0200
Message-ID: <87wnxo7jno.fsf@intel.com>
MIME-Version: 1.0
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
 Chris Wilson <chris@chris-wilson.co.uk>, "James
 E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, netdev@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Will Deacon <will@kernel.org>,
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
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, linux-parisc@vger.kernel.org,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, Tariq Toukan <tariqt@nvidia.com>,
 Jon Mason <jdmason@kudzu.us>, linux-ntb@googlegroups.com,
 Saeed Mahameed <saeedm@nvidia.com>, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 10 Dec 2020, Thomas Gleixner <tglx@linutronix.de> wrote:
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

I'll let Tvrtko and Chris review the substance here, but assuming they
don't object,

Acked-by: Jani Nikula <jani.nikula@intel.com>

for merging via whichever tree makes most sense.

>
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
>  drivers/gpu/drm/i915/i915_irq.c |   34 ++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/i915/i915_pmu.c |   18 +-----------------
>  drivers/gpu/drm/i915/i915_pmu.h |    8 ++++++++
>  3 files changed, 43 insertions(+), 17 deletions(-)
>
> --- a/drivers/gpu/drm/i915/i915_irq.c
> +++ b/drivers/gpu/drm/i915/i915_irq.c
> @@ -60,6 +60,24 @@
>   * and related files, but that will be described in separate chapters.
>   */
>  
> +/*
> + * Interrupt statistic for PMU. Increments the counter only if the
> + * interrupt originated from the the GPU so interrupts from a device which
> + * shares the interrupt line are not accounted.
> + */
> +static inline void pmu_irq_stats(struct drm_i915_private *priv,
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
> +}
> +
>  typedef bool (*long_pulse_detect_func)(enum hpd_pin pin, u32 val);
>  
>  static const u32 hpd_ilk[HPD_NUM_PINS] = {
> @@ -1599,6 +1617,8 @@ static irqreturn_t valleyview_irq_handle
>  		valleyview_pipestat_irq_handler(dev_priv, pipe_stats);
>  	} while (0);
>  
> +	pmu_irq_stats(dev_priv, ret);
> +
>  	enable_rpm_wakeref_asserts(&dev_priv->runtime_pm);
>  
>  	return ret;
> @@ -1676,6 +1696,8 @@ static irqreturn_t cherryview_irq_handle
>  		valleyview_pipestat_irq_handler(dev_priv, pipe_stats);
>  	} while (0);
>  
> +	pmu_irq_stats(dev_priv, ret);
> +
>  	enable_rpm_wakeref_asserts(&dev_priv->runtime_pm);
>  
>  	return ret;
> @@ -2103,6 +2125,8 @@ static irqreturn_t ilk_irq_handler(int i
>  	if (sde_ier)
>  		raw_reg_write(regs, SDEIER, sde_ier);
>  
> +	pmu_irq_stats(i915, ret);
> +
>  	/* IRQs are synced during runtime_suspend, we don't require a wakeref */
>  	enable_rpm_wakeref_asserts(&i915->runtime_pm);
>  
> @@ -2419,6 +2443,8 @@ static irqreturn_t gen8_irq_handler(int
>  
>  	gen8_master_intr_enable(regs);
>  
> +	pmu_irq_stats(dev_priv, IRQ_HANDLED);
> +
>  	return IRQ_HANDLED;
>  }
>  
> @@ -2514,6 +2540,8 @@ static __always_inline irqreturn_t
>  
>  	gen11_gu_misc_irq_handler(gt, gu_misc_iir);
>  
> +	pmu_irq_stats(i915, IRQ_HANDLED);
> +
>  	return IRQ_HANDLED;
>  }
>  
> @@ -3688,6 +3716,8 @@ static irqreturn_t i8xx_irq_handler(int
>  		i8xx_pipestat_irq_handler(dev_priv, iir, pipe_stats);
>  	} while (0);
>  
> +	pmu_irq_stats(dev_priv, ret);
> +
>  	enable_rpm_wakeref_asserts(&dev_priv->runtime_pm);
>  
>  	return ret;
> @@ -3796,6 +3826,8 @@ static irqreturn_t i915_irq_handler(int
>  		i915_pipestat_irq_handler(dev_priv, iir, pipe_stats);
>  	} while (0);
>  
> +	pmu_irq_stats(dev_priv, ret);
> +
>  	enable_rpm_wakeref_asserts(&dev_priv->runtime_pm);
>  
>  	return ret;
> @@ -3941,6 +3973,8 @@ static irqreturn_t i965_irq_handler(int
>  		i965_pipestat_irq_handler(dev_priv, iir, pipe_stats);
>  	} while (0);
>  
> +	pmu_irq_stats(dev_priv, IRQ_HANDLED);
> +
>  	enable_rpm_wakeref_asserts(&dev_priv->runtime_pm);
>  
>  	return ret;
> --- a/drivers/gpu/drm/i915/i915_pmu.c
> +++ b/drivers/gpu/drm/i915/i915_pmu.c
> @@ -423,22 +423,6 @@ static enum hrtimer_restart i915_sample(
>  	return HRTIMER_RESTART;
>  }
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
>  static void i915_pmu_event_destroy(struct perf_event *event)
>  {
>  	struct drm_i915_private *i915 =
> @@ -581,7 +565,7 @@ static u64 __i915_pmu_event_read(struct
>  				   USEC_PER_SEC /* to MHz */);
>  			break;
>  		case I915_PMU_INTERRUPTS:
> -			val = count_interrupts(i915);
> +			val = READ_ONCE(pmu->irq_count);
>  			break;
>  		case I915_PMU_RC6_RESIDENCY:
>  			val = get_rc6(&i915->gt);
> --- a/drivers/gpu/drm/i915/i915_pmu.h
> +++ b/drivers/gpu/drm/i915/i915_pmu.h
> @@ -108,6 +108,14 @@ struct i915_pmu {
>  	 */
>  	ktime_t sleep_last;
>  	/**
> +	 * @irq_count: Number of interrupts
> +	 *
> +	 * Intentionally unsigned long to avoid atomics or heuristics on 32bit.
> +	 * 4e9 interrupts are a lot and postprocessing can really deal with an
> +	 * occasional wraparound easily. It's 32bit after all.
> +	 */
> +	unsigned long irq_count;
> +	/**
>  	 * @events_attr_group: Device events attribute group.
>  	 */
>  	struct attribute_group events_attr_group;
>

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
