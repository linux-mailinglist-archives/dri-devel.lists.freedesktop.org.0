Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB03BF9398
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 01:25:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B10A10E0E1;
	Tue, 21 Oct 2025 23:25:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WKC0o2Hu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A264610E058;
 Tue, 21 Oct 2025 23:25:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E80C062768;
 Tue, 21 Oct 2025 23:25:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67118C4CEF1;
 Tue, 21 Oct 2025 23:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761089153;
 bh=1Q261+lqodSbA5keUei/4MITWiCMB6vI0+adsJXuQ2U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WKC0o2HuGeIPZ/5AfrFlvg2UQ5VGHNnR7fUcaI5paR18KVahZo4Y5dTEvucdTlXU1
 7TVVbhjDVBZrsGQiUn4fpiK6Sec2MpyG988/HZYvb/Fbi0mcpIn4b5zL/dPXQ8Moc/
 DEyB++58jVsOpO2LC6ctRPw64Xn0bHMbPvk2h1JV2F4Iv9Sfjch5aJCxGiftLmfJUx
 Rsc1cArqQ+TwIuydvM2z+fBTZUrj8sAu6sPHmM9K9D3w3YXCJ1jVpObAgGSu9q65U8
 zwYbDVelise+SKUVw3mQ6k3iBkyJVm9ll6AYjSnOHDJVAOd0CGziOCrbK7E+seqbpT
 1gbHB51NAOjmg==
Date: Tue, 21 Oct 2025 13:25:52 -1000
From: Tejun Heo <tj@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, jiangshanlai@gmail.com,
 simona.vetter@ffwll.ch, christian.koenig@amd.com,
 pstanner@redhat.com, dakr@kernel.org
Subject: Re: [RFC PATCH 1/3] workqueue: Add an interface to taint workqueue
 lockdep with reclaim
Message-ID: <aPgWgAs_5XoEWri9@slm.duckdns.org>
References: <20251021213952.746900-1-matthew.brost@intel.com>
 <20251021213952.746900-2-matthew.brost@intel.com>
 <aPgBjmIm6n9H-R_u@slm.duckdns.org>
 <aPgDXsQY5qAfU0Tv@lstrano-desk.jf.intel.com>
 <aPgD/3d7lJKoSzI8@lstrano-desk.jf.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aPgD/3d7lJKoSzI8@lstrano-desk.jf.intel.com>
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

On Tue, Oct 21, 2025 at 03:06:55PM -0700, Matthew Brost wrote:
> > > Given that it's about reclaim, "memory cannot be allocated" may be a bit
> > > misleading. Can you make the description more accurate? Also, it'd be great
> 
> Can fix the comment. The rule is memory cannot be allocated in the
> context of reclaim (e.g., GFP_KERNEL).

Oh, I meant that e.g. GPF_ATOMIC or GFP_NOFS reclaims should be fine. It's
just that we can't recurse into reclaim from WQ_RECLAIM workqueue, right?

Thanks.

-- 
tejun
