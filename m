Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9506FAA9AB3
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 19:33:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64D0210E42C;
	Mon,  5 May 2025 17:33:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AcSYv9qL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D7C210E42A;
 Mon,  5 May 2025 17:33:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 024ECA4C50C;
 Mon,  5 May 2025 17:28:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AAA8C4CEF3;
 Mon,  5 May 2025 17:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746466427;
 bh=LUr5khTFmeDi+Ua8+P5dJsfAbjq9HmURsDGnKrGJrGs=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=AcSYv9qL9QxetukxyT6UauCSZR//wxaHjcUeh7lWEJWAJWkanBFIoA0xfl8gf+m4r
 KPNQHMa2e4B/YDfkKnejR5MU4B8lTMMYsQqf+u9/p2QYP3oWMXbtobj7VXdC5L5lsV
 U66FtwjO74jyrC0wp5UUWKbetuRTiPiJf8tOifjVCSI1HwkD9QJmtIImFjrIQa1dIg
 2CqRReU3xQK1tQA1ykeMghhaK/H5+mFcaAJm2yeiGhD8Z1GxE0Mo92+WBxcmBlA1TB
 aLA72+9SDzAFAvh1AkhcMHZZFVeN2jq8JI4XvNYt4pzCXyhB591p39tObsq8gs1VB9
 8epbkG/IPMSAg==
From: Jeff Layton <jlayton@kernel.org>
Date: Mon, 05 May 2025 13:33:23 -0400
Subject: [PATCH v7 09/10] i915: add ref_tracker_dir symlinks for each tracker
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-reftrack-dbgfs-v7-9-f78c5d97bcca@kernel.org>
References: <20250505-reftrack-dbgfs-v7-0-f78c5d97bcca@kernel.org>
In-Reply-To: <20250505-reftrack-dbgfs-v7-0-f78c5d97bcca@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>
Cc: Kuniyuki Iwashima <kuniyu@amazon.com>, Qasim Ijaz <qasdev00@gmail.com>, 
 Nathan Chancellor <nathan@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 Jeff Layton <jlayton@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1485; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=LUr5khTFmeDi+Ua8+P5dJsfAbjq9HmURsDGnKrGJrGs=;
 b=owEBbQKS/ZANAwAIAQAOaEEZVoIVAcsmYgBoGPZmWmFz1ESaZFMQZZ6Qr0A+Q8I2qE3VNQO5z
 5egiMFJBtKJAjMEAAEIAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaBj2ZgAKCRAADmhBGVaC
 FexjD/9hLcEg6DYxJ4wVEmKQpEYCCS5MFN450o/uGUbvLOPL65lanJhTpwz4tBupWcVyfavCrhP
 Tt/c7fyR36PQ+beppoY8fiXHWm59g7o7mt5I0ryBFicV3nacxZ6tfr0s4q+07zDZJ1DHh+eMr6T
 IpDtC67gA/XH12NPlwtelMR+NlLt0oNAJLgutDhgpy4vhBPFG5UgJz/H0k83pfyWPb2tR1qIn3z
 VdQovvR54XulStcp2feTuKmAEdiACBohQ8YXwdTSATF0eMezfqoaIOwSRSzSqEHQq0IgC8d/eAq
 xzGFdFuzMlS2PoXSdi61Ryh36uDryiFrRmNQR8klFVeetl5/o3oaM3zzq7c+DTcDWjNqcUudbiG
 /1evAnet8XPTtR/rJdupyhDC1qoTAKKLtxy37FbOhBYPKtkTCiMd4Wj/Qe5g7PDgum53Sz5tM1T
 T/sAtJKLIG5gHO+Ym/cElPz5awUx5eeFON+rlVufu6Uc/HwL9ZmPxE4c4+XelbL45TbWO3WLzyh
 lAVCKcl8ThPheW2laaGu6k0Ctxu69Bh/jJ3YEChT2shXDNEFmXeT/WiqTLoGDEiJ+C8mXRFLcw4
 SMze8aBLpL7uwg2yGyaDW+VskVR/r7JogFdA1gQgfZ3h/zWdFD0QQRlQHTzpXxhiq5M+b0QXIom
 oJHlLwY+nW2sqcg==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
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

Now that there is the ability to create a symlink for each tracker, do
so for the i915 entries.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 drivers/gpu/drm/i915/intel_runtime_pm.c | 1 +
 drivers/gpu/drm/i915/intel_wakeref.c    | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/intel_runtime_pm.c b/drivers/gpu/drm/i915/intel_runtime_pm.c
index 3fdab3b44c08cea16ac2f73aafc2bea2ffbb19e7..94315e952ead9be276298fb2a0200d102005a0c1 100644
--- a/drivers/gpu/drm/i915/intel_runtime_pm.c
+++ b/drivers/gpu/drm/i915/intel_runtime_pm.c
@@ -61,6 +61,7 @@ static void init_intel_runtime_pm_wakeref(struct intel_runtime_pm *rpm)
 {
 	ref_tracker_dir_init(&rpm->debug, INTEL_REFTRACK_DEAD_COUNT,
 			     "intel_runtime_pm", dev_name(rpm->kdev));
+	ref_tracker_dir_symlink(&rpm->debug, "intel_runtime_pm-%s", dev_name(rpm->kdev));
 }
 
 static intel_wakeref_t
diff --git a/drivers/gpu/drm/i915/intel_wakeref.c b/drivers/gpu/drm/i915/intel_wakeref.c
index 5269e64c58a49884f5d712557546272bfdeb8417..2e0498b3fa7947f994de1339d4d2bed93de1a795 100644
--- a/drivers/gpu/drm/i915/intel_wakeref.c
+++ b/drivers/gpu/drm/i915/intel_wakeref.c
@@ -115,6 +115,7 @@ void __intel_wakeref_init(struct intel_wakeref *wf,
 
 #if IS_ENABLED(CONFIG_DRM_I915_DEBUG_WAKEREF)
 	ref_tracker_dir_init(&wf->debug, INTEL_REFTRACK_DEAD_COUNT, "intel_wakeref", name);
+	ref_tracker_dir_symlink(&wf->debug, "intel_wakeref-%s", name);
 #endif
 }
 

-- 
2.49.0

