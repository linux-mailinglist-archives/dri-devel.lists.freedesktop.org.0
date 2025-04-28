Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D4EA9F87B
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 20:27:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ECD510E6B7;
	Mon, 28 Apr 2025 18:27:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CMLwNem1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 397F110E6AB;
 Mon, 28 Apr 2025 18:27:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A3BB65C5F75;
 Mon, 28 Apr 2025 18:24:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE053C4CEED;
 Mon, 28 Apr 2025 18:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745864833;
 bh=LUr5khTFmeDi+Ua8+P5dJsfAbjq9HmURsDGnKrGJrGs=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=CMLwNem1Fcc57a738z/tvDNE5PIQWOMMuBlhcebPgLlVA9nYnYadpQ9oTJKD0G9Pu
 EffEBnYnNQuY0W0//zEB6jFAluTG/ZGGOLR4iGHhUDfHRAN9PUzY96XEfeFe+vuBlN
 mlxu+/c8Qp2Geo4BjarYfoLWeTo/eIeMlJnW7P3Yi1RWNphh3oazPbawyTJm0SA+WR
 +fN66ZP23A4HYk1v8UyndZtSLgL1O/vUzmapnYx7EacKrlAtw3fe8N8N/senlsRw7D
 xr7QWbMY2Xcu/+NDw0QoWAYqY74eYO3iXDosAD1AUa1SDQ+tKrBNBNC0X0ZddBIxih
 W9D1CptjskySg==
From: Jeff Layton <jlayton@kernel.org>
Date: Mon, 28 Apr 2025 11:26:32 -0700
Subject: [PATCH v5 09/10] i915: add ref_tracker_dir symlinks for each tracker
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250428-reftrack-dbgfs-v5-9-1cbbdf2038bd@kernel.org>
References: <20250428-reftrack-dbgfs-v5-0-1cbbdf2038bd@kernel.org>
In-Reply-To: <20250428-reftrack-dbgfs-v5-0-1cbbdf2038bd@kernel.org>
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
 b=owEBbQKS/ZANAwAIAQAOaEEZVoIVAcsmYgBoD8h2gRjkmyNDtqQz8jGSWwZwY7At/oqUlVT1Z
 iLVbzuEaAaJAjMEAAEIAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaA/IdgAKCRAADmhBGVaC
 FaUPD/0TiwzsG/qKnXlSUou4EyQ/Rhx5C1GxSJr5nJ/vjfm9VJyXyGfyUEQSKJzmf2PcH5G6Xi5
 kqFV4jqEh3d1hQQmtEnfp5j02RAB4qGgHlZITDXJawCu2DBqW1LSBquWlQMnKZg2ceDNTGoXh7p
 ih2SqyMd9i7WyZFtZ8vNpIYttg1+FSgmMnu/vYZ2PjdWrWBPiwNj5hhaYmnljeKqc8YqphfOzKJ
 f7EoF2/fWAAO9ocbMf/6sx/x4IDqSbdGTFPt3ltzMhezteRuXs9/WDKrotUKl02NsaBflXvjZHf
 megsqTfQcMtp7wjdT/2d+ABVlUO3u431g7US+IbXhExlOcdsQ6497b7bEnEzGFfATG6ONf0+k5N
 tVSeNKBsQoz1LxmEnLs3hd5KuyyZoTtmi+5FR0XCyWgyKdhvusLFn5XKeyjuclD42elHcMoWJKD
 LO6Cv56Y8GOHQ/uTXI3Eb0MnyCfw5jLutZ9uIEMc9aJvuKD5TnR4IHRhGwKXeJww3OxgvWbG3lS
 tj6fjuNQ5lQfAvQfWGuC8o7G6HsQUKsgn0CfIEnpKbAe86Tv+ECv4kMn9zcQUY2zw6NKEzQSLc6
 d0vd4uyTY4k77Lgg5lQh6xDOnnlCJsxxc9J9xmAYoHFW512t+k+JKLPzPo8/XIXMOnDpizory64
 qhdlAV0pNa2R6fg==
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

