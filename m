Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 264BB7E8371
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 21:08:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E70CE10E23F;
	Fri, 10 Nov 2023 20:08:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9F3510E23F
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 20:08:43 +0000 (UTC)
Received: by mail-yb1-xb49.google.com with SMTP id
 3f1490d57ef6-dae71322ed4so3022353276.1
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 12:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1699646923; x=1700251723;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=51fJBfx3imxlXxpJCLaVZXz5cvn77oR86IbzpiZXKNs=;
 b=MrgCfCEwUhXFw46T1rAf2koIl/emeQp0pcpysiNRq218G5PJO67SqRnSVlIUF4mr64
 UgR3HagQn1ak0IEsreOntrSASGP4g0TLNOPvC9NrinQ2+ysrQz/7eK5807hKgzTpTH80
 bwhVb2K+exXSpH7lMAyT3fk4DgbEw0zUj2BGDUzMXN3qOyn2+f872gl1Gujzn1Z+8+ik
 Alrjhl/eXvMlz+bqQkJ1O6tfkWfyC96i3q1WzJqX+XoVOf+vMkrz0kt/snk22byAd605
 oMdA3UG8+fZBAKVB/Abbbz2LW5L7sLeGw2uZQjlvGd1hZsq66ZRoR70s/bS+sEN0a+fJ
 4ZgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699646923; x=1700251723;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=51fJBfx3imxlXxpJCLaVZXz5cvn77oR86IbzpiZXKNs=;
 b=VWyhkRVP6Ijptg8pE4nz0wMrwRAYXlDrC7q3gkYqeRi2NT360N4e+RTLXOjKVpL467
 Akzzjy2gUx4lEQQh7pGFscMc0C03iArdy00w8KOzHM5nvV+mtdX63Of2qO1FFbUO9H83
 bs9OaQy1S6eMLrmYN3hCDmYy+ThoJYTSlB9ywgQaZ3NI7kisaULRqMTUELMXmC8/QrAz
 CKPKWL+WpqpXiWrhdOTWWwKgkScF++sX4CUN96a2YqA24mtUFtDoR12q2tQSoTta0f9E
 /vZUIt0DY3JYM4AyEq8YIwaqsrZnTlM6Y16b4wzC5k/adYOK74ImNA+T/v3I6KQ+zSxm
 xe7A==
X-Gm-Message-State: AOJu0YwWyQv5q0e8j+Kxrh7K8dIiT25n9ZuPH6DzUNbbTMSWuJ3AvcYj
 CUg4g5PzLtgKfPspwd+yKkFcQCqo2qzrCg==
X-Google-Smtp-Source: AGHT+IGDK07iaPg+g9N2kLo9bN2a5OkVBolpHXkG2QTgPQJFeKS5zwURLPQj7RWzYTJuEXCxK3CW75e1iydlNQ==
X-Received: from slicestar.c.googlers.com
 ([fda3:e722:ac3:cc00:4f:4b78:c0a8:20a1])
 (user=davidgow job=sendgmr) by 2002:a05:6902:182:b0:d9a:ec95:9687 with SMTP
 id t2-20020a056902018200b00d9aec959687mr3348ybh.11.1699646922890; Fri, 10 Nov
 2023 12:08:42 -0800 (PST)
Date: Sat, 11 Nov 2023 04:08:27 +0800
In-Reply-To: <20231110200830.1832556-1-davidgow@google.com>
Mime-Version: 1.0
References: <20231110200830.1832556-1-davidgow@google.com>
X-Mailer: git-send-email 2.42.0.869.gea05f2083d-goog
Message-ID: <20231110200830.1832556-2-davidgow@google.com>
Subject: [PATCH 2/3] drm/tests: Use KUNIT_DEFINE_ACTION_WRAPPER()
From: David Gow <davidgow@google.com>
To: Nathan Chancellor <nathan@kernel.org>, Kees Cook <keescook@chromium.org>, 
 Brendan Higgins <brendan.higgins@linux.dev>, Rae Moar <rmoar@google.com>,
 dlatypov@google.com, 
 Maxime Ripard <mripard@kernel.org>, Arthur Grillo <arthurgrillo@riseup.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-kselftest@vger.kernel.org, David Gow <davidgow@google.com>,
 Emma Anholt <emma@anholt.net>, Benjamin Berg <benjamin.berg@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, linux-hardening@vger.kernel.org,
 Sami Tolvanen <samitolvanen@google.com>, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to pass functions to kunit_add_action(), they need to be of the
kunit_action_t type. While casting the function pointer can work, it
will break control-flow integrity.

drm_kunit_helpers already defines wrappers, but we now have a macro
which does this automatically. Using this greatly reduces the
boilerplate needed.

Signed-off-by: David Gow <davidgow@google.com>
---

This patch should be a no-op, just moving to use a standard macro to
implement these wrappers rather than hand-coding them.

Let me know if you'd prefer to take these in separately via the drm
trees, or if you're okay with having this whole series go via
kselftest/kunit.

Cheers,
-- David

---
 drivers/gpu/drm/tests/drm_kunit_helpers.c | 30 +++++++----------------
 1 file changed, 9 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.c b/drivers/gpu/drm/tests/drm_kunit_helpers.c
index bccb33b900f3..c251e6b34de0 100644
--- a/drivers/gpu/drm/tests/drm_kunit_helpers.c
+++ b/drivers/gpu/drm/tests/drm_kunit_helpers.c
@@ -27,27 +27,15 @@ static struct platform_driver fake_platform_driver = {
 	},
 };
 
-static void kunit_action_platform_driver_unregister(void *ptr)
-{
-	struct platform_driver *drv = ptr;
-
-	platform_driver_unregister(drv);
-
-}
-
-static void kunit_action_platform_device_put(void *ptr)
-{
-	struct platform_device *pdev = ptr;
-
-	platform_device_put(pdev);
-}
-
-static void kunit_action_platform_device_del(void *ptr)
-{
-	struct platform_device *pdev = ptr;
-
-	platform_device_del(pdev);
-}
+KUNIT_DEFINE_ACTION_WRAPPER(kunit_action_platform_driver_unregister,
+			    platform_driver_unregister,
+			    struct platform_driver *);
+KUNIT_DEFINE_ACTION_WRAPPER(kunit_action_platform_device_put,
+			    platform_device_put,
+			    struct platform_device *);
+KUNIT_DEFINE_ACTION_WRAPPER(kunit_action_platform_device_del,
+			    platform_device_del,
+			    struct platform_device *);
 
 /**
  * drm_kunit_helper_alloc_device - Allocate a mock device for a KUnit test
-- 
2.42.0.869.gea05f2083d-goog

