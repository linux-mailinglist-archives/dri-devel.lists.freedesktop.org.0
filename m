Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C38AC0D3E
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 15:50:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F20010EE87;
	Thu, 22 May 2025 13:50:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oCEI14UI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43A9A10EE6D;
 Thu, 22 May 2025 13:50:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 97FB55C4324;
 Thu, 22 May 2025 13:47:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B238C4CEE4;
 Thu, 22 May 2025 13:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747921809;
 bh=ktheC8UrqvazeBtNepLrvQqF9eDTiWiVXke3rVgh9vk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oCEI14UIkH/IO/X9oU9p5cjgx2Au6n8zDfWPWZeMznx02//mHz1Kd5F5Gm7642Jrt
 OYhUlzxB2Wf+re6OM3zIj00XcwvAq2elObtX3IwmcIKa/r+bpBoOu651q2jHxzwQQ/
 PJq+X6sONf5ygxiibdx8fPHY1/dHdTTjVwsTIfBPdhWxvP2YKZXogSFfDPTxGvA2RA
 Y3LtLbypAKGmaVDBEqTsFWSZE2NdHu3P7pYplEXSUpWhNeRxcmsnKpT9PG0QqNhn07
 3B8lK+Pt0UBbzd6UiEAUYuC8Kfhl726PBJLkn7l0RzTpdqOXMLs9vJfE54RcRLY0/9
 9z6otqMAX86oQ==
Date: Thu, 22 May 2025 15:50:04 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: phasta@kernel.org, Lyude Paul <lyude@redhat.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/nouveau: Don't signal when killing the fence
 context
Message-ID: <aC8rjBuqzst-SHMD@pollux>
References: <20250522112540.161411-2-phasta@kernel.org>
 <20250522112540.161411-3-phasta@kernel.org>
 <af03b541-0b69-4b3d-b498-b68e0beb3dcb@amd.com>
 <06210b9dc5e5ea8365295b77942c3ca030f02729.camel@mailbox.org>
 <eae0ff0f-31a6-433a-b255-9bdb4727a940@amd.com>
 <e5d74c0be68d641171271cdff2e71ec5eb312377.camel@mailbox.org>
 <aac87a7e-5a45-4b54-a43b-cb92c5df669c@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aac87a7e-5a45-4b54-a43b-cb92c5df669c@amd.com>
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

On Thu, May 22, 2025 at 03:05:02PM +0200, Christian König wrote:
> E.g. when you don't know the implementation side use the defined API and don't mess with the internals. If you do know the implementation side then it's valid that you check the internals.

I assume you meant this as "bothering with the internals of you *own* fence is
fine, but not with foreign ones".

And if the driver messes with the internals of its own fence code that's fine,
but in this case we talk about the generic dma_fence implementation, i.e. an
internal flag of the dma_fence implementation.

In general, a driver should *never* bother with implementation details of a
generic component, regardless whether the author knows the internal details.
Things are *always* prone to change and then this may result into subtle bugs.
