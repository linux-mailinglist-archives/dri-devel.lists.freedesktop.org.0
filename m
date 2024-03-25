Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD7988AC79
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 18:53:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D4C610EA2A;
	Mon, 25 Mar 2024 17:53:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="S96ZLZRP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B8F310EA2A
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 17:53:05 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-1e04ac200a6so32350555ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 10:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711389185; x=1711993985; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yZNhbleKNla2Ie/ZEatm6EVk1jlCAGbsmm+zF41MFkk=;
 b=S96ZLZRPaKsPGHuRkdj0Rz1Ho8eCdsAti0E7pXX9J6NNJ3yc9Q2JSQXHz5PO0HZncg
 fysHUjp1+QERMBFdvTlkhIW0E9L550LPqfV8PTpway1jlyM1WsY6x9KsXEq4tGCePRjP
 Swdvja1uyM92vCz8/F90A2y1EsY24o46T1tBfEUp/WXYpbn6Zu8F/tWZnUs5Y8jj88Km
 rNxecQHrx5C4ZnUAwr67hSXirA/VJGFhOYAW2Bgs+/EY08Zv86yDX9DYPoMCAyA0L2Ox
 uAuDF8eg6uulRE46SxpV5K3pphMnkAZoobPTPn6Caa+gpD+pa69sI9wAZWFzq6HBOMcv
 V4sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711389185; x=1711993985;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=yZNhbleKNla2Ie/ZEatm6EVk1jlCAGbsmm+zF41MFkk=;
 b=KJ3fgmMboMgu7mzh9xs4Hpj7zl1vbrwRdxU8blq059I+34/GIabawuvmf/sKrFitp2
 bFZ6zazer8n03VLvs3uY6EYAyetY5V1KX1UaqNmpTbsaB9XI6tDCRN65SEIL0RTWthB3
 259yHhmZQ+ISvDNENRyjE2G2OlWlHZ9KdaH0iLIy+FgZDZGqItvuueEjqLrCMzWSfAGj
 2L+8xbmtlPhmI6HnHZbE+9CO5AbVBtrLLD9YihEBZFVj+/gFLacHDjPT1LZ7V8KlNBry
 KKJVKVYXYvDcsYnbypD4Jd1rGpDJwNFZAr8OEtktRU7gJUo9OYNZJjxWIWWw2tN//5s7
 EOqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVufR2kErnhSIHifusG5qK4ji0x6F7Dedqj3hwwf1nJAsH0lXRn62JhTcn8KeFu/hbGyyn7X2XXoJbEGfG6M723JvPuvD8UwVnCpNgpmX9O
X-Gm-Message-State: AOJu0YxIx+0ETbywsADblUbyzbEg0zOv/pA6yc9V7dvxx05S2l40isqh
 GqVy5n6rE6i3RdQpQWNxzzvml2HYn30ZAW+zld24cu6rTdP3KLSJ
X-Google-Smtp-Source: AGHT+IEKWGuzpihfez0cIj5Jcw9QuULSWV5Y1XxkrBzCrtkepZtfQa7QDls+G+yzQdtdIaLpfh3muA==
X-Received: by 2002:a17:902:e810:b0:1e0:960b:f395 with SMTP id
 u16-20020a170902e81000b001e0960bf395mr11373029plg.25.1711389185110; 
 Mon, 25 Mar 2024 10:53:05 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 j5-20020a170902da8500b001e0c568ae8fsm1586519plx.192.2024.03.25.10.53.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Mar 2024 10:53:04 -0700 (PDT)
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
 netdev@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 Linux Kernel Functional Testing <lkft@linaro.org>,
 Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH v2 06/14] net: kunit: Suppress lock warning noise at end of
 dev_addr_lists tests
Date: Mon, 25 Mar 2024 10:52:40 -0700
Message-Id: <20240325175248.1499046-7-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240325175248.1499046-1-linux@roeck-us.net>
References: <20240325175248.1499046-1-linux@roeck-us.net>
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
confusing.

The first warning can be suppressed by using START_SUPPRESSED_WARNING()
and END_SUPPRESSED_WARNING() around the call to rtnl_unlock(). To suppress
the second warning, it is necessary to set debug_locks_silent while the
rtnl lock is held.

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Cc: David Gow <davidgow@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
- Rebased to v6.9-rc1
- Added Tested-by:, Acked-by:, and Reviewed-by: tags

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

