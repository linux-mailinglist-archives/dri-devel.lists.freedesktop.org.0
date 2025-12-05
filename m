Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F4FCA8B13
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 18:52:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22A0110EB7C;
	Fri,  5 Dec 2025 17:52:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HAbeXtCM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com
 [209.85.128.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7A3E10EB7A
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Dec 2025 17:52:42 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-7815092cd0bso22012327b3.2
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Dec 2025 09:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764957162; x=1765561962; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qMcm6nWRLFBVfXJXBUXf6pE+rQOQZFvzs8Y8xJm6ysU=;
 b=HAbeXtCMt6npwCFBVERJtJhZ9jDIvfjSeTXHSEQ5Hc9Ycj2qmKrcgsnUdt2diCdtFE
 G/Q58HxCeW+EiwZdKbICi8iF5QM0RT1KBDa8Im/n9J/+UFL5+cKN953sz+9WZxRdEFPu
 FDn2cmSww+xqlhYkVF440Zja4HEedm/o7N4MrfxmDlsWrcusxLsolyFrPCEF8fuOJ7Wv
 K32hLYLX+3sjD1YOK7eQS6/+acJaDsVQgX49YvO9McnjouT9oQYcgzGGGoTOyaQxBDek
 a6GtyKC0ItTkcJGBprEtJOV1TniFIRENFUpIREu6/XhrdEhm/1xhz0kRKj3rbd8lg1f8
 7aVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764957162; x=1765561962;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=qMcm6nWRLFBVfXJXBUXf6pE+rQOQZFvzs8Y8xJm6ysU=;
 b=gHT6exkbOz2nw6B1Z1VjEzBAfkkbT+wrtc7RzVOhOvaIZKj15c5erpfhPr3Df1DI4x
 /j3Q54JEN8RcrcKKUPX8qEHXFaTFzymvJPONDy/WLNDOkfRIpw37Bkw+VtOVzQB32cd3
 OshLxvi0UktmiA4UwcJaTSKmlThawcfC+oLyA5DZLi9wb73rtk+Jc+FHt9Ey93HMgdUL
 NTW01pvzUzowkJGBj+JYNqFJCG2v4XBgovIGcHSEd348UAhjMDP2Pg60ga2zcsVVaqJc
 mglAabhxByoLmwj0e8+QJSsJP97+LK+CFr3UFBGqBzav0Pm9yyvNFHXnnXJjnModW3oW
 Yw1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpiITX+rCCeeOfwMrY838+fH9ZSZmK/jQdw5jzmfjfXCAYSkT2ZG8r7o5kzYYhrmy1SqPtMK96GAE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwTEppk94/LQI9quYeuJOQ5+kyVLcjaCitG8unGrecP27VBd7sY
 8CRa3aElPyjaGvuIZpPFwygVCexrsEUVjzq2eE8BqGLti1ZFFQ/JrHtI
X-Gm-Gg: ASbGncsZ422Ab5440r6a/ef1qJLhOpy6X+VQJsiowF/TJA4TE1JMAEukYtVdBhtcs6i
 shP0/+gTCBrFwroDoXNJcfLIqD+bUZAnraFjOlEQZ+sWDTXI6ZiC1ElUdYBmccczMZJFi4Moq+s
 QPqWpTaBFQLaNFeqkQ1YnJZUcHW+S+Np0Ucm33daQtZStaNn+lv06x22XRjPh8KivOw7/MxiqNa
 Kl8Y84ttkKAa52DGOnmhDnh000rsQGYKr0viQWhXUBFEWFB3AHMyANst28dYgLcCWHyhhddCYAB
 slUN3zdROVxdeQn5nU2yPIRQv14G6Bs8WPbjNbchd1759+reELGxFAg9ul62lhdhI5qjdxbZeoG
 1G6oKJ/yO4s8umg56KnqxRgRPqa7IktbqgQ12JopLjfkHZ48nU20nU9scERRtc7KFs5yYCeLzTd
 B003O7Qw==
X-Google-Smtp-Source: AGHT+IFMa7PLE5Wadu9vbkWwOz5YfxbRiG9Bng/2nx/P0WjNdaVzVzG0hYz8xn0T4porbVJXTUfmtg==
X-Received: by 2002:a05:690c:2506:b0:784:9076:a0f5 with SMTP id
 00721157ae682-78c188bffcamr128846517b3.44.1764957161553; 
 Fri, 05 Dec 2025 09:52:41 -0800 (PST)
Received: from localhost ([2601:346:0:79bd:be2a:7e4d:3bf:3fbc])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-78c1b78e63bsm18841887b3.42.2025.12.05.09.52.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Dec 2025 09:52:41 -0800 (PST)
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
Subject: [PATCH v3 3/4] kernel.h: move VERIFY_OCTAL_PERMISSIONS() to sysfs.h
Date: Fri,  5 Dec 2025 12:52:34 -0500
Message-ID: <20251205175237.242022-4-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251205175237.242022-1-yury.norov@gmail.com>
References: <20251205175237.242022-1-yury.norov@gmail.com>
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
Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>
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

