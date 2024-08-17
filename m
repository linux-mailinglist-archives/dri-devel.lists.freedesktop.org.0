Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93719955507
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2024 04:57:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F416510E86F;
	Sat, 17 Aug 2024 02:57:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="asglrlLN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3F5010E86F
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Aug 2024 02:57:32 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-20203988f37so14318365ad.1
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2024 19:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723863452; x=1724468252; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Dg8K6fIsZQLFiS7Xpg/1YZlm81yjN4oHJWyrWmInMGw=;
 b=asglrlLNvBacPRIFu+lqBEpGMHf2o3I17lXXv4N41jpU+2dioLUEvRD4CuQQivP4Zt
 JtawP0L9I7Yq/A7Jzo+nQYNbPLApITmyeMzz7rxxB6j7lKkp9jNUw9W9YloceiJBwsnw
 Ka6RTV7FVMtxpLXHrRBd8d9IDnSkZd/Zb5HZ1Id8oCLfW/2ZSYKGgMYbpBGpSjAccPRU
 0J1WH+Qz2c6YeNuAX9efZnIUYjB/VIDMmsayOFa+AJ3/v1uwACmiKpw911RVbAFq17JA
 7J5UbJVYPgayPniPJKeffq34T1KaXHRlRyijm9ZAspGJtD+a7tnCIlb5h9LShxHpHwmx
 Vjhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723863452; x=1724468252;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Dg8K6fIsZQLFiS7Xpg/1YZlm81yjN4oHJWyrWmInMGw=;
 b=u1f7GiEStEh7+9MWofHl8+9/fkf2ueNanSfhmvoA3MaekAHKbPseWylNCVUqpKB3Cv
 mZHZiGZ6ykjvOVh3QbN+TZZtfjGntav1dS88F+ZjlqxW87IuJuzjiJiTdUrtaZ8YUYSA
 D2vPalCHni9Su00Z0orNoEmARRYVJwZJ2dGmZXGCXVcBBsJ7Oa9YqCP1/IodnhNPhRuk
 CGiGJvGu01kx37++qq9iba2fCnLRNbe+7unQ27cb1F0fbH1JHex1SLvdqHJXCS8r0ezn
 ebvmy7rc0PUMEytq5Spw5Ky04DtkRMWLQQyLqi23R7Ezan5LHMDbMxG9vwyOTnpETMI2
 WBrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJHgrW6bAca567+lhkdZ4RuvkkEV4Pjp5K6r+/BpVHImIRe31jHx0+ko2U4MvXhZGiaXDgIwxudj8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzhqzbw674eTsExhIcmhQZVOT3xxlQ8wml8VTFwt7+cA9zgToOD
 Ybl1tRNoaN1tZV+ca1+itaePH45RXux7h35SHMqG2e9ML/aOtEBs
X-Google-Smtp-Source: AGHT+IF3ZN+4FrJiR5tCQknEVTwkbUbAx80SeY+AiIkjp+qgoruwIjB5dCv+k+zHBrTId5++7+R3wA==
X-Received: by 2002:a17:902:cccc:b0:1fb:7b01:7980 with SMTP id
 d9443c01a7336-20203af4193mr61360745ad.0.1723863452450; 
 Fri, 16 Aug 2024 19:57:32 -0700 (PDT)
Received: from localhost.localdomain ([183.193.177.10])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-201f031c5e1sm31801785ad.94.2024.08.16.19.57.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 16 Aug 2024 19:57:31 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: akpm@linux-foundation.org
Cc: torvalds@linux-foundation.org, alx@kernel.org, justinstitt@google.com,
 ebiederm@xmission.com, alexei.starovoitov@gmail.com, rostedt@goodmis.org,
 catalin.marinas@arm.com, penguin-kernel@i-love.sakura.ne.jp,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, audit@vger.kernel.org,
 linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
 bpf@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yafang Shao <laoar.shao@gmail.com>
Subject: [PATCH v7 5/8] mm/util: Fix possible race condition in kstrdup()
Date: Sat, 17 Aug 2024 10:56:21 +0800
Message-Id: <20240817025624.13157-6-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20240817025624.13157-1-laoar.shao@gmail.com>
References: <20240817025624.13157-1-laoar.shao@gmail.com>
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

In kstrdup(), it is critical to ensure that the dest string is always
NUL-terminated. However, potential race condidtion can occur between a
writer and a reader.

Consider the following scenario involving task->comm:

    reader                    writer

  len = strlen(s) + 1;
                             strlcpy(tsk->comm, buf, sizeof(tsk->comm));
  memcpy(buf, s, len);

In this case, there is a race condition between the reader and the
writer. The reader calculate the length of the string `s` based on the
old value of task->comm. However, during the memcpy(), the string `s`
might be updated by the writer to a new value of task->comm.

If the new task->comm is larger than the old one, the `buf` might not be
NUL-terminated. This can lead to undefined behavior and potential
security vulnerabilities.

Let's fix it by explicitly adding a NUL-terminator.

Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
---
 mm/util.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/mm/util.c b/mm/util.c
index 983baf2bd675..4542d8a800d9 100644
--- a/mm/util.c
+++ b/mm/util.c
@@ -62,8 +62,14 @@ char *kstrdup(const char *s, gfp_t gfp)
 
 	len = strlen(s) + 1;
 	buf = kmalloc_track_caller(len, gfp);
-	if (buf)
+	if (buf) {
 		memcpy(buf, s, len);
+		/* During memcpy(), the string might be updated to a new value,
+		 * which could be longer than the string when strlen() is
+		 * called. Therefore, we need to add a null termimator.
+		 */
+		buf[len - 1] = '\0';
+	}
 	return buf;
 }
 EXPORT_SYMBOL(kstrdup);
-- 
2.43.5

