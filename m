Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3512F9AD4F1
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 21:40:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86BBA10E84F;
	Wed, 23 Oct 2024 19:40:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CbCPwqep";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 282E210E0DC;
 Wed, 23 Oct 2024 19:40:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CA5A75C579A;
 Wed, 23 Oct 2024 19:40:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1CEBC4CEC6;
 Wed, 23 Oct 2024 19:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729712430;
 bh=EzbjkPV90UV6QSJhV+s0C5L6lHibDPt+fsO73VymlbQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CbCPwqepSOehGxvj4gxImQczmfNz6ssonAwXnbbgdnyvPL/xrQiub53FEqxdCV80o
 DkG/ZkcumVc7HGvXQg1oCnjbO0fWI1cd9oekU3fUc8kUzkzALUdJzLJ1xSKOLAx5Uy
 SWOtIgR5BVQfUCpaOvtXh1InOxF1+VyPK6f/2jal2UlIWa6sq9RBOIChEiAQRs+NDb
 0rA3fu8lV6jjh/VEGsfd1lOoV3ucJvs4gS7seWhJ8SfPlRpA3LfeFhT8KchgCW/aOC
 NwZPM5I45elC7TC3Wy8ZnOueGG9M7xLkcJJc3flG57bViAFasvRZfxtIS1+cqq3BHO
 /S6imokpMEAkQ==
Date: Wed, 23 Oct 2024 09:40:28 -1000
From: Tejun Heo <tj@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Zefan Li <lizefan.x@bytedance.com>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Friedrich Vock <friedrich.vock@gmx.de>, cgroups@vger.kernel.org,
 linux-mm@kvack.org, Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH 0/7] kernel/cgroups: Add "dev" memory accounting cgroup.
Message-ID: <ZxlRLMwkabTaOrjc@slm.duckdns.org>
References: <20241023075302.27194-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023075302.27194-1-maarten.lankhorst@linux.intel.com>
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

On Wed, Oct 23, 2024 at 09:52:53AM +0200, Maarten Lankhorst wrote:
> New submission!
> I've added documentation for each call, and integrated the renaming from
> drm cgroup to dev cgroup, based on maxime ripard's work.
> 
> Maxime has been testing this with dma-buf heaps and v4l2 too, and it seems to work.
> In the initial submission, I've decided to only add the smallest enablement possible,
> to have less chance of breaking things.
> 
> The API has been changed slightly, from "$name region.$regionname=$limit" in a file called
> dev.min/low/max to "$subsystem/$name $regionname=$limit" in a file called dev.region.min/low/max.
> 
> This hopefully allows us to perhaps extend the API later on with the possibility to
> set scheduler weights on the device, like in
> 
> https://blogs.igalia.com/tursulin/drm-scheduling-cgroup-controller/
> 
> Maarten Lankhorst (5):
>   kernel/cgroup: Add "dev" memory accounting cgroup

Yeah, let's not use "dev" name for this. As Waiman pointed out, it conflicts
with the devices controller from cgroup1. While cgroup1 is mostly
deprecated, the same features are provided through BPF in systemd using the
same terminologies, so this is going to be really confusing.

What happened with Tvrtko's weighted implementation? I've seen many proposed
patchsets in this area but as far as I could see none could establish
consensus among GPU crowd and that's one of the reasons why nothing ever
landed. Is the aim of this patchset establishing such consensus?

If reaching consensus doesn't seem feasible in a predictable timeframe, my
suggesstion is just extending the misc controller. If the only way forward
here is fragmented vendor(s)-specific implementations, let's throw them into
the misc controller.

Thanks.

-- 
tejun
