Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7A6AC0DAE
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 16:09:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78E4010EA65;
	Thu, 22 May 2025 14:09:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4337D10EA65
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 14:09:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0CC3C45314;
 Thu, 22 May 2025 14:09:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F182EC4CEE4;
 Thu, 22 May 2025 14:09:45 +0000 (UTC)
Date: Thu, 22 May 2025 15:09:43 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <lumag@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/vc4: tests: pv_muxing: Fix locking
Message-ID: <aC8wJ9EbkB0x5AUP@arm.com>
References: <20250520-drm-vc4-kunit-fixes-v1-1-ca281e485f8e@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520-drm-vc4-kunit-fixes-v1-1-ca281e485f8e@kernel.org>
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

On Tue, May 20, 2025 at 02:08:36PM +0200, Maxime Ripard wrote:
> Commit 30188df0c387 ("drm/tests: Drop drm_kunit_helper_acquire_ctx_alloc()")
> removed a kunit-managed function to get a drm_modeset_acquire_ctx.
> 
> It converted the vc4_pv_muxing_test_init() function, used by
> drm_vc4_test_pv_muxing() and drm_vc4_test_pv_muxing_invalid(). However,
> during that conversion, it went from being kzalloc'd to being allocated
> on the stack.
> 
> vc4_pv_muxing_test_init() then uses that context to allocate a
> drm_atomic_state using drm_kunit_helper_atomic_state_alloc(), which
> stores a pointer to the locking context in the allocated state.
> 
> However, since vc4_pv_muxing_test_init() is a test init function, the
> context is then cleared when we leave the function, and before executing
> the test. We're then running the test with a dangling pointer, which
> then leads to various crashes.
> 
> Rework the context initialization and state allocation to move them to
> drm_vc4_test_pv_muxing() and drm_vc4_test_pv_muxing_invalid().
> 
> Fixes: 30188df0c387 ("drm/tests: Drop drm_kunit_helper_acquire_ctx_alloc()")
> Reported-by: Catalin Marinas <catalin.marinas@arm.com>
> Closes: https://lore.kernel.org/r/Z_95jWM2YMTGy3pi@arm.com/
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

FWIW, I no longer get the kernel panic:

Tested-by: Catalin Marinas <catalin.marinas@arm.com>
