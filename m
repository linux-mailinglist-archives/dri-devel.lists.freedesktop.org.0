Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9919F5603
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 19:23:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEDA410EA57;
	Tue, 17 Dec 2024 18:23:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Zg0NbAka";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75E0010EA56;
 Tue, 17 Dec 2024 18:23:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id F274AA41D69;
 Tue, 17 Dec 2024 18:21:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34677C4CED7;
 Tue, 17 Dec 2024 18:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734459820;
 bh=seqaTS+B/Yvq2Zz8QYWQ8AUjQjPku14beCw+oXyf0fQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Zg0NbAkaqSVYJo0rwXVva0ubr0lourBVfpN5/mBCzcihaP16z1+uAcYh0LbyDrFln
 Md/oP7CkhdJFp9WbOVo7eM0G+lPytUIGF67xhK4SNsEF9UWj9KbIHZ/hICcv1kJGt2
 UhUD7hSPeexLUVUQHJsdc5Qx8rsltHK7GeTh6E2Je+ij7y4wez6HezL5SY5IG2jCtn
 HcQiup0NgN1nFtJ2rmvf4J2FC2PPQTUA6t//MU8lheUmDfnP87YHeoWcqrB/eIFNbd
 z5DML9mKi6cVhMQnNPv11p80I0hzzNFKnWXFcUlYO9Ao3B/Eud7NCn823itluC6I+s
 T+7VvSo4+2IRQ==
Date: Tue, 17 Dec 2024 08:23:38 -1000
From: Tejun Heo <tj@kernel.org>
To: Maarten Lankhorst <dev@lankhorst.se>
Cc: Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Zefan Li <lizefan.x@bytedance.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Friedrich Vock <friedrich.vock@gmx.de>, cgroups@vger.kernel.org,
 linux-mm@kvack.org, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH v2 0/7] kernel/cgroups: Add "dmem" memory accounting
 cgroup.
Message-ID: <Z2HBqtKDSTkd1lST@slm.duckdns.org>
References: <20241204134410.1161769-1-dev@lankhorst.se>
 <20241213-proud-kind-uakari-df3a70@houat>
 <80c49a80-d49c-4ca5-9568-9f7950618275@lankhorst.se>
 <20241213-gentle-glittering-salamander-22addf@houat>
 <5a50a992-9286-4179-8031-ffb514bca34f@lankhorst.se>
 <20241217-meek-bullfinch-of-luck-2c3468@houat>
 <a69a3500-be17-4899-bdb9-c6a63bf8dc81@lankhorst.se>
 <Z2GwpOQDVshpv-ml@slm.duckdns.org>
 <c0a539e7-0f1b-496a-9848-73a7ada66bfb@lankhorst.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c0a539e7-0f1b-496a-9848-73a7ada66bfb@lankhorst.se>
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

On Tue, Dec 17, 2024 at 06:37:22PM +0100, Maarten Lankhorst wrote:
> Den 2024-12-17 kl. 18:11, skrev Tejun Heo:
> > On Tue, Dec 17, 2024 at 03:28:50PM +0100, Maarten Lankhorst wrote:
> > > Now that all patches look good, what is needed to merge the series? Without
> > > patch 6/7 as it is a hack for testing.
> > 
> > There were some questions raised about device naming. One thing we want to
> > get right from the beginning is the basic interface.
> > 
> > Thanks.
> > 
> I believe it was solved. The conclusion appears to be that we go with how we
> defined it in this series. drm/$pciid/$regionname. With the only regions
> defined now being VRAM. Main memory will be a followup, but requires some
> discussions on hwo to be prevent double accounting, and what to do with the
> limited amount of mappable memory.

Provided Johannes is okay with the series, how do you want to route the
series? If you want to route it through drm, that's fine by me and please
feel free to add:

 Acked-by: Tejun Heo <tj@kernel.org>

Thanks.

-- 
tejun
