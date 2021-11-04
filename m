Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 957234452FB
	for <lists+dri-devel@lfdr.de>; Thu,  4 Nov 2021 13:27:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A79736EEB4;
	Thu,  4 Nov 2021 12:27:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A949D6EEB4;
 Thu,  4 Nov 2021 12:27:09 +0000 (UTC)
Date: Thu, 4 Nov 2021 13:27:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1636028827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M6NqONrvOq66l/QYoFSVwjLleMhO22wOW4bvAS2dEVY=;
 b=NKcXU5k15e0NQfoYe+CBkb6tOMToV22terwbv/9kO1t2Hfha8/qkxJ/zExQbtnpZH6X93R
 PzUnSXkvFDDG4FGUDum9qM+EwYxcn1y3mHBpsqzfo78UwuhOMQnzSWJnuN9ymEjyhPB0k3
 AefuaLV6UO9aOVpis7RwqDu/UgVR67ETUdoRO0NhQxLoM6MVMWotVASNcy8fd7hzrzAM6R
 +TrBo/IxiK/WebTFrVh66GvhN4Co2P/OZaJ84k0RJPH5itXdwBUKVoXqoS0OKpo3JoF47H
 da8loeWJNeAPrCXC3Gz8VGEqqoKnHOQgG6VcKchkscWZWTFT5T9/8LN9iYE8RA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1636028827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M6NqONrvOq66l/QYoFSVwjLleMhO22wOW4bvAS2dEVY=;
 b=UyK9WVi/iF5JBJwpnzicusVrisGdl3Ncs9v/wBkhufwv8oLWvxDPOnxbS1NFB81TKyuj4q
 TQLBdzJcUcjgwHAg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH] kernel/locking: Use a pointer in ww_mutex_trylock().
Message-ID: <20211104122706.frk52zxbjorso2kv@linutronix.de>
References: <20210907132044.157225-1-maarten.lankhorst@linux.intel.com>
 <YTiM/zf8BuNw7wes@hirez.programming.kicks-ass.net>
 <96ab9cf1-250a-8f34-51ec-4a7f66a87b39@linux.intel.com>
 <YTnETRSy9H0CRdpc@hirez.programming.kicks-ass.net>
 <a7e5d99d-39c4-6d27-3029-4689a2a1a17a@linux.intel.com>
 <YTtznr85mg5xXouP@hirez.programming.kicks-ass.net>
 <e8a7754e-23e7-0250-5718-101a56d008f0@linux.intel.com>
 <YUBGPdDDjKlxAuXJ@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <YUBGPdDDjKlxAuXJ@hirez.programming.kicks-ass.net>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 Liam Girdwood <lgirdwood@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 Mark Brown <broonie@kernel.org>, Waiman Long <longman@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

mutex_acquire_nest() expects a pointer, pass the pointer.

Fixes: 12235da8c80a1 ("kernel/locking: Add context to ww_mutex_trylock()")
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---

Not sure why I haven't seen this earlier=E2=80=A6

 kernel/locking/ww_rt_mutex.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/locking/ww_rt_mutex.c b/kernel/locking/ww_rt_mutex.c
index 0e00205cf467a..d1473c624105c 100644
--- a/kernel/locking/ww_rt_mutex.c
+++ b/kernel/locking/ww_rt_mutex.c
@@ -26,7 +26,7 @@ int ww_mutex_trylock(struct ww_mutex *lock, struct ww_acq=
uire_ctx *ww_ctx)
=20
 	if (__rt_mutex_trylock(&rtm->rtmutex)) {
 		ww_mutex_set_context_fastpath(lock, ww_ctx);
-		mutex_acquire_nest(&rtm->dep_map, 0, 1, ww_ctx->dep_map, _RET_IP_);
+		mutex_acquire_nest(&rtm->dep_map, 0, 1, &ww_ctx->dep_map, _RET_IP_);
 		return 1;
 	}
=20
--=20
2.33.1

