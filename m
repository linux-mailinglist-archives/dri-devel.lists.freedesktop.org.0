Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF25AC8014
	for <lists+dri-devel@lfdr.de>; Thu, 29 May 2025 17:21:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19F7E10E74C;
	Thu, 29 May 2025 15:21:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lfblEMqC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F88710E741;
 Thu, 29 May 2025 15:21:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 233DE5C6836;
 Thu, 29 May 2025 15:18:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF91FC4CEF2;
 Thu, 29 May 2025 15:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748532075;
 bh=xcaFZVbsEvJyxxrP8wl5wB3qpU0YQ92i4Uv2VYSOZus=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=lfblEMqCGjjntqP+1um0GeeAZzdkRronCPNuG3/9DXO5LIJNOhNuZ4VVN2I2F07sC
 YkCtPhYmJ2DMIDxIATpW6sIY6TFdhT60csCW5dSE/tpjcuo+n/I5KvCyccBKQqPytp
 15VSYU9JQcr++CLxOcAVEOD6zIqYPptJuH09AeCf+dHIRWy7msFb8Hh+JZ+g6C7Zx/
 dZ926qDSl4p/Yf+M1TMSDYZQCSrmIR1zRRPf42a9vFoEhQG+ZaUlp5oSx02aBHZzhw
 grami1z/3sfqW2B3YSLiyBfZYqIKFRDPRk5Bt/Z2DnPFTOL1eX6BG4CJcFqxIQTfSl
 sceOA9bOHA88A==
From: Jeff Layton <jlayton@kernel.org>
Date: Thu, 29 May 2025 11:20:37 -0400
Subject: [PATCH v12 01/10] i915: only initialize struct ref_tracker_dir
 once
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250529-reftrack-dbgfs-v12-1-11b93c0c0b6e@kernel.org>
References: <20250529-reftrack-dbgfs-v12-0-11b93c0c0b6e@kernel.org>
In-Reply-To: <20250529-reftrack-dbgfs-v12-0-11b93c0c0b6e@kernel.org>
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
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBoOHtlJoeQSp7XCmOWB2Q+I8Ys5r35/tdfxUIPx
 9Ha6LPME86JAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaDh7ZQAKCRAADmhBGVaC
 FT0aEACXjOhHIZep0Wr1ZF4on21GzNvpYxrrHMEU4mKeiMCrm6xqX+ssru+3F1XjkLVe56APTUc
 k1n1cVyYmDo0hRJWKu2iqNtnLuty6OObsOQkWWJZRK2jUG1WiLZZwWNQS61414JyVRfdhqOrs17
 stoXxlPAxxVhAgLpJDRy0oj3qSAn7jzlocNK3JbbmWG5D8/mYO1P8nK2jFa2NJKWfPpFIjTn9vc
 3Mby8ZRpGykayY8GqnIMVykioglTIR7qbUNy+AbuXk5L/wHF9T5eCvCAwE3QVTGqwG5LPQXSFeN
 xHPoIGmmIS173L9Ib8CFDPUIFN8BOWo50MZAqqKWEP/l4SgEn6q5MsPfV5L5LYmmzWUSVj8ZW6M
 8aJYkO8CTH++vN9hbpOQJIblvWycEr2hznF/YcE7kQSeIsbwM2KEXGHVJ+ln+3oOX8ej2qlplNT
 vsHj8l+s3U+FYkWsosS2pQEnHxs05mBvNWH4JV5eyP8bpE/0qLnQaAkxpa7ILWYiBkpDibB/PGm
 1/h1S3ZPqK0J8mtGu+wflqotjDRuBe+xd1Qwx0euzgigafbL8rB1/z02j2mHCvNUZprK8x2ujOx
 iM90gyjpme3LszgUslrGFPBzJJwfyuKz2PHSUqS+iztOVXtfRAFzZFAeZbLBE2vY0NCSpDnWP5Y
 amcraq9c1SB4UzA==
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

