Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB19A96711
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 13:13:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F18D810E562;
	Tue, 22 Apr 2025 11:13:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Jr58tEVV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCCCE10E562;
 Tue, 22 Apr 2025 11:13:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C3F5243C66;
 Tue, 22 Apr 2025 11:13:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86ABAC4CEE9;
 Tue, 22 Apr 2025 11:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745320424;
 bh=Dsvlpt31ZZwdc/+u12tiS8/6gNYWWWDpD3cN9UYvJ2M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Jr58tEVVY0CUqSuy1NBUivbU0H6R0imgfmP12UBQ+/14dxz1fUR/q8g53betoq+Q3
 ohW4V5gkOwFNghI/AtB0uOMZh5RqXIiRTtq318Ye5SpyIG7NDJ1L3f9zjzhXYP/uwq
 07aemBpzszUln+vv/IOdks5yIYDM5mLrNVp9sXLP4QAUoTTJklPq7tG9MBOofjEIPE
 wR6r0neXOndHAeX5TvvFcPSVxghUIKUpPui6fANbrxSmKEJs17Z1msWA78Z0qQod25
 JDWEr4ZnLt/X1GmoqJ2wjjmmXJiuxzuy5otX8pbyjlEQijmEaFqLG5q6B4piMjd/A9
 Z6O8/Zxn9N76g==
Date: Tue, 22 Apr 2025 13:13:38 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: phasta@kernel.org, Lyude Paul <lyude@redhat.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matthew Brost <matthew.brost@intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] drm/sched: Warn if pending list is not empty
Message-ID: <aAd54jUwBwgc-_g2@cassiopeiae>
References: <20250407152239.34429-2-phasta@kernel.org>
 <20250407152239.34429-5-phasta@kernel.org>
 <9607e5a54b8c5041dc7fc134425cc36c0c70b5f3.camel@mailbox.org>
 <3ac34c84-fd84-4598-96e1-239418b7109f@igalia.com>
 <aADv4ivXZoJpEA7k@pollux>
 <83758ca7-8ece-433e-b904-3d21690ead23@igalia.com>
 <aAEUwjzZ9w9xlKRY@cassiopeiae>
 <0e8313dc-b1bb-4ce7-b5b7-b8b3e027adb7@igalia.com>
 <0bfa746ca37de1813db22e518ffb259648d29e02.camel@mailbox.org>
 <5a5d4a33-2f7b-46e4-8707-7445ac3de376@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5a5d4a33-2f7b-46e4-8707-7445ac3de376@igalia.com>
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

On Tue, Apr 22, 2025 at 11:39:11AM +0100, Tvrtko Ursulin wrote:
> Question I raised is if there are other drivers which manage to clean up
> everything correctly (like the mock scheduler does), but trigger that
> warning. Maybe there are not and maybe mock scheduler is the only false
> positive.

So far the scheduler simply does not give any guideline on how to address the
problem, hence every driver simply does something (or nothing, effectively
ignoring the problem). This is what we want to fix.

The mock scheduler keeps it's own list of pending jobs and on tear down stops
the scheduler's workqueues, traverses it's own list and eventually frees the
pending jobs without updating the scheduler's internal pending list.

So yes, it does avoid memory leaks, but it also leaves the schedulers internal
structures with an invalid state, i.e. the pending list of the scheduler has
pointers to already freed memory.

What if the drm_sched_fini() starts touching the pending list? Then you'd end up
with UAF bugs with this implementation. We cannot invalidate the schedulers
internal structures and yet call scheduler functions - e.g. drm_sched_fini() -
subsequently.

Hence, the current implementation of the mock scheduler is fundamentally flawed.
And so would be *every* driver that still has entries within the scheduler's
pending list.

This is not a false positive, it already caught a real bug -- in the mock
scheduler.

- Danilo
