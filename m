Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3F3ADAE1A
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 13:14:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2140C10E334;
	Mon, 16 Jun 2025 11:14:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="poTc6uX6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E38E310E334
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 11:14:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1CC8761129;
 Mon, 16 Jun 2025 11:14:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 390E3C4CEEA;
 Mon, 16 Jun 2025 11:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750072473;
 bh=VZZo+aCl6+dXnlCGePMF/rZ1WwtiQvnwXNGuroBTNn4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=poTc6uX650GKBbu+vV5wJ6gYwde7JHgk1DoVkhso/gL/cM0NqmE/qh/6h/UtFgrC3
 VAJidaU8D6xDop6SQyCW8PE1qftVPCurOwDPTtHQMqJmVqk33car5keZEwOaOYedBb
 fsPNE2r6FImhHKV5abzMRzKcpPNfilIFmyn/cZ1IVbINRWUTPMlwqT8on9bjce5jr+
 7g8q+448nTTZq6hFRSaWEu60s5GGUsKyGTiIyKT1u3y30TJUBPwD206FEbKkzZV2QL
 qyspu1fXEHR63NFgjhGqcHN5rxsRBcGHgjLcy1cQd9V1L1SwEzTBnYNWnHn+6gy85b
 9Cynmn5hzzsxw==
Date: Mon, 16 Jun 2025 13:14:28 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Philipp Stanner <phasta@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/sched/tests: Make timedout_job callback a better
 role model
Message-ID: <aE_8lDuMFFhJBeUY@pollux>
References: <20250605134154.191764-2-phasta@kernel.org>
 <e1b65491-781c-48f7-9368-58d7ede91b12@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e1b65491-781c-48f7-9368-58d7ede91b12@igalia.com>
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

On Mon, Jun 16, 2025 at 11:57:47AM +0100, Tvrtko Ursulin wrote:
> Code looks fine, but currently nothing is broken and I disagree with the
> goal that the _mock_^1 components should be role models. The idea is to
> implement as little in the mock components as it is required to exercise the
> tested functionality.

No, please consider the following.

  1) When we write tests for common infrastructure we should be testing things
     as close as possible to how we intend real code to use this infrastructure.
     Relying on internals in creative ways is likely to underrun this testing.

  2) Being close to a reference design is a good thing, why wouldn't we want
     that? The reality is that people *will* look at this code for reference.

> Also, there are various ways drivers use the scheduler API. Trying to make
> the mock scheduler a reference driver implementation would only be able to
> make it a reference for one possible use.

Why? Nothing prevents us from covering all of them eventually.

If for now, we just implement one of them, that's better than none, so why not?
