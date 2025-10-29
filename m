Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA490C1B8B0
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 16:06:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C12E610E7F6;
	Wed, 29 Oct 2025 15:06:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QsqMwvur";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F95B10E7F6;
 Wed, 29 Oct 2025 15:06:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E182E447BC;
 Wed, 29 Oct 2025 15:06:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E3F2C4CEF7;
 Wed, 29 Oct 2025 15:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761750408;
 bh=x4tq1577DDMCaHW3fTcMZ1a5KydbuBLTN+yqRePgwcg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QsqMwvurh6t/xZMpEDwlS2InZJzz9Bh9oJpaJ9ISVQTJWSBOwYn6SZjMQvVyIoxla
 dbjetpiIGRIu97loeqgJEZMZ/pHBMo7CKIoh+vcjq3HTfcknz/FC/NWpRfIxtWYXcm
 21/11Z35cVqHB23xlDJUmHJI62tieaztlO3aOXty41BPNzjd8u/pXYCSRMt3bjVZns
 EM0zNLHYK0LnzEtmlb+yjBqZ13A5WQknpqvNcIyk2vwPKOC/DwoWJTmab1pGeBUmKw
 9uQ1QsgUkwzlMgBUzsGXIWtWLRX0lJ0jiUy7u0ZrgjTOhUyQ0TbKCu81PN5QaSJX9A
 eNCReRnTcEkfA==
Date: Wed, 29 Oct 2025 05:06:46 -1000
From: Tejun Heo <tj@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, jiangshanlai@gmail.com,
 simona.vetter@ffwll.ch, pstanner@redhat.com, dakr@kernel.org
Subject: Re: [RFC PATCH 1/3] workqueue: Add an interface to taint workqueue
 lockdep with reclaim
Message-ID: <aQIthmQmKfztyaQZ@slm.duckdns.org>
References: <20251021213952.746900-1-matthew.brost@intel.com>
 <20251021213952.746900-2-matthew.brost@intel.com>
 <2e1e9d6f-4f9e-49f7-90f0-6759c260701f@amd.com>
 <aQEkq7DYy5/AaJ4R@lstrano-desk.jf.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aQEkq7DYy5/AaJ4R@lstrano-desk.jf.intel.com>
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

Hello,

On Tue, Oct 28, 2025 at 01:16:43PM -0700, Matthew Brost wrote:
> On Tue, Oct 28, 2025 at 10:32:54AM +0100, Christian König wrote:
> > On 10/21/25 23:39, Matthew Brost wrote:
> > > Drivers often use workqueues that are in the reclaim path (e.g., DRM
> > > scheduler workqueues). It is useful to teach lockdep that memory cannot
> > > be allocated on these workqueues. Add an interface to taint workqueue
> > > lockdep with reclaim.
> > 
> > Oh that is so wonderfully evil. I'm absolutely in favor of doing this.
> > 
> > But can't we check for the existing WQ_MEM_RECLAIM flag in the workqueue handling instead?
> > 
> 
> Tejun suggested tying the lockdep annotation to WQ_MEM_RECLAIM, but the
> entire kernel explodes because many workqueues throughout Linux don’t
> adhere to this rule. Here's a link to my latest reply to Tejun [1].

How about making it a WQ flag?

Thanks.

-- 
tejun
