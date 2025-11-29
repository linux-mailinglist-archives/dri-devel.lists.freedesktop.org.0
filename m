Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B6AC9473F
	for <lists+dri-devel@lfdr.de>; Sat, 29 Nov 2025 20:53:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5399810E217;
	Sat, 29 Nov 2025 19:53:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Vy0aS96a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com
 [74.125.224.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E32410E212
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Nov 2025 19:53:08 +0000 (UTC)
Received: by mail-yx1-f41.google.com with SMTP id
 956f58d0204a3-6420dc2e5feso2254852d50.3
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Nov 2025 11:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764445987; x=1765050787; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T1J39AX21q7vFvdSQspB28V0qpAzX2/AVdKjbIUMHgo=;
 b=Vy0aS96aEvpSklYdJdHEFixXaDtGHHtXlBZQCW5m3cp1DRh80zC8nw/GJAKO55dPcc
 AOcmW0/2o+IUotHwky76a68rjRJV1/dq9NEAhGTTKRwQlKI9Ki2ZxPimlMgDj76lVtAc
 o0u4sLpX0nT7o2Wqs/jnRwBfcjGQIcdnEUcRGyUvajVY1EZpWLY04YOm8MyVjZRVMo8y
 tIl8TCGRQrb6RFAw4aCA+puloeCuXjsEJAgvGkqgl6oazOs3TxfSqnkcGbj60wtQCvha
 hxFKPkO7fTvcD8TPVQOsk67JmM50Ygb8roYSVvCsgIDRUu6tLtr8+t4+/iXTN834Qo1V
 q3WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764445987; x=1765050787;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=T1J39AX21q7vFvdSQspB28V0qpAzX2/AVdKjbIUMHgo=;
 b=GrskbvulLwCGNngDFvLC6igPG+EabovDfecexssz9vAwQPSN6VOldHhZgn9j2Ym95j
 ff7NJV/0HNzPEAY+DaJxAPk2XWzLpdivBYT2HToD4shp8L83I5Dr9frEqSifP/ukIzhW
 v8ib3mGhHoZV3KlCcSB3pNGVl7obdoqRI238TM3Sd1/Qqj41dGZUTAvxEUozakdxwjc6
 rlOq+8vWA2DfD07yAspWoKApwx8jT8KdmExzTbAg3tg/d0Gkg1JCnY/mDWOO++HUFxpQ
 OBcQiEIhRrxQGs7aqODcqhGUB92kxOVZcVwCjy+itLaO4xJkGtZUlkuDeYA2iHkJ1uuq
 AW8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1HcG9uIB20HO0vvmJbMhrr2DfDEwPWH09BUnn1dfH0bUnakVBWv3/7oODV28cgA8N+ycQovncDyA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyKmhO5ZZKaJIBjnEuKzUfEUv3bz0PZbDtbPRNkTC7W7/VeHyM1
 sLK9D+Asy0KxT5/o7aMfGrjrCy95nM2ELxbKa8XvBlIB8oriQ0QTYJpE
X-Gm-Gg: ASbGnctuj/ona2PuF2FELvs6D7WiRt4x9ghyrYEKMQYNG58XzeIwfUYh2V7OYeioLn5
 eXdR7pUUECsK6FfpJp+P/RJPdSu2qpRrB6rI5HMEjb82bgE797i7s9hhZorkeBecMBgxja9J+UW
 MxEGuH/h6k/NhGUeeCdg7TUgjELJxsGEjIcy48UemOTFtaMCYF7xKOfauQo2cO9lAZSlXJcOcDn
 JuazKsEkgQ9jysKO9y2S6WxcMPqcuMPYFShYBabvqzvhKwDkKIMxDfL9WVqz3gfybjjtNuwLJZf
 YWNwF61xRahSnGkiBRjGHHlgLU5RTEo6gGt68/lClXyrTUjbSYw1FOhiucFXWQixrTA5Z8O8T3x
 f9+E2Ms6wMYsb7HIgEBlhT5v5KYWFYZIEo8nvGAIg6xf20bTdw7Qzw1Ot6qjw9iv1PwujaFb8r/
 9iOS3M8VQ=
X-Google-Smtp-Source: AGHT+IGoe6k+HGoU1YAfc/PgjNGtkUsJD9d1pFuoEvQqZEuvaXl0b1nF4MNPaTfl/35pvJr8rQDxmg==
X-Received: by 2002:a53:cd8c:0:b0:63e:1943:ce49 with SMTP id
 956f58d0204a3-64302abb486mr16805469d50.39.1764445987167; 
 Sat, 29 Nov 2025 11:53:07 -0800 (PST)
Received: from localhost ([2601:346:0:79bd:353a:b6ab:d4ee:67b9])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-78ad1044f9esm28752057b3.56.2025.11.29.11.53.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Nov 2025 11:53:06 -0800 (PST)
From: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Randy Dunlap <rdunlap@infradead.org>, Ingo Molnar <mingo@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Petr Pavlu <petr.pavlu@suse.com>,
 Daniel Gomez <da.gomez@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Cc: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
Subject: [PATCH 2/3] kernel.h: move VERIFY_OCTAL_PERMISSIONS() to sysfs.h
Date: Sat, 29 Nov 2025 14:53:01 -0500
Message-ID: <20251129195304.204082-3-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251129195304.204082-1-yury.norov@gmail.com>
References: <20251129195304.204082-1-yury.norov@gmail.com>
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

Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
---
 include/linux/kernel.h      | 12 ------------
 include/linux/moduleparam.h |  2 +-
 include/linux/sysfs.h       | 13 +++++++++++++
 3 files changed, 14 insertions(+), 13 deletions(-)

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
index 6907aedc4f74..4e390a84a8bc 100644
--- a/include/linux/moduleparam.h
+++ b/include/linux/moduleparam.h
@@ -4,7 +4,7 @@
 /* (C) Copyright 2001, 2002 Rusty Russell IBM Corporation */
 #include <linux/init.h>
 #include <linux/stringify.h>
-#include <linux/kernel.h>
+#include <linux/sysfs.h>
 
 /*
  * The maximum module name length, including the NUL byte.
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

