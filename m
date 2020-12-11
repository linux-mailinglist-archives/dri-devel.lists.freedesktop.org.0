Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8EFF2D93EB
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 09:18:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E33A86E083;
	Mon, 14 Dec 2020 08:17:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5FE06EDDE;
 Fri, 11 Dec 2020 12:57:51 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1607691469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JI1elAtJ+5DtZ6K623jhzzi7pTI2yY5tK5xHv6JaNRg=;
 b=IsUihC8x41gfVuZ56mJpZCBvWH6AGSSnlAtCqFu+Y6vHBUWXmKQx9YvU5B8lrG6utDrQMP
 8canZDEEsNDVhNNdoKfnFOQzTFOpz9W+psXaARAvFsUFtyOebsqoT9kLX8kBnNz5EacFR5
 rK53uTCJCAI+CQzV9BLaBuU/gNEQZy9UASonSM4NSF0ZsDg2qgrh9flw6frSO8WIrRyHsw
 fF1cIAuhmb0wJbfH0peqshua47BZpnwfG0pDc4EWPJORiwGLQuagVjgVxqHnf+tQ9+0hUT
 H0SNNDNOI9Tui6mw4dUpmVwGgPTgPo14TX1s4jNlbb7LIWdUurk9RmWQuaaNkw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1607691469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JI1elAtJ+5DtZ6K623jhzzi7pTI2yY5tK5xHv6JaNRg=;
 b=9Ep94KYblAfQy2iSeDDH/NSIpD2gqoyh3N3s+6g4ZgyvdTP4pfDpIIp6ve3zDE8y9b1XGh
 NoOqscBMvs3mS3Bw==
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: [patch 14/30] drm/i915/pmu: Replace open coded kstat_irqs() copy
In-Reply-To: <ad05af1a-5463-2a80-0887-7629721d6863@linux.intel.com>
References: <20201210192536.118432146@linutronix.de>
 <20201210194043.957046529@linutronix.de>
 <ad05af1a-5463-2a80-0887-7629721d6863@linux.intel.com>
Date: Fri, 11 Dec 2020 13:57:49 +0100
Message-ID: <87y2i4h54i.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 14 Dec 2020 08:17:41 +0000
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
 Will Deacon <will@kernel.org>, Michal Simek <michal.simek@xilinx.com>,
 linux-s390@vger.kernel.org, afzal mohammed <afzal.mohd.ma@gmail.com>,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 11 2020 at 10:13, Tvrtko Ursulin wrote:
> On 10/12/2020 19:25, Thomas Gleixner wrote:

>> 
>> Aside of that the count is per interrupt line and therefore takes
>> interrupts from other devices into account which share the interrupt line
>> and are not handled by the graphics driver.
>> 
>> Replace it with a pmu private count which only counts interrupts which
>> originate from the graphics card.
>> 
>> To avoid atomics or heuristics of some sort make the counter field
>> 'unsigned long'. That limits the count to 4e9 on 32bit which is a lot and
>> postprocessing can easily deal with the occasional wraparound.
>
> After my failed hasty sketch from last night I had a different one which 
> was kind of heuristics based (re-reading the upper dword and retrying if 
> it changed on 32-bit).

The problem is that there will be two seperate modifications for the low
and high word. Several ways how the compiler can translate this, but the
problem is the same for all of them:

CPU 0                           CPU 1
        load low
        load high
        add  low, 1
        addc high, 0            
        store low               load high
--> NMI                         load low
                                load high and compare
        store high

You can't catch that. If this really becomes an issue you need a
sequence counter around it.
      

> But you are right - it is okay to at least start 
> like this today and if later there is a need we can either do that or 
> deal with wrap at PMU read time.

Right.

>> +/*
>> + * Interrupt statistic for PMU. Increments the counter only if the
>> + * interrupt originated from the the GPU so interrupts from a device which
>> + * shares the interrupt line are not accounted.
>> + */
>> +static inline void pmu_irq_stats(struct drm_i915_private *priv,
>
> We never use priv as a local name, it should be either i915 or
> dev_priv.

Sure, will fix.

>> +	/*
>> +	 * A clever compiler translates that into INC. A not so clever one
>> +	 * should at least prevent store tearing.
>> +	 */
>> +	WRITE_ONCE(priv->pmu.irq_count, priv->pmu.irq_count + 1);
>
> Curious, probably more educational for me - given x86_32 and x86_64, and 
> the context of it getting called, what is the difference from just doing 
> irq_count++?

Several reasons:

    1) The compiler can pretty much do what it wants with cnt++
       including tearing and whatever. https://lwn.net/Articles/816850/
       for the full set of insanities.

       Not really a problem here, but

    2) It's annotating the reader and the writer side and documenting
       that this is subject to concurrency

    3) It will prevent KCSAN to complain about the data race,
       i.e. concurrent modification while reading.

Thanks,

        tglx

>> --- a/drivers/gpu/drm/i915/i915_pmu.c
>> +++ b/drivers/gpu/drm/i915/i915_pmu.c
>> @@ -423,22 +423,6 @@ static enum hrtimer_restart i915_sample(
>>   	return HRTIMER_RESTART;
>>   }
>
> In this file you can also drop the #include <linux/irq.h> line.

Indeed.

Thanks,

        tglx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
