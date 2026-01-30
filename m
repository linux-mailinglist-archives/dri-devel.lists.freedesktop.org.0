Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHMFMtkdfWlQQQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 22:08:41 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 411D1BEB31
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 22:08:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13C0110E11F;
	Fri, 30 Jan 2026 21:08:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="PxHhylMn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5AB310E106;
 Fri, 30 Jan 2026 21:08:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3D0D36013A;
 Fri, 30 Jan 2026 21:08:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94782C4CEF7;
 Fri, 30 Jan 2026 21:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1769807315;
 bh=NpIWKTcK0nElwmNCWQsMcXiocFq60OtqNvc0TmYMhpw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PxHhylMnpGHxaYWvYQVZLPqe6RRG2x2B+ggYwZIU30b3Ew6cQLMcdWnHk4NxUd35q
 /DWbjjtUbgZoNxYCAIONothAH76NlkNHxJERU6WcPdb0qnRJIzB3EW/0MwUiv5SpA0
 6Sy9LCXY/OF0lVDCO1Q6CM7gE1uBdrVtvcIGVElA=
Date: Fri, 30 Jan 2026 13:08:35 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>, Ralph Campbell <rcampbell@nvidia.com>,
 Christoph Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@mellanox.com>,
 "Jason Gunthorpe" <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 <linux-mm@kvack.org>, <stable@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] mm/hmm: Fix a hmm_range_fault() livelock / starvation
 problem
Message-Id: <20260130130835.10d004cd79d67c55b10def74@linux-foundation.org>
In-Reply-To: <aX0cJGIU9NLt/OLW@lstrano-desk.jf.intel.com>
References: <20260130144529.79909-1-thomas.hellstrom@linux.intel.com>
 <20260130100013.fb1ce1cd5bd7a440087c7b37@linux-foundation.org>
 <b9dd97e7d9e62ebc33c4dfef53a9fd3f51352d3a.camel@linux.intel.com>
 <20260130123810.61dde600422a8fe01cff8296@linux-foundation.org>
 <aX0cJGIU9NLt/OLW@lstrano-desk.jf.intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
X-Spamd-Result: default: False [-0.31 / 15.00];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[linux-foundation.org:s=korg];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[linux-foundation.org];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[linux-foundation.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akpm@linux-foundation.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: 411D1BEB31
X-Rspamd-Action: no action

On Fri, 30 Jan 2026 13:01:24 -0800 Matthew Brost <matthew.brost@intel.com> wrote:

> > > Unfortunately hmm_range_fault() is typically called from a gpu
> > > pagefault handler and it's crucial to get the gpu up and running again
> > > as fast as possible.
> > 
> > Would a millisecond matter?  Regular old preemption will often cause
> > longer delays.
> > 
> 
> I think millisecond is too high. We are aiming to GPU page faults
> serviced in 10-15us of CPU time (GPU copy time varies based on size of
> fault / copy bus speed but still at most 200us).

But it's a rare case?

Am I incorrect in believing that getting preempted will cause latencies
much larger than this?

> Matt
> 
> > > Is there a way we could test for the cases where cond_resched() doesn't
> > > work and in that case instead call sched_yield(), at least on -EBUSY
> > > errors?
> > 
> > kernel-internal sched_yield() was taken away years ago and I don't
> > think there's a replacement, particularly one which will cause a
> > realtime-policy task to yield to a non-rt-policy one.
> > 
> > It's common for kernel code to forget that it could have realtime
> > policy - we probably have potential lockups in various places.
> > 
> > I suggest you rerun your testcase with this patch using `chrt -r', see
> > if my speculation is correct.

Please?
