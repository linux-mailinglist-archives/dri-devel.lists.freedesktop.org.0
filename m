Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7F8AC0C17
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 14:59:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E2B110EA09;
	Thu, 22 May 2025 12:59:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="G3Cpqv5+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77BC810ECAE;
 Thu, 22 May 2025 12:59:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3BC0E5C58CC;
 Thu, 22 May 2025 12:57:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA56BC4CEE4;
 Thu, 22 May 2025 12:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747918762;
 bh=EzfhMIhRFIBM3Fwseht3BF96lg8TCY/2uetMvYqb0rk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=G3Cpqv5+9gbs7tVHCLE4dTolFc/WK1cnGNOuDbi2r9P86s69Oibbw5EyCcXMS6caJ
 WF2MgwzXEYENObgeTtgmait9gV/geM0iIErCdC9w9t2prr0a7nSMvM2E1uXlEz4uIw
 UjMju2ewQ1/OHObhV5bHiXBMWphCoxXfOBCYApOJxc140kfTX1oOds+4Rgn2xeWOFF
 fC/9WL24/hZ/WzdszziEnBtKZHSzkQtg+a4JGqatBACIhv2Zc669QhHbTDm6M/Q3V7
 w8MYEdsWxNs/q9zTCxwo0XQp86Irgo1ZUjxjMKsSk4GM+O0UVpeNNvK5dT7mUlbIFm
 /Jkhuva4PkqeQ==
Date: Thu, 22 May 2025 14:59:16 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: phasta@kernel.org, Lyude Paul <lyude@redhat.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/nouveau: Don't signal when killing the fence
 context
Message-ID: <aC8fpEXYWZ9Oy41J@pollux>
References: <20250522112540.161411-2-phasta@kernel.org>
 <20250522112540.161411-3-phasta@kernel.org>
 <af03b541-0b69-4b3d-b498-b68e0beb3dcb@amd.com>
 <06210b9dc5e5ea8365295b77942c3ca030f02729.camel@mailbox.org>
 <eae0ff0f-31a6-433a-b255-9bdb4727a940@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eae0ff0f-31a6-433a-b255-9bdb4727a940@amd.com>
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

On Thu, May 22, 2025 at 02:34:33PM +0200, Christian König wrote:
> See all the functions inside include/linux/dma-fence.h can be used by everybody. It's basically the public interface of the dma_fence object.

As you write below, in certain cases it is valid to call this from drivers, so
it's not unreasonable to have it as part of the public API.

> So testing if a fence is signaled without calling the callback is only allowed by whoever implemented the fence.
> 
> In other words nouveau can test nouveau fences, i915 can test i915 fences, amdgpu can test amdgpu fences etc... But if you have the wrapper that makes it officially allowed that nouveau starts testing i915 fences and that would be problematic.

In general, I like the  __dma_fence_is_signaled() helper, because this way we
can document in which cases it is allowed to be used, i.e. the ones you descibe
above.

test_bit() can be called by anyone and there is no documentation comment
explaining that it is only allowed under certain conditions.

Having the __dma_fence_is_signaled() helper properly documented could get you
rid of having to explain in which case the test_bit() dance is allowed to do
over and over again. :-)

I also think the name is good, since the '__' prefix already implies that there
are some restrictions on the use of this helper.
