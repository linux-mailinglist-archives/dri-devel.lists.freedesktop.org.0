Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D057F897038
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 15:20:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68AE2112AFA;
	Wed,  3 Apr 2024 13:20:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="O4bGFyH5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4813112AF2
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 13:20:04 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-1e0d82c529fso54378235ad.2
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Apr 2024 06:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712150404; x=1712755204; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cRPOdz6AnxublM7n3KmjYybYhLan42asyWOmMDzsw+o=;
 b=O4bGFyH5CBJH4WR3iLhhRIePCAtLZR6Q4it7StwfLGsZjHstPHuUAwfldN1uKVoehe
 gLOyzJyzwrLPBgTuEyDN/8A5cxZK15Qea62XAOUbYdMUtPvhps67bhanEXcYk7LUlUGO
 GaZPnqjhXCCxc1fi3hv/7Y8GJFJmHxrDFUlVpRENe1Rkn0lJPVVe5kniFaYfJ5qeP2A1
 OGET0MhVLk6AAzTgsFIb9WyKpDjpZNiEK6jE6js03zYh5uRXThn/yZIyLmqCsvYsxQ3t
 TwKCmjHSuWfAbmF4Zec4Wc7dDO3fjV+fDg+3i6fqV+njPToPXZEzR5sm3nBT8i20H5Qg
 LcJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712150404; x=1712755204;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=cRPOdz6AnxublM7n3KmjYybYhLan42asyWOmMDzsw+o=;
 b=oHWhi4oy06kWFkS9NOCeXxX7882diH8Ivwu7PGyFzOloaBo1AOLvDOTXxJOcPbApFK
 o2OCA+8aGXRmBYKOtw140K9T+bgyz+MecStF1AGVRKKkVx2gW8Vd7xiMc5zd38qXMoXo
 48yyIh2d0vFN6rIszn7LbIEUAHJULCadbKZrmfc0XqrPSj/vSSnoBsg8V/IQjjpb2Cwu
 aV5fihZALTjTZw0ROLb1hMTktBh+aOqFBkF6t0wvrlAqx9cpe0oSlMFhK7p1oDq42gwl
 KrP1eRhaMcezcumFSDGHi+y7+bUO48/vwZTDE5D+L/qun/T6Mdx4VXp+Ul5H+oQ64KBX
 Gk+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSXeXFaw6FSzMH2ige71/shGDzbrU+nhNe+wWcQJ6MsbA/laEdex80ANSUb6yIE5iatAyIz6ok0SnPHQRy3d72Ioxo+de7NScjKPhRKA00
X-Gm-Message-State: AOJu0YypBXkW+DAmIK7HgtzY6wdEC4QbUjeAlls1A9G91MJsffugtKSt
 JR4s6EgvhRcVFjowgAVrDAf5NbCMDsP9Oxoe4XFHk8BOEs/xA25T
X-Google-Smtp-Source: AGHT+IGx8oRVikcJmoZrmV6I1PpggSRavr/G5SNCkYR+IkJlaqrk2wHgg+ZazQ8Nymmw82Dh4v/u5A==
X-Received: by 2002:a17:903:32cc:b0:1e2:2d0c:fef0 with SMTP id
 i12-20020a17090332cc00b001e22d0cfef0mr17310539plr.48.1712150404272; 
 Wed, 03 Apr 2024 06:20:04 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a170903230500b001dd4d0082c8sm3855527plh.216.2024.04.03.06.20.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 06:20:03 -0700 (PDT)
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
 Simon Horman <horms@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: [PATCH v3 13/15] sh: Move defines needed for suppressing warning
 backtraces
Date: Wed,  3 Apr 2024 06:19:34 -0700
Message-Id: <20240403131936.787234-14-linux@roeck-us.net>
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

Declaring the defines needed for suppressing warning inside
'#ifdef CONFIG_DEBUG_BUGVERBOSE' results in a kerneldoc warning.

.../bug.h:29: warning: expecting prototype for _EMIT_BUG_ENTRY().
	Prototype was for HAVE_BUG_FUNCTION() instead

Move the defines above the kerneldoc entry for _EMIT_BUG_ENTRY
to make kerneldoc happy.

Reported-by: Simon Horman <horms@kernel.org>
Cc: Simon Horman <horms@kernel.org>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Rich Felker <dalias@libc.org>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v3: Added patch. Possibly squash into previous patch.

 arch/sh/include/asm/bug.h | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/arch/sh/include/asm/bug.h b/arch/sh/include/asm/bug.h
index 470ce6567d20..bf4947d51d69 100644
--- a/arch/sh/include/asm/bug.h
+++ b/arch/sh/include/asm/bug.h
@@ -11,6 +11,15 @@
 #define HAVE_ARCH_BUG
 #define HAVE_ARCH_WARN_ON
 
+#ifdef CONFIG_DEBUG_BUGVERBOSE
+#ifdef CONFIG_KUNIT_SUPPRESS_BACKTRACE
+# define HAVE_BUG_FUNCTION
+# define __BUG_FUNC_PTR	"\t.long %O2\n"
+#else
+# define __BUG_FUNC_PTR
+#endif /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
+#endif /* CONFIG_DEBUG_BUGVERBOSE */
+
 /**
  * _EMIT_BUG_ENTRY
  * %1 - __FILE__
@@ -25,13 +34,6 @@
  */
 #ifdef CONFIG_DEBUG_BUGVERBOSE
 
-#ifdef CONFIG_KUNIT_SUPPRESS_BACKTRACE
-# define HAVE_BUG_FUNCTION
-# define __BUG_FUNC_PTR	"\t.long %O2\n"
-#else
-# define __BUG_FUNC_PTR
-#endif /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
-
 #define _EMIT_BUG_ENTRY				\
 	"\t.pushsection __bug_table,\"aw\"\n"	\
 	"2:\t.long 1b, %O1\n"			\
-- 
2.39.2

