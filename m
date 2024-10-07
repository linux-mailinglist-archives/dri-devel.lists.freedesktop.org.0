Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE14992FE0
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 16:50:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83F9010E3C0;
	Mon,  7 Oct 2024 14:50:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JhABQuCa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 673FC10E3C0
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2024 14:50:30 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id
 41be03b00d2f7-7ea16c7759cso342723a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Oct 2024 07:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728312630; x=1728917430; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rOSaWXUvmAwO/V+X4Wf8hE6beLEX5jMwcQWbLUwGe5Q=;
 b=JhABQuCa7U6H1wEWmOVnu4xyXKdgxjN6EPqFfqUKDlt0uWeb4VMss+r+uR0d1wyzBq
 1a9t6MuWMhxwph98Z8Z+KV4z5i/+9MUrfSbVxQDx+O5nTNDvGJB86fw6RegcpmTRSKrP
 s32OOEuTB0JTD4/4caV6+HABYyTM0sKTj0PpUeEnd1g94z/o5Au1A0KzMg0rtLMOuar8
 xVpmt4/RS0OjN6/RsupG2C8Jnk0C8v6Dd6fRpZctmi/gI6wISNr/e6MUg666F3H5J4dY
 BFc91LcXIXcwHNIFOHiVBlvDvjWbDkei7isWzbeIOBN4XnHbQu/UNtiS97br9tgJiKpG
 g++g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728312630; x=1728917430;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rOSaWXUvmAwO/V+X4Wf8hE6beLEX5jMwcQWbLUwGe5Q=;
 b=Kv3jOYbhvvfKRX7JodAH09RwTgFWtuMMymx77aq48MYMDyBnzDSpVuAQynILMCaLhN
 RgyF7aAa57aQ9reh/PQx612PVhBRNsADmQqwOeZkalReAcAMC7MtuPhgvNZjFlLoyvyN
 OyJfj3QfMD/9yL4C4NcVdH3fv1SMGTl8qF7qZ57Uib2B6nwTFDUE/aXota6S/HDwJKrn
 NC4P629xxsl3xoHrg9uYcMkFJ/2froMZoxxRohEgjhnORfGZGml+8nhvl6otjbzYwWVZ
 wQ/i6lnREEJW16bCaHAWQUxdZg5FlLUkpTrb3YauFtTXyywnfVet0JeV0dt5sDuDzgLU
 +0gA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSwSDZC7oHhRUsOzIzT7+Gii/fgfsjchuXOPZhUbMn1SNHxeDMOVa+FJkIoqfeiKBGqNW1K71wml0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzI2J3WsAepumuNNqJ4ZbF41cnP5NMTRuy0TQLuC3Wun9VT7R56
 ERLAdXUYDlJxUaw6kvxmv5plX4FZ8GKz3q83bhDlPIzCYCDp2zBa
X-Google-Smtp-Source: AGHT+IHqOdUcOlcgWNq7VMpvl6yahiIrnpFyiw3ojJd2mp7haZXT77OIrOQnvCwSUS5AAO7Cn/LNdA==
X-Received: by 2002:a05:6a20:9d91:b0:1c8:a5ba:d2ba with SMTP id
 adf61e73a8af0-1d6dfa44e04mr19075009637.22.1728312629925; 
 Mon, 07 Oct 2024 07:50:29 -0700 (PDT)
Received: from localhost.localdomain ([223.104.210.43])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71df0d7cf82sm4466432b3a.200.2024.10.07.07.50.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Oct 2024 07:50:29 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: akpm@linux-foundation.org
Cc: torvalds@linux-foundation.org, keescook@chromium.org, alx@kernel.org,
 justinstitt@google.com, ebiederm@xmission.com,
 alexei.starovoitov@gmail.com, rostedt@goodmis.org, catalin.marinas@arm.com,
 penguin-kernel@i-love.sakura.ne.jp, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 audit@vger.kernel.org, linux-security-module@vger.kernel.org,
 selinux@vger.kernel.org, bpf@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yafang Shao <laoar.shao@gmail.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v9 5/7] mm/util: Fix possible race condition in kstrdup()
Date: Mon,  7 Oct 2024 22:49:09 +0800
Message-Id: <20241007144911.27693-6-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20241007144911.27693-1-laoar.shao@gmail.com>
References: <20241007144911.27693-1-laoar.shao@gmail.com>
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
NUL-terminated. However, potential race condition can occur between a
writer and a reader.

Consider the following scenario involving task->comm:

    reader                    writer

  len = strlen(s) + 1;
                             strlcpy(tsk->comm, buf, sizeof(tsk->comm));
  memcpy(buf, s, len);

In this case, there is a race condition between the reader and the
writer. The reader calculates the length of the string `s` based on the
old value of task->comm. However, during the memcpy(), the string `s`
might be updated by the writer to a new value of task->comm.

If the new task->comm is larger than the old one, the `buf` might not be
NUL-terminated. This can lead to undefined behavior and potential
security vulnerabilities.

Let's fix it by explicitly adding a NUL terminator after the memcpy. It
is worth noting that memcpy() is not atomic, so the new string can be
shorter when memcpy() already copied past the new NUL.

Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Alejandro Colomar <alx@kernel.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 mm/util.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/mm/util.c b/mm/util.c
index 4f1275023eb7..858a9a2f57e7 100644
--- a/mm/util.c
+++ b/mm/util.c
@@ -62,8 +62,15 @@ char *kstrdup(const char *s, gfp_t gfp)
 
 	len = strlen(s) + 1;
 	buf = kmalloc_track_caller(len, gfp);
-	if (buf)
+	if (buf) {
 		memcpy(buf, s, len);
+		/*
+		 * During memcpy(), the string might be updated to a new value,
+		 * which could be longer than the string when strlen() is
+		 * called. Therefore, we need to add a NUL terminator.
+		 */
+		buf[len - 1] = '\0';
+	}
 	return buf;
 }
 EXPORT_SYMBOL(kstrdup);
-- 
2.43.5

