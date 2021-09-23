Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D3E4162C6
	for <lists+dri-devel@lfdr.de>; Thu, 23 Sep 2021 18:10:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC3F56ED91;
	Thu, 23 Sep 2021 16:10:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 361 seconds by postgrey-1.36 at gabe;
 Thu, 23 Sep 2021 16:10:24 UTC
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70F546ED91;
 Thu, 23 Sep 2021 16:10:24 +0000 (UTC)
Message-ID: <20210923153339.808080761@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1632413071;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=AUasnRadxctw2sB5UrBju7dW3LJOwPsCj4pLP6/jnbE=;
 b=GiGpkkpyuxUHUsK3t4jX5+svnLLUcPeRcfJElJVpTOVFZvwjhYsOn9LeVwFFyIiYQtUijQ
 FWqnBjyfobezE+Gz6YQFv3Z1yNDUX00ef7kIKE17GIsSoEGEW6oBWw3Cd/WbSlFKfQcO2k
 /PGpF4h2me5alkLmoTU4qffDK+flKORkQMYaqFWXSnnsaHAiAtdv9w5hC+4ErLzB35mpn+
 AtTyZLUp8bPv5CWccaeZG9zYYgonc58w10wyrKpd3HExr/9CFAunNncXUv0z+eEso+GWWv
 L2JTLvj6HhKUIFiawEiTn8Ik0f7tWMwNI93JEzyH/Qa95JMYQ2uG8uakW+8gzg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1632413071;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=AUasnRadxctw2sB5UrBju7dW3LJOwPsCj4pLP6/jnbE=;
 b=HuivklyujFCi3vNFmJv/0xTD3In63M+RxbhmgKfRTaqrZkLudpz2XMLWK5lIDkxbKF9tN1
 z5QFv7P3szOOpJDw==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [patch 07/11] drm/i915/pmu: Use hrtimer_forward_now()
References: <20210923153311.225307347@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Thu, 23 Sep 2021 18:04:30 +0200 (CEST)
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

hrtimer_forward() is about to be removed from the public
interfaces. Replace it with hrtimer_forward_now() which provides the same
functionality.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: David Airlie <airlied@linux.ie>
Cc: intel-gfx@lists.freedesktop.org
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/i915/i915_pmu.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/drivers/gpu/drm/i915/i915_pmu.c
+++ b/drivers/gpu/drm/i915/i915_pmu.c
@@ -439,7 +439,7 @@ static enum hrtimer_restart i915_sample(
 	engines_sample(gt, period_ns);
 	frequency_sample(gt, period_ns);
 
-	hrtimer_forward(hrtimer, now, ns_to_ktime(PERIOD));
+	hrtimer_forward_now(hrtimer, ns_to_ktime(PERIOD));
 
 	return HRTIMER_RESTART;
 }

