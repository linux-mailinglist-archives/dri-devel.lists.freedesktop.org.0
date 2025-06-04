Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56867ACE273
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 18:53:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A021110E035;
	Wed,  4 Jun 2025 16:53:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WXT6NWtA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB85710E788
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jun 2025 16:53:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D1BA94A06A;
 Wed,  4 Jun 2025 16:53:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8F77C4CEE4;
 Wed,  4 Jun 2025 16:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749056028;
 bh=hhaoHECGZqzEpU9MTiy2t7cqLq5LWg93CmxEmAbN2pM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WXT6NWtAmVdO6YCKYmBq1oxfVRkO/uSH6SnVzBZ9qhEGoHV3lrl4Jx8S+qcptwIK+
 Jur1H7p5sTLycJzMoZkbRM6r91ygI3u/LdNCS+r7jOOZFKrVF2iX8OADTmL7YRXbqI
 RBYvJtHKr2U7FrsWXRo7ajPyntQ0ic276AXO2okaHqaufPnVMpuVNuT90qqJyH14eF
 uWxGA259OB44qflNK5oQnKvnd1AR2vnoGaXmK4FAQEgAMbC/KupBpbMCGzNl2qQVfc
 dn0OII6WNP5UCHsQJU2kTp/IOQCG0R52C8VCfGA4d+JvOSKm7gBnogf8CfuUwqhARt
 5j4NlWpwaoqFg==
Date: Wed, 4 Jun 2025 18:53:44 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Philipp Stanner <phasta@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/sched: Discourage usage of separate workqueues
Message-ID: <aEB6GOTlC_Z_Rq8b@cassiopeiae>
References: <20250604081657.124453-2-phasta@kernel.org>
 <7a09c357-2d28-4dd6-b637-4387cc430938@amd.com>
 <aEBhIzccXBPyt_58@phenom.ffwll.local>
 <aEB4DFFE2C7gElRL@lstrano-desk.jf.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEB4DFFE2C7gElRL@lstrano-desk.jf.intel.com>
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

On Wed, Jun 04, 2025 at 09:45:00AM -0700, Matthew Brost wrote:
> On Wed, Jun 04, 2025 at 05:07:15PM +0200, Simona Vetter wrote:
> > We should definitely document this trick better though, I didn't find any
> > place where that was documented.
> 
> This is a good idea.

I think - and I also mentioned this a few times in the patch series that added
the workqueue support - we should also really document the pitfalls of this.

If the scheduler shares a workqueue with the driver, the driver needs to take
special care when submitting work that it's not possible to prevent run_job and
free_job work from running by doing this.

For instance, if it's a single threaded workqueue and the driver submits work
that allocates with GFP_KERNEL, this is a deadlock condition.

More generally, if the driver submits N work that, for instance allocates with
GFP_KERNEL, it's also a deadlock condition if N == max_active.
