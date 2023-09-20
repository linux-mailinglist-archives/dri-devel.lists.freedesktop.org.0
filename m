Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3697A729D
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 08:12:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E94210E43C;
	Wed, 20 Sep 2023 06:12:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A58910E42D
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 06:12:06 +0000 (UTC)
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx0.riseup.net (Postfix) with ESMTPS id 4Rr7Tx4DQWz9tHG;
 Wed, 20 Sep 2023 06:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1695190325; bh=LXUyg24PP8tRYHKeCy6iZ2qc+Z9l5WHqKCjRjgW4+iA=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=D/o2/oiW+hocWZ5aYVEN7NYHKqcODZAQeFI9JONAeGBdbwvulM0MftK4W17eC/PDi
 HsQ7s99T9x3j5PnUq3IK9j4IkYFbIzuNi9auipFz8e+swKn+ITlUKR0H1umCe3+f2O
 V/8MPj9IlsYyvFd3iplr4hgZcd6lkPTIdEA3MUdk=
X-Riseup-User-ID: 482A8BD71139B096406354321EE928351695F47675410D9D285B79FF5D40C34B
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4Rr7Ts6G6lzJq77;
 Wed, 20 Sep 2023 06:12:01 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
Date: Wed, 20 Sep 2023 03:11:36 -0300
Subject: [PATCH 1/3] drm/tests: Fix kunit_release_action ctx argument
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230920-kunit-kasan-fixes-v1-1-1a0fc261832d@riseup.net>
References: <20230920-kunit-kasan-fixes-v1-0-1a0fc261832d@riseup.net>
In-Reply-To: <20230920-kunit-kasan-fixes-v1-0-1a0fc261832d@riseup.net>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maxime Ripard <mripard@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>
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
Cc: tales.aparecida@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, mairacanal@riseup.net, andrealmeid@riseup.net,
 Arthur Grillo <arthurgrillo@riseup.net>, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The kunit_action_platform_driver_unregister is added with
&fake_platform_driver as ctx, but the kunit_release_action is called
pdev as ctx. Fix that by replacing it with &fake_platform_driver.

Fixes: 4f2b0b583baa ("drm/tests: helpers: Switch to kunit actions")
Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
---
 drivers/gpu/drm/tests/drm_kunit_helpers.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.c b/drivers/gpu/drm/tests/drm_kunit_helpers.c
index 3d624ff2f651..3150dbc647ee 100644
--- a/drivers/gpu/drm/tests/drm_kunit_helpers.c
+++ b/drivers/gpu/drm/tests/drm_kunit_helpers.c
@@ -118,7 +118,7 @@ void drm_kunit_helper_free_device(struct kunit *test, struct device *dev)
 
 	kunit_release_action(test,
 			     kunit_action_platform_driver_unregister,
-			     pdev);
+			     &fake_platform_driver);
 }
 EXPORT_SYMBOL_GPL(drm_kunit_helper_free_device);
 

-- 
2.41.0

