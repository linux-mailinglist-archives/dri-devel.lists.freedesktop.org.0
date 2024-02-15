Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6228855BB5
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 08:34:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BF6A10E259;
	Thu, 15 Feb 2024 07:34:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="iE9KG+M2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCB8C10E04F;
 Thu, 15 Feb 2024 07:34:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E2D7E61BE2;
 Thu, 15 Feb 2024 07:34:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 861E8C433C7;
 Thu, 15 Feb 2024 07:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707982485;
 bh=d+coCdfl5TyzHkk2WHZ+6VQlZcOEjRLYjvg5P+9S/hE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iE9KG+M2oePyVUW3RrTA0ExjRqKVcdYIfbnqEtUrmCKOvA0eQ2MPYQhk99pnediQD
 TknsEmBjtw7UbFKznE+PoJzrSX9j7C+uH4OrHqSjTehLZt8FWI13FOvIqrUYYsMR5U
 qg3NZboZQhqFrvswRID5EYi1dNWSfXYoOeLbAz/mXq0fQnaRhow517pXOCwyb4eNIZ
 fWUu83J1E8wkdWc6ssdus8cNUnrB1GORbs/l39QoUHc4Vb5EuAcfTBGA6wVb3lnol/
 u20DWpibC0Wii+RMLczbYihIqWOq3dWoQYcOygFlTYSerrw9578QnJLjF5S8/+5Y4g
 Br7dpYR86wGDA==
Received: from johan by xi.lan with local (Exim 4.97.1)
 (envelope-from <johan@kernel.org>) id 1raWGv-000000002Gp-4Agb;
 Thu, 15 Feb 2024 08:35:06 +0100
Date: Thu, 15 Feb 2024 08:35:05 +0100
From: Johan Hovold <johan@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/msm: Wire up tlb ops
Message-ID: <Zc2-qVd0gtErdbKe@hovoldconsulting.com>
References: <20240213172340.228314-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240213172340.228314-1-robdclark@gmail.com>
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

On Tue, Feb 13, 2024 at 09:23:40AM -0800, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> The brute force iommu_flush_iotlb_all() was good enough for unmap, but
> in some cases a map operation could require removing a table pte entry
> to replace with a block entry.  This also requires tlb invalidation.
> Missing this was resulting an obscure iova fault on what should be a
> valid buffer address.
> 
> Thanks to Robin Murphy for helping me understand the cause of the fault.
> 
> Cc: Robin Murphy <robin.murphy@arm.com>
> Fixes: b145c6e65eb0 ("drm/msm: Add support to create a local pagetable")

Sounds like you're missing a

Cc: stable@vger.kernel.org

here? Or is there some reason not to backport this fix (to 5.9 and later
kernels)?

> Signed-off-by: Rob Clark <robdclark@chromium.org>

Johan
