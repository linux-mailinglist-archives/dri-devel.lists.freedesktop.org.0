Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD119900B2
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2024 12:16:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0479A10E11E;
	Fri,  4 Oct 2024 10:16:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="gOMCkEWX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7680810E11E;
 Fri,  4 Oct 2024 10:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=u1NWgOqMNyUtDvE04Axpn1gDc+Ve2ri/GBG7osPQrOg=; b=gOMCkEWXOJRBXfM0ddK81Q71DG
 4OY3tAjYpeIZ8X/iteABsPzv77ZA/bJAu3Q1vTKBeCva1EhxUpS4Fjw6KI2BsZwc3So9Dr0EZVvm4
 GE8SYL82QOlnDDDrAuWBaU4Yz3XmPDD2oa9PpNI6megKX3AAZRUVn+6xogNfat+DH8vZDdsw4wr06
 gt5nDiZYX9ThnwqNjGBJgP0aWOzbA6rVSczOJGGSPHIL5K51nL3ZnjrJ5CPREIr7Nl5T4xcldr07s
 HkgqUv0+UHFCQhRIdXvUsnbpd9Kcf/7WoZNNZAxJ4fFy+xRN4PtDpWtjMxdu9kGqxW1IGtpUTxaa7
 Kw+7kjeQ==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
 id 1swfLt-0000000A9yn-0Mev; Fri, 04 Oct 2024 10:16:01 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
 id 56BDA30083E; Fri,  4 Oct 2024 12:16:01 +0200 (CEST)
Date: Fri, 4 Oct 2024 12:16:01 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 Maarten Lankhorst <maarten@lankhorst.se>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] locking/ww_mutex: Adjust to lockdep nest_lock
 requirements
Message-ID: <20241004101601.GQ18071@noisy.programming.kicks-ass.net>
References: <20241002125611.361001-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241002125611.361001-1-thomas.hellstrom@linux.intel.com>
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

On Wed, Oct 02, 2024 at 02:56:11PM +0200, Thomas Hellström wrote:
> When using mutex_acquire_nest() with a nest_lock, lockdep refcounts the
> number of acquired lockdep_maps of mutexes of the same class, and also
> keeps a pointer to the first acquired lockdep_map of a class. That pointer
> is then used for various comparison-, printing- and checking purposes,
> but there is no mechanism to actively ensure that lockdep_map stays in
> memory. Instead, a warning is printed if the lockdep_map is freed and
> there are still held locks of the same lock class, even if the lockdep_map
> itself has been released.
> 
> In the context of WW/WD transactions that means that if a user unlocks
> and frees a ww_mutex from within an ongoing ww transaction, and that
> mutex happens to be the first ww_mutex grabbed in the transaction,
> such a warning is printed and there might be a risk of a UAF.

I'm assuming you actually hit this?

Anyway, work around seems sane enough, thanks!
