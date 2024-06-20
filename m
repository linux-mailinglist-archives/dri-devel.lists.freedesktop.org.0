Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38EE690FF86
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 10:53:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3A3E10E2EC;
	Thu, 20 Jun 2024 08:53:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oXVBFWFk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEE9510E2EC
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 08:53:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id CDF0ECE233E;
 Thu, 20 Jun 2024 08:53:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 750ACC2BD10;
 Thu, 20 Jun 2024 08:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718873594;
 bh=hRpD2oSJk3bfMnna+VloVB0FekUlFFz8OfKZw12xrRU=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=oXVBFWFkXYMboO01m5otd0aUgNt+XduBzRcoZwzQzUUsguH91kQLxHK72/Di9yUu2
 NtML8B0Lo01QCAElbiyt3DmLcvo4Nr2sWqA866m/A/OY4cYOHyNTIJsFtFpPVngQzF
 IfWECGvvHGJJbsJ3PYv1V9X63T6Jv/E6nYWS7nd/fPBZCf8gaOIrE4KfrJTZu1ulFh
 DPk9GkKoVJFfnhPDDpS+sB/CjLtXtlNPHpfheZ4bGvmAW7BHniyk9avJ3wdw74C8hX
 3ePOuNj2TdTfmh5jHKBJQf13CbmIdRWk28jS5gZBZJF6W9l6YNzh1Bvhyb6Rmh6ByU
 PfD5IXSeGkpAg==
From: Maxime Ripard <mripard@kernel.org>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Amaranath Somalapuram <Amaranath.Somalapuram@amd.com>, 
 Andi Shyti <andi.shyti@linux.intel.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Boqun Feng <boqun.feng@gmail.com>, 
 Christian Koenig <christian.koenig@amd.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Huang Rui <ray.huang@amd.com>, Ingo Molnar <mingo@redhat.com>, 
 Karolina Stolarek <karolina.stolarek@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Waiman Long <longman@redhat.com>, 
 Will Deacon <will@kernel.org>
In-Reply-To: <20240619144630.4DliKOmr@linutronix.de>
References: <20240619144630.4DliKOmr@linutronix.de>
Subject: Re: (subset) [PATCH REPOST^2] drm/ttm/tests: Let ttm_bo_test
 consider different ww_mutex implementation.
Message-Id: <171887359115.3857922.3484081720728678081.b4-ty@kernel.org>
Date: Thu, 20 Jun 2024 10:53:11 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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

On Wed, 19 Jun 2024 16:46:30 +0200, Sebastian Andrzej Siewior wrote:
> PREEMPT_RT has a different locking implementation for ww_mutex. The
> base mutex of struct ww_mutex is declared as struct WW_MUTEX_BASE. The
> latter is defined as `mutex' for non-PREEMPT_RT builds and `rt_mutex'
> for PREEMPT_RT builds.
> 
> Using mutex_lock() directly on the base mutex in
> ttm_bo_reserve_deadlock() leads to compile error on PREEMPT_RT.
> 
> [...]

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime

