Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB1C897029
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 15:19:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C6B4112AEC;
	Wed,  3 Apr 2024 13:19:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XlssI+6u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B03D7112AE7
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 13:19:53 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-6eac64f2205so5276727b3a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Apr 2024 06:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712150393; x=1712755193; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MvARuQ+3VmnrmzgmqFSmVu3cd4NVfa8l1fZDGFIcUBg=;
 b=XlssI+6u16SNbicOQSWXwV5Hrtei48odEPVCZ3oBq8sIc/Mf18uiPHRoxOBogQx6BP
 RlYffDS3so/idgpgSsjAFiuLt3TPzlMP6xpkKxy8rPwkPNS5zD2EH8q0xhSjKW8uL//n
 vS0eBhNxD7ZQDDzc5wpFxaY9tw0O+mQr7fMNg8nRqZAH2F5d10xqR7Kx94yGl+6B4HHu
 Gm1A6BwUytsQbpNzlmnUHvfwAquR2MvUDve5SthnkLFud4dppomqpgaooJ0ICfUfJZzW
 wJooW+FDOl/rqLG3I9dcFt5avXQ9vXrh05RisYa4a2rD8s0caIwjFTBwr4lnecfAqubJ
 9zcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712150393; x=1712755193;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=MvARuQ+3VmnrmzgmqFSmVu3cd4NVfa8l1fZDGFIcUBg=;
 b=jOkGtlBCkVKbyRP/ydHowk/U9zfsCzH65ZNozpFe91OE1crevfcUb2dIzM66eHpBAr
 0U1XCCfx4GlxBAAZGfetyyfhzF96fkH7gKq3dh1Pgy/Nm3XbCQTmXeHLSCMWKINk1l9b
 ugRgkD9cNg9rxbjRjLiTWJfTetqwytmC6yKsMu+lngX4wsrhVfySv/EtUOiLkKPu/S3U
 IGinYM8S2rNiKLpOdrRkl97FfNLrAl6bXmNLkU+JMFi2Il3StanEEgDW1iR7CAYukEnn
 qF3Uqq7dK3fztEMmkYa9Fco6sjwtjotS99PQb9ccdF5f9xF0tNoPNt6SGYMR2Js57a56
 4caA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXE202TLrW2emnVOirOQgt3e81YX4X7+PBBmod8RkgBlxXKWtBRQQ5P5eXL7vfRgyfVt2uBBK6lqgxZDowNYelQR6sKcZcmD69XuC+vycuo
X-Gm-Message-State: AOJu0YwZ8KbSEKtSM/kXOjmUgbH1UiyYPiLEW+ys4LhrY/P47LjlrT/B
 Ll42ijcF3sTc5gtI8Jpod3NCd6633wT+ABKgVDY7K405wwi5+5W0
X-Google-Smtp-Source: AGHT+IFzkfgfwanXAd82f8i8ef5Fjpgbc/yneRFMHGOwV59qDNS3Awm153uRnJZYSeIbwOl4zm4JYA==
X-Received: by 2002:a05:6a00:190b:b0:6ea:73d3:d3a with SMTP id
 y11-20020a056a00190b00b006ea73d30d3amr17312402pfi.22.1712150393007; 
 Wed, 03 Apr 2024 06:19:53 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 j3-20020a62b603000000b006e56bf07483sm11720837pff.77.2024.04.03.06.19.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 06:19:52 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: linux-kselftest@vger.kernel.org
Cc: David Airlie <airlied@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Kees Cook <keescook@chromium.org>, Daniel Diaz <daniel.diaz@linaro.org>,
 David Gow <davidgow@google.com>, Arthur Grillo <arthurgrillo@riseup.net>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, loongarch@lists.linux.dev,
 netdev@vger.kernel.org, x86@kernel.org, Guenter Roeck <linux@roeck-us.net>,
 Linux Kernel Functional Testing <lkft@linaro.org>,
 Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>
Subject: [PATCH v3 06/15] net: kunit: Suppress lock warning noise at end of
 dev_addr_lists tests
Date: Wed,  3 Apr 2024 06:19:27 -0700
Message-Id: <20240403131936.787234-7-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240403131936.787234-1-linux@roeck-us.net>
References: <20240403131936.787234-1-linux@roeck-us.net>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dev_addr_lists_test generates lock warning noise at the end of tests
if lock debugging is enabled. There are two sets of warnings.

WARNING: CPU: 0 PID: 689 at kernel/locking/mutex.c:923 __mutex_unlock_slowpath.constprop.0+0x13c/0x368
DEBUG_LOCKS_WARN_ON(__owner_task(owner) != __get_current())

WARNING: kunit_try_catch/1336 still has locks held!

KUnit test cleanup is not guaranteed to run in the same thread as the test
itself. For this test, this means that rtnl_lock() and rtnl_unlock() may
be called from different threads. This triggers the warnings.
Suppress the warnings because they are irrelevant for the test and just
confusing and distracting.

The first warning can be suppressed by using START_SUPPRESSED_WARNING()
and END_SUPPRESSED_WARNING() around the call to rtnl_unlock(). To suppress
the second warning, it is necessary to set debug_locks_silent while the
rtnl lock is held.

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Cc: David Gow <davidgow@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Eric Dumazet <edumazet@google.com>
Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2:
- Rebased to v6.9-rc1
- Added Tested-by:, Acked-by:, and Reviewed-by: tags
v3:
- Rebased to v6.9-rc2

 net/core/dev_addr_lists_test.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/net/core/dev_addr_lists_test.c b/net/core/dev_addr_lists_test.c
index 4dbd0dc6aea2..b427dd1a3c93 100644
--- a/net/core/dev_addr_lists_test.c
+++ b/net/core/dev_addr_lists_test.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 
 #include <kunit/test.h>
+#include <linux/debug_locks.h>
 #include <linux/etherdevice.h>
 #include <linux/netdevice.h>
 #include <linux/rtnetlink.h>
@@ -49,6 +50,7 @@ static int dev_addr_test_init(struct kunit *test)
 		KUNIT_FAIL(test, "Can't register netdev %d", err);
 	}
 
+	debug_locks_silent = 1;
 	rtnl_lock();
 	return 0;
 }
@@ -56,8 +58,12 @@ static int dev_addr_test_init(struct kunit *test)
 static void dev_addr_test_exit(struct kunit *test)
 {
 	struct net_device *netdev = test->priv;
+	DEFINE_SUPPRESSED_WARNING(__mutex_unlock_slowpath);
 
+	START_SUPPRESSED_WARNING(__mutex_unlock_slowpath);
 	rtnl_unlock();
+	END_SUPPRESSED_WARNING(__mutex_unlock_slowpath);
+	debug_locks_silent = 0;
 	unregister_netdev(netdev);
 	free_netdev(netdev);
 }
-- 
2.39.2

