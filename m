Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C29CB29FF9B
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 09:23:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 517706E97F;
	Fri, 30 Oct 2020 08:23:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 188B46E8E2;
 Thu, 29 Oct 2020 16:50:53 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id 126so4170657lfi.8;
 Thu, 29 Oct 2020 09:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U0tBXDISJ7PKav4r0CxWwIZDBb4jy3ecrSqgpsbA5/M=;
 b=qMTUAse97Ag4sY/heShgNSsNCYf6PXz+YhGoBkReVy5Bpk+oGTd1KwM2lnLwkDRLNy
 FzGsZ4HODS2WboXisLq2+6AVl5Wu+3Mgan1NVY1USwNyCJou5D3CMK2dGTr100VKUGvv
 e83wr+oyKofohMsxCrWg/q2Ca88IUA+mAWtEX6m4dSGMdq9EXLBXyvwlU3wlJpqLKgm6
 +C/1VcjOTXXMMcekAS5jU59FBlYq5Sl2VhPtnyewNbmtv/jGh2615Z8YRYQT+wHPgzmw
 1TJMauGq7t6T3pPs0HOmkk+pFDJdzCrZx4bcL1axLzdcjK1Yi3+bFgTgPZarGiEeZqOE
 0oBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U0tBXDISJ7PKav4r0CxWwIZDBb4jy3ecrSqgpsbA5/M=;
 b=lvXUMZmQCMPolmUf+d5WUvgJR1w0+KTmA7b2c4jPtXoDX4AVWH74oITK0QPAK7RxcB
 Jpm5Twq67wADpCHd+KyIGt6xMtYQMsFSR+T56+HAvoJsyR5JJGFNTMYceeG2H54IGEX5
 PdT9+608VVyxK6I6ylPvXqZbRd0k2PV4ml7HP+Z2bSQBTnMx0qKWrEwGX4BRtt9nwOeW
 ej/3WkKV9ljyxdYdgChvsf59JclatK42F8efqQfHvXH3Z4j/rZgqpEuv10rIGZyI/Jlb
 /SU1dIdurKU8Eb3vYaXepwUjIJyUrZmtJ6Uhf8PchSPjTAQkTZKuQoTSjID09UfPyIH5
 s7Cg==
X-Gm-Message-State: AOAM532nLm+Z4Sz0YWBXjK3Y+aHVGoAv6dI99IlPWWBESvt5HLTMwAlt
 TUcqYwzUmJ6rsq04/67+tWQ=
X-Google-Smtp-Source: ABdhPJxCVmyVxeVzPA96sFx7IYrVStSytwDOLVMpyU3KlnWKEx1b8+yy00bzRJOYt2P0XyP2u5jIjA==
X-Received: by 2002:a19:6003:: with SMTP id u3mr1837955lfb.317.1603990251091; 
 Thu, 29 Oct 2020 09:50:51 -0700 (PDT)
Received: from pc638.lan (h5ef52e31.seluork.dyn.perspektivbredband.net.
 [94.245.46.49])
 by smtp.gmail.com with ESMTPSA id s1sm331832lfd.236.2020.10.29.09.50.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2020 09:50:50 -0700 (PDT)
From: "Uladzislau Rezki (Sony)" <urezki@gmail.com>
To: LKML <linux-kernel@vger.kernel.org>, RCU <rcu@vger.kernel.org>,
 "Paul E . McKenney" <paulmck@kernel.org>
Subject: [PATCH 12/16] drm/i915: Cleanup PREEMPT_COUNT leftovers
Date: Thu, 29 Oct 2020 17:50:15 +0100
Message-Id: <20201029165019.14218-12-urezki@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201029165019.14218-1-urezki@gmail.com>
References: <20201029165019.14218-1-urezki@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 30 Oct 2020 08:23:17 +0000
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
Cc: Michal Hocko <mhocko@suse.com>, "Theodore Y . Ts'o" <tytso@mit.edu>,
 intel-gfx@lists.freedesktop.org, Peter Zijlstra <peterz@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 David Airlie <airlied@linux.ie>, Uladzislau Rezki <urezki@gmail.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Oleksiy Avramchenko <oleksiy.avramchenko@sonymobile.com>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thomas Gleixner <tglx@linutronix.de>

CONFIG_PREEMPT_COUNT is now unconditionally enabled and will be
removed. Cleanup the leftovers before doing so.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
---
 drivers/gpu/drm/i915/Kconfig.debug | 1 -
 drivers/gpu/drm/i915/i915_utils.h  | 3 +--
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/Kconfig.debug b/drivers/gpu/drm/i915/Kconfig.debug
index 25cd9788a4d5..b149f76d3ccd 100644
--- a/drivers/gpu/drm/i915/Kconfig.debug
+++ b/drivers/gpu/drm/i915/Kconfig.debug
@@ -20,7 +20,6 @@ config DRM_I915_DEBUG
 	bool "Enable additional driver debugging"
 	depends on DRM_I915
 	select DEBUG_FS
-	select PREEMPT_COUNT
 	select I2C_CHARDEV
 	select STACKDEPOT
 	select DRM_DP_AUX_CHARDEV
diff --git a/drivers/gpu/drm/i915/i915_utils.h b/drivers/gpu/drm/i915/i915_utils.h
index 54773371e6bd..ecfed860b3f6 100644
--- a/drivers/gpu/drm/i915/i915_utils.h
+++ b/drivers/gpu/drm/i915/i915_utils.h
@@ -337,8 +337,7 @@ wait_remaining_ms_from_jiffies(unsigned long timestamp_jiffies, int to_wait_ms)
 						   (Wmax))
 #define wait_for(COND, MS)		_wait_for((COND), (MS) * 1000, 10, 1000)
 
-/* If CONFIG_PREEMPT_COUNT is disabled, in_atomic() always reports false. */
-#if defined(CONFIG_DRM_I915_DEBUG) && defined(CONFIG_PREEMPT_COUNT)
+#ifdef CONFIG_DRM_I915_DEBUG
 # define _WAIT_FOR_ATOMIC_CHECK(ATOMIC) WARN_ON_ONCE((ATOMIC) && !in_atomic())
 #else
 # define _WAIT_FOR_ATOMIC_CHECK(ATOMIC) do { } while (0)
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
