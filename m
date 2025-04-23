Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03BE4A99334
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 17:54:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2031810E21E;
	Wed, 23 Apr 2025 15:54:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oCcjues8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0884D10E214;
 Wed, 23 Apr 2025 15:54:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 407BCA45FFF;
 Wed, 23 Apr 2025 15:49:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15318C4CEE8;
 Wed, 23 Apr 2025 15:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745423684;
 bh=2/x8SZbOSlA6YH843iLZG84F9KDG8XKQ6w0l2NKZKkk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oCcjues89Dcz6KrbPcPOSWWQ1ff5Qdl4u251vVlbGP17nmm6n9ajxNKpxrXUKFrgL
 9eQLhUZcKiiZL4PcU+PXKwW1rLSts9YQDVpbo6iMuiKMJv8vzrmMyznENXrPQo6F3Y
 bSAR6WsqINZFni94ESvVRlEVKMjLzOg4ieFoZRNFsJ/t++owpcrjcnhGpsmjjQwwBG
 cSVBpEVcAHYX6hLb+vasv1mCUYhiuyZP791MqOy408IbkM1z1mhEmURomTJKT6zZrm
 DA60O74lkXu8qCLPID43bxPadn149jmpgwMaHWnjpHOPE5AfH/0MSW0l6o6DWUjS8I
 LMR1ZD72Iz7SQ==
Date: Wed, 23 Apr 2025 17:54:38 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Philipp Stanner <phasta@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sabrina Dubroca <sd@queasysnail.net>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] drm/nouveau: Fix WARN_ON in
 nouveau_fence_context_kill()
Message-ID: <aAkNPttp4xfkHJp4@pollux>
References: <20250415121900.55719-2-phasta@kernel.org>
 <20250415121900.55719-3-phasta@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250415121900.55719-3-phasta@kernel.org>
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

On Tue, Apr 15, 2025 at 02:19:00PM +0200, Philipp Stanner wrote:
> Nouveau is mostly designed in a way that it's expected that fences only
> ever get signaled through nouveau_fence_signal(). However, in at least
> one other place, nouveau_fence_done(), can signal fences, too. If that
> happens (race) a signaled fence remains in the pending list for a while,
> until it gets removed by nouveau_fence_update().
> 
> Should nouveau_fence_context_kill() run in the meantime, this would be
> a bug because the function would attempt to set an error code on an
> already signaled fence.
> 
> Have nouveau_fence_context_kill() check for a fence being signaled.
> 
> Cc: <stable@vger.kernel.org> # v5.10+
> Fixes: ea13e5abf807 ("drm/nouveau: signal pending fences when channel has been killed")
> Suggested-by: Christian König <christian.koenig@amd.com>
> Signed-off-by: Philipp Stanner <phasta@kernel.org>

Applied to drm-misc-fixes, thanks!
