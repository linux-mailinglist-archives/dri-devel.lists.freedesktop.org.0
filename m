Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4AC2D0C45
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 09:57:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 666CD6E5A0;
	Mon,  7 Dec 2020 08:56:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9D3C6E4B7;
 Sun,  6 Dec 2020 21:33:12 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1607290389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i0kvt6ku7dAshK929r0L7tdGjX3+YC59SkyEOBkJSfw=;
 b=ViQOkJ7y6DMyLlYw2pFNCVTsHYT9GQX+KFN7FN+6iKVQCrO3nwmjriqX669EFSMG5yd329
 v3a0aGmc7aViLV60ceiXGva2d7J/MXBparmVZo+0UOOtHkGm6MHksfFAuZ7uvo/tq7WXwd
 l+banRKjlAmprFfZDb8wu5DFOhVf/7wrK/7xjdmys22NF43KBmReMl0yw1qDBotj4lDcB6
 syzd5dIGhzb1SQpegOTY4TBmxTLuAq/ocxhhaPDBae/XoqbSuSViXRmKYotaqdYZFrPpBR
 zPmdc3AOy62qlpBZtmGzMga5lt2JAk15B4I+2Yo1WCxGnYphkC/oRDbHURsFNw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1607290389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i0kvt6ku7dAshK929r0L7tdGjX3+YC59SkyEOBkJSfw=;
 b=qW6VGJay7Y1fRfpZcbDGnE0csxZUMMAVFl/445dozitpWgLzD9ZrsjtZhGTYRnXTNR7Y5U
 O+a1wpKLG8xbaeAg==
To: Jerry Snitselaar <jsnitsel@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] drm/i915/pmu: Use kstat_irqs to get interrupt count
In-Reply-To: <875z5e99ez.fsf@nanos.tec.linutronix.de>
References: <20201205014340.148235-1-jsnitsel@redhat.com>
 <20201205014340.148235-3-jsnitsel@redhat.com>
 <875z5e99ez.fsf@nanos.tec.linutronix.de>
Date: Sun, 06 Dec 2020 22:33:09 +0100
Message-ID: <87o8j67h7u.fsf@nanos.tec.linutronix.de>
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

On Sun, Dec 06 2020 at 17:38, Thomas Gleixner wrote:
> On Fri, Dec 04 2020 at 18:43, Jerry Snitselaar wrote:
>> Now that kstat_irqs is exported, get rid of count_interrupts in
>> i915_pmu.c
>
> May I ask why this has been merged in the first place?
>
> Nothing in a driver has ever to fiddle with the internals of an irq
> descriptor. We have functions for properly accessing them. Just because
> C allows to fiddle with everything is not a justification. If the
> required function is not exported then adding the export with a proper
> explanation is not asked too much.
>
> Also this lacks protection or at least a comment why this can be called
> safely and is not subject to a concurrent removal of the irq descriptor.
> The same problem exists when calling kstat_irqs(). It's even documented
> at the top of the function.

And as pointed out vs. that TPM thing this really could have been a
trivial

    i915->irqs++;

in the interrupt handler and a read of that instead of iterating over
all possible cpus and summing it up. Oh well...

Thanks,

        tglx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
