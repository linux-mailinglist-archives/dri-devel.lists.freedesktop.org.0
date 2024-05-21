Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7478CAE8C
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 14:50:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8E9510E8C6;
	Tue, 21 May 2024 12:50:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="Eep2xiQ+";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="axHlTxIl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D07610E8C6
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 12:50:02 +0000 (UTC)
Date: Tue, 21 May 2024 14:49:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1716295799;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=daEVLXiuCMnOjYfc+r6a6FKwQaC9sGqI6S2F7BgngOY=;
 b=Eep2xiQ+WMPgY9dk0UMMs3XFkP/ZFDXqsIGXwWuacCIYf5nFd9yuXzVuDtmkw3sQCKuR+V
 5hzztVnJoVbj7sC9sAvMg8xW7tl+55K0OXrDSxK4eEuOimMKxY+tN8EggiWZ4yWJnG7tXh
 jZZEVFiR8+9fR7DHIODitSVsa9uLpjUCJit3Vzq0onfJVUHjkNXAesGTClqJo0EWkywJ/D
 5N9Qat6mtdEFsixxz0Cg1mXGubbZjkCt1OzpGCerUAWolC7LEMgq50ttBir1yqwc+IDSZH
 KLXJfCHCx3XyesyL++AcOJGsyBdrYGi+qQGB+H3YlvJBycmC4pvqCUuBrt+n4A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1716295799;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=daEVLXiuCMnOjYfc+r6a6FKwQaC9sGqI6S2F7BgngOY=;
 b=axHlTxIlEngZl3EuiwHLZ/uO3g0s7HX/L6SX5RIZu/nbZpyArOuk1lbEkEzSPbucELQpdQ
 dFvSk4C5ge79KdCg==
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
Message-ID: <20240521124958.PpoM3jsD@linutronix.de>
References: <20240404102534.QTa80QPY@linutronix.de>
 <20240426070135.Lrtz6H-I@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240426070135.Lrtz6H-I@linutronix.de>
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

On 2024-04-26 09:01:37 [+0200], To dri-devel@lists.freedesktop.org wrote:
> On 2024-04-04 12:25:36 [+0200], To dri-devel@lists.freedesktop.org wrote:
> > PREEMPT_RT has a different locking implementation for ww_mutex. The
> > base mutex of struct ww_mutex is declared as struct WW_MUTEX_BASE. The
> > latter is defined as `mutex' for non-PREEMPT_RT builds and `rt_mutex'
> > for PREEMPT_RT builds.
> > 
> > Using mutex_lock() directly on the base mutex in
> > ttm_bo_reserve_deadlock() leads to compile error on PREEMPT_RT.
> > 
> > The locking-selftest has its own defines to deal with this and it is
> > probably best to defines the needed one within the test program since
> > their usefulness is limited outside of well known selftests.
> > 
> > Provide ww_mutex_base_lock() which points to the correct function for
> > PREEMPT_RT and non-PREEMPT_RT builds.
> > 
> > Fixes: 995279d280d1e ("drm/ttm/tests: Add tests for ttm_bo functions")
> > Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> > ---
> > 
> > For the record, testing led to
> > | WARNING: CPU: 5 PID: 2089 at include/drm/ttm/ttm_bo.h:247 ttm_bo_reserve_no_wait_ticket+0xe8/0x150 [ttm_bo_test]
> > 
> > but this occurred with and without RT on v6.9-rc2.
> 
> a friendly ping.

ping ;)

Sebastian
