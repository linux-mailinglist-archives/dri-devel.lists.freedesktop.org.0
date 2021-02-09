Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55BD8314F53
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 13:44:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C4BF6EB14;
	Tue,  9 Feb 2021 12:44:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B362A6EB11;
 Tue,  9 Feb 2021 12:44:45 +0000 (UTC)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1612874684;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KEa1InnPF5EuT5Iy/fi3GjgUJ0wnNen8cYmBEvVp/GM=;
 b=DljWuqE0TWElG7FkbO1ovGUu+gNuT6NUi5nJvyQ2u2TUJhdoLvcvhVl1fKG9kjjeGXWNAg
 gbXop3plyyGft2Q59ihFq2yq49lXJyaHUrtjfKpR2c2XsOP+N6ATssHlyZu5ssfKbWAbvM
 zZKyw8wLNzIsjKZDGXm2YdJxJvlCGhMqYdCyJOlT3OhRG3w6WvCBDignDnzfW4NwRPc2Bc
 ZNvoBLz/+RQsolxKk6ZAS8CFd0cGSMmnUSw5/uRu3kZlNcvpiujsyGcLSW2O+vt9ErYp6j
 Gm1aLShfYsTtYXBRJ0Gj04KSwzGuTmWFPSdHvuHwkx27ojo9tbG2Bcfo/l6GSw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1612874684;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KEa1InnPF5EuT5Iy/fi3GjgUJ0wnNen8cYmBEvVp/GM=;
 b=hqeLNqeier5r5IG2+445JUK6Dws43OIa+df3UUiokXklC+fcpPSkMV1it6J/b07LYXzRgr
 mvwHcFurJq4JahDQ==
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/3] drm/amdgpu: Replace in_interrupt() usage in
 gmc_v*_process_interrupt()
Date: Tue,  9 Feb 2021 13:44:37 +0100
Message-Id: <20210209124439.408140-2-bigeasy@linutronix.de>
In-Reply-To: <20210209124439.408140-1-bigeasy@linutronix.de>
References: <20210209124439.408140-1-bigeasy@linutronix.de>
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The usage of in_interrupt() in gmc_v*_process_interrupt() is intended to
use a different code path if invoked from the interrupt handler vs
invoked from the workqueue.

The usage of in_interrupt() in drivers is phased out and Linus clearly
requested that code which changes behaviour depending on context should
either be separated or the context be conveyed in an argument passed by the
caller, which usually knows the context.

gmc_v*_process_interrupt() is invoked via the ->process() callback
from amdgpu_ih_process() which in turn is invoked either from
amdgpu_irq_handler() (the interrupt handler) or from
amdgpu_irq_handle_*() which is a workqueue.

amdgpu_irq::ih is always processed from the interrupt handler, the other
three struct amdgpu_ih_ring members are processed from a workqueue.

Replace the in_interrupt() check with a comparison against adev->irq.ih.
A similar check is already done to check if the ih pointer is from
ih_soft.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c | 2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
index 3b7c6c31fce1f..7b6791d699e27 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
@@ -113,7 +113,7 @@ static int gmc_v10_0_process_interrupt(struct amdgpu_device *adev,
 		/* Delegate it to a different ring if the hardware hasn't
 		 * already done it.
 		 */
-		if (in_interrupt()) {
+		if (entry->ih == &adev->irq.ih) {
 			amdgpu_irq_delegate(adev, entry, 8);
 			return 1;
 		}
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
index aedef9017c4c2..266296be7302d 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
@@ -486,7 +486,7 @@ static int gmc_v9_0_process_interrupt(struct amdgpu_device *adev,
 		/* Delegate it to a different ring if the hardware hasn't
 		 * already done it.
 		 */
-		if (in_interrupt()) {
+		if (entry->ih == &adev->irq.ih) {
 			amdgpu_irq_delegate(adev, entry, 8);
 			return 1;
 		}
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
