Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3322AAC6BC2
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 16:34:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BFD010E63D;
	Wed, 28 May 2025 14:34:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="B/G2qhEf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D97610E605;
 Wed, 28 May 2025 14:34:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C96CE629D8;
 Wed, 28 May 2025 14:34:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFF92C4CEED;
 Wed, 28 May 2025 14:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748442890;
 bh=xcaFZVbsEvJyxxrP8wl5wB3qpU0YQ92i4Uv2VYSOZus=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=B/G2qhEfNssorY7U9YWyXBSF7siZDygdMbGGxq3Z1zMJG1BOR6WnZJHoytMqI6HMA
 Jv6kwz9FIZEzHSvHjG+622OTB/CQK4fL/nJ3TQ0/Jnjh+f1w4t5MKbHrQMNtZsaXvU
 Edwkx2rs8uiYpN4VBBmwr6YarYl+L6+LkS5TStvuDEI536z9IKFG4dQJoKhbSwbJj3
 jnc5K0/IC94l99/xZP8liBxOCibFhq+nfibRak53dL/yVUQnlhjgnGJtX9GtNEXAXs
 98Mn1XX1DgV119J3GDqSCYg8jcyrNHscE+4chldrjM8IcmehLDIVy4MovwNIaps+z5
 2EZfxIpGMV1rg==
From: Jeff Layton <jlayton@kernel.org>
Date: Wed, 28 May 2025 10:34:33 -0400
Subject: [PATCH v11 01/10] i915: only initialize struct ref_tracker_dir
 once
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-reftrack-dbgfs-v11-1-94ae0b165841@kernel.org>
References: <20250528-reftrack-dbgfs-v11-0-94ae0b165841@kernel.org>
In-Reply-To: <20250528-reftrack-dbgfs-v11-0-94ae0b165841@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1979; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=xcaFZVbsEvJyxxrP8wl5wB3qpU0YQ92i4Uv2VYSOZus=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBoNx8EmI6fWV2Eg8Xc7r5K/kMheNd8UdmOtmoO3
 tlVLfOHahKJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaDcfBAAKCRAADmhBGVaC
 FbGSD/9jzwiUc0TWPeNT+GglWj/jlFf8GvvgXw380X6AKkj9UkpMXvsNnjcHnLVrEtdetSkTa67
 0P95tMf5mkiIf9XnYUBTyEcX4lUdPd2u4abq3MGbVpWOM+I1b2nbRl+OgSqNlnZEPnLeshSDqWW
 Seqpn1O3eD64B8a+Z7LwoAtDcT+zyvrJL+stNAHG3862LEL+Z0oM2EaXzYanp8Gta584DmX126s
 q0KynOEuesl4MPcWxsrXeuTlo2r/e5NFR03fdj65XU6PurTxRfSx0qeJhvqUnk+GL/uk99jaLVi
 bT2jX4M7ZDzJ01dMo5aQ0+7NHCFU/XPSQmGsNcr0L51DzYrtQLY2IceI03bu2uxve8bw8CAD6Lz
 umSxnAZw3JPlW3y8/HpE3Z9GSFuE5eK4ZBLLZQI4YoePaj8X9GpjCsUqNdBH3XQTcykWfttlL0E
 X/Wk6+v/6uwHVBKIiXp1PiH86jscrzXxXMvSmR8dzgeJfHeEqxPQGagtt30bGHdWhZpZTPrOc06
 ZNBi4Gr4jj3vnXFNFNqKnn20TvarkHh/8pkECDEqJjoO3kC6vg7zrAileGhwJelCMTzrLsX4Wrg
 6FkJtAnd+wlZqn3zJFa4LQ5HZiHGJi6PPeYp16L4iSnL/XzzvsySBsouY5Xc04Vu/BBvIdmnGyk
 vwygWSCqB3E/RRA==
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

I got some warnings from the i915 CI with the ref_tracker debugfs
patches applied, that indicated that these ref_tracker_dir_init() calls
were being called more than once. If references were held on these
objects between the initializations, then that could lead to leaked ref
tracking objects.

Since these objects are zalloc'ed, ensure that they are only initialized
once by testing whether the first byte of the name field is 0.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 drivers/gpu/drm/i915/intel_runtime_pm.c | 3 ++-
 drivers/gpu/drm/i915/intel_wakeref.c    | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_runtime_pm.c b/drivers/gpu/drm/i915/intel_runtime_pm.c
index 8d9f4c410546e4144d4bc8bbc6696f3bd9498848..1b2ad1e0aef7d317f63a23b39193ea81c90401f0 100644
--- a/drivers/gpu/drm/i915/intel_runtime_pm.c
+++ b/drivers/gpu/drm/i915/intel_runtime_pm.c
@@ -59,7 +59,8 @@ static struct drm_i915_private *rpm_to_i915(struct intel_runtime_pm *rpm)
 
 static void init_intel_runtime_pm_wakeref(struct intel_runtime_pm *rpm)
 {
-	ref_tracker_dir_init(&rpm->debug, INTEL_REFTRACK_DEAD_COUNT, dev_name(rpm->kdev));
+	if (!rpm->debug.name[0])
+		ref_tracker_dir_init(&rpm->debug, INTEL_REFTRACK_DEAD_COUNT, dev_name(rpm->kdev));
 }
 
 static intel_wakeref_t
diff --git a/drivers/gpu/drm/i915/intel_wakeref.c b/drivers/gpu/drm/i915/intel_wakeref.c
index 07e81be4d3920febece34709c63a63204a41583c..3cfd68c98023fef75faa4dd69eba55e093130dd7 100644
--- a/drivers/gpu/drm/i915/intel_wakeref.c
+++ b/drivers/gpu/drm/i915/intel_wakeref.c
@@ -114,7 +114,8 @@ void __intel_wakeref_init(struct intel_wakeref *wf,
 			 "wakeref.work", &key->work, 0);
 
 #if IS_ENABLED(CONFIG_DRM_I915_DEBUG_WAKEREF)
-	ref_tracker_dir_init(&wf->debug, INTEL_REFTRACK_DEAD_COUNT, name);
+	if (!wf->debug.name[0])
+		ref_tracker_dir_init(&wf->debug, INTEL_REFTRACK_DEAD_COUNT, name);
 #endif
 }
 

-- 
2.49.0

