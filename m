Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54350AB8DC7
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 19:30:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8167010E92E;
	Thu, 15 May 2025 17:30:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DzdUMlrW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06CCE10E92B;
 Thu, 15 May 2025 17:30:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C52C6A4E34F;
 Thu, 15 May 2025 17:30:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23E8EC4CEE7;
 Thu, 15 May 2025 17:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747330201;
 bh=Hke/yO7FqtLJ+q550xCAf3LK2tczfK5NfvanpWrVDEo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DzdUMlrWQQDdNKXyR4zvX+NJwwG/gFkAVpsWJp/MLgoafxNERKr6JdVink1pMfbmF
 a57ODNtc2ODCxr4TVkOjCSsFApX4b4kDffVvqrsiUox3tWNSe98pvKSiWR5Bpesqtv
 k0WQGbuCN4wudkR7DwOtCeTt4cqn7H4B5/4tQ67d4l4P1+OJ3w9giBB423Sagm1wiE
 Mz62LWU1RSkB6Cr/qQjTfdXjKJe/j0Zx4hMgk6M9V/Y2wbac8tWk9pC3hWFY0vZsDc
 4xzLUcm+FbwL9RCoe11V5SiJBbr1hY+I9WOwPISgVeL+jOSxYeYKZ8DmwIiMC3PjKT
 KjNFQREF2Iddw==
Date: Thu, 15 May 2025 19:29:55 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Rob Clark <robdclark@chromium.org>, phasta@kernel.org,
 Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Matthew Brost <matthew.brost@intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v4 04/40] drm/sched: Add enqueue credit limit
Message-ID: <aCYkk4Y7feltfp79@pollux>
References: <20250514170118.40555-1-robdclark@gmail.com>
 <20250514170118.40555-5-robdclark@gmail.com>
 <51f87f358fa1b7ef8db8b67ee6cde38ae071fbe8.camel@mailbox.org>
 <CAJs_Fx771FFVDVFMn8YJkR9f9Ad-UQspJ9KKQw4u6Cu4TA7YPA@mail.gmail.com>
 <CACu1E7EL+E-M0N-EAN9Bx7u9O6_pECQQdPE2ph575idhVb2Szg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACu1E7EL+E-M0N-EAN9Bx7u9O6_pECQQdPE2ph575idhVb2Szg@mail.gmail.com>
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

(Cc: Boris)

On Thu, May 15, 2025 at 12:22:18PM -0400, Connor Abbott wrote:
> For some context, other drivers have the concept of a "synchronous"
> VM_BIND ioctl which completes immediately, and drivers implement it by
> waiting for the whole thing to finish before returning.

Nouveau implements sync by issuing a normal async VM_BIND and subsequently
waits for the out-fence synchronously.

> But this
> doesn't work for native context, where everything has to be
> asynchronous, so we're trying a new approach where we instead submit
> an asynchronous bind for "normal" (non-sparse/driver internal)
> allocations and only attach its out-fence to the in-fence of
> subsequent submits to other queues.

This is what nouveau does and I think other drivers like Xe and panthor do this
as well.

> Once you do this then you need a
> limit like this to prevent memory usage from pending page table
> updates from getting out of control. Other drivers haven't needed this
> yet, but they will when they get native context support.

What are the cases where you did run into this, i.e. which application in
userspace hit this? Was it the CTS, some game, something else?
