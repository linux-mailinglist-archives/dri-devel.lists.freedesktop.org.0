Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4518AEDD75
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 14:50:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8190510E43D;
	Mon, 30 Jun 2025 12:50:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="omgPWYez";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEC1910E43D
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 12:49:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 563FB4401C;
 Mon, 30 Jun 2025 12:49:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF670C4CEE3;
 Mon, 30 Jun 2025 12:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751287798;
 bh=Z6T1jAb7F/sOa4Pcx+p6AtI4ROeujWx4zdFw1+uBdlc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=omgPWYezV1EF4qlGGewBzCYEEobJAAHwaZV4STrVhv411YETYtgjzbcpIhHgeI7lO
 A1Acz92apTURSm8dN0elKOE/XeoX2I7zmNrBgTh+ombWqbOyFsr5f1WqEYtMgDKL/x
 kgTsMFMVZPMHhENljMLXyg3zFyx48aukru7o9kbi7dLF/STdTggNY14o1CS2ig6HiT
 NzzNe37got/lugnnKvg76eFPisAC3jtEDDsiks3HjJXNhJA27VtGsQyYPXZ1mUQspH
 PRGMjl6zqeneWhIUQUdXMO+UCIcei01ele6hQ1+U1XrnNXcbrNAqJyY+PQ3wPb4cm+
 TyCp/ajuq/thg==
Date: Mon, 30 Jun 2025 14:49:52 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Philipp Stanner <phasta@kernel.org>
Cc: Matthew Brost <matthew.brost@intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/sched/tests: Make timedout_job callback a better
 role model
Message-ID: <aGKH8HUtiqID1mbe@pollux>
References: <20250605134154.191764-2-phasta@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250605134154.191764-2-phasta@kernel.org>
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

On Thu, Jun 05, 2025 at 03:41:55PM +0200, Philipp Stanner wrote:
> Since the drm_mock_scheduler does not have real users in userspace, nor
> does it have real hardware or firmware rings, it's not necessary to
> signal timedout fences nor free jobs - from a functional standpoint.
> 
> The unit tests, however, serve as a reference implementation and a first
> example for new scheduler users. Therefore, they should approximate the
> canonical usage as much as possible.
> 
> Make sure timed out hardware fences get signaled with the appropriate
> error code.
> 
> Signed-off-by: Philipp Stanner <phasta@kernel.org>

Given the discussion on this patch we agree that, unit test should remain to be
unit tests, but at the same time (as far as possible) represent the intended
usage of the scheduler's APIs.

Given that, "reference implementation" might be slightly overstated and we
should just say something along the lines of "make them represent the intended
usage of the scheduler's APIs".

Also, since this patch is a prerequisite of your teardown series, please mention
that in the commit message.

With that:

	Acked-by: Danilo Krummrich <dakr@kernel.org>

Fine for me if you fix up those two nits when applying the patch.

- Danilo
