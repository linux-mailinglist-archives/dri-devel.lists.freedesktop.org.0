Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 836FEAAE01B
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 15:07:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 321F810E7BA;
	Wed,  7 May 2025 13:07:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Tw3CzRp4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6735710E7B3;
 Wed,  7 May 2025 13:07:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 910B35C5DA5;
 Wed,  7 May 2025 13:04:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8A75C4CEF0;
 Wed,  7 May 2025 13:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746623230;
 bh=Les2Q1JDGDchAASaheHbCbzDsZvfcnT1V7XgBGKxhhs=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Tw3CzRp4L3LQr5czxN2kUEnEz0LL5mCdcY1maVcQFzv9DBDF1O0c0smvQkaSmXiBq
 LEVJ+ON+Chyo0MWcRso6HsL5CIzE8sAeaJY6qT6pSWC57Z33cR7TpaQFS7jCFPBVdF
 PC4A+ot/1i9kNVXX4ClXBmgyqi1MHY3/EFMDiUxbjsTHvM+jxIhBI8Pq6gtSTmI3V9
 6y98wWiqYFkT9BHEMCMjkgAoSPh4Clc23eg30n2VJuVUbGthQB1FRvUyHwUxiNUwte
 A4xfB61VQxt7A4bcD/rNF1E6B/XWT8S+oTPGlpHt9reJPjESuzwvdm8x/SHS1ioB2t
 in5yKCR0iOsYw==
From: Jeff Layton <jlayton@kernel.org>
Date: Wed, 07 May 2025 09:06:34 -0400
Subject: [PATCH v8 09/10] i915: add ref_tracker_dir symlinks for each tracker
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250507-reftrack-dbgfs-v8-9-607717d3bb98@kernel.org>
References: <20250507-reftrack-dbgfs-v8-0-607717d3bb98@kernel.org>
In-Reply-To: <20250507-reftrack-dbgfs-v8-0-607717d3bb98@kernel.org>
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
 Jeff Layton <jlayton@kernel.org>, Jani Nikula <jani.nikula@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1532; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=Les2Q1JDGDchAASaheHbCbzDsZvfcnT1V7XgBGKxhhs=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBoG1rpnQ80pXEoPAGYv6tv9H2PzPm2jcqdwBtyS
 QaXU2VToM6JAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaBta6QAKCRAADmhBGVaC
 FePeD/95w0gUIXb5xCFLvY2PHFN0MuH9m318jSFEga+naOGgx6O/OZfGaiHphb/rKy9bdRcABUB
 rlWJP9KHiqSy9aKzsPn8JFJ2LWiSY65wesScQDh+RJAYiUPtBhFQbzgn7J/ADdFmQenqRFZKTKI
 vSJ1Bp/CpJ78Jmwv97kaTCMudRR2oNIKlixRFB4L0AtPLuYVxcMXcbjuSSIt4OmRw33eGfoBKED
 PEF45CLu/qvRISjL0xdHjmrlD8u88Kb9Omr9/1+mxua+XPc7FBUoLJdo85cO8ExUHM6PZGdwXTA
 RlQjPIvdjT7a01OB+c3dkn6hmr3T2Uhv8mQmV8y9px/0Ic30ATlA5tsB1uXuhldeBiUs+u68/zT
 FHpNVlmUQ85DF1s68uiga6V/Vn+39ogPxNTSZUXZ8GiHPntNjwKuIWvtaeoN+YSZ86ruriFZwYy
 Wh4p0hKrU/cAkX+3fVFp/+tiNV7oju5IleRWV33kB6XpMwcvq8fBUTcGHY8JMT+OBYSZzqDQv9Z
 UTv2PqtPgb1o4/z8B1hb8CX7Us6ClFkOvDpKfrUky30d06sIwX8JK/1UqXmV6E9sOj8KDCXs6YQ
 Tv03mBEeIS2iHUCzs4f0OnNb6rCYQtDGQsnDHF+i4dbifSXZEzRNL5IlOg/VclSfd9ToJOgVk1h
 ypVGb5sVS1Sv4oA==
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

Acked-by: Jani Nikula <jani.nikula@intel.com>
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

