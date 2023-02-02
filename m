Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8F7687A1B
	for <lists+dri-devel@lfdr.de>; Thu,  2 Feb 2023 11:23:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5074510E00A;
	Thu,  2 Feb 2023 10:23:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DCA210E00A
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Feb 2023 10:23:54 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 182E9B82272;
 Thu,  2 Feb 2023 10:23:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1679FC433EF;
 Thu,  2 Feb 2023 10:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675333431;
 bh=GQnjXYU/0vipHeT3iMCCPZhv1dMM4Kiss8fVyftaCCs=;
 h=From:To:Cc:Subject:Date:From;
 b=FO9KuJmGsOGokap/NEOXVwllrmT7/6YtYkfeRLa2ZwjrTHQ8zI26aUPp0/nfeN/t9
 cCjFtnkV0KssN6qacocE4N7GjxfflefrDXQveEVBTwUnlElU2mExy2WxQfZKlBfS7K
 OzuhIA636DPK8xJWjTIqf8hskhTkaHv6Bd4lDXGK/RdjnQCYLvghkCO/ZmcDrxHxF2
 6/HD5LaqWB3sh7Oo3FI2rtBPSwh6EWDxMQC8g+XWGDreVmqxGZaVN7yFioYRFEcssv
 dgo+j/smoUfTQO3+YoiJHuG2BIYZILCwOU7xMD3GfXCykI0vYvLbxrFwXsnAFcqgkK
 aX4YKVSLCPpqQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Emma Anholt <emma@anholt.net>,
	Maxime Ripard <mripard@kernel.org>
Subject: [PATCH] drm/vc4: allow DRM_VC4_KUNIT_TEST to be a loadable module
Date: Thu,  2 Feb 2023 11:23:32 +0100
Message-Id: <20230202102346.868771-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.0
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
Cc: Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Zheng Bin <zhengbin13@huawei.com>,
 Danilo Krummrich <dakr@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

In configurations with CONFIG_KUNIT=m, builting the unit test
into the kernel causes a link failure:

arm-linux-gnueabi-ld: drivers/gpu/drm/vc4/tests/vc4_mock.o: in function `__build_mock':
vc4_mock.c:(.text+0x6e): undefined reference to `kunit_do_failed_assertion'
arm-linux-gnueabi-ld: vc4_mock.c:(.text+0x9c): undefined reference to `kunit_do_failed_assertion'
arm-linux-gnueabi-ld: vc4_mock.c:(.text+0x100): undefined reference to `kunit_ptr_not_err_assert_format'
...

Allow this to be a loadable module as well to have Kconfig
sort out the dependencies correctly.

Fixes: f759f5b53f1c ("drm/vc4: tests: Introduce a mocking infrastructure")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/vc4/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/Kconfig b/drivers/gpu/drm/vc4/Kconfig
index f423941c028d..91dcf8d174d6 100644
--- a/drivers/gpu/drm/vc4/Kconfig
+++ b/drivers/gpu/drm/vc4/Kconfig
@@ -36,7 +36,7 @@ config DRM_VC4_HDMI_CEC
 	  and want to use CEC.
 
 config DRM_VC4_KUNIT_TEST
-	bool "KUnit tests for VC4" if !KUNIT_ALL_TESTS
+	tristate "KUnit tests for VC4" if !KUNIT_ALL_TESTS
 	depends on DRM_VC4 && KUNIT
 	select DRM_KUNIT_TEST_HELPERS
 	default KUNIT_ALL_TESTS
-- 
2.39.0

