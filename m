Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9CC2D714B
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 09:16:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 243876EC89;
	Fri, 11 Dec 2020 08:16:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4755589CDE;
 Thu, 10 Dec 2020 17:44:46 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1607622284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oeioyqpxNmG6CK8lLuYIEgegZmVE7BiOpQp+xJs/g5M=;
 b=nFpOge/3DK/YrVphh+ZKWZYuF1Z9nOGge7xU97iWnUyzPbaEFKCmHRLc8uXkq/UajGCT5N
 OncAX1nMt1jLZ9Zpu2A3eiw5nnrk2Wc6fPLw8c8bJAQ/WAxLUszBEbdn8OLNplLWrI/2Gb
 F7KcieQGQ4eBqcsJV7BUSYwmoMRFFvGtOLAVBkDpMemGux1f0WYLqf210QcCp3hX34VjmK
 PPuojzqSecXQCIRBtQb4VSB46fptypIDq6BQrST9YDHc1v+XDLurqAo59LaSQrHrh8+CB4
 +Dmw0dMvmpPZC/70Y48xr5qEpr5O4MomnWtOqao1KuNEg06CM0OceEHjHLpO7Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1607622284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oeioyqpxNmG6CK8lLuYIEgegZmVE7BiOpQp+xJs/g5M=;
 b=rWL5Y9Xn9fN7dzBlg88tnUbJnatJ/mJ8Nef3j1Bgh0vv4WhDAu4D4F9E4/waF+d2Zh+v12
 EW4+HqySJVUXLIBA==
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Jerry Snitselaar <jsnitsel@redhat.com>, linux-kernel@vger.kernel.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [Intel-gfx] [PATCH v3 2/4] drm/i915/pmu: Use kstat_irqs to get
 interrupt count
In-Reply-To: <e01e321d-d4ea-fcec-a3dc-16e641e49056@linux.intel.com>
References: <20201205014340.148235-1-jsnitsel@redhat.com>
 <20201205014340.148235-3-jsnitsel@redhat.com>
 <875z5e99ez.fsf@nanos.tec.linutronix.de>
 <160758677957.5062.15497765500689083558@jlahtine-mobl.ger.corp.intel.com>
 <e9892cc4-6344-be07-66b5-236b8576100e@linux.intel.com>
 <87v9d9k49q.fsf@nanos.tec.linutronix.de>
 <e01e321d-d4ea-fcec-a3dc-16e641e49056@linux.intel.com>
Date: Thu, 10 Dec 2020 18:44:44 +0100
Message-ID: <87pn3hk12r.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 11 Dec 2020 08:16:08 +0000
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
Cc: David Airlie <airlied@linux.ie>, Peter Zijlstra <peterz@infradead.org>,
 intel-gfx@lists.freedesktop.org, Matthew Garrett <mjg59@google.com>,
 James Bottomley <James.Bottomley@HansenPartnership.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Jarkko Sakkinen <jarkko@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-integrity@vger.kernel.org,
 Peter Huewe <peterhuewe@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 10 2020 at 17:09, Tvrtko Ursulin wrote:
> On 10/12/2020 16:35, Thomas Gleixner wrote:
>> I'll send out a series addressing irq_to_desc() (ab)use all over the
>> place shortly. i915 is in there...
>
> Yep we don't need atomic, my bad. And we would care about the shared 
> interrupt line. And without atomic the extra accounting falls way below 
> noise.

You have to be careful though. If you make the accumulated counter 64
bit wide then you need to be careful vs. 32bit machines.

> So in the light of it all, it sounds best I just quickly replace our 
> abuse with private counting and then you don't have to deal with it in 
> your series.

I mostly have it. Still chewing on the 32bit vs. 64bit thing. And
keeping it in my series allows me to remove the export of irq_to_desc()
at the end without waiting for your tree to be merged.

Give me a few.

Thanks,

        tglx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
