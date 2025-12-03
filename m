Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 405F2C9FEB2
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 17:23:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1ABA10E878;
	Wed,  3 Dec 2025 16:23:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nRjktfOp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com
 [74.125.224.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C43E10E84A
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Dec 2025 16:23:35 +0000 (UTC)
Received: by mail-yx1-f41.google.com with SMTP id
 956f58d0204a3-640e065991dso6151950d50.3
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Dec 2025 08:23:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764779014; x=1765383814; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BD9kPlC9NqK4/C2x8UYFTQBB7a0NtQWd16jS1I2SUnE=;
 b=nRjktfOpFINrIAO6o0U4RsYRxdswlrrh3UT3s/ra1EQYAQ3UbgsIUwB56uXxLzeanK
 FmrBzuRmKurD/+EJhihqF/pVojFq/VZrzj4lQMrggUclNq1ylnpfvpv4O8sx9UrvGehW
 Eh8ERJaA2VDV4ITkp9FtP0bUJHRNG2h8kPziD/3GQ+zYEJU8jHzH8W64Me6ytj3sl02E
 DlTqB0nVkrUseM8AWpb7FFGjxDxeT2nshBz9vRwqJih4clcwu8XtBjwuV6X56GtLf/Bf
 ZTgLaFy4dCMOM1hOtsb/OLPLPEgcgOvGtUhn1kDvjMHOUuyGmNF4JYIl6CRgjEHnIW7d
 hOgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764779014; x=1765383814;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=BD9kPlC9NqK4/C2x8UYFTQBB7a0NtQWd16jS1I2SUnE=;
 b=D+RQp9rYAgvpkSzAlGOp4dQV5EeNz/x/m06QlEM/qp/6XpdmVxQKj6lNRJve1W4D36
 miWuR6ORNraEAX8FZ/OTNM0Ozupstk3dKqPo9Ebq+zaHVs1Cm3We+lxW+n2EGvENQFH+
 coGbOlWsKPz4Y9RYYHcBZWaTIgKiv2pGsrbq8+FVVA+YT2dp693UGRHzFY6lzrK1ad/h
 n4sgVrdZSZhv3LAeBNoN/TmQvD/uXvO+zPjoh0h4IQg8ZxKb/5zQaC9bWHCui6YsCzd3
 GJ7/O5Hb+pmIVJGiQIT4cv0QkvBVAhkC5v7rweA7UDg9BzMXNiTB06PpbbRTTaGG8rkv
 GbLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOeKAcAot8yY9IXxoNbapf/d9WUhTowmgA93OStlX4SyKOhOGXBwgWJgu+cEIpIlZ/ytO3VdTOdJo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzW9BXZit7Ghvi9ajwApGghgWyv4cA/+Odjs5OqTe6lhJVEOuYz
 a9tcU2fsqscD3SLMQliuVgYWdr5CsqkH2olfZuhFg1HkV6NwLISMd5rz
X-Gm-Gg: ASbGncshr/Z664+h3zRy35lM88BVzL9Tvs9Qck5UdOcDWZf6U0gFppqBUVN2Hf8/CWA
 HhKucdGYtrydxtPVUYf901+q9uHRVk6+NPNeBXXuKnS4kT6e5bobBuSl8ybF1X6QY4dOAEVELju
 tsNQsTulgpEI8pWH+pLVHkMEeaeqfP0qPsmuDnOwUE7EKyJ9S1JolXcEJTIwDw7NYtfc+f1W4uB
 0KMQUskFiHkypJwFtCVd7ubDvd67MBaTeObrgn1kkwvePTyHdp6IL4UWfbdO7qk+/9E5WZQ4jbv
 kHD1U8670WzyMrNfIdCP4anZQ6Mj6abIEzuBjFAp8tznIxfTF18bhZBWzsRobIeHXkH5cBORVRI
 HUhZPP0HmV7fVmrat+b8F+u643ZjjYSXNO/rEWzEvWGxn7KqOxwEQ5PUvtVZMtGWqj1dGCmV6iw
 J0klNNKBQqIMueSB14QA==
X-Google-Smtp-Source: AGHT+IED9MOFMxvYSeb8SzBPTCp8AtkRM45d5US6WkMtf3ZGLjHaRGAjGtBn2tkqfezw7s+564T5/Q==
X-Received: by 2002:a05:690e:134a:b0:640:caa5:57bf with SMTP id
 956f58d0204a3-64436fab865mr2201474d50.24.1764779014070; 
 Wed, 03 Dec 2025 08:23:34 -0800 (PST)
Received: from localhost ([2601:346:0:79bd:3422:8bf9:97bc:b085])
 by smtp.gmail.com with ESMTPSA id
 956f58d0204a3-6433c089431sm7456743d50.10.2025.12.03.08.23.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Dec 2025 08:23:33 -0800 (PST)
From: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Christophe Leroy <chleroy@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, Ingo Molnar <mingo@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 David Laight <david.laight@runbox.com>, Petr Pavlu <petr.pavlu@suse.com>,
 Andi Shyti <andi.shyti@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Daniel Gomez <da.gomez@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Cc: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
Subject: [PATCH v2 3/4] kernel.h: move VERIFY_OCTAL_PERMISSIONS() to sysfs.h
Date: Wed,  3 Dec 2025 11:23:24 -0500
Message-ID: <20251203162329.280182-4-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251203162329.280182-1-yury.norov@gmail.com>
References: <20251203162329.280182-1-yury.norov@gmail.com>
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

The macro is related to sysfs, but is defined in kernel.h. Move it to
the proper header, and unload the generic kernel.h.

Now that the macro is removed from kernel.h, linux/moduleparam.h is
decoupled, and kernel.h inclusion can be removed.

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
---
 Documentation/filesystems/sysfs.rst |  2 +-
 include/linux/kernel.h              | 12 ------------
 include/linux/moduleparam.h         |  2 +-
 include/linux/sysfs.h               | 13 +++++++++++++
 4 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/Documentation/filesystems/sysfs.rst b/Documentation/filesystems/sysfs.rst
index 2703c04af7d0..ffcef4d6bc8d 100644
--- a/Documentation/filesystems/sysfs.rst
+++ b/Documentation/filesystems/sysfs.rst
@@ -120,7 +120,7 @@ is equivalent to doing::
 	    .store = store_foo,
     };
 
-Note as stated in include/linux/kernel.h "OTHER_WRITABLE?  Generally
+Note as stated in include/linux/sysfs.h "OTHER_WRITABLE?  Generally
 considered a bad idea." so trying to set a sysfs file writable for
 everyone will fail reverting to RO mode for "Others".
 
diff --git a/include/linux/kernel.h b/include/linux/kernel.h
index 61d63c57bc2d..5b879bfea948 100644
--- a/include/linux/kernel.h
+++ b/include/linux/kernel.h
@@ -389,16 +389,4 @@ static inline void ftrace_dump(enum ftrace_dump_mode oops_dump_mode) { }
 # define REBUILD_DUE_TO_DYNAMIC_FTRACE
 #endif
 
-/* Permissions on a sysfs file: you didn't miss the 0 prefix did you? */
-#define VERIFY_OCTAL_PERMISSIONS(perms)						\
-	(BUILD_BUG_ON_ZERO((perms) < 0) +					\
-	 BUILD_BUG_ON_ZERO((perms) > 0777) +					\
-	 /* USER_READABLE >= GROUP_READABLE >= OTHER_READABLE */		\
-	 BUILD_BUG_ON_ZERO((((perms) >> 6) & 4) < (((perms) >> 3) & 4)) +	\
-	 BUILD_BUG_ON_ZERO((((perms) >> 3) & 4) < ((perms) & 4)) +		\
-	 /* USER_WRITABLE >= GROUP_WRITABLE */					\
-	 BUILD_BUG_ON_ZERO((((perms) >> 6) & 2) < (((perms) >> 3) & 2)) +	\
-	 /* OTHER_WRITABLE?  Generally considered a bad idea. */		\
-	 BUILD_BUG_ON_ZERO((perms) & 2) +					\
-	 (perms))
 #endif
diff --git a/include/linux/moduleparam.h b/include/linux/moduleparam.h
index ca7c8107c7c8..dd2d990b2611 100644
--- a/include/linux/moduleparam.h
+++ b/include/linux/moduleparam.h
@@ -8,7 +8,7 @@
 #include <linux/compiler.h>
 #include <linux/init.h>
 #include <linux/stringify.h>
-#include <linux/kernel.h>
+#include <linux/sysfs.h>
 #include <linux/types.h>
 
 /*
diff --git a/include/linux/sysfs.h b/include/linux/sysfs.h
index 9a25a2911652..15ee3ef33991 100644
--- a/include/linux/sysfs.h
+++ b/include/linux/sysfs.h
@@ -798,4 +798,17 @@ static inline void sysfs_put(struct kernfs_node *kn)
 	kernfs_put(kn);
 }
 
+/* Permissions on a sysfs file: you didn't miss the 0 prefix did you? */
+#define VERIFY_OCTAL_PERMISSIONS(perms)						\
+	(BUILD_BUG_ON_ZERO((perms) < 0) +					\
+	 BUILD_BUG_ON_ZERO((perms) > 0777) +					\
+	 /* USER_READABLE >= GROUP_READABLE >= OTHER_READABLE */		\
+	 BUILD_BUG_ON_ZERO((((perms) >> 6) & 4) < (((perms) >> 3) & 4)) +	\
+	 BUILD_BUG_ON_ZERO((((perms) >> 3) & 4) < ((perms) & 4)) +		\
+	 /* USER_WRITABLE >= GROUP_WRITABLE */					\
+	 BUILD_BUG_ON_ZERO((((perms) >> 6) & 2) < (((perms) >> 3) & 2)) +	\
+	 /* OTHER_WRITABLE?  Generally considered a bad idea. */		\
+	 BUILD_BUG_ON_ZERO((perms) & 2) +					\
+	 (perms))
+
 #endif /* _SYSFS_H_ */
-- 
2.43.0

