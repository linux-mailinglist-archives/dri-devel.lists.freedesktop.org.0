Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3E7297121
	for <lists+dri-devel@lfdr.de>; Fri, 23 Oct 2020 16:14:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 266C96F88D;
	Fri, 23 Oct 2020 14:14:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63D176F88B;
 Fri, 23 Oct 2020 14:14:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D31D2B2A6;
 Fri, 23 Oct 2020 14:14:25 +0000 (UTC)
Subject: Re: [PATCH 04/65] mm: Extract might_alloc() debug check
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20201021163242.1458885-1-daniel.vetter@ffwll.ch>
 <20201023122216.2373294-1-daniel.vetter@ffwll.ch>
 <20201023122216.2373294-4-daniel.vetter@ffwll.ch>
From: Vlastimil Babka <vbabka@suse.cz>
Message-ID: <d4d7ecb9-1147-2965-a551-7647e755387d@suse.cz>
Date: Fri, 23 Oct 2020 16:14:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.3
MIME-Version: 1.0
In-Reply-To: <20201023122216.2373294-4-daniel.vetter@ffwll.ch>
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
Cc: Qian Cai <cai@lca.pw>, linux-xfs@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Paul E . McKenney" <paulmck@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Randy Dunlap <rdunlap@infradead.org>, Dave Chinner <david@fromorbit.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Ingo Molnar <mingo@kernel.org>,
 Pekka Enberg <penberg@kernel.org>, linux-mm@kvack.org,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 David Rientjes <rientjes@google.com>, linux-fsdevel@vger.kernel.org,
 Waiman Long <longman@redhat.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 Michel Lespinasse <walken@google.com>, Christoph Lameter <cl@linux.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/23/20 2:21 PM, Daniel Vetter wrote:
> Extracted from slab.h, which seems to have the most complete version
> including the correct might_sleep() check. Roll it out to slob.c.
> 
> Motivated by a discussion with Paul about possibly changing call_rcu
> behaviour to allocate memory, but only roughly every 500th call.
> 
> There are a lot fewer places in the kernel that care about whether
> allocating memory is allowed or not (due to deadlocks with reclaim
> code) than places that care whether sleeping is allowed. But debugging
> these also tends to be a lot harder, so nice descriptive checks could
> come in handy. I might have some use eventually for annotations in
> drivers/gpu.
> 
> Note that unlike fs_reclaim_acquire/release gfpflags_allow_blocking
> does not consult the PF_MEMALLOC flags. But there is no flag
> equivalent for GFP_NOWAIT, hence this check can't go wrong due to
> memalloc_no*_save/restore contexts.
> 
> Cc: Paul E. McKenney <paulmck@kernel.org>
> Cc: Christoph Lameter <cl@linux.com>
> Cc: Pekka Enberg <penberg@kernel.org>
> Cc: David Rientjes <rientjes@google.com>
> Cc: Joonsoo Kim <iamjoonsoo.kim@lge.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Ingo Molnar <mingo@kernel.org>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Cc: Michel Lespinasse <walken@google.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Waiman Long <longman@redhat.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Randy Dunlap <rdunlap@infradead.org>
> Cc: linux-mm@kvack.org
> Cc: linux-fsdevel@vger.kernel.org
> Cc: Dave Chinner <david@fromorbit.com>
> Cc: Qian Cai <cai@lca.pw>
> Cc: linux-xfs@vger.kernel.org
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

Looks useful.
Acked-by: Vlastimil Babka <vbabka@suse.cz>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
