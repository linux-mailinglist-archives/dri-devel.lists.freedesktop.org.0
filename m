Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9AA2BBEB4
	for <lists+dri-devel@lfdr.de>; Sat, 21 Nov 2020 12:35:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82AE86E9A9;
	Sat, 21 Nov 2020 11:34:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2860C6E89C;
 Fri, 20 Nov 2020 17:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=S891HRVAXLMue2eb3ZaWv9TMDAthb1khr5PCwoXDFR4=; b=j66PMMpvppK+9LOqAod/s1ja5m
 NVR3CJQ5wNAq2SNU16LOU8GllPMP3dWrlW0vWIkua0Q20gtch6gF283d57uK3CBa5mTngXGmftXl9
 EoWhyx1dajSPLcrCy+az1qOxvLY8u/ryxMHXbLQY4wRWf6tfAyS5dJi34STTYLFpGVEVFckV6idcX
 8A2ryyyeBQPvBlZuB3VZ25y1x3p3+fuI2rkDBjo2pRYLKAAe2ynNubYwTSeWn1a4EEhMMWl8UeGO+
 kKNrUMokjBiTf6Q9XupujrSzp+9OEjo+AQ1SZhNy8Gpw+6odKCdO8aO/7liRmMFfqiVNjewZRd/+x
 igbQutPg==;
Received: from [2601:1c0:6280:3f0::bcc4]
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kgA4p-0001xJ-Sm; Fri, 20 Nov 2020 17:20:04 +0000
Subject: Re: [PATCH 2/3] mm: Extract might_alloc() debug check
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20201120095445.1195585-1-daniel.vetter@ffwll.ch>
 <20201120095445.1195585-3-daniel.vetter@ffwll.ch>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <bfe3b1a4-9cc0-358f-a62e-b6d9a68e735a@infradead.org>
Date: Fri, 20 Nov 2020 09:19:56 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201120095445.1195585-3-daniel.vetter@ffwll.ch>
Content-Language: en-US
X-Mailman-Approved-At: Sat, 21 Nov 2020 11:34:30 +0000
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Dave Chinner <david@fromorbit.com>, linux-mm@kvack.org,
 Daniel Vetter <daniel.vetter@intel.com>, Christoph Lameter <cl@linux.com>,
 Michel Lespinasse <walken@google.com>, Ingo Molnar <mingo@kernel.org>,
 linux-xfs@vger.kernel.org, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 David Rientjes <rientjes@google.com>, Waiman Long <longman@redhat.com>,
 "Paul E . McKenney" <paulmck@kernel.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Qian Cai <cai@lca.pw>, Thomas Gleixner <tglx@linutronix.de>,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>, Vlastimil Babka <vbabka@suse.cz>,
 LKML <linux-kernel@vger.kernel.org>, Pekka Enberg <penberg@kernel.org>,
 linux-fsdevel@vger.kernel.org,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 11/20/20 1:54 AM, Daniel Vetter wrote:
> diff --git a/include/linux/sched/mm.h b/include/linux/sched/mm.h
> index d5ece7a9a403..f94405d43fd1 100644
> --- a/include/linux/sched/mm.h
> +++ b/include/linux/sched/mm.h
> @@ -180,6 +180,22 @@ static inline void fs_reclaim_acquire(gfp_t gfp_mask) { }
>  static inline void fs_reclaim_release(gfp_t gfp_mask) { }
>  #endif
>  
> +/**
> + * might_alloc - Marks possible allocation sites

                    Mark

> + * @gfp_mask: gfp_t flags that would be use to allocate

                                           used

> + *
> + * Similar to might_sleep() and other annotations this can be used in functions

                                         annotations,

> + * that might allocate, but often dont. Compiles to nothing without

                                     don't.

> + * CONFIG_LOCKDEP. Includes a conditional might_sleep() if @gfp allows blocking.

?                                            might_sleep_if() if

> + */
> +static inline void might_alloc(gfp_t gfp_mask)
> +{
> +	fs_reclaim_acquire(gfp_mask);
> +	fs_reclaim_release(gfp_mask);
> +
> +	might_sleep_if(gfpflags_allow_blocking(gfp_mask));
> +}


-- 
~Randy

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
