Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36EE99AED17
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 19:06:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54B4A10E39C;
	Thu, 24 Oct 2024 17:06:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="H67NQSuT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9070410E39C;
 Thu, 24 Oct 2024 17:06:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 27B915C55A9;
 Thu, 24 Oct 2024 17:06:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58187C4CEC7;
 Thu, 24 Oct 2024 17:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729789597;
 bh=+U29CBBz+qyrBtOdbE4svz7p2WVJRzBvoR7WRuDzFdY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=H67NQSuT2jRkzudyo8hcBaXGPRd16RtbucKKIBDbfx8FkTwAr4zIhYlZeE6WCQ/kL
 pOKgojXUIUeRkXcF/JFapYxnKLfLT7nZKbkLAKrxpqPscdWWU/vZjnV9zgg6XNOwgL
 wzbEkT0znzv5FxmEY4Ik7sEPxZyKemenvHZVbJw9VzPtVg/PgDCFm0JQgIUZq58Or+
 5DfzEOvuXqappQSjGsEuZ0aK5qCv0QOW0YM94EAZUdRdzXgVozd7QdkrIs0W5Sk+Nu
 qXaSipjzcAFgRXjcGCCgHoU/+HUqUJSQmpfcF9fFh3O20JLZ5Ja/v/FZVntFobZCnF
 OY5WfqO8VubRg==
Date: Thu, 24 Oct 2024 07:06:36 -1000
From: Tejun Heo <tj@kernel.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-xe@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Zefan Li <lizefan.x@bytedance.com>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Friedrich Vock <friedrich.vock@gmx.de>, cgroups@vger.kernel.org,
 linux-mm@kvack.org
Subject: Re: [PATCH 0/7] kernel/cgroups: Add "dev" memory accounting cgroup.
Message-ID: <Zxp-nLXOJXoSy8BN@slm.duckdns.org>
References: <20241023075302.27194-1-maarten.lankhorst@linux.intel.com>
 <ZxlRLMwkabTaOrjc@slm.duckdns.org>
 <20241024-beautiful-spaniel-of-youth-f75b61@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024-beautiful-spaniel-of-youth-f75b61@houat>
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

On Thu, Oct 24, 2024 at 09:20:43AM +0200, Maxime Ripard wrote:
...
> > Yeah, let's not use "dev" name for this. As Waiman pointed out, it conflicts
> > with the devices controller from cgroup1. While cgroup1 is mostly
> > deprecated, the same features are provided through BPF in systemd using the
> > same terminologies, so this is going to be really confusing.
> 
> Yeah, I agree. We switched to dev because we want to support more than
> just DRM, but all DMA-able memory. We have patches to support for v4l2
> and dma-buf heaps, so using the name DRM didn't feel great either.
> 
> Do you have a better name in mind? "device memory"? "dma memory"?

Maybe just dma (I think the term isn't used heavily anymore, so the word is
kinda open)? But, hopefully, others have better ideas.

> > What happened with Tvrtko's weighted implementation? I've seen many proposed
> > patchsets in this area but as far as I could see none could establish
> > consensus among GPU crowd and that's one of the reasons why nothing ever
> > landed. Is the aim of this patchset establishing such consensus?
> 
> Yeah, we have a consensus by now I think. Valve, Intel, Google, and Red
> Hat have been involved in that series and we all agree on the implementation.

That's great to hear.

> Tvrtko aims at a different feature set though: this one is about memory
> allocation limits, Tvrtko's about scheduling.
> 
> Scheduling doesn't make much sense for things outside of DRM (and even
> for a fraction of all DRM devices), and it's pretty much orthogonal. So
> i guess you can expect another series from Tvrtko, but I don't think
> they should be considered equivalent or dependent on each other.

Yeah, I get that this is about memory and that is about processing capacity,
so the plan is going for separate controllers for each? Or would it be
better to present both under the same controller interface? Even if they're
going to be separate controllers, we at least want to be aligned on how
devices and their configurations are presented in the two controllers.

Thanks.

-- 
tejun
