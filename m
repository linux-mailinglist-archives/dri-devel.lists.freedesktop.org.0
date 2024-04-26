Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C91C18B30FF
	for <lists+dri-devel@lfdr.de>; Fri, 26 Apr 2024 09:01:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBEFE11AAC1;
	Fri, 26 Apr 2024 07:01:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="bnp3KP6L";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Upx4r8s2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFED911AABF
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 07:01:39 +0000 (UTC)
Date: Fri, 26 Apr 2024 09:01:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1714114897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KhbkajkPilpMFKWF3/bPzw2/vq2idKSh56YEtoOVNO4=;
 b=bnp3KP6LKRnRtMQT6QHaEbILu0U1AQDhVc77zVeXkFhsUNjoEaZ+8teCg/uIa4jayB4oQj
 ipeSxD6Ep8skNPZAwPc4+erRI8KwAlKWNcKMrIEXlROkDgMZ7PKFHGsnFAB2CUjo2g/Zcv
 9sr6Rd2QQhy6I6pJCxzWygWxOBj38ZQWu9CzBfN87vIDVDstScuwglTbiSm43GNLNwRtJf
 YXcMgM7z5A/chHnI9E/gTz4w9QdlxE+7Hk2e1gISxHm/g7LafJywCvIIb+jl7cBeTSoZKa
 UeWjhvkuAOPnKME5TNQ+X2GMTEcgqh7Be5cz8j4Lm8JVCLLtWCyPnBdl9Mikgg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1714114897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KhbkajkPilpMFKWF3/bPzw2/vq2idKSh56YEtoOVNO4=;
 b=Upx4r8s28oa23izOHCl+KYwl/jZPNKRp6HyVuAGQusorIK3yunfWJMnYKEAl70LOcALp0a
 eLX85w4p9ZmAQPDA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: dri-devel@lists.freedesktop.org
Cc: Christian Koenig <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Huang Rui <ray.huang@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/ttm/tests: Let ttm_bo_test consider different
 ww_mutex implementation.
Message-ID: <20240426070135.Lrtz6H-I@linutronix.de>
References: <20240404102534.QTa80QPY@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240404102534.QTa80QPY@linutronix.de>
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

On 2024-04-04 12:25:36 [+0200], To dri-devel@lists.freedesktop.org wrote:
> PREEMPT_RT has a different locking implementation for ww_mutex. The
> base mutex of struct ww_mutex is declared as struct WW_MUTEX_BASE. The
> latter is defined as `mutex' for non-PREEMPT_RT builds and `rt_mutex'
> for PREEMPT_RT builds.
> 
> Using mutex_lock() directly on the base mutex in
> ttm_bo_reserve_deadlock() leads to compile error on PREEMPT_RT.
> 
> The locking-selftest has its own defines to deal with this and it is
> probably best to defines the needed one within the test program since
> their usefulness is limited outside of well known selftests.
> 
> Provide ww_mutex_base_lock() which points to the correct function for
> PREEMPT_RT and non-PREEMPT_RT builds.
> 
> Fixes: 995279d280d1e ("drm/ttm/tests: Add tests for ttm_bo functions")
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
> 
> For the record, testing led to
> | WARNING: CPU: 5 PID: 2089 at include/drm/ttm/ttm_bo.h:247 ttm_bo_reserve_no_wait_ticket+0xe8/0x150 [ttm_bo_test]
> 
> but this occurred with and without RT on v6.9-rc2.

a friendly ping.

Sebastian
