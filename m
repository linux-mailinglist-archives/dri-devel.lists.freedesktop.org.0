Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A69BF93AD
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 01:28:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E96F10E058;
	Tue, 21 Oct 2025 23:28:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KFtLUaQM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E2B210E058;
 Tue, 21 Oct 2025 23:28:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8DB4860489;
 Tue, 21 Oct 2025 23:28:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1108BC4CEF1;
 Tue, 21 Oct 2025 23:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761089312;
 bh=yLUPTfQ0fOP6q5PaV+LDloE5TD4E7DwDV7LaIqrcPSg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KFtLUaQMOWo3d76/lTJ9Tect9Ec+1Rgy0s5sznhblE6CqzqeBEEIkhVn2yHdYo0Ye
 7RiFzJnGfcKEy2irBmH4lmtIo6ZTMztgNrnilGQoqgJlzYeaztDVweFbYsdvqxHXHs
 dgq40r4UMHBDGpZ0xefp3NhkcewNtcPqTQLuotkaYql2T23nUk9xZ3iOpooeeUo7bh
 qhhhOsf0ezVALtKc2JkPRjcqV6MPyXkwTSf3aiYqGmmiGsfTrVLXYMBJwMq18Z2qLB
 S6dpeoaHd3cSkvXjWxJPoJmMQc5TcolvDGooBsOuBg7G5iN9ZDtbCOnhSp4VBYrjqZ
 IbWawI7Hk9f4g==
Date: Tue, 21 Oct 2025 13:28:31 -1000
From: Tejun Heo <tj@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, jiangshanlai@gmail.com,
 simona.vetter@ffwll.ch, christian.koenig@amd.com,
 pstanner@redhat.com, dakr@kernel.org
Subject: Re: [RFC PATCH 1/3] workqueue: Add an interface to taint workqueue
 lockdep with reclaim
Message-ID: <aPgXH_JjkmKO5_a_@slm.duckdns.org>
References: <20251021213952.746900-1-matthew.brost@intel.com>
 <20251021213952.746900-2-matthew.brost@intel.com>
 <aPgBjmIm6n9H-R_u@slm.duckdns.org>
 <aPgDXsQY5qAfU0Tv@lstrano-desk.jf.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aPgDXsQY5qAfU0Tv@lstrano-desk.jf.intel.com>
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

On Tue, Oct 21, 2025 at 03:04:14PM -0700, Matthew Brost wrote:
> > Hmm... would it make sense to tie this to WQ_MEM_RECLAIM - ie. enable it
> > implicitly on workqueues w/ the flag set?
> 
> I had considered this, and for a while I thought WQ_MEM_RECLAIM already
> did what I'm suggesting—especially since I’ve spotted bugs in drivers
> where I would have expected lockdep to catch them.
> 
> In my opinion, this approach is better, but it has a broader kernel-wide
> scope and could potentially break some things. My subsequent patches
> will likely break one or two DRM drivers, so it might not be a concern
> to fix everything that breaks across the kernel. It's up to you which
> route we want to take here.

Yeah, it is bothersome that WQ_MEM_RECLAIM doesn't currently have a way to
ensure compliance. I just didn't know about the lockdep mechanism. Can you
please update the patch so that WQ_MEM_RECLAIM implicitly enables the
checking?

Thanks.

-- 
tejun
