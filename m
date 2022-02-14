Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA88F4B5A49
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 19:59:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F40810E2A0;
	Mon, 14 Feb 2022 18:59:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB93510E2A0;
 Mon, 14 Feb 2022 18:59:14 +0000 (UTC)
Date: Mon, 14 Feb 2022 19:59:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1644865149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=zP8LB4HkVOqhmT8sSm46sr/fIq3ZeBB1Hp6r1eTFbwc=;
 b=XLySJoJxPEDoIi30Ct73No2HgK2/ZTbp23bFgiEjKpQQMiLVtoDD8hrv1Tf3cdZ0/Wzl/4
 SbJ0XBSoXTaAtwxkQrf9krklYsRBVJPRyWBHYtlam/8RxnR4hvWyY7LPZ6BXQKGt9/QouO
 hneDQ96o9vTrtO9GqI4nT0ckmme1z8azz47fz1jLa688jbXT9ASLXSjaFC1LnATJDQ2x98
 vIsz9HIVOiMwyhqP4sEUnrbx6FUI3qwJX9bYwY1iyEiB9Rc4g0p8T+dbsfv3wRQ9SdvMLI
 SU0q3F/fSuzoiZYvjR8/9D13Y6Fpbrx2WiUZqPXvQPexouAs7lVIdkhVq0EDaw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1644865149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=zP8LB4HkVOqhmT8sSm46sr/fIq3ZeBB1Hp6r1eTFbwc=;
 b=6dpPtEfAT4FQJ8CbBEi+aYwKxVuFnCwytcmlrY1eY8WOynkRXiCKT6QtTBCiNfJhVV7tD0
 riYs2MTf1egktXAw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915: Depend on !PREEMPT_RT.
Message-ID: <YgqmfKhwU5spS069@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are a few sections in the driver which are not compatible with
PREEMPT_RT. They trigger warnings and can lead to deadlocks at runtime.

Disable the i915 driver on a PREEMPT_RT enabled kernel. This way
PREEMPT_RT itself can be enabled without needing to address the i915
issues first. The RT related patches are still in RT queue and will be
handled later.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/gpu/drm/i915/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
index a4c94dc2e2164..3aa719d5a0f0d 100644
--- a/drivers/gpu/drm/i915/Kconfig
+++ b/drivers/gpu/drm/i915/Kconfig
@@ -3,6 +3,7 @@ config DRM_I915
 	tristate "Intel 8xx/9xx/G3x/G4x/HD Graphics"
 	depends on DRM
 	depends on X86 && PCI
+	depends on !PREEMPT_RT
 	select INTEL_GTT
 	select INTERVAL_TREE
 	# we need shmfs for the swappable backing store, and in particular
-- 
2.34.1

