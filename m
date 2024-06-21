Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D794391188E
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 04:31:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2838410E308;
	Fri, 21 Jun 2024 02:31:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="T5RAIRyf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
 [209.85.167.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD99710E308
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 02:31:30 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id
 5614622812f47-3c9cc681e4fso781498b6e.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 19:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718937090; x=1719541890; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1K+hSkFBa/z9wm4YENh0APfdLPb/9OfvoDMj7Q9JegI=;
 b=T5RAIRyfkx8n0nORGieyo/9nndgesadXsc/p1sWRrFk4HBlwEMDUskjxL1sAPYruLf
 GGaI+slsCoMcD08DMfRDXSGBbYJh5Kjx5CEzpxfec+jt72hZgsxE83xZSk/C1rZltthg
 MkZ9SpPVaKO37XcNPanKUM5NPgjVQ4I6SGzefqzh8kffEFQyr8Fk33nxtwPe72stLuxM
 JdSZib5VNUpOqS7atMFo2jlgvBQX8uT32hIN6bcG8uYmxZsQ0K73LAu/nFua8vombFY8
 lTecycIBM3MKeqf3H2toR40KaoOdidWqxEIFei7vgXL+3yos18Fm39IjD4Wdj9tT+A0g
 O4rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718937090; x=1719541890;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1K+hSkFBa/z9wm4YENh0APfdLPb/9OfvoDMj7Q9JegI=;
 b=PEa9/0Zo65E1/FLRYW6aw0Pkni2E48FJk8GcadDMNrvPDHeKkJ849CTe+NEhvVvvno
 GqPTPRwHtcnC/7TZ0UprIQ9b6LA+rLoQwxZnre2/3pff3CNs5FfbgZtIgH71GT26nLoL
 l+JbyQhB0E/LI+CrvCtbnp/eiugRnSPU8zGOmu/jOuY4uL8a17AwzEtWtjFKRNkBfJC/
 AQcVI4m2R1q27NsKN4E2l+87GJwkfVv23lD4Z+iu6/y+eg0KWQX7wa4feEAIFmFH160f
 siFOElVxogsl45w7ADZbFvqwEBkA/kENDiQXSA0ZTbRnod+RaxXWrh8LkcVmwitUDgFU
 GaHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUevManvm+qvoc25+UDRCxUyun5tJjauy5jatpnk4qZ3Q1jOZ5znQeyIgfVTaK4a6cCDQHPsPBkawvhrrvGR9jC6QmH8N2XzSJ3sdNRFwum
X-Gm-Message-State: AOJu0YxciyDLfYjXzVlQTi4Yptc+2Biv4G6rvJiG+tGYABpY1HMSXcac
 4BNj4xlbgCjSh+h5InI1ytvCMbfSx3+We0vlhh1O5I7Q4D4wVF6z
X-Google-Smtp-Source: AGHT+IGPBhm+odN2LJAX3QWj+Jlu2WkC5FUNop9iFT0Xeg6XFGC2MN7wYjSEAKCdXzo9nJ50WQHXKg==
X-Received: by 2002:a05:6808:1789:b0:3d2:19da:9573 with SMTP id
 5614622812f47-3d51b97ee20mr8962729b6e.15.1718937089513; 
 Thu, 20 Jun 2024 19:31:29 -0700 (PDT)
Received: from localhost.localdomain ([39.144.105.24])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-706511944d2sm332488b3a.70.2024.06.20.19.31.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 20 Jun 2024 19:31:29 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: torvalds@linux-foundation.org
Cc: ebiederm@xmission.com, alexei.starovoitov@gmail.com, rostedt@goodmis.org,
 catalin.marinas@arm.com, akpm@linux-foundation.org,
 penguin-kernel@i-love.sakura.ne.jp, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 audit@vger.kernel.org, linux-security-module@vger.kernel.org,
 selinux@vger.kernel.org, bpf@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yafang Shao <laoar.shao@gmail.com>
Subject: [PATCH v3 05/11] mm/util: Fix possible race condition in kstrdup()
Date: Fri, 21 Jun 2024 10:29:53 +0800
Message-Id: <20240621022959.9124-6-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20240621022959.9124-1-laoar.shao@gmail.com>
References: <20240621022959.9124-1-laoar.shao@gmail.com>
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
index c9e519e6811f..41c7875572ed 100644
--- a/mm/util.c
+++ b/mm/util.c
@@ -60,8 +60,14 @@ char *kstrdup(const char *s, gfp_t gfp)
 
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
2.39.1

