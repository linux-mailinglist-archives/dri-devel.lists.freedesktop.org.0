Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5E94184D8
	for <lists+dri-devel@lfdr.de>; Sun, 26 Sep 2021 00:12:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF4726E47B;
	Sat, 25 Sep 2021 22:12:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-canonical-0.canonical.com
 (smtp-relay-canonical-0.canonical.com [185.125.188.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96F1C6E47B
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Sep 2021 22:12:24 +0000 (UTC)
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 2E89C40CE2; 
 Sat, 25 Sep 2021 22:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1632607942;
 bh=5GJGeMUE1rwvKSTEVK8obPvzmMX2uPbl+sLWvpxmi/Y=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
 b=o4XySPeeDyWl8UU398FbX6sZORi8Iwe8Z326AxuuHOnrT5Y+Y60FQxN9UjaUo5REF
 PQB+RALfQQwlBSs9LrS/H816hXRMgqvezkOn7p2JJY7FToR1nPKzukbCvvGXEscnWb
 37+yBQTol2XTHhpUooVwce+IMzaBU5oetc6tt+7iEC5rYea39xzBcJwF9otwBeeg7d
 l/bxY6ggW8dA4m9ax3F9hIhXLFHeQoc0z1K0iIxwzr36ENrsTt/IZXLj/OmwrJdyMp
 t2TAo0Yf03dsAv/X9fn4RCvde3KAS7Wv8z9EdVy/vXsZXzccMe05nLcuLqtUUA66jQ
 5dolgvk2MnX3w==
From: Colin King <colin.king@canonical.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Chris Wilson <chris@chris-wilson.co.uk>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/i915/gt: return NULL rather than a plain 0 integer
Date: Sat, 25 Sep 2021 23:12:21 +0100
Message-Id: <20210925221221.181630-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Colin Ian King <colin.king@canonical.com>

Function gen7_ctx_vma returns a pointer to struct i915_vma, so
returning a plain 0 integer isn't good practice. Fix this by
returning a NULL instead.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/i915/gt/intel_ring_submission.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_ring_submission.c b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
index 2958e2fae380..3c65efcb7bed 100644
--- a/drivers/gpu/drm/i915/gt/intel_ring_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
@@ -1265,7 +1265,7 @@ static struct i915_vma *gen7_ctx_vma(struct intel_engine_cs *engine)
 	int size, err;
 
 	if (GRAPHICS_VER(engine->i915) != 7 || engine->class != RENDER_CLASS)
-		return 0;
+		return NULL;
 
 	err = gen7_ctx_switch_bb_setup(engine, NULL /* probe size */);
 	if (err < 0)
-- 
2.32.0

