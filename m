Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D54E12D0C47
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 09:57:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BF1D6E566;
	Mon,  7 Dec 2020 08:56:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CE8C89FED;
 Sun,  6 Dec 2020 16:38:47 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1607272724;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=orscdnWsxTjeOjrX4mZ7RlgaGlM/iHr3hxGeVG/5B5o=;
 b=S9U+yLW+RMD4XJ+DVjlUuG1Ta3scM6aUrIt7ysUfUnpo2Lk9yrcK1AlcgrZWgFWCtYoJTF
 VExnxFo/ryb4R7eRQEVwMsDGha92iA0oI81k+3gGLFB1nonwAisjC3/jKTSUf/nGy1d64W
 /i1uYHhHy/jPj6waERlxa7GsrP6eM2yH0numGnZwlG3dEBTbqM59AhAzaFX9Pkk1y9qak3
 dhXHo9nnSGnB608LNXSZ0BSANnW+ESKfmIzwLrnY3Zp+ef11yigXhYhPrhNWafb4cMW6lM
 JyoZkKlnRO1jdjGoihuwGfLZqyXfJAFPDlho62hQLrm5QKAPcdCuOpSMM3JdkA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1607272724;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=orscdnWsxTjeOjrX4mZ7RlgaGlM/iHr3hxGeVG/5B5o=;
 b=AksEazRjmD+yqQmgK8+KYrxZfIF8IEb97GXwe2YdDqzKrwXlC8Rc+QhlrKd/lk5AZdXYm6
 zdJsYoIctUvQBdCw==
To: Jerry Snitselaar <jsnitsel@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] drm/i915/pmu: Use kstat_irqs to get interrupt count
In-Reply-To: <20201205014340.148235-3-jsnitsel@redhat.com>
References: <20201205014340.148235-1-jsnitsel@redhat.com>
 <20201205014340.148235-3-jsnitsel@redhat.com>
Date: Sun, 06 Dec 2020 17:38:44 +0100
Message-ID: <875z5e99ez.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 07 Dec 2020 08:56:49 +0000
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
Cc: Peter Zijlstra <peterz@infradead.org>, Hans de Goede <hdegoede@redhat.com>,
 David Airlie <airlied@linux.ie>, Matthew Garrett <mjg59@google.com>,
 intel-gfx@lists.freedesktop.org,
 James Bottomley <James.Bottomley@HansenPartnership.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Jarkko Sakkinen <jarkko@kernel.org>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 linux-integrity@vger.kernel.org, Peter Huewe <peterhuewe@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 04 2020 at 18:43, Jerry Snitselaar wrote:

> Now that kstat_irqs is exported, get rid of count_interrupts in
> i915_pmu.c
> --- a/drivers/gpu/drm/i915/i915_pmu.c
> +++ b/drivers/gpu/drm/i915/i915_pmu.c
> @@ -423,22 +423,6 @@ static enum hrtimer_restart i915_sample(struct hrtimer *hrtimer)
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

May I ask why this has been merged in the first place?

Nothing in a driver has ever to fiddle with the internals of an irq
descriptor. We have functions for properly accessing them. Just because
C allows to fiddle with everything is not a justification. If the
required function is not exported then adding the export with a proper
explanation is not asked too much.

Also this lacks protection or at least a comment why this can be called
safely and is not subject to a concurrent removal of the irq descriptor.
The same problem exists when calling kstat_irqs(). It's even documented
at the top of the function.

Thanks,

        tglx


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
