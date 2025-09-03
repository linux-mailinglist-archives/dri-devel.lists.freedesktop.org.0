Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0463DB42732
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 18:45:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 184DD10E8F4;
	Wed,  3 Sep 2025 16:45:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UkWhlLvR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFF5410E8F4
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 16:45:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A71C46013F;
 Wed,  3 Sep 2025 16:45:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F4FCC4CEE7;
 Wed,  3 Sep 2025 16:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756917928;
 bh=1QCnhHk4YrbcljgZa4CIM09QqYheSpXKbkWo83aUiBA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UkWhlLvRnJr6ayb4Mng7/14tuavR02NoAo9XeCgTB/5K3v5y26XRy3pL1nHIvzpVo
 Dn38VyfEu5u4ggHiuf1rlqoblQScmF2gjYxPS26gnp/84X6prefSXBDc4SGcU4jVmV
 GgByW2YTigHjEiJ5pghcpSJ6FL20HQZZiwYDM9E6Is2l5xL/z2SlqQrmZyd62mHfef
 kHNH2kx4gOmI+ozktvajibFsYx6syJhF5oL43UkIn1HNWfgVDoQJx6Fyv2lTYgnXUY
 Y76w5eD/VP6VjR/Rgij0/nEUdUcV+LE/WBEqS2iY+YWtX/nGpN5ubrn9oP9U7/I1j0
 7bgomSEmNytEw==
Date: Wed, 3 Sep 2025 11:45:27 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: "T.J. Mercier" <tjmercier@google.com>,
 Conor Dooley <conor+dt@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 John Stultz <jstultz@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 Brian Starkey <Brian.Starkey@arm.com>, linux-mm@kvack.org,
 Mike Rapoport <rppt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 1/9] dt-bindings: reserved-memory: Document Tegra VPR
Message-ID: <175691792593.2483010.8132765871876943036.robh@kernel.org>
References: <20250902154630.4032984-1-thierry.reding@gmail.com>
 <20250902154630.4032984-2-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250902154630.4032984-2-thierry.reding@gmail.com>
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


On Tue, 02 Sep 2025 17:46:21 +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The Video Protection Region (VPR) found on NVIDIA Tegra chips is a
> region of memory that is protected from CPU accesses. It is used to
> decode and play back DRM protected content.
> 
> It is a standard reserved memory region that can exist in two forms:
> static VPR where the base address and size are fixed (uses the "reg"
> property to describe the memory) and a resizable VPR where only the
> size is known upfront and the OS can allocate it wherever it can be
> accomodated.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../nvidia,tegra-video-protection-region.yaml | 55 +++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reserved-memory/nvidia,tegra-video-protection-region.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

