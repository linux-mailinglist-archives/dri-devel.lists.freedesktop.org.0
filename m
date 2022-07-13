Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C41EA5737FA
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 15:51:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D0739AC86;
	Wed, 13 Jul 2022 13:50:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C14C9AC72;
 Wed, 13 Jul 2022 13:50:46 +0000 (UTC)
Received: from hermes-devbox.fritz.box (82-71-8-225.dsl.in-addr.zen.co.uk
 [82.71.8.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbeckett)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id D25D16601A45;
 Wed, 13 Jul 2022 14:50:44 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1657720245;
 bh=yyqoiKo1vjbgBxUDvFfH6fIoAaG7ofkIEVjSYkMkda8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ngYnJqm+uClE5DBVZFn04xFsahP8ahb/NDV6BLD1pk8UxuFHDDq32kW4rIAARuk3Y
 iTJbVitr/LiyBtWknE4YQcV1FwDzLACTgeOqXp64XeUwoR1vRjIAEvUBroHUc+Iip3
 X0qNZJzhYbAA5EP3sll4JFb6HYR6Z8dVweOqmUJ1rB6mnBd9k8UUHb+goHOAIJ/ZOU
 Iq3iT+EbfRNAIzKtmcPZfczXqJrnzstF0clppPtufmIfm127PQ1O8HBVDvPfcQkeFc
 RrRkSnBmP9dmKzFWo3xSSO6PPE3QEROBY2E52gV4RT1HemcSM1MuZGzTEPAVTVPZJT
 SWlGVh6W10a1Q==
From: Robert Beckett <bob.beckett@collabora.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v11 08/10] drm/i915/selftest: don't attempt engine reset of
 guc submission engines
Date: Wed, 13 Jul 2022 14:50:20 +0100
Message-Id: <20220713135022.3710682-9-bob.beckett@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220713135022.3710682-1-bob.beckett@collabora.com>
References: <20220713135022.3710682-1-bob.beckett@collabora.com>
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

