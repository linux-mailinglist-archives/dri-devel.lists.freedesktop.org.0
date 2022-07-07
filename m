Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 370AF56AC69
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 22:03:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71DA012B9A8;
	Thu,  7 Jul 2022 20:02:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7192B11B66D;
 Thu,  7 Jul 2022 20:02:50 +0000 (UTC)
Received: from hermes-devbox.fritz.box (82-71-8-225.dsl.in-addr.zen.co.uk
 [82.71.8.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbeckett)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 08AEB66019E7;
 Thu,  7 Jul 2022 21:02:49 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1657224169;
 bh=yyqoiKo1vjbgBxUDvFfH6fIoAaG7ofkIEVjSYkMkda8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jxcCnHRvMsZooefKE1L+riEhT0DTivOOpHuwBE74HcbdbVkGnvIxNHyOmXJQt/b0H
 yD9IJJ1DlVtNoeY7VQgePaGz3DfgeXPME8mN0WPZ8sfYPXv9PbKp9uppjJ+iI1Al7M
 DFWZZVf5MANOJ4mF4+6lhwqQxuuq1xaShFE2tq2i6tV4EJT0/jKGKZryH2r1Kz5SRV
 weyzCxtpTWONDfevbIkhyMBKebe7EO4uaRuOeRXhsfYQDCoryFPJ2Z2j+NVTm1L9Wr
 gj1CpHJt0y/TM/Iv0mENn83ah7SITLEhAxYL6OMjLaIdVRwD59yR601W51Jo1gpfCL
 hw++BJC9wbaWA==
From: Robert Beckett <bob.beckett@collabora.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v10 09/11] drm/i915/selftest: don't attempt engine reset of
 guc submission engines
Date: Thu,  7 Jul 2022 20:02:27 +0000
Message-Id: <20220707200230.1657555-10-bob.beckett@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220707200230.1657555-1-bob.beckett@collabora.com>
References: <20220707200230.1657555-1-bob.beckett@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Robert Beckett <bob.beckett@collabora.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 kernel@collabora.com, Matthew Auld <matthew.auld@intel.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

igt_reset_engines_stolen tries to reset engines without checking if it
is possible.
Engines using GuC submission are not able to be reset from the host.

In this scenario, the reset exits early, then on the next iteration of
the each engine loop, the async teardown of the spinner request
context's ring occurs while the next engine is under test.

This is seen as a stolen memory corruption as the ring buffer was busy
initially, but free during the confirmation check and had been poisoned
during cleanup.

Fix this by not testing GuC submission using engines.

Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
---
 drivers/gpu/drm/i915/gt/selftest_reset.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/selftest_reset.c b/drivers/gpu/drm/i915/gt/selftest_reset.c
index 37c38bdd5f47..55f3b34e5f6e 100644
--- a/drivers/gpu/drm/i915/gt/selftest_reset.c
+++ b/drivers/gpu/drm/i915/gt/selftest_reset.c
@@ -194,6 +194,8 @@ static int igt_reset_engines_stolen(void *arg)
 		return 0;
 
 	for_each_engine(engine, gt, id) {
+		if (intel_engine_uses_guc(engine))
+			continue;
 		err = __igt_reset_stolen(gt, engine->mask, engine->name);
 		if (err)
 			return err;
-- 
2.25.1

