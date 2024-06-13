Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA0D906895
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 11:26:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 839B810E9C2;
	Thu, 13 Jun 2024 09:26:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZdLDQtOU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E18410E960
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 02:31:42 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-1f6f1677b26so3885875ad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 19:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718245902; x=1718850702; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ei/8xwKAZ1rE7ZNdSGJjlup34y97vbtFvnVfEPyjJ8Q=;
 b=ZdLDQtOUJ0agHZEJOv2j8d9QZqBT/LuQu434BHlJtEM3uGmfAgREyKequWRInlDI8I
 DdYgP7ljdJ7Fr+GvLWyxl1p5WYLoYUdwJE9edRwn1yQkx108zbB1hKMkIZItvXkWtD7M
 3/j2OVp56Qb8VxZTbJLWlOAuLCGLsz5+hnPmEXxmGQnjLOTriUQW0zJjLNwg8PFIj6vA
 NnixNejEOiWc+tkgfjQ5xFwESYEBgbyLn50kyjAZDCSodI/SugpGVU6ryLHjcXNlsf+F
 kTRtES5p6HIgIDViPspD0kay7dlSQDDloRZL69q2H0iLWWNcYBMi2iZF2acVfmOhO3kM
 fvdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718245902; x=1718850702;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ei/8xwKAZ1rE7ZNdSGJjlup34y97vbtFvnVfEPyjJ8Q=;
 b=ZokcTLM2Bo1W4YKfGU8LOZw/4KeM2FZ6fkzAxCGHInjTsc6SyY/eDlG1P/VmfZC/V+
 9UsUGGnuVu6wj5H4XcLZjKk81z9kJcJcvpJu/SyemqaXLQXuESp13kGO89Wrupo8TSos
 0BQlBTiMxUDTIoMhr7jVqkzKMlZpnQXF2tnh0VPiADBoVxDbg4eJC2SdeVSaeYwol1ID
 mPFighvAzXeHF9S8EOX0QQlyrLjmKREjPsP19p9J2WdGj/4B5Ac6YUODlHEUby9bebFi
 D3cEmBSW6haa1ekBjP20GdQV29Z3EN6brs0IAcGwkUF3ydzMhWo2HC01QkY5qwvwgrsH
 iqRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWH5eilgIhpAUnGIihE7bFnGg9czYPx75xl+c3/DMEw/oGqFCCYUSCdBJXLDRWSWhBQCIR/VXiyCnvY1Ph4h3FO2O1VEeJ0gr6k2gXek89O
X-Gm-Message-State: AOJu0YwIYQ7HmZ5M7C8rRJscwaL1n2KcX/YW+2+GlPDO5jIwKQjF4iM5
 9JCwbI2ycZBWbfYD0b5G47zph3XjlqWzKRFS+zAJoW2SVorsv/4t
X-Google-Smtp-Source: AGHT+IFIaVarDVsj1gEbMfPNFvaRxIMZj6V1FUrejF3TL24xnCXwEw+tDOS2CgmUK4jtVsLBUQ40Ug==
X-Received: by 2002:a17:902:db11:b0:1f7:1d71:25aa with SMTP id
 d9443c01a7336-1f84dfbb4cfmr20547645ad.6.1718245901789; 
 Wed, 12 Jun 2024 19:31:41 -0700 (PDT)
Received: from localhost.localdomain ([39.144.105.92])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f855f4d159sm1755695ad.289.2024.06.12.19.31.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 Jun 2024 19:31:41 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: torvalds@linux-foundation.org
Cc: ebiederm@xmission.com, alexei.starovoitov@gmail.com, rostedt@goodmis.org,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, audit@vger.kernel.org,
 linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
 bpf@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yafang Shao <laoar.shao@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 05/10] mm/util: Fix possible race condition in kstrdup()
Date: Thu, 13 Jun 2024 10:30:39 +0800
Message-Id: <20240613023044.45873-6-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20240613023044.45873-1-laoar.shao@gmail.com>
References: <20240613023044.45873-1-laoar.shao@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 13 Jun 2024 09:26:31 +0000
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
 mm/util.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/mm/util.c b/mm/util.c
index c9e519e6811f..3b383f790208 100644
--- a/mm/util.c
+++ b/mm/util.c
@@ -60,8 +60,10 @@ char *kstrdup(const char *s, gfp_t gfp)
 
 	len = strlen(s) + 1;
 	buf = kmalloc_track_caller(len, gfp);
-	if (buf)
+	if (buf) {
 		memcpy(buf, s, len);
+		buf[len - 1] = '\0';
+	}
 	return buf;
 }
 EXPORT_SYMBOL(kstrdup);
-- 
2.39.1

